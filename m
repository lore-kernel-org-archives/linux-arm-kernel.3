Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DADD2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usRPxgl1amP/v9n1SLf7SAiI18LuyGFVnItwiHNDJxo=; b=m0Vd3EyPO17NZc0XqsrfQ+FgRJ
	PzHWskN2VGPVFctxmImXqtKYmSUY3/h70SVHWH/inb+QuVF3WSfmtL1RVPoFRlif3zIJWpYKQOZZ5
	O7qPBlH+3oZ1rW8vyedYye8pWGG3/LiuLcm8ANKcv+hBJxVUkbNyDG99Skh0/8P0/dYHtNUfZ0yB2
	jUh1LHdR6d+R1QRsUrTUv0igmP45Tj70x4kLlCKOe7W5YPkCRhvffTsk5GVckMC61WhJa3REzEO2E
	DeQAw81hOn4Sa24dbR1bRWvIpsI8Fg5uBFzVehBMzHBYC1zEY3oX8sYYYgHjbkEaWSwUAp5Lni60X
	IAI08cpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sj-00000003HP7-2CM6;
	Tue, 20 Jan 2026 06:43:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Se-00000003HLO-4BAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:34 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 305DB20B716D;
	Mon, 19 Jan 2026 22:43:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 305DB20B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891411;
	bh=usRPxgl1amP/v9n1SLf7SAiI18LuyGFVnItwiHNDJxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFMIPpY6TAiuIZv+8jTFocdvb6bDbOjidIdTfShgZ/xxmsSw89ShdkgVGXcpmIi0a
	 uqU3YdVEEs1oymmxBJNjCltMFdDLzFigaa4fuIlemUvg+4jc3mQbADgxz0xjUC5u9B
	 GG7ZGEq4SoiolDL1XVlZ5e9MX+LXwD8K65AF0h+A=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 04/15] mshv: Provide a way to get partition id if running in a VMM process
Date: Mon, 19 Jan 2026 22:42:19 -0800
Message-ID: <20260120064230.3602565-5-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224333_072825_80F1025E 
X-CRM114-Status: GOOD (  16.55  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

Many PCI passthru related hypercalls require partition id of the target
guest. Guests are actually managed by MSHV driver and the partition id
is only maintained there. Add a field in the partition struct in MSHV
driver to save the tgid of the VMM process creating the partition,
and add a function there to retrieve partition id if valid VMM tgid.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/hv/mshv_root.h         |  1 +
 drivers/hv/mshv_root_main.c    | 35 +++++++++++++++++++++++++++-------
 include/asm-generic/mshyperv.h |  1 +
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/hv/mshv_root.h b/drivers/hv/mshv_root.h
index 3c1d88b36741..c3753b009fd8 100644
--- a/drivers/hv/mshv_root.h
+++ b/drivers/hv/mshv_root.h
@@ -134,6 +134,7 @@ struct mshv_partition {
 
 	struct mshv_girq_routing_table __rcu *pt_girq_tbl;
 	u64 isolation_type;
+	pid_t pt_vmm_tgid;
 	bool import_completed;
 	bool pt_initialized;
 };
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 1134a82c7881..83c7bad269a0 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -1823,6 +1823,20 @@ mshv_partition_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+/* Given a process tgid, return partition id if it is a VMM process */
+u64 mshv_pid_to_partid(pid_t tgid)
+{
+	struct mshv_partition *pt;
+	int i;
+
+	hash_for_each_rcu(mshv_root.pt_htable, i, pt, pt_hnode)
+		if (pt->pt_vmm_tgid == tgid)
+			return pt->pt_id;
+
+	return HV_PARTITION_ID_INVALID;
+}
+EXPORT_SYMBOL_GPL(mshv_pid_to_partid);
+
 static int
 add_partition(struct mshv_partition *partition)
 {
@@ -1987,13 +2001,20 @@ mshv_ioctl_create_partition(void __user *user_arg, struct device *module_dev)
 		goto delete_partition;
 
 	ret = mshv_init_async_handler(partition);
-	if (!ret) {
-		ret = FD_ADD(O_CLOEXEC, anon_inode_getfile("mshv_partition",
-							   &mshv_partition_fops,
-							   partition, O_RDWR));
-		if (ret >= 0)
-			return ret;
-	}
+	if (ret)
+		goto rem_partition;
+
+	ret = FD_ADD(O_CLOEXEC, anon_inode_getfile("mshv_partition",
+						   &mshv_partition_fops,
+						   partition, O_RDWR));
+	if (ret < 0)
+		goto rem_partition;
+
+	partition->pt_vmm_tgid = current->tgid;
+
+	return ret;
+
+rem_partition:
 	remove_partition(partition);
 delete_partition:
 	hv_call_delete_partition(partition->pt_id);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index ecedab554c80..e46a38916e76 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -211,6 +211,7 @@ void __init ms_hyperv_late_init(void);
 int hv_common_cpu_init(unsigned int cpu);
 int hv_common_cpu_die(unsigned int cpu);
 void hv_identify_partition_type(void);
+u64 mshv_pid_to_partid(pid_t tgid);
 
 /**
  * hv_cpu_number_to_vp_number() - Map CPU to VP.
-- 
2.51.2.vfs.0.1


