Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071ECDC192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsT4usbspAuLjRoX9Zvkc98UvH2b0yQkPaftYv84D4o=; b=F3q2/xXIQhOUoKe1/cFPzN2/SC
	RzLwfm+4Zw0mg0IULS20hfek+0y0iqOmZJUMxenm3K5c/SxSmorBn/9xZ0Ezaz2ChNLAfxOViX10T
	yYymFol5G6NB0lMFPnS0eMRxNIU0PpbD3utlc2uOnsBkFAjJCyfchKXyrbUvjl8EyoW2UQTgH/iA1
	LJs/+OkrIPWeN4r5DhsYTltdq5eqC+kvhobSfrglV/TQOnhdg2GH8jTs5mNygD1f+5mZo4XgvVqR+
	0lVCzhMUcdC9Ax4Q7lB+xbk8C6DQqg7uPRv9E5w3quXVfbvYq+wr6CTBoKgr7iNHuW5OeAndoaK4L
	8Th2Ap4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6XW-0000000D1Sv-1izI;
	Tue, 06 Jan 2026 12:51:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6XT-0000000D1SY-1TFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:51:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47a83800743so15389155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767703913; x=1768308713; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsT4usbspAuLjRoX9Zvkc98UvH2b0yQkPaftYv84D4o=;
        b=11mMILqd3v1Fjl4EwUDpEu/k4necoJrgpSdJHBUlfmvDB7cTAXdW3p31Kf1yw7CB7o
         liRERkkOVHznxpftX2lFzd2ufFXyw71J0NrSoeTYZjI20frtezPXBZ2FWr7Qa9w13hM+
         NKrl43uQX5T7Emqs2ctpswUvlswUaa1YgnpRHEjKfsTsmzIF5Qe2dj3zsphbKKPOHdi6
         C5qq1o6zqMmKV/1w/oAFyruEFdKw6XVLEFNZWM3Xq1JKoN3hqiBhC0fHgCyTRCGoD94R
         mR7hvUQ5l+BvffrUOGBIF/1w/o5AiBqAUWKXOkVUkKEweViHILX9B0L/bt+KnefAas7y
         4e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703913; x=1768308713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsT4usbspAuLjRoX9Zvkc98UvH2b0yQkPaftYv84D4o=;
        b=QxVBAJRTc0nfdZGP8PQ3TCHVpszgAskuCIOsl0PclaMPfyrN54SY5NAEVt6ktqOT2h
         foa25ZM3iU2QJDiG1jUr0t2nEAen0nSSL7b+kt83ENFqszBaFzPZ9Xhcp+VjjR8rkArT
         aL34ahv0kSQRufePtYyH5fZOXuSXDzDncRYvg3zNDMuoZxeRJVRbqO7TvvOE1CRM4GfM
         PARYkqXkrY+G9I1/5rkzl9jMSafT3qcaAI483WMwJQeGg1gFsefVWEFjoYJNJqcOTJx5
         D7mhG5NvfxjRLG0EQGddrKgenkrW1sk8a3GuaebcYgak7yaR55GNkQcf2ooFZWbl1K/F
         pBeg==
X-Forwarded-Encrypted: i=1; AJvYcCWe51tGyFcWHCL6mk/AHc4JRZTwmCNCS3xBLJwB/8vS2wCUNVdrxZh0hh9ms+5fe4tS54tjG3vZhFDP+7t5Jx0+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+PM5iuKU6rWT/W0S4/pXGf7bod6uiOdhk88WQz30PB1NcsJet
	YqZ81ZmqLafrAY4wur0IomRg0mrDGyCmWx3drftus1PENaJ4racXaBU/JtVXWKpeAvuhoqwSOmt
	qg/YfPuHbWpent38C6A==
X-Google-Smtp-Source: AGHT+IG3HimmS8tgW4GY2wron0bO12GBXSVrxQ4BKNHos90Wwn9m7SbT5K/3H7Ao0w4qXUIF0pRAaTdapSCG7vU=
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:475:dadb:c8f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:81ca:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d7f41069bmr28735145e9.6.1767703913011;
 Tue, 06 Jan 2026 04:51:53 -0800 (PST)
Date: Tue, 6 Jan 2026 12:51:52 +0000
In-Reply-To: <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231-rwonce-v1-3-702a10b85278@google.com>
 <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
Message-ID: <aV0FaEjA7fe3NPAX@google.com>
Subject: Re: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_045155_408062_F88D4B45 
X-CRM114-Status: GOOD (  17.45  )
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

On Tue, Jan 06, 2026 at 01:43:26PM +0100, Peter Zijlstra wrote:
> On Wed, Dec 31, 2025 at 12:22:27PM +0000, Alice Ryhl wrote:
> > +/// Read an integer as a boolean once.
> > +///
> > +/// Returns `true` if the value behind the pointer is non-zero. Otherwise returns `false`.
> > +///
> > +/// # Safety
> > +///
> > +/// It must be safe to `READ_ONCE` the `ptr` with type `u8`.
> > +#[inline(always)]
> > +#[track_caller]
> > +unsafe fn read_once_bool(ptr: *const bool) -> bool {
> > +    // Implement `read_once_bool` in terms of `read_once_1`. The arch-specific logic is inside
> > +    // of `read_once_1`.
> > +    //
> > +    // SAFETY: It is safe to `READ_ONCE` the `ptr` with type `u8`.
> > +    let byte = unsafe { read_once_1(ptr.cast::<u8>()) };
> > +    byte != 0u8
> > +}
> 
> Does this hardcode that sizeof(_Bool) == 1? There are ABIs where this is
> not the case.

Hm, it hardcodes that the Rust type called bool is sizeof(_) == 1.
Presumably bindgen will not translate _Bool to bool when it appears in C
types on such platforms. But I don't really know - I have not looked
into this case.

Alice

