Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9kAKGrTcmFW8zg/JInwrxzbrVCAryTZxYifDtObYVxc=; b=qTnLLceYoXZ2L5kqnPFao4JnS1
	w7gk0Dw3gatMB74SyJme06eNrYSDVgznU+O7AzN5+z7bEkHYMa0uBZCx3N9rCYgZan4HlQcvPJO5s
	jYMep43vIF9xJypD4jek4Gpg3zFyEOGgBcxbyjVD3ao2coi6zlWtxGB4i84XY6CAeErUB3vPaX2Ze
	yylrhf0ZQeEc4u5T376OWvRWkOFMDDVe/3p3d3jOCKYni0mbGiymU2ulbxO9K1QciKD4hTX0M0hsn
	MmT8VStl9Qf/YGBcaXckgfcKvec0YeJpAE6T2AJAOnU7vj0uxmJo8bTpoARUtD5vUHcBKXxPwsjc5
	P5SP6kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1k-0000000BkZE-3ZVc;
	Tue, 19 Aug 2025 22:42:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoS6O-0000000BRBp-0fVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:34:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e39ec6e05so3745390b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755632075; x=1756236875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kAKGrTcmFW8zg/JInwrxzbrVCAryTZxYifDtObYVxc=;
        b=F6nQRLXjGfKNW7QY8NKFUhm1M2ax/csJQh8m6VhKGsGp3yOdiXt0Aucb5XeUJ53uXI
         Zd3UwVeNedTRxPwhM6I7mo/LYjbY2ubyhTb0uTvB+oi/Uwuxyw/ddd5dO9Ls4r+g8Wkc
         HQHYi6AOE0asyjCgQ6xgjt2nRdzvJa8cCnZkaS4YJ1N+Y+nOQ50JK8gyGLsQQ/5uQ1Z2
         2JlMt7ujzyib3uGTyoyuqnQaaGfZJUfuJ4r8W0m9V+FPTQm5PxvfOsypBBfll1Wn/IFn
         n1EvD10vuv/l8iOPI80/7RTdysV2VRdjPeM5Z+MJRLGfvGYb+J+JuVaST0fw0KVIo+u7
         pTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632075; x=1756236875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kAKGrTcmFW8zg/JInwrxzbrVCAryTZxYifDtObYVxc=;
        b=IhrA8Y80Ro0tLsWkHfqpS6pR3/JAHuYC8jeS54w14ijjMKtCK2T0Ej31E2TQ2nlj0R
         KSCLKVR3VTottxi3KdmbBkZVWmTsZQ3bmMg3A/NO7gHvW1s0CYYp8m38rHyO8SNjRTXB
         3dFINWtaP9DlNI04O5niTXG3CXpBqwsb6+DJSxevv4NVY0lIZggIZu/DeoLQgfy+y/uZ
         Qb771M6b+Jb47NhAw3QPiRd7h6P0pBp3eBqtJ4Bg8+JntY+d/WZr2rcbHQ7WHgQS/cZ5
         Gc7nDSH9iBz52+gSD10uU8mgrxwrpQHUYHJ9xt6M32tcPZWxfGB1yuJ87eb/IUn+lUGa
         WCCA==
X-Forwarded-Encrypted: i=1; AJvYcCVuGeSFuBAvzKqnc72qoV6vJr/QqhQ0qDZkViQ1KWU7nN51cgT5LhegPGou9Cn2n8kObIadItm+2zRhkc438PwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxM5DVLop2Ck/nCei0vVuTtrgf75ylKW5AvDPD3efIuv/3Njfok
	vFXT0J895VVQeYycZaTtgwmn3rXhck6PX75eM4weAF3FyEkFQ6n92vdO
X-Gm-Gg: ASbGncubQDPTUnxqQnaG1pMK8bkpb66RKVrt8RuvxlcQ2rEDQEX5I1bpYND5XPBgU8S
	P/nOFAQCfMdZw9r/1No8RyrScEkiKgZJ83dSXIt1c4z/tT/hYQoq5zqKYXZ+2ViscHeSdJwWItO
	RoI79w7Dg7xQg2Ml186xsuVMVJpSIUgnBlBXEH3IiCY1UUaZdxoIP94pXpXiwjNwBO+5CkS2fcK
	3HbPumMrI2+ziI+h3AnTyQnO7m+8xcvi3GLyL220xUXcpOsUzi/ulJPwjJEWPAa+v7iHpx7xTrj
	b261KzISxJP2dnbOSjQUE1jhqD8VAgvb24At3eHBie+pAQk4m4L4i1R2YW5ITocxibPPmNM12h9
	CyXa6aN3a0nmeVvbrULiw8cRZ2xbafK9D00VPjKdQrH4HpCs=
X-Google-Smtp-Source: AGHT+IFlNaiEPMv1znSV1sVGNNJRUasB3ZoVmWPbvCQJbjrYFbfkF1TDDm7fwxcIC5IM3kAKWJqGdA==
X-Received: by 2002:a05:6a20:3d89:b0:240:66:bfbf with SMTP id adf61e73a8af0-2431b9938ddmr690089637.32.1755632075213;
        Tue, 19 Aug 2025 12:34:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3ce6:43aa:f6b8:33fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d54ae99sm3182390b3a.101.2025.08.19.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:34:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: stefan@agner.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: vf: Change the pinctrl node name
Date: Tue, 19 Aug 2025 16:34:05 -0300
Message-Id: <20250819193405.2847808-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_123436_195325_4E984B89 
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

fsl,vf610-iomuxc.yaml references pinctrl.yaml, which only allows the node
to be either 'pinctrl' or 'pinmux'.

Change the node name to 'pinctrl' to fix the following dt-schema
warning: 

iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 124003c0be26..19de9506e0c8 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -304,7 +304,7 @@ qspi0: spi@40044000 {
 				status = "disabled";
 			};
 
-			iomuxc: iomuxc@40048000 {
+			iomuxc: pinctrl@40048000 {
 				compatible = "fsl,vf610-iomuxc";
 				reg = <0x40048000 0x1000>;
 			};
-- 
2.34.1


