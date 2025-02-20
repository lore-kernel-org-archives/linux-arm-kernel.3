Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F17AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqlTouY13+ElHVb0g8qWT8IbN9r+Hv7TBtx53gmJZ+A=; b=SRx5UASJz+q1VjKg7tkqFWaaQe
	XarIXi/H4wTQ3JuF+orBziGBFRpQnDne4CqsKL8nbq4DhYOJbbuPL/Fy16466gLl0Jrmp17pTHeXX
	3QHt4f8ZGzPTnjBssTDi+YiIqfeLmKDqhASy+YjANbatcuhtwzYUThUbHjaeAKtcGvaXR9FUPQmCH
	lyreizDhLfXszWgw3flkppqy9Wp7WKe7CoLCm4aWgaHQun0f7w95++r1xOkFfmKHFGje3jkaDAHmo
	DM2lgcN4Zhdh5Wj2+BcCxLDWUVGmUMMxKCIuuZoRQ8NeAIeeaRJ88hV4K3XdP5xsf3cbrtI4XUdkm
	CoeCD2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkv53-0000000G2hh-1QXc;
	Thu, 20 Feb 2025 01:10:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkv3Z-0000000G2OW-1e2Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:08:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2212222d4cdso69215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740013728; x=1740618528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqlTouY13+ElHVb0g8qWT8IbN9r+Hv7TBtx53gmJZ+A=;
        b=h6CHuEKG6TEIsFVEKi8sM8AuQKDI4CEFWgmi5Vn3awXQZpccH+hTsQ+DtBpqKSS5li
         J4w/luVARYZCDk8YSDuruQOvdC4B7IUgbkMi+alefeWkoVqq1j/AaVfPr0atIAm0gklj
         Gq5BuGGHuIDQVwhy8DlmzMjStbvJrEGRXneNrLF02qdqbyWbt9tsatXc+ycVFGS5bSBR
         0kXIpVw9wn7/PF9iUTf/svyZiR+IT7mOKDs+0TmXYjRI0/D1AAnwMXrY7bfmQDAlX45v
         hf1pgF0Ss+AaCWKDN7JQ52ylhwG4y2xh5+TUgSkJ1Xb4HBXjhHwjAP0HsfQX0nHORujO
         PRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740013728; x=1740618528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqlTouY13+ElHVb0g8qWT8IbN9r+Hv7TBtx53gmJZ+A=;
        b=ikBK05yUg7iu8NX9pDWXjjuLt9hoktt2AjF2FQZHbVP4s04maSE/3iSKrgFIYkkC3u
         aQTBmu8aGwi/8kgk+jsSbF5YBW2GbnqToZCXzDgWOQ7iYghGUlZ9CDYMi+/rnuZRxjd8
         ogPlAOyTDAOHxsWDKWjy1Gjjvb0Hqf2bNQ+pG8zVMhsD80ac/deI9x+q5TLdL78RYZJO
         h0VJirwMtjQ1u4Dk36uVnCZXcSSIAH/PU1ZI+uoYA30jdxbLLAhL14xmsspD+A51f3Mt
         Tku6x+wGRL9QR9RRz2DLlr/ss7u6jlY9L59vfXiTNWdvu1XejMuUhJNXmuXcnVZ++UrD
         swjw==
X-Forwarded-Encrypted: i=1; AJvYcCUXlYoL+uAVw+jxPEbhzhuXAGbdWDvm9dfLP7Z6xTiXKQRMeab1gOQA2vVAoxWy/sMOS0A/QPoRtV932T8V/1OE@lists.infradead.org
X-Gm-Message-State: AOJu0YwOxCiUXe2Npd2x2025DzKD4WiD0thnM3/Fi3fT+QjzAlzAr69i
	jK8watfW+ay1jknlhVP/Nuy1zki4WU887ASvPPc50/G60dFyhc5obLwnrY6+dw==
X-Gm-Gg: ASbGncu+Yu4Psc7X+qaFgVuSS8i4IsI4HvG58LSVTwzvwK8U0YE9ZSSjb3EZqckCK7J
	boLUSDamiaOObVwGIyb8Mcfgakl5NCjs576J5KKGO7tMMehrq2bJxbUTVGeDQR/w9s+x83s9kxE
	JrLe7PK4dyIeOw619204S5eir5vVfSgAehLQIQSZiKdsENac1bfdV4T6pTjP8zw/WpzeUx23l29
	XZZUUzHFw6wD7On2eaIkgINZE7QYiTKi/yLlR6nZZrmVBI07edbNA7DetTq38VAW6ck5VNlW3QZ
	wcwJ091IU6/TmIt2HQ/mMep/ypK9IP68oVjuoIrhQ4vd05YYOwhVeQ==
X-Google-Smtp-Source: AGHT+IHBCZai8rbFA4Rqq1UVJMpTYpXlGgtVYKfEUQXi147oPGSC9aAN6/e5rjvXREapJcLK8L3TrQ==
X-Received: by 2002:a17:902:d4cc:b0:21a:87e8:3897 with SMTP id d9443c01a7336-2218db4ed75mr1293055ad.4.1740013727466;
        Wed, 19 Feb 2025 17:08:47 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366882sm111350425ad.95.2025.02.19.17.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 17:08:46 -0800 (PST)
Date: Thu, 20 Feb 2025 01:08:41 +0000
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
Message-ID: <Z7aAmYi5zaVIgRKR@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
 <Z6ugQ1bd0opoGRYg@google.com>
 <1d2d919ae6848e2cf80b81ffe5f94fd31b8ea6ae.camel@gmail.com>
 <Z6u4O930eIbAVVMZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6u4O930eIbAVVMZ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_170849_431386_7440A102 
X-CRM114-Status: GOOD (  18.87  )
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

On Tue, Feb 11, 2025 at 08:51:07PM +0000, Peilin Ye wrote:
> > > > Nit: why is dummy_test() necessary?
> > > 
> > > It's just to make it clear when these tests are (effectively) skipped.

<...>

> > > Commit 147c8f4470ee ("selftests/bpf: Add unit tests for new
> > > sign-extension load insns") did similar thing in verifier_ldsx.c.
> > 
> > I see, thank you for explaining.
> > We do have a concept of skipped tests in the test-suite,
> > but it is implemented by calling test__skip() from the prog_tests/<smth>.c.
> > This would translate as something like below in prog_tests/verifier.c:
> > 
> > 	void test_verifier_store_release(void) {
> > 	#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> > 		RUN(verifier_store_release);
> > 	#else
> > 		test__skip()
> > 	#endif
> > 	}
> 
> > The number of tests skipped is printed after tests execution.

I tried:

  void test_verifier_load_acquire(void)
  {
  #if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && defined(__aarch64__)
          RUN(verifier_load_acquire);
  #else
          printf("%s:SKIP: Clang version < 18, ENABLE_ATOMICS_TESTS not defined, and/or JIT doesn't support load-acquire\n",
                 __func__);
          test__skip();
  #endif
  }

Then realized that I can't check __clang_major__ in .../prog_tests/*
files (e.g. I was building prog_tests/verifier.c using GCC).  I think
ideally we should do something similar to prog{,_test}s/arena_atomics.c,
i.e. use a global bool in BPF source to indicate if we should skip this
test, but that seems to require non-trivial changes to
prog_tests/verifier.c?

For the purpose of this patchset, let me keep dummy_test(), like what we
have now in verifier_ldsx.c.

Thanks,
Peilin Ye


