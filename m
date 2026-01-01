Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C6EEB573
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 01:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrjRP9q8c0tglfIoe+XxWLIY8X9nzFBO0FXW5gpQW5g=; b=UGqmE1ufrJ6j6i3P+XPkCyHAxj
	lSmjtKSLCWemgw32k29h2YDk7CsARLSq4wsTR06e8iZuIFpkjYFEPTDxUzgZwNN9MkOzNtiaU3DAC
	GfCkB+/nETsNQFF0aLsfayZqqgKDJ/Z6willwe6c/hGU8PZVRYlQLW4Nv+tTdbGhXVTBE9OdNirGM
	+iz/HGSBYPrys3zHPf7qFNfOGQds/HfoQkiDMfO9Y2qgM3/1MY9POFGa0ok0ZPxItF5OsArSLak53
	HIAqONs83ppY0f2rUNNjIsUfDeo74vQGbUavXKAPEbwk9BDinke/AE8989VYqs2cMgpSE4/OzEVeP
	2Fj/IDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb7G6-00000006UQ0-3wHi;
	Thu, 01 Jan 2026 01:13:46 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb7G3-00000006UPc-3XXW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 01:13:45 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee158187aaso123504901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767230022; x=1767834822; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrjRP9q8c0tglfIoe+XxWLIY8X9nzFBO0FXW5gpQW5g=;
        b=UQ7GJFd/GQC8HUs4XauooOL08LcQTx+66c1W6HVjGSfsp8hqVeBUcFp+bUGd0yQ7P8
         hdTlzydyceXBbA0yBq1q3ach5zmDsVvhFZjt/qM0iOtZht++/cr2V82cxbTX68PmXzBL
         URw7D/JcjgHbrjJ+Hpp+s8FuYOyBnHCBLu1m3hBTGz2ujoeBjR/vcvJVu9YwZZDsTVl4
         PRuzYp1QlekNKqUb6mOfbudVHMAMF/vH/n94E/dJ2TiWxfiksLuOaxIPPczNb2wvvFv1
         QouScPvc9FRXn1I+Q7ur9ILs5VEar3GpPv8nL9m/PlkiUmyM1oBw6swCq+vQRTCUKxE8
         Tshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767230022; x=1767834822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrjRP9q8c0tglfIoe+XxWLIY8X9nzFBO0FXW5gpQW5g=;
        b=qz5zNIw5rDvWoYWhqip2cm2V0BU4vVkbYZ7Wj/jRwL3o1VBSaMTV1qU+NCqLy9M+Kw
         jkArmaDHMo7agZMxZua/sWsoeC4nbxFu4XBP+c9ouCxZydSacwATgp35R1tnGUsa6dJL
         ie5ejmIEFqQtzgo1E/886ceBceAhC5g5CLQCwdflNQWAqNFi5cwjSaDQ3xDID8sc8v/n
         MF3VyaskGbiUQLTVl/se2X44wJk/9q8SV0pi3ygs4+tsqPaQN7JeqDWcfgCfV3jP3Uhy
         1F/XNOsXIWV6yQWu7z8QbELGwFbNVQQOUHn2jataEqN9qqlSNVlSDtJT4LKCQZrJP0xU
         DGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQsRLnQVKEPLadZC43li0hPlBYRr/D1jdbMNkgaUKPy22pBp16xU7a25g/ltSVHfjMftPBBCfERBmQYf6Y5Z+2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0pX6ONL/tkDIu9CXcMEvi0R9cLEmFf3DSF+9pspQ3f+WW7JBh
	lEo48+cxzVZfsynJ3RkHMK8SSkQGfYFvwo8ZAParNmZ6N2gG5x7ilm5U
X-Gm-Gg: AY/fxX5lOCr6c4AFdx73oasXsOwSLLs+XBqbNOnnXbwaKl08SIGEnjtnJwun+jyGemr
	b9ekrokS9apiOn4ae6BiutUSrhwqVCA1Zx4YlP3TjAYt6wGHrGZ6TNt8bAjVtDADS0hZ1r7dZZ0
	X8bxD0MCwpGyJw1680fPyaJtm9NTCshQ3onyh7cClzFcbBxynJ5RJ7w6KfWZV0tHyPxctDRaXxi
	wvSOETEQGGaK7ayu+5FJRmLcbj6qoy+id/Y/Fz2JluN/5f3UcHi5jS2IQcakci79xgeiDB+tACM
	lKWc4KQ+ISnuCHJFp6ohoPktl7rEdI1WyELvGJ6sOeebtkwHa2am6/q760+gt9Nh4XmyrGiDRgG
	7MWt2TJ1/S9h1DyuyL8YHzfuID+BH+/zi2do6+4guYLA/a3pDe7w9m6B0kxIn8nwWRn1RklXbCm
	gTcGV6FropAAdj57w830elhIZU5Aib/HxTvNgP3BTjruXsuI5oANU6paXTWWLbYkNoO2V2xLE0F
	jTeS6FsfD29Rhk=
