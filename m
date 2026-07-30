Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB53C55166
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=; b=f7ADYmr+0NLmeLFdgBl1FfIbRZ
	Wl0gIXEjRGOZIaEWh6IEiLHGWwyZr73QTJDbYB1tJ+I0Eyx1jCNfqdyHiDM7M7BFLI0vqXZ6BdQTa
	XCjoplRuNbvj54qZRJeCMcM1BJTSK573kqERoY47g/Nzw1ijQfrUylySgA9hie3dLesSB1KjwVsAB
	j58gaJQprFtBbO0GsuHOe63Qb4jRA/LEbBqouedtTsGEZk+JS+9DIy0zZs60WU8OBqmyyt7XE8UHd
	ekVsqPCNff2Ub4W4HlSd7ZRxc4jKew/8hSa4FomJjZ9N4aNJNjLXfWAP27zEQnzaoa2+Nl+1eKqi3
	ZGJnlHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjQ-0000000B0dt-16wk;
	Thu, 30 Jul 2026 16:35:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjE-0000000B0Zv-354y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f7854678bso1282379f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429327; x=1786034127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=QsXwJ8Vaw738QQa4dQfLPJc9XL01XX4aoLet+Y6InDdo2bpODXcRBu1fxguHcEbqTK
         7xlLQmQlTDkMoBavGbvkrVr+vJj5OoVlCw8Z1hLIiA/8BZdwBylPuvwbYeKDg/lQ6m/+
         rX7I3UGJZa9h4CJH6CkCFU0iDqNEVyj9YlIKmD1prjtaKD4HFWu4NNYKfEzExMavCju2
         59bwBcVY6MTBxycnif6OiVF+NAfCRsiLBm32BzRam0edKrEEyggVZqoEgzGzVBXXphI3
         MHeGolDSUjGNb7pQR5ZuWhY8JP1moW0mGoueXps5wc23BDVrc7yhS+5RnsI5zCN8j91f
         UlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429327; x=1786034127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=pfY48lfIzrR3gAAmjYAnpkmMcBrE64xy3/9C3D22MnL5eCcA1q8KPLF9W+xLqAhY5L
         YdiX6Xe9eFe8zqF2wqeuTzR+nc1YJLdKs+xU7Yqs95OLG40lDEdi+5S8Y+t+k4oep38+
         oe94zTKN0ED8QFtn59MoSEgyIU/AOtpGwlWdFhsnb1nmmx+ZzPl7oSLpof+fI0PnnSOi
         XR5X3ektY765rR/xszGW5ZSvMRh9kV6oG4Ylw9wyRabjkyaljqLUpPksGIFyIgSp3woX
         Xw6vgY773GDivDe6K0BuBnu4w/mxRkmZdamjVMdiTbpot2wcFkEA7ZzZWieH8tzN5Awi
         sWpg==
X-Forwarded-Encrypted: i=1; AHgh+RpskyNwxvBcAL/pCFbUzIkT+/OG65ZBLyHsc3qb0sWfFB0csoFZRdgWL4n8GoLf60LKxYDLg3OFOjKRJsSIIScd@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBuGb+tfDKWK85Qo3dOrm4/zhPLC6jjnYG7YgSbBpYVb6eGH1
	+ob0s8eFEw7nyJW/UIc7udVImCr/PRTNHL7PlSxLEZ+Nvt20Yu8gsEpL
X-Gm-Gg: AR+sD10HkEZ7L76aR4qS/6Ldj6w6EwogAic9Z0KOOopWhkg7okK8tvUYKO46au5mxs+
	uE1WLZLWQjiLJ/qy+/cwPFSaWgTXpl8sLoDgiFzvIQx4B1+RNU7KDI3qjrH5iimmagPJS51c3bI
	YSPNK00xQ2u9wvBylX2PrbmoUQwLRivWKQAj9WfXmAVlRJ8pHDim4pxhS4w5WXV5uqcwbqg2RyO
	wrw/t2jxu0IawzNAmJr56kYjqfmsqSHBppv30cVRFuJhoAcsJDkK20AnoKhLCZmI0I+f66x7xw+
	LFEbaG2IePreI/ZVEnaCd5F0gU9BhmR6oBvsy1OzrVkMVJ3NA0UVI6imNnVx03GDQagvol4TiFK
	BPeV0KoBrNaR8643swGfB7otf5vy78I2m8/MMPvFTame8w+O/oFc0jJmRfA0Ga13p61zETrzooJ
	GYpuJavrrbGhCZDujVrwNSHVA6Sn9TpBzL5KnXWaHZ1ioDA5ubUGLDUM/1YyEOozB+ZFATIfDfj
	hDEl6ss4YkR3w==
X-Received: by 2002:a05:6000:250d:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fc81ed0efmr4793087f8f.4.1785429326919;
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Thu, 30 Jul 2026 09:34:11 -0700
Message-ID: <20260730163412.1145-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093529_461331_F39B6DC3 
X-CRM114-Status: GOOD (  10.19  )
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

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.53.0


