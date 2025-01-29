Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4190C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 22:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auSdm9fG6SQqLgOEHyJmhNe+uwxMyUkZzDF+skISzAg=; b=zIjTW6AaDE2bf5RmXmThJB+h2w
	E8F1RkjQ3i5B61KJPi+pZyonkMTVpXFzmSi3sfunGDCYVmK74S0GrSWUoGRJ6lSHL4VjL+gI94fjw
	opxLLgB5agDqgO6udMJ03ipzxDbQcg4G+7pfzbZCavay7fVevc+JzYnO1GUBcr2L2Jy6Ezi5WfAo5
	pFvnNVEeWUQ9wwY8mwX1x6BQ0U8MRwsIph+u5IiX2wn1H18Jh/0cEAJ+5WuJVo6xLrBeAi4FMRmc3
	5/wSQFgGyC0VkwTzzTdEP6xnek3pTTi0m0t2oNpDmO4mUlH7jeF4yRwjfnVArLqFYFjOdL5t6qIaG
	S8AeyXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGCU-00000007qmR-2dvF;
	Wed, 29 Jan 2025 22:06:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGB9-00000007qb8-1RDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 22:05:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21625b4f978so41255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738188298; x=1738793098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auSdm9fG6SQqLgOEHyJmhNe+uwxMyUkZzDF+skISzAg=;
        b=oXyl1Qico1B3OPsDqbVPZlqjqHF7W73A+s4x6sHewg/Bn5Gr91lIYbV9B7QN2Ht/o/
         9suYdmrYffkYTJICohhQp83tkIzr17RdUjKqILPMaAVNLBWM1+9k+ErHKHUqX43r62K9
         x3NOeh1tdK5YMA6bZXiuGybO5k06iLmF+Qykio+KT+Mmi3sMi08zruA8/JsJG4yt9BbP
         yf35edm6mqO6+VMV6P3TQNib2Xyg6od6C+uQZ89/iTFVi6RGPv4oIMyTyp7afccH5kUJ
         W4CzodiYmQ8Fh1kw13I7IsqVP+NR7u3g1/Ikr9Ke3WQ3XebKK296DYlXtpy/CsQ6xSlN
         F7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738188298; x=1738793098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auSdm9fG6SQqLgOEHyJmhNe+uwxMyUkZzDF+skISzAg=;
        b=JwqPGyufgasMSKAgoeZ9HKWpFXUjaK47h+kvYsSmtPhltsMu87/x8XA22XmGMQ5AKb
         JeUcOSfSoEH1y5MqBISKaGxK4abndHyzLsGqPa0u9tuZngLvc2oR+4O15l2PA7CewhGT
         ibcVsdVNIHDKheSUT5GYBcTNDggbpbYN3Ie3+TtDQyAhzFumfVbNsdrbe9kNiT4DY9Au
         IdeuHXfWLWm1GtssRymv/De7HV0GIwJ2knxo+prJbYWNhus2iVdcooPIPkLeNHiOYLrk
         h5Lxa7fEfSl0OUL9im/6rEZNw7tJpR/oJCFa3YfEeuleq1Y3ciL29gzJerh4uNHFGfb2
         /RGw==
X-Forwarded-Encrypted: i=1; AJvYcCWVWURqOQPcltv0qpXi6JMPmEK6mFf8vuhEUpn8SoExLYHxu0RdG4fO0uAsxwi16I1zr36C6sG0AxeySY+gnLLe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19CWjdLCtndXc+Q6esN4r4Dr+8MkuG7eonEHtp3L8orDRjT+N
	QX7rq4OR0AU0belJjVgKXAT5qbYKfx1lE4P1ebkSDd4zxJ3vwFZQfC+cvEVOlQ==
