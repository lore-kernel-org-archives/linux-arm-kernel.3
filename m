Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3153CD98CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=; b=rli8Y2aqivSW2Vq7uhnuByEYpH
	D3fljsdztKUsjiGPonNeL1QNaBjFZSMMme9HlVNhr5/CvP70fD898iGTdFOV+nq4fXLGxvUhaRr0g
	54MUxwkiJxQsQZ3tc5ja61chGxajaPPPc2RLCdbVNK6G4VsxUxRqfvHuhYJ0fn3AzAR4a1q+KRhk5
	jpZOxgQITVwLAVA0Y2rhtvrLWMIt3oXfIy8Pic7vQF5WKQ9shvIh6nE3XennyaQZqOFPsnejJ5xMW
	9GcpOTXnCHi/OQJKtvDKzj5Q2RPiTyZnGaLi21GAJe2v+oMrpasUr/aNpDTO9v7+vKuM2KzU0oKLw
	Xdz7Drvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eL-00000006EXv-1b8p;
	Tue, 09 Jun 2026 18:58:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eE-00000006EQ4-1evN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:58:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-460166910e6so3079388f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031480; x=1781636280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=C2geR3+cl1ZORPpa2L07yAh4NKdcJDfuLx4WewOBFUrsPQJaIeO1VisDIiTP8t7ajb
         GT0lv/hb4wcr9fA3bdfEeJqIoRGVThBFWxvHNSj4Er39zhgOHpgcueUOxMRoPvtnmnmA
         HliBLodTiLZNpZGpNvPJ1pbwHQ1/wCc5BeZ/1HQQuc/4izjPJXAA2MVqlfU1XPaY8GTl
         OskaYejVhKJ69uoHGASK8j0dnI2x1UtI6sCesutmT1DrFLNsVZVFWbzg3RUvaSWEFOFx
         l5k/T3Wk2MYhNmoDisUadhAyngye4Jz8SDqDjhC/fPeOQxlmSoPbUGxPRmGW83jTE5D6
         0gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031480; x=1781636280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=TZxml1VxzdiR+gcSYmAUZ8GQCDpRCMkP4+FjoAFmuOHIuDnfp9nSMUqUxfYndpZvyB
         4KPWFmqrEMrzgWomMY6eFJyDsHCvga6XDP5HMxasY1Khk3S1iFabV7HkFzrGWWQ22ujc
         E1i0vsFs2wywqY92pI0G+dovYY/5+JiBiPyd0S/QM0e4+47Sv0VhxVtHbyDWwyMbhKs0
         xeA4+fjD8X04kTA8Pt0IyE5zqv0icm2N7fBw/Rdvewqh+JlIeo3+8ha66ARoi1YMrlHw
         Um4fCZVae7breQH+spGm4i1+kFPXCJ9H/YNS3J9Tj7maiduOA49hbzs14RL43yN9p1Qe
         RUZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+o6uxKBk2PHnc1H7N9nsi8T13KqmzPMvvsrri1qV1TCjHjhwVUq8T41ECzqhJcXXNGvqRFM6AfDulDYVIWqWq4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8HgtVxV/pFOZIRMI7tSg18zz6IzPo5freWpd+5TDLaxeXx7/s
	RgAi2ac9MZg8fwXwxQ6JTJ8J6T69ByXTrn1ahpKHm2Rkp3yOAj3dBGXLzym6zBPU3EU=
X-Gm-Gg: Acq92OHItPC98Yuu4Zcdn2r26gg7K+1wpxqvoMcIIRkG3u92bg4mo6pAVm1SBkUbzUo
	PUUlcBjnEuawS+cep/6WGTUwa07cp+nztD//ffF9RK6LcuaFKGE/4bdeel8l5X1FtvhAdY8Vahc
	sBuqPdY04dQryaAIMy6KHab/zP4RQ3LR6xEse4VDdHR38Br8a8Qvqj2jOzoedgNmzyIdJL2Na6E
	h/vY9QQEdL4rDFLpsDWegY/3g/YG/WG2EPb3pHH3P2fRlMQeLj7yfMIowZl+R2KLXLReMFhZAZE
	/IJ9iYIXpoOJrtAfpfFzJwuj2D+Xt4XPl/QMn4seTEgRqUxXEdPagpvnfab71DZpcRiWPhlm9qa
	dHEr5nIHwqNKxJpQ87Y5CA7t+qlDDJpayklFtZnjH88O+JEqqJao1vjKrnK2SfXOI4WDNnLBKON
	Xm5fYSexpo6wSXLtFqXUsYkhPT9Y9wvaZUoNjxSR8rPw==
X-Received: by 2002:a5d:550f:0:b0:460:3233:f994 with SMTP id ffacd0b85a97d-4603233fa1fmr26772439f8f.43.1781031480394;
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50663559f8f.14.2026.06.09.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:23 +0200
Subject: [PATCH v6 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-11-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJIWtC9Wd2BVK7G1VZ8l/k5HMmsA25/PcSXd6/2gZ+
 f1sXHq/o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYy/wDD/7wDn10ljz4x7v5f
 x+0qqP7Fp+UFx/bzO2//fyb2UPHTo/sMf0V3LxBvKiy/5ByoVr9u0vdfkZOXN0z6r+Hv6Wy2VuL
 0DyYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115802_465788_0ED22F4E 
X-CRM114-Status: GOOD (  10.82  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0


