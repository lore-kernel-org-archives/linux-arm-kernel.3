Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A58CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B1xp+SmLXggwATnlZ56FNZ4Kfou721p8uoDtFoWNy4=; b=J8CuUxod4FHf9Nc4YDQX3pGX17
	0/28HsDvmVxiyqV7sORrrMiHTIJSKAz9sbD6AhxM2k1gFsI4zGe4OeXhUPNfWG2MtxoVcK47l5LwD
	+cmOOp3TD/MAyWN/B94sFdH6XUA0STz7uED4Lcc6RDkhg6r6YgNQ+IjY4ZE5njKZGTSAA01Y14Ign
	8Ov8IW2HReErgeyfZyJ+K8K/xyGVgdxxiAP1DFWblZ17tFA0Ek33kj8BFcuc7CUR/iBiQAeSmgwid
	iBbp04ldHBImXdM+98TY+CWFEDrjWd4LBHh3KXrnvC60wFmt9VizD/oTckp926gbZhRQMv0hfd1Pz
	eEmDeXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFfoL-00000008qfF-2wzR;
	Sun, 02 Nov 2025 21:40:29 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFfoI-00000008qer-20i6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 21:40:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 738127A0158;
	Sun,  2 Nov 2025 16:40:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sun, 02 Nov 2025 16:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762119621;
	 x=1762206021; bh=8B1xp+SmLXggwATnlZ56FNZ4Kfou721p8uoDtFoWNy4=; b=
	RV7uRs3vimLSXn6Afc+9B4lLmPGColOELBjahtzeRc3gOVIkP88nxF2/LuBNCzU9
	xz7MXGS0YsfdTM33xxL5jV4r12BYm816kL1YTVASb3eT46kalb7VRw+eVFHzGG9D
	wlhIQuLWTdzHbYZNxz5zcC4pj6ym+Vt/v5rdm+MCoVgg1CUFbOo6gJH+XlsBldN7
	fpEJWNmD4tcvNm0Kr/Wwh3dh0pzMwdSkLzYf+iQzyL1zVk2wOVXevEN4PlTijnNY
	FLRep8oOhdmJiWXaanIDfUhtB9hvMlqAyh8T3WZzto55tlIBve6vRM7HbuHrwzMJ
	m7Sk5PX35dEHojKA4syKwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762119621; x=
	1762206021; bh=8B1xp+SmLXggwATnlZ56FNZ4Kfou721p8uoDtFoWNy4=; b=u
	tcngmW8NumqKEtJZRC61dRQcY5oRVtSYld384hctmb6co+AFxgEQknIMtfXquK+b
	BE4yTtO/aTGUR4i43NyQavxqLW07MBGoFZJ5CjzlSecSDabw4+DxsU7nis7PTNBU
	4/TcaafzIz1rSvSUtcxxYHOqe02HsBy1P1L3Klzv8rMEcI2ND5i43z+70dt/yR/+
	tyLgMnjqjDScBQc1lpViE2gIFzwIoTfT8bbyN0k0ADw07wDM/urcbGgnbkjWj+8Z
	1iKoipFDG20XY+wQdeyBr5fq7su0W3JF/EuZglh0M6UwOay3+3OptwqCZy6sJa5p
	KpF5SGCd0a/NM6vsvFr6Q==
