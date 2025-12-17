Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1468D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkxIo5NSMrkuDEwiHD51bssSH7j42qmURAvChq3iZZY=; b=lleDNPaloVqOvF8vPUL2ip+QsP
	7fIccAyFKiMA8x2yYDU+ilqy6GU59cLZ11GsUZ4QQx5g82hBYhxCuKPm1AeB3bJPccGBFBVCV/PEw
	Rq95jltrnJ3u2Ya78/kJBwMUX4v1sVumFyUWwsf0t+HOUtmThQJvgdMkLBKDwj6ohWX72E6fMuDYj
	zCUiDiKm8hY/9UpzL5Jhe2jZTAzAmNerpzfYanzXabUCDGYmKI0LpcRl07cnj0HiUoAEQeTNetW8o
	7HJMUGmwfx9bAgzzkT2l4N41U2JCGraCOdJ2B05jrsiKhHVfnP/Pm1j+Tf+JAAq3ifE4pFguympgp
	IHF1C/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwZ0-00000007Hzp-1cid;
	Wed, 17 Dec 2025 18:47:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwYx-00000007HzM-1PE7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:47:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2965666f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 10:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765997269; x=1766602069; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkxIo5NSMrkuDEwiHD51bssSH7j42qmURAvChq3iZZY=;
        b=RcV+YWIqai00H9E/2SNoqv2erJJCPGE1GmltedDftefnHpxRJLZ3GOvD9kruVqPI6J
         MDtBLuQML6UbcVzH7TtOLEArIPZu60ZC9sHkRh1y901pZX6HqCRVaL/jB3gRUcIGSEIb
         BkYnd146c2NJBJrmN0HmKVBt9fRGzy1orF8MZlI4YPu9u6XP45MYolpstfL1GYzuO1Mf
         5X9r7INfnh3MeHv3RJG5yRCrp5sWEzKsIVpOn8sUyOpmTIdTKZ3oefq77j6MT6c1XAEl
         6Hzc4OWWOO8QNxSeUIE6IKiXvdF2quSMUZhvtSaQM/gg+a1YF0bkXAYuwymBcghFvteo
         USow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765997269; x=1766602069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TkxIo5NSMrkuDEwiHD51bssSH7j42qmURAvChq3iZZY=;
        b=b1TXwH2JzZXggFwIjVX1JTMtTcXysJhNt3Je+emDlqRhxQtFQV50U7fVKJkEdTamh5
         r06tqYkXfIPF/PaM7MwGhiygTtQDVvCxJEyXibrlaTshvo1eN5frKmoPF02u9lbcKOIU
         NErXHw9FbwJaVjX5wdS7aqnOe+6PAuoywK4cR5gbJTS6hT+OoPiYdCXsFA4D9E0yLeuW
         4nVWtu9dUDRXhs/ScJMfj6/8WJRKVJHxXacSYBJ191iPKQC/JU/2l81U/cXZgBTFghSM
         g7gUBNVGnpsm36Y5bQQ8yAiIJY8bITD/c5a5JnXdYf491yO/FqYt4o8BKhVugYH3PwSl
         8cJw==
X-Forwarded-Encrypted: i=1; AJvYcCUgGqM0r+o2R9ty0rBKsIR9Y8RHbmTEFzauABPcVrq33p2dS4n8K95EhDMDN85vm9Y5WiAsffMJANknN+8qTglS@lists.infradead.org
X-Gm-Message-State: AOJu0YzWyS3L3CrkK19qAQBw5VottAjfCq5WzpVMWTthEF8lwgRreWRQ
	t5eF5hA8mPRI20zWOezMpYXdj2r5fXOiyIjsF4qd+jKT7fyweD9XF24W6a6Ij7cp9HXU7BqG6+K
	GdAs+ETFsHmP+a2IMGHZQsPSxdMxV8Io=
X-Gm-Gg: AY/fxX41ielErHL8P4hDWS6xXU1bb0nckCCsIs3pzjK38Iq6FDLSy6s/GSR6q45wLPa
	f+7k/cq8XwATMSKuZhGmIoVa+RyYPSdm7LbG5glPPqndOPWbdZTQEWXUTzimUYC/uHQRoptfRUo
	oEyulXyZgdIZJ03pF5kDAmfH+ffUXeX+akQncFRSz3xat3W0yBNx+GmFQGUblIeR+RljLY+rWZl
	Xoxsi9AsRdQJnZpNhOFfHx4WOqI+UxsBDgXx0QJVp6zVbKiCLj96Z/SVZHgftZ3ahqiPvtUa4D/
	/H0UiAZ2YHrEacY0BqA4MiKeh/up
