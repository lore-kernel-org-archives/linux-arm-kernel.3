Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6794E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5b/SzXNKy2u89kOS6863gKBjjhCX3NwQcbqPHiM23k=; b=Zm5jYULaxNhvZfI8q1vP1yh/4u
	kE5oU8YZPUcT5kg9Banw8zXz3pUFzRJrb9FjHgzVRuRjxRUYUGbA2MBXL+rkeXPKhrui7apTaJzX2
	/56vVWMy5LJnPsKSB5awWJBGdATPE7+mmhlIIPynN1wvUXMqGUn2SvHj83bq7BeGCe0jK4XHvCaPs
	dds2U8M7ENukBqoeJ2gE9cah2KZ1fi77Q5VST2xkWizoOJchv+ItFvpEdll0MbfstdZmkus5cHTxq
	mGg9eP4eu0nBxcXc2iBDWtg2L2nbI7gNXbsisofIQxt91Y7Re+2kaMzZhRzfxicV/xxE7t05e/w2X
	H2dRBaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb5X-00000007JDW-0WOp;
	Mon, 09 Dec 2024 10:34:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKawW-00000007H2s-09a2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Dec 2024 10:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j5b/SzXNKy2u89kOS6863gKBjjhCX3NwQcbqPHiM23k=; b=pcnhI720VIIC4iKguwPtrXJIUP
	dcGVWxU5YQ9we2HgCEAG+o+Hn52tCwhG13DslCECqrt1O37IIsdo5FbxZo/C2nG4OJYQaVAWn1ptj
	aIOTLCfTctvN1zGboZcDLDHoqbhNQzHjhhr5TmQVtb68YogacokkV1EIcYIRlNyCx7r6+IIX/IG+X
	Ls3+5n3P8RvHu0NB1lmCE0DMCeSVvjo7Sbl12iCsdsjrXWSFcXkVvsICKXs9dZAYGX2B/c1CtTANL
	es0zQobuvV2vlOPFUNs9yaVuLE0HaWjKO+XpQE9+H+B+6+5eUwXNxAjB2NHWClluO7bwnXYemZBr8
	0ykOcbQw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKawS-00000003WeE-3gW6;
	Mon, 09 Dec 2024 10:24:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 331983003FF; Mon,  9 Dec 2024 11:24:40 +0100 (CET)
Date: Mon, 9 Dec 2024 11:24:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	aruna.ramakrishna@oracle.com, broonie@kernel.org,
	catalin.marinas@arm.com, dave.hansen@linux.intel.com,
	jannh@google.com, jeffxu@chromium.org, joey.gouly@arm.com,
	kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com,
	qperret@google.com, ryan.roberts@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH 12/16] arm64: mm: Map p4d/pgd with privileged pkey
Message-ID: <20241209102440.GI21636@noisy.programming.kicks-ass.net>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-13-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-13-kevin.brodsky@arm.com>
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

On Fri, Dec 06, 2024 at 10:11:06AM +0000, Kevin Brodsky wrote:
> If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map p4d/pgd pages
> using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that they can
> only be written under guard(kpkeys_hardened_pgtables).
> 
> The case where pgd is not page-sized is not currently handled -
> this is pending support for pkeys in kmem_cache.
> 
> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
> (default).

Should not this live in pagetable_*_[cd]tor() in generic code?

