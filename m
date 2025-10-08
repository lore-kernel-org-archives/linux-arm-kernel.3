Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD63CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqm9uziGZRLVLkTR7mGhsq0j/8l9Hgkqke8/vTtrqvI=; b=sJTfQO9HouVBjWsyH993JfcOPp
	M7ZXwLqaYi/E2vYngkMtxZNVzG7Vacoh+MaT25mIIRXuvq4tgYEKBzxrvbdio9POZBx46FA9x5jHz
	RFUsJa1Pqkomz9TN3KX1uAL/uNQ5PuxmNye1y1rh8pmgxpbKvP2iJXhaKtt/+Qe0gHEy5BEFa+Mr3
	AIctR5kuPNecTXMlIFFGbHl/Ogk+MsmGVBPjRG5bH6Gu+efMvmD1p/28AFKOcYcd6hAZTawNmKB8B
	EJ/C4wcpl9g7U8kiiNNCbnG86bqagfAGuvCyvIJ+qKj+ALzi8vfjih/ahE02x4ofgj3FDk4HVqDet
	J6ca37nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SCl-00000003hkb-26uU;
	Wed, 08 Oct 2025 11:19:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SCi-00000003hkC-0Mzh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 11:19:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE0222FC;
	Wed,  8 Oct 2025 04:19:21 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF243F66E;
	Wed,  8 Oct 2025 04:19:27 -0700 (PDT)
Date: Wed, 8 Oct 2025 12:19:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Li Mengchen <mengchenli64@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kgdb: Ensure atomic single-step execution
Message-ID: <aOZIusaX-fpeLAz4@J2N7QTR9R3>
References: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
 <aNPiUbdRhaRklebF@J2N7QTR9R3>
 <CAEkTZs2x4RzUbYWXO=B1ZGtxycbryNT4YbROH2k_k+0L_B6Erg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEkTZs2x4RzUbYWXO=B1ZGtxycbryNT4YbROH2k_k+0L_B6Erg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_041932_172615_4DF70D67 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, Oct 08, 2025 at 09:01:22AM +0800, Li Mengchen wrote:
> I am writing to address a persistent issue in the community’s code
> related to single-step tracing, which has remained unresolved for over
> a decade. The code I have provided has been extensively tested and
> proven to work across multiple hardware platforms and kernel versions,
> from 3.10 to the latest releases. Its correctness and effectiveness
> are not up for debate.

There is no debate; it is a statement of fact that those changes are
incomplete (e.g. failing to address other asynchronous exceptions),
incorrect (e.g. erroneously *unmasking* interrupts in some cases), and
contain unjustified changes which are themselves incorrect (e.g. using
task_pt_regs(), which *never* contains kernel register state).

I appreciate that those changes may be sufficient in the scenarios that
you have tested, but as I have already commented (with examples), there
are real scenarios where those changes make matters worse.

I agree that there are some longstanding issues here, but (as-is) the
changes you have proposed are not a suitable solution.

Mark.

