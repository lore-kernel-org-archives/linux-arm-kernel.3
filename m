Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDAEC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJk8oJWZoNTTd4On2KCVVk2OTo+TigBo7qJMvAZpZjs=; b=Q6B6wL9QEZDpXydDOk8VrWIQu7
	lznnBij0ahSWcVpQgPoDBz/AAo6R++1pNt8zjMbaf+9nEfJoaniPSQLvUYMOda0szgN9aiDZq78kb
	7dpQWHluMSTYfNl6f7yyqTIxYXSjyjenSFFuTIw4OgTomFpHwG/UCrdqKZR8RwcIHS31O6ewJjFqb
	x3bfiN1xS4G9TD2HhaJgfAPV/M0jHYoy0mMEEDW12Se7abQO8sr8MwPLUSbtOLB//dVlwo40AXAm1
	LHqmuU1CfxuoXDwovUMxHz+5F7eEeASCTltveVmKS8fRSMoklsECRRHb1R1kEyyCwBUI2MexXD7vo
	UfKjO57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ASD-0000000D9dl-1EDP;
	Fri, 11 Apr 2025 09:13:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AOj-0000000D8ux-3MjO;
	Fri, 11 Apr 2025 09:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F75439A1;
	Fri, 11 Apr 2025 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED85FC4CEE2;
	Fri, 11 Apr 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362605;
	bh=8Zf1l8FhhOvmDcUrwydoQzHxR+9Hs6zytjuZjgAOCFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpaUQ7D7fXnA5CFSGpmPhrBob5/1s31V2Xekejj1hAORbvFeQbeIf8k7X2YJa4p4+
	 BiTxwRcHep9f5AZNUoEb0/k1GrbpavmRGU5KhbJgEXGSXTge/P/F3u/kkd4oKPTHFf
	 61EeLOenMgRZdkUnnNjVnao6HH9jNc6eScn7ZrfBcKgNdFi4Aou6YKVLHJ3eJhgm2Y
	 fEXDXXKA5tCoVYbZhtnSv6RWHciOO3GYEduGiKLpBDdznMarlfpaXG3uE79VVJcqFA
	 U6CATX8gDE7XYNOJRzrNfygVtr9kGiU1vi5fZAGt0HzNkMHc4ovCN6KV5Ij2WF+80C
	 Zed1ahSEbtH5w==
Date: Fri, 11 Apr 2025 11:10:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
Message-ID: <Z_jcaCdMFENW8KSG@gmail.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021005_865634_6E4AEC0C 
X-CRM114-Status: UNSURE (   8.52  )
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


* Andrew Donnellan <ajd@linux.ibm.com> wrote:

> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

>  arch/x86/include/asm/pgtable.h               | 22 +++----

For all the x86 <asm/pgtable.h> function parameter extensions changes:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

