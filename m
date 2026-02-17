Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21834E909D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko33piWn4hrYK2I78h9dD80UmT9p5eWJ3R8jFG5W2oc=; b=GLmF+k7gEuODoLbJDBwith8nUA
	hyciK3kDBUW6DJt7FTit7nX2gtZMsUyeJc3oNCr54teVlvlpXrGZGK0RRAbuUtj65+ez4rZavTMbM
	OPJvZnkLTbxDH/0Cc9dm2sOuu6LB9MFTeWwL4CTBLG0WmXgEfHRNGaDBV3QxJVD5Ws9ImnSdj8L6C
	wmvqm/+iQ2x6h2vL0Q57KkeB0NKiLnRviXpGx1gCS25R/imhiEwe5PVKDCRb9Ud9jNoCVoSPZTO/5
	5CKCLPAUwpO13UHjtAi+hGvcWrlb659Uxfdc6eVQVS5iYDS4eED1bTVYmiRfYmu7orSnqOpYYZTiL
	i8wsmboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO0Q-00000008ZZJ-0Blt;
	Tue, 17 Feb 2026 16:32:58 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO0N-00000008ZYi-3or9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:32:57 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b8fa7e3672eso591466966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771345974; x=1771950774; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko33piWn4hrYK2I78h9dD80UmT9p5eWJ3R8jFG5W2oc=;
        b=aSB4qG/0iKO7ouWw8CX9ylL8o9JyvwW5Ka2xsLWQbmYUDsUNTKS0Gao8+s4DMcCAHB
         8AnmBRPEbVm7mywhHwtYEcOeS7yAICUywbnRTugjZ9eQf2QLTXYYBCFxlYyHNM62Fv//
         HDzNjgYNguCStc2p1ph4fVHE+psKOtU/3/Tfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345974; x=1771950774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ko33piWn4hrYK2I78h9dD80UmT9p5eWJ3R8jFG5W2oc=;
        b=pLa1FGWcYCIWUbYWS4zSPZ3cRmPvs9qOLqagNIRxW0dCLtmpzRNKzKl5DX/GJIKo4w
         f1Ddg8lGObAWuuioQXLCZ1PNZPcES7Pdatfavj+5lLTngIKvuxvW8qFdKqMitw6myRBO
         Muzs8sdt9QF513uND5eTXnaxHW7cMb4gXO+ZKi3izOTOV3wdQNLXuFAer6PrbjKTbOGU
         PMnx5upDJlNrUi2c1XwHxoUxcgtL55UMuhnHUripYgDlJLndxAK1B6uItCH5/vO10Ydd
         73YhkZHFGKQF+9DOEL4fErKAholOK4VHU03zigLoE7V6oFAC0tgHp7GLdU3sGhducq3A
         R1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCURPK7XAGvedp3NQkcwRwX1xLmaHiAJEKetDJIOgnnK8fEITXJe5QCvHUWPKeZvjPh3Ptd/TbIrRsIkCiKRkBsO@lists.infradead.org
X-Gm-Message-State: AOJu0YxBzQolCxpTcXtsTaRhhQx14KUdZc2fDQMsHi8TKiKznrw5k4GG
	8ktVCSibAqUciTl6xi74tEj/etaf1q82JDWyUsdZIYCx+RlTW/NeTylZY53WgnUz3IVxI8zwt48
	zV2YtQXIvnZBU
X-Gm-Gg: AZuq6aL5un6QMsq5MHCZewN4EjSBUVv629KiwoPe4nqt7Ocl9rH4rBoNr7CsLYD5v6X
	lZnzL26Ks2PgDhfKzty4/9FPZAyq7qIJSFes2PrvessSSzLEgVoffVHcdTyEOWPnE2H2I6fC0op
	xEbWG3iSnlU3pdeshffYb1doSzkFTlKrdWOyqLVfY+GU4P/9nGooKRibMW5CyYIa+b5n+/tYuGh
	MsUi/wZh9g/EHMps0QocDz7/3pVRQcmU1ZuusRY4eUnLe+cNO/Z5kLHQdadU8Re0tPC+oWwL5h0
	X8/WEli67KES2XFxGImrLtvEsghLmRTVQSjdqMvgLKMfrQaBtnelPM6zBZDcZQ4zQtLFB85doTw
	yPC7VciT33/cQ4oBNgT3KWOccDTw5NUMhTMgFmgPwIrEJO3wCNPX5SwE/LLaE+itd4P4QMPFlWe
	5aZZTEW/lIqaII306sPLiIkYsB+kuOuzWmwDMh5DBD9evwZWegxAIbJ5PJFjFsCiDim5eTCk2h
X-Received: by 2002:a17:907:940a:b0:b8f:a520:2d7e with SMTP id a640c23a62f3a-b8fc3a32dffmr631354566b.17.1771345973782;
        Tue, 17 Feb 2026 08:32:53 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766531asm363050066b.50.2026.02.17.08.32.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 08:32:49 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8fa7e3672eso591455466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:32:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsJOBNRDgpE0wx1dLHTaFFJRQmMGzUZY2dfoLu6XLORsZ/ZusfoaQwT0Ge861EMGJjEUTmIgQT/odaO0TkV7bb@lists.infradead.org
X-Received: by 2002:a17:907:c23:b0:b8e:3d49:25db with SMTP id
 a640c23a62f3a-b8fc3d0c170mr739585766b.54.1771345969110; Tue, 17 Feb 2026
 08:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
In-Reply-To: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Feb 2026 08:32:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
X-Gm-Features: AaiRm5026OjDq2rrF_ejc-OXkVvpkbLdESQBYonZ-1yEm_-yrkRExdRDNKqG010
Message-ID: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_083255_972410_B024C202 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, 17 Feb 2026 at 08:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But last time I looked at it - which was admittedly a few years ago -
> the compilers we supported didn't actually do anything reasonable here
> (ie the built-in atomics were fundamentally worse than the ones we do
> by hand, and even basic things like __atomic_load_n() weren't
> actually; better than just using 'volatile'.
>
> Maybe that has changed. We've upgraded minimum compilers since.

I  just checked a few test-cases, and I don't think anything has changed.

All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
do better than just our old code using "cast pointer to volatile"
resulted in no better code generation.

So we're sticking to that "cast to volatile" not because it's great,
but because it continues to be reliable and no worse than the fancy
modern versions.

But at least it's explicit in the code, not hidden away in code that
*looks* like it just dereferences another field in a structure.

               Linus

