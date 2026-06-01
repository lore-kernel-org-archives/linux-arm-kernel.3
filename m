Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AC8CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=; b=rbwehk06zRGBQJjmY1uYZQJj5K
	1krxM40GzWesjGFtbTnZ4c+bF4zgykVyrfPnnwTYSxWLaV7ddlfqZImW+lYGmOzM3HtHNO5nV0+NA
	dlRA5FC6ekfDwa3Rq6AjkAZ4mCVxvsBLezQk2Z7DwFjnmLLjw9DAtg1NJxsDndpZfkH4x3QXKzrv1
	Q1O6t4qnF2x6069RceOrvqhYcYznLBgbdNmbOdzXJHHmUHAIdPDzOudnFNZis3it2RRZLZkBDdYXL
	yuygFoWin+Q6SzUdlr+ASbz1WFkCe1nfr2LrjFeKXXYUFtxKwc3bX8AcjUUA+LjjjjYlctzpzS/BK
	cNVI2yPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIX-0000000AP8s-0V5N;
	Mon, 01 Jun 2026 08:47:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIV-0000000AP79-0BuY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:47:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1818737f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303617; x=1780908417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=kB6S3SqhIGHo/LltbHcFLcG9BcV/USukGpliOTF5i4V4uUzgXX4HAmDiEfJSdkMxMd
         uKBKJ9euoGMl2KKYjMOI28EdtZTLSmAjJknzBTdfyTfvNnm7ELy71LrpN++o4fPXxDKZ
         KbukoWNMAY2wujVizE8LN4ijMQQ41VS/KKI0anrP2fxJFb92IBDth39yCimAFXkGdVUx
         NodHhGGUSOSdd69++sE4Xpz0zFpsUcrCK7FmJjjYeHWLwN9JwdaUG0mria9obV8BBHhM
         R9isXCVtuvOKg1MssdNsT0y5/BIouIdUS7RRYsyhIVBP/b9K+bvlFOWpySim35Jf3PdL
         ZAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303617; x=1780908417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=Or7VFLF8TPg/FAf2tICvPvlXTZce5cudgWWobwonbsApBcZgtjY6SN0ygrb+Wxyv0/
         K7adevKfIIJIybN3U7AR2jqMFzhO/hiiPrOKhSSli4+TmjLjIdXCCrXKkMb2/fbni8vF
         rZKyQOzGPk8dvVfTywRbVAn8gRpDPGbaUCF4mWROOWL7FXRqGr2ikKT6rujLgTNb+8ab
         NAWlpJfBFHsz7kSr0sxXB+tCayt0aMNM+6pIWqgn4khkT/Ta/yehrILQjcFwvUhUhEE2
         /PWj4UHgEAJ5leG/NQk+3w1X06iyYO4bgTCp3jJj58ECQzGtRFAwHy3e1YBg68rwZam/
         z8Kg==
X-Forwarded-Encrypted: i=1; AFNElJ9KWPmwRM5LKXovbd0ug2MZNwpUVndQS8x5F+oEbLdK2ZF0m6R+jH3lJT9/1AKfEt1BHJSi5Mw5vFGnYjbYPqWO@lists.infradead.org
X-Gm-Message-State: AOJu0YzS9gDeNjNXSlZjVPa82/6rQDLSsiRgD76614M1dJYTiqR7KfPm
	12Jz6aCrjkLZUsKVAc+7wEac7ZFxBx8YAdC2RJ5AqjnPl1ax8EtkxhjxOmt8QbHcNYg=
X-Gm-Gg: Acq92OHPFSN6cNp9nM/ly9uS3LsSv5NJpiNU7znhLk2ZWXA9M4RVFMSn+Iv0LiE8l1b
	a5/cAWGTo1Qa8V6hFUZeInUhMeNGL/yMM6RMeS4IRSpV+AW3l25LeAoeLoySe80nTcsiewxc0BC
	/C//l0YzOV90CI9MEXYCBjX6rf+dJdrKyPH33EqfuDfUPp41o1lCfHlGVMR+nwAc8+122juyxoT
	3fGEI67/atCxzqMP3Zhx3ns75CZ9XxQ52ezzyVxK6p5vcQq1HD3KBjMiKNpPBjKRkEgZs5bX7+w
	Gjk3Nsvl3lFwd4sOQumWSM4mTmb0xJUk+uEr//QuJIyKyxDVFoks737l/AQOu8eIIk1GPUFoAwt
	eoL3oJoZSjgH4OfnXVav9bTJqBrACH2E6bGRr2LQyTnPHP2Lm3l8NTVaTZCXvEbNSNDMTURPgoN
	6opGSyVIMm2uu9+BY0ctMj06HU0bgOhWY=
X-Received: by 2002:adf:f690:0:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-45ef6b8043fmr14522597f8f.35.1780303617148;
        Mon, 01 Jun 2026 01:46:57 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm24643087f8f.6.2026.06.01.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:13 +0200
Subject: [PATCH v5 2/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup
 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-2-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=msp@baylibre.com;
 h=from:subject:message-id; bh=AoejhMWFhhzgn/Oz1rWsnXYdKgFZw/QDwGfYGclplaY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZtyeNteuPBxa8rFt5Z9XjE+YVkfu+bz7jIXOr2efYi
 qbs9HbdjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjItO8M/1PPJGUU8XqX3rLS
 S77JW1LPsfzcgt13Lrx/t+LWk/7zN+4zMvzlePJnz72ftwuNHNxyvvpZ316fa3tDadlhf415+nK
 vlnAAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014659_111869_C097C56D 
X-CRM114-Status: GOOD (  12.29  )
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

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..12902231e58a7a958f335096047b0d2384dee722 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -17,6 +17,18 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,18 +49,6 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;

-- 
2.53.0


