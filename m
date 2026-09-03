Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5808CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBo5GglLSUf+2qKcbw0juE43gyDXKzXipzNkiqLKy4U=; b=JCp60ViRbSCdoO6eRn/I1ztUch
	KxjcPhlc2aZzGlAJr9uPlFNJ3Ca1ljciOz4NhvbE20oJNwnpuEto5SoQOSswTF4gFKi0Km3smRcxl
	BBGA8jlgrJ8uLU7endhhoQJEMIt9637899mj16UEMlw1XKWK2oN2q81/q8mlMUVdmvFSSZ2L2xcUS
	/uVf3T69UutJaHPLMf4FElUc0oC8U0bZdz7uLCUGrXAzes+IedgdaKdS2McfOWMc0ivddlUTj5DP8
	WwIU9RB+rE5BFg4MbAp3A9+9UJEfpZnSo1OwpPn8dCcXDYnXz+Jo+oNV4F97ZbXlrxdLUWPfRP8ua
	QChgrCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kF-0000000HK6G-0iTc;
	Thu, 03 Sep 2026 12:40:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kD-0000000HK3x-1NRL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1553806f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439239; x=1789044039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBo5GglLSUf+2qKcbw0juE43gyDXKzXipzNkiqLKy4U=;
        b=nLjF1ByFPH3Xub1SgLNWqcf/TLshmOerUsEm7aBNXnuCty6XLPuaa2hpSntyQcdyM2
         57ycKDuctx26af8hxKYQf1RBWv5zNvO6yWn+7QKjUKFphmXqbo/mmFsknytlrGFF+fUe
         X/vntxoWJxmr2s7Z6s1GX12HysMlnoAVwgFC8vxMGdSc1UEe83iyCiTSPXUNriXzLa5U
         0YGrU25CNQUnq51vrp1IOwldzTYwkiubRV/iQRZq2fSpQbb+RMwDrxosAI2hpQw96fKx
         +SXgVWJ7aISfjZIfHvFxwGjNICyEsgIPq/CtByzMNPvz/fnGmXaYXpOu6Twc3TpjpG0j
         F+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439239; x=1789044039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBo5GglLSUf+2qKcbw0juE43gyDXKzXipzNkiqLKy4U=;
        b=lCN/hx/d2HI7d0oXGf4Sf4HX5YeO3in+Ummo4AptzjJhsPrNw2yHi2jadMMQVMp0Oq
         Y50U4T5bnsI5gXwaF24efelD3D5GFklTtihScSp0CmZIiQtJ2wPBv+wH8zNbXvuX2dyt
         GRioYORGBXgEtIv47t3Q9PV3/ELS3z8uwmT/yT3U8t/i26O7AiUUgdwbETKSf2b5bXRL
         GSRsUx1HKCs+X5bJ6sKuYSxTe5xBiQTHEnsZW3TOBc21GSYdd9AbTFfZfZ2uXubxIxtd
         pDmwQNhjooYyVoAXsGApPdR0KS9NI7mNKXZ/g9YlCXZQl2zGzt0wwmE+GTMi8Ome1oOu
         FDUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYltCf6Oq7uBbznyS3wEXW81DM4u41C0FjSs3P96bqm4NO+dfdRPKyKIpm1lqBNdAzaNvm7noldHaKWrykBDQM@lists.infradead.org
X-Gm-Message-State: AFuF++nbJQRBwovCmu88ZAgS08/vTfnvjEse88LdjKvcpPaasWUJ4WOd
	0J3m7oSV++3EuxQs8V4PRK07GCwM7GXziqGLzu1NyrLKddO+KXHo6CA2anbmeErUxKw=
X-Gm-Gg: AYBFou3extppnNO9vE+eiQvbZOIqOodeZzGONGhuxnnu6ai0fjKdqoutO2nF2V0eVQ2
	EhO7cebKlhdnOrW8koBpdq0sPM2z6EuBEdTBK7OwyG8uUgfve7T3iuYZEbbrH0jM2FkIwSHXDeN
	cz9xLK2Xc7uUCjcxH/jO1vAeWFPSJ7plgo8bfENN82JgXnxNOX4zH2TbQ2AekPzoaBQTlQLBD0A
	vNCnnHF7pO7DtVAomUb28ki1+pOiP0VF4FyytUX2eT1o6zwjJYL25BzuO7SBl5672qUovR81Nav
	LV269qgzhAx0DxfAf7j9JbN35N3R6yIoiXMlynAMmBnR73pKQKP3U865m78IrKzajw4AvkrX7TA
	eeQ5wNcU0iczzdASNM0wzgpqNsjlvrnBmBgzYhkOPLrkBchm/WAfo+nT8X7tYbRbgtCSNed+BMr
	jhYEuBeU13pmf5ysiepMgNNBnAXsrf6bd2iS/YeAiMc+iDhSkcrc7z6ZC4ug==
X-Received: by 2002:a05:6000:2dc8:b0:482:f270:65c5 with SMTP id ffacd0b85a97d-48488f07d61mr20646049f8f.9.1788439239541;
        Thu, 03 Sep 2026 05:40:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm14604419f8f.32.2026.09.03.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:39 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:24 +0200
Subject: [PATCH v8 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-3-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FoQ3XTwpNwKbtnfX5AvLGyDYALD0aJcqQzBoRSx3Yo8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZNO5Uvd3h/88vvRQg9XP+vqXkGdf8v0OGOy86893
 iU4qetpRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEykVpXhr4hH0ovjpwQOiRTe
 6Z7E2Fe4anWDQ2Pi1ySN30l6ZXczhRj+mcRuSgvSyF0+ce7blcJhL8VaPXg12/bYVG0WNGZIk2h
 gAAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054041_385658_E3777C3C 
X-CRM114-Status: GOOD (  12.00  )
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
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0


