Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ABDFCA17B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5+N+QS7JaZPLj+uCtT6Y1yacnGRCT6luuIZGAnMNOM=; b=fMBfPRjvaHFloMV+j/SA65Khq9
	Ym86Lvj2MF7cKBCb0JU6ehgHsCZLCrrZVc1uF/PnmUgSO3YDsk8Md7Dkc8ApuvouLf+FpJOHGYEfu
	MWP6hPf4Y0eSuDCX+zSIzZVvDcVLZEc85IXgPh0QxLSzMa6fU5UEjv0SI4V8f8C798My8ocrgX2rf
	Gw72wEfIJloeQCOxvLFj/QobDhTIqVS5s0gW1Tijzsfe1zIoVCZGP4qACtoA8qDGRNUezcp6a+Hof
	s0ofQR6wGIzlqo2QpejmbrOsIiTQ/gWZNcKtYjs5auRIyWd44+QkSqAvKmF4TnEs3USoAuA1U9PkI
	7geYKxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgGl-000000083e3-0MdT;
	Mon, 09 Mar 2026 19:27:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgGi-000000083dW-2sEG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 19:27:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae3f822163so20975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773084475; x=1773689275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5+N+QS7JaZPLj+uCtT6Y1yacnGRCT6luuIZGAnMNOM=;
        b=WOaiqn8SNlddWJd/GoNLvabFx99sJ68oE9xA/iM3/1VBKn8tJu69ARjtYUNB6LmUGh
         q6uZERITwn2wbaLCKeHhYsRVka0l4wi+LZf5yDAvBUXxGF2jeaCyPcZ5UMFPgzPDX4x6
         ukLY4GZFIuut4NynTN/9tiwT9H0CLBYbX5PSp02cGjy89RT5vpx/BpO2++gQsDl5baNI
         uXal1+cEZlNUurTdtP/Sr9p5Y5PUSPUa3AaMuZukA5d65TKgId9OdH1CZgTKj1q5ywc4
         w4ZbkiEAYIgy7M08sszdUyH0VmFxAyq5U3E7FhS6j1kiULqFH81HroHgvD3hG851n+hH
         10hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773084475; x=1773689275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5+N+QS7JaZPLj+uCtT6Y1yacnGRCT6luuIZGAnMNOM=;
        b=he78ZWwTpjOIWcmQ0VOQwhfFQN9jM9BvsOhPF5YFyYTkwJUel3s5+PURVz7Kgohxdf
         CeiZ19JbJIIQ/aUPsyIYfWzqOvuRmytvJ1F1Hx3axsZwMTzqnJW400apjwa6pjCtKug3
         RPbq3AlKIYRAkQk6pz9H2LzJrMWDKoWb0tj+Nsezk3Qj1RKsSEtS2AYat49RFZ58Usyy
         I0RYkhr9ogj6rZhdBg0wCbYpPHJgURnKbsTUGvckhZr9RwyjqYJMGe4vgqK7B/AGg+6W
         1vbIGZjDrtB3OObz0c06h+Oo2/5MzhMrGXz87KfPZD+18pO52DFdNU2mQnhBYuRpYJQw
         RqPA==
X-Forwarded-Encrypted: i=1; AJvYcCU2XQP0zHpLm+XndHH8EwnbRrDryo9HlWVTItmp8j9flLS5p6HZ4DWOd0TIWq1wplHmnGxNMe470xjdMeMf5kUP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4g9VN7NqLssOBdV9X+yi6hOWQoBxHVYyKTQa93JLgyDIteeql
	WDdTSHL5yHQ9cTsljS9TA3T/xq1t22mNhz7msEQ8gBjGAFrFbvAZ6dAC/2kvvXFHcg==
