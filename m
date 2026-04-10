Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E92F44842
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmNbR1bJ/kcSUFG1hDL1Mddu+47MWFT9b9TQ0fiwSaQ=; b=qbduxudq31lzr+q7NJPqJm5MIs
	6n6R/xiZ9VtOHO8fYGTDLnYeoiHn+XECKGMSxWUgNu9EEnufWKxv0F3ug5OTlzvC4w22wsuFYyR7Y
	AINmw1QuWuqnAf4p1VrFZgiC5jxXpw9n2XnTj+f0b/ucbfFI5IpDoXI0Ui+S2rcljIlJpOEcHki7E
	NVGTbEhwSMWhoAXoVYnaEst4GxbUS61AxThSiE8Vl6meeEkAkpO6aUZGh5JqCzwXrcYXMR1tQ6mZm
	TKYeX4Hlqa9agQJX9rbstKiPN/yO0gITF8Ty4NV8LdFw+z+SmmeBlMBKB+0GG+KEi8xIq9OxyJBeY
	tbw4e79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9sS-0000000C4bY-2joM;
	Fri, 10 Apr 2026 11:18:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9sP-0000000C4b9-1Puf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dmNbR1bJ/kcSUFG1hDL1Mddu+47MWFT9b9TQ0fiwSaQ=; b=SqyXaaNMA/1GZUz4J+Xb872qHC
	RSiOgQTVi/+G0KOF9zAdWiPn4WsSRHyfmkB+e0L9cCYEYbZLDQdSrqJykQ+QB19tV+9HPDAedoRC2
	Ohu1gCqupbDXAi86Aqm+5VatNQZFiRZSKclNzDe6OSPERqBDjWUX5ESJ2tT1LdBKhsTGW6DB8FIT1
	f7A5j0VZ3kin0zFgML0FOQZMprRJbF01wTDrGUL2+cdEootUntCPlDpu4DsE/NZw8a/UnGX4AFZg5
	7njhoI+3TygNUP1bBkUCcf6aOBOqUxnplvKiuoaivmK3bE8TLVVBKhmTDfaHi7Yzcu+XG8bf5WtzZ
	jdHqMjYw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37780)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wB9sK-000000004nB-42Nb;
	Fri, 10 Apr 2026 12:18:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wB9sJ-000000005ZR-23Wv;
	Fri, 10 Apr 2026 12:18:11 +0100
Date: Fri, 10 Apr 2026 12:18:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adjcc7QvquXI3G0Q@shell.armlinux.org.uk>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_041817_659302_2F965001 
X-CRM114-Status: GOOD (  27.64  )
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

On Fri, Apr 10, 2026 at 02:01:41PM +0300, Brian Ruley wrote:
> Thank you for the clarification, this is very educational for me.
> I understand your scepticism, and I can't explain what's going on based
> on what you replied. However, I do honestly believe there is a problem
> here. I'll share the exact testing details and the instrumentation
> we added that convinced us to reach out at the end. One idea we also
> had was that could cache aliasing be happening here.
> 
> To clarify any potential misunderstanding, we've observed the
> following:
> 
> - Sporadic SIGILL and SIGSEGV under memory pressure
> - Scales with core count, i.e., quad core more likely to reproduce
>   than dual core. We haven't observed an issue on single core.
> - Coredumps show valid instructions at the faulting PC.
>   The CPU executed something different from what's in memory.
>   This pointed us to stale I-cache.
> - Instrumentation indicates a correlation.
>   A per-CPU ring buffer tracking exec page migrations was dumped on
>   SIGILL. The faulting PC matched a recently migrated pages.
> - We started seeing this after upgrade 6.1->6.12->6.18. We bisected
>   two commits which had an impact, but we weren't convinced that
>   either was the root cause: 5dfab109d5193e6c224d96cabf90e9cc2c039884
>   and 6faea3422e3b4e8de44a55aa3e6e843320da66d2.
> - Failed processes include systemd, tar, bash, ...
> - Debug options, e.g., page poisoning, seems to hide the bug
> 
> 
> > So you're saying that stress-ng doesn't reproduce this bug but
> triggers the OOM-killer... confused.
> 
> Apologies for the confusion. I meant that with `stress-ng' we created
> the memory pressure and OOM might have played a role in exposing the
> "bug" as we (at the time) believed that anything that would trigger
> memory free/reclaims and page migration was the key. One note I'll add
> is that in our test we invoked stress-ng for 2 minutes (--timeout 2m)
> and after each we would reboot the device. We had observed that reboots
> seemed to have a discernible effect on the occurence in earlier testing
> so we kept that in. I'm beginning to doubt if it had an effect now,
> and unfortunately it's all anecdotal.
> 
> One more thing, even if you don't accept the patch, is this patch
> harmful in any way or is it just sub-optimal?
> 
> I'll send the instrumentation patch as a follow-up, migh be there's a
> flaw in it.

I'll try it - I have Cortex A9 systems (some which I rely on...)

Please can you also try to track the history of what happens for
the PTEs corresponding to the old and new PFN?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

