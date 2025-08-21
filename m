Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E563CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjhHptinaxWWJO0WWsGKsxwtJOMywvKfSlqr/lw9SPs=; b=iZkPVNQ92PVdM48ju0DtiVDk2j
	v2gbX8s3hk32IClxwE7upoBeuhAyWuUiVSTnmgdfh7AZh5bswmNmLGmid8psBRm2441kw+1ZLMTnR
	LiiiKKRO0yz5oywfMGJCNmFjcc4yXV/3hRoBg6FHlYWceOUNhR+6tJTf2JhEiE8zGP16WZ77xvsNQ
	AeiEOsuSxLFYDUmCqA5vFRmkLS7UP5yv4yxXewlHTBCThpCAUgpACF6hZHsJi8L1n/wctzQXB90eC
	4LDe/YUCRCT9r0JFhbGdi7qlT6wPosgnIIu/TOUqpIA2bo0RWR1uHL2u8K10SvMd04pG0Qd8Ld/9U
	HJZUodCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5Xi-0000000H5fn-0pQO;
	Thu, 21 Aug 2025 13:41:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2yV-0000000Gg0F-2VaH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:56:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso125585866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773814; x=1756378614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjhHptinaxWWJO0WWsGKsxwtJOMywvKfSlqr/lw9SPs=;
        b=MzpAe2EKlGbYZR8nl+RVwwp1BIj8Uyia9o0uMXlstRvPKGJbdYkURHwepwPMTJkeBC
         V99L2FO0gFJv+pAOIjvtp9CUyJXBthGgNLqJyOYNcJ69ZxlrdfA9MHkeb9jjwak7Bwju
         cjebUdQhrCD88oX7CVg9o66AFU2udMXaz2pHqE4XPEDPTcdAneONiQ2ha/oIBiWAw71d
         ofaZ/MY7T8g8q6dXKAIcT88rDt9Quau7/egXFJdYOnlNTyBmslwOxYHO+wVeDqLK/E00
         sFw9orNrEYxTC2jDkUBGYOR1r2VZ2F5kLpsjJANX5Kj14F7tUnG23+XY2K2qy4XS1qIZ
         UThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773814; x=1756378614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjhHptinaxWWJO0WWsGKsxwtJOMywvKfSlqr/lw9SPs=;
        b=eWkbh58nhlO3D+dIsYtJKAq1Mipr+Ii5y+iCDyl1ZVMg2sxEZTL1x1wFdstwIHnbVJ
         O3CBho9/+NvbD39B/fcV54PfzMr9g9eotImVa0InNJFbc0BbuqZG3CGBWREMuR0OFQ0A
         9yfT7RAZB1RcmEvhZlzmhYxAm8nOkvLDPEioIgwXkdHDeJ2GxE6UFYepIn+AgN4pNvfm
         ZMBT3rjbLrnhmZx1Q5qEvHyN4bvfyPNl6QLMVvfDRk7RSYNGEiCY/zgu08yqEpZarRBD
         A1v8cdenxsANSOGCEBj7uU6eaCAwb2pnoVRT6d4Ig0sGAYiD25p1EqSRZ7W+nh7G2QND
         mbKw==
X-Forwarded-Encrypted: i=1; AJvYcCWNcf5/nRHaROLJ3DNXrAw8lvynPkTtrNMEfj7Hdgl1jrbwUelBt6bUVCzsFTK4qKGCZQROU0uGfvPcVwNXWSa9@lists.infradead.org
X-Gm-Message-State: AOJu0YzGKPhuDHqXvqdgotF3gcZB8loy3RQs5rX23CqPJrs2VZ+dcXN5
	ZZQMt6rV1UQXyn3L408+ZYLhjxE2t0a6fvEGsQos8mXkKPtx+iwsDeJ/
X-Gm-Gg: ASbGncsezOnh4dzkrU1OQI4uC64z/bx1FUAH5zRImvUzUfUT8KUsIVBaATnvBp04Ymu
	rqQUTV25ILqP9Q33HnWvDwFLHQS2qzWcK3NQb+ZP6ipQZm05NId3ABZOu0Je2j6PN6MO8fzxFLo
	KIJO1bCJ9j1n/oz7tqWpROvUOjQJq313yjvRutHVe36TQhiF13nSIqfyB1xapiK+jzZL9ZYzpOS
	RuI5wlB5R2NNnFoqY14m2iv5RPoCB66K8drpvWa/By5JCJrJA67Shf5FCZ/vtkrT1Qg1Qu1rJ/g
	xwkbIPEhtv1nXeHYhHXMy6DF0fxfghLllO63MykvHJrdr6C34euz+KU1wolaDrCdnLD/oMADrQV
	awHx3Xjto6QWOjru6qRq+lMbgju5a4ja5LyoQ8LQCWJGDdnoD+ncI
X-Google-Smtp-Source: AGHT+IFh9B4wg+Jo7EUBE7+NvFrwXNN/AeIRkW8yHoL/KgrlM8+Hu4y+F1NmIGfgsp2QuK8PovS6Lg==
X-Received: by 2002:a17:907:7fa4:b0:afd:eb4f:d5cf with SMTP id a640c23a62f3a-afe07d4c63amr191037866b.63.1755773814070;
        Thu, 21 Aug 2025 03:56:54 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Thu, 21 Aug 2025 13:56:34 +0300
Message-ID: <20250821105634.1893-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_035655_642194_E8E2F541 
X-CRM114-Status: GOOD (  13.47  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index afcd8c785cfd..841d155685ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2437,6 +2437,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


