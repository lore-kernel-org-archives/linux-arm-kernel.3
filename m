Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE77F46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=; b=eQrjxSqAkM62/PfKd7uBVp1LcF
	1YsS9nA7UFMGI3nGFJhVAXy6g+NjYGN7HQ1tpgjsH0Pd3MrQke40mEMgM8/do45ez+c+LH0ZE74Pb
	fPoMx8A4Q0GXw1E2iKyiYA0nyBJFkp/Qt4aJ3Ok1Su2wwpRPewnES6nJJIbM9NlxunY21Krvw1Zxz
	ktSri/Z6lHNcQHaeVjFKHCsot75NyJS3/6qK+bQPy83eBOjuKbum1J29K02kdGHulP9rkoakoLbm8
	JbQoasg0cu5+DdrsT/7uyWoKpa1+tDwqp5XTrHCMJdfzbC31w+9KXbqOwmIButKd7xCtyqhzWSiH9
	SRzPZDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fR4-0000000Gpul-3thQ;
	Mon, 23 Mar 2026 13:35:14 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fR2-0000000GpuE-2NLX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:35:13 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so139445eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272911; cv=none;
        d=google.com; s=arc-20240605;
        b=f16Nk/hTYFsY7GWx+q8ys91/35l5axg3OEblJ+4pLtj3nmFymj1BfWiCGwflp0IKSR
         Xx4dKtVwuyPOuoD/GF+uYhSf+s94P3rtLTb3oQB35Y77r3fEmdlHQQNVJ5lXQxM4TBjB
         jf23L4fVVpaQRl1o6+mCQlHLMFV6+oR+em8gLVgojwr9uwdfuBIWu3AwOJmND6jsGF+m
         boV9MzJAaagipFlhfTJhq5xo6dYa/T7ds2wrAUMEwD9MxhxosgDQMzM0DIhDjD4nBS8u
         rMzntgf2Cp3GmaacFvpcN8Edy+kDm6BBfeMTu/SrH+IaNwpXAiWkveYWDedD+HK6QBaf
         7D9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        fh=Bjas7bRbOCjeiYYGd5S6n1kBdCMrma+dSyIxeze5R+8=;
        b=Yw10/AvBVJBcPr8RQVk/JhPm0LVfxgRwNvV5rcCY8FQ6iS7ST4x0Kk5CBzKXVGf1eS
         FeaQXoKogy7jjGwkt9Uu3MxiLYJcSk7oJPt5YzWlbgqOE+YJKIYLs+CpET6U0SDo/1d5
         BBkdNMhXn9dysVuCTIOgl39jw+TRjGJyPJZID8DG9WDyObB+Zw39e904bVwXnFdR2W5s
         LOC8lj1xMvinlPlfN7VgEAlrKfCpdWcksPphy76piG6qeH9nPnU1/oFDremqYy7ucEYj
         8VFTflwksDIw16c6beMOGXUlRoN3R3ROkLTNM7GhsRtO3D/mY6YEDvdFKJx9rK5fDxVa
         B6VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272911; x=1774877711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=XTuAO0CFNoCjroBr7Lh5ifYNtdjmERR5DgTYP1XfcGvzX7m4wFCt6jcoK2ayI3rOee
         3fHrxmIzkcJhVKAKs29WxVbBUOA0Vxp8OU8LP8aVRyEgXrcVyYIWXri/8BqmyDdi0Nqw
         /Raq2SXoBWQX7GNihQzyZK5esVXQXvAa6TqhBzr3WZCdtZhqt+7JxNdIq7pN2PiJaDsC
         7FevuDYsMDnOuaXyLaSFUj2N5e87RDGLr+2Pgcu+ShSTLjy73FRlPuNDjM2ymBI2Kp0K
         YZSS3pLCflQ7WNfNwHlF09zkIJU/gky1jUupxuV0L6/bE2pgCxkC1gu9bmrVdYXojznC
         UkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272911; x=1774877711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=pcjpCYLg6BzS0l4UmwRwCnGf1QRdS4IBtJp9Xej8gQLdRW0bbfBTJMlJVCkMBFYmbY
         oHSEiW3WKdZphiTlqlmhjjcC+eEne5b0+aMi8CQTvdQ7I/3dgBDdfdq/NtKGr4KhrZEF
         11hnROi3aK8YZ/8Lv65MPOfL3c3XbiT4ifP8raKwQJcDfYZUfUzyHvkktuQzqofwdE7p
         N5S9MyoG9ElyiKEFgb2xu94LUZYTUsXdlyiX6x6q+4EaBytKkgspQRNZGC7gNrMEgvQU
         u3+j9X4vX4X1rxl+StpJJPBeMclqL1K0XD4VeliKGaNnrddDqdNASJe3Xam+DPFG5B+p
         DjVg==
