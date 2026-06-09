Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A772CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=; b=cCtiDJpr5e2VlovVcH+jdv7SqV
	qhZWazrp3IPgQIvhAJ/y4txVs+Lxi5ytGweJINdLTKZg7ZQ3sbpIbTEIicfyze2l9bJ8d4Po1mlvD
	RfAUk0NZfMgn0SpH59VL0jlDyzx+Uu4+B+7DDQ7tJNU4qsZuuwA7HA7MUZnH1n63Efxl/8xJaff3Z
	c1Y072pDk24qnnhs7XBHgxmf6XgwfHMEOctXMmgfHo4BJMhH/gyGF7v0hLXRMXgpt//6jQ1GxhnbO
	n3dJ2RM89rlWsQ/6sVNJ4mGrl5RpBB6APO/Ec+rVXd90HgVOhClwfIv2qONQCUp7xNlfYkQF6Mb4B
	MrgNMx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eL-00000006EXO-0jSQ;
	Tue, 09 Jun 2026 18:58:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eB-00000006EMP-3HXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:58:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso42370695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031478; x=1781636278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=Wg7QwIHZ1+GYuWFi54xVTPZRmKMlrYScPM3+8jcKwzwQWRsS8xlJymivxJWfFTC/4K
         421E5DsgYdkfpzBBCsHUhNrAQfBCcD+Ut3bOaGC4g2O2V1m/Nkx6QtllNhLp+pVFtyR+
         moGQ2wjF2F7kJP9oCDfLBpblSJeAXnsnzFiAaO0ZOwy017zfiXs7CdepR5mpYUsaYk+I
         zsv1HZa3OUzh69igNrNz4J2nkFHdP9HDFU2kMldoQReOB4RXjFUX2CZB3X0i1HFRD1Mh
         Ia7duqm9FsTqLbkEOrVJY2XLz440jqs1CpvzGalN/lNOOjTxPMZgXUhj2yG1bUd4mY+o
         ibPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031478; x=1781636278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=N6+xyjryyFQ8PVG9mkR/DK7ROIIrAdalHG1UIF631t3yNshZYLNPpdZSPiyq3V2lq3
         VHfyh+uB6Dda+FIaIUnXEMI7nrSnYF3rjdDaT8rmOaXxjTDhwES79QOoT+zhgKWMJpSn
         r+upUy8ylZeo4GBZoSqMR7V/RbZcxzmRzvF3TfKuekBG0oBSSiWTT5OscTIKIuc5YRND
         /8UzdlWbZMRfBF+GkgAZt91EXrbXf77XoJvKXLixKzMjm91D5DHHd1qiY8Tvhj+nfGvP
         05dRbVKA4vYn7eMQELQbNZWsPFSMhxg5AdDXx9dZU7jMARNl7Zhm2JvuMQIC1yA/p6Z6
         eKXg==
X-Forwarded-Encrypted: i=1; AFNElJ8iXR/9GWCA7JY6tAc7/A7c9ljVMeNNLPYhyItT+nSXtueEM2IfphA18ywm0R4qChHhLuM6aXrDOVzTMCdHYYbE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9l4eh/A8puDgLA6+ZUV/Y0Nzesz/1NM+CqztkNdjD+QWNXv8l
	HUt5GzrtMZnrgrvFMPoUGrOxEVEdJ0OhTNLaJ6aXoRgUWqK6cJjZm4YLeST5M4lDF7Y=
X-Gm-Gg: Acq92OE4ik9SCHFKYVyV5gZ/O/+ma5UZO0LiW3eA+8XucjrTd20TcNe96o6Y23CaYZ9
	S8d+NtqfDQyFKo16QRZoHJ0GzOurrragrSdrDHCyybUbi1KbPKhu0abiRUNFSR26GzwOfrThGft
	jfIWbxg1wTuV/87bz3FR8aJ6F0udRdVmbifm/1HEGowzsZkfvJj64aHJr6ztYgJKlMrrCyl1wbD
	Y7as9u9ukHYkQ5TVUB5/1kVYvswSLCBngpJ1+UGtNFP5Qwesif2Oyxkt9Bk5IwGopiTJJtX4QaM
	zH3BUUjLR41ns0mztGGIgyW7bIOVwMEA7poaumQ14id+xKzQaxkyBDq/nKCjiz1lVafM3PHDD7c
	RLxdY2JScIGV6z7zNL7IeCMzCOEbRtgmRJbcQ9GioLfxdqprYMDTgWIM7Pd6bLT+eTgm2M0MUlO
	3g9vEl6XLqhgv49o0FcFCuGbY9ce2q50E=
X-Received: by 2002:a05:600c:4fcb:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-490d354d32amr103004255e9.29.1781031477905;
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm532638485e9.1.2026.06.09.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:21 +0200
Subject: [PATCH v6 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-9-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJMFXZ+pacm/OZbQ4f/QOa2PlGzFF428M5098WJgfd
 MGL/41IRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEzkFBvDX/FHq17fXqD568p6
 jwnZT9mV11fnz81kfN0uHt7eN1fusCgjQ4OyUO7TbT6+G+1OiPw6+/y/1Z29arqNErWz/zmmVE+
 UZQYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115759_973261_C86CCB3F 
X-CRM114-Status: GOOD (  11.81  )
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
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 682b1c9f3071ddf23044c1fde1e88f2b901ec64c..fe10d3e75ceee35f84d34b892f9925efceb7743a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d00000>;
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
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
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
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0


