Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17046D2629F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SYWzQFciEmh1FoU8deqlPVu+NRiIm4WLmRuTDTk8Qc=; b=2QtDsp8ZHWy55XO1uV+F15uXZJ
	dFk+ZMeGCpEWLBSBki7+0rccXuKJjUV4wvQ0FGApkSAPBby11pytOIFkFuTn2GhKB4Y2IFSlpOwPh
	jQBnOuEuUBHfhIx2twhM/87vG/jXdSo4bAgZoCPMA6dd97l3aG74iPg8qTBDM7ftYgeYucIHQfaFM
	ON7cYJlAnwoCg47yGOR3YPKWbHHPLaFaV6WiEg5NG4LIMdPlo+JDmFUPVCt2X23ORDDS/TKCoxx+F
	pbOhGA1jqGrZAZhXKe2WKdE1idCNQW/v3QH/AIqjtvnqJSAHFmAHxo2/1rwn2KgUGGMZ7VRA4187C
	6Ig8B1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNyk-00000004n9I-1SS8;
	Wed, 21 Jan 2026 02:29:54 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNyi-00000004n8g-1iJf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:29:53 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5013c912f9fso69512701cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 18:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768962591; x=1769567391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SYWzQFciEmh1FoU8deqlPVu+NRiIm4WLmRuTDTk8Qc=;
        b=TBoDjYV7Vw15fKylYaSsiduTjfCnN/yS/sLQWLLaL6A9IkTBFpiKI/OLw1ttDxDxdQ
         wL90Jd+PjZ5WptCdAsGhkGiuku79t9lXfqpUexA7bD2B4e8upIkqNLyRXtkfGG59bvdt
         OnGMW363gmW0fkRjQFBzCjApmZutsD+QHB9kZ/p2xNcg3sipy7esmGYNxjeuW83/Wfxu
         fl2kuQOpJoEKLnqg+jX6dk1UXZlDifU0qq37lXp+3tyAyu38bW+s0qBcce5Xi/5eSlVa
         VDcxdQJGOmDzRtrF3xJGjsRGLBOm1lqh6cX1/lQeexqrhMFQkQZfV6Hndj7eunA5qbMC
         VD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768962591; x=1769567391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/SYWzQFciEmh1FoU8deqlPVu+NRiIm4WLmRuTDTk8Qc=;
        b=l1Ooeop8s1J0dvb0iUMzmhawEYtl0HY3ZxM2lBabf8Pglf6YOm52o41oGit0L+ckPN
         aaXcpcelV2qQzgXBR9+cgZJw8NhFKxSlgreU7M5VWOXiTWnZrDpEz/s614+yeIOzlzja
         TzN1C0xuXKGiwvNRucXPCt6VrkHr9T2maYEbxGTMlp9C+pEMmMkKKFiy3go3g/1U3I3N
         Lr5zG9y7edkvM32LNZJPMkrhTemfql6Q8rbXEbXv41bwYiMWUri26URqzCRcXxgHMCVq
         8Tr811jmTHVqPfGBI4ty+xgmA7FlwBAdn1OFQjHMnarh5PLbe4xY4dg49MFM/bhliZy1
         /PcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVtbHreKlT6G2Lc1c/KzkogJvdh6UJz3Nb978k0ZCInSIrmJmUoQpbE+q6i4g/L1Q+StdZuLkSmL9jgJQpXSj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy791UFxk/GKnrdJYfwXYEWHPGOTyf7DQ3bQ+VW8BkENWa+8100
	cxyivIbtAZ70gat5kWfUr61zFQWTL3tuNb+3UCCfP49Ea3luUqIccNEE01PemSZs
