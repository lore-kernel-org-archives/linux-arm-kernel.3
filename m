Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD197CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkKunDQZvI08nof+q8MgWgSW0KD/IKDntvHrSyk6bE8=; b=1Lb/hoT7xxDcJMiLANJrlYEmLW
	7COV+/TZ95plz5l4hkBDWU4qN8dUXQpMXGLshtdP/DaazK0mpKWngsm3HUl050abxefh/0y1fgnoN
	rSZsDg1c/Pl/7FMMkWtiWk6wCQ5vFOgX1LJIJxNgOoqKc9w3qZUOD4OtLLoMy1i3IRrjmxMkjk5Xo
	rNn3iV7E5MkaZGj7Actf6g7INldCQePDxmDWuPJX/MH9fXfrpoByoFd9lG6nSLJ2V6aXX3PHRcSSz
	JR7gK2J9XzqUTJtx2imkIX20gKh90VWcxv1sPc+j/6H5/lIWkbP43cKRxHe8bBPXi4zy7lCzPNQzu
	pTSW3V0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipj-00000004zJe-1oNx;
	Wed, 20 May 2026 15:27:43 +0000
Received: from mail-wr1-f73.google.com ([209.85.221.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipV-00000004z7h-2K8k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:30 +0000
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d7b7bacddso3770038f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290847; x=1779895647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkKunDQZvI08nof+q8MgWgSW0KD/IKDntvHrSyk6bE8=;
        b=DItRiwH/pMIgJ0d3T26b50vaOawBwPUAVAxQeN2EcLO73bVFh35vLhbKovYYEqNxwU
         b6dDFt1dMt6GYbrJ2otTeAU4xOMMEUQgdATYmQWq6fiv35+uaUcFhFoX226lzsc/Y/WD
         51cOaW+ZwiN0+5u+CISvl1dpNhTXzzQ970ZuYK+0Cm1NDBSGtcXU5aBDWenTibFnxof/
         rqZcK3I6ENZ9gnzq/Fx3Q33NVacH3cteuY9df1qv5zFyg1hEb80XhkalBjHmR6jw1I/P
         6Z/NhVxeDMBWmhqwFdmukAGBztYsbfThSYb4sAUDFdxW2bhPz4lFYWr+PNDl8Xiayllb
         NmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290847; x=1779895647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkKunDQZvI08nof+q8MgWgSW0KD/IKDntvHrSyk6bE8=;
        b=N3xJ9RBXstlaCyGphVS5kEzZcyPXJi+YSO0F/HulyjSfpmPl5r2ZaogxEBtg1pEa24
         ZkxwH95BzjqZ9cwz0j415WghjGULet9CFxVbgqd0a2TTTlz5IvJ9eVaNRebCxHgogPtP
         7EvCLW9P1c+kvqgm60hxoc3RH8NER5DcxwCrE9TsR91mm+iD7C66xrG1/ulJoHg9dc2J
         BCZ9yp2RlRrx5FrBrJg9M0EvaieqHO89Wt16cN9CtW0SvMyUfCk0YzfX94rXglgF2XQO
         rbuU10Be1TPJh5jat3hWmpsplCKpunqoZPVnW62mjsXnNmeY2BNJYIHPoF/VN7aQu3WY
         bolg==
X-Gm-Message-State: AOJu0YxbK/1ZyXOCpLjVKpkU9RmfD67X5UVm7jYr0LvCJewrrFB5tdgw
	x0JyYpAuuN3oCsPBMIkjMHjaD5Zsi9u87Ge3dluHqz3HAemOPNm7eNtblJ9k+vMGdZ80CLd0cnG
	ipjGQvY5I4dqb/zR4e7vRtw==
X-Received: from wrsa4.prod.google.com ([2002:adf:fac4:0:b0:44d:a2de:25c7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1389:b0:48f:fe2a:107c with SMTP id 5b1f17b1804b1-49001285b87mr253544245e9.6.1779290847092;
 Wed, 20 May 2026 08:27:27 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:45 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-13-vdonnefort@google.com>
Subject: [PATCH 12/17] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082729_595067_0BB74EDC 
X-CRM114-Status: GOOD (  10.21  )
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

kern_hyp_va() is idempotent for the hypervisor linear space. This is
handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
pointers. Those pointers can originate from the hypervisor space (when
protected mode is enabled, we don't trust the kernel and the hypervisor
uses its own copy) or from the kernel space (we do trust the kernel in
"non-protected" nVHE).

This idempotence does not hold for addresses within the hypervisor
private range, like the ones you get from the pKVM heap allocator
(hyp_alloc()). To resolve this, filter out non-kernel addresses based on
PAGE_OFFSET.

Leave the assembly version untouched as it has no current users.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 01e9c72d6aa7..8d608292d48c 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (!is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.54.0.631.ge1b05301d1-goog


