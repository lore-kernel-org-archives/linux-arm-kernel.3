Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD51C02193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDdq98Gh7Xfi0KmBSzMAzs+26xmk/ObqN/JvexcpXFY=; b=Z7KXimSVRi63pjGdfixLsGOUAK
	vzur9mBWFUKNfxxHKjjNdqw5ra1ejCTBIViYqUPVhqoyu5OfHQVs8C5nUIEQyrn8TrXQP1E5XObGr
	QD8AxN8kyvNsoK9x5UGGMvzbewUBaSsRwg4AcPv64WrO8bM1qTBNFssSrE7GuXzNpEAme4Ud4KOU0
	Gj9NKkShURjW///wDvQ2ZRMps/RfgPiLaOI6GL3oNolVmW9dXNy3TxGBvt0tDBEdAzrEl/XPHdTaf
	/WKlHvPsfnJMxQpwtUqbuYtOs31gbs5zhiTFAeA2bamilW72RucBJIVCx9ct2Lw/v8aTz9P3p2NJc
	ZSyuYo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIgd-000000080oy-0Abj;
	Thu, 30 Jan 2025 00:45:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIfH-000000080gb-2to1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 00:44:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436202dd730so1187525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 16:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738197854; x=1738802654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDdq98Gh7Xfi0KmBSzMAzs+26xmk/ObqN/JvexcpXFY=;
        b=fxdjE+QWZ/JRxK1cxIqe2aUsi+m6YxgzQQdVLiRtgXqG7/f+UxQGiLOgw3MV0ahH9c
         LbJPtMTePC4FHURHQDTUoLUHtekl7RoxAIm8LADtLmZNy7GDh2mAIZxcHBxsXBC5Z9n8
         GyMn8/jvfLC9DCzew/v4BgILxsW3CI/aAyB3sdTonRjWAy6ZCLAbWT/DmcYew+BrdadW
         7CEJHVP0BaFW6x7/hhT4Rr1UUnNmXWJzAd47Y179mYu/lNhKVounr5xbJEowVFfQCo5O
         4qumwYootvCAd3FxieO9GL//bvBAqKEC4NOAgrSCIx2I+4Wed8tRMT5EVbwPKR9PENHB
         DkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738197854; x=1738802654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDdq98Gh7Xfi0KmBSzMAzs+26xmk/ObqN/JvexcpXFY=;
        b=AJ3/HkPoE1Qmb0fmKFTJQuhKbD15i12A1Lu0FPhcuWtmFqLd8VF1YqcJ4MEwoQeTQR
         cLULfCVomXywYvQEQBVpgBQGd/OOm7yObO+6qb4w7Wz7WsR10UrlChQxBy0M+wUwLoro
         S7M93xqxC/6tIu3gKDxQVgeMYSY0FBD0T5eGpAB13VzNyF47qt1bur/acnuy5yxDZjwy
         0oi3NJ5Pmvw2Kg6eoPkPlgR23NmWXDbuRA8G6L83r8Ngu2apPAve0+2SerhMfFQhfSxt
         RmB3c8R4i7M43KoxuWr+AEmGZqhQRl8U8y+JXMm2pdiBG/FpkbBk8E1WmDx22nJqoMMc
         iTIA==
X-Forwarded-Encrypted: i=1; AJvYcCWu/UvP04m0NQW+C1Gco3Hcmz1f+G5age3FT0whoPlrWer4JSt2yGDZBGzR0wEy3DueO1bOMFxY+YbMU9YVLQjH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0KHBPoMY7UhMpwgraxvH7Zs05W/Gt/uno2Z+vhYHmC9hO7kL
	GAB+C96IjVHRKeAKOcAeFxD+uGJLvHmGxhlB8CXa6t567ufaQpB3cOa65OwtI5mdC0yopBdkdtb
	0v1weFNFPUkU4RVhFYZcIgLfGMhY=
X-Gm-Gg: ASbGncu3hm6C4mdNwvn3YMpV3rbtG7d8EYmmA3J31j9vDmx+MbDB+jte22waCdM4HhE
	yLPNLfb07oTpSznjG+HaV1jMn2BxdtkmFobEEE/RyDZBq4eNOo9YC/zC0B9z6an/BH97xDnRltZ
	PwKIbP+FrNv0SSfNqQaS1NwJwwpYOW
