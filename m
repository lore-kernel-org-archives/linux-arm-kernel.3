Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD10C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNQAhRGX/wh34NPimgYMcgnXW/agDCzGruasLJVYJVs=; b=IiJ8FmBXgOJpPlN+tGpydXpoVY
	LCocMnBf79EKuHWWU/fisYI45EoLBM/AEp8vF5oT56PZAVfGagE/wzUNJVViLnnkURpHEdo7be2Rf
	bpwLbGwKcMfGfIUJ0m2WvEgCXeebu94ps5gROoZpJ6dRAtzhheqJwCwwRb7XDz7ldxA7Te7spAwsB
	BgXwzFthBVq+PHHn7C40a2nmKvpW8E5zjn/NqymBXVXYAfHJwMHXQ5RrcJ3WxXqEt5EqEocQs/J8t
	qwAWTwUgEUFn/b/PN/QR7H4PF/IpMWBOqOp3EIR2YP8OCjgE6BIR+SHx1rJdMEqOWvsb+Z1VbCMbB
	UeryEc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBdu-0000000B76w-41Ju;
	Thu, 06 Mar 2025 13:52:06 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBWy-0000000B5je-0jBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:44:57 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B74E3A0C5E;
	Thu,  6 Mar 2025 14:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=eNQAhRGX/wh34NPimgYM
	cgnXW/agDCzGruasLJVYJVs=; b=O+F9Cfm/viKK3zcMxZNg+2mYzecMbzAGFR21
	E3wb/NULHc7hwYf2jpgbKjs6iwbHIlMKIILKUo/wpuWoaVCdCd9GGzwT2sAk5Iew
	4VkrGRdjYHuN0lM95Li2PDAnYu09Cay/JFfNFs9yXxDG8h4/3SDgzsTKhAmuf4U4
	/WPhyZEP7HED0O2GrJ8mdZXB0Vfu5uuTsZsRb8GH9CmUCcB7ULSZ4IdarsOL5FNo
	tAMBd3ClQ/sQBWBzDx1WFbG6S8gM5+uRxWqiAKqVzz3LSMRlOeZEyVef25SgryL2
	BztuEDEiISIBM+2k/9B03oHi2rynoP/59WQffyjSfOXzTOVOvKVQ/pszptVdMbvu
	JZGhG1sCb8V4e1+dG4fG0eAXWXp4aHXG7LcsMdo6tia597MH+86QTTXYTSLArM8R
	LAYOHGBcQTZN0yKU/fpeFviKdIqzq+MUXQgTl5DVd/IUaFMqOKGNjlsI5VAUaNbV
	ZKuhhvzC1CNUjGyHnrnqfZ61MuRnsT8HEa6Z502im+WYQixhXWQOZGsU0CXQ/afQ
	fuIMLnNAPOT9cjhHvx3ZKybhT2o3F6EhwzKfr4w8GdM5XQDx1feKHt9COgZIGMU2
	SIl+9FGG3KPvB8bTWE/w5e2hSPHervFXsYVQCCh/n4cnTaCB/7n/Pmg3Wc5rX8RX
	LDHu3K0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "William
 Breathitt Gray" <wbg@kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v8 2/2] counter: microchip-tcb-capture: Add capture extensions for registers RA/RB
Date: Thu, 6 Mar 2025 14:44:37 +0100
Message-ID: <20250306134441.582819-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306134441.582819-1-csokas.bence@prolan.hu>
References: <20250306134441.582819-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741268685;VERSION=7985;MC=3713256715;ID=1566298;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637C6A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_054456_654036_81E9D22D 
X-CRM114-Status: GOOD (  13.19  )
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

TCB hardware is capable of capturing the timer value to registers RA and
RB. Add these registers as capture extensions.

Acked-by: William Breathitt Gray <wbg@kernel.org>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Add IRQs
    Changes in v3:
    * Move IRQs to previous patch
    Changes in v4:
    * Return the status of the regmap_*() operations
    * Add names for the extension numbers
    Changes in v6:
    * Remove RC, as it is not a capture register
    Changes in v7:
    * Change enums to #define's in UAPI header
    * Return early on error in `mchp_tc_count_cap_read()`
    Changes in v8:
    * Collect William's tag

 drivers/counter/microchip-tcb-capture.c       | 58 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  6 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 16707099bd69..aeaee6e0245e 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -253,6 +253,62 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_cap_read(struct counter_device *counter,
+				  struct counter_count *count, size_t idx, u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+	int ret;
+
+	switch (idx) {
+	case COUNTER_MCHP_EXCAP_RA:
+		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		break;
+	case COUNTER_MCHP_EXCAP_RB:
+		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_cap_write(struct counter_device *counter,
+				   struct counter_count *count, size_t idx, u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	int ret;
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	switch (idx) {
+	case COUNTER_MCHP_EXCAP_RA:
+		ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), val);
+		break;
+	case COUNTER_MCHP_EXCAP_RB:
+		ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 2);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -261,6 +317,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
index f3ef315fe9f6..136e2faa7730 100644
--- a/include/uapi/linux/counter/microchip-tcb-capture.h
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -12,6 +12,8 @@
  * Count 0
  * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
  * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
+ * \__  Extension capture0    (RA register)
+ * \__  Extension capture1    (RB register)
  *
  * It also supports the following events:
  *
@@ -25,6 +27,10 @@
  * - RC compare triggered
  */
 
+/* Capture extensions */
+#define COUNTER_MCHP_EXCAP_RA 0
+#define COUNTER_MCHP_EXCAP_RB 1
+
 /* Event channels */
 #define COUNTER_MCHP_EVCHN_CV 0
 #define COUNTER_MCHP_EVCHN_RA 0
-- 
2.48.1



