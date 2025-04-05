Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD09C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 02:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhuOOLdy9BplIOjwl5SEjiFDq9KRcuImi5tiBulKOHg=; b=Gq3RFjKDMduDJPgeGkH4dZItAn
	ZOQMKy9Snai25JH9n0a9orJHjNLbrf7SsjIn29WnqKkw20X+0xF4wFz8s443dwDiKpZN/NYwT5Tsq
	UrP/xfhMbqTmMhCDizsst0eBFoD+vukBzapTRvgPQxeBnbCZDOI9pvccUxeT6kUeZ1orfCU9DgcS6
	MDIXwPzn/je6EFQ9LNj4Y57EeeGfnTWVOwztMsa2n8FbkyxXzWTA5YaSUsrvJSHZZl7908mWMB1nf
	pnhA+Q18vKAWpd0jMeIciwPCcC2tE4fyLfCpfAYWdrGLN7Zu16OriTSop73We5idUBqfm/FDmgo9E
	kJqbB7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0teL-0000000DN2p-1EES;
	Sat, 05 Apr 2025 02:52:49 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0tcb-0000000DMtW-2P2A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 02:51:02 +0000
Date: Fri, 4 Apr 2025 19:50:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743821457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhuOOLdy9BplIOjwl5SEjiFDq9KRcuImi5tiBulKOHg=;
	b=wuZTNv4A8KHVliI7RVi1iq+KyXkkEpVXmobDwuSfJ9jC8v/d5c4jG9aKVyhGLgutSACa+p
	b7yQoi8ZZUiOQIdBt+InpQt4A/6qxUhExtd68Vqs6sb3UFkP45CYt9Is6Pyf9vvaO4updu
	JiTYbbTedWepNbQD4ccJn7P+3rF9OrE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mingwei Zhang <mizhang@google.com>
Cc: Raghavendra Rao Ananta <rananta@google.com>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Oliver Upton <oupton@google.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: arm64: Explicitly set the page
 attrs to Inner-Shareable
Message-ID: <Z_CaiKsi42ho8DoK@linux.dev>
References: <20250405001042.1470552-1-rananta@google.com>
 <20250405001042.1470552-3-rananta@google.com>
 <CAL715WKaAHSgUhtMMT3Ztw90mMoHpVLdKUgVM15xx6yoUws9+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL715WKaAHSgUhtMMT3Ztw90mMoHpVLdKUgVM15xx6yoUws9+Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_195101_760532_A8AA0AF5 
X-CRM114-Status: GOOD (  26.72  )
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

On Fri, Apr 04, 2025 at 05:31:49PM -0700, Mingwei Zhang wrote:
> On Fri, Apr 4, 2025 at 5:10 PM Raghavendra Rao Ananta
> <rananta@google.com> wrote:
> >
> > Atomic instructions such as 'ldset' over (global) variables in the guest
> > is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> > DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
> > was particularly apparent on Neoverse-N3.
> >
> > According to ARM ARM DDI0487L.a B2.2.6 (Possible implementation
> > restrictions on using atomic instructions), atomic instructions are
> > architecturally guaranteed for Inner Shareable and Outer Shareable
> > attributes. For Non-Shareable attribute, the atomic instructions are
> > not atomic and issuing such an instruction can lead to the FSC
> > mentioned in this case (among other things).
> >
> > Moreover, according to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte
> > load/store), it is implementation defined that a data abort with the
> > mentioned FSC is reported for the first stage of translation that
> > provides an inappropriate memory type. It's likely that Neoverse-N3
> > chose to implement these two and why we see an FSC of 0x35 in EL1 upon
> > executing atomic instructions.

Ok, can we please drop this second reference?

This is talking about something else (FEAT_LS64) that happens to share
the same FSC as an unsupported atomic instruction. I mentioned this to
you internally as an illustration of how different implementations may
behave when determining if the attributes support a particular access,
but it isn't actually relevant to this change.

> nit: It's likely that Neoverse-N3 chose to implement this option (the
> first option) instead of reporting at the final enabled stage of
> translation

I would much rather we rely on the language that describes what the
architecture guarantees rather than speculate as to how Neoverse-N3
behaves.

Mentioning that the breakage was observed on Neoverse-N3 is still useful
to add to the changelog.

> I have minor question here: The DDI0487L C3.2.6 (Single-copy atomic
> 64-byte load/store) mentioned
> 
> """
> When the instructions access a memory type that is not one of the
> following, a data abort for unsupported Exclusive or atomic access is
> generated:
> 
> • Normal Inner Non-cacheable, Outer Non-cacheable.
> """
> 
> So, the above is the "Normal Inner Non-cacheable", but in our case we
> have "Normal and non-shareable" in stage-1 mapping, right? I know it
> is very close, but it seems the situation is still only "one bit" away
> in my understanding...

This citation relates to FEAT_LS64. If you look at B2.2.6 instead, it
reads:

"""
The memory types for which it is architecturally guaranteed that the
atomic instructions will be atomic are:

 - Inner Shareable, Inner Write-Back, Outer Write-Back Normal memory
   with Read allocation hints and Write allocation hints and not
   transient.

 - Outer Shareable, Inner Write-Back, Outer Write-Back Normal memory
   with Read allocation hints and Write allocation hints and not
   transient.
"""

and

"""
If the atomic insturctions are not atomic in regard to other agents that
access memory, then performing an atomic instruction to such a location
can have one or more of the following effects:

[...]

 - The instruction generates an IMPLEMENTATION DEFINED fault reported
   using the Data Abort Fault status code of ESR_ELx.DFSC = 110101
"""

The memory type used by KVM selftests is *Non-Shareable*, which is not
one of the memory types guaranteed by the architecture to work.

Thanks,
Oliver

