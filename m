Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BB3C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Nlmn6/JbbUIilhIlDhPJ4VAV6ahFXWJyAmErbF/kY=; b=K9/fazrbo0E1sKR7sggEuycN4N
	+E6bgGYiAd0FbxEmFKSH2m7s6GhQ0i8LmdPug8KOEqNp3MQ0Eua0YzuYF4FrytJoo9NapCQkOyEGM
	uwZp8y2oj8IswsaIAS05vPsVyALZcxnyyx0FK91crcAxObCkpEV1wNN7ATG5kPOrA2fk/9JcOj/Mi
	Z+MVxdFKHjptX8D9wZoccqZF61Ajoo1l1zU3v8EodmRWHr/hn7wgyx/tExnYmNu2qlvedEpWc+4xA
	R3wKFKGLahhIWtw2DT4cwVSY9NyeHU/Ny0Bz0WNTCj6et7HflWZ4TzjtvvpOx1dLYQzX2OZJ/iIXZ
	wYrvufOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0K1-00000005f3N-3d7J;
	Wed, 12 Feb 2025 00:09:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0Ib-00000005ejC-2Ju5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:08:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso11652822a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739318896; x=1739923696; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N5Nlmn6/JbbUIilhIlDhPJ4VAV6ahFXWJyAmErbF/kY=;
        b=Xlz0rx84z/gF4YiaYqoAq2s2i1eXP7lOFiqi0yHF1TwNx7qxfo951+S3YwlsSNTyAt
         oHnvkeM33PwLi14InYEj9zW1+1fO47mtmT5Xq4MjWx4wujlavvtB0nne6Kq3NGWbFnUH
         f6Dq6BjlQYevEgDPjkHSi8oZUpK5LDYPpOTisjESMI5m0xVNJJqaIfbFQSp9soG6Vboy
         woBJMBDstXhWte8+frun91qwAdxmwuLFoCbGskuJrm3dSiZudYA/ieb3MoN+hR0c90WA
         x/EFzDVDsPl57x7BAmRGjClhQb1XbotnoyFAM7Z93PEVVeSGz33sgNTKxJuVYRPlYJ9+
         wgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318896; x=1739923696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5Nlmn6/JbbUIilhIlDhPJ4VAV6ahFXWJyAmErbF/kY=;
        b=UFyr8msNXpJGRBvU0v++6UYOcey6b1l7buCa0LTo2ofVRYQUOk07NV73lz9uJcTGOR
         AWoJG9W+0CVKADD3POXqL21FWwt4ByUZE5x/h9laD4FA+bsPw46xI808xMC/UfPNQFx7
         rHjuSXc9QbptajCs1FP0XqEC/LIdIWrCetJXHz1fkRNL4/vvRgPJQyvrcdLhDSS6nI83
         BfXvbIo/Cea20i5B2xqPtUKJS6tc4igojRMSmod5VUjh3lC/tkqqghpdvjSzIZT6etX3
         x66PYHoB4iOmpPbNngnsI0IOCTe+4bJfBuuZoqrQoPJWDVXRJaUb5riUek3ff1ElHGDU
         bZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwnpjhjfaYKJqUPO/5EmzWyGRm6LoK01W8VgSmFlKH8cV5LjChO/FuQhRxe4MEpP7cVwDsz4USsRw5IpeDZ5ds@lists.infradead.org
X-Gm-Message-State: AOJu0YytYMs02YD9OZbDGF5O1B0er1/6Slx9olbsUaseWBFRCxKOs2VB
	c1GNZnxT04xsfEM90iIhiEf4509GDHUzjscYS3XBXkHkn/1Zl0W0
