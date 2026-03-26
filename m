Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ABD106F2FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=; b=c1gEte2JT1zlDGs2vIManNc38m
	DT+TYhmA7wHD3eoJSQ3H9zc8gbVq6zZHYXn+oSDz0iev5So93eRc4ZP0tFOowzteIhAKpEwSMWMqf
	99SVghSUSJ6FVD9F00CdW3d6lVeYHq2Vd6HVvVc1Cml5snfqoZj1VQGD1TD3fbg5aNb+kgp5QndcY
	nu4t9gbsO4sBBLilwb0aDP5K/IabztKdY0/eyt2hSaJ0NrYqZOqutYNciXNN7u+A8O0jsTX3YbjC4
	Omscfqp/biQzPrbFqvPul3YfW/FpE9G8S7mz+I7JGf+hesECs0buMceN2vld+Dze7PENvD9CTiX2l
	BAjVSLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foL-00000004zZx-0V1K;
	Thu, 26 Mar 2026 08:11:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foD-00000004zWj-3E9G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so642287a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512677; x=1775117477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=TaCi7aPt7DbSc4FCz8ZuwcDW6PPXI4XPaCB4iAHqmASq87yljk1ASZzVGeqhB8oDWK
         iWTzr+e5Z2QQeUoYbioo/XIomM94bDUAb0qxJ6mPztUY0U3Fiy9Dg+4bqRM9tl+9Q2AJ
         LMr55V/5bg/5AEqN6wPs0wnHU1fICY+xxfb7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512677; x=1775117477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=dz4hntcB3b1NqA3JQUgMyECVqCtk/WuIFxlix1Jw3snoKDDbkuRBG6Gidmk2/vY3CQ
         +kK7C++dDczYf1k1gV7AA1lOs/U6rTs9O0sEVTQZ17JJmoKfttx6+faG18XKaVzps4re
         Q1LTSN2tXa8++jJOh4INHvNzI+7VrOr5GLdaLL6lIt+oDvIWtQ7zSC412pbtTbbwprJ6
         urkkAntxi1VJQNkZp8lH6UMc//QNdp5jDDCeDND9B8mMcYOEdEjrk2loq1SYA3KJ2y3D
         PTn2lqw4MFOsz5RkFqclb9ocdcza/WduM1ykbrj55bvRB+dAJqaL2LZuoJhoFiF8Gj50
         vg9A==
X-Forwarded-Encrypted: i=1; AJvYcCXRrQAHlVQ62hOBJj58y3v76K2wPtPMvOiKtpud0WVZgySrSnwWJizQ9ga7GAPf+s/JcktFGJFFVsZ8Aym77POr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+FHcSjzS1Pz7kbjjvw8EwqiHonKmxkTK6ejsuKHR/FXNaxrH
	0zTjPkAqaU5aVgL6qAHUtqkJz2B6NVMutgoAcj6Mu0pySE07Sf67KuD+UpdymsGdgjUuE+nRuF3
	Nm/Y=
X-Gm-Gg: ATEYQzxbewJANjBi6AorrOkFhWX42IA9kq+JM/aoPxzvzanx13eCFBoBzcB4uRtCy/E
	ao9ULC8sdYM3lD6mtQdD/yqIU2kSAzdMUL4vVexBhc6qMqXAZ1jIQ03RQ4cfx67Q/2MmLExs611
	Z0Z3J4XmF4Tw8VIWUYqKvJoWjrnPuuXfIRiu4W83kXMGt09tMQXtmdKnbQsvmQgGx6P5G2lqI6x
	ZVOQ8N9UcXFT5xrt7O/K+WWCcxKpMMj7CLPdo5rTBajzhkpOHnUfH1J2H3bG/QZGnNkr/tVd8kY
	JcjuTLmABjiBjA0Rh8iBNhG7G8ZE9tNcIs4m+Y7htt5hluPVmPfuKO+yXAZBwl0aXb2fR+f1n8e
	u5K5Wcry8fAEBo0bvzdnISEmPcY0U0SwfKU8jT1JDtQLxO4nxswVgenC1WdB/r4lpARAB/6azy+
	3RK5nzRCZvJ+Typ9VRnm4I8Skui8EDa4iKGT/RKYvAwaCg0NN3FP56wHAdMD0kulMMEFZaDkewo
	Y7VAKOq
X-Received: by 2002:a17:90b:2645:b0:359:ff8a:ee44 with SMTP id 98e67ed59e1d1-35c0dc8ee2bmr6266111a91.2.1774512677238;
        Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] regulator: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:49 +0800
Message-ID: <20260326081050.1115201-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011118_928120_FE654983 
X-CRM114-Status: GOOD (  13.00  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.1018.g2bb0e51243-goog