X-Gm-Gg: ATEYQzwuMokU1oNpHnoyywg2zZmm6GNPP6bM33nTEKKgHxGp1rycmRpsDncjGSdxcaZ
	hMJpeEGyrlHE0zKmKVChEKHDw0uH2pU8+5flONUj6Lxk/SYFpDsh9nbUqlIQfhCvNMxKfKy/+r+
	paKB/D9HfO9Cg2JwJxq80wQLRXh74treQ9AAocuwnSdXUQAvDqdBhXHv7+cKx7m/g79BgCiDIcR
	P6bF+X6ZhcyQC/wZsZ6qEaKw1emd1M+BMx7lk0RO5Thfy0I9+EtzXqb9gRiWnGlqZTISLfriuNQ
	JkRu1uBcHouyfYNXpN07g75c4/QOZE0xtYl+UP62L+LfYn7v/N04dzPuQmXELx+2OMMeXnChCSp
	FQsJ970DND1sBw0eJoLZUFG8Tvoxyh0sGR/ZOagpfQ2OWz1XyM7r7njKuK45MK5WvslE7cOAETp
	zuvgr7Lq8J5wImW8PJz7Hz7AYWDvaoPfMvTO/5pvpy6Gr6VmXfb/pBLqwShh87VYqoH2gz8PBC
X-Received: by 2002:a17:902:ce0c:b0:2a7:87c2:fcde with SMTP id d9443c01a7336-2aea3258530mr529395ad.15.1773084474262;
        Mon, 09 Mar 2026 12:27:54 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e16cebbsm9655626a12.16.2026.03.09.12.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:27:53 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:27:49 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sean Christopherson <seanjc@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm <kvmarm@lists.cs.columbia.edu>, kvm@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v4 09/17] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <aa8fNT3P54t5W53T@google.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-10-seanjc@google.com>
 <YfrQzoIWyv9lNljh@google.com>
 <CABCJKufg=ONNOvF8+BRXfLoTUfeiZZsdd8TnpV-GaNK_o-HuaA@mail.gmail.com>
 <202202061011.A255DE55B@keescook>
 <YgAvhG4wvnslbTqP@hirez.programming.kicks-ass.net>
 <202202061854.B5B11282@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202061854.B5B11282@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_122756_764437_7E42E165 
X-CRM114-Status: GOOD (  26.41  )
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

On Sun, Feb 06, 2022 at 06:55:56PM -0800, Kees Cook wrote:
> On Sun, Feb 06, 2022 at 09:28:52PM +0100, Peter Zijlstra wrote:
> > On Sun, Feb 06, 2022 at 10:45:15AM -0800, Kees Cook wrote:
> > 
> > > I'm digging through the macros to sort this out, but IIUC, an example of
> > > the problem is:
> > > 
> > 
> > > so the caller is expecting "unsigned int (*)(void)" but the prototype
> > > of __static_call_return0 is "long (*)(void)":
> > > 
> > > long __static_call_return0(void);
> > > 
> > > Could we simply declare a type-matched ret0 trampoline too?
> > 
> > That'll work for this case, but the next case the function will have
> > arguments we'll need even more nonsense...
> 
> Shouldn't the typeof() work there too, though? I.e. as long as the
> return value can hold a "0", it'd work.

I gave this a shot but then hit a wall with the arguments indeed:

typedef int (perf_snapshot_branch_stack_t)(struct perf_branch_entry *entries,
					   unsigned int cnt);
[...]
DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);

I can generate a stub with the matching return type using typeof() but
the arguments have to be fixed e.g. to (void):

#define DEFINE_STATIC_CALL_RET0(name, _func)				\
	static inline typeof(((typeof(_func)*)0)())			\
		__static_call_ret0_##name(void) { return 0; }		\
	__DEFINE_STATIC_CALL(name, _func, __static_call_ret0_##name)

I believe this would work for most perf callbacks cases except the one
above because the arguments would generate a different hash for CFI.

> 
> > And as stated in that other email, there's tb_stub_func() having the
> > exact same problem as well.
> 
> Yeah, I'd need to go look at that again.

Is this testing for "_func == __static_call_return0" in static_call()?
Ok, but I don't understand how to handle the arguments here either.
The call sites do "static_call(name)(...)", and I don't see a way to
handle this using macro magic.

> 
> > The x86_64 CFI patches had a work-around for this, that could trivially
> > be lifted I suppose.
> 
> Yeah, I think it'd be similar. I haven't had a chance to go look at that
> again...
> 

What is this work-around for x86?

Downstream I had to resolve this my providing individual stubs for each
DEFINE_STATIC_CALL_RET0() :( If you care to see my hack:
https://android-review.googlesource.com/c/kernel/common/+/3980171

I don't have a clue on how to fix this properly though. Any ideas?

--
Carlos Llamas

