Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE910FC45A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHoEfjUX693TNvJFVSuhnWaIjHfHyc0F+R/QfpOZw6w=; b=YKe8p6QwaqPnzQLfsYC/VM+JKo
	2eksIhKWuteg9SN9f6n0tdJ6vDHx3jvvdTGroa+7mfTJZ1gXz4a5V7N/cP+6t7Vu9B+lD8IClHtec
	2qKsteY1oIiUG7HidBePuSorFNsyhkpbgAcuK/lAx21jaomNk59YmNn0kAG72uMjNiIQkrzMFvF1q
	DKBsI6DW/HERMwbRW6FCecBy668pYiDuCt/3NPb2WfeWXELbPNg0WIcJLCkgAfhJFOQ5FLF/3DACt
	iqpaBjADKCO5PCRV7snlVJN520G3PCFQODs5SbxR6qXDw3TuSgvLLLDpuSurHV8hZzWf3V3D9zQXq
	nXyFykyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBl-00000009TDN-1pGf;
	Wed, 08 Apr 2026 22:15:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBg-00000009T8b-1gGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2378144513;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D56B6C4AF11;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LFtLkyc5y3Y4zaUhkX9mFib8lqm3w0H6It8p0Uoeeu3JR6kSzM2i5Z/upk5ejlGd0
	 508BKqA2F7BXJRPfKKkHMTUYr/Rq36NWJCEdgp/mAX11VM2lWiEueRuaz9VfLUjL0N
	 QeB++/1sewqYrEzN5peujgE4KeL7o1E+mbCM8tls4tECiK8PkhN8qfMaAwadPYR8v7
	 7D0FaMooXP8h3QZzbPejjFvmyLTK2sSehKFyoGvc53PLZSeUYmJmOFRZZdshPiTgFY
	 imz4txeF2iXgc18fJ+q+qXMQJzmidZrPgw/ZPabcIp3HwpebTPMVgVNdXZwR3JzaHR
	 N/g7heHDojI6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C688E10FC453;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:47 +0200
Subject: [PATCH v4 04/11] Input: stmfts - abstract reading information from
 the firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-4-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MRRMNTeMVS8qh5Y3wcBKjF6ySEKPpTml4To4kFWgqxE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSDBefFkQ6pmg/ESv1rmphll3moGBi4877/
 AdaIOG9cUOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 ci2eEADECFzczHHY3Pw3nIE/rotnNSqUwkRYNMEFGe9E4VNC5iFgbpJXPFfYNTTC4gXdevtmLO1
 7QJz6f+uU0/a3G2yD3nPkQS83GYu4J7uDTFtkuQsDQ18s53YPBE8qSYkQXoJPPpd2DHPbdq5YKe
 0jIKBqpffX5dmbgcc2eRxHV5gV97Sw7cgl9VKNxanE9NWpZr3NV5fc7MsrcKWSwaljGS43jDCIY
 KEf9IyFIfwtdSymkLbG3JTHR6JfQYoTpeXAbG6pjARjAclR/w1o8Vz79Ywj757eGg6Eg+MyQjPk
 sg5GdSWX2qjTaxMaiUjXoXjG/ZHqp8Y5RbH+wGxA6wYgq4Y7/4D/QqG2tWSqVzSCrY4feS7/6s0
 JGAdBH5Yz6UslhhAmjf5WM99L7LfvmCzoXdTu3XZupZ2G+VXs8C4NxsYMjEdcDjJaabDo7P0xfd
 Zzl/UgcHiMIgvEiYrYJOX9LdVyplaOE4sHSKD4nfallEMxdDX+XeMIYEAtFMDjCbVk5X+j+Vz41
 X7BSz4YcnVUuenHs66nZRHYyIl3RH8oyAnoIeeHg2jK9gjV3PuxDzCQ5ADe6rgC8KSW/SI340vc
 AWWcgF7gyLrOQVjwJadnY1XIvwgrAkfOZMPD3HQ5mtlmbLawInYnA+Aq1p4tBv3NGyfahtAAu6N
 WampsCjGPsTGc0A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151552_502952_4D4127B6 
X-CRM114-Status: GOOD (  14.31  )
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



