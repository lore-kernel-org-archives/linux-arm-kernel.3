Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565FBC021A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbm99omdbeF2OrhsawYuDgrANSK6CWJAaQSKOaxjXj8=; b=1IZD+f5WjJvDTwRcp+2lXDqcsr
	RtunAeo1mLs7TLlB3V+oCp55ssWnxh+EwW7h/4C29g2rEbCJoCv2e7Qrx5AN1O8VciujI0w5hXx0s
	IKg5tnWDzu46ileMP8JWGEKlbO8RelajrdjpcTD704g0hBhhVSMzR59rVbOK11NIvhjVLSBOJ48zN
	zEAWpipjC2ozLAGkv8GUvwiAd3Jy+g6+vk4hkXtl5rZx+llcLZmZpFbGuiVWXN6xlYyVcGkHr1R73
	HXGMue2m/yfYnSyLZ07v4T3bF3o8/XJrvbKs1zVP5ZUjzOQbrClvGKvcoAI+AXLFTNDNRITwMn+Ja
	cpustx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSE1-00000009rRf-0WK2;
	Thu, 13 Feb 2025 05:57:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSCa-00000009qyt-1Oxz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 05:55:57 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38de1a5f039so378907f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 21:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426155; x=1740030955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbm99omdbeF2OrhsawYuDgrANSK6CWJAaQSKOaxjXj8=;
        b=Q8Bi59xl/MMgu7qvwC4nByXNZBau5a9g1Xmtc+fWt1OYyzWG37p91GKaUiz9ELxPTE
         WiLWncG1OlXcgBIYo0JE99vTCNCIU9P7Vg33Hiu4c8oIwY4Qffktyt8tXLRUkSsISGje
         iwt7EFqFjqSUdDXNjOPpkTPnK2sfSzfVCOeEUAReowj9nPLsvt3VjwIJRyh7WI7jsWSb
         kfVNgQ29s0oNmXA37WVWWL3HRvxcYZFO6Mk5vHqfrcwk6FQ1d8lL0wHu7P3thMADIgBt
         mkQVP94GvGJ0mWwlKz/6u7G/mxsiSq/qUZVvQpNxBvFWxAFIOcMbI+WLtoXmwzEAbTIX
         lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426155; x=1740030955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbm99omdbeF2OrhsawYuDgrANSK6CWJAaQSKOaxjXj8=;
        b=u5tzBm0dHoA+gS9/ghH5n9NqEGS9LCpcJQK12C1FuYcH/2JhwGbohqks+4kKAMypOQ
         MpGc2iQXnLEhSAW/eRoYqdqXjzGKBoT4NdMWCxR2bqAAUqeKwyEtRLODH1azO+zODfDf
         4LF7bQiUtXW1chJOigU8gagxnaFFPCa92a1nlqmWSrQoOBHsFWM+iRQwIZ1a5Or5HJFC
         XSLdE4kdVdXi6Ip1VXyxilI/6dzy2RFuN/uvyDABpcAlOp4Mkz3vecZa5kmzusNAxvob
         vVYOvQ0QrmWXz7Roucg8RZSGlzCzV7eTM3MKwN49sJEzyxGtF9qaK12WpNKU3cfOJdpt
         cKPg==
X-Forwarded-Encrypted: i=1; AJvYcCU22MyDMpztfjxJTK5QYqf26s343AZLB+2bz6/LmBAQNrO+yZjOC0Idr+TuGjonZEw/IlLIL7+Q3TNd+n4maqdy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9gEX8XafndxLVv1mNTBQdJe1C+UOg/PcGrK5wZfUaPBwV5ZVG
	FCOvKcpeREkotyiN1yL5upmdRqvN80MhFAewmVgjKetSlOY7EUXDU2uDcWNgU2Q9836DOG803Y8
	USe6+eshV4ErU66BlMNqcUwQ3d/M=
X-Gm-Gg: ASbGncsyTHSNHJgk6nKeqeMuaePRJrHEl4xzShTT0ZY8Eon6JFmDJpO/OBg+qxe9WSH
	+Lwvk5rBXGKAvwWKXzvSUD+rF5hI5/WzWmAM937rIG2pAhqBAPXhAJrUo2CponJzc8tTobsHyAV
	hn3bVdgNZ/Ci3ZBrYnLY1EZNVb7ea6
