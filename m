Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94758C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cbp44K+2t2aI4JlVPc3K/t0BQ8ZOkIpiOPV8PBHdLU=; b=y3sUHO2VGdLNEGZzYWuVYFpXOy
	KRPe+vpZpDkCz8kieJrRCGzkK/NoVJTU7pHzmYh0H/yR48smpuaugXa2Lz7oU0v8QL1BPKIzJV0NR
	uB8HEwoqgLhRsYTUh4sy5wpNqytrvstc1We6jeB/E7X25pSYZ7H/sQB7ukeJSu3NAGxIeYlRhZwfD
	s1b8jL2VNR5hynNCPEJrBAyNR13TSnYDv8t83TI4C5ub0x5jbsiBHWyRUswkiZ8HSTx3Yftnwy5eZ
	o6G6o3AVx5S4XDiwOLTi0aDYk7NbRPO3DTCWLGs7ACU9YlTBB+jcgS1+Y/EGyFR5dks6eDzFRo3ix
	AceBsTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxFJ-00000005FgC-164v;
	Tue, 11 Feb 2025 20:52:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxDt-00000005FVk-41mn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:51:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f72fac367so32835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 12:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739307073; x=1739911873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cbp44K+2t2aI4JlVPc3K/t0BQ8ZOkIpiOPV8PBHdLU=;
        b=09CgklgZXP+1BAmI7sBNyqYIzpQlFJVEnjUVIVoiG1pz5fVDKrU8dW7J0INVNtckz0
         n7URYVN2q0jwRdPAjPq0JszWx9AuSlX5h4HKnNEjru/d0+XDl+oQxVSQhwA9bszFSHkt
         QPiZLAWxEZcGt8FbuDFVnLJOtz30itfQC9VZdkxsFXw/RYDOgluiYSzO1YRQaj6O1jFU
         NDujNSY3FyMGAHqqXEPzHnyh+cvDNN5L95NYa645F7rrv1EhxS51D2Fb3oKp8RLacnch
         dPcyTbbopiJWnGP6WVrhIqgu3IlOAJ0BXD+SXsUv5dtAxBNnJwG12z9nSuCuHI+CaUE3
         6XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307073; x=1739911873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cbp44K+2t2aI4JlVPc3K/t0BQ8ZOkIpiOPV8PBHdLU=;
        b=Ulm0zwpHSSempIAv7NuUzX+Iej6zYOG8uJVAYtJE91Ugt/7B+JnsH9Wit+gElZVsaS
         NNH/z2Op0byqBrIwJC83xX8QoSxg5LVW3CXdO1fEtO6pd11L3c6Evfrz5QV71owZ6o7d
         snVcdpug5CowgQbP2s5e/7wlUWSsd73K6PksmoY0hFNjXms17lWO6xBGlW+lCsVJ+0D1
         GN2RJUHkfoweNNfSx6KzJA78kM7AJXqxvp+OCTx2pgSniYMk0Ld3JPYhPdmNThTVlg3H
         8JTga1MkZmk8S6QZ1jGru2AsP18NCEVHqhAU5BQxqvgQGdKtunxxRBzVwsUuNFtCD3ES
         89ew==
X-Forwarded-Encrypted: i=1; AJvYcCVqjvtmeJDA+YoajZbTcyAmOeDRnfZrIx/vJM5b1Vw0Ls5IBSvz0m3oyG42HBuRc7ZlrIkPn7drKVEiNNEzJPpM@lists.infradead.org
X-Gm-Message-State: AOJu0YzEp7QC/c5SbOcPPwbCoJ8S6s4NxRYEyC3KFWsOkVtvo2Frj2Eb
	QetYMHCLP5zDfepAU91fjd6qCL87icUcUCjcCUzzOz9cS2v+eiokTZWiqaCifQ==
X-Gm-Gg: ASbGncv/sjh0dYryOLta289Bi2ZY4e1moSq9PeXezcR6toc/eW8Mf+ov3dggYdUBMoZ
	TYdi8qnKP3/Ij9Ii8LS7whY+RcepfJ5e8dGZsw9VDYjWPwgG0vUw8SUTWYuuMULaEYI2Uzt2FsO
	6SZl8CKasU/mutL7GUEPx2NIcHzA6BfMlf2vLHSVv0n8jsS5Vl9s1cVqTzQAUowO0QDBcaoWY3B
	UUUW4c9I5YH7Njqu7/m6oNAxH1G4DKnT6fNTcUr/hxZ3sTyiReDoN09bKSz/EK0H0w1fIB8nmco
	aY2Yxe0tZOHCvHZ53Xltmzut0PFQHEY13gYn2bv30mzEvFg/q9YhiQ==
X-Google-Smtp-Source: AGHT+IEoYw6Xy6tdvQD2RuJDCstg+zNrGFKyrdHcKRTwJeauQbld+07Eum8Nx/l1zp9xSJyZ06hmGQ==
X-Received: by 2002:a17:903:1013:b0:216:6ecd:8950 with SMTP id d9443c01a7336-220bcea1c92mr355775ad.19.1739307072784;
        Tue, 11 Feb 2025 12:51:12 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa3ff14a28sm7543706a91.14.2025.02.11.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:51:12 -0800 (PST)
Date: Tue, 11 Feb 2025 20:51:07 +0000
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
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z6u4O930eIbAVVMZ@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
 <Z6ugQ1bd0opoGRYg@google.com>
 <1d2d919ae6848e2cf80b81ffe5f94fd31b8ea6ae.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d2d919ae6848e2cf80b81ffe5f94fd31b8ea6ae.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_125113_998557_1495420C 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, Feb 11, 2025 at 12:15:25PM -0800, Eduard Zingerman wrote:
> > > Nit: why is dummy_test() necessary?
> > 
> > It's just to make it clear when these tests are (effectively) skipped.
> > Otherwise, e.g. -cpuv4 runner with LLVM-18 on x86-64 would give:
> > 
> >   #518     verifier_load_acquire:OK
> > 
> > With dummy_test(), we would see:
> > 
> > (FWIW, for v3 I'm planning to change __description() to the following,
> > since new tests no longer depend on __BPF_FEATURE_LOAD_ACQ_STORE_REL.)
> > 
> >   #518/1   verifier_load_acquire/Clang version < 18, or JIT does not support load-acquire; use a dummy test:OK
> >   #518     verifier_load_acquire:OK
> > 
> > Commit 147c8f4470ee ("selftests/bpf: Add unit tests for new
> > sign-extension load insns") did similar thing in verifier_ldsx.c.
> 
> I see, thank you for explaining.
> We do have a concept of skipped tests in the test-suite,
> but it is implemented by calling test__skip() from the prog_tests/<smth>.c.
> This would translate as something like below in prog_tests/verifier.c:
> 
> 	void test_verifier_store_release(void) {
> 	#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> 		RUN(verifier_store_release);
> 	#else
> 		test__skip()
> 	#endif
> 	}

> The number of tests skipped is printed after tests execution.

Sounds nice!

> Up to you if you'd like to change it like that or not.

I'll do that in v3, thanks for the suggestion.

Peilin Ye


