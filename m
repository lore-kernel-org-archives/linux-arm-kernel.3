Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC7ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIGyw55gr+o/mTTrd5VtOCBTeJy77S+WAVT74ILfpWo=; b=tHuIB04rbXptrvU+NfT4Qj/VUR
	IyjEre65JjeAVqGQ5pTrGeWTJdrpxmNtuWo1SRWkiqQhHhsPAfZgAQLeD53eEKdLLN3pWnI3+MN98
	HJmBuZ0dgLjlymMxbdIJj0wKKojX71RqL1VtHnSHbUzHhEQOyxnaP3PYe/mYOL+8JlBajHTQrUs4E
	JJaLqjDBU22j41Nft/P+LAPalFCL+kcu+2LR0f/ECQ4AxpSk+ix0rWyh+h+9+2MDPr7OixqxU/N51
	hEWnzSD1AFgEkShTlFIAM/3TnAI900KdNHK65jPyl3JfoFnq/f8tckyBGlAEDUjH0Rbq/wWbFbGxR
	eiE/kNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eC-00000006EOh-1wdp;
	Tue, 09 Jun 2026 18:58:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e7-00000006EKR-3uGF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4908b92904fso68012175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031474; x=1781636274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIGyw55gr+o/mTTrd5VtOCBTeJy77S+WAVT74ILfpWo=;
        b=OduvUNma6eVqtT/aGQkQ0YatEi0liP/SI+tvh2ZCysN9Bb7oGiCRjTjXrbIogVs6ZH
         vjOOSKAFPi7UTACum+3/KucJVONah7/1LNdz2RELFU8jaLiTuE5xl6n1NXHZ0GeX6chL
         a1ouTj6Y3lcO9JcKDUshudejlGm8KCXnuyxBw6wslCL/hUF9Py/34CTNAQ/jxUOxTVY3
         1n7ish0Hlt76a/gOFy1SIC92dZDcONkM0mP3WryVBhIFxEsiJUW3WJNxJq/dOheMmuif
         jwOpbFltJbbJDx1veKSday0T5UosgYRf4CTEfNfcxM7p+QxaKMF1vfIhGPSze4xtoAno
         fSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031474; x=1781636274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIGyw55gr+o/mTTrd5VtOCBTeJy77S+WAVT74ILfpWo=;
        b=DJbzhgjrffgjXASuoeUZ3Ly95TXJMaJVaoXwc99vFbnIDHXl1z08U4ZBUSiwSx3vAd
         rETP04pFjMkgzCoZq/U3k14Yyf2iYcM/MmALaVBzE052PQzyH/KomD7hR6S+HRbliuiG
         YvIfeBX8vVWAz+5lgrZDAv7gfCF1v+uxJ7rmCoaoZdHxJ35v99mAGbpBN3eGbvCOb3mM
         Q47DSd/iAMBhHuAwDSO66zVA2VYIrGsgmHbpSkwtPjdQoHbM8Dlrswy/hzDLWBufs9EJ
         wPflBFDnVT7xfpwaxkSOaScZn18PAPeZPwrfumJG3P9d5K/tqC+90R0K7StHNlNkYp4L
         R5hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qtKyDDrOl3r1WuJvmnQ7ebXx+PntOyPMskAzIERnrYcDHVqHXh5SZME8hUJ1yEEYI2vsX9G/1vwPGAWYAkRSQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy84jdrFibCEE0O3GLNfrIlu7e/fr7Ee/UadRRh2KXz8jdaoMSk
	Z2r82Ql3cI/bs7UhREelL+YeCljUuBNEbB277hkGXEqC7wvodV80j4IS7bJlTd8P54Q=
X-Gm-Gg: Acq92OH2r+e7CrMY9dhLBEGWS1IBWiIh6c2M7muYihE4vHxFzFm7eQS7pVSQveyH40r
	kbFWdV1GRHKhnZTBKYZts+AJTgf+Hcmk9kMGSuy/HqOH2FDgx8idcsf/ZcfocIKRE3X1Vmhyzal
	EwJQRO9sOFbSNY6Xca1ixFvZGTTNvdSdRRl91pd21fHhzCfm1+TYVWzrcMdATsWVp6rdbtoCx2b
	TR2JbFeeq/ZcjVbbWrfEcj5htuxFrvorGq2tmFgzEVn8uLhan9m0fITNtGfppxwB3NTidLR9EL/
	JXQTkFSKprVXcXV/nas++6hM8VM2IJGCagJlRWt8DMSpHT8asHnlH/fS+tdBrqr8bQI9JIWA6Tg
	BFWWb7dlJekJ4C/oI/s/4HOK1YOZ3oHqeXAzrPD1N1niFM/0CXj0+OrBc8yHY6/3JSjxcnbwqc6
	RK4WtY0ZFUz1zVkxJvFHBvDHcvz0zXdho=
X-Received: by 2002:a05:600c:1c1e:b0:490:bccf:2bd6 with SMTP id 5b1f17b1804b1-490c25f1143mr382617355e9.15.1781031474062;
        Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm115761801f8f.29.2026.06.09.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:53 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:18 +0200
Subject: [PATCH v6 06/11] arm64: dts: ti: var-som-am62p: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-6-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Va2zbEz9TKLMhjd4+lKIbcWm/Y3rt8hiIFx5KPgP0CI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxD+T9tTsEbg7Y6urV7CpdvWjU3Pe8W2e9Xyx5+tiu
 YyW4+WFHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRR+sZ/jsz9Z2pSSv/6Sex
 r7n7vfbaMO9nf/UPb2Zue7Zr7s1n3ssYGTb5l14W/Pf0r/JL7s5DAe8USk0tbrjtVVVXCb99u7x
 hOwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115756_002245_B1E8794D 
X-CRM114-Status: GOOD (  11.35  )
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


