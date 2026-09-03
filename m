Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFB3C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=; b=k/pA1JTWEU3vj8qi8klrg+14SS
	Urj5/aTfz3PLrAGBliaXPt92FJ1lsKX/UzndAJiKzJ18r3MQXmihDq7Ap5ABQzz9lMFVJOcgwi7bJ
	elMD88OTdopCe/Q6latXlqaTe6SJxZeH5aaEqcYs13hfbPIkAEn8hrvUx5yQ0btnumhZknZrJ0T6B
	OWizy/q8PuBFeRwA9O7YyZyl0B77Iv84IzEE/aC1Wbm4JiNAnj7afa7TZ9EvcLLGGMIvj+UkhMalI
	ahTOQm2GO0illAbGd8u3vXf+9kUaPqGdSflUd79ll8/Pcs823dU/z4+Rw/1BMlg8RIpHqMk+6tf8i
	JPXGD8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kC-0000000HK4a-3fWW;
	Thu, 03 Sep 2026 12:40:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kA-0000000HK3N-3aeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48436251906so2413679f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439237; x=1789044037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=nwudI8ty7I2IoBtWuN3Vk0WUBm4w2UEc6pFbnOaiRwSoOQ06eTXf3UfimdVc+WNMSC
         7yrojFPF2RLIty4XFe7ydtERPeUTw9zCiHdaR1Ew/4MQSt/ojL1OjY+rMN/GCgzFOBUX
         ctSyNVl71o0fOMHvMLQwZ1WaWQNM6Ogg0C8fpunpnJAimRneevcTPnFyGMhYmqr387pM
         RNz5+Is65kIwOfUeeWf1xOfMrMnMGZOyp+2KiI3Yno4do7uMU2ArPwhF+SctgdEzlkNG
         jV2L5ykD3khnveQUXdvcgNrDaZ36oabRy0YBAVZE0b9eVfSRzNRUg1S1UtAcEsiqA7LI
         PtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439237; x=1789044037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=mc6nXLz3XTkPCV7i/7kXPU3ipCW4D1nV27ilK5Fyb0KXXf3EllH3aNDQ2KaTxx3V2M
         fwo5deM4jqCfW+6/SGb6OBb+qshQZHIPL7RoPQQcUbW5Zll1RKu/6EFZDTyNQDhs4vjE
         MmQ8ENr1Xp0uccrfM/LF810WChAxmUG3KiBPud0HJ1FebQUjHC8n+uXYgZ+5NBBTYLMv
         e/do6g09qXIzfWpZ0u6tpIeJ093XpCT9Z44fZ1f/5aJZ9SS52furK8jTWWkryP9hFvN6
         Bb0V2j0S4Vs9dJ7ogkp7//Rhnk5Tns3e+tQr2bTXY1ZH2Rmb/rpdOHAgT1Ynvnwe0J6J
         zW4g==
X-Forwarded-Encrypted: i=1; AKwUvBwExo2VHB8IELmjyPpyQUjKXuP1D1WLA4Plt2TjgurPfluZEjMs3wBHCFS4rsD7tl3s+7PiYFhWsSAKWOdA6Qrj@lists.infradead.org
X-Gm-Message-State: AFuF++n3wQ4GiP3vtZbFtaMwGAX2JTUZqKgnXa3I1dpSy7fxf99WRWM5
	m0ex/u9RE1LURqGSRxQJMWZVP+4gZn7fqu/6PHwp3Mw5bkoCXyrnqesu4JQk5xDR0kM=
X-Gm-Gg: AYBFou0wf6MVypLcSMfjDFU9cttJXPfPKMgxSvzGqRs1oXbaSo9TW6b5QMHHQaNTGWK
	nm8FXYajOTS7nm1hrfNZQlBDdQh6LalPHdT+OgquvRRiRG4p1FaRhGCHgM77S9ny8Oqc1GdL4v7
	cfGt5Om8o9dL/I1x6o8KhsrBVsFzq/8DKS/3LVKtPd4nx6H7MPBXEdIV/P9C3oqWSSWn40gJt55
	fXIdWJGe2NIr/YqmdFlVYKazj6P8IOOFZ4y8Ps6q1jiFDrVocoqsS7zlsQ0mT1+uVzu9jYd4iF/
	3maLsbO1f02Nca1XnFbOvcMpYn95HyluSqAV77QntlM3sxyik1qTLz/eaLlDed11k8oqEvT7xzt
	D2GYupkTDl13W1lDsyndw0ZNHf8UJg04WV4mdAyZw33EmFe/7hAjicTsbzoV4cvC7R9r1p0fDmG
	ywBf6cGFwUtMOg6pmyi2PuuiPeVHXWY0XX9sEZYu8pYX8x98fyy+OHJBmPow==
X-Received: by 2002:a05:6000:220b:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-4858313a27emr5841765f8f.10.1788439236867;
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm14692339f8f.6.2026.09.03.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:22 +0200
Subject: [PATCH v8 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uvwgPyWrOw9KmR0c/X2PNXzypQy3m3KL8GwzpX2fqTE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZ3Xb3rEzHwTLcBk3zdX1pPhQcRpM8nwXSeWTNNSY
 T+Qrreno5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYisYLhD9+37a+NXBY7bmXT
 E+E2T9w1l3exxxWvf5sdZl/+nyWZfpbhf2SGeO2sNd0qNzXPbdzPy/cm95KaiKB6eNSNkyecT3Z
 uZgUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054038_912258_54FEBAB3 
X-CRM114-Status: GOOD (  11.89  )
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
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..53c096da68b5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0