X-Gm-Gg: ASbGncsmMIHfRXE16NJAuhyvtLgciieFP7gLuFFASkJlUTPHBUUUglDKmT9PDv0jqPZ
	hvELWPj/1hh/yf9IVBgWM1U5cxbISo2JXRA05HUjGAE6DYEFPmy7+CW18zx8AHhATql1OCoXdgk
	1ZbW0xnDU6gqqfQ64vpTIlHogL0k8N/a/mPXQO/XLqEeznjIeoW7hVQAS5gc706vPSbWfaQ/V8R
	gelKrQz0QSkVYPxm8zMqSRxd1tdVIaaz4yh8dI0df/aIs9ewpTcPDF3cs7jovkScoPqmJYIUzyi
	Gcb3eTHhkNR70CQBVicARbEoZsjskLQ3Xvat8zuOL7kVV5cvqIo=
X-Google-Smtp-Source: AGHT+IGAEupXKx0SgR80Zek2UaXseRz4OsaO8ZX/PoFVeYvwYFhxIx+geWC831A7hQ0syi8KM0YqQA==
X-Received: by 2002:a17:902:ef45:b0:216:33a:4b70 with SMTP id d9443c01a7336-21de23a413cmr760805ad.2.1738188297521;
        Wed, 29 Jan 2025 14:04:57 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a763468sm12006873b3a.106.2025.01.29.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:04:57 -0800 (PST)
Date: Wed, 29 Jan 2025 22:04:53 +0000
From: Peilin Ye <yepeilin@google.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5qmBaGE4a7NtaFU@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_140459_398131_3F7BD115 
X-CRM114-Status: GOOD (  24.07  )
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

On Tue, Jan 28, 2025 at 04:19:25PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:18 +0000, Peilin Ye wrote:
> > Signed-off-by: Peilin Ye <yepeilin@google.com>
> > ---
> 
> I think bpf_jit_supports_insn() in arch/{x86,s390}/net/bpf_jit_comp.c
> need an update, as both would accept BPF_LOAD_ACQ/BPF_STORE_REL at the
> moment.

Got it - I will move is_atomic_load_store() into <linux/bpf.h> for that.

> Acked-by: Eduard Zingerman <eddyz87@gmail.com>

Thanks!

> > +static int check_atomic_load(struct bpf_verifier_env *env, int insn_idx,
> > +			     struct bpf_insn *insn)
> > +{
> > +	struct bpf_reg_state *regs = cur_regs(env);
> > +	int err;
> > +
> > +	err = check_reg_arg(env, insn->src_reg, SRC_OP);
> > +	if (err)
> > +		return err;
> > +
> > +	err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!atomic_ptr_type_ok(env, insn->src_reg, insn)) {
> > +		verbose(env, "BPF_ATOMIC loads from R%d %s is not allowed\n",
> > +			insn->src_reg,
> > +			reg_type_str(env, reg_state(env, insn->src_reg)->type));
> > +		return -EACCES;
> > +	}
> > +
> > +	if (is_arena_reg(env, insn->src_reg)) {
> > +		err = save_aux_ptr_type(env, PTR_TO_ARENA, false);
> > +		if (err)
> > +			return err;
> 
> Nit: this and the next function look very similar to processing of
>      generic load and store in do_check(). Maybe extract that code
>      as an auxiliary function and call it in both places?

Sure, I agree that they look a bit repetitive.

>      The only major difference is is_arena_reg() check guarding
>      save_aux_ptr_type(), but I think it is ok to do save_aux_ptr_type
>      unconditionally. Fwiw, the code would be a bit simpler,
>      just spent half an hour convincing myself that such conditional handling
>      is not an error. Wdyt?

:-O

Thanks a lot for that; would you mind sharing a bit more on how you
reasoned about it (i.e., why is it OK to save_aux_ptr_type()
unconditionally) ?

> > +	}
> > +
> > +	/* Check whether we can read the memory. */
> > +	err = check_mem_access(env, insn_idx, insn->src_reg, insn->off,
> > +			       BPF_SIZE(insn->code), BPF_READ, insn->dst_reg,
> > +			       true, false);
> > +	if (err)
> > +		return err;
> > +
> > +	err = reg_bounds_sanity_check(env, &regs[insn->dst_reg], "atomic_load");
> > +	if (err)
> > +		return err;
> > +	return 0;
> > +}
> > +
> > +static int check_atomic_store(struct bpf_verifier_env *env, int insn_idx,
> > +			      struct bpf_insn *insn)

Thanks,
Peilin Ye


