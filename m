Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA3C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0BJFYEwW/5oCHFzaoG43elXSgU0vy+kvkYStyX0AOw=; b=INEGfmL70Od7rXcqFcllGBlcOf
	uAm7vHykyHDmGGsIrtzv2FbiO9toe77fmT1K91TNal7vr/QQ0M3EqUA5MEnRWkLnSecM+b3Qhjjgq
	5RhWKyrVKbO6BIjYaYIJ3hwNKRtOnsYwpKjwTfUlLrvaxUHfuogpFDR4XFE9/RS0fglnUESkp2g5N
	wo/1hW/z1KqWXTruJ866Ovk68SN5K67KB3ts/4EnHwyGvyoLRAJBnW27SVRoOHwLqiwqg50bnedk+
	grzGwVsbZ3vltX91jdy8aIfpd6GUFUoMD0uY7Om2kZFRAY2pY/NbVTqFpr7y1F42CNjYCa04kIevt
	bP4fo5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGn6-00000007tMP-27Na;
	Wed, 29 Jan 2025 22:44:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGlk-00000007swV-0ojT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 22:42:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21bc1512a63so2671655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190567; x=1738795367; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0BJFYEwW/5oCHFzaoG43elXSgU0vy+kvkYStyX0AOw=;
        b=iSjwL0Aj/7HgLwRA1KCFecbFsB9xPFbadX0TG3ikk+gXIJOaprsWE9NsmkCwcMXzHN
         BDkpc94F6+bP6pgHF6ut58LG5dxhYYThP7O8D0yOUrYQJ5pMSx/+VkmB7030uetGKHy6
         RtkNfzWVWZGnh2+2dg8233bERS+l4LnqtIjEaUozgs08EqQbG7RRlBRUr6l9e+o3YUEH
         bnVKXkxkzZ7pXKKOyboYm2zj/jbCXqb92DN8ZvCFMw8uGJxGOzsK9tQqx0MN2nW7zDFZ
         vcQ+IZqGEf3xxAFciX+az9ABrF0ZcIzJZjCi+PdvsHexCAmiORyVHhcsBUUiotgXgtn8
         CkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190567; x=1738795367;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0BJFYEwW/5oCHFzaoG43elXSgU0vy+kvkYStyX0AOw=;
        b=N7XUZL57q8m/S4vhF9tidORWdEkyNu92I2oYuWCvevziYOT1jueJLE9RtGUrYNi/m9
         Gx8i5349OHs7ETZYygoTVYDIbFjakQBeECC58s77b3FlFlCpCuzDhzAfzx6R5R1r8SMi
         /IAaemITVDo7gSWP94ia0eLF9Otzz6LyL8X3Xixcra0V/T4JJTTqgsYlOqpxOkNUTWQH
         MhHehtn/Yr8fN33NhBSL2o6aNEHJ6kkTtOnipBLomty2By/NbK7dFC3Aw7paq4bAdagS
         tb5mly3wWKu6r1cfPDUrQkbIQRPRXgZOXDZ4/6LwR4hPwsOr+oe9PpHlN/t4Qvas/JhK
         1rUA==
X-Forwarded-Encrypted: i=1; AJvYcCWakkA0NgtAQq/8uoDGrtvHRrt+dSZJ86MFHMUdOMmMGIjt6eSzX4SqzBJbDBWyoLP0wuNWTfWuQoCSedIrzUkw@lists.infradead.org
X-Gm-Message-State: AOJu0YyRPZ6jCULQivvCorHsODnbffDzSrukX4RZGYesbWLv0TJ30FGm
	+VikibjD1lV/rFLsK5IwbcgRZfdintuPgok+rjy5LkP8dqrmt0+b
X-Gm-Gg: ASbGnct6He/DDYGAp0T6+zPetVbhYRTbnLZ9OU9liS6zGZpjzWVikZmTbArMHFpkREy
	QT+hgV0W7vRcbQ7Bq4mQ0nM37MB4+2SrrpnKVGr9V06RfeHAkfHQU7Mmc3jDV0UY0eqfhfANMo4
	Z2y4Qugtarxbb6oGbyhAC898lmqaXm2ZXOa2xQmEUONjA/Y0ZwC0j6TTum4IfLxflkS3DEjNqfC
	0sNskskFlxvhThuuePWpG4Wfib6/bW7LvA4gDew3WoRGFwAikjKtvx7XjaBhLGdipSktLjdRvwl
	BOYaYef8GROi
