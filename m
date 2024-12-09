Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A1E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=; b=Cs7rAtrtEcR7R3yZw3AwA3yU+8
	yKo/HhAz9NedXKJ7OlT3XQmu5of6kKybYC3tTpcKyu5d7Kl5fgejVb3lkQa0iL5ZWbmMLtJYBuknj
	CcCTMuiLD3MfVh5dznQi1zzy9VrfIlMUsVKFtZ1UidmvDUZ00rqd8mjA+9Dshd8CHu3iLzYPyBncc
	DuqxGRc86b6Sdtfb3UpkcgHk5njLaYhwXveU+10BI2YHGHyMF0+JyCh2uwxR5OcfNrEvcc3nYvxXV
	DI9B9HJJ0iuPZ3aDXwwuutz0ARgBzbIsYA0p5aiL7iR3GvTRUbAYrkYCrupefITXP8iPMXKUkBtSG
	80IXUGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKasr-00000007GNl-1Ly8;
	Mon, 09 Dec 2024 10:20:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaTl-00000007AwG-2gai
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:55:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434e84b65e7so19544685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738099; x=1734342899; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=;
        b=BAr1mGqP24p7Y/9e4tSWiSIkWhSpZBd5X4JmJxl4KoSGs6uw9o3CHVtc6Y6CcHqkH3
         uErMgIAPBmCSEvVPWQrI31nvKSsmIrj31BfRdApTfEmjLywmGvfBu17Wc8PIw0otAXLz
         S2eOaDZ+HJjHbrLgYa36AoSkCt+ww7YPReQWtWIF03Q1S86cLFaiq7xWcCfqKua1frVD
         lXRmop6iPcSsDM97/Oaw+e1HIcwiXq+XjJSw6jRmrnqn6VJ6K0rxoZfq+AOs5U71DNeP
         dTd7Y3N/r/YNjxad6UbMaHsCrl4/Cqmi1vUIWSYUbWp/EAJ1ALdswAL+HVSUDWbg9AR5
         cslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738099; x=1734342899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=;
        b=c9MqCLBEna9axsn+iJRjqk7+CGiTk6gFJjDyBSI2GqYKWSNHhYDUw0DhQGRUT9eiLD
         kliWMaV278MN3xE90MUCg/BinaAFY5C9WaR/o1QaAKtiTHy+nZpgEUfYmbH3y4flDrlU
         RetviIYhurfmvLqYQ3I/knbMYwnR1lnl+eygiB7XP44yDUraWnM8tFYaBglnV+YSW24a
         su+cv+ViPdUz9yRYRyQKcjY12bWn2KS9py3EnUTCoxE1HzZSSLh12t9eyhVNM+X8qmvW
         pbatwayDs4I6KJcEsdpkw00Nv6CI0epCPgPE7IL0L+UekTYFFlVXr30pcmCFeyrI/ChN
         DZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVV8hNaFR7haOC+/15IK78EC7GjdXY6rkN1gwYCWenJkbHk6hf0n6pY9ihiu+Azhz1ooswg9vY1SwMoHm2LfqrI@lists.infradead.org
X-Gm-Message-State: AOJu0YxXEfoNX1YzFsKXoD00KncpzisqDqR7cLiQdXo7bNd1oqtGCvYX
	sKSYYAXV3IvdMLWkavNi47aRo+Ad93Zar2kmtAfmuLKM2jnbG7NfHh6mCRtkbyQ=
X-Gm-Gg: ASbGnct+Yizd1/qiyFuWeLdyGGAVGZ6d9xNFVEWhI7ZuPkOS7QXL2qEybvBeUSEsfEo
	d8UgJF+hlrwEdCBWhxZnGKvLfqMKYRw06U+8yqvtyclRlnO+qxFXldKmvuiK+LcJr8F9lomg9tb
	F/HEGBrHYpBRWPGY6fYRlbL6uKAqIaQwy6uXWxT0tZafsCP7DFVKSqD8AaioyUc4fJ2oVQSIvCw
	f2k9E10wRGeJzXTf6kz2YHqox4HAUhD8bO3KkH0MpQjZkRTfjuqOQ==
X-Google-Smtp-Source: AGHT+IF0aY320LKmbb9VsSh4Bu/wLdBuFlAilYWTSx5YOCp9lTexIQIbfl6KTwoZqY9Q3xeWbQxuNA==
X-Received: by 2002:a05:600c:3783:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-434f5c03c29mr28643785e9.29.1733738099338;
        Mon, 09 Dec 2024 01:54:59 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f3c96ca2sm52326465e9.24.2024.12.09.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:54:58 -0800 (PST)
Message-ID: <bbc6654e3ce7d28c4a98e25db270615b07a42c01.camel@linaro.org>
Subject: Re: [PATCH v3 5/8] phy: exynos5-usbdrd: gs101: ensure power is
 gated to SS phy in phy_exit()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, Roy
 Luo <royluo@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 09:54:57 +0000
In-Reply-To: <Z1W9xuCrn40uPWbr@vaman>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
	 <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
	 <2024120528-poker-thinness-6cfb@gregkh> <Z1W9xuCrn40uPWbr@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015501_675168_76D8D51F 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Vinod,

On Sun, 2024-12-08 at 21:09 +0530, Vinod Koul wrote:
> On 05-12-24, 09:04, Greg KH wrote:
> > On Thu, Dec 05, 2024 at 07:33:16AM +0000, Andr=C3=A9 Draszik wrote:
> > > We currently don't gate the power to the SS phy in phy_exit().
> > >=20
> > > Shuffle the code slightly to ensure the power is gated to the SS phy =
as
> > > well.
> > >=20
> > > Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 =
combo phy (HS & SS)")
> > > CC: stable@vger.kernel.org=C2=A0# 6.11+
> >=20
> > Why is a patch 5/8 a stable thing?=C2=A0 If this is such an important b=
ugfix,
> > it should be sent separately as a 1/1 patch, right?
>=20
> Correct, one should move fixes to top of the series..

Thanks Vinod, and sorry for that - separated out as per Greg's
request here:
https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@li=
naro.org/

Cheers,
Andre'


