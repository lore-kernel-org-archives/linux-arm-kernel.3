Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24231C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2yIlVyyOPbQ4NJXMaimxxzGIHYKCdR1oZZmLPUjNQg=; b=hrWGtnqH4QH9Z8F6ltmP1AIzz1
	j7n0BDL1Oi+1tG5eqRGrPmOoxD8Av64D6UxvVYeCTvnXI59vVUrZ+y24m9b4ltz7GZ6G0HI7euzlI
	KjjWQE5stFaKRAPqHpXWzoyG7S5SnSU9U2LnwEmCeCP5gWJStycuvIQK9QX+ROrxpzyWfOePR3311
	JmyPk7lmEKNFYrdkEYVhKbRD6Hg8t76LIxpngT/ZALN2N4K0IoXYavaq8fhqB3q3AwBdsriyOJgtU
	D4H7XaQI2gbvSALm9FOskvRiV1OQsPhKQWR589cyvyfdYJySbkEng1+VnlU3EpWiXE2UeIiczVcZA
	3Bkt4Crg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykt-00000004BAO-0Czc;
	Mon, 17 Feb 2025 10:53:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCJ-000000045Kq-0YT9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so4709015a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787473; x=1740392273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2yIlVyyOPbQ4NJXMaimxxzGIHYKCdR1oZZmLPUjNQg=;
        b=gBMvE7sXCWDvADV9v99mmFyrKsINgedV15RaS7Ff7aesfmxMe3BCx4lObREl5Waz93
         HzYv7wC9Br1gAOygsVWSA0CvDS8qMMjIGKZYae7/c8mYgQR+kyPBtk+j+KcIA5ADFp2o
         U9dXoAaDke7cHsO64SUIuxwW1i7mmAN99ZyuNEu5/Z9vWzS1mV2yXDBnj3g3d/hFbg1o
         bNySKHI+a1UxctqcQEFPagESpkNAUlYDDzA+pf/bLbbjLF7FT2FOGc9qmaJ4a+OwNTac
         QPzAJCEaERdsgKKyEphXnPW6odhqdHfOoI+ikhZkdp+en+iaT+s5yzxu2JVP3ouPu67O
         tiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787473; x=1740392273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2yIlVyyOPbQ4NJXMaimxxzGIHYKCdR1oZZmLPUjNQg=;
        b=QYvQMdmHE/u8f2keC3fs5X+j+Aw3RlnnTVByjnC4U0GU5Gg/Hv1Vv7FSslss56xnCG
         /tMUrzBkjumhYeYmOfD2CbEY2yxLFgvMe2CWouvOhd4cXz3tWHC/yHgAHXrU84g6YN9i
         ePVvdFA2FV5v4zKWvLlJNJ8alOkY7/9F1LJRe58HupYxrm5NaKRSIjNpVeBXGGGN9gNg
         aVjVmK4udDaH+dnwfBwR8t5/E3VRPAgSaph17I+bfSyl6v5E5kX9uGVj7uOJN4m1On9v
         aOt6kDWxgFAneLGukJqnzF1iaM8wXWBGB3/GhhxxHqt+57Cp9tejW+qmw96eQDJ3h5ig
         CLUA==
X-Forwarded-Encrypted: i=1; AJvYcCVHPn8i4ETVSG02DJYOuoi2psFkkbat4uEaGbp0TpDMhC13JG5fcR+7Vzcfv4YqGiGgmrkP5cx2VbpGKLzv9ZM6@lists.infradead.org
X-Gm-Message-State: AOJu0YxKLl0zHAphEGBoVC8fw4ul5093ShYAyhe2nzttZv9tveh8so+b
	Y+EbTrHRx6XtwmupMMGR56HhZOwGjlGI3EG8hZ1FnNRDII3ilbutM1750PIXAD0=
X-Gm-Gg: ASbGncv7d2og8C97rHXeh9uwljcSZNVn3q5bHzEt+zGnNRQHun//G06ot/M/BHeXEVE
	SihY/25FFunIyk9hs7ly82/09/j7VtqdFg4+qdRuuEX8mUzwQw4ZwWAqh/apUzqWLJLIRyVZ0RE
	OFtgeQL/HwlQvYFZ8DjJUzpAogh2Vl+k32cdzqDkxEfLcGP9qfjeA5IrHvvu7Bn5u9bI8/2VtE6
	RvWW8S+BSVhwObkC0HZNRfg20QCgKqbbdemV7r7GZQwe0rIyPrN64eYTK01dzYMOjpa5j1jI7cI
	5JwK154VMxuJMUVl14zWW4Io