X-Google-Smtp-Source: AGHT+IFe30LvAymnAmLt+ROpt7EhCRkis7bvw/dwChPa5P5DtQ/ENlt+OND9lffByLftnvxHGQKqwg==
X-Received: by 2002:a05:6a21:1394:b0:1e0:e07f:2f01 with SMTP id adf61e73a8af0-1ed7a337c5fmr8174960637.0.1738190567122;
        Wed, 29 Jan 2025 14:42:47 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe03f4e7bsm773852b3a.172.2025.01.29.14.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:42:46 -0800 (PST)
Message-ID: <da01f44bb1f3463515574796c3ac139bbbf7b4dc.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
  Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet <void@manifault.com>,
 Alexei Starovoitov	 <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko	 <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend	 <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev	 <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Quentin Monnet <qmo@kernel.org>, Mykola Lysenko	
 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
 <joshdon@google.com>,  Barret Rhoden <brho@google.com>, Neel Natu
 <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>, 
	linux-kernel@vger.kernel.org
Date: Wed, 29 Jan 2025 14:42:41 -0800
In-Reply-To: <Z5qmBaGE4a7NtaFU@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
	 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
	 <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
	 <Z5qmBaGE4a7NtaFU@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_144248_233469_F6AB08D9 
X-CRM114-Status: GOOD (  24.06  )
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

On Wed, 2025-01-29 at 22:04 +0000, Peilin Ye wrote:

[...]

> > > +static int check_atomic_load(struct bpf_verifier_env *env, int insn_=
idx,
> > > +			     struct bpf_insn *insn)
> > > +{
> > > +	struct bpf_reg_state *regs =3D cur_regs(env);
> > > +	int err;
> > > +
> > > +	err =3D check_reg_arg(env, insn->src_reg, SRC_OP);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	err =3D check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (!atomic_ptr_type_ok(env, insn->src_reg, insn)) {
> > > +		verbose(env, "BPF_ATOMIC loads from R%d %s is not allowed\n",
> > > +			insn->src_reg,
> > > +			reg_type_str(env, reg_state(env, insn->src_reg)->type));
> > > +		return -EACCES;
> > > +	}
> > > +
> > > +	if (is_arena_reg(env, insn->src_reg)) {
> > > +		err =3D save_aux_ptr_type(env, PTR_TO_ARENA, false);
> > > +		if (err)
> > > +			return err;
> >=20
> > Nit: this and the next function look very similar to processing of
> >      generic load and store in do_check(). Maybe extract that code
> >      as an auxiliary function and call it in both places?
>=20
> Sure, I agree that they look a bit repetitive.
>=20
> >      The only major difference is is_arena_reg() check guarding
> >      save_aux_ptr_type(), but I think it is ok to do save_aux_ptr_type
> >      unconditionally. Fwiw, the code would be a bit simpler,
> >      just spent half an hour convincing myself that such conditional ha=
ndling
> >      is not an error. Wdyt?
>=20
> :-O
>=20
> Thanks a lot for that; would you mind sharing a bit more on how you
> reasoned about it (i.e., why is it OK to save_aux_ptr_type()
> unconditionally) ?

Well, save_aux_ptr_type() does two things:
- if there is no env->insn_aux_data[env->insn_idx].ptr_type associated
  with the instruction it saves one;
- if there is .ptr_type, it checks if a new one is compatible and
  errors out if it's not.

The .ptr_type is used in convert_ctx_accesses() to rewrite access
instruction (STX/LDX, atomic or not) in a way specific to pointer
type.

So, doing save_aux_ptr_type() conditionally is already sketchy,
as there is a risk to miss if some instruction is used in a context
where pointer type requires different rewrites.

convert_ctx_accesses() rewrites instruction for pointer following
types:
- PTR_TO_CTX
- PTR_TO_SOCKET
- PTR_TO_SOCK_COMMON
- PTR_TO_TCP_SOCK
- PTR_TO_XDP_SOCK
- PTR_TO_BTF_ID
- PTR_TO_ARENA

atomic_ptr_type_ok() allows the following pointer types:
- CONST_PTR_TO_MAP
- PTR_TO_MAP_VALUE
- PTR_TO_MAP_KEY
- PTR_TO_STACK
- PTR_TO_BTF_ID
- PTR_TO_MEM
- PTR_TO_ARENA
- PTR_TO_BUF
- PTR_TO_FUNC
- CONST_PTR_TO_DYNPTR

One has to check rewrites applied by convert_ctx_accesses() to atomic
instructions to reason about correctness of the conditional
save_aux_ptr_type() call.

If is_arena_reg() guard is removed from save_aux_ptr_type() we risk to
reject programs that do atomic load/store where same instruction is
used to modify a pointer that can be either of the above types.
I speculate that this is not the problem, as do_check() processing for
BPF_STX/BPF_LDX already calls save_aux_ptr_type() unconditionally.

[...]


