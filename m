Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AF5C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=; b=cs9SOlcQtpCsJKRcdiHEFOcRDU
	GpHK+jUfgBWMRkXBS6Mk5I6+/QWzOxZDuMazecl9vpCivXT77nbeIYXoDnEJ18w8pIkqHwJXEYz9B
	aKUBXQ8+1IwTXCX68aHN3kTcNGCSQ/xCvFcUZrH4TbuA/K6oM7htP6A6XRSG5EcaW49gCZDaiAYH5
	qv2ffnYNRuZ7SS2uVCCWATUjHt49a3OpKHsvBuwF0i8o/6aoI2YLqgv6lKCOIXablSegYWKJ2v9xX
	//XdystoWcYOiMEGYgEnUrcVTB1/MAYYqjPZBFTQ6dqcg9m7U+mXA7CGvhQ9TD6gBRKt62zwlUKW4
	VU79Ja/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brF-0000000F6CS-2oEk;
	Fri, 18 Sep 2026 16:54:41 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brD-0000000F6BS-05YF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:54:40 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso821948a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750478; x=1790355278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=DJwB3ZLXfo8QgfQCUn7SkTSdg4U5+YYZ6TjGC4YeLbA7auSPh5fi5aeMV+RprHBJ3a
         UpiE6zH5wP/StW5PQGtJMXTprnWKEoTqpOKGSII4fL0p8KreR6ShpoU4Je31I10guJeO
         VXncN84I0wRvoa/E7dicyxGd9comAdojlKJRGG684qzYs+3roTe+hpEzbcW5sluKzpHb
         KvZhgcm2reJRFDMhCyWOBG/I1k08uNNZdDW2TEW73IlUjEPpQPwyOoPZaYHGBZ8SEw4j
         RtwAqKG3oViDNeNG5LsKX75uRLVU65RXugBpn37JTSrY6e+PHsU4U0xfIj5/nl1CrR50
         Cq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750478; x=1790355278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=Bjv7O2x3tr234HTBKV9WTnK9RFl4m6bwAkuXYz232nvHrYLvXERnqHHG3MgdPxhbPa
         yJVQtBOyfdJDRNA6TQ66kA6MgscA1756Dp/SQvq6X1LFdsa4dvExKYVK/jHWaIrt93FN
         LUAXgT4xem8N5pDmpNIfYasalgtVhEzfjHZKJCzqXrHQFDEfhJUsWPHKSwFuvdwS+zaA
         sgDDTECDyzX6eN837sBrTUPVoNG9l7moRh1EWy4tdud856rB2jNGxu6ZiT2BQqtuoKSg
         B2qcQVvDSGqL81nCmfUacZRmcHGCcDGJGCyOiPj+mgQVTY4rhrglpFMO1rw1BGjuqj5U
         0UeA==
X-Forwarded-Encrypted: i=1; AKwUvBy3IcutiEYGELIFKfCpq/NmBWDtVbdxGMDFMAF60JDXcq3lEPBqyNcLnDEYeXwwxYfY+p2BQw5C2oHM0wAMWR7H@lists.infradead.org
X-Gm-Message-State: AFuF++lnrfxpIK/MQxlmnrSC601Ueu+t6mwI8HYWm8uIIe2clMr6VDB5
	GWAUVDL1mtxDqC/WtDMpIbuIha++FCeFY3VrF2nB4q/J6kf5ruxvGBKa
X-Gm-Gg: AYBFou13IRCv3ZB7ILZx4dD793Qoem8mauuXkeRvG8NQSoewEfljmPgZ6KPaE8iS1u7
	EbyK9RDZG3czAt3Q2cjFEVHPZsqCe8syQqJdUOfIG3jRu9Cbnf783k1BF63c4q+1zqX+6m7Yv3M
	5/sP9cWBPTwI2qXrrSix4i63wwMnRb/Mafkk3GYz228BC7j6czWbn+NXbg1Oz+3NAO8wqRfi2Jn
	guXaQY1jadw0VOqeHQTNkvGjtMg+3LQnxbpErZi/I6ywMP4n7F7n8nzJIwZpBDmcOr+H7UgRYLP
	MTuVl90NjyQlYkralPsB3XzZKdnjD24W44dyVrskjNuCQhBv9o5Uf1N26u6DcTvgK3oJ1flZq7H
	Wv6IHsUBvWcoGX46q5mSueYrt9BcdcNaxmdjBRgxIgIR+/t+XKWdw3AC+8wqfwOIMW0avKKzMU5
	HsMvVOu6hi8gd8Pf8duyIhd8m3xEK5eACQTRIIrmaibcU0qZpOLZfdbb1Ar2lSNvd3kLzvFS6XY
	y8=
X-Received: by 2002:a17:90b:1dce:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e54d36e3emr7094039a91.21.1789750478423;
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Sat, 19 Sep 2026 00:54:11 +0800
Message-ID: <20260918165414.1129076-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095439_090611_1EDDB221 
X-CRM114-Status: UNSURE (   9.51  )
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

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0


