Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DEFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytub/ABhcHAGBMlswmK9bBHTCNc+843SkpYmie3uZSU=; b=qUJ64HgR5wgKWkBhqGBxAZUJ1R
	k/q0ALoa4vgjy2kbsgnb6YhSzYqod6CYGNx2lrtWYGuJO9TAfhFMjQrexiWvZvFDP7/6byoBxnTzW
	wVRdrvE7Fz6opd8rtAmSrOIScVj2SveWdiDwjYafBt+kQbO54Aj/50b9IAnRCPMz14NrNHxbjychO
	Nh2UHu4w7NnAx+dk9WQD3i/H7DJ7K18pZFf4tnyuFI4asmUDJQuCPAidDWBMMMWDh+P/wKeWcMWwA
	QNfKTzcvIRS9HpGnM7paS+NnAgD0PeKjt2CqPV8a2TpQ0b+uMl3Ilkly5PKDdvLzEPrXrmvsLSOf2
	7Zt1cWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQRD-0000000GsXd-0Hpx;
	Mon, 10 Feb 2025 09:50:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQPp-0000000GsLw-2HI9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 09:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ytub/ABhcHAGBMlswmK9bBHTCNc+843SkpYmie3uZSU=; b=qqagFlWpGiC7s1kMia0gIKijlN
	degAWsQOLPxd5BTt2tcdwc0UY/0zj07lzu01pCW+NCaCtjbVN/uByyftaO1rGaB5j+2Di6akbxPa8
	y6ObBM0qhYBwdCpZtp3d45MsCEqfnytyYcr+OWbhQewqc+7R/OCRU+WHfzmUz0Au3bmCo3qy3vgTD
	V4aRyy5iVb7SodDLRcA+TzWpI0nVODXviPCYN8M/AZ3aPYaq35gtsrcPiKXTZBlJwiIQ5ypPG/VME
	kQdN5oIqwi2SK+R8DUF1SgRgfWMlZKuimcwiJTNbd/KUvIwIOtYtrK6zLrlpRQ6xc2HgqJvxU0EFl
	YvbM9dpg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thQPn-0000000FTCe-16Mo;
	Mon, 10 Feb 2025 09:49:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 401B1300318; Mon, 10 Feb 2025 10:49:18 +0100 (CET)
Date: Mon, 10 Feb 2025 10:49:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 00/26] Resilient Queued Spin Lock
Message-ID: <20250210094918.GF10324@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
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

On Thu, Feb 06, 2025 at 02:54:08AM -0800, Kumar Kartikeya Dwivedi wrote:
> Changelog:
> ----------
> v1 -> v2
> v1: https://lore.kernel.org/bpf/20250107140004.2732830-1-memxor@gmail.com
> 
>  * Address nits from Waiman and Peter
>  * Fix arm64 WFE bug pointed out by Peter.

What's the state of that smp_cond_relaxed_timeout() patch-set? That
still seems like what you're needing, right?