X-Google-Smtp-Source: AGHT+IFJsiqlYVX0KDiIUIaDkJwxHD+X80ySLs2ZH2r5tBXwDTydMS9bE1uXqgABAnskb4owz0cbfD5+DrOIQiAyWWw=
X-Received: by 2002:a05:6000:220b:b0:431:9d7:5c2e with SMTP id
 ffacd0b85a97d-43109d76385mr6099590f8f.35.1765997269254; Wed, 17 Dec 2025
 10:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <51466fd3-c837-46a6-af50-28a8336fd8cd@linux.dev> <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
In-Reply-To: <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 17 Dec 2025 10:47:38 -0800
X-Gm-Features: AQt7F2rEhaRGbBhp4Z1T9bFxXJdusQFOZSY_kCb_Mfspu8QsbHtWNCGE_29KUyI
Message-ID: <CAADnVQKHXDcTFB5sJJH6mQpymCY7K10zGSKssQetDc-tfy8eZw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, bot+bpf-ci@kernel.org, 
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Kernel Team <kernel-team@meta.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_104751_390717_6706F870 
X-CRM114-Status: GOOD (  24.07  )
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

On Wed, Dec 17, 2025 at 10:44=E2=80=AFAM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> On Wed, Dec 17, 2025 at 6:24=E2=80=AFPM Yonghong Song <yonghong.song@linu=
x.dev> wrote:
> >
> >
> >
> > On 12/17/25 8:56 AM, bot+bpf-ci@kernel.org wrote:
> > >> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > >> index 2da986136d26..654fb94bf60c 100644
> > >> --- a/include/linux/bpf.h
> > >> +++ b/include/linux/bpf.h
> > > [ ... ]
> > >
> > >> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> > >>
> > >>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog =
*prog)
> > >>   {
> > >> +#ifdef CONFIG_ARM64
> > >> +    u8 rctx =3D interrupt_context_level();
> > >> +    u8 *active =3D this_cpu_ptr(prog->active);
> > >> +
> > >> +    active[rctx]++;
> > >> +    barrier();
> > >> +    if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> > >> +            return false;
> > >> +
> > >> +    return true;
> > >> +#else
> > >>      return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> > >> +#endif
> > >>   }
> > > Can preemption between the increment and check cause a counter leak o=
n
> > > CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> > > rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> > > (documented at include/linux/rcupdate.h:856).
> > >
> > > Consider this scenario on an ARM64 system with PREEMPT_RCU:
> > >
> > > 1. Thread A increments active[0] to 1
> > > 2. Preemption occurs before Thread A reaches the check
> > > 3. Thread B on same CPU increments active[0] to 2
> > > 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> > > 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> > > 6. Both threads return false, neither runs BPF
> > > 7. Neither calls bpf_prog_put_recursion_context() (see
> > >     __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> > > 8. Counter permanently stuck at 2, all future BPF on this CPU fails
> > >
> > > The old atomic code handled this correctly because this_cpu_inc_retur=
n()
> > > completes atomically, ensuring Thread A reads the value 1 before Thre=
ad B
> > > can interfere. With non-atomic operations, Thread A increments but ha=
sn't
> > > read the value yet, allowing Thread B to interfere and cause both thr=
eads
> > > to see the modified value.
> > >
> > > Is there a guarantee that same-context preemption cannot occur in the=
 BPF
> > > execution path on ARM64, or does this need additional synchronization=
?
> >
> > AI is correct here. See below for another thread:
> >    https://lore.kernel.org/bpf/20251217093326.1745307-1-chen.dylane@lin=
ux.dev/T/#m906fd4502fbbedd4609c586122a393363003312a
> > where preempt_disable is necessary to prevent the above scenario.
>
> See my other reply, the above scenario presented by AI is wrong
> because step 7 is wrong.

yep. preempt_disable is not necessary here. perf buffers being
reused is a different issue.

