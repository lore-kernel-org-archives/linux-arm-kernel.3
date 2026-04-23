Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E748FF589B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Si2vLE+zPB6prbMPE/cdtc4huvV7tWVF4D7BT4Ap7I=; b=0pTP3p3RqyiJJA9f7eFCqr7e05
	6fI+7683dgqZOoVkrzlmUPx4p5PYOsrs0i9r+D8LACllvJQl9E3pJuidHjZEiptJ26tgOmIopBdMe
	pmB3W/LWyxwuxixKZtsJbLopp9CJO23qhbKdunZ6IwiiTSDxBO9Y3zN235kkLS1vMaDUVJSg4S3o2
	2E96BQunHTem7pMYAnYvXHni5hbQPL+slZQuiIUFrXHDRoyHwY56ercw58hCRatdLnkkDkNDEVMdn
	aWCt3yvoPSJ2VwfE1m0WTu8XnaQXaCcDuJa+AnHSJivTMhFMCVfNKcjhkH8gcUGkUSeBn7itiAFAV
	fcXeA7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPn-0000000Bf5n-2QLt;
	Thu, 23 Apr 2026 12:44:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPm-0000000Bf4D-2yFW;
	Thu, 23 Apr 2026 12:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1Si2vLE+zPB6prbMPE/cdtc4huvV7tWVF4D7BT4Ap7I=; b=bGd7PdQ5TpahS8yifOyUDvsu+M
	e8EAEKRCGyQWHPqtmNNWTjn4q4VkhzhiVx/slWu57r3S+DYrTLdCE3PwyfZjBoykZnx5ocRUBS1BW
	3oivFx3Ga8xCxT6cS0SjheywtBKt7EzvSz++vAnHDvT8+hLdF+XiSN9xVhlpmR8SGeVd1M15R1Ind
	V6gEuFUVsN1OXBWKuehKxIWHQ8EOwk6tJ0SdMt7aXUgYi6K8HlGTUPYjPxJj8bZeMuc5D/ZWkmNBY
	Olr4Z1yDYbTxl7hKhXxLTRCih73MFMydwJwfoxmHoHY6E4mdBQBhZLIbFgKdV7lFiYlY+sxCHCf+r
	vbJGEI6w==;
Received: from linux.microsoft.com ([13.77.154.182])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPf-0000000DS5S-0Jsi;
	Thu, 23 Apr 2026 12:44:17 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id BDFEE20B716F;
	Thu, 23 Apr 2026 05:44:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDFEE20B716F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948247;
	bh=1Si2vLE+zPB6prbMPE/cdtc4huvV7tWVF4D7BT4Ap7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ex1bUyOfRJKCP+0lBVsUziVPVd+0d51ReTPSRmFbuc28vd3Nz4ptTcg4+AVNnYZM9
	 RSunynWJvpI5uw7AKMyeGLw50tlZ95+Tlt6dvDrxSPQem9Esju+nJmcsQ/kGebKLqi
	 HUTyiX+QXMF7vONKiTPx6RrGdBNVwqf9es11vYGs=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 13/15] mshv_vtl: Add remaining support for arm64
Date: Thu, 23 Apr 2026 12:42:03 +0000
Message-ID: <20260423124206.2410879-14-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134411_305534_6FBE473E 
X-CRM114-Status: GOOD (  12.20  )
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

Add necessary support to make MSHV_VTL work for arm64 architecture.
* Add stub implementation for mshv_vtl_return_call_init() as it's not
  required for arm64
* Handle hugepage functions by config checks, as it's x86 specific
* fpu/legacy.h header inclusion was required when x86 assembly code
  was present here, it got left when the code was moved to arch files.
  Remove it now (unrelated to arm64)

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/include/asm/mshyperv.h | 2 ++
 drivers/hv/mshv_vtl_main.c        | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index 9eb0e5999f29..6f668ec68b2f 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -82,6 +82,8 @@ static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, b
 	return 1;
 }
 
+/* Stubbed for arm64 */
+static inline int mshv_vtl_return_call_init(void) { return 0; }
 #endif
 
 #include <asm-generic/mshyperv.h>
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index be498c9234fd..d5308956dfb6 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -23,8 +23,6 @@
 #include <trace/events/ipi.h>
 #include <uapi/linux/mshv.h>
 #include <hyperv/hvhdk.h>
-
-#include "../../kernel/fpu/legacy.h"
 #include "mshv.h"
 #include "mshv_vtl.h"
 #include "hyperv_vmbus.h"
@@ -1077,10 +1075,12 @@ static vm_fault_t mshv_vtl_low_huge_fault(struct vm_fault *vmf, unsigned int ord
 			ret = vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
 		return ret;
 
+#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 	case PUD_ORDER:
 		if (can_fault(vmf, PUD_SIZE, &pfn))
 			ret = vmf_insert_pfn_pud(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
 		return ret;
+#endif
 
 	default:
 		return VM_FAULT_SIGBUS;
-- 
2.43.0