X-Google-Smtp-Source: AGHT+IGpx0/whONuJWGo4HwkqVqYsCJmEUhrUJNrzL9FCk0mF7dow3SMs9U25x2XZBwWQZmzKpeEtw==
X-Received: by 2002:a05:6402:5107:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5e036139d68mr21109346a12.22.1739787473355;
        Mon, 17 Feb 2025 02:17:53 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:53 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 05/10] pstore: implement core area registration
Date: Mon, 17 Feb 2025 12:17:01 +0200
Message-ID: <20250217101706.2104498-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021755_173136_0401D629 
X-CRM114-Status: GOOD (  16.70  )
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

Implement core area registration mechanism.
Implement directly mapped zone corespoding to core areas.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 fs/pstore/platform.c   | 67 ++++++++++++++++++++++++++++++++++++
 fs/pstore/zone.c       | 77 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pstore.h | 16 +++++++++
 3 files changed, 160 insertions(+)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index e20e60b88727..32448d9dd316 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -68,6 +68,7 @@ static DECLARE_WORK(pstore_work, pstore_dowork);
  * the filesystem mount/unmount routines.
  */
 static DEFINE_MUTEX(psinfo_lock);
+static DEFINE_MUTEX(ps_dmr_lock);
 struct pstore_info *psinfo;
 
 static char *backend;
@@ -99,6 +100,12 @@ MODULE_PARM_DESC(kmsg_bytes, "amount of kernel log to snapshot (in bytes)");
 
 static void *compress_workspace;
 
