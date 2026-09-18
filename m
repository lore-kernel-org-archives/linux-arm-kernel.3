Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A83C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=; b=GtKR5xMkd8oK2WGapzxCvrqGtV
	9YTdiHL7PDPUNw70H5dgsdrckST9un8BIAJHvtzuuidzCM64cfrWhaR/88jFBcWx/eAd9ygCTXpo2
	oQTMnO7Dk4vBMDjylwIl1FVKqmTiDU+hz7n70oAiupMkTqflNKSXJtMjx99JHRHRPWPxwZUsX+cxt
	lnVT6vF5H2soN++QHBNraRuUEsmli68llrJt+iH1cC0XJH/d9BiXW9FSoEwyALIWhRDiR77dKQgd6
	w96nq2Ph2EHclHW8UC7IlFzkLVkNIo1XnKUFBYiEx1hCy7WDC+inMNbYyElk2yeyStDvaabmB5hF9
	G39Y8AHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkP-0000000DvCb-3M3J;
	Fri, 18 Sep 2026 09:19:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkN-0000000DvAE-0uMu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:08 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so3098295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723145; x=1790327945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=Bt+nFSADc4eLe1e10inCU0/UOl31FSMEGBKqpLdp0g4twdDTsc9RK8F4AvB+BoLUCG
         RtCLygKk63cZ4R3I2dqVgTDVbnvBc553T6LuvkMBO7s3wE9Ho1U/iOv2fTBBg/tCxzUT
         nfWhVKlg1h7fjOAIco5S8VwiFgbhYQpN6Wmw/KyJgJwJDTputXFWDz9sWVj0qXYAYqep
         48bwNbNosfWTh+CTWth5kwejoHUZjq3XdRVWcIYq1ck0dxGG+Jb8EZt0/Sgq32dAfggc
         l//TsgETShJ5Ka16uSJ1KdDtRyzGqgYew1LDeC6OZ1WYKNth8KgOGD3EwXDkJiFeNFbV
         gXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723145; x=1790327945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=XjVOIwYFgsL53R5/SETV0P0J5gdioLJkhhYg1veUlsXD9GcyZod3Z2GYzmxOOfYkg3
         dYgi6Ht2Mhb57zohY5QLtSFtcgFfoTbv3jLpVkUQaj+B4rjI9QgSWQmuZjaTtWJ6QH2w
         YPdyuJRmm6hPlUDRf8+xXPmrYp4m4KA3HAZHjzsAwbowlP/Iom2xjzAg8f34W6QWBzwR
         bIM3MJwcQpQdHJvdrvw46m5C39LenOJH/+2dF/3LFQWXLvNEHyMvLHYDemEXtzFSSU2w
         7z82w5RUHD48munQ7+rN4aPlZdum1DvwwPsQuSt+3C2ZemCwXhNQ2GiOjvggR+6uuRuF
         mTKQ==
X-Forwarded-Encrypted: i=1; AKwUvByKFQ/cj7eG7MpWCuABb8kTpXDKEy/SuDqnx+/lXe9XiIpz75N70SIv3XIaUkx3UVJ6UyupzO0htdR/5uivJ5Sd@lists.infradead.org
X-Gm-Message-State: AFuF++kEDIArGhG//av6UwxQFLUXfj0KDtBtW/psUHCWoM5ubUwGdmmo
	9YZSIW2tlbffKc7jnsOsWCaUomBRx43qhxgejcHUSIWXv1HjLm8sRG+wPGy0QBxloJU=
X-Gm-Gg: AYBFou0z95UlqsxF3vrdx0JXZbAnYNfiz3sCC/a6RxM2jzZa7YFMerBsnKRu+QtFFOn
	8xvr71i37v/8Ps0DVsz2jpoSL0bsoMSB/Pd0MyzlTgQTazGtnP7fqaxJNUN3PoxALizgZaEHnz2
	jsLKNV5puJW+Rb0JdyRNIAsXwgZtTNlEbV9JsLV7Mu6u61iTOBtCdl9QVX4XI6CSYu+mTYj67UG
	ipAImkDZx/zY3fJ8G4NEVyVO8UMkTye6GR1z3S2o7uyeetz5l3BDqexZXr8B0EQ/jPHAJbI1YU/
	DU1MEs+jxLy3rQgJmrewcVaiPsE9s+ERM9iJvAfDRoEEx7YfC6YavQZW4XnCSx/eogJQftn/Xyh
	/OB8c6UF/HSyYEiOvuWXHUBryfMH7wFKWc31XVe7/hzxquSO+RFbn5j2rjyxEYSIpYlyTTb5wr7
	QcotASoniPUxvaTFNmIDmf3mE02BfM/W/6Dq3XVuiwUfxyldxMtj+bM+C+5zCr+1yXBog=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr23520765e9.10.1789723145444;
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23a815sm156485815e9.14.2026.09.18.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:49 +0200
Subject: [PATCH v9 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-5-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=msp@baylibre.com;
 h=from:subject:message-id; bh=nlg2Vo5gJVuqTy6ZSc5mAEsVYdjtMTLDz7lCiJOX1tU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jNd4ntTwXnTU3m4lvFOgSprp1PNUmYmXfgX1nVK59
 mvHikNTOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAihcaMDO92LIo81Cr9+Mnp
 c5FTQv55fjQ8dmTz9lsTN+x+Uq9y/sczhv+pKyvuPpicXLPodmlO0eTUAJdLPNtePzRtaDznpfU
 yOIUVAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021907_275823_43D9062A 
X-CRM114-Status: GOOD (  11.36  )
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

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..b8af9ec81b0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1d08000>;
 			no-map;
 		};
 

-- 
2.55.0


