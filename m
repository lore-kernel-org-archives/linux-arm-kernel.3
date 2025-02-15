Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 03:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1ke7H8+M8yCjXV+9PJPO/6rsexf+VnewbpjFFNJVx4=; b=nvmXUEMFOg1a9/00SRE6gApKEX
	sqke1gUpq+qwOxSSX1G6Pmx/PkMo2+o+nsC6+E9izntLe5oYvMscjyH17epuDdskwaCvJASy9nuid
	oq+Fpruhe3HeR+6Zrr+w73x7+2ijuflLMmOZMZhak5To9I7cuaOn+njZZ/n4a6JmNEAi9kCesCnP3
	Qt+hrS50nhrenWZ32dkQ1F6NotgJa8Yroc19ZKsvD2hsubtbCQG8beadyhJg0QsHbU4PZoCQjirGK
	umaf32RBadqFLVGg2Zxyt0hikJcHOPx2hlBadCZrZoeBDvcHYF3gj2Er8zXwOZzofC/r+8lkeAGlv
	8vzIhdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj8VA-0000000GslA-0cqf;
	Sat, 15 Feb 2025 03:05:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj8Ti-0000000Gsdb-2xrO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 03:04:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43971025798so344245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 19:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739588664; x=1740193464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ke7H8+M8yCjXV+9PJPO/6rsexf+VnewbpjFFNJVx4=;
        b=E7RjKmTFjIHxGtNR/Fsd5C9HRSE2iSJfjNU+XBLFseNZrOL6Lvc766v4QkRncnE8DZ
         EvELnSavt3RaJu+eomU3LHRw49BSMzf/fZQIZenTZmcvylz2ab+EFASWHsQkXl/8oOkp
         7sg76JaiabPKKk1psJ+aKl89E0yieuqhDcfFrDdK09TgYWiOOFkV/thIwNMiO22imfFR
         iUaoS4qho2Db7Y0WeKZmeEGsEbv2AZ5OFRQF0eoLlef7qFopEmTTgyCHBEbP6WKSFnjb
         +YX6XdPlsBVv+tom7G/Hadel6XnZBirFvz504Qf7zyVh79lJgUBQBkFkMppoWJYU3DRv
         +BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739588664; x=1740193464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ke7H8+M8yCjXV+9PJPO/6rsexf+VnewbpjFFNJVx4=;
        b=OnPpIrS2UD3uZ+/ipIrUOMZlFDo6NNolMOSVewaawfX+o3wUBb4SGI98nqAivfGfo4
         E81LnZcbEybeNRKNP9QpN2JnPvMesDtOV24sgxRkjuWVS8aDMi8hfRhPTwYAGlJjaSoG
         3WACy1DShsl0ziLcIHmPnVy4CjIqsc1eOb6F9NxQU0kkEYHNQkXCqTjiZxCjYfHm5NMR
         henL7zsReVTdcWYx9Mpmto4KYl2j/KLsV0mBYdMIpQOC0kH2q2jeJUa77XvqgwcCPxYM
         9etF2IGOySi2Uv+xxMTUkV9HQl6BNSxbEAK9n+Co3SBMvobWqKfPnDIfR52txMx/bknc
         qZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1OFLLSQGGYW+YvQLF38fnZZ0o698sz6pEwaZcF3jCBC7MDOhT+DSR4ISsheaK0PHiSxo2l3E9JOIU5KPHIZP@lists.infradead.org
X-Gm-Message-State: AOJu0YyZI5OKt6X3/65bmQ0oM0IQozwB0W7DlH73WcfyDW1xNGQ/Zpj1
	K6AkgAC85Z7CDYCxq56CWIBo+X3YTpGEVBqY+kvzyuFoy89BlzbqM4mPG4wjnS2GTr4J6EKpWVX
	s/sUvPApYKlsPj/2Fdy5TQtGYzKM=
X-Gm-Gg: ASbGnctP/2gHhzMqt3m7LNGOVE0ohs5DDPNLLeq5ZZDprmOtFjWR5ONRXJgSStic+wV
	9yAm76oeVz1stPP85sOGymCBIZKfkpFLkl2/uiZs24ffeUvFKdvEJlik6ZsZmNLTJNVR/947B
X-Google-Smtp-Source: AGHT+IGDmDaemoeZfMeIUnkaZyc8p3ts9pgGPm4BMDfRwRIGcfPCqXQEOelUoI+XwIc4D/xg+4rdj4ZLSWD9udHVlGo=
X-Received: by 2002:a05:6000:184e:b0:38f:227e:6ff2 with SMTP id
 ffacd0b85a97d-38f33f1c711mr1918249f8f.14.1739588664456; Fri, 14 Feb 2025
 19:04:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com> <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com> <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com> <Z60dO2sV6VIVNE6t@google.com>
 <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
 <Z63aX0Tv_zdw8LOQ@google.com> <Z6_9LgfOMeR18HGe@google.com>
In-Reply-To: <Z6_9LgfOMeR18HGe@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 14 Feb 2025 19:04:13 -0800
X-Gm-Features: AWEUYZmlNFZtUB1WliSaQIbmQErfRpNsKDqUO-NqyAwWdkRImN9BdvQxTrZQ4H4
Message-ID: <CAADnVQKZ=pjXjyzB8tJj5Gen4odcj5H5JhXyRtVgphTEDCisTg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250214_190426_746461_09BD01B1 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, Feb 14, 2025 at 6:34=E2=80=AFPM Peilin Ye <yepeilin@google.com> wro=
te:
>
> > On Wed, Feb 12, 2025 at 09:55:43PM -0800, Alexei Starovoitov wrote:
> > > How about:
> > > #define BPF_LOAD_ACQ 2
> > > #define BPF_STORE_REL 3
> > >
> > > and only use them with BPF_MOV like
> > >
> > > imm =3D BPF_MOV | BPF_LOAD_ACQ - is actual load acquire
> > > imm =3D BPF_MOV | BPF_STORE_REL - release
>
> Based on everything discussed, should we proceed with the above
> suggestion?  Specifically:
>
>   #define BPF_LD_ST     BPF_MOV /* 0xb0 */

The aliasing still bothers me.
I hated doing it when going from cBPF to eBPF,
but we only had 8-bit to work with.
Here we have 32-bit.
Aliases make disassemblers trickier, since value no longer
translates to string as-is. It depends on the context.
There is probably no use for BPF_MOV operation in atomic
context, but by reusing BPF_ADD, BPF_XOR, etc in atomic
we signed up ourselves for all of alu ops.
That's why BPF_XCHG and BPF_CMPXCHG are outside
of alu op range.

So my preference is to do:
#define BPF_LOAD_ACQ 0x100
#define BPF_STORE_REL 0x110
#define BPF_CMPWAIT_RELAXED   0x120

and keep growing it.
We burn the first nibble, but so be it.

