Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCDDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpWKQAePDYSFuH3x8d4MukUyj81xs2YsXJAnqzR8o3k=; b=hVGid3fmkFkGJB8ynR/3HSqScT
	o4srRy488LJKnAHrs7HUl6GnTgxz2MnAwD0Yk5z1BewGAAPeYwcbmRXZUDPlbQM9WdD9gg8cer9U1
	TNGreOZCvkrtv7+97jG9VYWyNOEUjD4+O+0Vvmj8x36PcumDweqF0AhoI6T4/qIQZR6mr3uUHJVeO
	1LYbvslGGEdAAL58tDyOV2oDlKHAaNAcpiXSLCLGlppomWu/WAlyHsr0JpmB1i48+olqUWsTrsYX0
	EFo/KXA1acu5DO5ITSBN82+GsFyh1Us1TGpsEkytla1BjdMHVPQTODWxENT8OqfmmHn04npL8mVfl
	W0hNJP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9130-00000005cWc-1CHY;
	Tue, 22 Sep 2026 14:00:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x912y-00000005cVh-0z2V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 14:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bpWKQAePDYSFuH3x8d4MukUyj81xs2YsXJAnqzR8o3k=; b=LyaY09/EBcN63URQyZtxw88jfD
	rTIpliKgagx23jXK54/rMB9gX3wShXCfOhJoYGzL1RCST7pbkL7fwE47pM9S+0rzrn+SIH0PYW2MB
	yB/tFWhL6v/U0TQF/W2M5UvYE1MV9HSPvIqLHUgFMEXJ5Py5CcRqxG/UBHMCyjnb0P0ZIL1+MG/Tp
	ql8wQ5F0tsGJAi3N2gW+4cVFDXmJQBYTlTvpXpjnJeKVKXpCB6PS7CBVTrHIm3vbk0YKFizcG0dJE
	FqRj/8gJ37y6HlBI0usB6ZAXGMj4YdpceKgkz+AY4pDckQgg9ZKV31r3H1cObHpekAB/roac1EtDx
	pEG8WbeQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x912v-0000000DfQL-0vDb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:00:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F192D152B;
	Tue, 22 Sep 2026 07:00:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6E923F86F;
	Tue, 22 Sep 2026 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085629; bh=aMSPwsonXUOJ1aXDqudRz657VCrZXxupM1rNcnO98Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkLVk7FJUB6giUbh1Fn6LMGtU3EEBobOs9n5spdUMz3YF+mIhVVDbq6fPqZ+WuNQx
	 j5xQMBRSifB210fwLNNDOKVqnq0urdF7wEdPopC125+vKEKu+rbhPoQWVhpoHICqZh
	 0npYJQEaeuaNMZlcSAzrfnFfCUvpgu6SDBTFXikw=
Date: Tue, 22 Sep 2026 15:00:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 20/21] arm64: tracing: Advertise a mode of EL1t in
 synthetic kernel regs
Message-ID: <arKJ-T7fltE9u8qG@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-21-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-21-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_150033_515068_7911B92E 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 05:14:04PM +0100, Will Deacon wrote:
> When synthesising a kernel regs structure for ftrace or perf, advertise
> a mode of EL1t to reflect the mode in which the kernel runs for the vast
> majority of the time.

For consistency, not that it makes any difference in practice, should we
also do:

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 79a19be88ced..c7f954f1ddbf 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -489,7 +489,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		 * be initialized by start_thread() or start_compat_thread().
 		 */
 		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
+		childregs->pstate = PSR_MODE_EL1t | PSR_IL_BIT;
 		childregs->stackframe.type = FRAME_META_TYPE_FINAL;

 		p->thread.cpu_context.x19 = (unsigned long)args->fn;

-- 
Catalin

