Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E71EEFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPwMTZWQmzw+6Xa3CNcGXsn5offzw2jIHRKSeIEW9o8=; b=w9YGSKl7C9rsQm0z6Q/kY4bEVD
	36DSsPNjCAqWhsTzqNJyFTQsekgFdEkRqF1Qw+DC0Dc4ED1zSfQR3jndOeWntV8ZafWx++Iwt/5mm
	lXI16G5F7bt6WB6TmvRjDX2QkY6HEQcrLg82E48YEucMJoyb0yMmsaoCsje6Mg2Yd4rJF0W9jf32w
	9qxtxT42EyvVAwZskH8H70HgBk9iTea3wSXMDCzb14M8gimUaVSu6dG4rvhBD+tYKPuFkneSv3v0E
	kjYfBR5BMBJ2kd3S9Dp9j5lstRzPWm/ZiVv0VyFX/lVkD7558OPcVrsb/wwgq0LWn1uZ9iSQcL0uS
	DuQfBgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo5S-00000001fLO-0VW0;
	Tue, 24 Feb 2026 08:48:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo5Q-00000001fLA-2bvQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 08:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OPwMTZWQmzw+6Xa3CNcGXsn5offzw2jIHRKSeIEW9o8=; b=jtAfpbVToV5pGfAUIriftlmEtd
	grhIHAD2SR3tLyqTldmXkDaSTrIl4xvbwgOceVOAFcqLDFtpLzDbV0tkUhmy2SL6zZDc+dX3fkfTO
	nlSz5M6CUcfD1q6LTSX6P76TUpfzB1fR/Cc0eX/Jbl8CS9/KACpkB/hVfTxB0fJRs8UNQqIGbSmuv
	wZUtZ4V3PgZJ/Yzjyt0c67S9ovhN1ovWwe8cLzxk/lygrx2usidPXqsTma9wMSABdUbL9Ri1xIMd+
	59ehPIuFVTtRwyvuZJArnuKZjDSZ5ZLKh2o6K4PS0RxAY9EKhtRVJGxObSv+aNjgWy9J6qmK1jg65
	cz7+U6PQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo5N-00000006hUZ-3Wje;
	Tue, 24 Feb 2026 08:48:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 48CEF30095A; Tue, 24 Feb 2026 09:48:04 +0100 (CET)
Date: Tue, 24 Feb 2026 09:48:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
Message-ID: <20260224084804.GU1282955@noisy.programming.kicks-ass.net>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-5-anshuman.khandual@arm.com>
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

On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
> anyways default into READ_ONCE() in cases where platform do not override.

This is a bit silly, no? All of them should always be READ_ONCE(), with
the exception of pte_get() on PAE like scenarios.

