Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04B9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 06:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AY5WU5lQWjVx2WV5S/fns2o9ZSTHNwmgBqh8WjXEwg=; b=XazcgNe3Wlc9LXFqr3IyV7Bwvn
	47wM0bsU6YyLjZAvpu7ulVilqb+YDjZTkDL523YFoK7xTq/NToAplSxdA4XcTV+fbCvSgTWNT3Zyk
	tFrqrvCCSNkLWhCnFELAmZWSYLsgE5N59DxhT9yH3BPL+ryo4XSnr3cLklgEPp04rwY2cYIfeSqtF
	x0+4+q/IhuqEghSxRlKEUv9Wjc4Bo7n7v7dzwgoWiozH4kX/RoFRIoOVStrliUgyWNuSgq3EEqZGV
	WDjjgsZPKup3Zh1k3QjoqmCvk0448ZajXd13R+bEvH1nEraoXoK7sIGn/8snNfxIejsspoonz3fkj
	/iTqrJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjBW3-0000000H6My-3w36;
	Sat, 15 Feb 2025 06:19:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjBUb-0000000H6Fb-3ZdR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 06:17:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-219f6ca9a81so56155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 22:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739600253; x=1740205053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3AY5WU5lQWjVx2WV5S/fns2o9ZSTHNwmgBqh8WjXEwg=;
        b=jlZv/cRxVENwaimYN2ZtUKc3BxOIURLvvjxaoAvXIxtKjTA5SmcFlY3TdSk30/gOMM
         2Z7y+pKvNUp2IHLe19r5c0qo+nw6yrlXNrkfieAtUdSxTHbJBRHyFB2TlHDIg0lg8bE9
         yAqbhYYiyY5SfQxIgG/GO97driruUh6nIqkqrHuG3GtafDE5qLszwBOL/mPrtBei1df7
         YTFjGmMKIunh7ySNFtxdN4FD1pxzPvxJ+Rx+exFhiIeLSza/YmXmkqXZlDZzy7CqERML
         PsQXZbEkskMJX3Xuu0IpjdyeKdFgHwqyRWFP/84S7yz+t6NhAlOgLGqMQlUX0CxYaD7t
         Satw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739600253; x=1740205053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AY5WU5lQWjVx2WV5S/fns2o9ZSTHNwmgBqh8WjXEwg=;
        b=RZ2k3T8+mUzZWcF4a0y0AdWcBNjvPg6lnH30WvPUsTjLVBOVhYxJJ+dvXhuSQLgqfE
         OPvm4w2cg4hXOMMXkUUA7WwXji9L6ANUNqT8ZvQURk8GAE4mB9mJSuSC+/oTALa8wVvk
         QdR0zuHElD2I/5/sJPvxqcbimgIUjoFPv9bz0/7SXe9cVp4CiJfbOblctn0zi5tefkba
         vQz7t8Q4M8t29IpgpYqEoc/t5ISdvNG/cv4WCglUncs/3rg5bOmEv21yHvbAsiwOYNuT
         ybkdylqpi988QZ0azlt3v/HNPQes/Bjx/HMMI+O1Eb+udmzf5cfFV0Smr0q6ShCWQWkL
         Mp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTUr8pHa9Fa06PDtwPH6PhfdUiOem+7qQmnfmq9jtWx4e8ARSLEu6htMShe61oQhMOSn3mdL5GgWW1aQhwhJp6@lists.infradead.org
X-Gm-Message-State: AOJu0YzwkWDN3hUc71oAHFsd0+wq0JmljaOKKBF/CH/pZlsGGnBWTpq8
	sdbEa7H9ED3n9ck5ZA5GPRdOWWd/ucJ4lN++sJsgUap4GKkZ2D9c8Vl3tL5FSQ==
X-Gm-Gg: ASbGnctsqVGHB9Z0Y+5uYAB1OL/9UyfpVFYnFHhmppPA6CkmaODrnWBqGucKlYsJ1pI
	BWKFVbFQpiNEXSFowH7mwMrgEO6Z0knoXLreZR5oxVYmPOUGDxu7h2Mv7m1KBfH34Gn4HHlaB5Y
	ciPpoPXoM5isYFcydOGzd7b9nvJzqElDbcaPVQNinHTZYzIQQIhrAk90IlS2boA1DFJFtjaKYEa
	L8dSRyn+MKFWGG6zYUM74ncMj7B4BABCNh4epa16pjuCDyNIrnJ3SWNg/NwE6ZoV8NtOB0zpnGj
	c5PK8J7Z+zQeE+7Q0a0OZfJP6uZV581+qbaW3q0iG/EsbBeoQm3Z/Q==
X-Google-Smtp-Source: AGHT+IG3gQqGGdGWUSbEL9fmOrHw9BsfZ57p5du2ldVLToKKJX9c4jY9plcbSAXbZCMwuUN119NPhw==
X-Received: by 2002:a17:903:94e:b0:21f:465d:c588 with SMTP id d9443c01a7336-22104c9385emr1243535ad.14.1739600252382;
        Fri, 14 Feb 2025 22:17:32 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e318sm4272875b3a.96.2025.02.14.22.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 22:17:29 -0800 (PST)
Date: Sat, 15 Feb 2025 06:17:21 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
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
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z7AxcSwD-topj1bk@google.com>
References: <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com>
 <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com>
 <Z60dO2sV6VIVNE6t@google.com>
 <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
 <Z63aX0Tv_zdw8LOQ@google.com>
 <Z6_9LgfOMeR18HGe@google.com>
 <CAADnVQKZ=pjXjyzB8tJj5Gen4odcj5H5JhXyRtVgphTEDCisTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKZ=pjXjyzB8tJj5Gen4odcj5H5JhXyRtVgphTEDCisTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_221733_911690_D5379386 
X-CRM114-Status: GOOD (  18.88  )
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

On Fri, Feb 14, 2025 at 07:04:13PM -0800, Alexei Starovoitov wrote:
> > > > How about:
> > > > #define BPF_LOAD_ACQ 2
> > > > #define BPF_STORE_REL 3
> > > >
> > > > and only use them with BPF_MOV like
> > > >
> > > > imm = BPF_MOV | BPF_LOAD_ACQ - is actual load acquire
> > > > imm = BPF_MOV | BPF_STORE_REL - release
> >
> > Based on everything discussed, should we proceed with the above
> > suggestion?  Specifically:
> >
> >   #define BPF_LD_ST     BPF_MOV /* 0xb0 */
> 
> The aliasing still bothers me.
> I hated doing it when going from cBPF to eBPF,
> but we only had 8-bit to work with.
> Here we have 32-bit.
> Aliases make disassemblers trickier, since value no longer
> translates to string as-is. It depends on the context.
> There is probably no use for BPF_MOV operation in atomic
> context, but by reusing BPF_ADD, BPF_XOR, etc in atomic
> we signed up ourselves for all of alu ops.

I see.

> That's why BPF_XCHG and BPF_CMPXCHG are outside
> of alu op range.
> 
> So my preference is to do:
> #define BPF_LOAD_ACQ 0x100
> #define BPF_STORE_REL 0x110
> #define BPF_CMPWAIT_RELAXED   0x120
>
> and keep growing it.
> We burn the first nibble, but so be it.

Got it!  In instruction-set.rst I'll make it clear that imm<0-3> must be
zero for load_acq/store_rel.

Cheers,
Peilin Ye


