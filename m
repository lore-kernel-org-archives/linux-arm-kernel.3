Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfeTFtl8ycLeQAXrwF465oXgTTKRj57NhCJsCxPUGYw=; b=zRAQCmstTMKwkQsfR4g/IZns+J
	aA6zR9s/21y3HKxzk354WP443AvjVDPHQYOGL9XRziKXz9RCmjBiOuna0WmYtoXeHvi5SQPqAcx4X
	hr1SsvH/1F+J5/tI4p46TVnUCCLI0K45fUFYF6areTryV00mBpeYTL1rbCL1Aev5zVEtPfnniJDcN
	/P30FzBQ27i2Uiao197OsmbDNBdEQtvU12E0q7H7OqMbCfsjAOXb4pjsnNFWRZuKdTwBe9UX7f5w0
	QofxeNV3CGCBckNtZhp+4sUPIXaO/JFvJzadW5GygxNYQKdbSdTlofFO2toFvlnMabpHwxz13yx4S
	b9TdUJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvm3-00000008eOt-2r3K;
	Sat, 22 Feb 2025 20:06:55 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvkZ-00000008eMC-3606
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 20:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1740254719;
	bh=EOIAAhnvAqcJAfcBLWXpvJ03F0LkIj4if1vHn1h9A1U=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
	b=2bEvC5ISzbx28STGms+5ITnG1jt2OPnuqY7nEjUja7+h2liMiezlffSZuUWyp9FOX
	 E/8sDUfbuNZHlrflSJM364ctRAIAiwxrQcQBJAgLpAtOITNac8g4G4WZW4jc0BwzMf
	 SJh3sDd9RSnD9vw0J3s3U8QI6k2UQJ3qu1WBeowBaL9LJ2zpHzpQRUSb4kCaNumFSM
	 KGHH+3XNIMdrfpdkcnkRh1B1tQhoBaHCUnns7GSwvYh0dY18+r+OjPb702nw+Ygh8O
	 /nclNCCrweu/6+RGrccjFmHgzDlYzeU+eGC2sXmGEDCOJ3/kI5Vqt39+dkkO/+ZmSX
	 r4/NwKu5FBPXg==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8A28522AAC;
	Sat, 22 Feb 2025 21:05:19 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ED1341E75;
	Sat, 22 Feb 2025 21:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1740254718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfeTFtl8ycLeQAXrwF465oXgTTKRj57NhCJsCxPUGYw=;
	b=WdoPDvm8HKFKuut/56zMqqOEsGVIZHXtc3/BZ/250odZuxi2gGjWiYrVZkTYDbxDItcBaH
	taBshndSUM7s/2PAnNp0oJx+zZtZkx7127+QrHC7gZtiz9R881bAZnT7Ooio8tBrKkMY+F
	zxaiOPY8/eomQeddNgxUbIs9yYSGpMysOqzLMrpnZZTbOZ4yohNyd9HfCJT9exCLMcVyPz
	99EFrocwU2bFXWn+Ggr+QH4C7vwOrniG7bVegfWDEplgsXJNAx7Z8jJkTd+XKq2MOpZt+Q
	Fkk0pEQD2MILDwuilgt8VkknH6OtoV6nK2xy66dP1txokwplJYg90dICVzH0TA==
Message-ID: <068655e7-2ad7-4497-aca7-4100ad478d99@juszkiewicz.com.pl>
Date: Sat, 22 Feb 2025 21:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: peter.chen@cixtech.com
Cc: arnd@arndb.de, catalin.marinas@arm.com, cix-kernel-upstream@cixtech.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, fugang.duan@cixtech.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, will@kernel.org
References: <20250220084020.628704-7-peter.chen@cixtech.com>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Content-Language: pl-PL, en-GB
In-Reply-To: <20250220084020.628704-7-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_120523_976491_581D0BE0 
X-CRM114-Status: UNSURE (   9.36  )
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

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> new file mode 100644
> index 000000000000..d98735f782e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>

[..]

> +	arch_timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency = <1000000000>;
> +		interrupt-parent = <&gic>;
> +		arm,no-tick-in-suspend;
> +	};

This is not Arm v8.0 SoC so where is non-secure EL2 virtual timer?

