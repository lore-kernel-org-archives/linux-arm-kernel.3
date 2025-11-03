Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C82CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6+8IBdXCcTU6eZ4JMuY2we8/fQYN6+oBue210uWprk=; b=LO+BzsefqVHQLGIBK3ip9bTGui
	nXKNvG+3OUDZWsTiX4IJ8EqY2cLueoSq9al6noV47F9iWKfOzftDQYoc6an153wB/h0ikeq384/Dg
	jz1Vq4ZRQ7Q6yBgy+ng3wPDCebR5PhCFDgGpPRjuNekj4ypgFX623ckCG0aolZOOzFAZiP7y3SFEq
	F3i22NCqXMc5n0hwLgDB2LihhhuS1NIXDB9/Zwk8Wl3YKrXpj9YEIZc+jvPhh0QM8HeqSJukSEbS/
	spCqgGirIiEmG56BbKPoYGeFyY3CBbHgXjsDx+mIN03aBqk4NGCYuj6f531pb7dPJuQbfXMg833PW
	rJqgq2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq4M-00000009RTb-0tBb;
	Mon, 03 Nov 2025 08:37:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq4J-00000009RSM-2f5t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:37:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6409cb34fe0so344872a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762159057; x=1762763857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6+8IBdXCcTU6eZ4JMuY2we8/fQYN6+oBue210uWprk=;
        b=KGLRGCr6hAYuitreTADyMcp5+eFvB+tXFyLH336hSHXQ3jyhAb9BsHBumOE7RAI+mK
         O/Xm6siv88MQLxDuy/uXSsvoM8WpIXwHfy6ZjeS45ZXkk7on+rjjgugKukVsIyZ7j964
         o4VLAc7MtCqPHQWKGho1h4oReP8qK8BrRFPNSnKQ+fTZUhhu03RJX3L8LEs5Qsv51R+o
         ov5p3sJpqyz1rDX4m5IgUB3aNoXILeXjU1Fd6jVt/0ZTy7EfzkiTbBks7hhH/yqEFnlB
         gsJEVsIs0EtmI4zLM8gUVUSDiN/5OK/2vDPA8kzyXuAj0MMKALaMTNPIbuA7z7lIS+l0
         IqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159057; x=1762763857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6+8IBdXCcTU6eZ4JMuY2we8/fQYN6+oBue210uWprk=;
        b=jNm+GvZDCCjji2qD7/o4XXt++3OsS1m6+u1f6JOZQG90kpfj7lT+l/kMoekxzkVg7b
         yG8VrohjsW5NH1uB3/ryhX4BF/Rne7p+c04CcKfY/YD9E2KUgo0FNc8fOPXVo0Ofn6C9
         DkNhw2bMxAuV0oMBtEzXcZh8s6XfmdCtqYTZAuWbwKK4As46Bc9CzdM5j1Mi/wwhZLn3
         Ya3ldD83BBMTConBdR48kyCETTVT6CyIgpfw8bjB2qlQ6+4MBBB8UTrlIapDgL4ew8V7
         bZ8JLCZGlU/zS350gfjdQljKh283y5kFhF0gURPK3saYKEefj4G0MUhfo9wuWmy/cHub
         vbmA==
X-Forwarded-Encrypted: i=1; AJvYcCVmXTdXlTVnuyruNswpHEaQluZOnnR+Q46ODXd9xtlH/61hbsgF0PgIDYtqBgPiQrDhPahbuy1IIaOhgFmJysv3@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4G80o0gx0IgUMgEcWjR1hObdWVjMi0X5W7RgMo0g0ZgXIIzG
	Eq4CjmIJN3TKYLmGcRcU7TRhwBXbCrj/k0zEMYh+JtFOhURtFvbMdHY/qpi9+PWNI+s=
X-Gm-Gg: ASbGncvq7zTToIkIGfXd8gEDhXaFqakPlvpTqU2avskYE9sjqvHCTqff64G0Im1e4+C
	tiUEsz9WYdp8U86tBpQBLWSvr9e5dR2OQo8umveHvOsfututeux9UXH10/hkb64yPOzAn78D6eI
	rXONL9JcRIDkhiYqwUIn52DD5FymuM7zYEiG6OtnPGyS+aQ4ObFeBTkrhdTLDc73ij3v6iYi6HF
	HQgUjF2IdAbqUvgS54mHP7ajn+QRodHm1tHGmtT28N15s3MK/k+tItJwxo5JUsq4IZx2E7jt4so
	qlVwzUHZJaenaFRon2Vr9VMopBS5jsd2CzX3QVQvwiCnrtsOZxaUWBNXc/ik4yxI8HUN8e+iT0m
	ix2GNBdAGmTUvMV0u78q6/P8cP3tU0Dw3x+UEZw8Mc9UD/iO3m1ORbkvEvbXT6wFPae44ynqWJV
	+RpV+AUX9dBaQEMUiQb3TAbgr1WrW7+fJ1fFpA+cztefS1pH2fmWHX9xWuCidth9T0JJ7j29/tu
	9I8
