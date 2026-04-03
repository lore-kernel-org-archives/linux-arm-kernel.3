Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BDAE8538C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHoEfjUX693TNvJFVSuhnWaIjHfHyc0F+R/QfpOZw6w=; b=oCV+zOOKe7ajsvmoiHPusygmBq
	4xsIRSa0dYBkhzZTj52k59tZHSP1CEd6Yh5qa+CwrMx8aPuAq6gHDj1IYY8jaeXo2G0bLjoa2ooll
	tA/k6qOqyn4gCcX2JCqtfzXCx5oDO24DCpoZp9hrUL8v/+i9dIQWVfi4rhWKuOqsFIuTvwJqFucC6
	a5M6uY4UhKtuuRkCrAj53xpJQZl4gI1wQqMAIIsc8iv0a9SqLkpdkFRUnPq/3MGerAaSlONZ+AnjX
	1ii0i+6/J47oEeRhzHFJj55tdFJa9uYo8i6lEMyINykoeWG9XKhuyZzwKY+pgvijNoP/Pov4u3RKt
	PIQcV1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0j-00000002Msl-0lX9;
	Fri, 03 Apr 2026 17:08:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0c-00000002Mlg-1QIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1DD644709;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 761A8C19421;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i9r1H7+CaM1hDNBecApzx7e/wR0FTmx6yf98FKydwxv80CbKQYRmRxWCSDSdheTij
	 OgVVgjZ94Zev12EC/eca/aD8MK8sgX+gjD+mehYT9Jw4JjuX7KGRXHx5vmF7BuTXE4
	 xZsXPZ/DHz8eUFjphpRktwr5bTdZGYXJvJeMESn8K3SONLKlhblTGmIs9lCPueoPn2
	 hQhF8vrXdNweiqVjYBfhzrqXF+506WZ2F9DG+IU7JwEULSVlGqkTRMUycmmi42RwQF
	 OH6L8o2Wjhl6Tg2kVKbC7RW0exLoSLZBJ+DpyUuj+1oDqAHnZnWaAX7KXjjE44xuPk
	 Ttl7eDd1JHW7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675C2E85386;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:33 +0200
Subject: [PATCH WIP v3 04/11] Input: stmfts - abstract reading information
 from the firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-4-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MRRMNTeMVS8qh5Y3wcBKjF6ySEKPpTml4To4kFWgqxE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QP8lvBsnSoeLNS3kLwHE+ukHByluvgg4CGH
 EA7ol5HaTKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cjEPEACEeES+cw8KrgQ/FkfT1rtg5xVKw3K0g/1FQOBWO8wkru/JjO+YXcrkgneK1vfWuwF87zc
 Jx5q093Hyvr+oAqzHxo9tajfJt1ttI7IZ9NQPh9tPq/eWS9sumDxgE0riV//WpGhTjKvlrqKRej
 nlk41+OHeaR52WwJYXmlOYg2j/SJbr06YNs/U1K7HPmq1nZ/BJH9cpWCGQIUfPB4bDdr/R4oeI+
 frr1ZOhxVGQTkovkACicfhJ4zPVlSs7Yd3k8GzP8X1iC8/ZfnMudVWylSHoWjvBLmKZKgs8XIFT
 wAXxXDGxclf8alyObmGkAP/zSSumROCFcYd+STcIiybrI5IVuzTixaxpjBlHVJwQEilg9hGoF4r
 p0YrvNvu4QWpgQfGbDJvyBRBi10WIV8APkI/UhGLBg46NIHoC5WVxFNBrkUlqHhMvIj4YkYt5nc
 R6ZBL98/LraxqN3FhJc7KEFRj9P2xyLT0E7sxu5a/NKPdWLfOQ4jN1GHevzje8uBFC9uiku4Xbg
 r3MEWm03+AuzWJNim0h4suzJpMy+2M+P6bFH107s1yitNrI8YTgp2r1Vgi9IL5rB1NLHoj3VspC
 8PVo5OIrYihhKZflTWtCXCTHWCVO9zWCH/LWamEGjFxcIpKAYES2ztxzeBID1Ye7W2DQfGkBGTP
 X31kyDI8n5jo+4A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100838_465279_10F0F440 
X-CRM114-Status: GOOD (  14.34  )
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

Improves readability and makes splitting power on function in following
commit easier.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index ff884e04ad4c8..71d9b747ccfc5 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -518,22 +518,11 @@ static struct attribute *stmfts_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(stmfts_sysfs);
 
-static int stmfts_power_on(struct stmfts_data *sdata)
+static int stmfts_read_system_info(struct stmfts_data *sdata)
 {
 	int err;
 	u8 reg[8];
 
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
 	err = i2c_smbus_read_i2c_block_data(sdata->client, STMFTS_READ_INFO,
 					    sizeof(reg), reg);
 	if (err < 0)
@@ -547,6 +536,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	sdata->config_id = reg[4];
 	sdata->config_ver = reg[5];
 
+	return 0;
+}
+
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
+
+	err = stmfts_read_system_info(sdata);
+	if (err)
+		return err;
+
 	enable_irq(sdata->client->irq);
 
 	msleep(50);

-- 
2.53.0



