Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26768D277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/Sig1MBWGXUoKxfbOCjXxu2jOEYhW1igfHgGui3UHs=; b=TobWbNl0jVefG9ePXoFcqNF9OO
	sFPKvTVCaYSCTn/9Rr2nixdeiRqjuaY9jyYs+8Q71fdkIj+g3mt8wrDfNUGMWU/jXLjnrPLM+Q9Fw
	WId2+NBc8pZ+LkZKL+FX8U1QYtDQ+5NipmpbDtllhXhVDfCRzKyuMmCBL8xzltZucm8zU76CKviEY
	klwr6TiwFwlChnjvB5juhnLfQntDFMIOaoXUr1aAGpkGvRvGF236zSh1/hEJub28o7HNAzYR1DL23
	ABbgygAfRWYJFYTWkrfGJAWSeRsOEqCbZ16Y5UKlK4gxP/0oCzpgfUaByDHNRp3pjdHudwbz2MJni
	hBrOxb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyJ-000000038Eg-1Lw7;
	Sat, 10 Jan 2026 00:36:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyG-000000038EK-2pvd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 00:36:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0d67f1877so38758425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768005407; x=1768610207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/Sig1MBWGXUoKxfbOCjXxu2jOEYhW1igfHgGui3UHs=;
        b=FBUOL1AjQ917OvKFteI4BSZLhDIDGvj3Oj/0aycO7Wc93CvZ3YZ7ISqPbU9fWCPJLZ
         kfbg770aUEn7vMF3yF6EJwqJEbIbkcjXmongK1mCMMH3y3P2of2DFaRSa6owsh6ZtsLq
         eW88g1mCSf9HS4k1cU5Cy8NSkhQrZlbkBHXqBY8wU4JSvhKmHEN87TQwWazCDqiEkgay
         fuSUeCBeA79Gks3jgFgWtxA/P8pINL2yKZzI4sHXTmyrOE1MniVYdYzqbkYYBWs2DVa0
         gJY732mzF0lLzGk8y3GkcbkTIYTbV7NP8+guTvpH/mjJeRghbiyOCPDerk1W9Nob4S3c
         qRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768005407; x=1768610207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/Sig1MBWGXUoKxfbOCjXxu2jOEYhW1igfHgGui3UHs=;
        b=qJrcEi8B9AXjkdwMMlPyOO+B6o6uMLtc8Yls3uki24APPwdh/eIAMY9mvlUFqAtFvz
         dCwpNbedt+QKof27dYIBlitnc0HzYPOejDy0rFVD6ifWMy/sWy8x5fSG/oYQCdvwJ1Ka
         Bs6xNeSyS7xxJLoRMslRZcimuHwFCI3Zma1VKM6Db3n9iKirIPY3IM8jvuLPcCcM8mVm
         Enu00/t4fOKUNPD74DomEStGxcm4B1Lw9cLyw8/d+Df9gRIabDVLrN5KVOZ/8+8KJsjf
         Y+dIFMb5FEO/oAUvusGcHts/1UOGQ4hBq+U5rYg6Y+hZas1ebZchQATdOEH3CvRkUet5
         Co9w==
X-Forwarded-Encrypted: i=1; AJvYcCVVJhvwcHiLG3zkhs9dkLiPLR6FgfJ14O6iPemexPZ9+Qw/Zi6nCUMeKOvRFsPZ2wPQyNnBke28naknqEx94Ac+@lists.infradead.org
X-Gm-Message-State: AOJu0YwmT+epa1gSiNiHd1GG06m3oo8T8cUhB/Qh4FDQof3cS9+2p+VC
	nyz3bf90MeDUFjtpZqWVVrrPVlGIUTnYCHwHkAPJoSd5c84QIq+y5irxOWggEzTY1bmt7RPxrSX
	KMHmqR8WBQdisiz/pP7+eovZGgBA42WY=