X-Google-Smtp-Source: AGHT+IHTLpXG7F4IZvOw/5VhGKAERdVN2MiZZzoHY62PwcyimSgN2x3uMVyYZlnuvhHLYbjSsVpLTrZ8VBD7M5rpjNA=
X-Received: by 2002:adf:fc87:0:b0:386:3dad:8147 with SMTP id
 ffacd0b85a97d-38c51b5dd7emr3335812f8f.32.1738197853781; Wed, 29 Jan 2025
 16:44:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com> <e2072e24a6773b346f2a71c80b6a28d5b98e6194.1737763916.git.yepeilin@google.com>
In-Reply-To: <e2072e24a6773b346f2a71c80b6a28d5b98e6194.1737763916.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 29 Jan 2025 16:44:02 -0800
X-Gm-Features: AWEUYZkPxVz1ETxSnwPu0PV_MBzXRADsiXTZQunQIcthoa6BSOZy9HLEix9hZko
Message-ID: <CAADnVQ+hi3918DUyA7bs4Va9NdNqXJg-R4A45n_MHGTikYaOSA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 8/8] bpf, docs: Update instruction-set.rst for
 load-acquire and store-release instructions
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
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_164415_738147_DC24BC9B 
X-CRM114-Status: GOOD (  27.41  )
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

