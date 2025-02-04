Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499F4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIVwnmw3+Uqu/f1OwaIZM60ey1qrW+y4C63LWJ9AWxE=; b=XQxwoJ0eOGj/hfanjvSN0UyhTo
	u37YO8XjqXGfhpIMsvCXq39CFrF7OWuhjTUCb6UJl2AycnBiKtSDNqh6imYO7EgZ2r4mrFuULiF4O
	6tXumbLj4OEEBaprCw8fBrthp+sbegblTJZqnW9tujFeti7g96vKifvUrtyRoXMd/4AfcceTPNcMd
	ixF69Cx9V6cfqWPX+3k30iRMUR0/TFaLgZaQm22m/R54k2NZCYvkMwwhJrWKya49RDjNHb5WUfXlu
	/62QPkDzND6EzwRJIIbJlCZOFEllPktEYrz77DFe4D78/cruQwbdpVN2kPZzdYPsU/VdUowhiJevP
	QymkIMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7Cp-0000000H0Ux-3zVE;
	Tue, 04 Feb 2025 00:54:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7BT-0000000H0Mr-0zZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 00:53:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21f05693a27so352275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 16:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738630378; x=1739235178; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yIVwnmw3+Uqu/f1OwaIZM60ey1qrW+y4C63LWJ9AWxE=;
        b=goUHdSNt3MCPyedKQpTuEoWnhkj/NFJ72dXc6mkEyS92kEhceWqHcnrO66ZRt63AWx
         et8SmwUUBLCWu06vNXeIj29s3lywPJABP9EAgf5ypTxmFjdCcUtEqdxCNQi5f7+NjxOK
         6zD60gumgYI131O+lL9o1vSzWK+V+/xUypOeKdyRbg0jzzW/iadSTZh/F9l4PymShGqx
         H9OSM/zCnD7yQ8jDI01c7nl3f0SiRMbW00qg4Ox9+S7/S2oqdVSMiR47810PDnh1aToq
         t3kvHFSv11vb7uL8iwg47FJB5XjsvFd5zgienNahCxD2P31HEmtMhiGV4BbUaYHY19h2
         g1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630378; x=1739235178;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIVwnmw3+Uqu/f1OwaIZM60ey1qrW+y4C63LWJ9AWxE=;
        b=AoEKWSqyEZB8khSj9kaTi6ixTUt5slbt3k5xGSrO56myitgqcEdR6Pz4+MjHSRuYBn
         Ae+34gyF0MropmItazUu3ItrBiZbYH16Fr/FLczat+mwYJE2JxP706lVKMAlgvqvppXb
         fC2B3TFXLSQV/NDgCniSbibF+4QStYkXnKzZoX1qhsLWqy3GYANNqLxIZ4zuR3Y75uLq
         e0bzZKamlku+9HJFAOx1fDRz3t27nG+6o/yUDXvszQIURAXwEz9KnuNMtzXZ3BdmWkT6
         AtkNQRMQQeLhcH6b9u32Cwz5DOhZyHH2SVoNjAOOzl8doASnIsY/h623MUcj+bTRP6k7
         2Grg==
X-Forwarded-Encrypted: i=1; AJvYcCUjzV9uZGguUD66rSfCWgOx1HgtnLXCtxHmVABQxbuCeeZ721r0Q4BPlqvkEePpqrXBiFZB7IpPVm3TKh2EYbo/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzehnw3srsxvsry2HYobHeZkDOhG/zL8m1R1pGaaMLMvN1+7+SW
	dcWf0uk/zndwgg6m4tW72afqdXLb2Yv+dyDVksB4wSPzz4DtkfvJ
