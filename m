Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA9CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnCT0dDoIS7z8NOf/aPWiMLvZwNOJLMCfs4dZXjNaYU=; b=SPtlW1wBMy6gvJ9US9qgnQLtJS
	kBbtmasWBU+CcID6Y5VLipuNqOxhpITVqwKL0rRHFLu7R1RdD12s6KIG3FeXZ5qa8NDuncN3ZyJCE
	H478PloA52xpWmm/v+phX6mC5PIh3L+J06QY8ai5SiHOBjiTHcmVFVRBg8dt3UxbdwMwR2apgmoPG
	UuzSsFitq4elti47mhCR1/PcZk1mp8ysmnzV0wy6UzgZCE6lVkoAFhApjY9Mqll8KYNKpVsscZasW
	zXwd2PGlb+ua2nDIsIuow73YiTLij/JQtBHh1GcYjpzAvF5uUdDNs7eSRf0FCQNcth/IAbaiUFK0e
	xscxM0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHr9-0000000B1PO-0gDq;
	Sat, 16 May 2026 16:27:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHr8-0000000B1PA-2STX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 16:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9102660142;
	Sat, 16 May 2026 16:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F989C19425;
	Sat, 16 May 2026 16:27:10 +0000 (UTC)
Message-ID: <5dfea4a0-3f10-44e4-8be4-cf011db09016@tuxon.dev>
Date: Sat, 16 May 2026 19:27:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] nvmem: lan9662-otp: add support for LAN969x
To: Robert Marko <robert.marko@sartura.hr>, srini@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, horatiu.vultur@microchip.com,
 daniel.machon@microchip.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr
References: <20260515115954.701155-1-robimarko@gmail.com>
 <20260515115954.701155-2-robimarko@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260515115954.701155-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Robert,

>   static int lan9662_otp_probe(struct platform_device *pdev)
> @@ -196,6 +194,7 @@ static int lan9662_otp_probe(struct platform_device *pdev)
>   
>   	otp_config.priv = otp;
>   	otp_config.dev = dev;
> +	otp_config.size = (uintptr_t) device_get_match_data(dev);
>   
>   	nvmem = devm_nvmem_register(dev, &otp_config);
>   
> @@ -203,7 +202,14 @@ static int lan9662_otp_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id lan9662_otp_match[] = {
> -	{ .compatible = "microchip,lan9662-otpc", },
> +	{
> +		.compatible = "microchip,lan9662-otpc",
> +		.data = (const void *) SZ_8K,
> +	},
> +	{
> +		.compatible = "microchip,lan9691-otpc",
> +		.data = (const void *) SZ_16K,
> +	},

Some checks from checkpatch:

[Checkpatch]      CHECK: No space is necessary after a cast
#51: FILE: drivers/nvmem/lan9662-otpc.c:197:
+       otp_config.size = (uintptr_t) device_get_match_data(dev);

CHECK: No space is necessary after a cast
#62: FILE: drivers/nvmem/lan9662-otpc.c:207:
+               .data = (const void *) SZ_8K,

CHECK: No space is necessary after a cast
#66: FILE: drivers/nvmem/lan9662-otpc.c:211:
+               .data = (const void *) SZ_16K,

total: 0 errors, 0 warnings, 3 checks, 44 lines checked

