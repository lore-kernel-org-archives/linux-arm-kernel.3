Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B60D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3CUO+zBXmtdsEkHsBoN0U2nlcRNrt25WJX7v9vW9fw=; b=oiBytrAzSOivBH1P3Zb10xS62E
	U02R8dd34u7nVB9Q5kNc50CofI7L9u2lJJoC/QT8sC0gIKLiAgLFtXjJeuLc7D6R/J/AF4qKedIH3
	Wus1wsXLKc1Cq3FL/qU8Q0ECPei+Va4Zi67v2x3a5/nQLVsLN7ugX1mk/ML4nomdl+MhMC8ZmGzTf
	pzh6XNzF7iXtrAETcCKrDJV4cd1INj+v5m159qIqFAFYJc48FGtifLJLGPjf2yjJOEPAwR+2AwbiA
	KATSr4l1kqMd+HBaYkUVo7qcAP5PX6bKd8kF/aXS3+26YMxyEAh2yyFFqh+bqO5O22h2g2Tq8Akqp
	713rHIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu0p-0000000E2b1-38Ne;
	Tue, 09 Dec 2025 09:28:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu0n-0000000E2af-3ONr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:28:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so68404055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765272479; x=1765877279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3CUO+zBXmtdsEkHsBoN0U2nlcRNrt25WJX7v9vW9fw=;
        b=dHwIJdMTcShTCTS5y6uYFfoBk6OLo3foCIOS0VPc2vERcOr+xt7cKqWoPrMzXqMtRD
         LvNnAi8Enqs0mluZJ/T/E5HVmGniEFKmUiuBhGeRjtxFhSSysBxvpSZ0QJGJXaEPV+L6
         7vcaqJ9ykwGwB//w33LdqdEih3G8AAAQipBHhLPM4xIwOwAhMdgRfBJtw9q3F4tazljM
         0oUFhfTzuwa5tulebkfcXbIuzwqlj7bLmEiCnGW0AFi/0w7wgnG7mVnDNyEwv1Z498Bw
         62C03FMccIpCgXoEQtTG3GPHUBXqGFA7EZslf3KVqXeEa0euhgmVy9fvoZIM0leaodff
         Rxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272479; x=1765877279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3CUO+zBXmtdsEkHsBoN0U2nlcRNrt25WJX7v9vW9fw=;
        b=QvUt1ecVPZ69pBspWj97ikySLaY3im8TvPSFFQr6nMDC7ekzQOnM/rtMx3bBHjcpt8
         zOXcv6Dxlro6yWoOwy6rdkp7CZs0beV55l9nSFd6tAsr4FZkeqZI6WvR1FrZe6Qn81rG
         jafcSy/nRd5x6Ok0/sonYy5zBWBpogCVrBNYg+Y4s+bbjISkfGy49x1SNHfsnuud/PE5
         mFJy7A0x/k5z/yKROosTPnXGtGriG4XzQl32cSNyUhE7prUxVCRPeWJ2cZXeJK8L8Uxe
         Fxzy8f4oIC81niLhM3ECW9pdGl1qAQPOFEUiKps4Zb6TYE2qy+qXH9UIZyxUPzdCy1c5
         ehSA==
X-Forwarded-Encrypted: i=1; AJvYcCVFMZAEus6HqdVcQkzRUeNcTlwvpn5r0/LlQpF0ZIfp3X8WiMH1yeY1TRHKBcMCBHDYVM8CJsvyKwJ4ZS3nstyc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0FfIM3jeGP5j0VefUOmgNiG/wynFbKpb1EAKRY5bxps4gUhxO
	9dMuOlkY5EZselU3gmSk3uT0PhYP1m0dQ9AGh9vo/SsR39HDec/Ub+dMnMTywcn8sPE=
X-Gm-Gg: ASbGncuWFHDjlSD/2bIQ0AIWasg0K2KxN36tMw0G5EZCRP4Gz2lKxOElKBqV046+OZ0
	6xG0HDGzacnt5f2UfHAKaXWR+QSczpNVfYRl+wvLNWH3T/oqyrtS2Y6/3c+JlGZ0l7WHBe6vIAh
	an+B207asYVdn+IyfAhu1c00eZqy2wSb2iTNPDhwvWIY0UwvNPzQ+y8JoY+UoyeKGtkClLcJyra
	0mFECOWoP8UJqcO//zqk/hTRcGTsAjfG/VZI5P6g00ss0hpq4pJgegglDb34YkuqccEgLQfm0uP
	yNxNcpS11A8Q6Pk4ihsbh/rdCwqPUbxfZMFwhroJ4+5grA5oOIIZyc1P8RnCFyiw7S6sH1OcfXA
	7UgvJsrEGelWuacw2jnvzf3hwRbyfoxTpyXlmofEP+GVXQFtBIY7md6O9Dp75FgOm7gy0WunxgE
	AJe4CQxe8gL7SkAGiJHU8=
X-Google-Smtp-Source: AGHT+IGU65rxEAITpH754auEUsEUpkQYQjZXXF4Pby3Lcu0cneSAD5FbIv9NJfGhM0XDP2w3AdsviA==
X-Received: by 2002:a05:600c:3593:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47939df83e0mr107183285e9.12.1765272479234;
        Tue, 09 Dec 2025 01:27:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da084fasm12009025e9.8.2025.12.09.01.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 01:27:58 -0800 (PST)
Message-ID: <b0c8616b-24ec-4da0-abe7-4514069c1679@tuxon.dev>
Date: Tue, 9 Dec 2025 11:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/mchp-eic: Fix error code in
 mchp_eic_domain_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aTfHmOz6IBpTIPU5@stanley.mountain>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aTfHmOz6IBpTIPU5@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_012801_987858_BA6F9BCE 
X-CRM114-Status: UNSURE (   8.82  )
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



On 12/9/25 08:54, Dan Carpenter wrote:
> If the irq_domain_translate_twocell() function sets "hwirq" to >=
> MCHP_EIC_NIRQ (2) then it would result in an out of bounds access.
> The code here checks for invalid values, but doesn't set the error
> code.  Return -EINVAL in that case, instead of returning success.
> 
> Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


