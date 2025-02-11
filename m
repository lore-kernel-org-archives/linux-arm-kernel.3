Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A5BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKXkzixeQgbhFTp23RVq91vCGlv0JVX+RKV3xjdQZxE=; b=W9o0PKZyBIaTFuxK5EadrvLktO
	WsoxHfQxqWHabPz+ZSBOKpR3ssw3hPYMGlFucDRXqWs35MLKW/2ye/211RWDjIbGIX7oSZNYC1/Dh
	+ro/o2uLqaRg/KESNrghnUlsZ1ZjXkPpNPR9NsF1TynwJnQZNayQ7tWSccwneCtADpHQM4S6gXH4J
	laTzyLJj1zlL6ntMsqgHz8yRJjNLP3YJ8RAfLcLucAs6+BkgWSC7Cp2NB72MXs2AgW1SILModxJqD
	GTAYaHRGjC+yLFH4U8ToHY2rmONwZ5SseJaa57mJNm6qZkkoJuyrRyQKAdRav5/wdciENEET16Fs+
	r4/6Hy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwgl-00000005AwS-2mRy;
	Tue, 11 Feb 2025 20:16:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwfM-00000005Ap1-2IhO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:15:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f55fbb72bso77238905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 12:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739304932; x=1739909732; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hKXkzixeQgbhFTp23RVq91vCGlv0JVX+RKV3xjdQZxE=;
        b=D7SX5w3E5zYCVRj/eYFGYiCqB5y0czrqKjmRL4oPn5rG4KJzKooD3LBIiki/fuz/QC
         VPeNnpomyA8LZgb9G6C9CV75vc/ZwcyJccUaaLobc+LKXJC61V85SwdWvNaFAlI0vG8A
         TBpMw9uWObXOXoMToJ5bL9CsvNfpo0zFXaU0hfRNfvv/UzQnBYOjkeD0mm1MlmU8nN06
         c54EuEgG6TC5FWKEieB2yDGLY0rl3t2NqjZgYcKvPVDORmve3UeOg9igk3NSDdgqPmoP
         Fq4vFKYc9OBLFTBKNrXIsN5ciVePgXF1y9Gh69MIDNRqyBeAiOXOq1DsKkY4sTZgFgmM
         yrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304932; x=1739909732;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKXkzixeQgbhFTp23RVq91vCGlv0JVX+RKV3xjdQZxE=;
        b=vDYMAOf0PYdbGlD3WOX1ivkHGScn7D5aaMUoLxEjfkz5Cs0khgX6Q2DWOMQWjmNH1v
         n842F897H6wD352bjDjK94SgdCPAGsbOX+30qMb3jxRuqKgP5ewdA/kkZbg3yQZyrMZz
         B/9+T9qRW6bH7uXZfWMByweVaojdBB2yY8wXSOiA6ZOxJHJSyfhfItUDVBl+AqLXG8ZM
         2TaTn62DUcd1rBke6lrNxmkfIGn3HIW16Dbk/gqRN3vhDfqeTPwbD6B0WQGz3F0GgLPJ
         x6hGKRIqTpWo970nwzcB3dO4tR4Q41Mn4Cvyc80MiRzxggic+8DuOfjhDwiC6XEHDF+V
         Yefg==
X-Forwarded-Encrypted: i=1; AJvYcCWO24TCA8e9fkloqhKWNV2xTSiuVgyrMZ8Wi5TN7PYWklBWDDSr8Gmju/yJAAAgALNCvuOAW2tBOD8UEDeqDZfY@lists.infradead.org
X-Gm-Message-State: AOJu0YxC1VRJe7ivquATjWOctU5VoWM8hjW7VRsttZhlV1gcv0arUd4A
	e/llo8A0ItqCBUomnXduVmHtH6+Js56kePhS4V6YBs1pbE3Csc7H
X-Gm-Gg: ASbGnct/mT3jwPYkQaVy+/cM+YFuoPnmW4EKlRKQmqIgBDzfq82QvxBOL3dAXE+lT/Y
	DkuSnKSrJAEFNIImanwK6D+i/jHVVTcb7kfxSjMk301A1gdlaixeZqbwdNGxKQtB7FYBXOmUWp9
	L9lYrb+sI2yHWzGuGfR6Hx7ZO+anBV/prv9HScxMk8nfHDRapi5uEeqsl8/AQ+919XEB/dk4rZx
	aP/WNCSR1eGpXH7pgoIe3Q2FBq4RhrQgaD8qU6dZoaej5GSdb9Q+025Xce9TWgRwfhppAqtcNye
	TK0YOYsuvCgN
X-Google-Smtp-Source: AGHT+IG1vKfAChOkwTPX9+7chsiPwIaH1WH3GP1697y38/vBbGAmUv8F5DHIC9pOxmAOp53ppBWSlg==
X-Received: by 2002:a17:902:ce06:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-220bbae21e6mr10376505ad.12.1739304931600;
        Tue, 11 Feb 2025 12:15:31 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d529sm101333785ad.145.2025.02.11.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:15:30 -0800 (PST)
Message-ID: <1d2d919ae6848e2cf80b81ffe5f94fd31b8ea6ae.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
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
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens
	 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Quentin Monnet	
 <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long
 <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,  Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>, 	linux-kernel@vger.kernel.org
Date: Tue, 11 Feb 2025 12:15:25 -0800
In-Reply-To: <Z6ugQ1bd0opoGRYg@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
	 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
	 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
	 <Z6ugQ1bd0opoGRYg@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_121532_590300_9F5A0BFB 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, 2025-02-11 at 19:09 +0000, Peilin Ye wrote:

[...]

> > Nit: why is dummy_test() necessary?
>=20
> It's just to make it clear when these tests are (effectively) skipped.
> Otherwise, e.g. -cpuv4 runner with LLVM-18 on x86-64 would give:
>=20
>   #518     verifier_load_acquire:OK
>=20
> With dummy_test(), we would see:
>=20
> (FWIW, for v3 I'm planning to change __description() to the following,
> since new tests no longer depend on __BPF_FEATURE_LOAD_ACQ_STORE_REL.)
>=20
>   #518/1   verifier_load_acquire/Clang version < 18, or JIT does not supp=
ort load-acquire; use a dummy test:OK
>   #518     verifier_load_acquire:OK
>=20
> Commit 147c8f4470ee ("selftests/bpf: Add unit tests for new
> sign-extension load insns") did similar thing in verifier_ldsx.c.

I see, thank you for explaining.
We do have a concept of skipped tests in the test-suite,
but it is implemented by calling test__skip() from the prog_tests/<smth>.c.
This would translate as something like below in prog_tests/verifier.c:

	void test_verifier_store_release(void) {
	#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
		RUN(verifier_store_release);
	#else
		test__skip()
	#endif
	}

The number of tests skipped is printed after tests execution.
Up to you if you'd like to change it like that or not.


