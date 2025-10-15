Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EFBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYL4iRxEY31+EQH1oeBn0jMmXrAMDy8j6Ipi15NS1KI=; b=PzKaGm/IXmU4aTRaCVucBOMgEx
	ZXQnFtwbVpay1JGABqn3nZG6HdJAxwSTjpZqofHRUIZMnhzVN314a9rTOdPLFF5R3NiwN5Zs+M4DJ
	RBSLoZe4L2BKVdF7sDxMourey9kiEf+WE+wmKeEh1rc6lQrCMi28YIAMEHuiBKqwgRpgUZ96WuPYA
	BLchMHajYsGnP9uyAyijDIsHCSiltxjwPpjaW422tEtzIXRM4O/uNDs9oLMRP/wfrfqPEQ1eL2Gy7
	WkkBSmU6PvuZUqbb2IykM7GBjtcEaQ6tpHsQi+N0Z2/A8ZN5pKhZWQ/S3O9rdb5gcQrGWg1OfgXuZ
	0IXF/mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zHa-00000001M8g-3RFQ;
	Wed, 15 Oct 2025 11:03:02 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zHX-00000001M7y-3Npe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:03:01 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 031791D00178;
	Wed, 15 Oct 2025 07:02:57 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 07:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760526177;
	 x=1760612577; bh=WYL4iRxEY31+EQH1oeBn0jMmXrAMDy8j6Ipi15NS1KI=; b=
	c5QsqvvQyecOfcpgFHu4rj0Cvuc80k6VM9HOFFHEv/sN/SKBthUgEVpAYknb23wO
	oksVbw09SUGZPUHcBKaL19EBD+k5625X001tDy+DSnk8CsyIH+01wHXf+DnhrBA1
	9uMHv1z26ZSg5TWyb/a+Qtb5Vo1aAUBYF1gPtNeTYCVjIGW/Ob1Qaqw2z0M+L2LQ
	axW6JQOVzvphO1QstNfrQmI3/dRG9GNO1ST+yY6LAkqaZ/bSORJaEXCObzjRSsmR
	xbk910OHijdx0zC5Q2Iroylmdo5tdo3CwubO0NBLekbHiV6WCmMabo+QjzqFEPCm
	TBvRMBWyr0mEjWyLWQBOKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760526177; x=
	1760612577; bh=WYL4iRxEY31+EQH1oeBn0jMmXrAMDy8j6Ipi15NS1KI=; b=S
	Hn6PJA+sQ3DcvL77n3+p40d9VJjl1m4zzKSCSito80rR7UODDt0YAT/GInafX9fl
	I35yH+pF02dn7xcJwFkl3aWv2HdF7qTEC9GY0CpevtKy/+MxJrymZ5/U8AvVnEaT
	oFOpAXtjnGxNdQ3qnMotXaZ+kk9aN3dIlhnsJEVTi27etAdjH3PX3i6fwlMuv/aj
	bjBp8alCH37qjK5e8I+o5dH/XzYS89PrWRJeoBeSr2K4D7U9s0DTtx2SbWm/YwtW
	xKO/P5EwAcNJUGDAlFSGL8KHuFoe0a57VKHj2BHpwmW1olRaM3xS4WUpCuuz+1g7
	GUsledp5QtdqpyHviBA1w==
X-ME-Sender: <xms:YH_vaBjPA6N7lc-Khd3Wkow5fXfj63GBUmdaYpjA5UJVMSbjP374Dw>
    <xme:YH_vaA2RXWpX6mhQcwXIZ58C9b00yY1EihKGdm427q4TOucwuiV1qM6Fz3MQrpTPa
    tctuhWhIOyjul7XgycZnxIj0NS1vpPOgpGqcC7Sn_Y5jdB5EqvrpTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehmrghrvghkrdhvrghsuhhtsehmrghilhgsohigrdhorhhgpdhrtghpthhtoheplh
    hirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehkuhhnihhn
    ohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:YH_vaPkHbtNJUovNmDjnn6UPeP7y3P-Q5U1hqdzGL4ronqypTbkBRg>
    <xmx:YH_vaB4W-LaJS2_mcwydVuYjhtEb_hTK_YefzKVA1NFeidahku9fYg>
    <xmx:YH_vaL0ctcZY5VkDBcIy0QxO-T9ASaNotXVi0dIGBkdsYOZDqqY28g>
    <xmx:YH_vaEEoFCwdLSVOI675GG9GQ37Ll6ZHjGnvZ1-V5Bbk-91Qf1df2g>
    <xmx:YX_vaD7-POdhecdwhtQmhfYe-Mky2A1CCjSdc9dmlBZkQ_Ka-NWDgKpt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 50A2D700054; Wed, 15 Oct 2025 07:02:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AZW5Y86ioerw
Date: Wed, 15 Oct 2025 13:02:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 "Marek Vasut" <marek.vasut@mailbox.org>
Message-Id: <b3b13e21-ae54-4499-a569-0442bb9cfc8f@app.fastmail.com>
In-Reply-To: <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com>
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
 <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
 <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
 <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_040300_425525_119ED67C 
X-CRM114-Status: GOOD (  14.66  )
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

On Wed, Oct 15, 2025, at 12:07, Geert Uytterhoeven wrote:
> On Tue, 14 Oct 2025 at 18:53, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:

>> It is odd that this only shows up in certain cases though.  Is there a
>> particular config option that is needed to cause the size to grow beyond
>> 1024?
>
> And of course there is: I still had a few 64-bit .configs that were
> derived from older 32-bit .configs, and thus still had
> CONFIG_FRAME_WARN=1024 :-(
> Changing them to match the recommended default fixed the issue:
>
>     config FRAME_WARN
>             int "Warn for stack frames larger than"
>             ...
>             default 1024 if !64BIT
>             default 2048 if 64BIT
>
> Sorry for the noise...

I have a series that reduces the default warning limit for 64-bit,
but adds some slack for certain options such as KASAN that
are known to cause larger stacks throughout.

MIPS does have larger stack usage than most other architectures
here, and I do account for that with an architecture specific
base value as well, but in order to catch actual bugs in newly
written code, this has to be as small as possible.

What is the stack usage you observe in your configuration?

      Arnd