On Fri, Jan 24, 2025 at 6:19=E2=80=AFPM Peilin Ye <yepeilin@google.com> wro=
te:
>
> Update documentation for the new load-acquire and store-release
> instructions.  Rename existing atomic operations as "atomic
> read-modify-write (RMW) operations".
>
> Following RFC 9669, section 7.3. "Adding Instructions", create new
> conformance groups "atomic32v2" and "atomic64v2", where:
>
>   * atomic32v2: includes all instructions in "atomic32", plus the new
>                 8-bit, 16-bit and 32-bit atomic load-acquire and
>                 store-release instructions
>
>   * atomic64v2: includes all instructions in "atomic64" and
>                 "atomic32v2", plus the new 64-bit atomic load-acquire
>                 and store-release instructions
>
> Cc: bpf@ietf.org
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>  .../bpf/standardization/instruction-set.rst   | 114 +++++++++++++++---
>  1 file changed, 98 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/bpf/standardization/instruction-set.rst b/Docu=
mentation/bpf/standardization/instruction-set.rst
> index ab820d565052..86917932e9ef 100644
> --- a/Documentation/bpf/standardization/instruction-set.rst
> +++ b/Documentation/bpf/standardization/instruction-set.rst
> @@ -139,8 +139,14 @@ This document defines the following conformance grou=
ps:
>    specification unless otherwise noted.
>  * base64: includes base32, plus instructions explicitly noted
>    as being in the base64 conformance group.
> -* atomic32: includes 32-bit atomic operation instructions (see `Atomic o=
perations`_).
> -* atomic64: includes atomic32, plus 64-bit atomic operation instructions=
.
> +* atomic32: includes 32-bit atomic read-modify-write instructions (see
> +  `Atomic operations`_).
> +* atomic32v2: includes atomic32, plus 8-bit, 16-bit and 32-bit atomic
> +  load-acquire and store-release instructions.
> +* atomic64: includes atomic32, plus 64-bit atomic read-modify-write
> +  instructions.
> +* atomic64v2: unifies atomic32v2 and atomic64, plus 64-bit atomic load-a=
cquire
> +  and store-release instructions.
>  * divmul32: includes 32-bit division, multiplication, and modulo instruc=
tions.
>  * divmul64: includes divmul32, plus 64-bit division, multiplication,
>    and modulo instructions.
> @@ -653,20 +659,31 @@ Atomic operations are operations that operate on me=
mory and can not be
>  interrupted or corrupted by other access to the same memory region
>  by other BPF programs or means outside of this specification.
>
> -All atomic operations supported by BPF are encoded as store operations
> -that use the ``ATOMIC`` mode modifier as follows:
> +All atomic operations supported by BPF are encoded as ``STX`` instructio=
ns
> +that use the ``ATOMIC`` mode modifier, with the 'imm' field encoding the
> +actual atomic operation.  These operations are categorized based on the =
second
> +lowest nibble (bits 4-7) of the 'imm' field:
>
> -* ``{ATOMIC, W, STX}`` for 32-bit operations, which are
> +* ``ATOMIC_LOAD`` and ``ATOMIC_STORE`` indicate atomic load and store
> +  operations, respectively (see `Atomic load and store operations`_).
> +* All other defined values indicate an atomic read-modify-write operatio=
n, as
> +  described in the following section.
> +
> +Atomic read-modify-write operations
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The atomic read-modify-write (RMW) operations are encoded as follows:
> +
> +* ``{ATOMIC, W, STX}`` for 32-bit RMW operations, which are
>    part of the "atomic32" conformance group.
> -* ``{ATOMIC, DW, STX}`` for 64-bit operations, which are
> +* ``{ATOMIC, DW, STX}`` for 64-bit RMW operations, which are
>    part of the "atomic64" conformance group.
> -* 8-bit and 16-bit wide atomic operations are not supported.
> +* 8-bit and 16-bit wide atomic RMW operations are not supported.
>
> -The 'imm' field is used to encode the actual atomic operation.
> -Simple atomic operation use a subset of the values defined to encode
> -arithmetic operations in the 'imm' field to encode the atomic operation:
> +Simple atomic RMW operation use a subset of the values defined to encode
> +arithmetic operations in the 'imm' field to encode the atomic RMW operat=
ion:
>
> -.. table:: Simple atomic operations
> +.. table:: Simple atomic read-modify-write operations
>
>    =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>    imm       value  description
> @@ -686,10 +703,10 @@ arithmetic operations in the 'imm' field to encode =
the atomic operation:
>
>    *(u64 *)(dst + offset) +=3D src
>
> -In addition to the simple atomic operations, there also is a modifier an=
d
> -two complex atomic operations:
> +In addition to the simple atomic RMW operations, there also is a modifie=
r and
> +two complex atomic RMW operations:
>
> -.. table:: Complex atomic operations
> +.. table:: Complex atomic read-modify-write operations
>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>    imm          value             description
> @@ -699,8 +716,8 @@ two complex atomic operations:
>    CMPXCHG      0xf0 | FETCH      atomic compare and exchange
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> -The ``FETCH`` modifier is optional for simple atomic operations, and
> -always set for the complex atomic operations.  If the ``FETCH`` flag
> +The ``FETCH`` modifier is optional for simple atomic RMW operations, and
> +always set for the complex atomic RMW operations.  If the ``FETCH`` flag
>  is set, then the operation also overwrites ``src`` with the value that
>  was in memory before it was modified.
>
> @@ -713,6 +730,71 @@ The ``CMPXCHG`` operation atomically compares the va=
lue addressed by
>  value that was at ``dst + offset`` before the operation is zero-extended
>  and loaded back to ``R0``.
>
> +Atomic load and store operations
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +To encode an atomic load or store operation, the lowest 8 bits of the 'i=
mm'
> +field are divided as follows::
> +
> +  +-+-+-+-+-+-+-+-+
> +  | type  | order |
> +  +-+-+-+-+-+-+-+-+
> +
> +**type**
> +  The operation type is one of:
> +
> +.. table:: Atomic load and store operation types
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +  type          value  description
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +  ATOMIC_LOAD   0x1    atomic load
> +  ATOMIC_STORE  0x2    atomic store
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +**order**
> +  The memory order is one of:
> +
> +.. table:: Memory orders
> +
> +  =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  order    value  description
> +  =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  RELAXED  0x0    relaxed
> +  ACQUIRE  0x1    acquire
> +  RELEASE  0x2    release
> +  ACQ_REL  0x3    acquire and release
> +  SEQ_CST  0x4    sequentially consistent
> +  =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I understand that this is inspired by C,
but what are the chances this will map meaningfully to hw?
What JITs suppose to do with all other combinations ?

> +Currently the following combinations of ``type`` and ``order`` are allow=
ed:
> +
> +.. table:: Atomic load and store operations
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  imm       value  description
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  LOAD_ACQ  0x11   atomic load-acquire
> +  STORE_REL 0x22   atomic store-release
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Should we do LOAD_ACQ=3D1 and STORE_REL=3D2 and
do not add anything else?

