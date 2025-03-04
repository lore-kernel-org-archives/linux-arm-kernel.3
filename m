Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76BC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJdTuc12hE8xNboldJDtY0tNQVyNe2iG7pRWAnla1E8=; b=b3kgTZrjAVij4rLwu1074iAjJg
	dmBCbxbSiRLTgQeQLrbCFLM5btUFG6AGCESXdof1pBbLrtIQrTEOcvDwJBdds86EmleXthog3mNHH
	fvMeGMmXkAMoaUVnQ4vjhrfRBdoJyc9q/dkRVqC6dHjQofqNfAzXxF1uOKbPu9ZTjdzPx66gVbCIi
	tA8JZqI171s0qSI9CtRSpDRWQqWivZqQj0ysHcfWhihe2HYatW3dSFtaucNG8xoaubFDg9n9Vur9Z
	w4trHUceKvp6oupjJVpmNxny2+O9ya6D8viFu2eJI42SE098/1hrRZRQkKz9Eh3J8PAkBz5gFPj4Y
	Fo6sO1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpIfa-00000002wtc-2d4S;
	Tue, 04 Mar 2025 03:10:10 +0000
Received: from mail-yw1-x1142.google.com ([2607:f8b0:4864:20::1142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpIe0-00000002wgX-1u5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 03:08:34 +0000
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-6fd65f1d262so19028927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 19:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741057711; x=1741662511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJdTuc12hE8xNboldJDtY0tNQVyNe2iG7pRWAnla1E8=;
        b=kk5OjUKWICmAiIuvhMJzER10HC9BBJCIlzCbzt8Xkc37Xqk6mf6dPZCL5vqBK/mvCo
         HOTFGs1Tut7E/K1HXdNEPCCQ/n2h63seFkRRo4y+cZWc7e210DaQjqVZ1/0oAW2nXrVe
         DMZ8R4ilRGjx4IznbP3n/j9jQJpnsQBugmojHNCFyYlYaFRli6y0mw7Z82OPhMfB82uz
         HktGhmJeBvhmlsXtFoLtJ4ETiMkEaI3xcAMpEczYDYNjbV353QfD/XYIvHpvLcV59dAJ
         jONXThZYGVDxIo1zY2AeaPvIyEDTmWlW9ZQxLXYoNuaBf62s1LK+fzs3dE9ypedUstSG
         wioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741057711; x=1741662511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJdTuc12hE8xNboldJDtY0tNQVyNe2iG7pRWAnla1E8=;
        b=jiGCoN7Xs6uY1i/4yHFqD7NBLaYgJ15bX8WS6JZm+3CbEzxpfz7DUFue0ijjR1btT1
         kSuiJEhA37mJhe/dgv/3XESkiRxQm8Dqj0win6EbpR8HiBc0Xu0GJNtCUPdMZ11uMtWJ
         vC2TLV5K0t9lVk7G1PPtPp4WvUVLYhiX5cwDPC1GHA8dmrxPhhWNyqapoyEkubNh19NU
         GpRaPPFoCjjx1Od96ervf5DlcFAwUm/X9FVUb069LXreqFmBPsGT6TaOdpQ5r393ZZ/I
         OZEfZY+Q6vxEB2EIQhO6GzReVV0cFd8PtDsrp3im09pqb6KkNSQTBwjrexnb83wchVt0
         SRYA==
X-Forwarded-Encrypted: i=1; AJvYcCUSFrin6QjtEpmbfpvu7TTDTpuvIwSlvbgRHHz8qQ4w/rIYWkdq3Jvd+XSdSBd0Yt1wgLGyioPhkWYmwk34Rvv0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHNEMZdVh+nMBp3a3iBJ4vG6FUZA6I8D59P2HIoQ5x49g8vDjt
	axqgKVImNx59EUz/CzTZLqtvbMqSjr93GCectRiUwSzYLuC2XKAX48fCtAobCltY3cic5mqvbEH
	T8hPnWSVvmuaIaxhOt+m0GB7hQSg=
X-Gm-Gg: ASbGncsyt0b+4qga/ddKausDuPyhBV9WL2nEuYJECHeyDy+OYuVGGjfBRM1wdgkDPSV
	+2JMXMak64HcAQnPNNEdNfRaQc5g7FKuZUT4Z+UPR44S182pJ20fL+Et2RSrn+Rro+7rWnfWwe5
	f8KvIjI7+98x5FFv5cYphvhvmdEA==
X-Google-Smtp-Source: AGHT+IGjpE37/D8VFUXwtx1+vTlIBKGMhPsHyscBlEpff0BYVERCrQfJXRrs4afpX4s/+1NgBA8mJU+Be8nzIuYC69Q=
X-Received: by 2002:a05:690c:3708:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6fd4a1b56d0mr207861007b3.29.1741057711592; Mon, 03 Mar 2025
 19:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-4-dongml2@chinatelecom.cn> <20250303110559.5a584602@gandalf.local.home>
 <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
In-Reply-To: <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 11:06:55 +0800
X-Gm-Features: AQ5f1JrQ2Vfag3gyvkNKHuCTcxmUnHFiO3c2filqEDv803CK-Q1LsulYa_DCrkw
Message-ID: <CADxym3bNxGb-FPtkbjiLfEXBRnVT7HBM8nbQBWvcHoLhYrKKgw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] x86: implement per-function metadata
 storage for x86
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
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
X-CRM114-CacheID: sfid-20250303_190832_496026_B7F8FE34 
X-CRM114-Status: GOOD (  15.22  )
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

On Tue, Mar 4, 2025 at 10:07=E2=80=AFAM Menglong Dong <menglong8.dong@gmail=
.com> wrote:
>
> On Tue, Mar 4, 2025 at 12:05=E2=80=AFAM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> > On Mon,  3 Mar 2025 14:53:44 +0800
> > Menglong Dong <menglong8.dong@gmail.com> wrote:
> >
> > > In the third case, we make the kernel function 32 bytes aligned, and =
there
> > > will be 32 bytes padding before the functions. According to my testin=
g,
> > > the text size didn't increase on this case, which is weird.
> > >
> > > With 16-bytes padding:
> > >
> > > -rwxr-xr-x 1 401190688  x86-dev/vmlinux*
> > > -rw-r--r-- 1    251068  x86-dev/vmlinux.a
> > > -rw-r--r-- 1 851892992  x86-dev/vmlinux.o
> > > -rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage
> > >
> > > With 32-bytes padding:
> > >
> > > -rwxr-xr-x 1 401318128 x86-dev/vmlinux*
> > > -rw-r--r-- 1    251154 x86-dev/vmlinux.a
> > > -rw-r--r-- 1 853636704 x86-dev/vmlinux.o
> > > -rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage
> >
> > Use the "size" command to see the differences in sizes and not the file=
 size.
> >
> > $ size vmlinux
> >    text    data     bss     dec     hex filename
> > 36892658        9798658 16982016        63673332        3cb93f4 vmlinux
>
> Great! It seems that the way I tested has something wrong. I'll
> compare the text size with "size" command later.

With the size command, the text size with 32-bytes padding is:

  text    data     bss     dec     hex filename
48299471        14776173        18345936        81421580
4da650c x86-dev/vmlinux

And with 16-bytes padding is:

  text    data     bss     dec     hex filename
46620640        14772017        18458396        79851053
4c26e2d x86-dev/vmlinux

It increases about 3%, which I think is acceptable in this case.

I'll post the message in the commit log of the next version.

Thanks!
Menglong Dong

>
> Thanks!
> Menglong Dong
>
> >
> > -- Steve

