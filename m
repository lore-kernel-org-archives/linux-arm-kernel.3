Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E787C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 01:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvst8xPYV1MFRxmaWZ5Kg/kBERoYdR0ehlL8LHhy7H4=; b=IX1cEB8h2nTwZYTdP71GrL2iIh
	xrc6YesUdT2MXH+7i4AFd4rfBkx6PnDTUMw6t5grwy0y8fb+W0636TFWqz0tQqUZ8GBoO+LqNBU2u
	M3xLiJctyA7g/5kJ/zHyayzPURB65KCgdd6TZhX5W7+eYS9WmBhuiUOa+cF5sG6NSJlYdMCTRtbN/
	Zn8zXBhOyQfnU/5tpXb/VhSikM0pnpYlRB3wOSgDJXPsXVKbzyff1sxcow5c3Tql0xALBaYu1nVLJ
	n4E95psTg1jfsIw6rxtVFqOHf+jKdCVukED1FNIEcTnSCCUEKXKsQNFoZgTWORXNIJ7byDFy0zztm
	gWcV7cbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwYJ-000000068pu-0wQr;
	Wed, 29 Jan 2025 01:07:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwWx-000000068gp-35zN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 01:06:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216728b1836so104120525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 17:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738112770; x=1738717570; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bvst8xPYV1MFRxmaWZ5Kg/kBERoYdR0ehlL8LHhy7H4=;
        b=S7GtyqSVH6QC63XbuE77masg142ZkkkCLNbHgbD6/Pp11fU8xVx4A7YcIsH4F/5clJ
         z0NvUXh9ALLsZyiC8fJ55QjjfaZzlAJGurjxb48WZ92hANpO5ndGQm5IA+nYseb6GJhs
         ki8xOojdOmmsullfKqQlUFHGQowcvvoEZdk2aUUSqsGL1ZBShnO0s06cw3TF4kH+C/et
         BsDu88GIQ/f55m4YM4OBnj3anjepaY2Dp0/tZYqGxYeduSTT2VehFmTK9H8An/sZbYXA
         lhC8KxgwQBUVaMajyyF2bEYfSMEEW7hWzIf63LKWcF7K9l0Xk2v3hb98pwllTw52vfKR
         7CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738112770; x=1738717570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvst8xPYV1MFRxmaWZ5Kg/kBERoYdR0ehlL8LHhy7H4=;
        b=jEApBev/gCvyOrlA6EkQVFgjwu6CD2W1MAMbz6KCzcosIte4IOExpAZB/rngceZFsL
         GQMuw611gWIV5BciyjgcGtnKgHRuM1RoMPbuqDynDEIhAovxmL3Be910wRJ/cYfNTITP
         ew30w067laWquUZEsjYJ/2rc2z4jXXZu8bUe4tIVqFIztTwUhvZH2gcrGr+QdtJPkvQ9
         neaMNVKRvGH+aIaq0OkfswVPXEu8lnbsa/TOQgMTmTxV/sac+H+FdQOJNf64kJeP7jGo
         am3ePpSuBbhP7hZ0dcfVsg++FX+kOeBYBKAoh/bcLBn8omVBP4xAlyf0xFJotW7PbwFs
         7itg==
X-Forwarded-Encrypted: i=1; AJvYcCVywSoVvYIZ8ZH1SfdxoOcKs6tCkld8GS80Xe43KJ08xPXWP0NQxM3wY0OUmXdeLiMDzHqnKEL2usEnVHDNVtpt@lists.infradead.org
X-Gm-Message-State: AOJu0YxSOpzfnIkboCDUp5F5gOD+4dC6cNSWLnn3h4Ziafx5nKmyuhSc
	2DtRn6FAOtF2DdrN5m0GeSj9R0lShy0sPnffx7+JJi6BN7rafc9Y
X-Gm-Gg: ASbGncu1N9FfCUDU5nmpCTthhf7Qdw0e1VByFMq6/GgmdXBAdFMf9Ypjvab2ToaFTO+
	8eCIQlnGvPHg8kP9F6LLhKhpy16ytj3DLJUzfqYOS7TkmaO53rAayavfefOJztmrJjPFYdbfvnd
	hVZOaE5LZYa/KMsYsNw+kdiWhzLe5NN0SQq923xP73kLa+e8UFCidII3OSYdKB4HEo5lqwfHOUi
	FJ4rPSu0WKNz9gBOr2r15Y4XMkSu7yvrrCH9/2W38lancOFruCdX/VB9A/OqXX7wnT3r+2sk7or
	57yup2nWAz5s
X-Google-Smtp-Source: AGHT+IFrfXNGqZrK5XM0SHu+NoKfGH/ZHvT/IKZCcqTIw7T082vJ6CNzDFq7W71Vut6Xp386mHPklQ==
X-Received: by 2002:a17:903:2f8c:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-21dd7c3555bmr17773795ad.5.1738112770503;
        Tue, 28 Jan 2025 17:06:10 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9b8e0sm89377575ad.40.2025.01.28.17.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 17:06:09 -0800 (PST)
