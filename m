Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF20C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WrvnXTAqvwcTzxE8seUUXgtR7H/O9p43WXWIeIPgMYU=; b=4AiyaQFmZWkLLenRYEkEwTvLfS
	Jv98zDbtgNw6x1L0D9IM4Bjms9WQoxFtY4nTITfXxUDKOXDK6rDuJBhazM22neK/ObhlQOBbFGVW9
	anm8MemjRLLbr/CzKxIfVNKt2t79nTmVm4V862T/lhEuw9ac08D0KgeUrw/ItxUsDRKpnTg7rDY/W
	MxiRifpJuhkPblD88sMchGbM4jCDOC+SXgMVNdrLaUmmuMOOVk/bZZDDADfkOLoi6KRLlUxg9CwES
	7rBqvZ9HvhQUisOqRkb1E1tUqiA3ci7X7n1VjJCDqaHy0sDaZ8ePu0xayWCoGp71RP7hbh91YWJc6
	P0vTvCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5o7A-00000001s5P-2lMk;
	Sun, 13 Sep 2026 17:35:40 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5o77-00000001s4p-3Awf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 17:35:38 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so9641895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789320935; x=1789925735; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrvnXTAqvwcTzxE8seUUXgtR7H/O9p43WXWIeIPgMYU=;
        b=Vof0BG4MEzhbXd8wlCx2g+9E/KQo6Fw1BENh2IW7f67qvnaaApDGN2BYh8uOHCXzhy
         ERViUW3OhztZHFzt4o1fbI5vqWIfCYYeLC2BHLCxPSLYYocPSXufVF2XecKzbt24Vszo
         7OjLCF6MF0+vKq6DiBVMXeVwjJ8xgpKSk9Gw8NKtKlKo5+c3HvWJAAa4sFWjS6lA+rd1
         gLYou+4GpgAYEBFinjbgI3cYiVFRCIceKINXbZUZziG2ZbylSXUhyNna+9MsImd8zOvX
         Acpn/lYeCiAdjxawHeE6CPnAWQTMKAg6w3YiKvpvGxG/aM2jIjfTonnkRL36kydVQgZg
         GuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320935; x=1789925735;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrvnXTAqvwcTzxE8seUUXgtR7H/O9p43WXWIeIPgMYU=;
        b=hECho2Z/BHeKZfpqpn9rptKgbcqPr3q4a4Z4eHCvUl34YE6XRweQW3YVLnwnP7xXyW
         gijxqLxqFmc5Pt7V/WWO7XYIIy7MfTMoQTkzBP3C1yL4mHC4NjdWcaa75d9NChRTid7y
         Uwz+fzY9L4F0G+PNmcXzfhy1A06Txtqo18PWjknwhMFzqGUmZp6omKP5juN/h3IiqBKe
         NxVJLVYVbuyer4icynstqvmyl9D7n2eEZZlG6urvIKoeByAxUkFZdX1abEFBbejEyvnA
         cisLBbaAHLWJXJBC/z3ypgNHffIGTR813MyX/gza9sXWGaw9aJL8YUViD5MeUa06iM+k
         g92A==
X-Forwarded-Encrypted: i=1; AKwUvBzfCs5YpTYhYTpOUrcF2pHjw4dfziaJZmvClf4k8mq9yBJnZtRTtGeQXTEgYttE038+joPVnTpTv//PWCkE4H0S@lists.infradead.org
X-Gm-Message-State: AFuF++kO7dChBAYEX/bp1Btnfj/F/xwtYKFbbn+oMCRHMURRZK+jo+aU
	gQooHJUVHZxbPcO9jHA3BWyJMqKBR+wtKs23NTvj+r+hkmUmRsMDQQIdTkzgh8y8tTt9AwwbsKt
	OUUxuY/1CS8flbxoUXn9WvQ==
X-Received: from wrbfi2.prod.google.com ([2002:a05:6000:4402:b0:486:ef8f:f47])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr255115085e9.14.1789320934793;
 Sun, 13 Sep 2026 10:35:34 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:35:16 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260913173516.3122436-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Fix protected VMs fault on system with pages
 larger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_103537_832852_F15BF65A 
X-CRM114-Status: GOOD (  14.23  )
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

Just like commit 08f97454b7fa ("KVM: arm64: Fix protected mode handling
of pages larger than 4kB") fixed the boot of non-protected VMs on system
larger than 4K pages, align the fault IPA down to the page-size for
protected VMs.

To paraphrase Marc, pkvm_pgtable_stage2_map() assumes the address passed
as a parameter is aligned to the size of the intended mapping, while
HPFAR_EL2 gives the IPA minus the bottom 12 bits, regardless of the
system page size configuration.

Add a check at the start of pkvm_pgtable_stage2_map() as we do not
support !PAGE_ALIGNED arguments.

Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c  | 2 +-
 arch/arm64/kvm/pkvm.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..e8d98957531a 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1756,7 +1756,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
+	ret = pkvm_pgtable_stage2_map(pgt, ALIGN_DOWN(s2fd->fault_ipa, PAGE_SIZE), PAGE_SIZE,
 				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
 				      hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..1ca27d01a3ec 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
+	if (!PAGE_ALIGNED(addr | size | phys))
+		return -EINVAL;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.1007.g17ff1f9808-goog