X-Google-Smtp-Source: AGHT+IEXAMzB4Q3iZseWqc5EI+3z01yD/lkzyZQiHdGqXZRiWGSYaalZ7FPGcsDnEnqBbvKYbK1akQ==
X-Received: by 2002:a05:6402:27d3:b0:640:9eb3:3683 with SMTP id 4fb4d7f45d1cf-6409eb34460mr3244974a12.1.1762159057100;
        Mon, 03 Nov 2025 00:37:37 -0800 (PST)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b428119sm9012005a12.24.2025.11.03.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:37:36 -0800 (PST)
Date: Mon, 3 Nov 2025 09:37:28 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov
 <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark Williams
 <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
Message-ID: <20251103093728.031042d0@mordecai>
In-Reply-To: <xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
	<20251010153839.151763-7-vschneid@redhat.com>
	<20251030112251.5afcf9ed@mordecai>
	<xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_003739_707157_5F319044 
X-CRM114-Status: GOOD (  39.10  )
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

On Fri, 31 Oct 2025 12:52:56 +0100
Valentin Schneider <vschneid@redhat.com> wrote:

> On 30/10/25 11:25, Petr Tesarik wrote:
> > On Fri, 10 Oct 2025 17:38:16 +0200
> > Valentin Schneider <vschneid@redhat.com> wrote:
> >  
> >> From: Josh Poimboeuf <jpoimboe@kernel.org>
> >>
> >> Deferring a code patching IPI is unsafe if the patched code is in a
> >> noinstr region.  In that case the text poke code must trigger an
> >> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
> >> CPU running in userspace.
> >>
> >> If a noinstr static call only needs to be patched during boot, its key
> >> can be made ro-after-init to ensure it will never be patched at runtime.
> >>
> >> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> >> ---
> >>  include/linux/static_call.h | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> >> index 78a77a4ae0ea8..ea6ca57e2a829 100644
> >> --- a/include/linux/static_call.h
> >> +++ b/include/linux/static_call.h
> >> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
> >>      };								\
> >>      ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> >>
> >> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
> >> +	DECLARE_STATIC_CALL(name, _func);				\
> >> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> >> +		.func = _func,						\
> >> +		.type = 1,						\
> >> +	};								\
> >> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> >> +
> >>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
> >>      DECLARE_STATIC_CALL(name, _func);				\
> >>      struct static_call_key STATIC_CALL_KEY(name) = {		\
> >> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
> >>      };								\
> >>      ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> >>
> >> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
> >> +	DECLARE_STATIC_CALL(name, _func);				\
> >> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> >> +		.func = NULL,						\
> >> +		.type = 1,						\
> >> +	};								\
> >> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> >> +  
> >
> > I think it would be a good idea to add a comment describing when these
> > macros are supposed to be used, similar to the explanation you wrote for
> > the _NOINSTR variants. Just to provide a clue for people adding a new
> > static key in the future, because the commit message may become a bit
> > hard to find if there are a few cleanup patches on top.
> >  
> 
> I was about to write such a comment but I had another take; The _NOINSTR
> static key helpers are special and only relevant to IPI deferral; whereas
> the _RO helpers actually change the backing storage for the keys and as a
> bonus are used by the IPI deferral instrumentation.
> 
> IMO it's the same here for the static calls, it makes sense to mark the
> relevant ones as _RO regardless of IPI deferral.
> 
> I could however add a comment to ANNOTATE_NOINSTR_ALLOWED() itself,
> something like:
> 
> ```
> /*
>  * This is used to tell objtool that a given static key is safe to be used
>  * within .noinstr code, and it doesn't need to generate a warning about it.
>  *
>  * For more information, see tools/objtool/Documentation/objtool.txt,
>  * "non-RO static key usage in noinstr code"
>  */
> #define ANNOTATE_NOINSTR_ALLOWED(key) __ANNOTATE_NOINSTR_ALLOWED(key)
> ```

I agree, this makes more sense. Thank you!

Petr T

