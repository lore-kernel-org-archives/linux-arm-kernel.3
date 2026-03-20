Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFA51093180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=; b=OtoRhcsY1GAoruDSlvW++HEo4f
	0QyjFERADanLMV9Cfxt4+EcZdm6soDp1MD+gDZgMEsPCsBTaoqVRMRzJxjEFr7EsNdwiAeeuppDBx
	W2gO3gdG7/ttNQ3Cp+GT8N+lvsmUFfEnHwJRGnMSk4StDTWreBwPiqLG3nrGNLBWEUD5XNPoGKCkA
	aMqf5sVTjl8gP8cvXmDwj5NIgx2V35gVjMuCdCcFtGPTbaiv89hlydZri5HMDiEkOf+K61K7/F9TQ
	5ODyopd8vYb3OOyUYSNyIpN2TyewHQ0C3pG/7DJyMEOtxwjLfuFINLtlKn0IgdF2noJHZDz3OxSlL
	cCuE/DFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCX-0000000CF2O-2W3p;
	Fri, 20 Mar 2026 07:23:21 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCU-0000000CEzN-1xi7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so679045a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991397; x=1774596197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=;
        b=L41PKltFpcp6w/8ll3nRf7x/N74YliTtz9L1rZEHERkbICDZOKf/ZrCtq/kapLcCoB
         t23lpqVIFtG4gn9LaTKyz3LsT9ixqspfZaQsBto74ELbDb+XaKhN939ehx3rzd6zmoD6
         Nmrlm7Qri0WPn32kWcF1tHtXB2ysCjFuauEXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991397; x=1774596197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=;
        b=cPEGKhVI5UiKGAOf4evoGz/Seshdf3i95XwXsUxqtMoq+GdY36O90UTzCVZktA3O/T
         UQnKubW9eKjG7AS9PcLSXpcg3AJDFA+gHI28NZIzq4ukM+MwqRqpXxUcc4z6PKxR8BG1
         UmOMtBST4yCVnxYHqYkOVaVtOiV6ZkBbhNCtY2kw7cMprIe3h2zVpAPoOMAIJBDb4eSb
         hgCxrcdOAGs4DyooHFrULbK/qwXyp7d/yAjzHKh8TPo5QPNmJp9tA29YJ/5xkR7TWwNr
         6anSeBnnJu3xso8pv6/CmMI+bd5Jqjq44EkGuwoJneqEl8reSQaAlLsRYHbs8K6y0vcx
         2WPA==
X-Forwarded-Encrypted: i=1; AJvYcCX/uc6YWn0TwvyDg4NKq6Q/QFyPJ96MB59b+Xy8XV5bhvGJYXpFxRnrxfy8qZJrtqgsNQMBmzbdv7yRS50uu/jH@lists.infradead.org
X-Gm-Message-State: AOJu0YxBw4LxUTWaJxoSAgpwNsNNowrKyNqUPh3Idl6UimyqedFCQr8W
	b88R55MrKZid3wA7QHjOTMmrIy7/8YJaiDUBoxjhSG0kwQxqAWRd+pm3G2qDYJzNlw==
X-Gm-Gg: ATEYQzzjhcL9Pqwdih0BQe5vj1EuIzqTLnJWQFAJL5QUM5+sXNsx1zgAh5e0FPnme8M
	euKHRDqjIgMvrP6ihUuF+XdD2mpJubt9EE2AmKHEAg5CF64J3+4rJptDg6o72Vtf0jt6CbCCBPl
	xxJ7bYVdrNP+XP9a7mvTeDcaNWLXSokPfOQjSKaREqcRuLmfC1TFZL8aRE1Ibkigu6j71GUqmfq
	4s23YxzLz4dpC/KWpK/ziZCvi3aow4JQLj3SCVUxXB+j28ntlGe+u6hjMHcq4bK008grkMyOvGA
	UmhQZ/GLwLjrXIQi6Q2jUgyIODDRIbfm95yk+XJUwDaYi7JXTtK7l+41kXUafuyyC8wfJFvHJsx
	qi7+caJmDsFrGroM6JXW2wMVxrfxWtPv3/W58CP8P9HC+JA9fzU2Q+GcZ/SQybeo/wrMRLe9Dl4
	mR15AtWievS4Z0xD8DJcI1dIPyWbPRIsgvw0ULFwXwnKsuz8IykqtFDXOv+qNrmARZIWz79rmOz
	1aClgDp
X-Received: by 2002:a17:902:f709:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b082769c57mr17180045ad.29.1773991397165;
        Fri, 20 Mar 2026 00:23:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] regulator: mt6315: Add regulator supplies
Date: Fri, 20 Mar 2026 15:23:01 +0800
Message-ID: <20260320072302.2402489-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
References: <20260320072302.2402489-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002318_521595_F2478675 
X-CRM114-Status: GOOD (  12.83  )
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
2.53.0.959.g497ff81fa9-goog


