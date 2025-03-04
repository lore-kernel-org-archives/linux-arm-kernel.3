Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCE9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoReuE6asGDfkwfGwhoKqE/8EGEbi/2qhNeBk7ffGnY=; b=ubDYNQUnlWRapTsG4EotNEy56W
	IJYwhlb6MJDnXDYlfQU13yLmmKr+HSEYsBCzMsuyKgWIrAkifEE2Q6g0JVMEPee1QBI7pjfxhl7bE
	18Kgz2hFdNbAi50pPvs/1rTveqx56JlxoUhprAUwwzowb7x3wSK27veGRlRfZ81gXlvAvPCjZcIrw
	dIggI+PID+3SwreRGB1BUjqU8xX73BHFIK0TXt2MN6xCHtA55pUy7IHKPRljlQbart1ULWJSY9YPo
	3Ki0fet0YyG91GUiyxagkBZA02ARTT3eqjumKJnvsmbWUc44VVuyKyALuOMSec3sA2GbKLDC957x+
	j9pwbXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGV7-00000002hj4-1IPF;
	Tue, 04 Mar 2025 00:51:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGTV-00000002hcF-0y7B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:49:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22342c56242so76355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741049372; x=1741654172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoReuE6asGDfkwfGwhoKqE/8EGEbi/2qhNeBk7ffGnY=;
        b=OuoKLE0rN1Q2PjBTaeRFUDmUaWKbPOgLtlhlMYp0xn1WVqQYt3LEsbyZ4ZDuZq668i
         Qg8XdkICXdl089bbG3FKlCI/IR9lS1mwXlMUf924MS+AYv3AxJU2EjoWubSdwYeg91Rn
         qzI1xooKgWecosdfYfgk2nKVlDe/XQsEmgh49AtBCq65zQblzr3NZGzfHyWl/JSS0k3W
         XULcMkuRblT/yxdSLPkf4VYErlM6v+eJU1zs/KwdkMkMjIWW5JyEuyljWoQKthhOvVBw
         pu9edT0DlHGtuaLZOf676FRkmMpHv+T54BjWOK43GlJhBzaG51lwG6IqYcAjAVntCxLJ
         unag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741049372; x=1741654172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoReuE6asGDfkwfGwhoKqE/8EGEbi/2qhNeBk7ffGnY=;
        b=U3jV2YvSw3qVJPtPBeWy+CXcjfBtXqWn0oY9nD6Z9EIwoaAoGedGLwwfGaLXDuMvZy
         hhYg0WMJ0EAOttofWazmIrcSKxtFGp96rPRyoapxE7+FYShvCAna4Wr3KaUbf2Pgqth4
         nUrMdlEiZEi/48jMOZy62OPe+oeFVmv8glv63jgfcDwU6QdwnPHdEp0pNAfdhwBo8hyk
         hDkbksUTxjlRUAlpamk73a+ks0Msz0oUFvztk8O8kooFR3dwbGONZKOFcNk2yx4/CwRc
         ECFrgWbmUGCRsbOMePmkh0NmlVqQUKNppZUBogKPEzJulLj7bHKHi0DIMe8Fonl5YBgB
         meTw==
X-Forwarded-Encrypted: i=1; AJvYcCWnEkLZMw8pVPKWNMJLRogCF1Q1WN3Q2Sot3RJT2KSgb2geRFJWSom0RELJMBOVKb8ACzBmYnRCCwYd6t+hUKeG@lists.infradead.org
X-Gm-Message-State: AOJu0YyhjIDgco0HpJAeruyQ5Ug79T7oyy4jYLSBOVUeJ3i7yFKFSskw
	M8KK2VvWur13AyGSde976fb1V7qVZDAXwBcAsKzno+qF4nBhH4BnZs073e5iDwUqrZxAXQA+n/7
	6+g==
X-Gm-Gg: ASbGncsGKYyLaGQAkqMaabkMHT0EbENu7hXzbI53E8uEWOi9t6pe68nyBu5CvwGUaAl
	LgIDl4kBr73+LIQ+kZ12lq3EwpbJfpZZ37cqI4ec6fYZ2Y31Y8G0rWXYb9aQrAGDtvpVAB/x5nM
	o15Bb/U100se6hovExCT58V8xhVU5XFVH2IDaux2fhwAiHOwJT4+0qlzy/10KghBYJ64ETF8A+G
	rFrjM/Mr8A4cWRBJLqPp5EgAxGYKFVO0WlKz7AsQuT+CQJSeQ/EbworQ8e2eoWNYfZa6bDKHAlM
	x5iwUyP1ENiPoFsO40o17ZFCrNz3ORX/Gj/TqyYmQnfhZS2BUtTKBU6DUn5lE/YIC3apKhiwGm9
	03LJej6Q=
X-Google-Smtp-Source: AGHT+IEKJygGea3iGVQpLJ5KAZvsaHIEMaMbTiFzmDyQ9aOxx03XBE9WH6aGAXRtP8RfT71qOYfUXg==
X-Received: by 2002:a17:903:244f:b0:21f:2ded:bfa0 with SMTP id d9443c01a7336-223db43216emr594345ad.25.1741049371943;
        Mon, 03 Mar 2025 16:49:31 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2b85sm11728851a91.26.2025.03.03.16.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:49:31 -0800 (PST)
Date: Tue, 4 Mar 2025 00:49:26 +0000
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
Message-ID: <Z8ZOFuipuznnOD-7@google.com>
References: <cover.1741046028.git.yepeilin@google.com>
 <b0042990da762f5f6082cb6028c0af6b2b228c54.1741046028.git.yepeilin@google.com>
 <CAADnVQKX+PoSUqPBB2+eZrR7wdq-8EVaMxy_Wur7g8wyy3Dcmg@mail.gmail.com>
 <Z8ZL1L69z8XWm8vl@google.com>
 <CAADnVQKB-9q6fxcVPbd7Ee+QBH=_ySv2EyULkgFhv_n2i07L1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKB-9q6fxcVPbd7Ee+QBH=_ySv2EyULkgFhv_n2i07L1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_164933_272492_2E1476EC 
X-CRM114-Status: GOOD (  17.39  )
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

On Mon, Mar 03, 2025 at 04:45:45PM -0800, Alexei Starovoitov wrote:
> > > >         switch (insn->imm) {
> > > > @@ -7780,6 +7813,24 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
> > > >         case BPF_XCHG:
> > > >         case BPF_CMPXCHG:
> > > >                 return check_atomic_rmw(env, insn);
> > > > +       case BPF_LOAD_ACQ:
> > > > +#ifndef CONFIG_64BIT
> > > > +               if (BPF_SIZE(insn->code) == BPF_DW) {
> > > > +                       verbose(env,
> > > > +                               "64-bit load-acquires are only supported on 64-bit arches\n");
> > > > +                       return -EOPNOTSUPP;
> > > > +               }
> > > > +#endif
> > >
> > > Your earlier proposal of:
> > > if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
> > >
> > > was cleaner.
> > > Why did you pick ifndef ?
> >
> > Likely overthinking, but I wanted to avoid this check at all for 64-bit
> > arches, so it's just a little bit faster.  Should I change it back to
> > checking BITS_PER_LONG ?
> 
> In general #ifdef in .c is the last resort.
> We avoid it when possible.

Got it.

> In core.c we probably cannot, but here we can.
> So yes. please respin.

Sure!

> I bet the compiler will produce the exact same code.

Thanks,
Peilin Ye


