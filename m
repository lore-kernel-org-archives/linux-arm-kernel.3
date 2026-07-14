Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC25DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=vhgwb5bW7BF/JVFheRZ6Vs4Bd4
	NuvYbYTYO3foLp6phTCNPxecqVhwImv96lQqssdMFvzXn5+njt/9pdqwfbCgZiMCWhMgf0oZsAmyP
	0K0ysVrhYgWgP2vj5ABC2xgUsw/XZSpc0YC5XY0/DEvMB4OPd5sdRfIJfedf5+agVs8ZbCXi2z8W6
	lfx2j8/9DBbb9qY2PidsWbHbB5sY2ZIiSspgbPLjU1I/6zBmN+ER4IM6Jh5/+6UYOWIAHyCoTig56
	mj4587IF5DU/zBPXKnaecXEwMTSRiwUYmwba0JAXn5AroHvyBY9W5suS9xGp+Sktycy9T3UfyhM7X
	a/ALrZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVz5-0000000Ayr3-0V2G;
	Tue, 14 Jul 2026 05:47:11 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVz2-0000000AypR-3zyG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:47:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1574162a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784008028; x=1784612828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=V3lU6ByuU/GHAEd4oT+P2iCjSyuBMUagElav3taoly+fcNGCPveAJIood8PIsZg76V
         io3X12jWi4+ALCFU4n1u+C6HNW5De1DieMW92skMTRgnOD1WyqSaN086MKunaAenXIzR
         EHDDvaPvqMAuz3nI5Pq3NrVjNMwArLKKH0KPsUZ+WvNvxopprTgduzOVHjovLgouU5Hx
         8m3SlS4oZ9X8aAmunFSnk6knv8bDj+8u5qzSfh7hxzVafk92XVdqRoty+Uzw9Ku0r/8V
         6BGmnVYf7S+s2d06uyjcrUyYuYyb6UouxQI5EY2WaFrbvV129LfMvn4/aSOElR7O1ZBM
         n40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008028; x=1784612828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=dMOeAOaQrvWtxTtN6WhkefFeJWtkoCpyxQqcYUwOrzEerhv7mVjZRoCdUmMpAMcXR1
         aYwQqYOZpSafXSCMJ0aJnFb96/RKCy8/pNu6PnflmTkOA18tTNA+O9d8dzxnsmc8bICA
         Yb9uJcTBx9Ua1e/Ctza5SUVZuaaftSATht9H3UvtyVdf/vwThdP2IvG92AdG3hIpigdA
         JfpapK37YrtFsFw79tF3270Ot4s8MBSbzctlRpUgyQIdrwlqj63BWxUduxWlUzrR3vrv
         ReQHXfHsTPY9XOomVlBL8/1JElqUV0GKehSm/lyvv9k0of2m0pF4FHsCUaq0g2X4w7Pp
         5M9A==
X-Forwarded-Encrypted: i=1; AHgh+RphX8FFcpD5lVcZaeT5fTXh9RG/Ep3CNhWi9QVLZb/BQ5V/8sPkwKzg77dvMLsMmfi4mzlkd+M7fFpVHiwTAY8+@lists.infradead.org
X-Gm-Message-State: AOJu0YycCTgrtk/E7Vt1LrQKmotC58nfzYMZ85kzdV4yI28skJNSUuMa
	RgUAj/ivgOQUZfS0BhKYUTISR5PwPZ0UaE5bKoedwp/pBJntcym4Vf4C
X-Gm-Gg: AfdE7cnYHWxUHXcHIHuHnWJolNabOfN4p3Y7RhEXMW5jCHXi5phval35RjPo0/Scs/X
	I8CHkI4XpHKCn9Nc5zRCtzw+LDP96/z4FtFEmTVJ6N+a8VOt56zOvHd7VEduaAH3s36GVnDd9Es
	4ktPehkwBAxo8jXZlthI+zxfWrm83ZickZNF1brjJ1tPYAP3baN6xhpfyIMqNf4wkdErnCRSLW6
	viNIcLiJzwLpmB84i1Gpf61ypYFLs8k00fw18xfqhdX12MJKvXn8ApAm0XYqEs/6tlIhmjMKGuJ
	c/4d5Y+JegWJA3sV54jt7xhxVNtVa3JagBwwYEeuWlZDEBS4pA53HdrLQ5DGd8CmzFGNiCTHj69
	jgYquk5EJYRmrN8vo19oXfhEVJah0eVDLcRBxvNuI8Sf/SOzWCgGnHdLuqx+x4tEYk68F4oOSjG
	v5s0wF8iONmCO8vRMMOyk=
X-Received: by 2002:a05:6a21:689:b0:3bf:e2f1:1b17 with SMTP id adf61e73a8af0-3c35723202fmr1160592637.50.1784008027983;
        Mon, 13 Jul 2026 22:47:07 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm77965054eec.11.2026.07.13.22.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:47:07 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Tue, 14 Jul 2026 11:16:52 +0530
Message-ID: <20260714054653.266842-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714054653.266842-1-hrushirajg23@gmail.com>
References: <20260714054653.266842-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_224709_201937_D8A7D0EF 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


