Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A27C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZZ6RWDnljKub/rNqmhOhGtUl9a9akOzeS+eKL/NSi8=; b=V8tZmnUUq1Gz5rJ72AtA/WPS3S
	IPAIpYDEWx9UY7jagNrrF5XOaHxOCKVPC0x/9QmAs4dIhtB6Bfe7EjcgXvO61oiwX51pCKUTbC/+4
	O2IPWSZNv23IZAOqTpOsZ+k9YmCaJtHJC7Xv4udREsI/zsSitJGnumMZorG+q0ctUN7SIlqpt/rYw
	LN9q7Vtu2UgrYIPBBGlEIxs2QezhDvac8AKEHzOj6UuWqKiYDj/2phj01A0oXk+OOJs53uer6dNYI
	WsgAqT1q1NDkbdXGJRymlnj2WXHfFo8+5TWymq6f9MWw8xECD4j6pgZFOYzIXEz8nbozDPfFtYbHm
	Ct0Bvy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGLm-00000002gTK-3rBF;
	Tue, 04 Mar 2025 00:41:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGKB-00000002g7I-3hSG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:39:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22342c56242so72305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741048795; x=1741653595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NZZ6RWDnljKub/rNqmhOhGtUl9a9akOzeS+eKL/NSi8=;
        b=YiVnEzdKa6v3YKUEyQF+VDDQ2kLG/q0U6Zqsls22lcSbDbNZl9u3ucvE2YgN2DKyI1
         8FHdyeQ/xLFBmTQ0WpjCigsGBXqd/lpnAXzT2datVIF+xkSyTzd2DJ5mKgt3f1WFQyfa
         puYrnUzevfVdxOPGTr6JvZKHpnoDvDH4PRdRbLWXMC96glHyOQnTH6VX1NJMTtIHDY7E
         wCnEFbu9HGr8dDSOePkbh18HFfO54Kx3A5jUyiSHyjZbN3iN+hEHXHsNv3ZCsSf4VtYT
         f9DSGAnb/x/Z/4HeXbtyuYU4Y56W+DLuMbJhUkNiRwWvQaHD/++QIXMC1IQcJ+mZJk9H
         7nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741048795; x=1741653595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZZ6RWDnljKub/rNqmhOhGtUl9a9akOzeS+eKL/NSi8=;
        b=puiZuj1HhCaXwwBxZvlkTg16dme8YSCXlSg/3RanCzgrJFDQMf2xY13ON1X4noILwY
         J/mHKb0p+8+KjfcC4vH4kecP0BUvaNQWmG8ElpHVk8NcCdGyLOOnYNhhng9V5xVZq+wS
         0Pc4Y4Baq7+w1U+JTiMW7y7XWhXqAwK2yjj9iiShGIr57Jc8cm7kUE4zGs7LUO5Pkw1G
         C5QaOSc0JCQMvpGqzdJ7s5j/k78DkVhl+Y5EWOoPoT8wuQXx/oSkRMVg+Sf+jaa7rUQp
         5Z0p8X+uf0qC1q6jcKqiNT+6QZzNCOdVYRlA2t0fugzHferFNZQ9BgNcQGBl03elmFx7
         WPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPl+fzo4UoRJqhxn3AhCybmvi8HQYi+ED8Gx81fTXWyCE/BKG+OBSUSkNvIzHMnTXfa/Wjosl5MZoXjNE7V/bh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp5GNTFkWsL3uYQPFHUqqZretMk+qHLo8pB/yRrpR/cVPIpY13
	u1eIVMSVFmAlw5fNkJIxWcwzvTyN5M/K22JgTXIFL7ZsYvPHX9CNzEhKQigEvA==
X-Gm-Gg: ASbGncsENY10nx4lh/EkMedH5Q3tEtjOBmQmCd+PWFWZE/rtDj2Ry3O3sYo17eE1Wp/
	tVOS3luUYQxb9/cFVYzoV0ldvXpjWqgtF/jnRLnY3o2JppCxv6b7+6h5RKDjMEfAovtVIQgxL22
	xYC5izbbX5ZVbN2g0KGoG/PZdP2Zjnv93ZkX0YM+ZXqkDWPt8hUU3Gm7rD/U3Ygdu933/EcF+VV
	G8Cax/di5TGof2OWSKWjNf6U0Cm3HT7b5yHiLP7A73zMSlz0S5cLG3+hQjVdYEEOMgwXbBw3Va+
	HZTQIVcH7CsFOR3tubK35GzzQJDT6noW1rVuZpeqV70CN202oEvB5BtMyB0aYeXyj7v/5KwjqMl
	ptetZCFU=
X-Google-Smtp-Source: AGHT+IEFZMvKPvqJtn6porx/jOyYtLyQRQGPPfM3zCCktwuBu79Q8Ew7WkeXkukdVZEY0NkgznAoKg==
X-Received: by 2002:a17:902:ea05:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-223d9e0df5cmr1199935ad.16.1741048794489;
        Mon, 03 Mar 2025 16:39:54 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee90c7e519sm6971619a12.61.2025.03.03.16.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:39:53 -0800 (PST)
Date: Tue, 4 Mar 2025 00:39:48 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
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
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v5 1/6] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z8ZL1L69z8XWm8vl@google.com>
References: <cover.1741046028.git.yepeilin@google.com>
 <b0042990da762f5f6082cb6028c0af6b2b228c54.1741046028.git.yepeilin@google.com>
 <CAADnVQKX+PoSUqPBB2+eZrR7wdq-8EVaMxy_Wur7g8wyy3Dcmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKX+PoSUqPBB2+eZrR7wdq-8EVaMxy_Wur7g8wyy3Dcmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_163955_929446_7023D115 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Alexei,

On Mon, Mar 03, 2025 at 04:24:12PM -0800, Alexei Starovoitov wrote:
> >         switch (insn->imm) {
> > @@ -7780,6 +7813,24 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
> >         case BPF_XCHG:
> >         case BPF_CMPXCHG:
> >                 return check_atomic_rmw(env, insn);
> > +       case BPF_LOAD_ACQ:
> > +#ifndef CONFIG_64BIT
> > +               if (BPF_SIZE(insn->code) == BPF_DW) {
> > +                       verbose(env,
> > +                               "64-bit load-acquires are only supported on 64-bit arches\n");
> > +                       return -EOPNOTSUPP;
> > +               }
> > +#endif
> 
> Your earlier proposal of:
> if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
> 
> was cleaner.
> Why did you pick ifndef ?

Likely overthinking, but I wanted to avoid this check at all for 64-bit
arches, so it's just a little bit faster.  Should I change it back to
checking BITS_PER_LONG ?

Thanks,
Peilin Ye