X-Gm-Gg: ASbGncuV0NydiG0rQ5k1s2AR+qsqMX3xKYy5il6cCZ54XruZ2n/bpuY+at3kC6cEWUJ
	KDwDIPSW9R/tDOLmh9EUFA0igkAxFbxQwexqbgha+TSEO5FQq6ZgdX991A75k4UNs3oGl3tbrAu
	xjUiN5I6Y9kyYI5ZmZaKxuFAp2BGt1Ch6SH2IqmxfNkBcgCUvQfNHM6CF9nxfn7ZsRmNW3h4ejN
	GoXgKfNe2KhRXQqQbuFFNZjc+SHItu5A/3XspFgPo12ie8ktBqzWmBRKUwmuELJF3t4ZLd/rcNs
	ujerPLPzw/Ad
X-Google-Smtp-Source: AGHT+IGu8j/EzScz0NFTYCfLtaLVKyGEmTfu1DpkFlHI3iawnU2/6heLbUWvmDL7IZ0vX/fA3qGKJw==
X-Received: by 2002:a17:90b:520e:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2fbf5c6a1b6mr1460208a91.32.1739318895906;
        Tue, 11 Feb 2025 16:08:15 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d05cesm140479a91.18.2025.02.11.16.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:08:14 -0800 (PST)
Message-ID: <a10a2865242dc217e71de54f75fa4289aefb2fa9.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 24/26] bpf: Implement verifier support for
 rqspinlock
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra	
 <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long	
 <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko	
 <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai
 Lau	 <martin.lau@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Tejun Heo	 <tj@kernel.org>, Barret Rhoden <brho@google.com>, Josh Don
 <joshdon@google.com>,  Dohyun Kim <dohyunkim@google.com>,
 linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Date: Tue, 11 Feb 2025 16:08:09 -0800
In-Reply-To: <20250206105435.2159977-25-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
	 <20250206105435.2159977-25-memxor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_160817_585053_A2E3A6F2 
X-CRM114-Status: GOOD (  37.39  )
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

On Thu, 2025-02-06 at 02:54 -0800, Kumar Kartikeya Dwivedi wrote:
> Introduce verifier-side support for rqspinlock kfuncs. The first step is
> allowing bpf_res_spin_lock type to be defined in map values and
> allocated objects, so BTF-side is updated with a new BPF_RES_SPIN_LOCK
> field to recognize and validate.
>=20
> Any object cannot have both bpf_spin_lock and bpf_res_spin_lock, only
> one of them (and at most one of them per-object, like before) must be
> present. The bpf_res_spin_lock can also be used to protect objects that
> require lock protection for their kfuncs, like BPF rbtree and linked
> list.
>=20
> The verifier plumbing to simulate success and failure cases when calling
> the kfuncs is done by pushing a new verifier state to the verifier state
> stack which will verify the failure case upon calling the kfunc. The
> path where success is indicated creates all lock reference state and IRQ
> state (if necessary for irqsave variants). In the case of failure, the
> state clears the registers r0-r5, sets the return value, and skips kfunc
> processing, proceeding to the next instruction.
>=20
> When marking the return value for success case, the value is marked as
> 0, and for the failure case as [-MAX_ERRNO, -1]. Then, in the program,
> whenever user checks the return value as 'if (ret)' or 'if (ret < 0)'
> the verifier never traverses such branches for success cases, and would
> be aware that the lock is not held in such cases.
>=20
> We push the kfunc state in check_kfunc_call whenever rqspinlock kfuncs
> are invoked. We introduce a kfunc_class state to avoid mixing lock
> irqrestore kfuncs with IRQ state created by bpf_local_irq_save.
>=20
> With all this infrastructure, these kfuncs become usable in programs
> while satisfying all safety properties required by the kernel.
>=20
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---

