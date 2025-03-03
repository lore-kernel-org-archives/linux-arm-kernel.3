Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95545C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqcchcl0H3MHX0plBBglpw5tZdbp+fJLEBNYpMMUwBs=; b=ni0X8D/OQcfLEyuUjC76Ea999/
	7gKUCs3dga/mUM8G8mF8WhR3eXzmdAcWYpZ+NO4hrszSC0uMdp5Tye3fL21eLYk4KqpNDPlvtYCWB
	E+5LThlF1yHIPz+EbgwpYN37wWXFukdaoO4NNsnM6moeEmCz+bWolsy0wsXMOpholDxbjNdNrskhL
	ao3O5dHw168wxmYa2MmmLfctZWfngz1tcA4mIrLF5A3B9yMcmViJXEquqHMulr/cIfBxcYSoupomZ
	rOC5diBnRmSJuuTqlROpaZm2kGapXm2O/aboKcKb1QsOXIxbNK3o1ajDHWrWj8VD+REkh362dig5g
	ZhVy7Oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Rn-00000000PnJ-0Q1U;
	Mon, 03 Mar 2025 10:54:55 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3QD-00000000POO-18Zj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:53:18 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6fd2587d059so25181087b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740999196; x=1741603996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqcchcl0H3MHX0plBBglpw5tZdbp+fJLEBNYpMMUwBs=;
        b=VM/LvHMh2+Sae2Gy7muwEeDceLjZ6vD+K6UsON/TJkw/IWewiuOc9oTApqOQJeeH7W
         AuogsMFGCP/T5vdk0gGiPdzArWlfrqCJsfklUKFc5bnCXa+2lAAA+5JsNvdLBUc1IdtE
         OaKCSdnMij1u+PxPe98dj5onkoiuJlAULFQjy4PM9c27iOOBxn0wXSGbUmatLRrAhiP6
         9V7CunapzvJ+KuzfNTuQ+eLoMVWy6mfmfuyIfIzkxFhWbROG66VgEg6mH+VMLMQTvGzH
         /9sdpNFc8v4brg6Apsrx7obkPLdUQlQuZ0RG2a9KUbkl0Rs/rQFt8iWW0eDkOnsraT7I
         8Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740999196; x=1741603996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqcchcl0H3MHX0plBBglpw5tZdbp+fJLEBNYpMMUwBs=;
        b=g1jmMm0Q2Y7SrjBpy1vg3hAlrI+/R2//lX8Z5Wkfb2lwAb6PqRJrQaFabUaa556W9Y
         FFcx9dlQYB+0FIGzIz3syY7OjHthXuJaNHXQB6KUJl9jsEpXZQmD1ny1lG19XubEMFOt
         2anvRPqboDnIUmOSdQHkinHHEzfov12tPUMLZs4DCblLvWv+CqbC1U4ipP8sk+2CoC6p
         ie7iLnFAeY+x4XpGLXE00Y0khW0dSNllVHvrsrDfFd2SmsCokuPCOBdAOl4QJXgsd676
         P3V4szTZHItYQauG6l/ZkdGIq42DDzm9YKY0BWOuZVjfkc+UxFjEEDUFqL2Y1AAf4mxG
         w8TA==
X-Forwarded-Encrypted: i=1; AJvYcCWtbpVABnFlmIK2TllTRJn9hi3U6M0pLCrH3g03BCbcbkchSqQ2PA1RM9xXh9/FA9buI+pzcq5f/YuKBOgh+J0N@lists.infradead.org
X-Gm-Message-State: AOJu0YzUldxNBTjlfqKyKuCb7uDaR09zkoR87zk0Kp3B7OfD7Im8OOUk
	LjG6ZYc5US1AQCal/xMExCb70COU7uFR2xye/cv/4+ujQrMzDq+iNLXKNywz2MGAhZAi7GQDpRr
	9w6Zs+WcfE/h0DeIDeapnW9rMeB8=
X-Gm-Gg: ASbGncuddyPSm3ZZ7jDYd8H3ERehnK/A/PMPXNYq/MwXA+2G7Bobv3pc1R2/ir40YeF
	MNEvP98URcNAcSW7jKk8hY5hFa0nN9avPSFThZwN9mRrwY4L5OZ1cunpWhzAsLeToq0I49P5FsW
	kWrOuVg6ylOSlcmh7ps705fgqkKQ==
X-Google-Smtp-Source: AGHT+IGPFg7vyGunvepCrP71hctzW/wiFhK2mnTSkLrkuSsp6X2qPRH18XUJIiB5Y7juu2x6EocYr5DNocerNm2QyWM=
X-Received: by 2002:a05:690c:4802:b0:6fd:2f47:f4f9 with SMTP id
 00721157ae682-6fd4a0bad92mr160996667b3.9.1740999195914; Mon, 03 Mar 2025
 02:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-2-dongml2@chinatelecom.cn> <20250303091811.GH5880@noisy.programming.kicks-ass.net>
In-Reply-To: <20250303091811.GH5880@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Mon, 3 Mar 2025 18:51:41 +0800
X-Gm-Features: AQ5f1JolBjCiOEE9gVLsf6wdPN2zmwGfmSm6JtRrhu885EwwD4hwEQ1WHKYNmyc
Message-ID: <CADxym3as+KdeBMUigq4xq302g2U7UG-7Gm+vKiYGnSjHouq=bg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/4] x86/ibt: factor out cfi and fineibt offset
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_025317_310246_80371EFF 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Mar 3, 2025 at 5:18=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Mon, Mar 03, 2025 at 02:53:42PM +0800, Menglong Dong wrote:
> > index c71b575bf229..ad050d09cb2b 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> > @@ -908,7 +908,7 @@ void __init_or_module noinline apply_seal_endbr(s32=
 *start, s32 *end, struct mod
> >
> >               poison_endbr(addr, wr_addr, true);
> >               if (IS_ENABLED(CONFIG_FINEIBT))
> > -                     poison_cfi(addr - 16, wr_addr - 16);
> > +                     poison_cfi(addr, wr_addr);
> >       }
> >  }
>
> If you're touching this code, please use tip/x86/core or tip/master.

Thank you for reminding me that, I were using the linux-next, and
I notice that you just did some optimization to the FINEIBT :/

I'll send a V4 later, based on the tip/x86/core.

Thanks!
Menglong Dong

