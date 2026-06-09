Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5BDCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=; b=EFUfQSwoNtPjBNurH9s4rU2718
	3L/a/aV5762I1LqsRvdpAx6pLvOH+7VeKAMoUX1mmUgWqLQAr0coamjQQURZvp6tNOap6gAih3by7
	5eUTeR6j90HwAE69h1kqAVkNmfoDPwl/mtT4f3XIano5t+qri8zROCnvIc1LLI5z0hHM/jFk4MKy9
	pknTIjYma8f4lbFSN0OWQ+CzZfWhyhwzWh3Eynnl9HyFwZka5H47Ui61SWgrWfzW5nBWHchcUh5Qs
	l8CrKPELDMZcLh6SREZcr4WIwOjfbVg9dDJl6ZuCmr4zImCO4k2x6bHG6DB0H0EpXwW+H8CcLe8Ss
	+xPgqlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eL-00000006EYM-29an;
	Tue, 09 Jun 2026 18:58:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eD-00000006ENV-0C91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:58:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so48956775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031479; x=1781636279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=oxm2mD66BhSr/ux7DGIc9ph9xuawEQY1CID6hr5V8qkP+y8YJSe5Egppx5ylUyAJrU
         FM5HmcnR+k++W1qCG0Q615lWAf0vJbdj4U7kbg5JJziLjLyZhn8qi1bP/NT4lkBa2rta
         BHbT7wJcPYWQDyqkFNN8MDQF99bbLRlOTHl+t91PryhIBUF3brRqTzMq8gi/9JjU7EfK
         a3Dq32M1gW98gfK9vYM90D2Lv2YTqkxiBjj+nao1dqwD6jipQfXDXtjmIhT2rkQVc6e4
         9ZBogx02DOKRq94V4+mQAGE661WQ6U82WaOeIYVhRV8MtxlXmOgLZiRrmvTH5LwOQkik
         Axiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031479; x=1781636279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=ecghCVyCb9HU1k6Gez4QF69moBcmWSQqaeE3P36nEqY2tb54HFZ23iRmzgmf374WQc
         9O7Xgy97ow0uhh8VYxzuA4URjau2TyXCDoaKzo4hsry1r3rlRS18c4y0jiK3aEZ+3C8J
         mJhxgklroMeeTj6fZFllPYLKy7BfK9a7WruLmLl79Q2L2QyuLKfvuoa8k+Cyq4PH7PNG
         mBqSL4PYVXb1UYLRkFG9vbBt7Wbz/7MA55uAVtZhrxVq+OdsxQ3YbDpvUv+9f2ceNheB
         bc0z1vUD9Z2o6Wz8ZP4QiKtAMWIOg++lyG6+Pi+1GHZxA3Oa+UrJYGZffHdBG1yGkpFF
         yUxw==
X-Forwarded-Encrypted: i=1; AFNElJ/PpOZcFTowNR6QXrQUjBltjxFlHtu6P1sLKP3p6/mL5CiWyUwafBgLlvHIEHYeYP+VnBbCpkvkhhnOFNwSfY2+@lists.infradead.org
X-Gm-Message-State: AOJu0YyKa0bF9D0M5rxlLr3bdIXpXtdo1wRLlR4tcDbMQ4Q2cr8HRSNx
	4Ql1ovOll57cFZqI/2p0qTozR3vCdmiEr29CyWjgGk3JyPJECE7uoDwXFAUmk4Ow5Rw=
X-Gm-Gg: Acq92OEfxGydrYDByatvlJTY3gTu2JNoXbDEiB1TBTNGfWV/bVizF8gw1tVWcAt4FU/
	g2ZzGZQTHbprfOVNnpfaMMQ6jIQWoM+YgCpdGH9u36+X4wTh/dZdZXa+CNnz9vyiJwjHO/zPOjg
	5/ZHTzX0WEAt0HznqZJxWWbAwXWzU/2hMEGbmGHT2n23eRB3/oadEK63yC+b5GF3ia++4Pe8yOQ
	diBJ1LZD+/jCAdquhC8iHHrFcFpFPXSfwiJ2Rv6q3J2gm1+qRj2xSpj/5ReXk7+dZrMb+yZGwtq
	QvIokwkBbUrU0gACBdRp7UhoZadzudCG6SV1ujQtsmG7ajYseonYVehnLkYJqetlfKzMaWORQCl
	Z9kVOXk3MXCzQCei938NP4pxj6WoptofPGdInRp2UN/rLtOtHokWC8kdmzySTJISnNL+xfNP4+f
	Z2/DHyqRoZRa/G/nn6G/gZSj/nZrJWZ3bwqbEzBLmeKQ==
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490c25b1243mr373855055e9.12.1781031479156;
        Tue, 09 Jun 2026 11:57:59 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm669863455e9.4.2026.06.09.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:58 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:22 +0200
Subject: [PATCH v6 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split
 r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-10-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJAnPkzlmVYsqN07JvzNbrfPpv2PhmhF5y5eu6Y2vl
 tKZ/K+xo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYS3MzwT2nPj5Mbis2maiv9
 +Joq7ndj+pynL49abZCNi+vj9P3Y4sbI8H/fe+1nU255qK0Xe6T3cXn0tsUdH498uye+eve7l1q
 3dnEAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115801_816015_EE1B5ADA 
X-CRM114-Status: GOOD (  11.77  )
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

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index f77651109564224408723b72baba93e39a82be07..8f7409da83392d2d1f160a9645ef4d68f7aaa1bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 

-- 
2.53.0


