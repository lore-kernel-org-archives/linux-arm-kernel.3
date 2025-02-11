Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B0DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQyUJBqo+jTXiMiWvhStxEYM9tCoQv2ZIzt9rc3LsXM=; b=3njE0wsHlKaWRDHh9uyc6hn0PM
	T8ueHrfYf4wrVOv4ZB7p4spBCojRDNLqJTlyO4eWDGWY+PXg5pPqrJk7ywuxJZtlMnignfQYCN5xr
	5yk9v5hHLugm8+535ZL03E8FqnGzzBIIIxhtJtHBHgQQbxHi0DuLpOPp1jkqPr1wBjh9I0gHckqOd
	9eb5CpcX4mfc2DyS7+qHc/SzIHRq9gA2b/t6Rg9Ev/W+4QYcLGuv6VM1KOmdR04ki1yfHsn8b/m0P
	DjukJJ+uM+iv7sAGvL7Q3WNYnt8wL2x8TkcCvmRfqyHEl26fUOEj64VhMOdiCVGB06okNuC1eswr/
	Ta9Cl0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdr5-00000001vsC-3gFW;
	Tue, 11 Feb 2025 00:10:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdph-00000001vcK-0RNP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 00:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uQyUJBqo+jTXiMiWvhStxEYM9tCoQv2ZIzt9rc3LsXM=; b=XnB4FAzRqJzVIaRPJKcBcZxG1U
	qzkxysq6MYaH0yOUXZgNMVDtJno12SieEcH1ur29AtR//8fn5/mQXTkAS3WF6mUq9LaRdFxyYq85w
	ZDd0Ur76Zx2uMdzSIgwj6YB++3FPEXUA1SHP9Nsm2S0StNyNqxDKhnlkIjDRchr6XDB0GzeRqXsfG
	sCQ//k2hRlgDMtOPlcVcFkZMYUs2O09GiSBqveh1yxE2Yg1ALzz59V7APD3cGg3BOje0CZiuLgtWv
	32vMJB61YXZvMm9LYC1L36pmj7+CgDOCYJ2vr285D+IPoiJSwPXuZnfHXvdlugsikFSd0maQR+lFp
	lZIsQkkQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdpd-00000000Nqh-3lxh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:08:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f50895565so53148045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 16:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739232530; x=1739837330; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uQyUJBqo+jTXiMiWvhStxEYM9tCoQv2ZIzt9rc3LsXM=;
        b=I4WeCTpKZGQ9zQXvIwt1Gnyn7k/vdLWomUvecfZe0sc0pgfHMxBA/DfQAR+3Lx0XOi
         Rjd/hA7Iu3Y8ym1FPaihweMJANcQKUOnxfSD0MFJBxOFVW1+FKbZZc+iIVOTa+OBY/B4
         YXaCQTWH2veJqMP6e65WogpwGEpDtclON+2PYN3Xa5kE+mKacrF2VuxrElx1czsBfDJt
         kTntt6GsOhnHDdfaRdobPAxjsPJkQ4RKMZypKZ+l9XlJ4Lt4EF5+HQjCnOimo1IQirFF
         Gg/67R9uDLV4GQy9jPg0O/VQKWTbovx3jOe138lfIOAtBoiZqrKILdTZw+FKKupK459X
         pl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739232530; x=1739837330;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQyUJBqo+jTXiMiWvhStxEYM9tCoQv2ZIzt9rc3LsXM=;
        b=IQQQpLHP8fOeIWO6MH7uURMgQhRNUH+VLFt4Pi/Ll9L/TnnTu2dn5S+zXwCekkmdGx
         PDpcxDVax25YPbIN9S4oNpJG+abynALFmMppbxlyChebxEJIr6iPI4ksEYpul7+uj57h
         dBAZUpYDHtvak285kb7HLt832979lG2PD7GpJkMIigNOueh2q/9JzR3XZnwgo7N5uo1R
         2ak4y7fqhkcxrY6zfvHTo3FH+cBwwx4aoIW1OiJJaQwlMdBOgyUKsC6IJz4/xlvCwx4T
         rhbyop7jTfJZl6Uh36QzU938/OkVvjaI4+OVT1HcfC6CzeTfatobuB5EVdP74rnsQqgE
         kH7A==
