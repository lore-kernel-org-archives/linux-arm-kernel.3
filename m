Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB00CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=; b=2ouSDg/eQ5n3gV5qSSmhmT3vA2
	KE9KP32fJg5M/lQjZMIkmojk9aeoH9a4pzXQnHUiuLdEbJXa0kqFH66GzBGHmR1pih4oiZkVvqPWn
	3E4oL+ab3tEc1COAYSxGkCC6y+OKXNSFlhqFQuqQ8eHN2Tc88mRWcOrp+NQTmKQXqcPFaEqYr6bLo
	FXLiDAyg7vmxetiiTslPceEHZ6LRj7cOLmDJkL5AXlShi6Iiz1N0WLiP5BYTgPKccG3GG5e+dMD8h
	uWX01HE90Pk42u+bKmT0TZ9W/UwQbUwl7xfBh1VUHvJAJMjJiIT9viTOaZO5pPrSAh0qdxZYnk+4g
	H+dHfbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzEU-00000005ELi-1sCw;
	Fri, 09 Oct 2026 01:17:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzER-00000005ELK-2tB4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 01:17:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so25801965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 18:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508626; x=1792113426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=Rmp+cJTXD87FYmOHMKbAfHqCf6FkZaNwGBTMDKkXOZaTWPGzok+Bux6u2YSzi8jr8T
         TSSGeLbgvVgsNfyDDHcwDlOnHCixgvixxUEAfqeDX5jOj0rwX5+rL1dhz5bvZ/3EIGqa
         Gv8PpRRvIZEhlutBc75Nox2GzXpz+LBZeUZYLssuLqjdjVqLGvkmd4XDTn+AMOG/Afeq
         DtVqOfmPjj66LFDnM8ZD7NqzDF0t+IN1/1Xt88D4BmIyuLrrHP9W7MSYZK9INRgjff8q
         cuZGwWHbjbYyuJV0oIA+KNkwkYhLmayZai6nYukbNgHrZqVYaAL3tC6+hjUE/LSOqGHs
         KCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508626; x=1792113426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=C+rNt98xAllr449yXJ9+GsIK7bmyHtd0siCWtu5da5JY2h75aJhsq+IbnfmWLBALxT
         /2hbR2DTRUQGSxvnaE+uJ6oRDGA1bJN6DLAT9D1I/XF+cwnq9+ZVjBeun5lO0sZ3UMDM
         oirjVMHNCy9+1TJzyWvXVuBgvsPeg0pVhoKPaFynUKuVRyo70aRygb3SAZxn/AVOBBWq
         XUDJh7TtUeMLkJdnyoFsXda2ecGpzDy8cF+p0KSBxkbj+9uU7URjukwp5e59pgxKrNpp
         /ZhrlWnMWad0o/O1+HCz8QqflLp5dOhdkzBxfFwIQ7QauBDjgnxkyR0Qw5erXdvtXOXt
         o80w==
X-Forwarded-Encrypted: i=1; AKwUvByIpLtT0Y9Yxi8TrlBsdAlirxVg0GlTeO1GdQw6X8qU1bNyTaKgym4w09LgRuwpzOiHwj1AsiE0aPAPERgm9FPU@lists.infradead.org
X-Gm-Message-State: AFuF++kcCilNU1WVpp/M1wPlFvRcs9zAUtDZ1VMqTDeYXpw02NbTY4uW
	fUjS3aNXgVydiL9YbRTw9wDqw06GnMrsqhut+z0zeacOf0LZocAaw5ph
X-Gm-Gg: AYBFou2Vwm86mYPAjbJhCouOg5gGuM4f1KMJNRAUsfGSVSTsYTqZ3kmyCarY0cz7DNW
	40DK3T+3QROqbfRIYKmM+N/R7GE7ElpZwoCyGJncROguHrxPHSBXgGRTm+IUOZ/juNjyXLLzErF
	juF7wkaE9SFcAi9WfBj2XmPnTUV22yHrydMdIiRonn3ZU8m/ygtOJavBL2iTXQ646ItPkwyEl1O
	2C7jxi+z2HBzYto3n4Vx7Aif7UYG5Kx4D9YT8mENqL1AUACKM/l2grQ2rs7CBLoq9Bw9urjd7m6
	Ba8eSWcV4VYQAVOdc87el5mm5TLEsvfYfbA/H8FW8E6u/TRQP6duF5LiCb0KShWX8GVTnDJyIHl
	9MKmCnbLryakoCkV6Hl07CLoj6quymZOBqRoCojpyCqL3Z4zES7fX+hWZhdgyGLRCMIQIy1k6GW
	STHJAHKvTmflBsz9G6zovNV09jzGWgaTBy5wgENoJrDLykRUxCggg+kzu5oPXhfDumlsmwyLwrk
	irGbSGNxoJTlO3Dyh0wtHMLhsoS1ItK4wV/SEMZEF1mYQwVFOYM3Tm48T3Vf4Uli6oJOUhOP9n/
	BaGxEAr0PAEjvDkl8xeL4e+sRqVEQr8w+eRoEIAfXmqsMqi89W2k2HS06AkKfvJ1naMBlrj9F6X
	Cl7IC+o0uC/xsxFwJSbwsiw==
X-Received: by 2002:a05:600c:19ca:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a18e4464famr4244415e9.3.1791508625763;
        Thu, 08 Oct 2026 18:17:05 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c601sm19861285e9.3.2026.10.08.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:17:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:17:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and
 __cmpxchg()
Message-ID: <asg-nSs2cg7O-znd@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-2-kmehltretter@gmail.com>
 <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_181707_753928_B4FA029F 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, Oct 08, 2026 at 11:01:32AM +0100, Gary Guo wrote:
> > v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
> > xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
> > ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
> > in v7.1 also triggers __bad_cmpxchg.
> 
> I think the issue is that when you get multiple function calls in a function,
> GCC starts to think that not inlining can result in code deduplication where
> that is not actually true.
> 
> But I am surprised that it hasn't been seen in the past, perhaps there're only
> calls with single size from any translation unit previously?

The sizes were already mixed. It is the number of callers.

Commit 5dbc0a692459 ("rust: helpers: Add i8/i16 atomic xchg helpers")
has 1-, 2- and 4-byte xchg() in helpers.c and no __bad_xchg. The next
commit, ab717dd98bee, adds two more callers of the same sizes, the
xchg_acquire helpers, and has it.

> The fix LGTM, but Sashiko's report is worth looking into.

It's a valid concern. __generic_cmpxchg_local() has the same weakness
and patch 1 does not touch it. No file in the tree fails today. A test
file triggers it on ARMv5 with gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE:

- 12 valid cmpxchg_local() callers link
- 24 leave an undefined reference to wrong_size_cmpxchg
- __always_inline on __generic_cmpxchg_local() removes it

helpers.c stays below that. The ARMv4T and ARMv5TE kernels of this
series link with gcc 8.1.0. I will send this asm-generic change as a
separate patch.

Thanks,
Karl

