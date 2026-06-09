Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76333CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=; b=UIj1JihjRy8OxpIKahm2GDLYBz
	s7VukqTUbCBdASDprzfXlzKPFPuSYR3xUF/iQb3LEGsRB5UPw5frD2SPkJZ4Y0724VaL0GYr02QSB
	0NFEalAW7HlzHTTtjp00KQFbWzCXglRkM0ViFD4aHwDMbfl6mozCQ6XVvEfoshUviPx9A3UDUiUUj
	qeDU5E50gJMcWH5oxGUwwXu87ciN7OY3JLg/lTYWovEqBfOIB6vTKZ1E0XPQazdkXlELxG5SO5rUZ
	sK5cxKmq6SZNTSJtS+N+sOnDRCYtRPfYELSpvgoLp6HAsB2iy3IPA2J+Hjz2zFCH5AU9B9XT4hHpT
	kuvSMx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e6-00000006EK6-09vZ;
	Tue, 09 Jun 2026 18:57:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e2-00000006EIH-0IrV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so75398975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031468; x=1781636268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=dS5WCo6HgTINh1CLGOPMvUhwbHITkbiQMNj1FHzQni3hwspLqmKQrjH4v8NedXZP6J
         fxHorEIXRv2BD6b7nYMbHIarA7fdKCgWCXkEr06xus8JG30ANXWn/7UZDHheYTjl4QC4
         3RHtnzzc3Ndi7OOd+Y0oqz6mzEQ3iz+I9E6bkQGcvg56G50h2M6oSLBtBm/adlPFewuv
         hV4IAtkR0f9Vqodp8jKK+kx2lzKFZfa0JsJLVqVLWaQcNne/+S6Q7CguHnogr9CgEkyt
         LjActcPCo+h5lj2T3ms9DxaUnJ3Uo0qJzEFhknDh2sfk7qOHSJneVkDoxNdcXC6Qo0uX
         H25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031468; x=1781636268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=PZr/zK929wq+D311wvZ89bdof7Mx+MdA+RfGMSTvb2RZ64evNEIDfFennLJvycLrlU
         bKPKaHqXUH5Ni97Pc7y7uzG0JUrX16P6o5mKLl2TAbm7n3V0GQke6PX2z1ckeLE6EFKi
         PQmHbiIieHIFKiJQ/LeQ1Na9PRXGV7GxzTZlSViromnc+5mfmvYcrP0mnKnOsei/Xf7+
         ht5kp7pdIZcqLDwlB891eMXOsFXbCv2PspSPgQ36vjcBxg2gFHvNE8w1s9n4EYnhd3pS
         dcjWlyXxcmFL0VGT2j1CXfVp1lM3B2uOo4Z94RgHvPcH6+x8f0/BC8xM8U6+9E98hC+o
         55tA==
X-Forwarded-Encrypted: i=1; AFNElJ+528RYjV2YOkKUlIpxiUkoElE3yzgHPrd/QKctxWcMl2zQAkvxmmnvRRcB86HG60fZUCKV4IQp1W6cEqrqUu27@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+tp4X8OYwvBwwFbElqk+BhFmEHoyJ0dW85IQYkPCk1yTkOIkp
	VLWf8iChs3LuuLrZgoSIuZvrVfqsoU3AxlkCbZ/1H2MAXZWPJrY1148H0ZTOfu206ws=
X-Gm-Gg: Acq92OFokUrXRUdewUjrbWnlpjf3u0TikckNXoSaE01Hi05JzQwwdDJBa8UKGbxFL2e
	+T1ua/QIZFw4Rloe6/xF0iMIxb7i2NqtQnRTS8trLq7RHegIJ9FjIK027XMVFc4mRkUDnKU7nc8
	CGMsOc81s6OY+W7n1rJOysg7JKZ4aCe8P/sl8VjldIGJqkfM0vCpqNcJLX8aa3id0wY+F9nVax4
	W2SKV72GV9nM8EhI1thlMg2TtNu9dkr1BbN+KeOk9hwydNgpAUFlm0ZqMQJhlGoxx7F3s3q/Ini
	Hm/e654qnKbTb5GMtoN/NX3IccjCohiPq/Lr55Ga/tMnyi6tsSqLv8/jqaK3gBXHwv2cSwPeUZq
	W6n0uFylnZBKoldoDipzsJ6WiefurfoBx/vLp2t+XrlGwO12xCr3iPKnTayICqhyVS1N4Xu5ISv
	DPx3jXpUk/5aFYCSBXSxF7Bq/YIdRusPc=
X-Received: by 2002:a05:600c:8708:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-490da12f2aemr34538895e9.31.1781031468127;
        Tue, 09 Jun 2026 11:57:48 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm502660835e9.11.2026.06.09.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:14 +0200
Subject: [PATCH v6 02/11] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-2-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxHv5rW2dX4XX/JznPuf6uSMXnxsK6LKU8go/vHbmn
 /SxEkODjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIYWWG/wGu1uI6LjrqD+0i
 d7RL/3k4teXyjqxl4S1HuJ8f/94zp42RoSXKiOHGAWPJzyJadza6pMt0L1+2+EjpNKtdC64ZOaS
 XMgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115750_350406_810CAAF7 
X-CRM114-Status: GOOD (  11.44  )
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..463a3f6130b8f2927a032137e87c01df446cffda 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.53.0


