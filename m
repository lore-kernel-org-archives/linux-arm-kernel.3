Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380BBC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+YUGdY5jWBgxe0FsZCkWW45MEm3XX8PLaV8ZSxnL4E=; b=NSuuarn4sykUBm8wrrXaBPXoVm
	gGaVjat4qmvmGOxgSJwxEJA7e8vAX83gpb6C19smusp7iFUursFsqbDSybIkCoA2utlxISzhl746U
	jPDLy/GQbWueLN1Drdv9Is8ufDa/x4myqwcAxRpaPWNrkp89iI7wXv9giPEJUe1G7qN1DmaOGhLrW
	MoIq6nAasy07tvDEUjIDeKlbgMk9fcWp3g6zOhq2SlWUPHU0J1Y+th28UI0OyeWsDBr5nsRSIkfCV
	NbhhiuUuzy4vOgZkiOgMM1Q2oKtBV7rKQ2XMu4lkvy2TdEtk6onQlpuD3jzwzPFD+hOE2LReORXz6
	h6vKT0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwvl-00000006AJE-2924;
	Wed, 29 Jan 2025 01:31:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwuQ-00000006A9Z-0XIL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 01:30:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21649a7bcdcso108558765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 17:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738114225; x=1738719025; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T+YUGdY5jWBgxe0FsZCkWW45MEm3XX8PLaV8ZSxnL4E=;
        b=RXzNE5hwxi1HMiXOph13triqmhXkMPCdqMBUW+SSzVLaiNcXIfYiGLp9FNlxXytS7a
         HKy5VaN9YxJnzE24Q7P4B4a7Hc9s+BPYnn8aJo13Giod50XDwa8AqXH7TIgebwR1Ygn3
         ECBufuw3g14BKb3HLyciYWWnV6rgjEZkWtkGaWKjvpA/g6X8k8vhXG6Ns8FjKEYTrhbR
         Cz40RzYQ6m97D8oT9Gkd9dcNnj7T+zT6s+uTMVKHUDUWFzZJytmQeE3p6n3iJ2ZXeXhz
         iBGDo5en1yXxdgtQ5T7+UEXOhJltJI0sxtGipU4wfT4UZHYKqiQWcnhUxAF/Dr5QJozx
         mQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738114225; x=1738719025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+YUGdY5jWBgxe0FsZCkWW45MEm3XX8PLaV8ZSxnL4E=;
        b=hZj8meMdKwyQxlP9Xxo6YbhfO20aPY7SoqbyPsoYgJsszqCS5YeECFYwBZGiVwehLN
         EZiek1nVP5gcHz/CLIx17yYFPWSn2iQNIMvFqdMsOtYCuI2J9oimmg1dA/vMNszyAIx5
         65PT8pr2zP10QUTkmospp68MT+mB5FeFhpSD7HQoypyHJSDQsb+OGTOy7NZrzZqdoki7
         MZKwhdur2b5/d5fTL2Cf/t5A184WCAxo/+zopUU8AA7PtC+aREWX/mmx3RwNYGmcMPxN
         Ya+fc8mvwc4oWRepLJScsgdN7MiX/2YUpoxMOoEHi/3k72oQOeosO8zWcMVBXDQsIOzS
         qIWA==
X-Forwarded-Encrypted: i=1; AJvYcCV3q0VmOWkRe8w0bIuKAxH+EqhPANR3+hBi88XJhxk4KlMQ5RXgR3R5MiB5upeLMHwzPXQjBSKNlxNr+8d9tZxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwoqAdLvwl/IGVgHZQxapkONvid0C+Fooj5nEyt/XYcenhZg6LY
	OULMoQa/xw0n3FXd+9/psvOXKVyn0qpoKM9m/M8vleL20Wa+fR/h
X-Gm-Gg: ASbGnctENzIJz3z5cj7ETK14cZE5UKu1W2H1UvLa7WVvP1G8H3mV1yeq2tK7BcDYJzw
	w+2vMJ7kooSK8pJqBGlHkB3oyAxoJS/5/wQ1b2NmlDAnJaV37P/i2BbeTffGLUMdf4bSfrW4QuF
	ZJPFVdGuYSBwNfQoCWhdH11Nea02aqeeZRctYrrHeFvqyTefJ9aqYwWghO+LhRSvFcT1ux8IRJJ
	N1awD+eVNZX6xNI6heTB0Fk2pw+dXrHBkwz0j0zND6perTMrsH6uFPONw1Qmcri6xAUaU0T3Ijy
	N+MTR8f65nep
X-Google-Smtp-Source: AGHT+IGnUafWCWy5Rdt7v6HiJycDshOAZRfUCy0joNOLt5a4ewiL6UscKqQLOC6qUSbz771m3JKYDg==
X-Received: by 2002:a17:902:d545:b0:216:3b31:56c2 with SMTP id d9443c01a7336-21dd7e0ac70mr24649555ad.53.1738114225184;
        Tue, 28 Jan 2025 17:30:25 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c983sm89368105ad.7.2025.01.28.17.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 17:30:24 -0800 (PST)
Message-ID: <f5b72fa9460e4eda6e6b36756db855bfec67744a.camel@gmail.com>
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
Date: Tue, 28 Jan 2025 17:30:19 -0800
In-Reply-To: <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
	 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_173026_171897_B55B41E5 
X-CRM114-Status: GOOD (  12.95  )
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

[...]

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

Nit: this check is done by check_mem_access(), albeit only for
     PTR_TO_MEM, I think it's better to be consistent with
     what happens for regular stores and avoid this check here.

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

[...]


