Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C960D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DM6GekgR27UIfqMM/65ZN7iVDIrYS8A+2pLLoQa5ukg=; b=d0MCFz+7z7EmS0ixMpu2SYjd9m
	+oJ6d2MfhnpKIlvSWtpLsRv4kBzfUHP2mt3aC2VLexrN2PO2xLM+n+kko6YeOYRrZHIPLmojm5aK9
	3w/NoQ38WTZ8cbSQimY196VL75qO+u3cjmwkOMS+HASyi5vcbWIaQy2OCsuCly/RoIqJqR5o8jSFv
	h2I8Ui8bgAFuOuHSF/Ij8CZ9Xz3ocJzUZJWlus7trdVLVKlumwWfxXcuCPIfoN2oSu/AUJMazY7yu
	yPwd7kpHa1gFgstoToDgDdNYdnBctYGE1Fq/X57A4zuXF+Tx/fMFdS5gQyt7oRh1xsRV4w86X1zlz
	qqtBYXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsPX-0000000019V-3K6z;
	Thu, 08 Jan 2026 15:58:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsPV-0000000018p-0o6Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32D6E405E3;
	Thu,  8 Jan 2026 15:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0C9C116C6;
	Thu,  8 Jan 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767887932;
	bh=59UGg20+a8O/utg7jkDZv98IzGuoXpfkweM7G+15fCY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zngMsS34cLX0kYuzhDo4C7C9VTnmdi+kizMAUdNstjtHf8cRjkWHUXYpyB/6/63W3
	 FI2zRPcEDPntQn6AZ5tNt9N/0NudnPfGqIK0WGlt+9UAfsL/5e1P2Wz9+wEStv5JqC
	 ItVBGx0pEpEdRnhquO153j9eF4wkLjlw86+uKrg8=
Subject: Patch "KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning" has been added to the 5.10-stable tree
To: alexandru.elisei@arm.com,catalin.marinas@arm.com,cov@codeaurora.org,gregkh@linuxfoundation.org,joey.gouly@arm.com,justinstitt@google.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,maz@kernel.org,nathan@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,will@kernel.org,yuzenghui@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 16:57:53 +0100
In-Reply-To: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
Message-ID: <2026010853-fineness-stopwatch-0bd4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_075853_284685_59A7B181 
X-CRM114-Status: GOOD (  15.18  )
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


This is a note to let you know that I've just added the patch titled

    KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From justinstitt@google.com  Thu Jan  8 16:52:32 2026
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 04 Dec 2025 12:44:48 -0800
Subject: KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,  Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,  Justin Stitt <justinstitt@google.com>
Message-ID: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>

From: Justin Stitt <justinstitt@google.com>

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

|  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
|   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
|        |                              ^~~~~

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). Since there is no upstream equivalent, this patch just
needs to be applied to 5.15.

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..109cca425d3e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,3 +25,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o
+
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)

---
base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
change-id: 20250728-b4-stable-disable-uninit-ptr-warn-5-15-c0c9db3df206

Best regards,
--
Justin Stitt <justinstitt@google.com>



Patches currently in stable-queue which might be from justinstitt@google.com are

queue-5.10/kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch

