Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D47C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/80AwWXrivI+neZRMiIV+d6NMNyflzdEuKzM/Rjq8s=; b=XsYSz7wf3S3W4Ehmqs+KQ+kgtE
	BfDCxscZBalDLCiGgjrsCqdiywJN8o+YO6tp5cwE+t6pY9L1VY2Vpy+DDD0cDFGkpmapAYhT57hmD
	BnuM2zaGoHXsBTgzeuY+0gXVQJ20YLEfOmASZCYr2JqHV430P97E026Dj6KTu6E8mag5W60FeX7r9
	Fdwao7UOdh8sXRk1Z8oxCDAykUvi/WoxRhzaa972/BlFaiD79lB1ltwre/kkzDspxIBjL9PX/+/ol
	/DJLKHR4yI/EWlk25e2gqbvyLh70CIV1a/9zXRSjt24b92c9g+nQkrlxEKFCwB/O/gEsYsg//gESV
	H1XfWHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1E9-00000006bVW-2lvR;
	Mon, 17 Aug 2026 17:34:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1E6-00000006bUP-42wc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 17:34:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A344514BF;
	Mon, 17 Aug 2026 10:34:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A6483F673;
	Mon, 17 Aug 2026 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786988060; bh=dQHeVJirWd2OT1TdcvEiO5y7O6Dg5Prwr73YHx3YgGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2j6v1+1kEj7SSVM9Z8novRqGeoQKzjTsL/kODG2VHN9wav2fIVvYLOOsBj2gcsay
	 CORquf427smN+XQJ22xJ1GiiAFsv6aQMXPknWZ3Y2XT7vP+pbPcXpdgPCbLUA9yDAS
	 bl/pMq5IX9UHlSyIxTvkIItls/szRGWTzY4swwyY=
Date: Mon, 17 Aug 2026 18:34:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
Message-ID: <aoNGGKYZrOlaJ4mH@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_103423_084385_18FF1052 
X-CRM114-Status: GOOD (  15.63  )
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

Hi James,

On Wed, Jul 08, 2026 at 03:11:10AM +0000, James Houghton wrote:
> The following Herd litmus test demonstrates the PTE update routine:
> 
>   AArch64 TTDFaultlessUpdate
>   Variant=vmsa
>   TTHM=HA
>   {
>    uint64_t x=1;
>    uint64_t y=2;
>    [PTE(x)]=(oa:PA(x), af:1);
>    0:X0=PTE(x); 1:X0=PTE(x);
>    0:X1=x; 1:X1=x;
>    pteval_t 0:X2=(oa:PA(x), af:0);
>    pteval_t 0:X3=(oa:PA(y), af:1);
>   }
>    P0                | P1             ;
>    LDR X4,[X0]       | L0:            ;
>    MOV X5,X4         | LDR X2,[X1]    ;
>    CAS X4,X2,[X0]    |                ;
>    DSB ISHST         |                ;
>    LSR X9,X1,#12     |                ;
>    TLBI VAALE1IS,X9  |                ;
>    DSB ISH           |                ;
>    ISB               |                ;
>    CAS X2,X3,[X0]    |                ;
>   exists
>     0:X5=0:X4 /\ (* First CAS must succeed *)
>     (fault(P1:L0) \/ ~(1:X2=2 \/ 1:X2=1))
> 
>   (* This test should not violate BBM requirements. *)

We definitely need a clear statement in the Arm ARM around this. As
already raised in this thread, we can assume that AF=0 entries won't be
cached in TLB but there's more to the BBM rules. For the dirty bit, we
have R_SGJBL, we might need something similar for AF in addition to the
BBM rules update. In theory, I think your approach works but we need the
memory model experts confirmation and the Arm ARM updated.

I'm not entirely clear what the above litmus test guarantees other than
not giving a warning. On P1, X2 can be either 1 or 2, otherwise fault
but that won't happen with HA. I'd rather have something in the 'exists'
rule explicitly (like a TLB conflict abort; not supported AFAIK but
maybe that's what fault(P1) was meant to show?).

In addition to the above test, I wonder whether we could have P1 do two
consecutive reads from [X1] and check the read values. Maybe go through
a third mapping, OA(z) with AF=0 after the TLBI or just start with AF=0
on x. Basically any other tests for coherency like read-after-read etc.,
check that the behaviour is preserved through AF=0 just like going
through valid=0 with BBM (that's something that should eventually be
runnable on actual hardware to validate where we won't have a BBM
warning message).

-- 
Catalin

