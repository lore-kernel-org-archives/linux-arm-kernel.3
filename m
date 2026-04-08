Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F419010FC456
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9YJgDDqRVzPR5T+pGZn7c0LG9FD/xedT1icfOney8I=; b=MOWuAU01q3hTZGViv+DAmHHcnI
	n+6ZFvyRlo7aFSUNcfhIne0Ie3vv4GnuWkcWUmvrCMA3nUNKuiT59RIDFGa8so4O/vDGIHzdVik1R
	z/HIFRBlx0uxmhG1p6h3Pv1lQmwOQ4n/xyncjIF+/BRRaiG9EoybqkeWWyh2mTbpvo+qfCjTepzH6
	C8c1jiK5i8yCUwpD64Uh9qNntExecuvqmcMN+0dWFqMkoDAdqkmkiqhT/DdBOsdUcvmFeBVJ9KeKK
	F4MZvV7uZ2AzSLvmNlxWRzp3nSPWlywlNObrIemgoDmMMHwj02gOAqLjqEDgFZnT4+K994uoMRY9l
	WbXXu96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBl-00000009TDf-3tXf;
	Wed, 08 Apr 2026 22:15:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBg-00000009T8c-1gEL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E5104451F;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDA38C2BCC6;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=bqHJlgvFMDOO/lnNU/fWghkOHQbJPVEBKj2oKZvCSNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ANjq9x/uvYB8wOkN1F5FOWVCAzVzYlW8w3sY4HH8Gxg3xXBY2br3EbI1cgMDhLRwZ
	 t4oOXJFdrFN8uHtods2lCUE7X5+TJZizqdUUv1PJn4869YNjqCNoyaafC2c3Ej0ygh
	 nm4LJeuzA9loKSltfg4BNfs6fMxWctY8dTOM6ij/xerOmzCY/gw2vugr+MWaOvg6lH
	 ydrHyuTV90ekDGuwukxenYAgjXzPvWmFsl2qn2rqMAJlWkaavaghzetOEENVp2u6u9
	 Yy8hL2uxm+NDKuBeg6OfsAzq4qzaiLDE/2uemNlLgGGb2Ax9HsMzRVL+Zc/yS5S210
	 voGsDZ9JclZLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D570A10FC45A;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:48 +0200
Subject: [PATCH v4 05/11] Input: stmfts - disable regulators when power on
 fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-5-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=otDxlvvUy+vHqWnlpecsigv9uo2JKsE9RKwSL0jKxqM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSqxbb22SJazyTsOITYMHjjDrzpzJN7VpNu
 4ltZ1OQGniJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cmzrD/4tZ0pmiTNrRcm3Y2eAc1o7V/ba3zu0DiVu8JqUrJ1yR3ITurB98GgXril/pT5MbPi9Z/C
 29ddmYiNjNewyip5qQD7oGYtlKx9peclhWk37mV1OsbrGScrmFPMbayNpwtXJY827ep2dfVZIlK
 8I4GyUUgZyTP8IDJ2g7oeudDLZVXV8vSMX5s4+6qMHecpp3/U3Kj49/LL88Xc9CvNc1aPzY87lZ
 Xm3hwBHlvRj7sEhxUv4sTgQWT/8YohJkA+srZfOJlAxhK1SBVlKATd1X100W3cNHaoakVtxDivh
 l/uTAX1FW5BxVxdzXhgWvbrqvwpGeGZUmlti/gbjpmL+ysz3ANWaW8gUNEFVYHbMS6jOzzj3d9S
 KQQbLDAREvM/D7c6XoA29y7dCjNjoYyyMPubUi9RgBhSX3DRKGtMif5WyUhl2h+3kSC6hSEIkn5
 Uqgk45GsgTtEdB2syjwbLPkaYGY/LXw9wsc5ONduLLTd2q3m52FThLf0LyxdK+7tNsz9qYKsLEc
 pZtK9QG+DfIJaFnY2GtewcKK+6TyZ+/ySIVMmxQo3O0vpafq1OYLi75OkEEJQ4lTlqOJ7jUqG2X
 bleIhh88KpQVs2DBplB5bMLJWyitMYGasnl7c0NY/mvy/mDIdiMQC/En//3ubLhHTxW2ppuEtm0
 ePllMuTArMZK1xw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151552_502138_92448E9F 
X-CRM114-Status: GOOD (  14.28  )
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

We must power off regulators after failing at power on phase.
Create stmfts_configure function, so we don't have to use goto.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 71d9b747ccfc5..290511dd69437 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -539,22 +539,10 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	return 0;
 }
 
-static int stmfts_power_on(struct stmfts_data *sdata)
+static int stmfts_configure(struct stmfts_data *sdata)
 {
 	int err;
 
-	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
-				    sdata->supplies);
-	if (err)
-		return err;
-
-	/*
-	 * The datasheet does not specify the power on time, but considering
-	 * that the reset time is < 10ms, I sleep 20ms to be sure
-	 */
-	msleep(20);
-
-
 	err = stmfts_read_system_info(sdata);
 	if (err)
 		return err;
@@ -596,6 +584,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	return 0;
 }
 
+static int stmfts_power_on(struct stmfts_data *sdata)
+{
+	int err;
+
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
+	if (err)
+		return err;
+
+	/*
+	 * The datasheet does not specify the power on time, but considering
+	 * that the reset time is < 10ms, I sleep 20ms to be sure
+	 */
+	msleep(20);
+
+	err = stmfts_configure(sdata);
+	if (err)
+		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+				       sdata->supplies);
+
+	return err;
+}
+
 static void stmfts_power_off(void *data)
 {
 	struct stmfts_data *sdata = data;

-- 
2.53.0



