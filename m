Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7094EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 00:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV7K2M6UXy/vt2SdaVfosbmTyfpXCQFAfw5jBj/4JbU=; b=sire0BnIRRtIRA1hRDYYFGvNVB
	r4+bRRGbNHDUiewU77OWmdAzznhlm5xRYuef5rJ+eAyenI9FerwJS28QobKHpCHNvthANypjCvhw4
	tlHzCMrVYEF3tkDHc9K7lCZA4hLNr6K3ECPamYZqBYyL+uPL+qwbGVRh3bU5ouhRoQZIM3e+V0TFi
	W9EUh0to018iy8DJXolG6Uwkw/XX83A5ucPlU8zyIlbkrJ3e8QQIf15l9Bc5/S/SrmiFqCJaHOwg8
	mY3iK6/iokVWE7Nkq9QMCOt33W/sgx6KRsnvl/vhGCA1MaHx3m0VFZzgr09jUIu40trnK28/jf/gL
	xDUHFvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvp9-000000064v9-0wol;
	Wed, 29 Jan 2025 00:20:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvno-000000064nx-0m0L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 00:19:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso8504008a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 16:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738109971; x=1738714771; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TV7K2M6UXy/vt2SdaVfosbmTyfpXCQFAfw5jBj/4JbU=;
        b=MlqhUfdgnKOua6eeVhGoSjFoZiHQo75s42cPu4loWTSbkVx+G0d8rhteX5gIKsR5zS
         htBgyt/CTfNXhdyTKcDLgHCR88xTQHaNlDi4kTZogV/BZnrFNnJKB4MuzOS9/nkOYsVp
         tQjE/S/1lApWPdgtDq/TZReTF5qcb8ZMRw2QEB6Vgw7npB+53RnAcx+C9uAz/C7DNDwA
         0MZnDw0gvLb0t+xx1ipnFA3YMoPTOtVbeAKBGNrLCrYhIQ+vyKyvgs+YMMSy04Q3umTb
         kAG9vqWQbUlJgwZLV+Fl0VGpVjz5O+jRNZ98rb4WwtLJn5l3Cd9AXfiBY1su70S/5p9e
         bKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738109971; x=1738714771;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV7K2M6UXy/vt2SdaVfosbmTyfpXCQFAfw5jBj/4JbU=;
        b=U6oeWufJy5Z4yaZHu87bglRL9GgJMwYlwvisxeVjMb5seE0jhmQtGeNsEtLN8x9cbv
         TW20LDSfPFohToG4kVN11hQ1jEVOmvR0NpGDtPSBGse73SfCmOHsMEZBniy7K+cFTvkw
         o54OFeYI2VjO9z1712G2lAyjsJ5C4xrIx9DwYVP6hRPb1YhTts3xbOixaAbVPr++CjDi
         y2YDwk5Cn8cdGktRJFY0Bd+YLN9A1RDI7g/9CEEiFMDCjUQquy+2Zl3tkVhAnkLTn+OB
         6Z9SjIu9XlfChZD616yN32Kopvd/t36BcJI/E64rgbgqfFqpUtGLP7mWhebnvXbk9sP0
         Zhaw==
X-Forwarded-Encrypted: i=1; AJvYcCXNIUl16mtudhYaMy5mbqo6TrnfIKTi0Z2R1R+Gr54L6GrX26ZigpnA5RpigY+70pRlWEl8c4EHk/sbm84H7d1Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm24NJ/Eywb7/sN5JTvVtO4/TSdB1LCm7oAcL3UovcZ1k27E1J
	BOvoO64wfX6KT35wjhv0TQ1iuBqt4TviTb1DlxbMY/9r2qElGKqU
X-Gm-Gg: ASbGncsAm8jdrmKQRSzuBu68LPsvQJIGNQ5NVMyPt2myz6gfdq2mHElSsBxPDJSCnj1
	CfIFtiSzeaLnPpTGBKrFwINv1E5pd17+PKsU0Vpz1gAqLhdoYA16DJYRI1mRX6U2GCKya8AaA8R
	IqgEUeT5B37piXKd7DtKNYQFsnaSXp3t5oJJoWFuAJDVlfNRlxNMbNPe83tZKIfipU2Fj7/Z7zw
	cX4Klan9lzE+XWM8KWAWbdhcg/4tcVg1agDmZPpk5FPzkRVJR0VIps32hIYr22teFdplzRC5SXY
	4I66vs8r8hPL
X-Google-Smtp-Source: AGHT+IGKt1S5KeBlhL++I8/Sk0F6dSfkbtLXLddGw22U8KsVqKlk04Nk/VftS8R3tTTxvXKf7WotjA==
X-Received: by 2002:a17:90b:50cf:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2f83ab8bb05mr1462857a91.6.1738109970782;
        Tue, 28 Jan 2025 16:19:30 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424ec12sm87428425ad.236.2025.01.28.16.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 16:19:30 -0800 (PST)
Message-ID: <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
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
Date: Tue, 28 Jan 2025 16:19:25 -0800
In-Reply-To: <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
	 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_161932_230087_0992F155 
X-CRM114-Status: GOOD (  20.89  )
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

