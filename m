Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA29D31A3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiDCyIt20CzxUvCCc7yr/C6hAGxEwAzu+F3NvxFHJzk=; b=ZmdZsghvuWGX+LNrTj00B6uNNI
	kcjTjV1T2koN4NwL5+IL/X1Pbj3WMuIxt0EKQylLpAo3fo6RKHmY0Q3o26s1WH3hSumM1RGKrC1R2
	EocXN69eeLok8VoEgWnPSMnUhkOJqdxTFr4D5eW3f05yScUWgFI3cMOkEarasmWs73ddRwqLdrBEz
	m3ZizEsGAQrw7h8WS9caenhNDtfmKDXDHePpeIZl2WyD3l8r6h5wF0RifPLqBIZ+EBVJl3MPgMY3b
	iJxI+fOUBlxKe91Tl+qrbApPiyrIs5IOydiebnpRCbO9oi4irs6P2EklKW0/yAq79bAKbKfKYx34p
	SWnePttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxGq-00000008aG1-1fBV;
	Wed, 14 Jan 2026 09:34:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxGm-00000008aEc-2pBO;
	Wed, 14 Jan 2026 09:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5FE60051;
	Wed, 14 Jan 2026 09:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6688DC16AAE;
	Wed, 14 Jan 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383267;
	bh=QCqYpWqKWHECS6LyWQkRM/br5oR6fqyVbwR9TGBPsQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCAcobZU3its6pMbxAKLPlKnf/wW0ogAAk03gUzk3dw8FRsPXZFpmmIy7+o9BGUqD
	 J+ceWtm4YMlCe/qaxRhCRyHBnnAOmA/7+Gl3a8m2JY+a7jlbNtc2RTGbZEB74eJTUM
	 vrGuVLxUsxv/M7iH+cN8YOBwrGC+QdMGu/P5PKHt2QpgIIMlY/lFfHwECZWtY5xdO4
	 lKXaDrfvePUhs9pDAT4K54pWT3LSyfER9DAAzq2k9hZaymAZODYzMq3VJCwcOltetO
	 A1nX0qkMR5rZ7cTmg/kDcKnkJmYZuHNfJLLzTPQ8Z2oqNbAGs7nmoNYu1+xLpTSnO2
	 Y74paLEWIYJFQ==
Message-ID: <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
Date: Wed, 14 Jan 2026 10:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
 Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>,
 Srish Srinivasan <ssrish@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
 <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 14/01/2026 à 06:00, Andrew Donnellan a écrit :
> On Thu, 2025-12-18 at 12:55 -0500, Pasha Tatashin wrote:
>> Thank you. This series looks good to me.
> 
> Thanks for the review!
> 
> Maddy, Christophe: any further comments from the PPC side?

No further comments from my side.

> 
> Do we think we can get this in in the current cycle? My last day at IBM is this
> Friday, if a further respin is needed then Srish will need to handle it as I
> don't have any access to powerpc hardware outside of work (happy to provide what
> help I can from the outside though).
> 

What is the merge plan ? I see all powerpc commits are acked by Maddy, 
will the series be merged by Andrew into the mm tree ?

By the way it doesn't apply on top of powerpc/merge branch:

$ b4 shazam bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com
Grabbing thread from 
lore.kernel.org/all/bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 17 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 86 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v18 1/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
     + Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> (✗ 
DKIM/soleen.com)
   ✓ [PATCH v18 2/12] arm64/mm: Add addr parameter to 
__ptep_get_and_clear_anysz()
     + Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> (✗ 
DKIM/soleen.com)
   ✓ [PATCH v18 3/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pud[s]_set()
   ✓ [PATCH v18 4/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pmd[s]_set()
   ✓ [PATCH v18 5/12] mm/page_table_check: Provide addr parameter to 
page_table_check_ptes_set()
   ✓ [PATCH v18 6/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pud_clear()
   ✓ [PATCH v18 7/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pmd_clear()
   ✓ [PATCH v18 8/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pte_clear()
   ✓ [PATCH v18 9/12] mm: Provide address parameter to 
p{te,md,ud}_user_accessible_page()
   ✓ [PATCH v18 10/12] powerpc/mm: Implement *_user_accessible_page() 
for ptes
   ✓ [PATCH v18 11/12] powerpc/mm: Use set_pte_at_unchecked() for 
internal usages
   ✓ [PATCH v18 12/12] powerpc/mm: Support page table check
   ---
   ✓ Signed: DKIM/ibm.com (From: ajd@linux.ibm.com)
---
Total patches: 12
---
  Base: base-commit c224625ec6f8a0476ffffc09807f4d717ba9cc93 not known, 
ignoring
Application de  arm64/mm: Add addr parameter to __set_ptes_anysz()
Application de  arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pud[s]_set()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pmd[s]_set()
Application de  mm/page_table_check: Provide addr parameter to 
page_table_check_ptes_set()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pud_clear()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pmd_clear()
l'application de la rustine a échoué à 0007 mm/page_table_check: 
Reinstate address parameter in [__]page_table_check_pmd_clear()
erreur : l'application de la rustine a échoué : 
arch/riscv/include/asm/pgtable.h:999
erreur : arch/riscv/include/asm/pgtable.h : la rustine ne s'applique pas
astuce : Utilisez 'git am --show-current-patch=diff' pour visualiser la 
rustine en échec
astuce : Quand vous avez résolu ce problème, lancez "git am --continue".
astuce : Si vous préférez plutôt sauter cette rustine, lancez "git am 
--skip".
astuce : Pour restaurer la branche originale et arrêter d'appliquer des 
rustines, lancez "git am --abort".
astuce : Disable this message with "git config set advice.mergeConflict 
false"

Christophe

