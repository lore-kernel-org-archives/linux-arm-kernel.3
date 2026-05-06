Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF3ECD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G3+Pw4BOMf+A6M0ux2tYa+aIcpRxduR/OGHZg/4z2U4=; b=1ESmqDbjuyoE9fHSPjRBZCoqrc
	bpcvG0OfDoKj4tx38/0OovuY9T5iq1kswz7jCUllh4D4EBe9FsJegfH9rzGrg1cW0QHR8uWA2D7GZ
	qG2j5WHDa+5KGzwfdlD/xC9G7VEVjkzMJ6hkzfprNbe3Mc5S/+t9lOqYIqnLYIstbozFYWWObNz8s
	D4AxH3tPYYExzi2aeLfCRA6+Dwuo66SA9gOLQiLwNBR8N4eWqm0IdkO/MLjzdgIG4VcilaqtlMYNR
	kWzSgu1ksnAERTp6eviK58JQR+w3CgBqA73+w4GzmzdNB2MBib5qWVFdk8XuuhMVKcJBBI3v6ydGQ
	/8wKCucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZqU-00000000Xgz-3dCy;
	Wed, 06 May 2026 10:51:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZqT-00000000XfI-1Mbw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C25DF3319;
	Wed,  6 May 2026 03:51:04 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8425B3F836;
	Wed,  6 May 2026 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778064670; bh=mLq4TYQ+p660O5valtgnJ3LrPuMxPXfWPFxW8jxq8TM=;
	h=From:To:Cc:Subject:Date:From;
	b=HhbmJIyP9sJImfrgGpIg9HwAvlfR0pBsXr5v0luiixEE4kRlqA3UwFXBPEXZcJhfF
	 Zj9jsusPv3Ts5AACq5YHPuxlUPuCA6HmU6NsRqFWERiU2mpZw5oUQZhEcLRx1xSiYC
	 p7+CE3QvEgODB1jgUMQuj4OCtScayA3nY18WMotQ=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: tabba@google.com,
	David.Hildenbrand@arm.com
Subject: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes with documentation
Date: Wed,  6 May 2026 11:50:53 +0100
Message-ID: <20260506105053.107404-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_035113_439498_CA9CF463 
X-CRM114-Status: GOOD (  18.10  )
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

The documentation for KVM_EXIT_MEMORY_FAULT states:

'Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that
it accompanies a return code of '-1', not '0'!  errno will always be set to
EFAULT or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace
should assume kvm_run.exit_reason is stale/undefined for all other error
numbers'.

where a return code of '-1' is special because according to man 2 ioctl:

'On error, -1 is returned, and errno is set to indicate the error'.

Putting the two together means that the ioctl KVM_RUN must 1) complete with
an error and 2) that error must must be either EFAULT or EHWPOISON for
userspace to detect a KVM_EXIT_MEMORY_FAULT VCPU exit.

On a kvm_gmem_get_pfn() error, gmem_abort() prepares the
KVM_EXIT_MEMORY_FAULT exit_reason and propagates the error back to
userspace. kvm_gmem_get_pfn() does not massage the error code, and if the
error is not -EFAULT or -EHWPOISON, userspace implementing the ABI fails to
detect the memory fault exit.

Things get more complicated with kvm_handle_vncr_abort().
kvm_translate_vncr(), similar to gmem_abort(), prepares the VCPU to exit
with KVM_EXIT_MEMORY_FAULT and propagates the error code from
kvm_gmem_get_pfn(). Then kvm_handle_vncr_abort() does a number of things
based on this specific error code:

- If it's -EAGAIN, KVM resumes the guest. Note that KVM, when handling a
  *host* fault on a guest_memfd backed VMA, retries the fault handling if
  kvm_gmem_get_pfn() returns -EAGAIN.
- If it's -ENOMEM, -EFAULT, -EIO or -EHWPOISON, it returns to userspace
  with 0 (success), meaning that, according to the documentation, userspace
  will not detect the memory fault exit.
- If it's -EINVAL, -ENOENT, -EACCESS, KVM injects a synchronous exception
  back to the guest.
- If it's -EPERM, KVM injects a permission fault.
- If the error code is something else, KVM resumes the guest.

Bring a measure of order to all of this by implementing the documented
behaviour. -EAGAIN is treated as an error, similar to the
__kvm_faultin_pfn() behaviour for an anonymous VMA.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

This has the potential to break userspace, hence the RFC tag.

I went back and forth on the fix. I cannot test any of this and I have no
context around the usage of guest_memfd. In the end I settled on strictly
implementing the documented behaviour.

Really not sure what userspace is supposed to do to fixup the fault if
kvm_gmem_get_pfn() returns -EAGAIN either.

Someone with more knowledge please chime in!

 arch/arm64/kvm/mmu.c    |  8 +++++++-
 arch/arm64/kvm/nested.c | 24 +++++++++++++-----------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..ea6c96818fc6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1610,7 +1610,13 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret) {
 		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
 					      write_fault, exec_fault, false);
-		return ret;
+		switch (ret) {
+		case -EFAULT:
+		case -EHWPOISON:
+			return ret;
+		default:
+			return -EFAULT;
+		}
 	}
 
 	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 883b6c1008fb..ef426c94daff 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1320,8 +1320,14 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
 		if (ret) {
 			kvm_prepare_memory_fault_exit(vcpu, vt->wr.pa, PAGE_SIZE,
-					      write_fault, false, false);
-			return ret;
+						      write_fault, false, false);
+			switch (ret) {
+			case -EFAULT:
+			case -EHWPOISON:
+				return ret;
+			default:
+				return -EFAULT;
+			}
 		}
 	}
 
@@ -1401,23 +1407,19 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 
 		switch (ret) {
 		case -EAGAIN:
+		case -ENOMEM:
 			/* Let's try again... */
 			break;
-		case -ENOMEM:
+		case -EFAULT:
+		case -EHWPOISON:
 			/*
 			 * For guest_memfd, this indicates that it failed to
 			 * create a folio to back the memory. Inform userspace.
 			 */
 			if (is_gmem)
-				return 0;
-			/* Otherwise, let's try again... */
-			break;
-		case -EFAULT:
-		case -EIO:
-		case -EHWPOISON:
-			if (is_gmem)
-				return 0;
+				return ret;
 			fallthrough;
+		case -EIO:
 		case -EINVAL:
 		case -ENOENT:
 		case -EACCES:

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.54.0


