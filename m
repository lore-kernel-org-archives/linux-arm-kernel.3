Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE74C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViR6DC/ZvgzwYbu96XsomABAIBwdE5dXzIiaRXSJtpI=; b=DnuPAord92zzn+uRqJSl0vNXPw
	ji/ftP0RqkX7DkLiSUoMZsmApZ5XfWvOc93k/HfiL9BKnGICiHowZ7JV1uqm1Jb+HNIoRyAEXxQcy
	KT8sIMhPnijqeD2cvVFFdOtIN42mJZqsiRTOyhvmx933Wx2hVN3bVQedL+JFGEhJ3Ai7xSrI6Jc+R
	rkLcOgV9lPtGg3gwLeycEkOzgtjYbjzNQQkiOZ34UMLX0rKWDhrWLDzrus5LVXsyxVc2Zcm6ESAqk
	DgA4xIarSdKk4wppHDaVpS1zKnnSEVW+1kmVLz15lV3lKHYian5KNmVyKoyhdiPkfxAF0uBJCwrCt
	cziyxZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQAp-00000003gH8-30Bc;
	Mon, 27 Jul 2026 18:35:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQAn-00000003gGx-3Hnt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EB9260008;
	Mon, 27 Jul 2026 18:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABF41F000E9;
	Mon, 27 Jul 2026 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785177331;
	bh=ViR6DC/ZvgzwYbu96XsomABAIBwdE5dXzIiaRXSJtpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=p6tOrDOnq9TjYLbCW+1lE+T/5SWNyB5fpetZ4Nf2WdIKeCWCVA/e05WnfeNKX1Gmt
	 UrXdMhCwKUcph6svYM+yL3QGbrzOuQwWZxcmJKs9umRexTqsKt92PoLTVM5iUIgDpD
	 8v0zrIz64eQ5WTULfU5ERZwUEsOePmTNevotOKQI=
Date: Mon, 27 Jul 2026 11:35:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: linux-mm@kvack.org, david@kernel.org, ljs@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
 lance.yang@linux.dev, usama.arif@linux.dev, jannh@google.com,
 yang@os.amperecomputing.com, rppt@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org
Subject: Re: [PATCH v5 0/3] mm: make persistent huge zero folio read-only
Message-Id: <20260727113530.5cd347581a66b3279490a604@linux-foundation.org>
In-Reply-To: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
References: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 27 Jul 2026 22:34:23 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:

> The persistent huge zero folio is shared globally and should stay zero
> after initialization. As Jann Horn pointed out[1], kernel bugs have ended
> up writing to pages that were meant to be read-only, including in
> security-sensitive cases. Making the folio read-only in the direct map
> turns such writes into faults instead of silent zero-page corruption.
> 
> This series adds set_direct_map_ro_noflush() so mm code can make a
> direct-map range read-only, then uses it for the persistent huge zero
> folio. The helper is direct-map specific, takes an address-based range as
> discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
> the caller.

Thanks.  AI review asked about a few things, some pre-existing.  Includes
a possible pre-existing ARM barrier issue in arch/arm64/mm/pageattr.c
	https://sashiko.dev/#/patchset/20260727143426.1077133-1-xueyuan.chen21@gmail.com