Apart from a few nits, I think this patch looks good.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 32c23f2a3086..ed444e44f524 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -115,6 +115,15 @@ struct bpf_reg_state {
>  			int depth:30;
>  		} iter;
> =20
> +		/* For irq stack slots */
> +		struct {
> +			enum {
> +				IRQ_KFUNC_IGNORE,

Is this state ever used?
mark_stack_slot_irq_flag() is always called with either NATIVE or LOCK.

> +				IRQ_NATIVE_KFUNC,
> +				IRQ_LOCK_KFUNC,
> +			} kfunc_class;
> +		} irq;
> +
>  		/* Max size from any of the above. */
>  		struct {
>  			unsigned long raw1;

[...]

> @@ -8038,36 +8059,53 @@ static int process_spin_lock(struct bpf_verifier_=
env *env, int regno,
>  	}
> =20
>  	rec =3D reg_btf_record(reg);
> -	if (!btf_record_has_field(rec, BPF_SPIN_LOCK)) {
> -		verbose(env, "%s '%s' has no valid bpf_spin_lock\n", map ? "map" : "lo=
cal",
> -			map ? map->name : "kptr");
> +	if (!btf_record_has_field(rec, is_res_lock ? BPF_RES_SPIN_LOCK : BPF_SP=
IN_LOCK)) {
> +		verbose(env, "%s '%s' has no valid %s_lock\n", map ? "map" : "local",
> +			map ? map->name : "kptr", lock_str);
>  		return -EINVAL;
>  	}
> -	if (rec->spin_lock_off !=3D val + reg->off) {
> -		verbose(env, "off %lld doesn't point to 'struct bpf_spin_lock' that is=
 at %d\n",
> -			val + reg->off, rec->spin_lock_off);
> +	spin_lock_off =3D is_res_lock ? rec->res_spin_lock_off : rec->spin_lock=
_off;
> +	if (spin_lock_off !=3D val + reg->off) {
> +		verbose(env, "off %lld doesn't point to 'struct %s_lock' that is at %d=
\n",
> +			val + reg->off, lock_str, spin_lock_off);
>  		return -EINVAL;
>  	}
>  	if (is_lock) {
>  		void *ptr;
> +		int type;
> =20
>  		if (map)
>  			ptr =3D map;
>  		else
>  			ptr =3D btf;
> =20
> -		if (cur->active_locks) {
> -			verbose(env,
> -				"Locking two bpf_spin_locks are not allowed\n");
> -			return -EINVAL;
> +		if (!is_res_lock && cur->active_locks) {

Nit: having '&& cur->active_locks' in this branch but not the one for
     'is_res_lock' is a bit confusing. As far as I understand this is
     just an optimization, and active_locks check could be done (or dropped=
)
     in both cases.

> +			if (find_lock_state(env->cur_state, REF_TYPE_LOCK, 0, NULL)) {
> +				verbose(env,
> +					"Locking two bpf_spin_locks are not allowed\n");
> +				return -EINVAL;
> +			}
> +		} else if (is_res_lock) {
> +			if (find_lock_state(env->cur_state, REF_TYPE_RES_LOCK, reg->id, ptr))=
 {
> +				verbose(env, "Acquiring the same lock again, AA deadlock detected\n"=
);
> +				return -EINVAL;
> +			}
>  		}

Nit: there is no branch for find_lock_state(... REF_TYPE_RES_LOCK_IRQ ...),
     this is not a problem, as other checks catch the imbalance in
     number of unlocks or unlock of the same lock, but verifier won't
     report the above "AA deadlock" message for bpf_res_spin_lock_irqsave()=
.

The above two checks make it legal to take resilient lock while
holding regular lock and vice versa. This is probably ok, can't figure
out an example when this causes trouble.

> -		err =3D acquire_lock_state(env, env->insn_idx, REF_TYPE_LOCK, reg->id,=
 ptr);
> +
> +		if (is_res_lock && is_irq)
> +			type =3D REF_TYPE_RES_LOCK_IRQ;
> +		else if (is_res_lock)
> +			type =3D REF_TYPE_RES_LOCK;
> +		else
> +			type =3D REF_TYPE_LOCK;
> +		err =3D acquire_lock_state(env, env->insn_idx, type, reg->id, ptr);
>  		if (err < 0) {
>  			verbose(env, "Failed to acquire lock state\n");
>  			return err;
>  		}
>  	} else {
>  		void *ptr;
> +		int type;
> =20
>  		if (map)
>  			ptr =3D map;

[...]


