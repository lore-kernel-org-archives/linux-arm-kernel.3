Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A5CDC19B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpzahlfiGpAFEOQGjh5jjjaXUgZ9jhcXoloaQUEBJwU=; b=eNSFD+J4uPnHQ0RCVuFrv2xwLX
	Yp5VYXoJKLy/8zm+lfXHwq3D4GhLOangZg9AYHdQhF80VhaMHDv8F4rPrvfKYQOWbxWnprdr92/d6
	1N7lTxln93hir1c5/ZFJ+l2/rS2jSTPz5872xST2TEW0yUyL5CHF2uyCMrKQ11TyKBOVFlWne81Iy
	frjoA+vKvAz4vWCVe0dvMyOCXPmlXC48SOpc3+rukFsJfbj6ENH7zYLeYUxrgFVteKcKIdRpa5r7J
	S1ey/CC27YNLArw+P3nB7zVCAlNetrEwm4WMARg5JdxmSn3OVKY3O1Kl1FAgzaBLY9/A8SsDzBqsj
	oEwo2WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6ol-0000000D3nE-1LUl;
	Tue, 06 Jan 2026 13:09:47 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6oi-0000000D3lZ-1xam
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:09:46 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8bb6a27d3edso79323585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704983; x=1768309783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpzahlfiGpAFEOQGjh5jjjaXUgZ9jhcXoloaQUEBJwU=;
        b=NQyiMI+V9jGCEMuGeykDAFFrpcHv1XvaKyUfupVncHAxWwwt/t+GpUIXHDg19V5Xm/
         f2qomtc5a3Nhyfl7HWqFX2tei2uHvT2zDI5RS3xhOAl90PxV3Dl4WzIu9V95lnWKdJ/G
         AMhi9oPLoDmgZMQf5jdj2aj6azWLAz0YvkH0Hil2s+pU56TJ//FqT04bKthlirdXhsLW
         vW5TJ5vfowGVHOTt7ZIVCu1bsgU1NZrdUiQY0Z9VlGoxYnnkSSEQXmPxJgKizTWNzvOJ
         /tY0LanyXHcOcH+Kft+32uzQ+l/aQFls+5K6RCf0ZVNGgJmHWgQ6LnonPuBKXYUyf+ao
         cTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704983; x=1768309783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JpzahlfiGpAFEOQGjh5jjjaXUgZ9jhcXoloaQUEBJwU=;
        b=EAO87hQfFS6JKiH5y93MAdB7/ZwADVUx4ek7y+KSRvsdsxyZtTJtlupJekB3zFcPGS
         eklFzqU1Q6KdAJky7sQ7hff31c+VRwiB3ggiENNvRSHdWNMsxx2DrRVomZqmp+TAltgi
         ypoKUx80zD1PpsDSc4X8bs4MjLbSPA7sZYGhRUkk0o6UCVs81CgBmxXObpJWLiIwEyVt
         apdBLizjgi2gA/EUINRpTANoEskNiQa0DKUnWPSu1KHn1WHfpu3qX1xNv8dZFcil3OWf
         SgquxNt4LuFnAvpOrVAK9T3stQ+ow6EZvLFzyjSOpE9N7fs56VHpyZQrXIKj4J0j74lc
         i0zw==
X-Forwarded-Encrypted: i=1; AJvYcCVD40+4SUb0LY1IUzJVVlKrUe1n9atRafZH66fMlK6Z4bEcADVgRDpymjuyZSD0TPAoo6R9voEbDxV0BKA1zGFo@lists.infradead.org
X-Gm-Message-State: AOJu0YwaOFC+oSpbeP7cXVE72dpGcke9nRgvCkcBdwiMPExwky2WKWkW
	wvk1jYzx7Yy3AwkUAbwIHd2jVX+v1TBwZWRVNDXJcVX0OsXUrXPOCAke
X-Gm-Gg: AY/fxX4DygvF8CHuX5KjyYTOvz4ytmXzuqDGsC13wJHXoZQfs02EgKwZ014dXhlMV20
	RWt2LZdcNiSO2t9hQfV5ySLA1JxgKzs1Oodh709BsZG/M25uFOMmMZmuovR4IV+PrfFb7QOOc/x
	ycmR6ptT7iJs+Jqv6PZSntRJZMvOVZ/qBPeORdMXUmkGBytXpJ3acaKoyFn7GORzoKFYl8MTBgP
	Ca+k6AWQJHgnxNi5J9bWHpaAYYbDkCv23fnWmMaBwwAYfd77OJdTFbcmkgcBFsokFHRqOHOwNlE
	w2rhX8E1VNFRB1c3ZgDLiju2LeirjuYiLxotriCNmbWXQkuZ1rj0qD5F0ci6lZO8WTSmj72PgRK
	/hjCXZRY1xuMcKzciUuoN3Zt+/JVg2TcV3+xlPaujCcT9e1MqMtHcaKrtAKGVth8KIuxFvOqPC5
	jtfxUas8Wr7kQ9y86PGi2mGvfOEQfFk11II8bNZR4nBYSAIdaeg4Rjj5G7+wZu5cdJxf0hYgABO
	+QkEatI8kUdWKE=
