Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgGNxrUr8LJkEzv7yIWYEgpM/6tPuhZMATjWdJfm/zw=; b=Wm1hhLJn/RqWKnblIWIAXlIdqn
	yA7ipAFNGFZkFAM7lw3viZczTqfksRCX90c6/5VkJWvNm7z+DpkXkGlnr52YsMVLDKvq+HCGJcCcd
	mV8XtUwsdfdfXV6zZTSaCeNp5bXw2iDZOc5TuqTIjEyEv8gPBjsW8v30qZsNFZ+ehe5DpkmSwtmbB
	hsg8q0njByGCYUHHsj0mxveIXVAQnT08FJVU/cVqKmHMq3o6Zksbv/L/yYxiYet4uDKVQMZ7q3CyE
	wQJNVHsz4U7Y1MAuedbMBE8E6U2IBbDj0j8gOTUYCRxRmA/cXd9voGai8z53Hkzx557xOzV8Ocv19
	Y1kiashQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh6-00000008TiD-358H;
	Thu, 27 Feb 2025 19:37:16 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf4S-00000007mrV-0eSf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:41:05 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B910CA02D7;
	Thu, 27 Feb 2025 15:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=RgGNxrUr8LJkEzv7yIWY
	EgpM/6tPuhZMATjWdJfm/zw=; b=NXs/Siajzan1KhEv6oKWql6dKV5jRSIIaMJc
	qEkz6blskcKq/6QfeXZgj8sePbd/sN+hlrgRasMgcBJu071PqzNojDDv8c3DCiZe
	qgq2d5fxsdMSXD6kwsvzhp0LVB4xQnhFjwv46WX7byeY6uSOQ9ns3TZtS+Qx7LSi
	0xBTPKReuSfI9DqkDPvGHhXN+d/w55MjZKNuIK/6UQR/I5EMkvH1Z7ULybrHZdEC
	kGMTIiFpZFm64PDojncyh4yYqibJaq+FWQyt0FBJDuodqq/LHgc3A/GBhfsWvK6T
	zogrPu5QZhvkxq2gK79Yvb6Z4Zld5qYJQdyv9gNdo1Ez8acSve2Evih8CkjCDLyw
	Kh0tt/IUwEw3cjh75bcPeX1xqki7T2Hka5ZW6Y7I7Ph9reJWQI4NUhf9BHg54Cxq
	Mchg/47qe/JE2shmX8hOYN/s4eOVvl7MKUmSbEiIYF2R/+Kl+lj6dqMK8mE/6wzD
	nS+2ReFSgAIA4/tLTN8hdooTj4CHKb2JCxo9ncN0FHhkYahEfskEh6xdyoDZ6A1a
	vfyJmti7pk8bOfrtPwckSaSXQF6zyu57PozQyPEC69Z+4sTE09FbIxfhIw2n4Tqf
	vCN4crg/RNOU7LrLm4Zsz1GCG+Y5HIcjHD5SzvpjiXeKIeVmU9ZNGTYHtXXfPWiM
	y9u2+j0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v6 3/3] counter: microchip-tcb-capture: Add capture extensions for registers RA/RB
Date: Thu, 27 Feb 2025 15:40:20 +0100
Message-ID: <20250227144023.64530-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227144023.64530-1-csokas.bence@prolan.hu>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740667261;VERSION=7985;MC=2016132060;ID=1459478;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064104_372955_CF7EDE16 
X-CRM114-Status: GOOD (  13.08  )
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

 drivers/counter/microchip-tcb-capture.c       | 56 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  9 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index cc12c2e2113a..4ba5e29138e7 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -254,6 +254,60 @@ static int mchp_tc_count_read(struct counter_device *counter,
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
+	if (!ret)
+		*val = cnt;
+
+	return ret;
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
@@ -262,6 +316,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
index ee72f1463594..5c015fafe42c 100644
--- a/include/uapi/linux/counter/microchip-tcb-capture.h
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -12,6 +12,9 @@
  * Count 0
  * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
  * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
+ * \__  Extension capture0    (RA register)
+ * \__  Extension capture1    (RB register)
+ * \__  Extension capture2    (RC register)
  *
  * It also supports the following events:
  *
@@ -30,6 +33,12 @@ enum counter_mchp_signals {
 	COUNTER_MCHP_SIG_TIOB,
 };
 
+enum counter_mchp_capture_extensions {
+	COUNTER_MCHP_EXCAP_RA,
+	COUNTER_MCHP_EXCAP_RB,
+	COUNTER_MCHP_EXCAP_RC,
+};
+
 enum counter_mchp_event_channels {
 	COUNTER_MCHP_EVCHN_CV = 0,
 	COUNTER_MCHP_EVCHN_RA = 0,
-- 
2.48.1



