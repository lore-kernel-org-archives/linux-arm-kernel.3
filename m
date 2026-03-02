Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C8E9B37F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek4bJJsM5l9dHRUyFiLAAxetRets0RMYQiCz09mj05A=; b=AH5Vk7jG6o8RhHXb/sE51NqRG0
	/cMU5chrAeKoQ0sNPkzbUkUCJlx/J+TXowptiVL0lJb3lycLYpEn4KkX5+EOzfcZRhgbXBKkEX9ZQ
	F9fbwTm9wZ8NKVfifma/eGFqhmivxsFv+hn7FmRpLQ2rzFMsGsR+8n/ThUA1/sHqLnwpZCkGkZBPI
	930bqFsmsCZOMR7poXuZDLG7POvxvuJH4Bj1Sn590Umit2q3+lWky8omyQ597A2FTInjhbXAHdGCF
	Zku6fFdWw6Wr/S8+pMSVnpNZvPfoqqb6YXTafMzA2Ra5pnVsDHQPd3bd9Clva5Xbfmut7Rm8FD1Vo
	FEEQt+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3YV-0000000D93N-2wOs;
	Mon, 02 Mar 2026 13:43:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3YS-0000000D931-3hXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:43:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1759714BF;
	Mon,  2 Mar 2026 05:43:17 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BE4B3F73B;
	Mon,  2 Mar 2026 05:43:21 -0800 (PST)
Date: Mon, 2 Mar 2026 13:43:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: catalin.marinas@arm.com, dev.jain@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
	yang@os.amperecomputing.com
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
 re-entrant kprobe_busy_begin() calls
Message-ID: <aaWT9hneQSRgpIuj@J2N7QTR9R3>
References: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
 <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_054324_958021_C08004CF 
X-CRM114-Status: GOOD (  18.14  )
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

On Mon, Mar 02, 2026 at 05:53:38PM +0530, Khaja Hussain Shaik Khaji wrote:
> On Mon, Mar 02, 2026 at 04:23:46PM +0530, Mark Rutland wrote:
> > The el1_dbg() function was removed in commit:
> >
> >   31575e11ecf7 ("arm64: debug: split brk64 exception entry")
> >
> > ... which was merged in v6.17.
> >
> > Are you able to reproduce the issue with v6.17 or later?
> >
> > Which specific kernel version did you see this with?
> 
> The call trace was captured on v6.9-rc1.

Why are you using an -rc1 release from almost two years ago?

> I have not yet tested on v6.17 or later. I will test and report back.
> 
> That said, the fix is in kernel/kprobes.c and addresses a generic
> re-entrancy issue in kprobe_busy_begin/end that is not specific to the
> arm64 entry path. The race -- where kprobe_busy_begin() is called
> re-entrantly from within an active kprobe context (e.g. via softirq
> during kretprobe entry_handler) -- can occur on any architecture where
> IRQs are re-enabled before invoking kprobe handlers.

AFAICT, re-enabling IRQs in that path would be a bug, and re-entrancy is
simply not expected. Please see my other reply on that front.

> I will verify whether the issue is still reproducible on v6.17+ and
> report back.

Thanks, that would be much appreciated. As would anything you can share
on the specifics of your kretprobe entry_handler

Mark.

