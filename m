Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1DDC7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4RfE1WYGMHgiWrE9XUtsemXoOaXm4vEgdgpUQQX5JQ=; b=I6+TmgDbpUW0zOdo49rjeKOflr
	R1ks3drFcftkxPD4h2JapADlmFHL3RMWd/vxXvIOM9SFYM/lFgILDYDkzCh2MjHJidJCIG+B9LVTu
	PSSYbcVWD/66JwT2AlnafzYQ9s37JF4g0WCPcirHN9qD5RRPQaZxJtw7NCUnKFr4ETo4KjDWP9u6N
	ze6EAln8MSXovYqlembIfZStl0Scics7EtoYx0tSJ6x+pnGa20W3BBfZmzwcQhTKTRIeGwaWIlLtV
	TW8BFDuDWTceyjOt8ixDj+s7v02qLouJQ9z7UiCq3OOIQYu64Tb7GBgYZ8AX7xvFLe7R9Grv6vAKt
	x2SuETDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowa-0000000EXao-2eXh;
	Thu, 12 Jun 2025 20:54:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjDY-0000000DgSR-0TnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D34D74A318
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 14:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B63C4CEEA;
	Thu, 12 Jun 2025 14:47:46 +0000 (UTC)
Date: Thu, 12 Jun 2025 15:47:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <aErokN0vKT3urlmA@arm.com>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_074748_168431_6F1368D1 
X-CRM114-Status: GOOD (  23.44  )
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

On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:
> > However, I thought there was another slightly misplaced call to
> > gcs_free() via arch_release_task_struct(). I wouldn't touch the user
> > memory with vm_munmap() when releasing a task structure. Is this needed
> > because the shadow stack is allocated automatically on thread creation,
> > so we need something to free it when the thread died?
> 
> Yeah, I've got another patch written but not sent for that (since it
> doesn't actually overlap) but like you say I need to check that things
> are joined up for threads that had a GCS created automatically for
> compatibility before I send it out.

OK. For this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > when we need to free the shadow stack on this path. On the exit_mm()
> > path for example we have mmput() -> exit_mmap() that takes care of
> > unmapping everything. Similarly on the exec_mmap() path.
> 
> We need that one to clean up the GCS for threads that had it allocated
> for compatibility, you can see the leak that results without it easily
> with the glibc testsuite (or anything else that does threads, the glibc
> tests just spot it).  Most of the checking for arch_release_task_struct()
> is verifying that deactivate_mm() is guaranteed to be called eveywhere
> it's relevant, I need to page that back in.

Makes sense. I think we should only keep gcs_free() in one place,
ideally deactivate_mm() as that's more related to mm rather than the
task_struct.

-- 
Catalin

