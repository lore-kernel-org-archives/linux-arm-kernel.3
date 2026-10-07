Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744DCCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx2Cu25I5sjT0OS3Laf9tgymyNlqPnrQKyFNkKz8hR0=; b=iR5VW0RHp5z/TEwJY4vA6hhY8y
	FfXW74rnx3Hd/+lY34Nn5PdCk3R+WMpYvfVlrO4oQBmsUYuI9LbyqrMFzjUkyahY0VnacAmJpOFbO
	up4t0Hi+meu1HWkEUPYCxLMNebvbfm5sQCSRc7KrGsMvruwsQGLsvoXxuNI9FVfBOGQcCz2Dgh83F
	j63mpAS820FFvXjBZqTXpsJBWOoAvJrBqQHV4HuTdLc/+vyy2mtk0Lbb24YLBD2htHCWluoIYdnLy
	oa3brDi2Wq5+wvkxNjobyuj7hsC65Cs3TxIxjNhTs7ZWyrpFEBiBmXG49ruulTzZNoUz66WVZO6K5
	0pBeWExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVji-00000002p48-01fP;
	Wed, 07 Oct 2026 17:47:26 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVje-00000002p3n-2Ne9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791395240; bh=Qx2Cu25I5sjT0OS3Laf9tgy
	myNlqPnrQKyFNkKz8hR0=; b=BCcSMRoOiaMRXN37pk17F9CJuD81V9NKcfClIQP5roSEHLf/YL
	DN+MG0FgUdyjX+O6vhMZWrF9QfxMTZfggz+Rr97M/joZedAgNqVmUno4GThBzLEAg8AuQYzlT3+
	zdcMom89GRbHlhqlcT24MMn69GC/TIXFoRCWO50XYN1jYneGyKRKCgylkkcwTEi8hUJH93BQSqX
	iZe2+OOYL9l+FTzjDr+KDqwthbs+LKs8NgN+Rg96nTlfA3hlObdSC2Txp/9rU2E2PxsCV/4u9HL
	YpK5NfXNYfBYIrFdDe/Rb9pJ9OTQcG2O4eZf9KSwgIJFldcY7+/ps7qIib49pG34qQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791395240; bh=Qx2Cu25I5sjT0OS3Laf9tgy
	myNlqPnrQKyFNkKz8hR0=; b=i1TDMQTJfLEviP0Fq2yU35+M3ye3HyQ+UjO6AvhTdR/zDqmxou
	2mHJGQ4t9aM7xOcaB10bjZxtO3wUC37Zh3CA==;
Date: Wed, 07 Oct 2026 18:47:21 +0100
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
CC: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_entry=3A_drop_the_unus?=
 =?US-ASCII?Q?ed_tmp2_argument_of_mte=5Fset=5Fkernel=5Fgcr=28=29?=
In-Reply-To: <20261007175231.1.mte-tmp2@mainlining.org>
References: <20261007175231.1.mte-tmp2@mainlining.org>
Message-ID: <EA0C88FF-9778-4645-B744-F65DFE1D1B9B@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_104722_755363_2D7B5058 
X-CRM114-Status: UNSURE (   9.64  )
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

On 7 October 2026 18:45:01 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
>used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
>commit 82868247897b ("arm64: kasan: mte: use a constant kernel
>GCR_EL1 value") swapped that for
>
>    mov     \tmp, KERNEL_GCR_EL1
>
>and tmp2 stayed in the declaration and in the one caller, which
>passes x23 for it.
>
>Drop it, both places.
>
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>
>diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>index 0e1d9c3c6a93..2baefe7a82d3 100644
>--- a/arch/arm64/kernel/entry.S
>+++ b/arch/arm64/kernel/entry.S
>@@ -171,7 +171,7 @@
> #endif
> 	.endm
>
>-	.macro mte_set_kernel_gcr, tmp, tmp2
>+	.macro mte_set_kernel_gcr, tmp
> #ifdef CONFIG_KASAN_HW_TAGS
> alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
> 	b	1f
>@@ -258,7 +258,7 @@
>
> 	apply_ssbd 1, x22, x23
>
>-	mte_set_kernel_gcr x22, x23
>+	mte_set_kernel_gcr x22
>
> 	/*
> 	 * Any non-self-synchronizing system register updates required for
>---

AHH. What happened here, ugh! Why was it sent twice, stupid me man. Let me
go resend it PROPERLY, god sake Bradley..

> arch/arm64/kernel/entry.S | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>index f63049ac32dc..c3106dee61e1 100644
>--- a/arch/arm64/kernel/entry.S
>+++ b/arch/arm64/kernel/entry.S
>@@ -171,7 +171,7 @@ alternative_else_nop_endif
> #endif
> 	.endm
> 
>-	.macro mte_set_kernel_gcr, tmp, tmp2
>+	.macro mte_set_kernel_gcr, tmp
> #ifdef CONFIG_KASAN_HW_TAGS
> alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
> 	b	1f
>@@ -258,7 +258,7 @@ alternative_else_nop_endif
> 
> 	apply_ssbd 1, x22, x23
> 
>-	mte_set_kernel_gcr x22, x23
>+	mte_set_kernel_gcr x22
> 
> 	/*
> 	 * Any non-self-synchronizing system register updates required for
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

