Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73046CF6BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FoRkeDHF5yoSsn09BRVFk/fdmiabmgZC1/0wAMN4j8=; b=xOSLB3lyaB8jhVN9mO6oCTmmuI
	9PgFTMblyz863zgAqpnSGj0ETQe9dfIrRcEGubNWCLASNLdapT2elQbM94uH6RGX/DMSGVLqBGXNY
	p+th2QNwHJCe4QiyL8FhS3oLMbdqn9lFSP/fu0AMfRAntkofBw30iYoJOZLSpN+BD0Zn4xRMvor06
	PJ6ITPQyQirIHNsUoAExh9bbVUjZdecHdJmHDBDtam30uYofZF53EBrJP72xPTPHXXXBCE9jzGWs7
	iZbVpF2DTMgwxlCa762+0oToLFBqrA1NyeccxP4lW7GqZWPfSqOyNC+HgRXQK0Nxxx5oqqlj6bDDt
	iEmYYW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdICT-0000000E0LI-3ZHu;
	Wed, 07 Jan 2026 01:19:01 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdICR-0000000E0Kw-0Cem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 01:19:00 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8b2ec756de0so160673685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 17:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767748737; x=1768353537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FoRkeDHF5yoSsn09BRVFk/fdmiabmgZC1/0wAMN4j8=;
        b=XhBq5wvUNCYZk83j3Unstd54ZgEjSrEqR/vtO4VtYjuP75d95Csi0H3bOHhhKBggq6
         bh50/Qhtwt8krI9bVLD2icqdv4LQbPcaDmdVYuygt5eP4bx1LQZIrHq9KmcEwUF7FUew
         Y70MveU5honaUDwyhUmu9KJPIONivCb8opyktCP+UxcKff1gOOV+Vw2L8ywZCUHtIOze
         v7JcdK+5O4yFSbIzEtYJXJ6nShtMh0S+Pc1ld+hA9vG5S8i1sIFoIgmUbgKnMziF5xZH
         TsblcKZGWKdte4uKK41HPCgMW+d4uhyC+Fi5U4c28D9XocGiqr9Wm2bjXbrPMrJqRuIf
         InwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767748737; x=1768353537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FoRkeDHF5yoSsn09BRVFk/fdmiabmgZC1/0wAMN4j8=;
        b=DQTKHX9YKIixdfzzEAFrD132X2ONaMNMfwJE5vf/4BB2PN2fRyZ0yFtmImRCt2Etw4
         ievZS1H045XJaCrl8S7cuwsKdmdTL/BsvJmXOotr5elGudE+xuRn+U93tQBGfnFseJ3l
         FeU03ehm5ryvm4OK0lFSm2RLIm/nu+PuLX/rcdxdTeDhHPSQurUza25O03aVJdAxg/4F
         DifMcSAIW4SWEVbNKf1FItqW2iIrbPMPkj3M2GMD2mV+jJB6MnAbFUqzEOMHRsTqnmr3
         0oouvH9LcOpb4Psw5BgLNlZxmchAM2WYHoMgwa5YqcgiVKg0r4WrSBNLYoHTv9MBUOCL
         7dcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLumQrG2cu1nHpU8SbneRq3kpHdaxk1q4PsJouKKGnJo7I2iIkUoEqztFzV4UlA4D+wNhemIG0OpuCipKmg0aJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzV5KFU31Y8HizeciQKcbsQhSJP5NznSH597O7YD53/j5orf11o
	gmWuj16VlyY3b1HMaxFgY5Xfd0it1yDaB31D/PFI5PkqPUttum+V+42p
X-Gm-Gg: AY/fxX6YxdJF2luK+hC1pmKfxUM265/awpqBq1QCKiyY6KibsMmt1XtB0pvmTIANwXj
	YvuOF6fimnaFHO4K1JUvZFZ+U9Ut8kP7VOgnAxt+W6IgoWfO0tsCjwU16qiO2mxLLqN8wsZXU3k
	Y059DjyoRtDAnFFWPuksYzPSqjB8ozfHpFj7BjhwqDY2E2H31NUtITYSMFQ27Xogtk3XGk8kJCM
	dJhCLt9K1/jzEQz/oTGq271iprUJDAMmwG1vpP4jT2OVe3pD1dFg+vkj8TRFUB17ACtrEKmUguw
	wFJUuCEwgM+Ojh2HQAbZjsI1I687oeIxTMvYIV2N93OXdBBDejHuTqsCpC+bLG+ixISSAqmUdZ4
	94S7htaAUHOxIApwhlPlJskkiLREov2TruG7Ew2IuiI3hMt8dJkAy4IwNsTyVfDGrgQg3ZbFbyo
	7kc30kjdrK+Zk4clQlealE+d6RWXguYjbTLhWlYnHaa+yo76xqDGNzuu0ycA0Hak5ANjs1vbFPd
	rRZN+n+GW1S37g=