On Sat, 2025-01-25 at 02:18 +0000, Peilin Ye wrote:
> Introduce BPF instructions with load-acquire and store-release
> semantics, as discussed in [1].  The following new flags are defined:
>=20
>   BPF_ATOMIC_LOAD         0x10
>   BPF_ATOMIC_STORE        0x20
>   BPF_ATOMIC_TYPE(imm)    ((imm) & 0xf0)
>=20
>   BPF_RELAXED        0x0
>   BPF_ACQUIRE        0x1
>   BPF_RELEASE        0x2
>   BPF_ACQ_REL        0x3
>   BPF_SEQ_CST        0x4
>=20
>   BPF_LOAD_ACQ       (BPF_ATOMIC_LOAD | BPF_ACQUIRE)
>   BPF_STORE_REL      (BPF_ATOMIC_STORE | BPF_RELEASE)
>=20
> A "load-acquire" is a BPF_STX | BPF_ATOMIC instruction with the 'imm'
> field set to BPF_LOAD_ACQ (0x11).
>=20
> Similarly, a "store-release" is a BPF_STX | BPF_ATOMIC instruction with
> the 'imm' field set to BPF_STORE_REL (0x22).
>=20
> Unlike existing atomic operations that only support BPF_W (32-bit) and
> BPF_DW (64-bit) size modifiers, load-acquires and store-releases also
> support BPF_B (8-bit) and BPF_H (16-bit).  An 8- or 16-bit load-acquire
> zero-extends the value before writing it to a 32-bit register, just like
> ARM64 instruction LDARH and friends.
>=20
> As an example, consider the following 64-bit load-acquire BPF
> instruction:
>=20
>   db 10 00 00 11 00 00 00  r0 =3D load_acquire((u64 *)(r1 + 0x0))
>=20
>   opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
>   imm (0x00000011): BPF_LOAD_ACQ
>=20
> Similarly, a 16-bit BPF store-release:
>=20
>   cb 21 00 00 22 00 00 00  store_release((u16 *)(r1 + 0x0), w2)
>=20
>   opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
>   imm (0x00000022): BPF_STORE_REL
>=20
> [1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.=
com/
>=20
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---

I think bpf_jit_supports_insn() in arch/{x86,s390}/net/bpf_jit_comp.c
need an update, as both would accept BPF_LOAD_ACQ/BPF_STORE_REL at the
moment.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> +static int check_atomic_load(struct bpf_verifier_env *env, int insn_idx,
> +			     struct bpf_insn *insn)
> +{
> +	struct bpf_reg_state *regs =3D cur_regs(env);
> +	int err;
> +
> +	err =3D check_reg_arg(env, insn->src_reg, SRC_OP);
> +	if (err)
> +		return err;
> +
> +	err =3D check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
> +	if (err)
> +		return err;
> +
> +	if (!atomic_ptr_type_ok(env, insn->src_reg, insn)) {
> +		verbose(env, "BPF_ATOMIC loads from R%d %s is not allowed\n",
> +			insn->src_reg,
> +			reg_type_str(env, reg_state(env, insn->src_reg)->type));
> +		return -EACCES;
> +	}
> +
> +	if (is_arena_reg(env, insn->src_reg)) {
> +		err =3D save_aux_ptr_type(env, PTR_TO_ARENA, false);
> +		if (err)
> +			return err;

Nit: this and the next function look very similar to processing of
     generic load and store in do_check(). Maybe extract that code
     as an auxiliary function and call it in both places?
     The only major difference is is_arena_reg() check guarding
     save_aux_ptr_type(), but I think it is ok to do save_aux_ptr_type
     unconditionally. Fwiw, the code would be a bit simpler,
     just spent half an hour convincing myself that such conditional handli=
ng
     is not an error. Wdyt?

> +	}
> +
> +	/* Check whether we can read the memory. */
> +	err =3D check_mem_access(env, insn_idx, insn->src_reg, insn->off,
> +			       BPF_SIZE(insn->code), BPF_READ, insn->dst_reg,
> +			       true, false);
> +	if (err)
> +		return err;
> +
> +	err =3D reg_bounds_sanity_check(env, &regs[insn->dst_reg], "atomic_load=
");
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +
> +static int check_atomic_store(struct bpf_verifier_env *env, int insn_idx=
,
> +			      struct bpf_insn *insn)
> +{
> +	int err;
> +
> +	err =3D check_reg_arg(env, insn->src_reg, SRC_OP);
> +	if (err)
> +		return err;
> +
> +	err =3D check_reg_arg(env, insn->dst_reg, SRC_OP);
> +	if (err)
> +		return err;
> +
> +	if (is_pointer_value(env, insn->src_reg)) {
> +		verbose(env, "R%d leaks addr into mem\n", insn->src_reg);
> +		return -EACCES;
> +	}
> +
> +	if (!atomic_ptr_type_ok(env, insn->dst_reg, insn)) {
> +		verbose(env, "BPF_ATOMIC stores into R%d %s is not allowed\n",
> +			insn->dst_reg,
> +			reg_type_str(env, reg_state(env, insn->dst_reg)->type));
> +		return -EACCES;
> +	}
> +
> +	if (is_arena_reg(env, insn->dst_reg)) {
> +		err =3D save_aux_ptr_type(env, PTR_TO_ARENA, false);
> +		if (err)
> +			return err;
> +	}
> +
> +	/* Check whether we can write into the memory. */
> +	err =3D check_mem_access(env, insn_idx, insn->dst_reg, insn->off,
> +			       BPF_SIZE(insn->code), BPF_WRITE, insn->src_reg,
> +			       true, false);
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +

[...]


