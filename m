Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B583FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sNmZ9StTG5O/Zu53ehNSYHrqqYWTANCQsB1xsFvEeY=; b=oB88rLQSh+tiCDMG5J8IdHLKuS
	H4v9UuQtCAByrytbv/UqvRy+vvhVSIUmZVqAW+mZOtVBtw1pNY6UiDgX+UJ6E/Rx34Up0Xy366ykM
	OZ5YWj2Zt7ky+wZswAdmzx7HhhgZLeTRsEACATVskGZkSHKZz5k6gNB2QNVtvthaQQBqe9KJIJ2xE
	XLLjybJsv4BawCfsUPk/f1G0DDcRnAHd8nUVEItlOZ2NY0bo+dilJGOhVq4M6e5GDbPcduMmyqeW3
	bKMWhIY1l7X/Myi8zAZenPU163NTIaIYYQBHsUpbqZNxaw5xEnh5sQqZl+y+KPbpg+ykcYGnNqoLh
	RbGfJGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJh-0000000GwWq-0fmH;
	Tue, 30 Jun 2026 12:11:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJP-0000000GwJh-2zjz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B88A32EC5;
	Tue, 30 Jun 2026 05:11:30 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6D73F905;
	Tue, 30 Jun 2026 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782821495; bh=lZjlT2hQqWxjuyaq3q3UVTuOgQS+V7y1M7gpu3du8Pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vy4gaUjxvI+U4U4KHKah3r2HlFsnoYmt2JXS69dmlHR+OCx5BlZdwBvnL/S8NxwRe
	 cStpQJ6hP3mOR2KjDKIpjDpNQPj/ZCbmRIiSSG71VtRMtLgP3BeySNEU92N+RHP+Jy
	 rLvox2SDUwGNiTiRIxN5gLgCse4BM8RrhBXJXpdE=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 5/6] KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical ptdump path
Date: Tue, 30 Jun 2026 13:10:04 +0100
Message-ID: <20260630121005.1130996-6-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630121005.1130996-1-weilin.chang@arm.com>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051137_369555_3C8E7E13 
X-CRM114-Status: GOOD (  10.47  )
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

Factor out kvm_ptdump_guest_open() so that the shadow ptdump can reuse
kvm_ptdump_guest_open().

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 0c9647666e65..40f93b7c7ad9 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -156,7 +156,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 	return st;
 }
 
-static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
+static int kvm_ptdump_guest_canonical_show(struct seq_file *m, void *unused)
 {
 	struct kvm_ptdump_guest_state *st = m->private;
 	struct kvm *kvm = st->kvm;
@@ -181,7 +181,8 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
+static int kvm_ptdump_guest_open(struct inode *m, struct file *file,
+				 int (*show)(struct seq_file *, void *))
 {
 	struct kvm *kvm = m->i_private;
 	struct kvm_ptdump_guest_state *st;
@@ -196,7 +197,7 @@ static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
 		goto err_with_kvm_ref;
 	}
 
-	ret = single_open(file, kvm_ptdump_guest_show, st);
+	ret = single_open(file, show, st);
 	if (!ret)
 		return 0;
 
@@ -206,6 +207,11 @@ static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
 	return ret;
 }
 
+static int kvm_ptdump_guest_canonical_open(struct inode *m, struct file *file)
+{
+	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_canonical_show);
+}
+
 static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 {
 	struct kvm *kvm = m->i_private;
@@ -217,8 +223,8 @@ static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 	return single_release(m, file);
 }
 
-static const struct file_operations kvm_ptdump_guest_fops = {
-	.open		= kvm_ptdump_guest_open,
+static const struct file_operations kvm_ptdump_guest_canonical_fops = {
+	.open		= kvm_ptdump_guest_canonical_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
 	.release	= kvm_ptdump_guest_close,
@@ -296,7 +302,7 @@ static const struct file_operations kvm_pgtable_levels_fops = {
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 {
 	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
-			    kvm, &kvm_ptdump_guest_fops);
+			    kvm, &kvm_ptdump_guest_canonical_fops);
 	debugfs_create_file("ipa_range", 0400, kvm->debugfs_dentry,
 			    kvm, &kvm_pgtable_range_fops);
 	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
-- 
2.43.0


