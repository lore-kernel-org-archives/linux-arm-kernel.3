Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECDFD006E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76b8T3n6Zdjfb8FIbLCmKlMxFgH8uKZOzv50AbARm18=; b=W/iO5I/CEL5bI+S2nj/YXDF/De
	/zeiOudCbwJa8SMFvbpRSR6xxYPCRKZWwJRavuB7zNn/+lHmNg+IY4/IdQbDA9Py2YyJvi1TFvOpu
	IwHgwQqIu0kcr9HFXYLPiMR28ygkWQaLZveZr4ZXQ4bJbZfKdOjgrehwUBGxqmc93I5YLxCuIvVvH
	ZeMI5NmjiSzWDW8oOt5PM6cjQYVRjWtP0XmXdjFGjb+qSaUcFUaZkmLpaGme/kU224vXC9zIVz3wn
	77k4+1lovBT5u9mZNBxEkOj7oinu7h+LBckujUc3iH7Y5ULkaRteQWVv9DFQ7JDdhbc2DV38mmwN5
	OQfdHGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwx-0000000Bjus-1m7K;
	Sun, 01 Mar 2026 17:51:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwr-0000000BjoS-2Ca2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FAE544546;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B6F9C2BC87;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=n23ZcFkmyPNEvO2IkqQ957PDqVWeO4dI1IFebDR/vt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sp4MjfggG+nw8htHlPxq+Xi5qN3fZ+0/9AGUstqO/BykF9za20Ok3VwQU+80HvGyr
	 tn+HJQ02bAuQrO3m1A8B9n8MC4WvQUdf/LuWuj765/Vwwf63q5hmXii6hnSP/Lb1TB
	 xmqQOGpj2lKXLPrzysiPpidJN26qP46I7KNuLzpOZN+gLDZ/3s6Cu+qyq4ngMlEmGT
	 vsNUYKaoptZWZ/V6v6QmazpXf/32okUsDnLd6jWAbKNRJ+uvRh42fMDKPvB1L6NVlo
	 5G9F1GvXnpeYjBFKXe0VXuLOru6ZmCVG2yX9CNX3GcoEcjC8Ow+T3eQDB73da7pgeJ
	 aDatin4/FK4MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516DEFD0071;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:16 +0100
Subject: [PATCH 02/10] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-2-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
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
 bh=gp0Adpeb0dgRnIzbTX0yz5VA3gvM4FK6mupYKoiFMj0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyURAP+6GmRBdj1YMjGOxEXecCpiSaiwdK38
 nv4OmVUw1SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cuMlD/96F1ggG3DCx9p28DKIQjERz38LjXqEcedMM/S+1ZJUHTM4uyM9XUaHyO6V9e1/UUxuD1A
 YeTodQ7ny4ouLM14vM3Vo24MD6EaOJxpVWPLm4IxLESagvS4gNalrkbrf/Y4v14mXDw1kXWpQmw
 M08g7WifVWBuHyOLnZ5EHQ4ueDqhDnGzoXvR1AxUCxZoUa7dZ8Pr49Uy6M7ZQKPY1SHVspziZ0p
 A01pQkrJoCZbXvvOY6oDBV99mnx94lydjM3NBbyQAi0fzooZEbUtvjYEEgRtdNlqZIMqhO6QnlH
 oEciiUverffQU3Nfx09m4BuyZNjFpkWFunIGuj7C4Q2bJufTQTtYv72FkIIGzvLju8yodpEqpBG
 GRkkLCRg9NQh1uRL3DxNkIrFFfqohEgb+BGzaR6OwXYeRhu8+AN8uiPoVevSlW+rvz6XRUBFlWV
 fGbsCL4Q0YpRe9BcnRw++lj5nB3Y0+Kdp3pNlh0VRYCFWexu9P8CtrQ1u1QHNPdLbULVDqANTaC
 M6yxpV0co47vYcmJroF9Pe5A9H49Ybv5B3Ne1zIGtyNGYc9d8yFX97MlY1y2x7SVaW4y3Ceu/Iz
 YMENmGjWFOVfy6PHDlXcknxLtc3HYQOqt4TiDXL3dSPdqM+faTPtxiJbGye7WEmtgSxz+zEFVi0
 xga+b9htJMYCDaw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095121_653656_7DA08DCE 
X-CRM114-Status: GOOD (  13.70  )
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
index 27adb139fa0ce..7c0f94ba49464 100644
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
2.51.0