+static LIST_HEAD(rec_list);
+struct rec_list_t {
+	struct pstore_record rec;
+	struct list_head list;
+};
+
 /*
  * Compression is only used for dmesg output, which consists of low-entropy
  * ASCII text, and so we can assume worst-case 60%.
@@ -271,6 +278,66 @@ void pstore_record_init(struct pstore_record *record,
 	record->time = ns_to_timespec64(ktime_get_real_fast_ns());
 }
 
+int pstore_register_core_area(const char *handle, void *area, size_t size)
+{
+	struct rec_list_t *rec_element = kzalloc(sizeof (*rec_element), GFP_KERNEL);
+	struct pstore_record *record = &rec_element->rec;
+	int ret;
+
+	if (!psinfo || !psinfo->register_dmr) {
+		pr_err("No pstore available ! Bailing out.\n");
+		return -EAGAIN;
+	}
+
+	pstore_record_init(record, psinfo);
+	record->type = PSTORE_TYPE_DMAPPED;
+	record->buf = area;
+	record->size = size;
+
+	if (handle) {
+		record->priv = kmalloc(8, GFP_KERNEL);
+		strncpy(record->priv, handle, 8);
+	}
+
+	mutex_lock(&ps_dmr_lock);
+
+	ret = psinfo->register_dmr(record);
+	if (!ret)
+		list_add(&rec_element->list, &rec_list);
+
+	mutex_unlock(&ps_dmr_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pstore_register_core_area);
+
+int pstore_unregister_core_area(const char *handle, void *area, size_t size)
+{
+	struct rec_list_t *rec_element, *tmp;
+	int ret;
+
+	if (!psinfo || !psinfo->unregister_dmr)
+		return -EAGAIN;
+
+	mutex_lock(&ps_dmr_lock);
+	list_for_each_entry_safe(rec_element, tmp, &rec_list, list) {
+		struct pstore_record *record;
+
+		record = &rec_element->rec;
+
+		if (record->buf == area) {
+			ret = psinfo->unregister_dmr(record);
+			list_del(&rec_element->list);
+			mutex_unlock(&ps_dmr_lock);
+			return 0;
+		}
+	}
+
+	mutex_unlock(&ps_dmr_lock);
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(pstore_unregister_core_area);
+
 /*
  * callback from kmsg_dump. Save as much as we can (up to kmsg_bytes) from the
  * end of the buffer.
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index affa4370208c..f9e2dc4252ea 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -35,6 +35,7 @@ struct psz_buffer {
 	uint32_t sig;
 	atomic_t datalen;
 	atomic_t start;
+	void *data_ptr;
 	uint8_t data[];
 };
 
@@ -822,6 +823,38 @@ static int notrace psz_kmsg_write(struct psz_context *cxt,
 	return 0;
 }
 
+static int notrace psz_register_dmr_record(struct pstore_zone *zone,
+			struct pstore_record *record)
+{
+	struct pstore_zone_info *info = pstore_zone_cxt.pstore_zone_info;
+	int ret;
+
+	if (!info->register_dmr)
+		return -ENOTSUPP;
+
+	zone->buffer->data_ptr = record->buf;
+	atomic_set(&zone->buffer->datalen, record->size);
+
+	ret = info->register_dmr(record->priv, record->id, record->buf,
+				 record->size);
+	if (!ret)
+		atomic_set(&zone->dirty, true);
+	return ret;
+}
+
+static int psz_unregister_dmr_zone(struct pstore_zone *zone)
+{
+	struct pstore_zone_info *info = pstore_zone_cxt.pstore_zone_info;
+	if (!info->unregister_dmr)
+		return -ENOTSUPP;
+
+	info->unregister_dmr(zone->buffer->data_ptr,
+			     atomic_read(&zone->buffer->datalen));
+
+	atomic_set(&zone->dirty, false);
+	return 0;
+}
+
 static int notrace psz_record_write(struct pstore_zone *zone,
 		struct pstore_record *record)
 {
@@ -906,6 +939,48 @@ static int notrace psz_pstore_write(struct pstore_record *record)
 	}
 }
 
+static int pstore_unregister_dmr(struct pstore_record *record)
+{
+	struct psz_context *cxt = record->psi->data;
+	int c = 0;
+
+	if (!cxt->dmszs)
+		return -ENODEV;
+
+	while (c < cxt->dmapped_max_cnt) {
+		if (!atomic_read(&cxt->dmszs[c]->dirty))
+			continue;
+
+		if (cxt->dmszs[c]->buffer->data_ptr == record->buf)
+			return psz_unregister_dmr_zone(cxt->dmszs[c]);
+		c++;
+	}
+
+	return -ENOENT;
+}
+
+static int pstore_register_dmr(struct pstore_record *record)
+{
+	struct psz_context *cxt = record->psi->data;
+	int c = 0;
+
+	if (!cxt->dmszs)
+		return -ENODEV;
+
+	while (c < cxt->dmapped_max_cnt) {
+		if (!atomic_read(&cxt->dmszs[c]->dirty))
+			break;
+		c++;
+	}
+
+	if (c == cxt->dmapped_max_cnt)
+		return -ENOSPC;
+
+	record->id = c;
+
+	return psz_register_dmr_record(cxt->dmszs[c], record);
+}
+
 static struct pstore_zone *psz_read_next_zone(struct psz_context *cxt)
 {
 	struct pstore_zone *zone = NULL;
@@ -1110,6 +1185,8 @@ static struct psz_context pstore_zone_cxt = {
 		.read = psz_pstore_read,
 		.write = psz_pstore_write,
 		.erase = psz_pstore_erase,
+		.register_dmr = pstore_register_dmr,
+		.unregister_dmr = pstore_unregister_dmr,
 	},
 };
 
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index 8360d94c96b6..85f3f964b268 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -290,4 +290,20 @@ pstore_ftrace_write_timestamp(struct pstore_ftrace_record *rec, u64 val)
 }
 #endif
 
+#ifdef CONFIG_PSTORE
+int pstore_register_core_area(const char *handle, void *area, size_t size);
+int pstore_unregister_core_area(const char *handle, void *area, size_t size);
+#else
+static inline int pstore_register_core_area(const char *handle, void *area,
+					    size_t size)
+{
+	return 0;
+}
+static inline int pstore_unregister_core_area(const char *handle, void *area,
+				       size_t size)
+{
+	return 0;
+}
+#endif
+
 #endif /*_LINUX_PSTORE_H*/
-- 
2.43.0


