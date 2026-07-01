Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7AHJG2Hq9ySVD5y0BRLQalxY7Qaf1eozrK7BDQ19mA=; b=g/suzieQsRKpaVtGsgkfDlexe5
	uj7Ukui3DOu8X0Mth+XcQJiuPS4CQ4mz+nCHMBuZod4uh2v0NB+ZXX94EzTf2uKePiNBnGsIPG8XU
	t69vIG+u/TYBiJtTIw7LJMMIddzd2ExSHwWwpGLucEtZxaObL0+92oyzw02x7iC5lKB9OIB8pCy8q
	GRrjtk1BgdqqeCi5CZCx/y6G2U7I2ROzai2tBj/drkyhLZCManX7bGb+3W1oNGXvhMZ5M3kNrbUqV
	s/cKELw0SBLnzxWvJ/dozBbTjDl0v0+4WjpsLi9KUkJ+BA2ixl4jNzPIXXkQJePtNHLDnN3XYftWK
	rDSVZctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFP-000000021Nf-2swq;
	Wed, 01 Jul 2026 12:40:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFN-000000021Jo-17bf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-470174001a0so531611f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909655; x=1783514455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7AHJG2Hq9ySVD5y0BRLQalxY7Qaf1eozrK7BDQ19mA=;
        b=YYpls6lNFAgTa2obiS9wToYEYPknYfHGN/4ZkWiRwFkaATwGIw6FffziObdjmDlb+j
         HdvTbc1RudRuSBM9oGrSw4qCBqMOOVcpAHZPLPQ3hGuscnShZ6pAEidt4OiIwv2POc9B
         cbkT2/slqbvI7DhbHUQpzVZRqH5V9veTmpMnOqsGNw+cGRZSTonwuJVxgzWZwSSugqCu
         BSCoSFm6pRD5+Eo0ey92zHNMxg3XjVrs15D0wwAsI0PvzzbrsiXrDYQnDos1MagKFG1x
         i+3ZhGO2c/dDxfHY1ysrY0Sj/YakFSWBQ0vtoJqrTXufTDA5inIt/V5Vz2+/XL/fYKhC
         YBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909655; x=1783514455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7AHJG2Hq9ySVD5y0BRLQalxY7Qaf1eozrK7BDQ19mA=;
        b=SZ5If2dpY1sxOsjsSNG1rmhxY0uzQl+0zJk/nWioWgWbi9P6lpd+znZfubcZCeHij5
         19I4FaXE4+eRhXaEtyqp3sVgaHoqHhm4NW3ADON4HIWjMFOXWF0mOx4SHLRfhqGLENjg
         Nl7Gol8YtP73tiUHYGMnzItWuQhhAbZebBIOr26qm3ue5gS3SmvstipxTclqK/VQNd7H
         ZgMhHu3LBEbRvPqhlAGqhD/7XSKaiRDf64bF9oKSlS6ryxyidud5FZ1QI9LJgGf3p8bX
         DjBE1p+eHVPU5a8qppedhqp+0wcRICEeUSEV6xUCkCHwbf793Mb55iV//WXVDtanP9JR
         tCcA==
X-Forwarded-Encrypted: i=1; AHgh+RqDX2pFviwLADGNV3DXRFliUG7CiVbT/v0btK1p8YrUj7sxJuhVaUM+N5bMDgixy59MK0NElaeqgqLMHLYwsx8K@lists.infradead.org
X-Gm-Message-State: AOJu0YxoILra1wiNv2bAqRU9BCMJDW40I1fKbRxFCe2/x4uaYLAn7Ssm
	UCgjUKEyn7y+7rsbFW+iaY96EquRccwyWEk9/SJ1LJ/6spX5WPv1kWTsYhVtRARTPl8=
X-Gm-Gg: AfdE7cnM0tHIoibT2gVxRTHtg60w2QqInwDdIuaIDUe5XoKInZMdZhhTfCSl2djuxY7
	oMUBGoBmunFZYiUyGyUttS0kOFYlJk1RvQYD2I7tXCc0bj9fyGmuOhW/vfa20d26D2TL76+nywU
	Ygt8Jh2pJ86ON2XbbNmF7pPlk8pap5wgZg6C3K6urXZT4dTNwTjxJYICMFEA4qMG/VwvWmqpGon
	OgG6Q6WH6X4J2kyncklQAiJvD/IBT8NsEziOhLFfz5hIzB0tO6V2XdaB5HyglgGvvzKzN4UEXEF
	PKEnxNjr93g8aqb9k3anxAwbXvY8xPpXPcx49wkNS4h7Tc8w41FLokfSVS4SpcwJVBVg844WVjn
	9tGP0DDFj4WGQa358UTCg0BM2moIlsYCnK4Bmvb3tIDXBhYe4EQotI0xip3yXbgBmlwYbYnXLsA
	mKLSPImFHnqw==
X-Received: by 2002:a05:6000:2507:b0:473:975c:4fd1 with SMTP id ffacd0b85a97d-477b3d5c5bfmr486039f8f.25.1782909655250;
        Wed, 01 Jul 2026 05:40:55 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm14794679f8f.19.2026.07.01.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:18 +0200
Subject: [PATCH v7 06/11] arm64: dts: ti: var-som-am62p: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-6-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Z/E+JjncGLfbHT8NI+qhLL8LEa93gDAXaV4LCMnFfqk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXroVRgmVnLzRvY8sXMGdO0lLbwO+qZfAsfvffgmWO8
 v9fblzSUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPp28jI0PpYg+2PatMD3Utv
 P2k16BQyBRlFTWIr3OE1xfPv7tc3+Rj+x72LYZY8LLzzpEFkyNRGn3qffw0rpOapnJmx/6bm2yg
 +LgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054057_329657_4A28D595 
X-CRM114-Status: GOOD (  11.94  )
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

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde001ce33fa295f68a3850b622cac7d..1408c970f1942e8a720c9cf071b2f49eafa9db5e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0


