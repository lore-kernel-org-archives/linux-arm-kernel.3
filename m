Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D3CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NlCppqlh9IN+OUBU1U01H7S97jTJiDfAUXtzFgU1ic=; b=uEe98iupOL06LojOfeCpKoFo4F
	NNzTXELHkCz5yQaHTAtCL7d/jJNT8+mX/e6Ev9IVdIf3A76xqqrX2P575Pp0rQdv+UUc2lHLrNe9c
	zqkpYApz2kaKXHZy6Nl4CYwiHiqVyK92XBL3qGwQlrO/qcFhbhceZ3cMeUw16PW8tOK5KDi4ghMfr
	60/ZYrEh3wWLMD8128sVdMK7KNcbeeacyoDfZL1iap4Xu/h2hppmIgz6KmxAGulVNxUSjJuhfGcPi
	DuzlY+FYPwvGlloGKAcCTSQMoy+QBuv3Vx7nc+VA/cpM8SvYAV1n/gClFeP4/jxaMJ/KGCxiHJyRL
	i87EH4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI4F-0000000Aowh-3CpB;
	Mon, 12 Oct 2026 15:36:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI4E-0000000AowG-0DwG;
	Mon, 12 Oct 2026 15:35:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28D0B6020F;
	Mon, 12 Oct 2026 15:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4809D1F0089B;
	Mon, 12 Oct 2026 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819356;
	bh=3NlCppqlh9IN+OUBU1U01H7S97jTJiDfAUXtzFgU1ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fDeKJRIQoUWqxjV7n4Ky9J09n+IIRHAAi7VsV3lDRQxJgy0ajNzavSe2IJZmQo8C+
	 RFQGyiEnACBiv5JFmeVZTOsdi3v30Gj4yk94TzBtLIIO8a3K+zzt3e2kYb/MpOqpsN
	 S/+jNKrosp68mtox8Fy1xkpF6qC5OhaodQPuyRKoiXo40wqvP6dkzgXSUl3tGh6DUW
	 fnVEzWB+2DotZlfr0oTJcLRUG8dNtWoNaCE2loO2fTGN+IDvS2QOpYPUOxhhMsPF3O
	 bMByXt7/Tkqi/81h6Ol/avfWmWeC0EoLgSqd26mtPqr6YaHXb00BhQkpkPtrGZfDyn
	 ba5o9eQotuKzg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin
 Brodsky <kevin.brodsky@arm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, Muchun Song
 <songmuchun@bytedance.com>
Subject: Re: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD
 tables
In-Reply-To: <20261010112457.49485-4-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-4-songmuchun@bytedance.com>
Date: Mon, 12 Oct 2026 17:35:53 +0200
Message-ID: <87a4ojaq3q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Muchun Song <songmuchun@bytedance.com> writes:

> Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
> pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
> However, free_pud_table() still frees non-reserved PUD tables directly
> without decrementing NR_PAGETABLE.
>
> Free PUD tables through the common free_pgtable_page() helper so that
> constructor-backed tables run the matching destructor before being
> freed.
>
> Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgta=
ble alloc")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

