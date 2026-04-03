Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2AE85385
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBxLbdK5gEnACVVYs+wGWKlQ9IXkT+XMH0xDrLb2g1M=; b=2kawmZmVdxxuUUgcY3H7vEWtcW
	8OhfIG7EBbWcNsZ+hfmArslcny/gUmYfB/cLbHnETdtiwVVyzwO7UJANuHZ9MkNK2L2WRdi/KTMP9
	JToUJmUroaXpLoZLh8hlMBK9K16Nk4+Pb2E41tTPoZtG34Bckz8arUfgJ7hLPov03s2h+SvxfafLJ
	Qg2LdihyyX8J/g2pI3c03P8Zj/kEVhI3OaSISpk+6ayckcXfMqWt7/0RswNwR2THsRFyBBZBT3UCo
	w/A7ZjzKKFl/KQLBRHO8NmIV6/Ea2qfFz8F3u2+LFoK9MCTKaVM3vqpEtQ/edFsSce5qsGw4dXp0g
	fV9G1/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0f-00000002Moa-1A2s;
	Fri, 03 Apr 2026 17:08:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0d-00000002Mmb-1VLp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EC6A60126;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B943C2BCB7;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=VugrxAEpcoaq9VvpeVHYFFo4mzyAFJTTi30xWQb6Pkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cSgRASLPiRVA/oV3HW7cmHWjSLVrL3kjoyEDx2o2jGxmx09rdrV3fWaYe1FFoS3il
	 4n5YCPav/M91yckqhjtlup8A+2Tkp11INp+AjO7eCG+/dKoUmyx44kW+YmL9SmeeA8
	 zzWpeehbWSXFfMRpVOnYtOnyOtJud5V7Jl9hgP/q+EUpGnwaVYEbhAPQPAb1h8va3E
	 sD8KvRUb7g9+7yX3hr9N4VGs3EB7Xy29DPRz1fbttorGGEp0xURU57Q8eUPyOXdSfv
	 tIp4AaKmTT2yxIQxl1sNBJCd+L0o6b8NdPUOxR5QnFke4wDbWvCpHIuvF/VRqj/0sU
	 rP7Gb1kxaTSaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE69E85381;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:32 +0200
Subject: [PATCH WIP v3 03/11] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-3-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
 bh=FK/zsREY/XInSNUuszAKmQ33vgOOISGuAWF3OsBIumA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPD2ciMWJ5W+1zF2xkDZIGGRF83cEso5lTw
 NeazdGU1w6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 ckejD/99QJLselfRokizkZ/pMTbIr9CjqU09O+JTSttC5Rt3992ZxD/Mcr/NWpwIMQYBVM+NTHL
 POB3ms9p9TFdnbnwhqJC2cNBgEi1lpq3YPktMrJq9HBebt7IYlQECm5zGOUAZBxjt6lO9wXgBFz
 EqqBkQ0k5WoSQCbjprXFkUu3C9HH9xs23mVTa2y9FBzP6xg9aKzb4SZZPaYeFTXP62FvhIzt+B7
 FmXb5cM31no4wpXv5yixEiFqISK/il3glthQxRRZUqCMuew86F36OONsaFojTwiu4EyJQbyzlXq
 3Irf9S9njO5g49Ep4kBWwH5V+tEpp1gwpfsUP1st1yeX3KZ7KlO2i2ms9bMHQMEDrmcijV4PEhb
 g4lnEtu+4xoy42mACK44vNrODmLI3ZG11ahgnxMZfySYHs/64BYOvYvv7NwPMREcaaj8Oa+C8CP
 k0Bxx/RnW+reTU6R9byrrl7KHSHm9CU57S3eD41SZ8Shi60aSplAR40CSQ/+Ae4Rt4tCQPfGMv/
 R7Sr7BQEXPF1FKmMjAp2CFeeWwtHgiIezIIyBsDRXl4PcDNUsmhBlzzJh0bU7oWFGD4f86hVPXB
 53P+CQfw5i5pUeQgnrBE5dPT/SFN+OsidbjIZcDZn2zsaYTcv521FrArgs/FBEusU6kGEy4imsm
 Dm5n0VJeV6y+P1g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
index 7b1e975a85668..ff884e04ad4c8 100644
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
@@ -523,8 +523,8 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
-				    sdata->regulators);
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
 	if (err)
 		return err;
 
@@ -589,8 +589,8 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
-	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
-						sdata->regulators);
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
 }
 
 static int stmfts_enable_led(struct stmfts_data *sdata)
@@ -638,11 +638,10 @@ static int stmfts_probe(struct i2c_client *client)
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



