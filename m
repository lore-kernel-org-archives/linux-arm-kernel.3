Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F2C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3gvCZwllnDs36gmGooR78bQv9+iVTrO6OW7darmJIQ=; b=jbGNfdqe74Pe472qbGYc7Cy+J6
	c1cDGVLo5QsTScWGcQKfmLFpaScIpHCuKGkZGDFj6yMYPUQ/7aQC63FZnUDAtv7St7+46BtKQzmJv
	uAZq9NhMLeU9+FKALVSJ5jy3WScSwLySNG+sRjbtQSv9PAF/vw6mf7nwz4h2fwBXpO/Ln0nC9RAOD
	EJze/U/YJP29Ppz6cNeqmihM8z0laD1cXqFX5kDsIuF4jmGS1/fxXg8NmaObCTNxmNO17tZIUR0r7
	ubm1CCgSBNABgzz8ofPaXRGRCP0/G3JqPFN3wiWMhj6y/irLlaOCm2Ioq3bubA5mSwnJsj9Hy+jCc
	TEMq+YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfEB-00000007p4S-2GL0;
	Thu, 27 Feb 2025 14:51:07 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnern-00000007jKU-3iJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:28:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 64809A0E7C;
	Thu, 27 Feb 2025 15:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=N3gvCZwllnDs36gmGooR
	78bQv9+iVTrO6OW7darmJIQ=; b=Dy5eK6M34lgjGdps+bVp+rDtcWlSyw4olQCN
	ZkV25IVDwwpWDqiVuj5V1TJS1YfAe3CXW//EgWO3lu21EOI7S/rf7zkapWiYCfOU
	AbEwhmlNRaqWSIpiAIUcmlSan/Y/DNvJw9zEkHiUDT8ffhqxxKuBmxpg1VAKcVsZ
	XWIvCOeqDfXfAgpAQmw0bT+EfKaVV8+8sfzCXUwfUkhumYmLHYnp5LWsYW0MUXuq
	0o8xlzu8uT8xlYHeFpidhZQKRzQhNzL0ReMXsfuz9/G4wuXYaYQB/8GjsnFn1OsR
	bMv8mebaMe9SZ83TeNGu0ty0Giui8J6yoZ/Vlsm5iohZi9urChRNoZI0YEQ2R9d2
	az/k6nABXqHcwOI21AxQHHmKE5CGSEBh6p0kQl9aDZ4/qHTZ/ffDZlxsH4DENOMs
	i/l91FJ55z4+8S3XNJ0mOIKfZCVsFP/EpaOCqtFYBPhhif40NaaD+GtJD4EJooDn
	NjAOiSVQ/cRWQnWM/cLjE4JF/rPHkBzdgnUw395dvDWwFVD2/Rz7+ogtLgSkevCd
	vSKRAAvXoZ3vFbOsdRLKK3IcZQ1QFfQfLD/74uSBGnOQ5Hr6vxJLsunBtyYQhpPX
	txeYgsgjWch8zm6esVjkSRnwTOik5Ol6QU4wLYxGesUK+dUwSm8sK7wPqXarNUwQ
	BRoF40I=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v5 3/3] counter: microchip-tcb-capture: Add capture extensions for registers RA-RC
Date: Thu, 27 Feb 2025 15:27:48 +0100
Message-ID: <20250227142751.61496-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142751.61496-1-csokas.bence@prolan.hu>
References: <20250227142751.61496-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740666477;VERSION=7985;MC=1859151475;ID=1457601;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062800_103569_67A4A686 
X-CRM114-Status: GOOD (  12.91  )
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
RB. On top, it is capable of triggering on compare against a third
register, RC. Add these registers as extensions.

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

 drivers/counter/microchip-tcb-capture.c       | 62 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  9 +++
 2 files changed, 71 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index cc12c2e2113a..369f69aaf14f 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -254,6 +254,66 @@ static int mchp_tc_count_read(struct counter_device *counter,
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
+	case COUNTER_MCHP_EXCAP_RC:
+		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), &cnt);
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
+	case COUNTER_MCHP_EXCAP_RC:
+		ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 3);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -262,6 +322,8 @@ static struct counter_count mchp_tc_counts[] = {
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



