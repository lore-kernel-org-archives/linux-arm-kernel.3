Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3B0C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWSgdcI8dG/w3NgMEY0KO0rcu2pqeCGSWeCl1Jx/eh8=; b=lbAAMVcNCwhxWE3wrFMamcpjVN
	jaARZnK4mSehZhZcHJ3J61Ar4RXc5kxVjAFHqhQre2+OI6s4d7sp7ErKSsbW/NMRLjPmk6m7c7Jzt
	FPTnnMD8AltnxEIB3pssxzlWIh3ik0JxK7Cx9gUuUw8u1O4VamFinTi6cyLM38f1Qf4oU7na2LEbF
	FC1lEuzmcWoVx7PJtH7Z8Beitl2nJsIu5EjfBFbKe6S+5cCaFmA5VeEh6ORHJwnnVG+NPHw/a+4Fk
	52IqXfpPJTTysFxlsZWE0IU8N9l0w+jCIAYEYj/8WbgIc3Y0WrsxEw6y6ZCOLHAIjw+N88vvx5sTh
	lAUmBX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBHL-000000022xY-2QYc;
	Mon, 03 Mar 2025 19:16:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBFk-000000022O7-2QIs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:15:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-439946a49e1so31193685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 11:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741029299; x=1741634099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWSgdcI8dG/w3NgMEY0KO0rcu2pqeCGSWeCl1Jx/eh8=;
        b=ifp3FNTsuggnCTns+MeHQ7cAXAf0opTY7jZ93tlzCHeQPhfng1nQ4UKHErXF5UF5QL
         5PX694vocY/U8yDeac+nAvOnaxeIyztk/IfYpExygkbyq/Z3SAFYtz4X3dnHWPQmaPrP
         sAuQimVsV1ek0lpfJE/9dUbk358QZhqBP+wmUwhVd/gYJYAD5QTUeLrkv1PGjrFPtzOx
         ajpMPRFryJzjjOaQ9lptLCGMf/QFUIEq6VNXkU4wG0W8rSI5SYeVxX5t+1GM6eCu5wDX
         FFUAysFxmlJZbvDPBU5qYv7CGOMBZb3dgBa3h8KfYHrlO8bXSGrur8wItTNi/0nI0QSe
         vK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029299; x=1741634099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWSgdcI8dG/w3NgMEY0KO0rcu2pqeCGSWeCl1Jx/eh8=;
        b=Cppe1FnLV7/wINn2VkIVcD9CyRIt9PK/ZlR+cGR051oFSndce4Zqp42dwvjwmmOdBr
         ItrCqCPaPbGrtb+TzmRF4egVv3a+dk5/9vVhYE2c1OneAQfovGw/gx6xN6ge3b638uPI
         biD44xhFSROhIbDjUFfXwvN2tiRQ1SMFprPasCpE+hxkNgntrNFlP84w8qsr/OryDuuJ
         NBsiUWoshNNNzcydl5JHO8hFpGjC3CpIYiiNWe7/jzuryT4xdQ1a+dDUBwfkDU9dV00t
         yN5wPcKM9b8UGY/dXdEXZyEiYp89EcOuKnmnE/kGYkkdm63xsLmstXScRqjKGtktfWL1
         31SA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXo8dQMAwZvMcQlyFxZr4h/2/7CqoCef3+tsSBxrnIsBqyZ8KlvQKjyVncyy+WeDDcC9YkMpRve0CPSF9Q62o@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNR80Upl75xWei84nFngDv7dIBAZMgCgSPxg/SYqLREQ/N8jG
	QuhAuYQM54Sztcs94lGgpJC3N5MyxWk7stlIc3aoXbwQPaT220yv2ElA8RrFC0jyuuAN+Iv49zH
	3Tv4nPooNAd3Wt1yS5zjhbgAQEAE=
X-Gm-Gg: ASbGncuYttB6N57472w+RPg8Z5FtxsDh/JJKGvRkzMaF0GVisKLwX/R6S3FEQu4yIIp
	ducaqtT6ckeDDdR4weqIFeNIbGk8Etv9RUdRKXbC4+AOBsbe8RD3vj5yZJ2c0MfNGcMttdwERzZ
	+iO9lCa5c0STsDXvOj42hO1NQn3E51zRq9enotGVJZlw==
X-Google-Smtp-Source: AGHT+IHpw6BVblTB/molY0Q0Y/ADp05hOeMI7HCXhDo9q5bq91y5rh4QhpWVIspkwtFNbOUmUW2kmujxGQNENx4qkDA=
X-Received: by 2002:a05:6000:156d:b0:390:ea19:d182 with SMTP id
 ffacd0b85a97d-390ec7c9728mr11013342f8f.6.1741029298655; Mon, 03 Mar 2025
 11:14:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com> <c835515c35ec4ed59232adc3c02e1e90aa8ed8be.1740978603.git.yepeilin@google.com>
In-Reply-To: <c835515c35ec4ed59232adc3c02e1e90aa8ed8be.1740978603.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 11:14:47 -0800
X-Gm-Features: AQ5f1Jqm92S27bYfKP6E_fjREpNJNcb270wk3R_NNsZJZvSBllfjQErWMz2uTWM
Message-ID: <CAADnVQKGF-yD6UZ8Xha-wHu+7Jzn7Xa4Xu9Rju0hL2vFknqNEw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 10/10] bpf, docs: Update instruction-set.rst
 for load-acquire and store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
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
X-CRM114-CacheID: sfid-20250303_111500_615997_B2D4084C 
X-CRM114-Status: GOOD (  11.50  )
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

On Sun, Mar 2, 2025 at 9:38=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
> Update documentation for the new load-acquire and store-release
> instructions.  Rename existing atomic operations as "atomic
> read-modify-write (RMW) operations".

rmw renaming looks like a churn. I don't think it adds clarity.

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

I think it's better for new groups to include only newly added insns.
Also we probably should add barriers to kernel/llvm and only
then update the doc with all insns together.
Otherwise we very quickly get to atomicv3 and v4 groups.
Naming wise I would call these two insns plus all barriers as
barrier32 and barrier64 groups.
cmpwait insn should probably be there as well.

