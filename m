Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560CEC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COSAydh429reoE4aNbcE1igiH3jcPkkYbLhSryVScJk=; b=hDZ3IuKHV0QcwHNSCvwFlrthsZ
	y1heSPgIFjfGIHfYy3hNR2TBUqufgD17sNnlJb1gKgoZecHjSTzE2JeW5/dPVA1AYJVYYiMWs50hy
	fETfl0dZY2YSCVNeabZH8/VGDIqis3p0EVG3dWM7PpVVPSirYGCWhgZtlWEcbRp/KwGQ4PwYUKpGh
	PQsZVPZSvUqTjg32Xltfl+NySsMwvkhtE5mLkxt+fI4ab//Xbo7m8giTO96E6/EZE6hfK43MZhaJm
	7B2CU4RNII9OECVxpad+hXJHgxkrLcaUM7oceGEfivffuxV00FH67xdZeuIA55xLVoCPIJSBiFQTG
	OvQwMrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSmI-0000000Dwxs-3pS9;
	Tue, 20 May 2025 19:37:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSTh-0000000DuWc-3Giq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 19:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=COSAydh429reoE4aNbcE1igiH3jcPkkYbLhSryVScJk=; b=QVSFD4DNGku4hxVzqgOTd7h1SA
	l940GeDOLM8U52ViwNfh1bhUSna+J+WxE0VfoFFVLJVNTsHGTq5K4fx0pBFEwPabOpcYB0Xq6xe09
	eO4C+WWflHoOEjOBYLUImVskrgLOI8y1OJrfbvg+0ap8qrV/kr6YTs6gu+PVQ0hdONEzQGLxlrGOW
	FTodT4PWuvOoTN1pe/BX1sQ9zOIDMnuKM5YRkVXMFCITxab1B6SOXT6S47cTzIDwOI4mzSGJHnJBr
	IcrE733soLpXYqAvTDHwC3mJIjMsGpKyp+nWjwuuw9bkwJpgBRVI0P1q0ug1Ufp8wF/bdGuN1j5kV
	JAABW/5w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSTg-00000003kOT-2YEA;
	Tue, 20 May 2025 19:18:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 395B3300677; Tue, 20 May 2025 21:18:16 +0200 (CEST)
Date: Tue, 20 May 2025 21:18:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>,
	David Matlack <dmatlack@google.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from
 add_wait_queue_priority()
Message-ID: <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
References: <20250519185514.2678456-1-seanjc@google.com>
 <20250519185514.2678456-9-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519185514.2678456-9-seanjc@google.com>
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

On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
> differentiate it from add_wait_queue_priority_exclusive().  The one and
> only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> unconditionally returns '0', i.e. doesn't actually operate in exclusive
> mode.

I find:

drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);

I mean, it might still be true and all, but hyperv seems to also use
this now.