X-Google-Smtp-Source: AGHT+IE/G8uVi22ATP3WXoVJPNVxriboWDTjcasbHlPDtJRw+IZ7O9Erdw+Esh+/t/URn4jtbR4Hhg==
X-Received: by 2002:a05:620a:708b:b0:8c2:2b5c:6bb3 with SMTP id af79cd13be357-8c37ec03772mr311728985a.85.1767704982941;
        Tue, 06 Jan 2026 05:09:42 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce659sm13118086d6.10.2026.01.06.05.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:09:42 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2639F4006A;
	Tue,  6 Jan 2026 08:09:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 06 Jan 2026 08:09:41 -0500
X-ME-Sender: <xms:lQldad4o6VabieTCt7VP58h0fxSMJlnDJTqq9xmv4gUsrGb-cUuIaw>
    <xme:lQldaW3w0iVE7aXBFYGf2kwkmwV7ZmcAciKP2d4j9qH8XOU2umqBPTN4JSUHhyLas
    MMcI5zPbhgT9iepLo_t-G6251LnGrpdPhJIjqxnQG4vnpq4XEYmtQ>
X-ME-Received: <xmr:lQldaXhp32blzk3e-OBl_fGY-rmkxQc2DpKO7gj9iS1ZTCXrKa1lzqId>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghr
    hihguhhordhnvghtpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghu
    lhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnug
    gvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrghtthhsthekkeesghhm
    rghilhdrtghomhdprhgtphhtthhopehlihhnmhgrghejsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:lQldaRhoUQCXatEp-h38AqvV77rEtxvLNRGsFs8u2ms1OXSWNmrpQA>
    <xmx:lQldaTL4wxZLBZcRJjEHFu3dFfuCMiPW4zPdLeIt9ZiOItPMMXuaFg>
    <xmx:lQldaRiB9oounBOronYP2u5oKk5izsY-IGiIW14zReJVSjSCA01RJg>
    <xmx:lQldaXQI6hAF-uCxxcjncArfbu2vke8bZCG4ZKq76q5AAcla84LNSA>
    <xmx:lQldaWaMzSdWWEga_pd7OPdzFUdDDo_J3WFoBuhK1tVbKT2LHOV3QlIj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 08:09:40 -0500 (EST)
Date: Tue, 6 Jan 2026 21:09:37 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Will Deacon <will@kernel.org>,	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,	Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <aV0JkZdrZn97-d7d@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
 <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local>
 <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_050944_520924_4880DED3 
X-CRM114-Status: GOOD (  29.47  )
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

On Tue, Jan 06, 2026 at 01:41:33PM +0100, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
[...]
> >> > I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
> >> > least not with their atomic semantics.
> >> >
> >> > Both callsites that you have converted should be using
> >> >
> >> > 	Atomic::from_ptr().load(Relaxed)
> >> >
> >> > Please refer to the documentation of `Atomic` about this. Fujita has a
> >> > series that expand the type to u8/u16 if you need narrower accesses.
> >>
> >> Why? If we say that we're using the LKMM, then it seems confusing to not
> >> have a READ_ONCE() for cases where we interact with C code, and that C
> >> code documents that READ_ONCE() should be used.
> >>
> >
> > The problem of READ_ONCE() and WRITE_ONCE() is that the semantics is
> > complicated. Sometimes they are used for atomicity, sometimes they are
> > used for preventing data race. So yes, we are using LKMM in Rust as
> > well, but whenever possible, we need to clarify the intentation of the
> > API, using Atomic::from_ptr().load(Relaxed) helps on that front.
> >
> > IMO, READ_ONCE()/WRITE_ONCE() is like a "band aid" solution to a few
> > problems, having it would prevent us from developing a more clear view
> > for concurrent programming.
> 
> What is the semantics of a non-atomic write in C code under lock racing
> with a READ_ONCE/atomic relaxed read in Rust? That is the hrtimer case.
> 

Some C code believes a plain write to a properly aligned location is
atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
it's recommended to assume such), and I guess that's the case for
hrtimer, if it's not much a trouble you can replace the plain write with
WRITE_ONCE() on C side ;-)

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
> 

