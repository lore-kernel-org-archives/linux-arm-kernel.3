Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A33F109B492
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKWxZwooXHUvuXaKy8w0Pj0GiUAdDQ9NNCRFp7npcZc=; b=tn3ZPN4WDOZHIR1PjirZs8cKAZ
	sFunAQwRf/w76PPGeWO0lx1JL/Ir4gZTHxh752QQfLqail40vgJw5OeaN3POp9Bj6kpM4ZnJf9wk6
	DSuwg2Lgafh6UAA103kb3/g3lhmvIlbIXZpRWuDNiqVycknkQjmVVh+soO77Y5f0VnuUxI7yT1hKE
	S0x18L1anaIWfkm+h0/TKNjpB5bCi2gk2Uvbum2mP18wmXRtT55+t7wPinGCxd8LQjw5tutHRKzW/
	IJBlUqtKJeqchWYbzyLSlPrUOuktGUIpZ4mAS3j1VuCC+DRx6SIC5r5XDpOVeUmMMQMJ6m2ahZPFb
	wjQ9paQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNT-0000000DD3a-0kT1;
	Tue, 31 Mar 2026 15:51:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNN-0000000DD2R-2MBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF8160128;
	Tue, 31 Mar 2026 15:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31799C19423;
	Tue, 31 Mar 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972291;
	bh=2M1SXzxRJkZCmnKmHuROBofVvlwQ52Jmw/W1lvRR9U0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sGP9aANqLHoRiD8xitb8BBFzgEOaPt0Tn72k02TBOMq8WGw5uI+Gtqn0c9pNj8SeV
	 UqIPmiGPL4Piwt5Tlftb9B4kgm1WoP++9+s6SZZI4Yz7GqmjFEzNbSsVdido9pQHfO
	 2aBG31uuz6lhP2210c4xtcs9hrc9BLdFlMjwnB3wUjA4sXwjgcHp8DGQOvNWCTCp/Q
	 yJWpy9kp/APQVOHRL6sdWi02g3M6F/LCxHXlYbl+ZEjN2Dym8ZYWellCS4wt2zhvgB
	 EeJmdAj7FjfwVH/03oCalM4hFGyfUM6T4h5wYrTnTtQHK0jMQGtk/FuF85R3QGfVth
	 Y5D7QCQ0nivjA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 1/3] KVM: arm64: Prevent teardown finalisation of referenced 'hyp_vm'
Date: Tue, 31 Mar 2026 16:50:53 +0100
Message-ID: <20260331155056.28220-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331155056.28220-1-will@kernel.org>
References: <20260331155056.28220-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Destroying a 'hyp_vm' with an elevated referenced count in
__pkvm_finalize_teardown_vm() is only going to lead to tears.

In preparation for allowing limited references to be acquired on dying
VMs during the teardown process, factor out the handle-to-vm logic for
the teardown path and reuse it for both the 'start' and 'finalise'
stages of the teardown process.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8b906217c4c3..3fd3b930beeb 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -936,20 +936,27 @@ int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
 	return ret;
 }
 
+static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+
+	hyp_assert_lock_held(&vm_table_lock);
+
+	hyp_vm = get_vm_by_handle(handle);
+	if (!hyp_vm || hyp_page_count(hyp_vm))
+		return NULL;
+
+	return hyp_vm;
+}
+
 int __pkvm_start_teardown_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = 0;
 
 	hyp_spin_lock(&vm_table_lock);
-	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm) {
-		ret = -ENOENT;
-		goto unlock;
-	} else if (WARN_ON(hyp_page_count(hyp_vm))) {
-		ret = -EBUSY;
-		goto unlock;
-	} else if (hyp_vm->kvm.arch.pkvm.is_dying) {
+	hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
+	if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying) {
 		ret = -EINVAL;
 		goto unlock;
 	}
@@ -971,12 +978,9 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	int err;
 
 	hyp_spin_lock(&vm_table_lock);
-	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm) {
-		err = -ENOENT;
-		goto err_unlock;
-	} else if (!hyp_vm->kvm.arch.pkvm.is_dying) {
-		err = -EBUSY;
+	hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
+	if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying) {
+		err = -EINVAL;
 		goto err_unlock;
 	}
 
-- 
2.53.0.1118.gaef5881109-goog


