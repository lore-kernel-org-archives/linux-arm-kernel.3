Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F4C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=; b=PoJJkPtLB98+27xYxLqlkFT3W5
	Uz0l2cLlj2w0bIY0HgqP4xDUsrHtshCNmzeTrE1ZbxQMcKJLqhWMTk7+0lcSgve1No/vrCaxGZJm3
	hWKAyWBNt6+KVwLwT3mgl/lkfGDNWP0CbuqVhYF4T2D5YPL/iP7LT88ACo+kDpR04mffTEjfwnwrZ
	iFv0I7zsBIcEUzoUyKeO4CTgu/iQHxYlP/4WmP5/URGyC5GsL1nG9Y94p6mOF3foa3nEuHXOnODTC
	Ol1YwGMMu/ek0aQ4IXNsH0kHQ0VeqhLlgArkCF2G8VyUVVe+39+JbYQLTroE0HdPEKdnw304lfPAH
	M+dT9EDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc5I-0000000HSD1-0TCg;
	Thu, 01 May 2025 22:08:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc3N-0000000HR1c-26PK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:06:50 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so2157725a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137207; x=1746742007; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=;
        b=nNlbWJOdPTwMIxvalio9jhtafmDGlaEKLFZuQaOnaH5zSM7VRm6fb2PaOAT9Eqy6tb
         +zd+UbGOkTnS8t7h8ei6wyYahhhr/yIwj61k/vqdK027nlSMDqtwm39Q74cGUHRaJBrz
         niiKAusGYFsoMkqZDoVA2ZXD8fCEghRXz9RxZx3FF0+oZXY79vKLTV4FOa3xpvUKFGzA
         RCGrTtCBLEhzTI5uEOcRHhuqh1CB7OzF86hVM5a6S7+oy39vCGuLLswOyl96JGwMU/cM
         DtC6hxm2+P5q9fIgc2OtvKpa+eMGONtoyA5fD1Iwe7mUxwCSF14Hs40NJYufN5SUGWWT
         sNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137207; x=1746742007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=;
        b=hRhm7YrZjz8uCfB0Eduz8I/VJrqQ/mw5ZPArODgElhyV24K2M/wNQjSOlM8M/jFQ+b
         zh6vBjqQ7qxgy/fVrw8I4MIFg7ZTai0QYYDolcz3jPWxReyoGSoGobUxEXeulOwNr7uJ
         Swlh3lBcmmbDim04r8D21eHwOEAWehTSOmxLz2Kf08ZzlXLYNZGQpXAztNKough7S6l3
         1HhhOssug7JnIJJRNegXnGSDlH8x1Ky5+KV7m4TsCjQYJWyTQKyKm8xGxcPkjl9UW3Mu
         eLaLHuzhRsFRGDLGgkkCWwqaPJOkPmnpZV5k5PLGOhpAPnl1QMcOjHvZnAqld9VVw8YF
         HBMw==
X-Forwarded-Encrypted: i=1; AJvYcCWKEUy5wKrVwXpaDjFnomiXQRPpAp8g0RGwlOZRqwUIzY+Dq99mE+2gG8/a6fe97+OFtaT3YUo5QP50F6OiHCmn@lists.infradead.org
X-Gm-Message-State: AOJu0YxEMWeMS7CWRpxBDjqfjQGIsrhHyr6OuUhm1KI+tdbSjIJ32uSX
	iQzYAjbcPU/6bkIXYZbdvc0wLU2W3NxTKk8pHHtXzSHwfwq/X9hcIgLNiFaAMQRy071vywIjQvl
	wtoENK74s/ZEwxp+oLw91mXw8OjQ=
X-Gm-Gg: ASbGncvx4oyBM4qKJJ4l2E0pP5n6X+SahGeHUnVzyb5xrOFkPg+wRPerSClwlQ5GiIq
	gHya8RkbMrfdpk6WNIGYxpiHTTV2ZmEuRsreo1RbzqWarXQL10m3+tRRiLaGS9ymohR9FnWw4kN
	e0hPhyUHf9OjyOWUeErYjYsKfMNsD8iFFFa3jxeBWM7csHk/eKjM6qNQ==
X-Google-Smtp-Source: AGHT+IFdlZgpJIIOZwmEjMJEBEmVCQHnSyA+ervJFsjlZ4P4vNdH66g4BiTBr5V5jAKGV/k1Wwx3ddRiGr22IKP7V9w=
X-Received: by 2002:a05:6402:90a:b0:5f4:d572:68a with SMTP id
 4fb4d7f45d1cf-5fa7801465dmr256726a12.12.1746137207142; Thu, 01 May 2025
 15:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-3-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-3-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:06:10 +0200
X-Gm-Features: ATxdqUE3JDqCne76-GBuIfwNJ48-dE9we8FlVLpDVL25L4gVtlMzRXX74KP1XKg
Message-ID: <CAP01T75pdQCFuMpHq0tB6DLs0xdmS9nqMMp5hfq4z2o3-e1-5Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into do_check_insn()
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_150649_542373_C90F58C8 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu, 1 May 2025 at 09:43, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>
> Eliminate the regs variable as it is only used once and insn_idx is not
> modified in-between the definition and usage.
>
> Still pass insn simply to match the other check_*() functions. As Eduard
> points out [1], insn is assumed to correspond to env->insn_idx in many
> places (e.g, __check_reg_arg()).
>
> Move code into do_check_insn(), replace
> * "continue" with "return 0" after modifying insn_idx
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state = " with "*do_print_state = "
>
> [1] https://lore.kernel.org/all/293dbe3950a782b8eb3b87b71d7a967e120191fd.camel@gmail.com/
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

