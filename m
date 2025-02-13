Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E471BC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv6P96WmOQrbC3P256YzatTY2ZKaxCszZnGNiwVr44Q=; b=1NgUaVi86BDR1+1w+MtCdmUkwR
	e/j56FxShTEtw5j2MjEKlKkAqW0+UJ72+DgkNwzbtBf1GUiCP7gyQnz3aAPhQ9Y8MuQMwmjzOMXY+
	VyWpEn9f2eOdZcoGLMIRjEwEi21LE9t5kFP2WbHkUMdtO8D9xNACtuHIO8SxSqN53c7YOPD9nNUKQ
	rTw49+3cgVs82Bn7vy+QI0m8kaJFbO0ojFXWQR/+fIdfhLs/zkQ6pVJes5bRhWJkiSQ2krGlB4XvY
	GX4wrlQK41iJ/Ccya8juaEKLOTCgjheR4Jyuy0ZXDJdoJfNfHd4NvAynBgw4CtrTTlCwicE0toUtT
	9j6zv9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSXq-00000009uad-1ctU;
	Thu, 13 Feb 2025 06:17:54 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSW5-00000009uI2-2RiM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:16:07 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5deb1b8e1bcso859777a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739427364; x=1740032164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv6P96WmOQrbC3P256YzatTY2ZKaxCszZnGNiwVr44Q=;
        b=c2jpL/Z5Yv/d72SCjYBuGNI5PUEunsrP5huBXAmotgym4iWcsq9+tjXy8XdJBYt/df
         R/AS0gMHwfx2b3fh/R0XgRkiKZWEZa8grAzO6UxwXBc7/vxC3bATv2gxomXXHuQlbcMl
         VpME5tM9vIPI77iELIrBAk7NS/QhrZDy8j8oE+KR34ppILXzDv3rAgeggWQqLa+6wMZr
         0r03BYAINvTLceN+G4U+3Ezh/h4uj37DmKjDDNowfet338LQfS07mmlIpDCQlDNHHe0L
         z1LpoP+c6C4zAeKjWlp7H6D8i57HWgk4sl9FPYOFLq0iSK13igudqtthNti/X2Lcn4u2
         /fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427364; x=1740032164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv6P96WmOQrbC3P256YzatTY2ZKaxCszZnGNiwVr44Q=;
        b=T0K4t9nPLdyCcFj1S1D3/KlS+zuSbL9+rsJGk/lUrENWl2SfkHFRyxF7+zIijF1neo
         nEKXCjZ9JMCEH55hP6t1l3+qkESGlI+lSnU3YC5uYylrzImBpHgY4RBoiXR4+jRXKeMF
         98XJMXkFw6BBD6mtCBREYoeMJOwESeyPq1+uThX29w2WKg8W/QI0gu4o0VuNtTkBWgA+
         Y0IphbmTVbHR/OX9mQNwkqDw+l8LMyTIppjUUiZw4o36gucp5do6cxxIoHOttpfmGtWM
         d0Ov2lptQb8tqwsyk17K2wMwNKsXVjLh+zUatokJi0zaKxdsyPlK8u2HpCTW3ducGsGB
         xygw==
X-Forwarded-Encrypted: i=1; AJvYcCVruwXBRa5gBqkm2rHFcpXi/4hf1+4BESnhPdztE9xVNS+XN2B6kZXHR9VTY0HuliIJmYhaWKCZqpjx1N85msP9@lists.infradead.org
X-Gm-Message-State: AOJu0YwR6U7qJn6T8W0oKQkSmrRkilpMwOu5xW4y0BzaeZsg3AQI1cae
	stlDB3C1csNIAilfnKrqZRI/MhBBhoj2hvZAV6qtQQVCvVHcR7TBex0oiH2MIz7KfPh3wuVALxe
	WnjHr6BwQD9G59asCx+wYadgkeYE=
X-Gm-Gg: ASbGncu7ZLRAdpcLA0DHN4dOor4zFUPSCW+zJPRnzGpAIJQUuKlvMtUMWOrrQ3jfHXx
	FysopV6vzocB76U3dfbuV0Op/pldzef6nEJv+RipF5stBHzKJS0hU4qeTUqOximkY+rS/elIVJA
	==
X-Google-Smtp-Source: AGHT+IHFCPal8XyiRpNELMJ8NBCTaRWNSJ89jjVFoE90aeSCR4Yqu4INXbyrSo6a7ISMjZGsyZRiXpy3HscM3AvbHVo=
X-Received: by 2002:a05:6402:3205:b0:5de:5717:f235 with SMTP id
 4fb4d7f45d1cf-5dec9fabe15mr1741758a12.24.1739427363633; Wed, 12 Feb 2025
 22:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-18-memxor@gmail.com>
 <20250210095324.GG10324@noisy.programming.kicks-ass.net> <20250210100316.GD31462@noisy.programming.kicks-ass.net>
In-Reply-To: <20250210100316.GD31462@noisy.programming.kicks-ass.net>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 13 Feb 2025 07:15:27 +0100
X-Gm-Features: AWEUYZl7M0DetoXSoe_3tNiqDhURqRz8Da2S_9eZM8rtLeudxKegHHRX9bQwnzE
Message-ID: <CAP01T77B9OH6vPqYNyLwmdo4Q6EE5iAi4dTKduPqpTOgdkO_Bw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 17/26] rqspinlock: Hardcode cond_acquire loops
 to asm-generic implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ankur Arora <ankur.a.arora@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Barret Rhoden <brho@google.com>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_221605_646103_CC54FAF4 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, 10 Feb 2025 at 11:03, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Feb 10, 2025 at 10:53:25AM +0100, Peter Zijlstra wrote:
> > On Thu, Feb 06, 2025 at 02:54:25AM -0800, Kumar Kartikeya Dwivedi wrote:
> > > Currently, for rqspinlock usage, the implementation of
> > > smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
> > > susceptible to stalls on arm64, because they do not guarantee that the
> > > conditional expression will be repeatedly invoked if the address being
> > > loaded from is not written to by other CPUs. When support for
> > > event-streams is absent (which unblocks stuck WFE-based loops every
> > > ~100us), we may end up being stuck forever.
> > >
> > > This causes a problem for us, as we need to repeatedly invoke the
> > > RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
> > > expires.
> > >
> > > Hardcode the implementation to the asm-generic version in rqspinlock.c
> > > until support for smp_cond_load_acquire_timewait [0] lands upstream.
> > >
> >
> > *sigh*.. this patch should go *before* patch 8. As is that's still
> > horribly broken and I was WTF-ing because your 0/n changelog said you
> > fixed it.
>

Sorry about that, I will move it before the patch using this.

> And since you're doing local copies of things, why not take a lobal copy
> of the smp_cond_load_acquire_timewait() thing?

Ack, I'll address this in v3.

