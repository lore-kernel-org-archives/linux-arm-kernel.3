Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0478CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=; b=Nzn/WEPVJ8Plmjz5kfX1xTaJN9
	k0WrrRZd1LuWa2t8+yObmNx5gPlT3kPJyVQkHioQWw5FhngefwScQvcoKwQPSLHpMaQQv0R7q8qgI
	H4WTen623UuwjNmIRN9Xw7N8ih8iLVlVqvkHPkTs0nIAsSF0zcX+sEmBcmf/HncLiQFgAhZVqNkcG
	ktkrY+utLnSsEuHlNZDe9FMA65+aSxxNjeqr1PDPx39bX73XBSVXWNCxqPDQEE4X926eZrLzszSu4
	8wqKCnO0aDlcZpX7lm7h5CgAljTPVnP4VLn8+gy4aYsq4WjhroX3dqe2G90DyhTqozdiDHdavLTDQ
	VLVIHlsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHsU-0000000Gn8X-2Np0;
	Thu, 16 Jul 2026 08:55:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHsR-0000000Gn85-3mp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 08:55:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495441b72ecso1391525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784192129; x=1784796929; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=PstjcD2w9pY9e012yZf38BwyS3vHqwvH6KEF9RLbUnPIGPJpfHupayFauKbIiweLun
         MchDTdd1C1NSXrV+NZhz5VP8CTGH5JfFpvJgLL8E/RbDxg83chyW1miJhrXhLP7339Rt
         d0DPKYpgF9cbc22iLSzLFgLbYeexQmTWlAoaEUmDS4hskR6/WwA49LTAsjbWyuFTYa0a
         MjVj0bW6xzqz0Me2bZh+sGjV+ybD/SHaaa8O+R7hZHUZZfTXcp6iBXe09MRTOUlpdm8+
         EhmRPMYJEWrq3GOgqUIAO4W92GWotOQOrATsfHdZqWDlLpe5iK4sfa809s6cO92rG3gP
         lHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192129; x=1784796929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=ZaHvuanIl0MkcgjNYwOD5XLzljDDtMK0QR3czeuTFHhwld4zzAXAI/2rp6pw7JXisU
         m4SOjCzD7vUTwqH5A7tyTPxiSL+QGL8Gq4BZtMKh3TWJiCLVfR7xO+np2yRWFRdk1Qy6
         I3mxIH2DX+E5LRED3pyDiJnenDvB6h0btvVwECJRPpJDH1YC9xchb7Z4XTv8TEZvpheE
         dgz+GEajkqfc9rC9/8Np/Wl5qiEtTwbUW/ZB3MKp9PJHq90460LWD0BjIa2ZVaI4SpZy
         29mAUIuekz+EJAozfFkhubO8+WDAKrSlk3IOp0IVQDMpBsjGqY87qFDOE4rc38OBCqeK
         F8Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+ysFqYavUAiEusJrM3YaYgBC8ZQhaI10SqOl7AOXSXgZAxKeO17j1jArtwYuW7/kMwvUzuI2dDrbSwYxaVw+W@lists.infradead.org
X-Gm-Message-State: AOJu0Yweidt/xUjfRIHQUKwuFhqVxjdQzI358D5VI7RJeyJXZhSkdtX4
	jXEqpbJL5nhpfD1bTA8Qjz+DHIYLieo9fNwOJ3AM2I7OLWCLJQ3lyAZqTt70gws2ZAo=
X-Gm-Gg: AfdE7clTneKu9ezfutTeme5GnSK95qUl+2ZHmFeWGBNEUH5F8Z27Nj0YMjpl3Wpvq2Q
	EkSyugqkVGVP3hZTdMpjc9iS5yvIpIhmdnV3hqHex/p1407LM8S7m97u1CUm2ohyG95ysi+XhLM
	Ax4a3VWRGavY8aBERlfNME8MFDfA+g5l0TXhkMDuIXmlz9mMIRxfCefGaM1Ti8K/iTRo/iP+ONL
	J2FKviacgjXEZaX/jSeUuWINvJqRkRYkLLg8exrWM6LS9rnJGgIBAi1BBnpMj4nPtp3QEs/uwwt
	pn1Wl8QSKgdlMZ1j34H/HiYKxVWsPYBmdxIZ4V4TXBMcyxOP/FFkF/cFxK2JN9HxywVqFpeqg31
	j+KYUFG197oC8UXLijRv1EJtOf+GPXS59rkRDoEctq0YX7UHD9jJZ01k4nMxhYYSceHV9/Jq+95
	58FBgTLuhDSOTmiQu/cfeKwg==
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr212192825e9.6.1784192128515;
        Thu, 16 Jul 2026 01:55:28 -0700 (PDT)
Received: from [192.168.0.252] ([82.76.204.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c6ff429sm77947945e9.1.2026.07.16.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:55:27 -0700 (PDT)
Message-ID: <18b363f2-7a10-4e1c-be12-9701b8ef3412@linaro.org>
Date: Thu, 16 Jul 2026 11:55:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
 <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_015531_964557_77FA7AFE 
X-CRM114-Status: UNSURE (   5.49  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks, Alexey!
ta