X-Forwarded-Encrypted: i=1; AJvYcCVoOS/si9kWhA3xNRG+suF/NVcOhzw2duw3LG3a5QjeUU2/sMRME2jwXqi3SF4mnSg0NrUx6vCzN83F6wnfN1jZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzGGWswAUpnm76apjnuTArCTcL7Wvc2wsItyKvg5O/MPHbc0lnk
	EdoEOkpSVeGIQ/Yfx8cUsif14zhdm5fH3FzJXwOkaSL5EbRRJ6SaucznT9aEnzn5EgEHykcvD8F
	yliUwDz/ky+pLKYUoZZVCKM6p7ZI5X6Y=
X-Gm-Gg: ATEYQzywcjDO8sV1bkWoCPCa6DOhpooomyAhg2ClIsrpkgsg7jKLnzn3brx2JXodqyf
	hO7XLsFvbomFXgPJfwTc7KI05ZAy/3w5DT/CJfnr35s0Aw/20CMn8+sWTS4d8eYILzAbQFBOh2a
	XjpZFTMM0DmlC8xoN9OhUcYI1mG+OJZM5B+N5qMmH6hKuTt0pR/Y/Kvqnnjo4dhO/tIRg/HMoU1
	TjPGVaMgtbCdfAn5I85P0Ab8f6P4+PfN6fmUMjuOC4UUgnuAT5QAO3JzcmiMJsOy50X89X0AAu9
	DrEDet118POcsOLD/7xncLi85/O6LQcbl3juQuAMvRi7sTRwGrq0WBqXL3AXCSKyuNjsdv5TVeH
	YiSSsbMnE85+9M1dWtBagGYh1SZ7/M4p3rw==
X-Received: by 2002:a05:7300:5711:b0:2c1:27c:75d3 with SMTP id
 5a478bee46e88-2c10956c2a3mr2435566eec.1.1774272911337; Mon, 23 Mar 2026
 06:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:34:58 +0100
X-Gm-Features: AQROBzD7g_rNmuMWaBSXTkod6GcGExC_6-5XqRdaJnhqw3z7WBAm_JnLMPlOCtE
Message-ID: <CANiq72kD6HVrDTjQrTXDujyjA4Z5ELM6Nh8kFfVfNXrvpfU1wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_063512_609571_85AA7EF7 
X-CRM114-Status: GOOD (  15.73  )
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

On Mon, Mar 23, 2026 at 2:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
>
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

We have always been using the helpers to access the inline functions,
please see the top comment in `rust/helpers/helpers.c`:

   Non-trivial C macros cannot be used in Rust. Similarly, inlined C functi=
ons
   cannot be called either. This file explicitly creates functions ("helper=
s")
   that wrap those so that they can be called from Rust.

It doesn't duplicate the functionality, it simply forwards the call,
i.e. it is not as bad as a full copy-paste of the implementation.

This patch series aims to improve performance (cheaply in terms of
built time) because for Rust calling those helpers are not inline
anymore otherwise.

You may be referring, instead, to avoiding to have to write manually
the helper (the forwarder) -- for that, please see "Support static
inline functions in headers (by generating a wrapper)" at:

  https://github.com/Rust-for-Linux/linux/issues/353

(In fact, I had your previous mention of `skbuff.h` from Lore there :)

Assuming `--wrap-static-fns` works well etc., then it would be nice to
use it, yeah. But that is different from this patch series (and this
patch series would apply as well even if we use the automated wrappers
etc.).

I hope that clarifies.

Cheers,
Miguel