X-ME-Sender: <xms:ws8HaRO3Z2R6gtrzw7TOb7KdjsMCj-JgEmab2t6605D0EhlP6Jdp0g>
    <xme:ws8HaezYtglLhvkuSO4TMO6GZ71_2ei-E_YHrNKdq8BPrFaGAn9xmTKkFMya1292K
    ANkeq0JPLlLkpeIMbS_E5XVGsxAPQvOW3QcjjtY-u8FGFcj5H_QKqhN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeifeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehhrghrihhsohhknhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehmrghr
    khdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopegtlhesghgvnhhtfihord
    horhhgpdhrtghpthhtohepmhgvmhigohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    iihhvghnghhlihhfvghnghdusehhuhgrfigvihdrtghomhdprhgtphhtthhopehpvghtvg
    hriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ws8HaRq9eQIUCLNoV0sLHNJIDsI3IIjDWFNun-OjdPISQPGYv9gxpA>
    <xmx:ws8HafOGxBOTYFM7_HNmx1Z0WD7tO-j-PZMunUB7QMP53mcHAcnJbw>
    <xmx:ws8HaeNj6uut1gZb-8vqDSEsN1HNSwIczXM446XhQ1wg7RrmJAM2QQ>
    <xmx:ws8HaR1tH_q1HG1L6VawcNcKP8QU9co3bJd7lDw4S6Fqbwa5idiMUQ>
    <xmx:xc8HaZntFxU_iduZUOwzYhm1s0mvM8DwXkvnjdVyDPtbtYFo7WSN8-PV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE582700063; Sun,  2 Nov 2025 16:40:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ab2ZwGVH8-qs
Date: Sun, 02 Nov 2025 22:39:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ankur Arora" <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Haris Okanovic" <harisokn@amazon.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, "Joao Martins" <joao.m.martins@oracle.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
Message-Id: <746c2de4-7613-4f13-911c-c2c4e071ed73@app.fastmail.com>
In-Reply-To: <aQEy6ObvE0s2Gfbg@arm.com>
References: <20251028053136.692462-1-ankur.a.arora@oracle.com>
 <20251028053136.692462-3-ankur.a.arora@oracle.com>
 <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
 <87qzumq51p.fsf@oracle.com> <aQEy6ObvE0s2Gfbg@arm.com>
Subject: Re: [RESEND PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_134027_047940_7DC1A71D 
X-CRM114-Status: GOOD (  24.08  )
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

On Tue, Oct 28, 2025, at 22:17, Catalin Marinas wrote:
> On Tue, Oct 28, 2025 at 11:01:22AM -0700, Ankur Arora wrote:
>> Arnd Bergmann <arnd@arndb.de> writes:
>> > On Tue, Oct 28, 2025, at 06:31, Ankur Arora wrote:
>> >> +
>> >
>> > Since the caller knows exactly how long it wants to wait for,
>> > we should be able to fit a 'wfet' based primitive in here and
>> > pass the timeout as another argument.
>>=20
>> Per se, I don't disagree with this when it comes to WFET.
>>=20
>> Handling a timeout, however, is messier when we use other mechanisms.
>>=20
>> Some problems that came up in my earlier discussions with Catalin:
>>=20
>>   - when using WFE, we also need some notion of slack
>>     - and if a caller specifies only a small or no slack, then we need
>>       to combine WFE+cpu_relax()

I don't see the difference to what you have: with the event stream,
you implicitly define a slack to be the programmed event stream rate
of ~100=C2=B5s.


I'm not asking for anything better in this case, only for machines
with WFET but no event stream to also avoid the spin loop.

>>   - for platforms that only use a polling primitive, we want to check
>>     the clock only intermittently for power reasons.

Right, I missed that bit.

>>     Now, this could be done with an architecture specific spin-count.
>>     However, if the caller specifies a small slack, then we might need
>>     to we check the clock more often as we get closer to the deadline=
 etc.

Again, I think this is solved by defining the slack as architecture
specific as well rather than an explicit argument, which is essentially
what we already have.
=20
>> A smaller problem was that different users want different clocks and =
so
>> folding the timeout in a 'timeout_cond_expr' lets us do away with the
>> interface having to handle any of that.
>>
>> I had earlier versions [v2] [v3] which had rather elaborate policies =
for
>> handling timeout, slack etc. But, given that the current users of the
>> interface don't actually care about precision, all of that seemed
>> a little overengineered.
>
> Indeed, we've been through all these options and without a concrete us=
er
> that needs a more precise timeout, we decided it's not worth it. It ca=
n,
> however, be improved later if such users appear.

The main worry I have is that we get too many users of cpu_poll_relax()
hardcoding the use of the event stream without a timeout argument, it
becomes too hard to change later without introducing regressions
from the behavior change.

As far as I can tell, the only place that currently uses the
event stream on a functional level is the delay() loop, and that
has a working wfet based version.

     Arnd

