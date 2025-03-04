Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1539C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfEqBGvtNzR0G45Bk+6Z+AfzCK4ABkw8MT0g5a3BjEk=; b=V0EhsuqqbLy93vmQszQ61zbAYE
	xCpTwSbWiYqOdsT1mqg/LXOYJnR8QhvTwUpXpkmPLAIkRxJF4oPf01oj6Ii6ivon8K/cIw5O/Jn2y
	tGd18ecLe+IQiyGkrDMVi2KtfIaKk7YK1fXReYlyPhTnBVhcR+oC9nphLCcfqQASscg7kXWjbUoHi
	Vne4XiIqWyHRsDFM7kKFNaZlXddys5xiPtwOuTnH3egzEoLUFzmdXMX5xL+ix3H936Rckv6td2epO
	SRj5PYePGyAg4yod1VlFhxZNFWzmDA21EEm7UKeviAn6jaj57gLpCMAEb2qCf5htdnIoxD9QyXy8u
	eg2HFalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGTA-00000002hYD-2dhy;
	Tue, 04 Mar 2025 00:49:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGQ2-00000002h7O-1Jz9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:45:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390ddf037ffso2685497f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741049156; x=1741653956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfEqBGvtNzR0G45Bk+6Z+AfzCK4ABkw8MT0g5a3BjEk=;
        b=OXyxXXmlVcECQaT4zyRMz+pfJq7dKDnasaa0cPa3CWuPkHVaO7Skf3sX7V4aa/vuxi
         WFNTxSThdnr8qW9F0Cmxgus3rfqGP8mNvrcFQ2coTv5Z5ajhAqZ5bljWmsG/BtRdL/Pp
         HbT8LQnSqj3QxJG7SYp/nQ6HcTdYPPYMHpeFhfZOShj5OipHU+rDr+dIKdPIgYgfIqb9
         BP8HH2HrtQlQmqOPjpKtBVBHA+AdtK17vpmDP3e/93OfLhYrHTh0TN+Y6+9lP80kQaPC
         Yg/kAqASMjE4biOPEscI8bH/x1dltRo3WZGPMt8KzW4cZp7LDW+3oAQQ/atzmN6ykz4A
         CgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741049156; x=1741653956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfEqBGvtNzR0G45Bk+6Z+AfzCK4ABkw8MT0g5a3BjEk=;
        b=umrKvAMQr0ladDOyVooRhaAXonEDDTvvIYRvTTrKqrSWnjeD+cojasvi9Nu8Ejhw/k
         39bPvJU1V7Dhk4/g/yop6VaARC6QYpUaUP1zbAd9edr5ZBv/PCBdtyghatqJ+I9uGMV7
         GX7ksDb+2TkirGNIHMGrbJ2D4gB/O0aCNkeXkJaMdGlZhkHdz6xSQh6XWxYITvh5vGf1
         Av6Ra6UnWyEgKm9wDLkpQaGc5XnudIfU9QWYOCdm+jb9tXkNeLFLsPHS2Hfdxc0wjfog
         i61ILT4PwTnq/gYzML8jQjNN1EPJYCUpILUjGRRK9HIxWD7neFYIZ+dPbph202Mm+IO0
         URmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3nnkH/P+fdapoZCP8UBFa4nrluNW9/xR1YQm9C1aqfrm5qvlTfQlD6XeYpU9q55q+N5zj0P4UAFA0s0VcbBVK@lists.infradead.org
X-Gm-Message-State: AOJu0YxFHJBuOyYHnXzCSPpTOzszca4eXOfbfovg2dsjA3Oc6OWicE3O
	yBTf8XsVvq3OhEQgOhEi8YFx9hmrOyN75g4jGIwR7hP57yOiu6wuaf2exljJfR/+NpIH4gIKM6C
	z0JNLaX2h1tWtBpAGFZPdoo1tCi4=
X-Gm-Gg: ASbGncuU8VawHyvwnWv5Imdv6IKcjzHs8hqjpJhuN9FOnbAA2UvVr9slMNuKZLwYVi/
	HgvcizeNn4EZYIWxwgcZ6guDI2bU2GqR2YbgVs+OEGsZ1MKaVQZjJ1YfDS+08YV1lu+VLxUdLAt
	GUFeHOl7vzYuQVJMFcvnf49YTR7AS2K86GGONH/tr/vA==
X-Google-Smtp-Source: AGHT+IEeCQOoKVLy4aSX1gkhOY/8NCtlxOej7jcHLIrdLW4wuHtUOO9CoIgsFDaGt9gEKcs42bRRcl7/VDvF1Nuu3vQ=
X-Received: by 2002:a05:6000:2112:b0:38f:6149:9235 with SMTP id
 ffacd0b85a97d-390ec7cba70mr13100812f8f.16.1741049156403; Mon, 03 Mar 2025
 16:45:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com> <b0042990da762f5f6082cb6028c0af6b2b228c54.1741046028.git.yepeilin@google.com>
 <CAADnVQKX+PoSUqPBB2+eZrR7wdq-8EVaMxy_Wur7g8wyy3Dcmg@mail.gmail.com> <Z8ZL1L69z8XWm8vl@google.com>
In-Reply-To: <Z8ZL1L69z8XWm8vl@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 16:45:45 -0800
X-Gm-Features: AQ5f1JqY-QHGbRkFB0PZC5Se3XKsPl7QHq1ktYT5k72ZsvNzYpgqlyxSmJn0sLk
Message-ID: <CAADnVQKB-9q6fxcVPbd7Ee+QBH=_ySv2EyULkgFhv_n2i07L1A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/6] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_164558_375932_F343CC18 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Mar 3, 2025 at 4:39=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
> Hi Alexei,
>
> On Mon, Mar 03, 2025 at 04:24:12PM -0800, Alexei Starovoitov wrote:
> > >         switch (insn->imm) {
> > > @@ -7780,6 +7813,24 @@ static int check_atomic(struct bpf_verifier_en=
v *env, struct bpf_insn *insn)
> > >         case BPF_XCHG:
> > >         case BPF_CMPXCHG:
> > >                 return check_atomic_rmw(env, insn);
> > > +       case BPF_LOAD_ACQ:
> > > +#ifndef CONFIG_64BIT
> > > +               if (BPF_SIZE(insn->code) =3D=3D BPF_DW) {
> > > +                       verbose(env,
> > > +                               "64-bit load-acquires are only suppor=
ted on 64-bit arches\n");
> > > +                       return -EOPNOTSUPP;
> > > +               }
> > > +#endif
> >
> > Your earlier proposal of:
> > if (BPF_SIZE(insn->code) =3D=3D BPF_DW && BITS_PER_LONG !=3D 64) {
> >
> > was cleaner.
> > Why did you pick ifndef ?
>
> Likely overthinking, but I wanted to avoid this check at all for 64-bit
> arches, so it's just a little bit faster.  Should I change it back to
> checking BITS_PER_LONG ?

In general #ifdef in .c is the last resort.
We avoid it when possible.
In core.c we probably cannot, but here we can.
So yes. please respin.
I bet the compiler will produce the exact same code.

