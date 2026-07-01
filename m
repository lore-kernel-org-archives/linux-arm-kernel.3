Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E435C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=; b=M3TD2MvRiYql2/Iu0mKZfQHUQ8
	N9UObH7dyL+1rt2q/VDvQCx/aFRr4WpCY2GANHyCL//ztkvqMHG3efVWtLoVFucBn4YyBsI7oZaud
	+Tw7ZtTULrUzzqH+jvmkA76xNxS/cXC6wimjubfZV4MI6MpB7HxjEXo60/HGCyLrLXK0sfnBMgIks
	yAG8iBdZzfUHZq2qn13KDSUAKASkJ/gFGAulzRB2ptIuoyNOL4xy7EA7ncXH1KO+pTPd275NpmKk2
	0P31gXuHfNhLnW8I3o+23rAgATpRMe9M6OA75SBeVihjgv8pBBah9/qJ9lA3+GqrK2TwTUL2XQr07
	Bahxb7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFH-000000021I5-2eT6;
	Wed, 01 Jul 2026 12:40:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFF-000000021HG-1ui0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4759b4f0897so471234f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909648; x=1783514448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=INAnWGWDbEg1qZda5rODmsUTzu4ut0hkleLyO0hDKCq3kS7+LYfTvGNRq8KdRYcH/y
         LXVvehd2vbtiYUC8spTw0pbMR9H2hqRvb1ba0BwOVgJiZCzOgaRBsca21vN17wsmZYSz
         YxTyT8wObtgB5lE1xGzoHrbyqLZfPONcqzQMzsGHkbdiTQj/aXH+/3IBAiqTUOxSLRa7
         C2/pnzr7aA2xw+zNy2IgNmRVO8SgcyqpX/f9ZB6OMM2meg0LL+DouKDd0nQazTaO1LSP
         RXy3KVi4PvrYWLNrVZqdk/tri5afqtFO7FB5smv5Crn4nvN+sY6udPGDmufSIFFYUyth
         k28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909648; x=1783514448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=Q8PjI4FQzgZrDCn0fIzzngSi7WKjqcJvSoxpNta9+SFf5zF+xAvqh+wvYdG5FEWefq
         eUaI9DiwtZiA9qq6HYj8weuDBKroTgMyM55hfAtx8h6/nAC2RJbEAtiAtixokoZwOKJ3
         pOV16QmQSC2VNkvvzASEkkNxxIa060Sr4WBLfizH+Bpc83QJ7bvK1jP6jItjMK/e2Jst
         b5zbs0z4sHitOH4EXUZlBK6H1opmrWfRITLlCKAZaPtQJFIzikVPko1d1uDrkVRN0nRU
         JEOOPHxrMuIHnjbwxw1/7X7ucQTv9zjDLhv5pSGNWv4HP+sT+EHW6VwlX+x2fB5Cyl6p
         9h6w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2FYUru9vZ7DB39xUoj1d1VwDKzbk3CAUVQx+VKJC9tGnSohkLY7epwX8VOMar79Gpk1GsWQZ+4PAaTpDl5bqV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/qJ8/2ndTnDQeMEdQUkxzMAJPs61Zw3l3/yesEIwK/f/NoO3B
	E3DohsVWE2KeSMiOLZMFBG54nUIfJVd1Sk3Kd9G3A857c7Eu67d+QoC81V/YKwbq4Xc=
X-Gm-Gg: AfdE7cngf0kKXF/oRjCf7lmzOQb54HiywuxxlIrrunBwd4jC1SDW04n9zM6uVrQnunW
	VWI+XnOjIx7v+xoFKIr/HdMseaEhi/eiIIIPflmzcHHUpc7ub15o50xh93bo7wV/27SHwZp3S5c
	lp2RGC+wv9FBHVyNQlUggkuAKxuOYu+ZyAA+WfYjLbgLYaOfnffzAjUfW7nDy0bEOHy7u3CGOPY
	7Ekw2aIPq4aYpYpr0/bkCHeMwkvvH1e/JV++rHlRvkloBVrTUbk3xFVgsjQ8K2q0z+Hg9CudiJ9
	UJrpj+YUftuvuXS8UF5Cby40kufKjlMVSoMPIf15QJmdQq2fs4IUxKd/U1yWblsckhEr8FjKqx4
	J0M4BmOB44OLra6Ch+NFY6cTpNZptYmzvWFsPlyZXvyJqs8z8dzqXT7XBMHJeRHakzluyvtp4C2
	tGodjetQTKwQ==
X-Received: by 2002:adf:e009:0:20b0:474:6a5b:860b with SMTP id ffacd0b85a97d-477b4fb2955mr401340f8f.37.1782909647645;
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm17848753f8f.26.2026.07.01.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:13 +0200
Subject: [PATCH v7 01/11] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-1-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGpFCnyjGaxDR9qbBVnjN/qS5E5NRZGzZonOGc1Sdrm+xQu/K
 Yh1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmpFCnwACgkQhcFWaZAVSlMRBwD/R8D5
 k4DLFbAre6LCFFxtN42qd7BzTXZEuQeC+r9vtfEBAONbUMoSrUIisHZJ7wMtgjwHi7BPgHJORi4
 RdPks5AoH
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054049_536357_1C57B245 
X-CRM114-Status: GOOD (  11.50  )
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

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..e13da7c95a30459e7649f284689039b89a95f651 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0


