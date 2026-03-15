Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EEF3027F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27fxzXhjsLy6aHEdNjUOxxx1S5PnVQxqxwbYJv0XClA=; b=05DLntfA18vvzmiZDTliGc98AN
	uTMyDFrmwy4Nw+N+3PZGbjUHo9SlnK/HbZAXxZjIIE4C6t6Ta9p6lX5RUn5RDajV+BWTZBhUNAnYx
	xgV2rncZt3h+yHaxdlVwC7AKxbNeXY8px4ercMmdipBBmoyMc1PEo2XKx4ZEOv6k9iQwHgVCR9yvB
	8GWgQWnFZvnzchISA6VN4oW81LuduY69HAyuykog4c4nUqqNb9EcPQoFEtlNvTeJ0480ihckuYy6y
	oiSjz3b2fnkWF+kfFPnf+T2aaxcxEVkS1uamMnUVb2mVy8PPqNKUaADYyFN851LLd91Z06PdhgjJb
	Qy1TwYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaJ-00000002pOQ-3QgZ;
	Sun, 15 Mar 2026 18:53:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGo-2wNi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51FD0444DD;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 194A8C2BCB7;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=OE7OWzcPJlqAT8CVGaI6jsGmPjH4innzyxD+QaIrWJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MEnxPrqhdrYlKJtk7xYxcvMKOx56Uunbnnup7TiMizDyWCHveGywNKzgivKmzw3pe
	 2jU8M6gVDUe+EUTD1svZYMHXwBvpJyvJxzNs4ajr5o9YNXG/mW1LirFY9K2jCEWT8f
	 psPLYCGlPk7oqthGCHqqtd/UWV5UPCbt0QBPGxNVKStxGFDhY0CLPmytwKC0Z1tJPO
	 nH92ypw9wVvdAq74pZmhbV/JGhjB+YqR76f0hX6dYBqMxEp516nRVgoL7zr/lFhZ+q
	 3NHvJy80o5Tee6b+8XI8wRuyNILkVRBlMe1hUmYN4m3mAUQjBGHaGkSKWfHgEarfKc
	 Gt/hGW5poqAfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269AF3026D;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:39 +0100
Subject: [PATCH WIP v2 03/11] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-3-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EhOdKhE11+x/Pp5ncOXOT4yvdqq55rY8mq2n8Z7WQXQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5Z0FSf7Q5Fkoy2OoYxQlrp1GW/MAjaXRSu
 qRAdgEszneJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 crUbEADDJzfQ/RrknL5YGGGN/5biUQ99qOYqmj67VlRALzcitap0AlkFGa6+xUGoclxrqkZbNm/
 Jq0MzLDu86twESj2MUT0V8/5mAM3Hi6x/WpRcPElcPqaujTWHPr89MzXmMn5iL4IgxySSWLfLnY
 yZU5hzG6ORcy/qWusAOWs4Bj4Li8AjbMAa3LWsQMsz2Db0JLwfc3IOhD1sHP7n9QSDErZFHsIrZ
 9cBMaSeZmEl7ec8enHj14dL/QLSmQzawNByxDeRZcwJ+tvpVT4v5sJxTTfZBBSk6EH4GZk7gWAs
 cSSCtcP/EvPKD9uIiuz34xerrMfEe9ZKhMy3KQJoKBSolL73NlUPoYpy1vPmgtGCjYTU4eAdFhz
 88fpvOlztA/ownZFC105QVy9bsFmRWPFqoaXoOPLabmcSC+K+dnQPLXq6X6vG/Tz0OZQ2b084JU
 rk8v00OU9N371bJLFwIHQVANvxFIwffm4HOqezDli8B/uAviuq7esHK9uIiDffXmRNvtxxk5M+e
 Dc7E5pLovqzI90KourodpuGIs1mTPYKCZmmc8qEuH+1wEJQGOu50DI4wqYPYV3EVJ3l9lZX8k4l
 Gl60GfSWCWrPlgNXcAGRxZjrp9SrJ3+u86XxeMhaMwx/xN2XX4p3vVF1lc7GakbcuWnQ/6YLb4S
 lN+A+31X3hKjM5g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115254_830001_C1665B3E 
X-CRM114-Status: GOOD (  13.42  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 1d63f63e43d48..a9f240bac201e 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -69,9 +69,9 @@
 #define STMFTS_MAX_FINGERS	10
 #define STMFTS_DEV_NAME		"stmfts"
 
-enum stmfts_regulators {
-	STMFTS_REGULATOR_VDD,
-	STMFTS_REGULATOR_AVDD,
+static const struct regulator_bulk_data stmfts_supplies[] = {
+	{ .supply = "vdd" },
+	{ .supply = "avdd" },
 };
 
 struct stmfts_data {
@@ -82,7 +82,7 @@ struct stmfts_data {
 
 	struct touchscreen_properties prop;
 
-	struct regulator_bulk_data regulators[2];
+	struct regulator_bulk_data *supplies;
 
 	/*
 	 * Presence of ledvdd will be used also to check
@@ -524,8 +524,8 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
-				    sdata->regulators);
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
 	if (err)
 		return err;
 
@@ -590,8 +590,8 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
-	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
-						sdata->regulators);
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
 }
 
 static int stmfts_enable_led(struct stmfts_data *sdata)
@@ -639,11 +639,10 @@ static int stmfts_probe(struct i2c_client *client)
 	mutex_init(&sdata->mutex);
 	init_completion(&sdata->cmd_done);
 
-	sdata->regulators[STMFTS_REGULATOR_VDD].supply = "vdd";
-	sdata->regulators[STMFTS_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(dev,
-				      ARRAY_SIZE(sdata->regulators),
-				      sdata->regulators);
+	err = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(stmfts_supplies),
+					    stmfts_supplies,
+					    &sdata->supplies);
 	if (err)
 		return err;
 

-- 
2.53.0



