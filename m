Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8FAD149F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePBCrXDkYFx/2MDEBoHUpjfoxbGRLqNpKAELJMFiw1s=; b=ZT/efOV+CGeqfF+9vfGQIJ5NOg
	Q1M+VjhKvntmMoJ4Jz2IfB10dT/gN6HIj3Ual12QAFg9wukW5QL2FLKd/hBvJpabYFagS3S9w1RcZ
	NDU+lgaNwyatnVjLoMUKYyE4xeowdC/ltRnfHznx4+EYPdRbH2F5fQtIqX0Y7GDhbOacyM4uAivmv
	o4Dz5te7FrpV7tiNpjMi3bYJINV5/uqMYhtzblZaGqvvIMSxr4KC6KOFzUuME0awMuU7svCKqOOzW
	8rRBSt/WRLUndXTLeoX+j7BrZKK11AmuWG8FjuXPedLHaSk+gIvSUBMTT8SpqsJdBH+ew8DwUtjv6
	z16E87tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RAI-000000059fr-3Wmb;
	Fri, 25 Oct 2024 20:44:10 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4R7T-000000058L6-44BF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 20:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1729884632;
	bh=ePBCrXDkYFx/2MDEBoHUpjfoxbGRLqNpKAELJMFiw1s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tKnIU9yLNT99wXsnGjwNZKVelKMhdVUWjq8L2OltJ89liNws7uTd5XHNZ/dh7Rdtg
	 +Zr9Z+y8LnEli7a/gbrQJZYA2kf7gb6EO0kEY37+chasBXZ/XiOFFk3TAxP8V6lETj
	 dTN0G6HxplP2egvSeFaopp1BBhME+m3fnTR0OwS4=
Received: by gentwo.org (Postfix, from userid 1003)
	id 38560409C6; Fri, 25 Oct 2024 12:30:32 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 3716240681;
	Fri, 25 Oct 2024 12:30:32 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:30:32 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Peter Zijlstra <peterz@infradead.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>, 
    Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load
 acquire
In-Reply-To: <20241025074244.GB14555@noisy.programming.kicks-ass.net>
Message-ID: <797cf697-83b2-7f45-4865-2ee394887dc8@gentwo.org>
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org> <20240917071246.GA27290@willie-the-truck> <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org> <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com> <20241023194543.GD11151@noisy.programming.kicks-ass.net> <e9fd5ba0-bd84-76a8-a96e-1378c66d0774@gentwo.org> <20241025074244.GB14555@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_134116_104402_EF11242B 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, 25 Oct 2024, Peter Zijlstra wrote:

> > atomic_inc_release(&seqcount)
>
> It would not be, making the increment itself atomic would make the whole
> thing far more expensive.

True. I was too much taken by a cool hw feature on ARM.


