Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F74D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0YG28pJwuFWWWbmb7kZFD7xrZgouesVy9V7x/n/G6Y=; b=y4O8GIed9nmLLKjU0j5uvPCVUz
	25JbemP2Z4CWiqN5QsKg2f1hiAsvDEa8kPUMiRwaOmbIqvSSZEa6GQ4OyNi0gn6f0jYz8GmdjuWpU
	F92w9pfK3OtXnIcgEEgBQ0LxMC1J3PHIFQrQByPKHyb+Y9noDwGMxGBmQaj4j9CCPFyvWZGZ/7qd1
	zRe0hrO19iadUFSlrf54m2WSky4RaTD3JWs4mSW25524mQzYHit8dys7/DQkCvyRR8w0fa4EEQ/nR
	LifF1WFZu9w0uPAYL2OJYMPo6K9s1x6GlWtHpFxRn2n2kXM/oDkZ2xtuNk3AXJxzrCC3PCCyQo0x8
	JCYn/dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAri-00000003qQv-3rhm;
	Tue, 20 Jan 2026 12:29:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viArg-00000003qQa-3er0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:29:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-658072a4e56so659736a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912182; x=1769516982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0YG28pJwuFWWWbmb7kZFD7xrZgouesVy9V7x/n/G6Y=;
        b=j1bfjJqXSbMzuuvUTnCfa0TG32eyUrYpGJp6zOoeHefkr7FmBpsZ2jBBrdpyN5X8e5
         l3GwLDa3/ev+sJaNDAeWfnfYnt8Gj1HxuKWrrOklDDSybsJ1AjCos9KX/XzOt2iQHiX6
         aLxt8mJvNIKoZsNW1DZM1SowbWCHgjwONfcNvCCOXmOTD4YB9ZLZzpHsVtCMuzivn5et
         YgROnKrALQ41SL8njeSy99BzoWUDonEViKkHRbfahKlCGO61po8zs4PPM7YyL6auhbqp
         FEsasaI6ZkNp7Du+iuvXU8AHmuGht0rx+/DpSaJwFW/Begw3R38am9Vp4GS2CQXtPi9z
         otIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912182; x=1769516982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0YG28pJwuFWWWbmb7kZFD7xrZgouesVy9V7x/n/G6Y=;
        b=t3PL9aoeokoIMVEMiYqK17WK9t9372vud4OvKveb9CK8gtUdSJmIb3hrWgNCemkrZV
         g+PmegpGhGQJdCJWIht2ei92mlvtNv5FGgv7zDDoZiwURZm40vLwylMdcGTvUEKuH5x+
         R2hSoRDlWwa2+vsHnJU6ABKxF9GElLYLZvKHcfotwncOJEQkE7QERKxpkcQR//gB4yBk
         HG0NmhM9lghWSAZ29jPDS3SafqXe1sGpTwY/4HovB7FU54o0eRZO6+QM2+8AMbrd8Kyl
         B9S0MTWCgfNr2YE/UTGaiyJhEsbcdWpd/3g6GCb8MI9KR+HHgLOinCGNNoEejlBa4tDI
         5s6g==
X-Forwarded-Encrypted: i=1; AJvYcCVi9Y0Lu905IDv74/Z1qw36CmNRACT5jYKWvKt8S3Yj5C19bYmUj2wbrM75upOOqVqOOHcWYcFAZwlChYZOcUrr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8yCyIxNrGvnnHY/Z5LjkLINUH+RfknHZCR606BK2IfikK7Ijw
	8h5EzYWSFM2p5CATBIwWJ2HHQIPxDVINgjvifh9zIBCr8qzwKLcUGlHt
X-Gm-Gg: AZuq6aLq2Wkab02WC+Hmhr7OjVW03F2q+szQO4mJJ0QH7+T9qGKQrSOBE95vhvNj4Tv
	q/yptrt5K7zXR6j+FQqPw9/csZB01KW5AdiEhVPzC/jLYM6DIxCZf97uGCTZrEzuNdXCu7nh4ZC
	tXwvC2JmG0jjw1QfqVQZScsj4Q2SbvlWg4gCQS08RZRU7ajOlb6Yy4SVeKPHhuMMRfJg4vlxuJW
	1h6kPE4WBQVyCu+0yO+Tsv8eiBosX9ysYalIzJqmjg62qw/RlMFcU3ZVzLXKR5I0gEze66o+1xK
	pbIcK4rANCE1OhnQmboEhWQHkfp94k+HpJvad388D/1ROjL4PIn7pjPZ5UunrVCe9P2ZXhX+knn
	5/i1/SeFwXSgTxsCoMDpFj2XNnp8RLipWMEVR8zeXLhn7FcNQZKRFT7ac/7mkrj8xOpQOkz2bs5
	WaRptV1IDYX7yQpfiNtpvkEyWHXwyNYhD96Jf+fvEN7Q==
X-Received: by 2002:a17:906:c153:b0:b87:3280:6003 with SMTP id a640c23a62f3a-b8792fc4229mr1369007366b.49.1768912182084;
        Tue, 20 Jan 2026 04:29:42 -0800 (PST)
Received: from [10.25.220.41] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a0880dsm1368115166b.57.2026.01.20.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:29:41 -0800 (PST)
Message-ID: <993363fb-8ce4-4a89-b6c4-8fbf181ad410@gmail.com>
Date: Tue, 20 Jan 2026 04:30:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_042944_928678_B8B5E76D 
X-CRM114-Status: GOOD (  15.93  )
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


On 1/20/2026 12:35 AM, Joy Zou wrote:
> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> use by V2X (Vehicle-to-Everything) fast hash operations.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
>  				reg = <0x42000000 0x210000>;
>  				#dma-cells = <3>;
>  				dma-channels = <64>;
> +				dma-channel-mask = <0x3>;
>  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
>
> ---
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
>
> Best regards,


Thanks, this fixes the kernel panics on MX95-15x15-FRDM and MX95-19x19-EVK after

AP access is removed from said channels via SM.


Just one thing: can you do this change for imx95-19x19-evk-sof.dts as well?

If not, I'll just send a patch for that later on.


Either way:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com> # MX95-15x15-FRDM, MX95-19x19-EVK


