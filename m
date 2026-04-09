Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D3DF31E59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2I4AVmopRlJzqMZliNphlchMvKBuATlAqtlyPTDHL0=; b=aJIMLGDw2ZILYCqdsVR+C4jnpk
	azDI+yejfWb4EhO3fZ6lnwBhqg9bf/tZlQ3RtdcPV2Zm805QUXdXko+aXsMt8/4WyA4JtQ3/cZX62
	wXCxAwvmh0msp6gQ0VZWFJEEpOxEb+6NSXF4SY6C5Lb6FOOV1gmKG1//6x0o2zpCUFZFtYkOVzAzH
	NIg6w2jOxksf6nUt28y+8MRVYQzbmTIrDkzUv39REeVDmsubKeHLGzTjT+yDNcNcjIGJIOa0OqFJ4
	F/6EjSgfdN+aFvIa0u8Bpzy0UXWoHXJCgGH7EsgNChqGehSMNQeeMhKhsNsakqjIgwdEHS2xzB2y6
	vp5c4FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAroX-0000000AsrV-1IVM;
	Thu, 09 Apr 2026 16:01:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAroT-0000000Asqd-02aJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R2I4AVmopRlJzqMZliNphlchMvKBuATlAqtlyPTDHL0=; b=LGJlLFJQvlNlkVNRAOE75YZYf+
	jULZa30Z53T0KhMnkhc58pENVcvdaadEnLVtDksACyC2r3++5IuoSJuVZG14kzsYrbymFyNUmp4US
	NHM/dtMzhShRRI7NsXIyIWQLa0EbO0xQ9mgmldXcgIg26KggUmwBArWA31I5FAh2ipv5JIojs3nXK
	8xm//kdQMu75LebuxyiyHbdibfJ4tOaXBAVKlHGQPR6nA63GZy4sP/yHmkJO421fXSAtlsR1EuM+l
	LhXwL70k9cVmCJvt2A+R19y/xp3+2JAgGt3/kgZ2QhyRi4eb0OMCQRJFAa6gduFne/JJWCeYzmfRk
	BRPWFZ5g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51602)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAroP-000000003qO-1YKq;
	Thu, 09 Apr 2026 17:00:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAroN-000000004WJ-3Jol;
	Thu, 09 Apr 2026 17:00:55 +0100
Date: Thu, 9 Apr 2026 17:00:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_090101_072889_1139188F 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, Apr 09, 2026 at 06:17:36PM +0300, Brian Ruley wrote:
> However, in the case I describe, if VA_B is mapped immediately to pfn_q
> after it been has unmapped and freed for VA_A, then it's quite possible
> that the page is still indexed in the cache.

True.

> The hypothesis is that if
> VA_A and VA_B land in the same I-cache set and VA_A old cache entry
> still exists (tagged with pfn_q), then the CPU can fetch stale
> instructions because the tag will match. That's one reason why we need
> to invalidate the cache, but that will be skipped in the path:
> 
>     migrate_pages
>      migrate_pages_batch
>       migrate_folio_move
>        remove_migration_ptes
>         remove_migration_pte
>          set_pte_at
>           set_ptes
>            __sync_icache_dcache  (skipped if !young)
>             set_pte_ext

In this case, if the old PTE was marked !young, then the new PTE will
have:
	pte = pte_mkold(pte);

on it, which marks it !young. As you say, __sync_icache_dcache() will
be skipped. While a PTE entry will be set for the kernel, the code in
set_pte_ext() will *not* establish a hardware PTE entry. For the
2-level pte code:

        tst     r1, #L_PTE_YOUNG	@ <- results in Z being set
        tstne   r1, #L_PTE_VALID	@ <- not executed
        eorne   r1, r1, #L_PTE_NONE	@ <- not executed
        tstne   r1, #L_PTE_NONE		@ <- not executed
        moveq   r3, #0			@ <- hardware PTE value
 ARM(   str     r3, [r0, #2048]! )	@ <- writes hardware PTE

So, for a !young PTE, the hardware PTE entry is written as zero,
which means accesses should fault, which will then cause the PTE to
be marked young.

For the 3-level case, the L_PTE_YOUNG bit corresponds with the AF bit
in the PTE, and there aren't split Linux / hardware PTE entries. AF
being clear should result in a page fault being generated for the
kernel to handle making the PTE young.

In both of these cases, set_ptes() will need to be called with the
updated PTE which will now be marked young, and that will result in
the I-cache being flushed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