X-Gm-Gg: AY/fxX7x9vJkKFa5a2qO1PWLdjFzX80zUJL+ncB+ibNsQeyWN7RxjZ8P15Aoi/1bu6P
	Un7FfgyO0PBPZxyvxD4fSCTs8/L/NQhhd63/e2Bks+OlhcMxM7WRutU4o0Mq2zaIJi2lApoxTRp
	WxPFfDIuXWRc1qKU66wsRZh3qOdy7iwH8jCOoa8FLG9kRd5xhc7mqnHSREdAcFo+JvyeaZZQ1ap
	F/QcqiEEOTJ/q0heVGAAxovdVRIvAKQAkXR8REYHknxLC5DSaX1cheSw96QDe0f55SdUa1U3g/+
	ef8zZIH3
X-Google-Smtp-Source: AGHT+IGW3LMlWa2LmuUzjL0YHhtRZgvX3i/6GcmeqaYqFFGz/azPPBWHL55nnnOgoHySU2SkfToBfgTRNf9D9hzsw5Q=
X-Received: by 2002:a17:903:196b:b0:297:f09a:51cd with SMTP id
 d9443c01a7336-2a3ee442293mr104729985ad.14.1768005406895; Fri, 09 Jan 2026
 16:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20251230145010.103439-1-jolsa@kernel.org> <20251230145010.103439-2-jolsa@kernel.org>
In-Reply-To: <20251230145010.103439-2-jolsa@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Jan 2026 16:36:34 -0800
X-Gm-Features: AQt7F2qRw6Vu7cN5U47qL95oQ7_OEFPKSuwkEVWj2hjYGj3mzII7GsGmQwymQFg
Message-ID: <CAEf4BzY6vVCk_XohdYVmjma4k=QvGb+h+rzOe7hmRLoUL7ZXOg@mail.gmail.com>
Subject: Re: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_163648_722051_2D021FBB 
X-CRM114-Status: GOOD (  20.85  )
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

On Tue, Dec 30, 2025 at 6:50=E2=80=AFAM Jiri Olsa <jolsa@kernel.org> wrote:
>
> At the moment the we allow the jmp attach only for ftrace_ops that
> has FTRACE_OPS_FL_JMP set. This conflicts with following changes
> where we use single ftrace_ops object for all direct call sites,
> so all could be be attached via just call or jmp.
>
> We already limit the jmp attach support with config option and bit
> (LSB) set on the trampoline address. It turns out that's actually
> enough to limit the jmp attach for architecture and only for chosen
> addresses (with LSB bit set).
>
> Each user of register_ftrace_direct or modify_ftrace_direct can set
> the trampoline bit (LSB) to indicate it has to be attached by jmp.
>
> The bpf trampoline generation code uses trampoline flags to generate
> jmp-attach specific code and ftrace inner code uses the trampoline
> bit (LSB) to handle return from jmp attachment, so there's no harm
> to remove the FTRACE_OPS_FL_JMP bit.
>
> The fexit/fmodret performance stays the same (did not drop),
> current code:
>
>   fentry         :   77.904 =C2=B1 0.546M/s
>   fexit          :   62.430 =C2=B1 0.554M/s
>   fmodret        :   66.503 =C2=B1 0.902M/s
>
> with this change:
>
>   fentry         :   80.472 =C2=B1 0.061M/s
>   fexit          :   63.995 =C2=B1 0.127M/s
>   fmodret        :   67.362 =C2=B1 0.175M/s
>
> Fixes: 25e4e3565d45 ("ftrace: Introduce FTRACE_OPS_FL_JMP")
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  include/linux/ftrace.h  |  1 -
>  kernel/bpf/trampoline.c | 32 ++++++++++++++------------------
>  kernel/trace/ftrace.c   | 14 --------------
>  3 files changed, 14 insertions(+), 33 deletions(-)
>

I don't see anything wrong with this from BPF side

Acked-by: Andrii Nakryiko <andrii@kernel.org>

[...]

