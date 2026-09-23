Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E72C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUiZfwxfj8ZnHn30c4InwU820kwbd+Dp0pJhsZZKAvk=; b=HKN9R9kSWpXxqOM/VvP45IpsjU
	SknFQzVEedLL+8vEWi4bB3w/porU8BmdfYTKRwdZ1vUphWQEM1jNJpP+OKe+qalOqISqejXc8T1o0
	OhLYntmETCfdsL5e+9HsJvhNsnXx32JJ3PsUXDPpzcJwYQASs7HFmQitIBGOopiPwVD7IJDin0lLz
	QR1gzpMmSBdOJ4JDywR2dlfa3ulg4DpcCAyWas8uPtVr8bwdvP9lfRTO81MivwiMdNfnIxot4t/aS
	pXGQpcI4m+wtCvIK0zUVVX4Iq2BYFpDyFc+qex3/ePQngAEUOVaaCusQNFIwyON49hK1FhUtVSZMS
	HEJE74cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O9N-00000008Yzh-0Nbk;
	Wed, 23 Sep 2026 14:40:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O9K-00000008YzB-1asE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:40:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F40A1476;
	Wed, 23 Sep 2026 07:40:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47E8D3F86C;
	Wed, 23 Sep 2026 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790174440; bh=Fnyh6hqs6x+wESv2dZcvtS4pSeABTF2o86CklC/OzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVbhSAW305B/u/SyYJIr24fqH0aWICUSiZpJKBmRw1t8e09RJjp16mh1cREvJ/otd
	 x7hdyl+qNd1EbYKzKse8MB828tPnm1bPGAUkDWlG/NqZ6tK9WOS8jI79Ybvk1t/3/8
	 qspizVU38Fm/Qfp4kGdIqPiWQMhJFDVnSLW9vuwo=
Date: Wed, 23 Sep 2026 15:40:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH] arm64: Add user and kernel page-fault tracepoints
Message-ID: <arPk4TgOZAT-kax9@arm.com>
References: <20260520045524.75670-1-jbouron@amazon.com>
 <20260520073606.GA101133@e132581.arm.com>
 <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>
 <20260909175058.GE200420@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909175058.GE200420@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_074042_524306_4A9B71A9 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Kudrjavets, Gunnar" <gunnarku@amazon.com>, Ryan Roberts <ryan.roberts@arm.com>, Quentin Perret <qperret@google.com>, "Bouron, Justinien" <jbouron@amazon.com>, Kevin Brodsky <kevin.brodsky@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2026 at 06:50:58PM +0100, Leo Yan wrote:
> On Wed, Sep 09, 2026 at 01:13:42PM +0000, Bouron, Justinien wrote:
> > Thank you for the feedback. I've posted a second revision at
> > https://lore.kernel.org/lkml/20260902115216.49158-1-jbouron@amazon.com/, though
> > it doesn't seem to be getting much traction.
> 
> This should be in the arm64 maintainers' scope (v1 caught my attention
> due to it mentioned perf related things).
> 
> I think the main question is these tracepoints overlap with perf sw
> events. Could you elaborate on why ftrace tracepoints are necessary?
> ('perf record' and 'perf script' can provide similar info and we can
> avoid extra latency).
> 
> If the maintainers think this patch is reasonable, I'd be happy to help
> test it.

I'm replying here rather than on v2.

Back in 2025, Steve and Will suggested a generic helper that emits both
the trace event and the perf event, so we don't have to call both
independently from the arch code. AFAICT, this patch (nor v2) doesn't
change this.

-- 
Catalin

