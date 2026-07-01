Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58ECC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=; b=CzqP5y1o8WV5ophDV9KbzAfCP0
	zHPKvg5n92d+FrrpZ8ZXQafRF2tBpePGluVKdt2hTJb+GVxRbQN7eadZx5kgpavi2hNvhT8ssuagy
	Ml2NIcpLGOfdvZx/HRzFHrMgY++G1uFNl/AI5gj9Tk2Ywrf+mCuHxmdFNyuu/2LACwSETfxG9ZLzI
	7ce2XpRjIFcCHgoIkB7lFfztdM125pf209O5SEbbqaBeeD7VZxSahn37BkoUGgJhTaUHBgsUmdz4/
	P4+/J1dr99/3s3HjEJa3JPg0t2bDEwQk9g3xZQAQhShOafdpG1gjPY7rcpyyLRYwvgbCMmGynf1uY
	pDns+SHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFV-000000021UW-1kCr;
	Wed, 01 Jul 2026 12:41:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFR-000000021Os-2peA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:41:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so3256625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909660; x=1783514460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=GVCn1GzSr9CY11QLp1HF6kC067OiPDpuEiAS85i5FWDx3y1M9GARh9egmRVRDugTIp
         5D+EVLqHp8XFXFDAcP4WT6cjSX4mKS8R0KdIzYawmtNVdxRzn09v2zmnXM+LULo0DkLl
         DIHn7BQVVsVbeiEZn6NTjk5KRW+qvxuP20yerpclN7iFIExNE4LkoGP3K4otfoGOeo+R
         ihtxQkqw+dottAk3qGiMyCWPxp3nykzG+5LkPjDIc4ckIGJoaAP/5vF0JRtQSPRt6SN5
         3h486PjP3yrb+4gZ0ZOAciFH8cFy8GCphJPdhijFuS4lwwPO7SFhHkT9Ide5wwYjdrrr
         I3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909660; x=1783514460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=TJytPT6Cz17WBRe2vnEfQ3Rds7QQFNJdpYdga6SzS4kJpNzFe3fAe1UlLBkc0r/syW
         TGDPEFJKeAmEK3IUzjBS6Ttu8I6UHhvSn1PuZnG2aJZkXB+bnGnN5kYYaRgr3zQUpxow
         9QhlJjzx/9xwtWw8E7U0o1GYd2IXwJ59Q6mz0+3JsoKn279XIheZvXAFSIoofwcc1IlQ
         /yjDQc9HmQjl3oLfF3JsmjQPV1MMYcJ4K69B3kjdWthNIYKezabiLrqbqTKHPE3nqfy4
         zRJRvG19x4vwKHqz6Xo+p3N8AiKRt6R+6JlGPXOwg67UpkloSSk350cwUhdDfDSDK3z0
         ej0w==
X-Forwarded-Encrypted: i=1; AFNElJ89xhuTk12BW3/rrtKY5Ndc5/y2KkE6L2oAs/9d/OFTdX9XPUlKkTdcbniUdvMczW+22ZWynEvRHTwYaWHox0c3@lists.infradead.org
X-Gm-Message-State: AOJu0YxHTirZmCiYrbeD++nzsGbj5mh4FQmfBBIp/ZP+cZ7DbcVY1sQY
	8AdH9BnHX0vK4eESW9ZOFy0Qci+7M3Yu57m3z6MslDpZgTo4zpyhmkngzb5bsbREHSw=
X-Gm-Gg: AfdE7cm8Jn7WRjRre3WZNbMfwatlBA6dFR6m9VRcbhpax1tpBLibQtG4NNeIiySp4Cp
	uTSatSgD9WPf9UnoviHx6nGhIyqpQZMJgNxDTDucbU1zskwT0+3wCRXym7pRuIaAG2ozLoljoe7
	bSz/f1FtyKMp1mNCrJhlbHJ+PHpbLNAoX11M7vCCpr+GWGe/W5vyFGesVaZHB3/NA1toGtm4L9c
	rwGnJx49jSAX5AbnTz5GeM8SLxNvHe9wznfqhF7EzRCRq05NElAECVHuwHD/3Cm4V3ceVk+pV5n
	SBzcL4+463bA6RQSrXg9yYxv0YagkTPvONtNti7duAGCAEoCM0I4DQixCt1wEYsEd1AnzJ5XT4Q
	6i8NhgcR3UTRKnzzc22w5bLDsaYKjSmgb1U2kOD37Z3WilreEVcn/cus5uz1PCoVUjf1tW8tTIr
	anQFM7SKHfgQ==
X-Received: by 2002:a05:600c:64c5:b0:493:c3e0:99ab with SMTP id 5b1f17b1804b1-493c3e099bbmr6525025e9.25.1782909659880;
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm16706618f8f.7.2026.07.01.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:21 +0200
Subject: [PATCH v7 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrm2V9Rw2Z3rP77/8pCBdKe/tOcddbSVHbPe5CB/+v
 l5159/zHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRJ7sZGa7/n+/tk6GguC0o
 ZvLfCWzPV95U3Jofu2fT7BsbamzaOK0Y/lee19j38anq1PbuTLeM/QyrpLwC5na7+u2/p266gu/
 5KR4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054101_750836_2F872D4D 
X-CRM114-Status: GOOD (  12.30  )
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