X-Google-Smtp-Source: AGHT+IFawGeeYMbjKz90TN1DtLZr67GxcvjTKL036bBzfPWrntnVydBRlcH1fRJZEIe36nuN+kjX6MDuRC/G3AJdku8=
X-Received: by 2002:a5d:6ad0:0:b0:38d:df29:e14f with SMTP id
 ffacd0b85a97d-38f24518191mr1433002f8f.43.1739426154568; Wed, 12 Feb 2025
 21:55:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com> <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com> <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com> <Z60dO2sV6VIVNE6t@google.com>
In-Reply-To: <Z60dO2sV6VIVNE6t@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 12 Feb 2025 21:55:43 -0800
X-Gm-Features: AWEUYZkMIBfgqn-J1QBcK_dOmAe3QSFRdLl9n0tBkJRYU8-4UpfsqB1hdA59AeM
Message-ID: <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250212_215556_380073_3124B02D 
X-CRM114-Status: GOOD (  21.85  )
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

On Wed, Feb 12, 2025 at 2:14=E2=80=AFPM Peilin Ye <yepeilin@google.com> wro=
te:
>
> On Mon, Feb 10, 2025 at 10:51:11PM +0000, Peilin Ye wrote:
> > > >   #define BPF_LOAD_ACQ   0x10
> > > >   #define BPF_STORE_REL  0x20

so that was broken then,
since BPF_SUB 0x10 ?

And original thing was also completely broken for
BPF_ATOMIC_LOAD | BPF_RELAXED =3D=3D 0x10 =3D=3D BPF_SUB ?

so much for "lets define relaxed, acquire,
release, acq_rel for completeness".
:(

> > >
> > > why not 1 and 2 ?
> >
> > I just realized that we can't do 1 and 2 because BPF_ADD | BPF_FETCH
> > also equals 1.
> >
> > > All other bits are reserved and the verifier will make sure they're z=
ero
> >
> > IOW, we can't tell if imm<4-7> is reserved or BPF_ADD (0x00).  What
> > would you suggest?  Maybe:
> >
> >   #define BPF_ATOMIC_LD_ST 0x10
> >
> >   #define BPF_LOAD_ACQ      0x1
> >   #define BPF_STORE_REL     0x2

This is also broken, since
BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ =3D=3D 0x11 =3D=3D BPF_SUB | BPF_FETCH.

BPF_SUB | BPF_FETCH is invalid at the moment,
but such aliasing is bad.

> >
> > ?
>
> Or, how about reusing 0xb in imm<4-7>:
>
>   #define BPF_ATOMIC_LD_ST 0xb0
>
>   #define BPF_LOAD_ACQ      0x1
>   #define BPF_STORE_REL     0x2
>
> 0xb is BPF_MOV in BPFArithOp<>, and we'll never need it for BPF_ATOMIC.
> Instead of moving values between registers, we now "move" values from/to
> the memory - if I can think of it that way.

and BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ would =3D=3D BPF_MOV | BPF_FETCH ?

Not pretty and confusing.

BPF_FETCH modifier means that "do whatever opcode says to do,
like add in memory, but also return the value into insn->src_reg"

Which doesn't fit this BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ semantics
which loads into _dst_reg_.

How about:
#define BPF_LOAD_ACQ 2
#define BPF_STORE_REL 3

and only use them with BPF_MOV like

imm =3D BPF_MOV | BPF_LOAD_ACQ - is actual load acquire
imm =3D BPF_MOV | BPF_STORE_REL - release

Thought 2 stands on its own,
it's also equal to BPF_ADD | BPF_LOAD_ACQ
which is kinda ugly, so I don't like to use 2 alone.

> Or, do we want to start to use the remaining bits of the imm field (i.e.
> imm<8-31>) ?

Maybe.
Sort-of.
Since #define BPF_CMPXCHG     (0xf0 | BPF_FETCH)
another option would be:

#define BPF_LOAD_ACQ 0x100
#define BPF_STORE_REL 0x110

essentially extending op type to:
BPF_ATOMIC_TYPE(imm)    ((imm) & 0x1f0)

All options are not great.
I feel we need to step back.
Is there an architecture that has sign extending load acquire ?

Looks like arm doesn't, and I couldn't find any arch that does.
Then maybe we should reconsider BPF_LDX/STX and use BPF_MODE
to distinguish from normal ldx/stx

#define BPF_ACQ_REL 0xe0

BPF_LDX | BPF_ACQ_REL | BPF_W
BPF_STX | BPF_ACQ_REL | BPF_W

?