X-Forwarded-Encrypted: i=1; AJvYcCWZMV3sLeWeJgBNHUE7HfYRZbGVfvkwEDuLtNIDV10PknLBCh85cCruMxOVniHTIeXzs2vd24N/uOKJ0dJ8W4ZR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+Df1BTwMmmEx+JsITWpsUQsL8T7g1ZOneOUzH6+0uUs6Spm6
	c+AnC750AywCfqIP/woRTlD/QL56r5p9BkNhq40Y0i0GIDVcz7NW
X-Gm-Gg: ASbGncuKbStoQ3LJCx2LcyEcW3zycTffr0H/K2NXBPhWB1N+EwDDBe4QLspEA9XUGO7
	i9xVU8ssowHIENH7oGqJkH0kAkOvW3VNj88G4BY7gLw1hxp+S+x3M6uW28oNvkEk3wLGRDIYOJh
	3TjxH1T2VwhzATINVxBbuNwKTAF2dx9Ym9gQW8ac+T+jfhpMvYJxv+f9Rgot5ATPY7azyp9Ssty
	sKsSAm3h32203fyq73D78iRUg2eKe+zDUGxacIJKJX7N3aul0ad+b7rlVeDgKqvhq++c1vCfuwg
	mS+aZ4YxYCtj
X-Google-Smtp-Source: AGHT+IGDiHUAa707fZSIiz13RbPklkC1h9XML1rywNVdLJb0wY4Mp/STxHikL/FhaHi8cHMzHDo6oA==
X-Received: by 2002:a17:903:2bcb:b0:216:4a06:e87a with SMTP id d9443c01a7336-21fb64a5fe6mr23698975ad.40.1739232530464;
        Mon, 10 Feb 2025 16:08:50 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368afde8sm84249775ad.223.2025.02.10.16.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:08:49 -0800 (PST)
Message-ID: <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet	
 <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann	
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau	 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens
	 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Quentin Monnet	
 <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long
 <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,  Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>, 	linux-kernel@vger.kernel.org
Date: Mon, 10 Feb 2025 16:08:44 -0800
In-Reply-To: <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
	 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000854_144874_8B6C6A51 
X-CRM114-Status: GOOD (  18.24  )
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

On Fri, 2025-02-07 at 02:06 +0000, Peilin Ye wrote:
> Add several ./test_progs tests:
>=20
>   - arena_atomics/load_acquire
>   - arena_atomics/store_release
>   - verifier_load_acquire/*
>   - verifier_store_release/*
>   - verifier_precision/bpf_load_acquire
>   - verifier_precision/bpf_store_release
>=20
> The last two tests are added to check if backtrack_insn() handles the
> new instructions correctly.
>=20
> Additionally, the last test also makes sure that the verifier
> "remembers" the value (in src_reg) we store-release into e.g. a stack
> slot.  For example, if we take a look at the test program:
>=20
>     #0:  r1 =3D 8;
>       /* store_release((u64 *)(r10 - 8), r1); */
>     #1:  .8byte %[store_release];
>     #2:  r1 =3D *(u64 *)(r10 - 8);
>     #3:  r2 =3D r10;
>     #4:  r2 +=3D r1;
>     #5:  r0 =3D 0;
>     #6:  exit;
>=20
> At #1, if the verifier doesn't remember that we wrote 8 to the stack,
> then later at #4 we would be adding an unbounded scalar value to the
> stack pointer, which would cause the program to be rejected:
>=20
>   VERIFIER LOG:
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ...
>   math between fp pointer and register with unbounded min value is not al=
lowed
>=20
> All new tests depend on #ifdef ENABLE_ATOMICS_TESTS.  Currently they
> only run for arm64.
>=20
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bpf.h>
> +#include <bpf/bpf_helpers.h>
> +#include "../../../include/linux/filter.h"
> +#include "bpf_misc.h"
> +
> +#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)

[...]

> +#else
> +
> +SEC("socket")
> +__description("load-acquire is not supported by compiler or jit, use a d=
ummy test")
> +__success
> +int dummy_test(void)
> +{
> +	return 0;
> +}

Nit: why is dummy_test() necessary?

> +
> +#endif
> +
> +char _license[] SEC("license") =3D "GPL";

[...]


