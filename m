Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D25C02193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 00:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/sWxNAPnxEZbenKOf7N+j5g5zHNpFBMXZn1jjqHCpE=; b=ygRaGtv7aIkFkY8v0Peq3V7Woo
	pTN9PhDuIEkEWbzl4ip5UrM2wtsAXtdaXGQVZd0DoVikqSz/OOxi9USKwSuM00EeqWeEw1Zqz8a+F
	BtBch00jx4HS4XYNEi0pjOuV7Tq+QRULLxMs14az//vWTv5ChZU04oZt3BpARnRZtUSzrq+yDfsXj
	HNMGSAw128xtV7uRSbLXIu93Omg5biMgpUUjp2h6w4lLLe2bURMX2IaS4adqlLBDQ1jY+2AlgQjk4
	Aga3qT2/pLXVfV5ke18fXLuPeykDRsYsxrEAOLK6KOisIc8OTpabiu/a2vlcHmjKQVylruAoj9FXt
	zOuiPpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdI2q-00000007zD0-17V8;
	Thu, 30 Jan 2025 00:04:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdI1V-00000007z8l-0Z1B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 00:03:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21625b4f978so52985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 16:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738195388; x=1738800188; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/sWxNAPnxEZbenKOf7N+j5g5zHNpFBMXZn1jjqHCpE=;
        b=XGJB5P43TwCPVC/ZkqqTdaTZB5Y2GKIy5CJGYAz7mRMR/Z2bRVYjvznkQjbUmgW9Dn
         E/tD74AJpkJtC+/OCFk4ZUA3lBNcFkiT/BE3yEE/NlJRLKnwSoeVVLqo8kRbLyvjKE22
         s19S0gbj+wKLaVbgrc0ic/Tebp2uHdZkjoUNju/Ewol5GNyVvb6VZTXMljBNjgBoDNwP
         ToKnwzHkgT2XUMI9rFOZtqBpdGFDbKZLDGgEdjhsxRpfkKQVVcNk76WaYOTpSNUhJd3e
         t/ZM7Hez8FmECvfpXYLLJiW/OaYbCIMUiHirEWNgE3ReZEdeGaLRbsC/yqN10fNvQjm7
         Ncaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738195388; x=1738800188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/sWxNAPnxEZbenKOf7N+j5g5zHNpFBMXZn1jjqHCpE=;
        b=mas37ieMgEeQVRatB4v9TphGEdaOyHT9s+HlKOWhVcJ1AGAhn38lv+AI9uVKNFv02/
         0CKOEamVzGVo0Ry5qHgxQAdvl5iYak8vLGIBScnhM8hqp9w8ffTrbSjMxf58UvW9INWm
         hzpkKUNNbBb3PItuhbET/nUFuA9DZXmslvdr9JLAh7b+S0DDuyJz0cAwuP3a9zdW6qfO
         VdGdWz9yzf88dbksTvSy6DDUuKSAp8ClamGkYpnTlgPdSTWQZZ8kysYmgd1JQN/GgkZS
         +i7CwdIAH5iZTdxebSTVfydLhw6CToyFUVh2mDfT8AouP1Z9yt0jN2omB17Q2CHfdkA+
         zrig==
X-Forwarded-Encrypted: i=1; AJvYcCVgRqPkptJt5u+w3jU3TN5UtFIokWx3ZwUFSYzWM3dD+uJ/v9+oK3SOl3yLAMtupGCGc1mEZOt+tmSu+A48sEp+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qblFd/SP287my2Wej+Z8dNr7kFDj3+AoEOL1w9VmWDNIcxC6
	r863bhX8zp9foatqXeETtF6NAGOW61ftdsiM3AHOzWdr9gOk1JQHl55eJnZqqg==
X-Gm-Gg: ASbGncuXp3kH7bsXy2rO88dK+NhNZjiqDSu77YD34mla7NpsdfchHUJnDqzROcRFHzp
	vrZq9OOGnfiX4826HBX3SaQVXqSYt5igvpwtM01M4F0uT4GM8JtUCFfH2DP7r0a3Ce18rj04b8b
	brWASYsJ4aQhQtw9n48R2445eqGSyjvKNVuH00vByQmG88ToM3dXfui1DAARvWiZaaFX9V3Jwm1
	qvg64gV1w0j13U2V/N9e820JFZua+EVhFXu6xXlhwbFQo5zRqeqN8VrP066E49Ukc33QxTMSzkX
	Tk+jDjnb1D2ZYavHj9aR6nBllkqg0aONCPV4kRJ5lrKjyiP6Chw=
X-Google-Smtp-Source: AGHT+IE/F0VzN3ET6T5NQ93cCyrPvlKbgWQX6l9EQyxxToYjZ5gVa1o2Iroc9xQVHfCVOmJeGyKC/g==
X-Received: by 2002:a17:902:7447:b0:21a:5501:9d3 with SMTP id d9443c01a7336-21de36ce371mr481865ad.21.1738195387986;
        Wed, 29 Jan 2025 16:03:07 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccc8a5sm2405786a91.17.2025.01.29.16.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 16:03:07 -0800 (PST)
Date: Thu, 30 Jan 2025 00:03:03 +0000
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
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z5rBtxNnGHjJaZEt@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_160309_171539_EE1784A7 
X-CRM114-Status: GOOD (  21.31  )
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

On Tue, Jan 28, 2025 at 05:06:03PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
> > All new tests depend on the pre-defined __BPF_FEATURE_LOAD_ACQ_STORE_REL
> > feature macro, which implies -mcpu>=v4.
> 
> This restriction would mean that tests are skipped on BPF CI, as it
> currently runs using llvm 17 and 18. Instead, I suggest using some
> macro hiding an inline assembly as below:
> 
> 	asm volatile (".8byte %[insn];"
> 	              :
> 	              : [insn]"i"(*(long *)&(BPF_RAW_INSN(...)))
> 	              : /* correct clobbers here */);
> 
> See the usage of the __imm_insn() macro in the test suite.

I see, I'll do this in v2.

> Also, "BPF_ATOMIC loads from R%d %s is not allowed\n" and
>       "BPF_ATOMIC stores into R%d %s is not allowed\n"
> situations are not tested.

Thanks!

> > --- a/tools/testing/selftests/bpf/prog_tests/atomics.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/atomics.c
> > @@ -162,6 +162,56 @@ static void test_xchg(struct atomics_lskel *skel)
> >  	ASSERT_EQ(skel->bss->xchg32_result, 1, "xchg32_result");
> >  }
> 
> Nit: Given the tests in verifier_load_acquire.c and verifier_store_release.c
>      that use __retval annotation, are these tests really necessary?
>      (assuming that verifier_store_release.c tests are modified to read
>       stored location into r0 before exit).
> 
> > +static void test_load_acquire(struct atomics_lskel *skel)

Ah, right.  I'll drop them and modify verifier_store_release.c
accordingly.

> > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> [...]
> 
> > +SEC("raw_tp/sys_enter")
> > +int load_acquire(const void *ctx)
> > +{
> > +	if (pid != (bpf_get_current_pid_tgid() >> 32))
> > +		return 0;
> 
> Nit: This check is not needed, since bpf_prog_test_run_opts() is used
>      to run the tests.

Got it!

Thanks,
Peilin Ye