X-Google-Smtp-Source: AGHT+IGqbWQCQzh9nbyhwAaF7d7/2+0PkqXfRpFE3/XyT4YpnYVUp5bmjdZmquhjJvald9WQ52Pa+Q==
X-Received: by 2002:a05:622a:4295:b0:4ee:bff:7fbf with SMTP id d75a77b69052e-4f4abcf6ad2mr546707501cf.4.1767230022154;
        Wed, 31 Dec 2025 17:13:42 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm270256121cf.28.2025.12.31.17.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 17:13:41 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E4468F40068;
	Wed, 31 Dec 2025 20:13:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 31 Dec 2025 20:13:40 -0500
X-ME-Sender: <xms:RMpVadPHBw4HBWMphwZq1pgT5fJC3CPbmHQdu9lumn0k_7tYA_K5Zw>
    <xme:RMpVaebD7MRte1FUx824DzyNRDhFHHs5jKY1c49B8N_xNeevq0B9BQWiJqISO_B39
    gw_jYgNYPWjNbzD3VMqTucRL2adjXPXpe_QWRduAlkODRVoIHm-JQ>
X-ME-Received: <xmr:RMpVae68p8xT8IdkM28rMzPeCmKXgzEK_Fu8NZtRu9S-Y5HsM8UQOPoHTAc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekgeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeefvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgu
    rdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrghtthhsth
    ekkeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnmhgrghejsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomh
X-ME-Proxy: <xmx:RMpVaVBbBnEmsQiqDEJQI5Vp0m45h3JWVi6J1Pr1FKmD2fDWfoTQfQ>
    <xmx:RMpVad6o7wE9nCfGGPHsTn7JE1D5TdpllKBohOy44er65HeDGb9yTw>
    <xmx:RMpVacLbQ_HpVXpiYbyGWy8IQvxsGN4hN7_-_vbGrAjs-x6Qe3tfAw>
    <xmx:RMpVaZyYzNE9MuelcekvFHC5-yl3HGyzOTwnMf1gpdHCRpnXK7Rjsw>
    <xmx:RMpVaUG0QewaINsxwC5mQQPkaOvDexnwM1B5CSPYFOpTguWdmMUW_fdb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 20:13:39 -0500 (EST)
Date: Thu, 1 Jan 2026 09:13:35 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
Message-ID: <aVXKP8vQ6uAxtazT@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVXFk0L-FegoVJpC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_171343_904847_F8593529 
X-CRM114-Status: GOOD (  29.27  )
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

On Thu, Jan 01, 2026 at 12:53:39AM +0000, Alice Ryhl wrote:
> On Wed, Dec 31, 2025 at 03:12:16PM +0000, Gary Guo wrote:
> > On Wed, 31 Dec 2025 12:22:24 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > 
> > > There are currently a few places in the kernel where we use volatile
> > > reads when we really should be using `READ_ONCE`. To make it possible to
> > > replace these with proper `READ_ONCE` calls, introduce a Rust version of
> > > `READ_ONCE`.
> > > 
> > > A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
> > > that Rust is able to use conditional compilation to implement READ_ONCE
> > > in terms of either a volatile read, or by calling into a C helper
> > > function, depending on the architecture.
> > > 
> > > This series is intended to be merged through ATOMIC INFRASTRUCTURE.
> > 
> > Hi Alice,
> > 
> > I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
> > least not with their atomic semantics.
> > 
> > Both callsites that you have converted should be using
> > 
> > 	Atomic::from_ptr().load(Relaxed)
> > 
> > Please refer to the documentation of `Atomic` about this. Fujita has a
> > series that expand the type to u8/u16 if you need narrower accesses.
> 
> Why? If we say that we're using the LKMM, then it seems confusing to not
> have a READ_ONCE() for cases where we interact with C code, and that C
> code documents that READ_ONCE() should be used.
> 

The problem of READ_ONCE() and WRITE_ONCE() is that the semantics is
complicated. Sometimes they are used for atomicity, sometimes they are
used for preventing data race. So yes, we are using LKMM in Rust as
well, but whenever possible, we need to clarify the intentation of the
API, using Atomic::from_ptr().load(Relaxed) helps on that front.

IMO, READ_ONCE()/WRITE_ONCE() is like a "band aid" solution to a few
problems, having it would prevent us from developing a more clear view
for concurrent programming.

Regards,
Boqun

> Alice

