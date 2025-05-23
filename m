Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30B7C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFE8tg2hkqL/QDMRDxBmyrXVviTv054S7EmAHGK1Cu8=; b=KeT4oSYpfh35CuBnU//7eiHTno
	0ggwbO5Gl/fl1l0h3HinKgZpm4812pi2fpsupbUSCz/um4v2Rqbjnn7PYEeSijIeg2gfXhiLMjIR1
	AzmFJBr5OYmWgaED3XNl4ZVDrRSIWTRUab2V5amkqf28EdI8HteWNPGWOtdTNNaMP9pzkOLp1kOzL
	DzHP6zsOGlSvZAKMih+JL6V7donTocKIe3d9v+m5AhWIEKZXK8NLaZqfzQcdr+gKd92Px7ui2ZbPG
	eP6dDaGvgi5wk/qv/3JISPfwQOtPVjsoCYDFVqkjB6DIx1YluzTOzJbVOj9PwyGAdvoEkigh/l3nn
	6Rka/Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQOA-00000003gNZ-2WUs;
	Fri, 23 May 2025 11:16:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQM0-00000003gAQ-0vsr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 11:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qFE8tg2hkqL/QDMRDxBmyrXVviTv054S7EmAHGK1Cu8=; b=VTm6YpXt+rg+boo/Y2XlDLHfjF
	uTUdFDuv7CRduVt0vgcpt1H3qXyWcKOUKwBJyBzjyRnEO9SE7JRpGZOhTfBBSEBXLgYIEYKbXlZDB
	tpsVGBoReZXjDVnjHYqsbdp3l9lenZI0uN4sGBmjoTHFC/oSTcCk06BRBBvKukbRvtHnIoQOohxFp
	AAk2xVkEy/ZUzR6Fa5IR24TYqZXrrQUCbpTsXVqK4NnKuLMx7BbaRzGqb7TLhfaz4cV5tvbk6Bwys
	vuAtkKS5Ar3GY61i/vpDcdclGEPpTbtP7i+0lOv6wFveWet/d/4Gtx0J7aORLDJMVameaAuX32RZ0
	m/g+9Shg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQLx-00000007VFJ-22r2;
	Fri, 23 May 2025 11:14:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 10E13300583; Fri, 23 May 2025 13:14:17 +0200 (CEST)
Date: Fri, 23 May 2025 13:14:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 00/13] KVM: Make irqfd registration globally unique
Message-ID: <20250523111416.GJ39944@noisy.programming.kicks-ass.net>
References: <20250522235223.3178519-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
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

On Thu, May 22, 2025 at 04:52:10PM -0700, Sean Christopherson wrote:
>   sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
>   sched/wait: Add a waitqueue helper for fully exclusive priority
>     waiters

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

