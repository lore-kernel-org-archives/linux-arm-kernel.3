Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B24CF31A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=; b=wkjnAwMIYiwxPgjVioI5OKxQEm
	foPCiJjJmPOpyEpi+1+KH9Ebr9DVYmcS+3AvoUBihlAJP2UcCrRqp5DdYZuYh+lxH4/l34hsOUiic
	Cjctna//os+EFPCK/BE5NyNPbjBLvRLV5DLiUf2UfgHWmEW5Q9wK9whSJakir0nE6T6a0kwQYTLBx
	5yB1ABlXiC2ivBO2oIFbvQONcdad3JHIgIE+SMQV5YeT07goSBvPM3snGQUW2rVrKyWI2ptNu/nsw
	KfREHXb1DKotENP7LUGFs3apDgoGaVyQrVgOimhs3p+OahQjR3Vo1CLzMAYV9HDBPoRuqN72Dbloe
	wgsKdifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgBA-0000000316E-0yst;
	Wed, 19 Nov 2025 11:16:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgB8-00000003151-0kL9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:16:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so46405145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551008; x=1764155808; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=;
        b=u+kpZzIuSyl3WaTl6x5FgxNPT36cefiq8ZQwl7wslgm7r1el7zf641ATlT4UX8rp+s
         Re2apG5HWwTGRkH/eCtR7PeDA7tNt323AHuzO19LmPqDszC1eokW7W6/9243HpkwqaOh
         gKPuLtdZBxy2n7i0hj8gf6KeTkiabb+CH60Udz8lyse2Hop9xuV8X2vFiMF1UYMC7BGj
         zTUaaxHa6rQqruHwfQl7W2cjHA5/oxaD6XTTl7m2SJjKw1tYHJh7xsCaVuw+BXraozLR
         iO5VOFM6aDT8CVRLJfPzJ8qpDqCcct/n3sjCJ/vdzF5MUDTcNm738nhLR7tKNbmrE464
         i46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551008; x=1764155808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=;
        b=Nkr7PKHNv39pFHoF71rXm2s6rZpbdCLFnohZzSR24a4nBEHQab79AA3ji8hVmPXNpe
         mthzHBldmHwc5q6j8IcHClaebAv0UNvXK0apFcdEkJPJ3WTzI7wWveIfVLLcKUKilNKw
         /vVv16DukSY02Nuui2Bb4EF5QxSYGjtvPe2lVePhd/uIB7q9zp8cCVdvTfhMBgAiMuYr
         IIHU9B1rH7rcVfX2iLQGHAcd2zNazUfrSF0KhH8vZc9pB4dP6NbixyD+SoCTPPaNdnFd
         qz+wgj5VPLwpCjfkiNfckxxkf8wCgR3hhvPgJRapUsYBFwvRpsL+HjxpTvmWSC3BGaXt
         9XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw5OlhsMn3BdkVgS2y2WvBzJoaybvNWWjJ30bshgC+Pexu5wGVPuYkIRhMMTI7W7Q61N98zJi4p7T60S56oP8z@lists.infradead.org
X-Gm-Message-State: AOJu0YzaIeUsRCmS4v03us2lo5NID1d9WieItUDnPgB8Hy51pUmBLQgr
	FaN49/xj944RsU5pI4AEd1irZB952WFSIjB3H5Vla8Lx1LYiA3VJ8cWBBZAfttw965E=
X-Gm-Gg: ASbGnctDS+c8Jw65vSK1uKvFvKjr1Oc15CpzwfKJkXsMvQGDBch1rAqTitsluxwiw3m
	kGuX6IbP3duaLUFZYcBGI5Y0XkMSqMmoqa8HcGcAUJdnoJnh2I9Da0SvGSkCqGE8mAU/5Ovu9jp
	5wSW7ZxrBretIoP6ykXwNZkMJqkdc2LvGXHBr4Y/UXhVrkXEMbgtJBgrAVjKfRVPUKMTkAibnc/
	bd2zf4qpvy07FsfLJidqqvNkjDKONn+ZpKTZkNPEl0P3q9YkVjqv6F10TbYyVFs9lBH8vbtaE/v
	wcYoguO2il7S2HfjlTi3bbzSV/PG3mO7oubM0d3d0XYHrRPJPH/frlaHuTkYiNsQO8qLvrcKxjk
	NbJfJqfnqgL4+FSyi9viVuGqVd2nC4OGnm6jGt4aopVaU8fGztI2Yq/38kS1u36eQfDnxpygw9I
	9SCr50cQgr1b4almLLgw==
X-Google-Smtp-Source: AGHT+IHxUjgdNCXTiwpOfnXS2oC4TBNMEII+w8M+hOGIH0Djg1ZSLLta8lC5CXkAR753ngvyVq70XA==
X-Received: by 2002:a05:600c:3542:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4778fe7d0ecmr189079235e9.26.1763551007791;
        Wed, 19 Nov 2025 03:16:47 -0800 (PST)
Received: from [10.1.1.13] ([212.129.77.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1013edcsm42553585e9.4.2025.11.19.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:16:47 -0800 (PST)
Message-ID: <643a5776c383a501b129cd0f867395c0ccf80566.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Kishon Vijay Abraham
 I	 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>
Date: Wed, 19 Nov 2025 11:16:46 +0000
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_031650_221508_59F27658 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 2025-10-06 at 09:07 +0100, Andr=C3=A9 Draszik wrote:
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>=20
> Update the code accordingly.
>=20
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping.