X-Gm-Gg: ASbGncsyG37J2cbOIQjDwKyDz2TprPtT/gKofAaVCwNEJhkdKuQj68nvDokqhoC23eN
	HQwydONiQjqE6Y34oKor7rpzyGpkXK2vduGgoqCBbw3wrDm4YpBB0P4pV9YonjpVaPLylXkjU2V
	tSC4coSZ6YMZUMge1wzwgQr+dTs4cI2mRT285Qont+rPJtgSvWDyygGg0gjDSzLF74w/en3X8Hn
	BYGixpCK3BC8dPKJn9VkxWUUe5Gl0n0oYt9SOxdhdT05nkCn55F0e3ahxw8QGkEynZrxqLR5YYr
	27wgXI2IPYFf
X-Google-Smtp-Source: AGHT+IFFrOOp9tSCjr6GLI3eesNOiZDZvaAY/wNz+1FZqhhHxSr5HGXiX3u1YhbOfgi7hgk0EZO6Fw==
X-Received: by 2002:a05:6a20:9f45:b0:1ea:ddd1:2fcf with SMTP id adf61e73a8af0-1ed7a462e94mr37266584637.4.1738630377942;
        Mon, 03 Feb 2025 16:52:57 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ccea1sm9117958b3a.122.2025.02.03.16.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:52:57 -0800 (PST)
Message-ID: <dead664fa11ac274db00b509931c533883dd4fdf.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
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
Date: Mon, 03 Feb 2025 16:52:52 -0800
In-Reply-To: <Z6Ffquq8IORjCqrI@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
	 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
	 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
	 <Z6Ffquq8IORjCqrI@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_165259_274966_34EAB172 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, 2025-02-04 at 00:30 +0000, Peilin Ye wrote:
> Hi Eduard,
>=20
> One more question (for my understanding):
>=20
> On Tue, Jan 28, 2025 at 05:06:03PM -0800, Eduard Zingerman wrote:
> > On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
> > > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> > [...]
> >=20
> > > +SEC("raw_tp/sys_enter")
> > > +int load_acquire(const void *ctx)
> > > +{
> > > +	if (pid !=3D (bpf_get_current_pid_tgid() >> 32))
> > > +		return 0;
> >=20
> > Nit: This check is not needed, since bpf_prog_test_run_opts() is used
> >      to run the tests.
>=20
> Could you explain a bit more why it's not needed?
>=20
> I read commit 0f4feacc9155 ("selftests/bpf: Adding pid filtering for
> atomics test") which added those 'pid' checks to atomics/ tests.  The
> commit message [1] says the purpose was to "make atomics test able to
> run in parallel with other tests", which I couldn't understand.
>=20
> How using bpf_prog_test_run_opts() makes those 'pid' checks unnecessary?
>=20
> [1] https://lore.kernel.org/bpf/20211006185619.364369-11-fallentree@fb.co=
m/#r


Hi Peilin,

The entry point for the test looks as follows:

    void test_arena_atomics(void)
    {
    	...
    	skel =3D arena_atomics__open();
    	if (!ASSERT_OK_PTR(skel, "arena atomics skeleton open"))
    		return;
   =20
    	if (skel->data->skip_tests) { ... }
    	err =3D arena_atomics__load(skel);
    	if (!ASSERT_OK(err, "arena atomics skeleton load"))
    		return;
    	skel->bss->pid =3D getpid();
   =20
    	if (test__start_subtest("add"))
    		test_add(skel);
            ...
   =20
    cleanup:
    	arena_atomics__destroy(skel);
    }

Note arena_atomics__{open,load} calls but absence of the
arena_atomics__attach call. W/o arena_atomics__attach call the
programs would not be hooked to the designated extension points,
e.g. "raw_tp/sys_enter".

The bpf_prog_test_run_opts() invokes BPF_PROG_TEST_RUN command of the
bpf system call, which does not attach the program either,
but executes jitted code directly with fake context.
(See bpf_prog_ops->test_run callback (method?) and
 bpf_prog_test_run_raw_tp()).

Same happens in prog{,_tests}/arena.c: no attachment happens after
commit [2]. Commit [1] is unnecessary after [2].

[2] commit 04fcb5f9a104 ("selftests/bpf: Migrate from bpf_prog_test_run")


