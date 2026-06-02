Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61220CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKoXcf+SQackXHAfJqahD6MXuhSRg2crwRRaqTj4nF4=; b=x+VroKs39Ecf6l3ruRqj+VVbOs
	T89yJQjvyDuXItW6LrcQDxG6kgWiOLJln4ourQTzkI3xH3qgWY+Y3eoNtKoI0XqIIjy8AAGI9/WE9
	y8tMp4CK4ZoHs5P8CsGaL7uYUroIK+w0I0pbQGF2MEaxAy80oNhN+JqvslpgyP8hLeiXzgzh9Vo1/
	iPFUhn2CO9D1xkn+twqIeN3OQCttL4/8uWC3iBFdh/8qvp+ykAgbsYoc/FW+Xph4yd69F5XFzyvsZ
	mz/BPhVFgoRszn+H2yJSkDgT3V5++Y5TXse80A+83Ab9FL4/8nQauLlGWoUMDq5w//P5F4e01+zuJ
	kM0K45SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMT-0000000CRLx-3tiO;
	Tue, 02 Jun 2026 07:16:30 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMI-0000000CR2Y-25AI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384572; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wKoXcf+SQackXHAfJqahD6MXuhSRg2crwRRaqTj4nF4=;
	b=Jcy+GYjs10Y8Lj6OjSEB4FzPA09B5dzTjv4QSUfLv72M/nenvRzCUBrE+r+J6t5i1hSgi+zakJRlUGFP7o/DOL4YuFR6EpEX0F4uIdyubdy376ZUGoYmwk92q8Yx7zEGhkzq8iJhbNdojhNfHxg+2e7JzRM59fz2phgIRys7JFY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2fN_1780384569;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2fN_1780384569 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:10 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v7 11/16] arm64: ras: Add RAS decode notifier chain
Date: Tue,  2 Jun 2026 15:15:34 +0800
Message-ID: <20260602071540.3711528-12-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001618_957141_28B36FD7 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Introduce a blocking notifier chain that allows external modules (e.g.,
EDAC drivers, vendor-specific decoders) to receive and further decode
RAS error events. Each error event is passed to all registered decoders
after being logged.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/arm64/ras-core.c | 15 +++++++++++++++
 include/linux/ras.h          |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 94514a5bb973..0b07b69545ad 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -139,11 +139,26 @@ static void ras_print(struct ras_record *record, struct ras_ext_regs *regs)
 	}
 }
 
+static ATOMIC_NOTIFIER_HEAD(ras_decoder_chain);
+
+void ras_register_decode_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_register(&ras_decoder_chain, nb);
+}
+EXPORT_SYMBOL_GPL(ras_register_decode_chain);
+
+void ras_unregister_decode_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_unregister(&ras_decoder_chain, nb);
+}
+EXPORT_SYMBOL_GPL(ras_unregister_decode_chain);
+
 static void ras_do_proc(struct ras_record *record, struct ras_ext_regs *regs)
 {
 	u64 status = regs->err_status, addr = regs->err_addr;
 
 	ras_print(record, regs);
+	atomic_notifier_call_chain(&ras_decoder_chain, 0, record);
 
 	if (status & ERR_STATUS_CE)
 		return;
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..11663150612f 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -63,4 +63,12 @@ amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 #define GET_LOGICAL_INDEX(mpidr) -EINVAL
 #endif /* CONFIG_ARM || CONFIG_ARM64 */
 
+#if IS_ENABLED(CONFIG_ARM64_RAS_DRIVER)
+void ras_register_decode_chain(struct notifier_block *nb);
+void ras_unregister_decode_chain(struct notifier_block *nb);
+#else
+static inline void ras_register_decode_chain(struct notifier_block *nb) {}
+static inline void ras_unregister_decode_chain(struct notifier_block *nb) {}
+#endif /* CONFIG_ARM64_RAS_DRIVER */
+
 #endif /* __RAS_H__ */
-- 
2.51.2.612.gdc70283dfc