X-Gm-Gg: AZuq6aLNFaHA4gNevz//saVQwuseC/W7qHTprbcLJHkNsi5uYCZWFBGsnR8whpv7I+w
	bbmsALe28DDVHzYRl3lepLFnySefuxJHCfAKIUIcTxhv83u0ceB20+kvzX5IxQUniWKm9L+usyS
	CW1n8SkSzkC3QhdH1WtWXkf4unMQUZAHfzsGB5EHqzrEurcWDfS9BOFxFXuqWhAbcKwKV95qqXu
	485SKj0gNKFceWdaXWN3FdPl8EgJQnKtlAjs0QEts4BcOStrziUR6evBOCw+uA0P1V+Rl9hdF9l
	FJ5ydhS0K1ssbZGQv3N/Bjx82+o4QSdM/0iPFYMpY1qRLqobUmjjnAyKYnSBpjR9lbl+MLlwm3O
	yJGshEVDpQ/XKU+lb9m6t+Wr0ixB347GMuCYFln6ArsevHeVK0x1cAKAgbsgcC5AjnE1AasOtXf
	dH8CxBD4/Obxkng0r5cyJOGPQEqQeZXDd1xKt6NHcd/tW3cz6r1JrQkWPF8i/M391glqA0iypWh
	umf40DZDn9Rk3k=
X-Received: by 2002:ac8:5e11:0:b0:4f4:d298:b47c with SMTP id d75a77b69052e-502a1e07becmr238961631cf.28.1768956457813;
        Tue, 20 Jan 2026 16:47:37 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7269277sm1143950785a.43.2026.01.20.16.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 16:47:37 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A38FF40070;
	Tue, 20 Jan 2026 19:47:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 20 Jan 2026 19:47:35 -0500
X-ME-Sender: <xms:JyJwaYlxHCp2CJ9XJSkRGaNnnIfTr2CPMTk66aaLjJ8NL6geKbHEUw>
    <xme:JyJwaRhQ9tHsguPZdsm-gbfKNoOqdj5C8VQgEuisf9r5GzaMoP2vysuiFdK_z8pcP
    CA7y6EHL1cipec_t9rcLTiDCO2FTJ6nC5Bj3OiUnyymky8qMw>
X-ME-Received: <xmr:JyJwaV_rVlfR2KnChLT6z56C5W8d7hPExZS6zuXoB_umworfTbmKYIBO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedukeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifih
    hllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheplhhinhhmrghgjeesghhmrghilhdrtghomhdprhgtphhtthhopegtrghtrg
    hlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:JyJwacqvDrVFqbB_v4DJpp2xCk2xPwPBG4Rn1gtnHnXEeTrMnP9C3w>
    <xmx:JyJwabOpMOAo0DJprIqW5L36k5blht_hBf_QHlx2Zajjf827IyzHMQ>
    <xmx:JyJwaYS3LHXmxS1ssanGpUtdI6D3bsmNrDFB6F0TIJxUOa-6eu6UrQ>
    <xmx:JyJwaY8YbtMT8-V977xDI_zpwzJy6oddKb6ufhLgJ-XTerrF5SxqaQ>
    <xmx:JyJwacoE8g49BcHFirTruH_zNcwaBTLPwisaymIERtlin-fIU4ZLuRjF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 19:47:34 -0500 (EST)
Date: Wed, 21 Jan 2026 08:47:32 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
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
Subject: Re: [PATCH 5/5] rust: fs: use READ_ONCE instead of read_volatile
Message-ID: <aXAiJPPrlzNld3Mu@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-5-702a10b85278@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-rwonce-v1-5-702a10b85278@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_182952_464231_9C5006CD 
X-CRM114-Status: GOOD (  22.51  )
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

On Wed, Dec 31, 2025 at 12:22:29PM +0000, Alice Ryhl wrote:
> Using `READ_ONCE` is the correct way to read the `f_flags` field.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/fs/file.rs | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 23ee689bd2400565223181645157d832a836589f..6b07f08e7012f512e53743266096ce0076d29e1c 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -335,12 +335,8 @@ pub fn cred(&self) -> &Credential {
>      /// The flags are a combination of the constants in [`flags`].
>      #[inline]
>      pub fn flags(&self) -> u32 {
> -        // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -        //
> -        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
> -        //
> -        // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
> +        // SAFETY: The `f_flags` field of `struct file` is readable with `READ_ONCE`.
> +        unsafe { kernel::sync::READ_ONCE(&raw const (*self.as_ptr()).f_flags) }

Not a question directly to this patch, but for FS folks: I see we read
and write `f_flags` normally (i.e. without *_ONCE() or any atomic), and
I don't see any synchronization between these read and write (maybe I'm
missing something?), if read and write can happen at the same time, it's
data race. So I assume we must have some assumption on the atomicity of
these accesses to `f_flags`, could you may share or confirm this? Thanks

Regards,
Boqun

>      }
>  }
>  
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

