Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA27FD0077
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN5A2y+SjUgmdgUGyyGBsUaJKm/qRSxmUJpgnZRRecY=; b=Aj2KaG3BoDGkgxROjDW19W5ERU
	PsBZCNaxXnVF4/MG/XqWCIJM5qbQi7qY9GYChheN+yLAhjzKh1e+50Ecm8CFfT+As8e3dtR5BAp7U
	ZZfmjRTwnwWNML0pMOErno3/ZzWiPlYzDELgzXC+fUPujmjMhi0Be6mobniUqCpPRdwuQmNwJRrET
	z9Qshwg0ZZPa0FMrQ/TyfaCDq+V7yTMes9u2Vmh8dMqVk/2peU7FJC/38pEnAnJ5ZVunLS9DiEtZY
	S2eq3a+5FlWY33beKnWMPkGUPlNW+Bdm/Yz7Qedq7V+Q0ZBI9/yRQ2yX5NsXImOQAb3QM1tdHLX1R
	3XSzV6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwu-0000000BjsX-1VlB;
	Sun, 01 Mar 2026 17:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwr-0000000BjoR-1L7P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3DC844564;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EB7DC2BCB5;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=nhmogOI+WjaFzj49pGOROXn2gYZ4HvN2zLn5fUjRH3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p3v8e5qIM3sUce+oVO4KGoQXtVISLeKXjoFqFA6Y9jGq4C6c3VmB2OW5JWf/i0hAM
	 bGu0fUSzHB6+kjkul0CbTuf7XQjW3ASdEfG5uwutbFAChCH1aR1KLaA06jvZpzRV+3
	 mdxUBA1e7bYyV+O5krX5P7/TuIxBnb1mpKb+VGm+mKehxKWmIt73loHZ0gLziTfliJ
	 IRWmsvhyJWkI9JIyt5O6nvsI1q/A/Cb5K+FLONjsZc6BKNixlBjE23607WMAB+8Hff
	 /aPkiDh2mOYYP3/IR2uUAHSNqU8eEAIwOwUFdynxN5q6IYu+FiNXOUVxakeFFhsulO
	 UtkyvFlacZI/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649BEFD0073;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:17 +0100
Subject: [PATCH 03/10] Input: stmfts - abstract reading information from
 the firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=LcR268CsLFX9IfFbR3m8SNFdiJ3g92w+33Vjc2KTWvw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyUWy/xfoO2DMWkvnS8Fo3kqaxb091fLqkJs
 yr4BN24YZ+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cg5jD/0b2uRo3rzxQmo5CcalkkF0xubiFdZrbRZAflq92qK4+zrRzzXq42iZ5nMk/BYbtzm100G
 WpYXVpvzJXkhvbkF+fm4L+ZhYeAQ7Lp/FSrDrY0kcwlCDSMMsu5ptrIUTIjE1sL/Jp6oV571J6U
 +Nxio3frQuqOy1QTnq0Cb56/pC8eLFw/kkfxxoCYJ7w5iXU3Azp42xT9FeryOBosVKSUuCzYFZ5
 Y0r+x5SWY5t5UHPnni8piwCaJUqGZNh2kdOrhzC+7UTVp2yCuRWu1LFpr3y6n1kn/wIbnfn66d6
 Fglo+sr6ah9ROWcp1taGKX6OJIyQXOfUU5+do75qwLBlVwsaCRuxwX6f3UEjSo0MhqPhL9NbrHr
 igvOnKr8yBkIbKIXLmJn9nlC/AVE52hWUT3OVEi4tXAOoh08vMgRQWJDTusd/rboo6xv9PmJat5
 zwhTo5GTVGsANu33wnJKGIrw88FDW+/UMtvCRSA2VTbN8RWVpPECA8WkCdAmIWjGfWaf8lhB3fp
 rD9nKKpNJCzSbM6knCg69dXSXwVy8Am/+wNeioc3SJ9+0ZZ3I6De4GceMNKCwdqTxlurcd9DH8q
 enUW0gmPcWmuksR181zBO0HsFFG4vT6l5bE/U9SKeRE7QjEcyNPNRduVz6wk9OO7MIUzQtePR9b
 oWPsh/uRQCEpo7A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095121_430436_F88B0AE6 
X-CRM114-Status: GOOD (  14.17  )
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
---
 drivers/input/touchscreen/stmfts.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 7c0f94ba49464..db2dd0bb59fcc 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -519,22 +519,11 @@ static struct attribute *stmfts_sysfs_attrs[] = {
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
@@ -548,6 +537,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
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
2.51.0