X-Google-Smtp-Source: AGHT+IFypmDgkHig19yVDiKuuUnEQYc/zF0z8166O/+XxI2JReUaqgJQqu7rh5QVdnDjZBol/ryuNw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr104779485a.87.1767748737114;
        Tue, 06 Jan 2026 17:18:57 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a794bsm282570585a.9.2026.01.06.17.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 17:18:56 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1C8CDF4006A;
	Tue,  6 Jan 2026 20:18:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 Jan 2026 20:18:56 -0500
X-ME-Sender: <xms:gLRdaY-yjhbzv4p2fZMRj6erfzZOY68KWppOaI6UeJGOh3-UH5E7hQ>
    <xme:gLRdaQrCY2wrMERsU2JznKHNlX-9KKP-0kOEck9XsTxLmoYZjcKnrs5Ac4f7YwNOY
    mMwvrsU00wXUHE08TVUcHAipkB4fiEUh6U3D7PUZGmXfz742i_Y_A>
X-ME-Received: <xmr:gLRdaZm4B2Ro7V8aBF_MvptT5t8wujf85ERgDstIsRIwOFbidl-JSxRK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddujeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphht
    thhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshho
    nheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrd
    gtohhm
X-ME-Proxy: <xmx:gLRdadZj977ZiEnz2Kf_LmogUwCOvPRUpQILeyFM4DSWqHgcYwphnQ>
    <xmx:gLRdaWtqSc1QT6voJxAydCjIsF9vAj7osKx1o4OKibHaQXSg77aXPg>
    <xmx:gLRdaerOVV9-qaJ-sjqAUOK2pjk5RG7CKOqJ-JRJs_pDvqRtpP-D6g>
    <xmx:gLRdaYlrVNTIVHAW2Sr95-1vVTxcrEy0PMiHIHPyw3Jy0l_NtPRupA>
    <xmx:gLRdaWT8a84q9OfI6IMFkdffJAs2-WgcqdgDLHDDZxJZH6uUKmY8e-mH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 20:18:55 -0500 (EST)
Date: Wed, 7 Jan 2026 09:18:53 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com,
	will@kernel.org, peterz@infradead.org, richard.henderson@linaro.org,
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com,
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com,
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV20fQSjMN1n6rrs@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106152300.7fec3847.gary@garyguo.net>
 <aV1XxWbXwkdM_AdA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV1XxWbXwkdM_AdA@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_171859_117075_331A76F8 
X-CRM114-Status: GOOD (  22.93  )
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

On Tue, Jan 06, 2026 at 06:43:17PM +0000, Alice Ryhl wrote:
> On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> > On Tue, 06 Jan 2026 13:37:34 +0100
> > Andreas Hindborg <a.hindborg@kernel.org> wrote:
> > 
> > > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> > > >
> > > > Sorry, of course this should be:
> > > >
> > > > +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> > > > +{
> > > > +	return hrtimer_get_expires(timer);
> > > > +}
> > > >  
> > > 
> > > This is a potentially racy read. As far as I recall, we determined that
> > > using read_once is the proper way to handle the situation.
> > > 
> > > I do not think it makes a difference that the read is done by C code.
> > 
> > If that's the case I think the C code should be fixed by inserting the
> > READ_ONCE?
> 
> I maintain my position that if this is what you recommend C code does,
> it's confusing to not make the same recommendation for Rust abstractions
> to the same thing.

The problem here is that C code should use atomic operation here, and
it can be done via READ_ONCE() in C, and in Rust, it should be done by
Atomic::from_ptr().load().

The recommendation is not "using READ_ONCE()" for C, it should be "using
reads that are atomic here", and that's why introducing READ_ONCE() in
Rust is a bad idea, because what we need here is an atomic operation not
a "magical thing that C relies on so we are fine".

> 
> After all, nothing is stopping you from calling atomic_read() in C too.
> 

Actually using atomic_read() in C should also work, it'll be technically
correct as well.

Regards,
Boqun

> Alice

