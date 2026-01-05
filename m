Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067BBC79F95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xK4Y1su/myBX6p/9ecAl00kYmtfmFtGTKNbAYqtZiRQ=; b=xNwyx6H1g00w5thhHuW1UX22Ax
	zq74E/fWk64CciXs6cUVjE/v5ynYiQEWF8UkmLCrrGtv484axPBvJcWTqnemihGEexewdQvuR/NKm
	eQmAFf1hYPdweuUNroqhymS7/yAo17+3cb5mMlEUOxgxLrVdfSc3+We0AuAuBPxFAzZQiLP+QxSNU
	0wzHAyFSxt7JhDtMSiupUa47aHnMtaU6VJtF0UG1cka4ug/gv3/UbM5R81A/JYd7yO6RUOTE9yt9r
	RjWLkmYcqSrXhnJLZfD4h6hPfjzEAYmfrR0OKY8KxSR3aIVB+TPJ7yPwlGLGBItY8Ohe4m+ZkPvex
	fG1Cxycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl6z-0000000BVYA-3rM4;
	Mon, 05 Jan 2026 13:59:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl6y-0000000BVXd-02LC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:59:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C44B2339;
	Mon,  5 Jan 2026 05:58:57 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28C743F6A8;
	Mon,  5 Jan 2026 05:59:03 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	YeoReum.Yun@arm.com,
	Mark.Rutland@arm.com
Subject: [PATCH v1] arm64/efi: Don't fail check current_in_efi() if preemptible
Date: Mon,  5 Jan 2026 13:58:47 +0000
Message-ID: <20260105135847.1585034-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_055908_092602_AFC96F74 
X-CRM114-Status: GOOD (  11.49  )
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

As EFI runtime services can now be run without disabling preemption remove
the check for non preemptible in current_in_efi(). Without this change,
firmware errors that were previously recovered from by
__efi_runtime_kernel_fixup_exception() will lead to a kernel oops.

Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
On the partner platform I was testing on this issue caused the boot to fail.
---
 arch/arm64/include/asm/efi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index aa91165ca140..e8a9783235cb 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -45,7 +45,7 @@ void arch_efi_call_virt_teardown(void);
  * switching to the EFI runtime stack.
  */
 #define current_in_efi()						\
-	(!preemptible() && efi_rt_stack_top != NULL &&			\
+	(efi_rt_stack_top != NULL &&					\
 	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
 
 #define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
-- 
2.43.0