Message-ID: <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
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
 <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Quentin Monnet <qmo@kernel.org>, Mykola Lysenko	
 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
 <joshdon@google.com>,  Barret Rhoden <brho@google.com>, Neel Natu
 <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 28 Jan 2025 17:06:03 -0800
In-Reply-To: <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
	 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_170611_777939_94FC0ABA 
X-CRM114-Status: GOOD (  24.28  )
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

On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
> Add several ./test_progs tests:
>=20
>   - atomics/load_acquire
>   - atomics/store_release
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
>     #0:  "r1 =3D 8;"
>     #1:  "store_release((u64 *)(r10 - 8), r1);"
>     #2:  "r1 =3D *(u64 *)(r10 - 8);"
>     #3:  "r2 =3D r10;"
>     #4:  "r2 +=3D r1;"	/* mark_precise */
>     #5:  "r0 =3D 0;"
>     #6:  "exit;"
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
> All new tests depend on the pre-defined __BPF_FEATURE_LOAD_ACQ_STORE_REL
> feature macro, which implies -mcpu>=3Dv4.

This restriction would mean that tests are skipped on BPF CI, as it
currently runs using llvm 17 and 18. Instead, I suggest using some
macro hiding an inline assembly as below:

	asm volatile (".8byte %[insn];"
	              :
	              : [insn]"i"(*(long *)&(BPF_RAW_INSN(...)))
	              : /* correct clobbers here */);

See the usage of the __imm_insn() macro in the test suite.

Also, "BPF_ATOMIC loads from R%d %s is not allowed\n" and
      "BPF_ATOMIC stores into R%d %s is not allowed\n"
situations are not tested.

[...]

> diff --git a/tools/testing/selftests/bpf/prog_tests/atomics.c b/tools/tes=
ting/selftests/bpf/prog_tests/atomics.c
> index 13e101f370a1..5d7cff3eed2b 100644
> --- a/tools/testing/selftests/bpf/prog_tests/atomics.c
> +++ b/tools/testing/selftests/bpf/prog_tests/atomics.c
> @@ -162,6 +162,56 @@ static void test_xchg(struct atomics_lskel *skel)
>  	ASSERT_EQ(skel->bss->xchg32_result, 1, "xchg32_result");
>  }

Nit: Given the tests in verifier_load_acquire.c and verifier_store_release.=
c
     that use __retval annotation, are these tests really necessary?
     (assuming that verifier_store_release.c tests are modified to read
      stored location into r0 before exit).

> +static void test_load_acquire(struct atomics_lskel *skel)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
> +	int err, prog_fd;
> +
> +	if (skel->data->skip_lacq_srel_tests) {
> +		printf("%s:SKIP:Clang does not support BPF load-acquire\n", __func__);
> +		test__skip();
> +		return;
> +	}
> +
> +	/* No need to attach it, just run it directly */
> +	prog_fd =3D skel->progs.load_acquire.prog_fd;
> +	err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> +	if (!ASSERT_OK(err, "test_run_opts err"))
> +		return;
> +	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> +		return;
> +
> +	ASSERT_EQ(skel->bss->load_acquire8_result, 0x12, "load_acquire8_result"=
);
> +	ASSERT_EQ(skel->bss->load_acquire16_result, 0x1234, "load_acquire16_res=
ult");
> +	ASSERT_EQ(skel->bss->load_acquire32_result, 0x12345678, "load_acquire32=
_result");
> +	ASSERT_EQ(skel->bss->load_acquire64_result, 0x1234567890abcdef, "load_a=
cquire64_result");
> +}

[...]

> --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
[...]

> +SEC("raw_tp/sys_enter")
> +int load_acquire(const void *ctx)
> +{
> +	if (pid !=3D (bpf_get_current_pid_tgid() >> 32))
> +		return 0;

Nit: This check is not needed, since bpf_prog_test_run_opts() is used
     to run the tests.

> +
> +#ifdef __BPF_FEATURE_LOAD_ACQ_STORE_REL
> +	load_acquire8_result =3D __atomic_load_n(&load_acquire8_value, __ATOMIC=
_ACQUIRE);
> +	load_acquire16_result =3D __atomic_load_n(&load_acquire16_value, __ATOM=
IC_ACQUIRE);
> +	load_acquire32_result =3D __atomic_load_n(&load_acquire32_value, __ATOM=
IC_ACQUIRE);
> +	load_acquire64_result =3D __atomic_load_n(&load_acquire64_value, __ATOM=
IC_ACQUIRE);
> +#endif
> +
> +	return 0;
> +}

[...]


