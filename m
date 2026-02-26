Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC0FD9E14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fpFL8gAw4IAHZejDMtFioFGSH6+h+EUQlY1TRzKiVrk=; b=iBu1ASFTwpjNJstYP4vWZvSQVS
	3bwnuWg4pr71IiAmik+V2IB9isNZc+0ZGHx/iwKzIRy5EvKnA4cmNdgj06Lo4WliJyJiZNruFUXVR
	5EmxTC1KEVI8A6D4NCYTaLRodLF+JOrtr1Xg/Xzq67JdInBuQMUH+jWFTwLkuKMpK2/kUBAit6Yjr
	EcSTNm2+yfv2/87fMDhMAAfsepEIL/ltgRmGYK//LDkY81obluLMvHZYPbSXqvon9zECzqksouO9N
	QbFdaMurJ6yzJ9/2uEsXMm1wpjlg+xTKmFJtjeyYrNvr248qQioIl6beLDM4PEzE0SCoz54Vrevc4
	gGGVlRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjAn-00000007GLx-0QTB;
	Thu, 26 Feb 2026 21:45:29 +0000
Received: from mailgate02.uberspace.is ([2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjAj-00000007GKk-3B1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:45:28 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 156F718015F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 22:45:10 +0100 (CET)
Received: (qmail 6313 invoked by uid 988); 26 Feb 2026 21:45:08 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 26 Feb 2026 22:45:07 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7915: add debug query from WA firmware
Date: Thu, 26 Feb 2026 22:45:00 +0100
Message-ID: <20260226214502.2561168-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=7k4vYrbJ6xrpxAjo9hJNkIdxQq6FFLUNTmda5XOMLE0=;
	b=v0EcSVJyA3j4V41/5QzOj4WBK9JMFD9bud0Fewr2BKZ1XkNJUPXyPZ7rl9x44lt0ouI5GhVCKx
	JPV9YEaiQggB72quWuW33gzsZ5ZQdturHuYScCFFVXJyDVRRBjeWzmXj9MSxqBzRJOVuBcvdNE5S
	2dTgcMSnS/maZWYSHje+aVwSnynuyPazCqkzoaQctsoJd61gdO/ohKKLnNxKFNGOkoBcP/CgwPve
	GoIVhkzzv7nxBcNxhserfT9BuQJT5FwSR3T0/2GoNyjO7FuOJv+JxGmDKxNMTzayTuqzO8Ca3XWt
	speoY+nQoVPT4xHtZIsyOeS+aFNX2KYA9+STP5mWvYqvGIiZpJwz9rStNC7oyW4wLnX63/Z6ncAA
	cpYP5Q48OktQd+KTpXy8LWEamMaakSdG6+U6GpP4l/WqdePWxGhZCNu0svynKJtRQijkfxN7nOen
	Ox0abD9a5k6fgw9uhwuLCC7Z97IKzeHyGsXny/x06nDq+ol5+Kx5j4dVAaQG0lMdapDrp1LL2obO
	3RdW+a1iVLRBnrdl8Ql+PhotOry6hJ1E4lBAioLWfGqS3SkFeOi6aNxQK7D88Ym8QpevC0nkwtW+
	S3AfEFLE0NmdxZoQMkz8SstnuEmTEFKbPdR/uL2L5AFqBY9hrD67KVzOanY9VyM6fHe3sesfmDtq
	M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_134526_234220_BE10B963 
X-CRM114-Status: GOOD (  13.61  )
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

Add a new file to the mt76 debugfs to allow querying internal state
information from the WA firmware.

This allows to extract more information from the internal queue
structures and configured limits.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 26ed3745af43e..018b1c70b524b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -603,6 +603,86 @@ mt7915_fw_debug_wa_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug_wa, mt7915_fw_debug_wa_get,
 			 mt7915_fw_debug_wa_set, "%lld\n");
 
+struct {
+	u8 idx;
+	u8 query_cmd;
+	char *description;
+} mt7915_fw_wa_debug_query[] = {
+	{ 0, 0x16, "MSDU drop info" },
+	{ 1, 0x17, "AC queue tail drop" },
+	{ 2, 0x19, "TX Free info" },
+	{ 3, 0x20, "BSS Table" },
+	{ 4, 0x21, "STA records" },
+};
+
+static ssize_t
+mt7915_fw_query_wa_set(struct file *file, const char __user *user_buf,
+		       size_t count, loff_t *ppos)
+{
+	struct mt7915_phy *phy = file->private_data;
+	struct mt7915_dev *dev = phy->dev;
+	char buf[16];
+	u16 val;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
+
+	if (kstrtou16(buf, 0, &val))
+		return -EINVAL;
+
+	for (int i = 0; i < ARRAY_SIZE(mt7915_fw_wa_debug_query); i++) {
+		if (val != mt7915_fw_wa_debug_query[i].idx)
+			continue;
+
+		mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
+				  mt7915_fw_wa_debug_query[i].query_cmd,
+				  0, 0);
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t
+mt7915_fw_query_wa_get(struct file *file, char __user *user_buf,
+		       size_t count, loff_t *ppos)
+{
+	static const size_t bufsz = 1024;
+	ssize_t ret;
+	char *buff;
+	int desc = 0;
+	int i;
+
+	buff = kmalloc(bufsz, GFP_KERNEL);
+	if (!buff)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(mt7915_fw_wa_debug_query); i++) {
+		desc += scnprintf(buff + desc, bufsz - desc,
+				  "%d: %s\n", mt7915_fw_wa_debug_query[i].idx,
+				  mt7915_fw_wa_debug_query[i].description);
+	}
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buff, desc);
+	kfree(buff);
+	return ret;
+}
+
+static const struct file_operations fw_query_wa_fops = {
+	.write = mt7915_fw_query_wa_set,
+	.read = mt7915_fw_query_wa_get,
+	.open = simple_open,
+	.llseek = default_llseek,
+};
+
 static struct dentry *
 create_buf_file_cb(const char *filename, struct dentry *parent, umode_t mode,
 		   struct rchan_buf *buf, int *is_global)
@@ -1310,6 +1390,7 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 			    &mt7915_sys_recovery_ops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
+	debugfs_create_file("fw_query_wa", 0600, dir, dev, &fw_query_wa_fops);
 	debugfs_create_file("fw_debug_bin", 0600, dir, dev, &fops_fw_debug_bin);
 	debugfs_create_file("fw_util_wm", 0400, dir, dev,
 			    &mt7915_fw_util_wm_fops);
-- 
2.51.0


