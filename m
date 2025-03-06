Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CFAC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvUClJvCvROtSsX/B8tse9df1SrMaEYA9Byj/NN1S5o=; b=YJ+V3JrzfHCQhVNRwi/8viC/P7
	reJxDVUAUYx99JVKiPPyuZRlRJgT27ErLqvOtl2n8JRN5njolWLhe8ZnU6vQoOCNz7MC02wfv9q7f
	Jzx9bN6cOlGy/FJqJlPpmZ9sKHThubm04SfT8eKYsJ9NK3Wg47lGo2Uu8tjZ4/wANNWX5TJIXzAma
	7H/t4khVIDZMfADrRK2b7/6s/cpdPe07QQRfyDdbMihw8eUDyc32GZS91ZEPkYugwp7sGIYfFUiWQ
	/hIXEyD6XMeisqEedZG8OwLB/RCJVQAjSkEY09TeF48JcMF2Ok/cSS7wUIQwAFB3Wfnp8xbFdcbEL
	fN6gXuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6RQ-0000000AJTQ-3Y08;
	Thu, 06 Mar 2025 08:18:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5Ir-0000000AAS9-0fc6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 07:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC015A44A84;
	Thu,  6 Mar 2025 07:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D99C4CEED;
	Thu,  6 Mar 2025 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741244756;
	bh=0pW/AzRF/RuX+cwE3R6LyUhFONr4bslHUHFeHtCPcU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LngcmC5hlaMxZxKui39ZWm3OV7a8sOWHNSWyRPVrCBcU5tgJpETNKoILjc2V0v7Ft
	 B5ARU6Mq3XMQhSytdSe/GTY7/AAgHbFJ9ThhpJwws0kVBImfTYqL54bS6ZnEx2lAPs
	 NmYMDhSZmJFHtwbXfZo6DxyEvK/qeaJuJb2YQcjR2kTnIKSghdhUU3r0atc8q4c0Ju
	 D6QVS5goosTY45uzv0oW6QxlCxRCvWKSDbe2uJ5aWBTxHDeYbzeFbcAJz19OC6hvlo
	 bxz461xpxbEzGUNO+1/VgJe6qo7QTawxnlj/If1wFr9RTY3CW2eZ4cSlv+qkGhxyVy
	 Ouoyas0f4ld1w==
From: William Breathitt Gray <wbg@kernel.org>
Date: Thu, 06 Mar 2025 16:05:44 +0900
Subject: [PATCH 2/2] counter: microchip-tcb-capture: Add support for RC
 Compare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-introduce-compare-component-v1-2-93993b3dca9c@kernel.org>
References: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
In-Reply-To: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
To: csokas.bence@prolan.hu, Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=wbg@kernel.org;
 h=from:subject:message-id; bh=0pW/AzRF/RuX+cwE3R6LyUhFONr4bslHUHFeHtCPcU8=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOknPQN+hHXN4+LN2LD/lehFfe9NrXdmsbyaqhYsbN4xL
 90pVNC6o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZiIvhDDH449rk1dhyMEJCZL
 Wz9msHgacf+Mt/CddxPzrnw//7RUNJnhf6Fr2Ra7ySGTe6PP/C6+9vOr06yGC2cSWqSZdBeVqnJ
 4MgMA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_230557_373746_45E6D587 
X-CRM114-Status: GOOD (  11.76  )
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

In Capture mode, the RC register serves as a compare register for the
Timer Counter Channel. When a the Counter Value reaches the RC value, a
RC Compare event occurs (COUNTER_EVENT_THRESHOLD). This patch exposes
the RC register to userspace as the 'compare' Count extension, thus
allowing users to configure the threshold condition for these events.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/counter/microchip-tcb-capture.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d18edf5de5a2b33f2f72571deefb7..e32f8d324cb373909e0a093b14d742fa0a93e07e 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -247,6 +247,37 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_compare_read(struct counter_device *counter, struct counter_count *count,
+				      u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+	int ret;
+
+	ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), &cnt);
+	if (ret < 0)
+		return ret;
+
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_compare_write(struct counter_device *counter, struct counter_count *count,
+				       u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	return regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), val);
+}
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_COMPARE(mchp_tc_count_compare_read, mchp_tc_count_compare_write),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -255,6 +286,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 

-- 
2.48.1


