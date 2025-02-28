Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AB0C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnSNXJUHBXvGzpVRG5KhgAWl885WHp27TpnkoxblTDE=; b=Wt+qws4uigyb6fg2WIQvoCts1e
	dS+jI0ibQH2HvteVKFfn7QoOV5yDh8ruJhDom4aVyInVWi4kagJcGwGsteq1pdiPey4pK8GHZ9ZHc
	R7wjtLAQ2beV6qGiEYmzR4m5wWHqEJhmDDF3FhZBsK7kdBnxWqRHDBnlUvZcIgxv1Z9Q6qF1xnQ6f
	ja/AMEbIs4xDwr6yCCCEllKxXuOCWqsPyS+CyufHfkHPUGVAhp2+RWOoH5ZI3Mq3lh3RqoJuUk0U8
	jeRzzD/li/HHURH5tCCe5KJlq3H8x1rhwKetPLWmrr1y+wsFYuoqJpCSPYpeXHxf0BMsYNBQX5kgr
	dtmSxgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx6Q-0000000AT2M-3p20;
	Fri, 28 Feb 2025 09:56:18 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx4q-0000000AScq-2Mx3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:54:41 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6f9625c0fccso17610187b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740736479; x=1741341279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnSNXJUHBXvGzpVRG5KhgAWl885WHp27TpnkoxblTDE=;
        b=NHPQgI6GXegx/1bk/t5MaMAbulvcvzDwSDCtuknEUH/EmKQ31Kv3Vy87Xh9d6CfQUK
         3d+XWWUOnlLBNuRSuiGQjP3Lu9oK7yo89ts65FX8s/FsSc8YnRtgAcYzBPwyc77SNvro
         nMReNykkuqEoFi98sTl3EV35MwmXeDlpqXw/cplaD/0sMY0HL5ggP6OhJ5avARNzP7yM
         5xdogBBZ3UTtRSCEVF+roDgLl67+wITJ5S9VjzPoB+Y5HdcHd+68EDJ1qIUPxw+mjw6U
         CwXKTcYhQQcwINUH3QjtH82yP9BlBipnBgLqi/b8iw0ih72QevXS87Mtwxnmihu+/DaU
         RaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736479; x=1741341279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnSNXJUHBXvGzpVRG5KhgAWl885WHp27TpnkoxblTDE=;
        b=eusd3d1WTskpwH1eAFFpTl/YV9C/1JLRJEK4RIJoiScmzhR1q0zNWbqBm2d6WKUgvK
         NC1k6PqqdeDfvD4uUHuz1iAm18Fr0qqxCT/MyF/frfOnazvAovGOL5z+G81cJD61Av++
         htMjiksOmbIgdIxeNmPDNjFiA2ACvG7rAh1mLZ4Rn11c0AeCvRG9o4ghj6A95MWFvco2
         CS8g/Pd/teWHdthRlnF3gjw/NB+BS4GADnjzj0TFyzuIcCrjUdBG66H7CJMfflyy8QB8
         QBB65IsvPnCQnnP1BfdQlWgPER4zVDYVcN7RmgvdaDiedR4CvVKX5FPwb5ar2cH1hqx5
         yvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB8ecBjpm6zkqR4ip8j3pld89OnniFZA7u70aIie6caSwbnvRXnF3f+4sJPPgoBLCrslwoqso18vI4HBe6Gs4P@lists.infradead.org
X-Gm-Message-State: AOJu0YwHwtrSjUeYZtlPtE9MlI0vLa7WzxHFGAXomRu5AzNVD3wzMmRH
	Bl/kD5347EHDddTX73eF7A8BTCJGDctdFDnCoUaXZRfxIPf0aUfNUWZfW4i8wQMnAX8Od1x72Ip
	qDRO+fIIIzXxJgdMZhqvqno4g5BM=
X-Gm-Gg: ASbGncvjCTVB2rePgUJc+ijaZFK6+jxjDSCROs2fFvvla6y0desOwv5RHUqpDfKbcTB
	EC017Rosz5HzrJVGdsFx4nbkwYYdSYu5dYWznL7bwlorzZQLunwjUCZ5Xl6jlp6miapnw4XD4SE
	/z7QIiGSw=
X-Google-Smtp-Source: AGHT+IGw8NvEA4HXOWd3rIajp2/eYgmEUIZNbIrBrY8Iu6/IP8jSbJYy+8uslfAXjg82JCBbu4fs1sAGNeU5oaGcBbE=
X-Received: by 2002:a05:690c:6004:b0:6fd:2ed4:14a3 with SMTP id
 00721157ae682-6fd4a12a14cmr33364597b3.28.1740736479127; Fri, 28 Feb 2025
 01:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20250226121537.752241-1-dongml2@chinatelecom.cn> <20250227165302.GB5880@noisy.programming.kicks-ass.net>
In-Reply-To: <20250227165302.GB5880@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 28 Feb 2025 17:53:07 +0800
X-Gm-Features: AQ5f1JoWhySTPkmaj1qPnc-nYUSHeu6CY0uMl7WEtgQouXZ_IyO9LsWxEjtp3pQ
Message-ID: <CADxym3YCZ5dqXMFesNaAF_Z2EWWCj0bJyKQ+BnNw2c=g39CRFA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] add function metadata support
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	mathieu.desnoyers@efficios.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, dongml2@chinatelecom.cn, 
	akpm@linux-foundation.org, rppt@kernel.org, graf@amazon.com, 
	dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015440_606480_A2949CCE 
X-CRM114-Status: GOOD (  19.51  )
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

On Fri, Feb 28, 2025 at 12:53=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Feb 26, 2025 at 08:15:37PM +0800, Menglong Dong wrote:
>
> > In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hol=
d
> > a 4-bytes index. So we have following logic:
> >
> > 1. use the head 5-bytes if CFI_CLANG is not enabled
> > 2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING is not enable=
d
> > 3. compile the kernel with extra 5-bytes padding if
> >    MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are both enabled.
>
> 3) would result in 16+5 bytes padding, what does that do for alignment?

Hi Peter, thank you for your reply~

Yeah, it will make the function not 16 byte aligned, and this is
the most pointer that I hesitate in.

In this link, I tested the performance with 16+5 bytes padding,
and it seems that the performance is not impacted:

https://lore.kernel.org/bpf/CADxym3af+CU5Mx8myB8UowdXSc3wJOqWyH4oyq+eXKahXB=
TXyg@mail.gmail.com/

However, it may have other effects if the function is unaligned.
I don't know either. :/

Do you have any advice here? Such as, we'd better make the
padding 32 bytes instead in case 3 :/

>
> Functions should be 16 byte aligned.
>
> Also, did you make sure all the code in arch/x86/kernel/alternative.c
> still works? Because adding extra padding in the CFI_CLANG case moves
> where the CFI bytes are emitted and all the CFI rewriting code goes
> sideways.

I tested it a little by enabling CFI_CLANG and the extra 5-bytes
padding. It works fine, as mostly CFI_CLANG use
CONFIG_FUNCTION_PADDING_BYTES to find the tags. I'll
do more testing on CFI_CLANG to make sure everything goes
well.

Thanks!
Menglong Dong

>

