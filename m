Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 01:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgs22GMIvih+rvIPBu4CVSrVFT+Ext8GsAWJW9535gA=; b=bPcLeITtY/RMSKI4/D0FuZhahX
	j/L1Zq+3H4/1T6L8HwR4k/rzCbuo1yW8UYuUcmbwtYo7YUiNIFp47LSSwnnDz40fTzJqbNJvuXd6Y
	k7aUeg+gWr0zr1pfxvfwVKAhNcdJNnAcn8iiIfxfD38tc6zol1IHHOod6QS3NW6JwOHiqqKuvqauL
	cSPP2Z0IxX0ra0+jz0MiSbKsLaccIHPAZTnc8JS0slUUFUSnC4kbydXa3vEkUujhPyKRX54pWiy7o
	csjCRsc7ZhgvvW9ViFkS12nwpR0uVOUoyPyt64Hv7hRtpdbY17z4Kk7d0Yhpm2mvcMZfUP+MkKU29
	jdtAKkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7n5-0000000H4b4-1QYC;
	Tue, 04 Feb 2025 01:31:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7lH-0000000H4Jv-2CQz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 01:30:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-219f6ca9a81so24865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738632599; x=1739237399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cgs22GMIvih+rvIPBu4CVSrVFT+Ext8GsAWJW9535gA=;
        b=ZE2eq9GCLzNYtLX7NQUt4rlOhFURpsi1PnDSHTom/A9l0MgIOHlelkZAjqqGpHOoP4
         jB0Usc+gTdl/VjB9m/VTbiEW+4Kw9y8uW/s2zU9caz1DdxeOI2aTFu3A9+nWyTPduKaO
         ZtOHuHKiLRrCJrC0q34tXnr0FZAPmP+kFGAOqQBaBXJpGCGon+Aojp/NAIATCxCTkX2a
         LP2vD7sK2AIzCnVyKa98xXEYd3h9w3fpLei71K++7J1LHPjTG3cCj0Sm6A+I01zHREjV
         6UoSmOk4IG0f26uJ8A+Gel5n51zVWCgHzYdNvICZtUEnme1CxIIl807cDpn8CjzlsNu9
         C2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738632599; x=1739237399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgs22GMIvih+rvIPBu4CVSrVFT+Ext8GsAWJW9535gA=;
        b=d8fl1jBMxPTe/xzdX6aBFxB7FWdKof6XlGxcgPqT2ehPSFmBKp4+Yq3prV+lws3aLW
         1jxOa1y77/PX6wu6TWiD1QEJAAeAanHVsRIYQMnf9Ecb8/cIVa+QcWUSeS/gfRu2CyYj
         FEGxREisOBc+goP38uN52EVHFRXgAYcdiiTWR5l3KJBpoZZKwMggjEKSbUj9Uz777Vr4
         N/B9Ezvi+1DfWvTpa7wghr1aZMiVYFrT6U7zBzu/UcekpaXhuO9mGD7zPc9yvYY9jW3s
         rn6v9pZXkY7s+U2x09r4ttrBilTLAg7FsdhKm8iFCEQMyOUEqIbpekw5gFf3k6g1wUVi
         jJQw==
X-Forwarded-Encrypted: i=1; AJvYcCXzKyyzsLlIplU4Qd7FnxJAVBD4MHya9jcFUHlDOyMLUYyIGTPtT1HW0XV4nXbrg6vTky0yLi2YCVMMC8VY/fmB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7zP9SkZisjLOVu1fdJ86MQ/7DzVW9rzPtwTXiKqlMC+xEiQq8
	KjOZI08qQIVNDs2D2n3kMv85TAeyhLZf3ELwT+omD7+pfhrdA7lJsW7XUDrQkg==
X-Gm-Gg: ASbGncsA+rFufJmL+zEnqRVSvnRveyGP2pgjXB5+UetQO58MP+Rk9Su4JPn+H9VlibF
	OAQyZL9fDqE5FaUCYO6p4+mOH+OvJaERHspxAFhiw3xljVj2kpbKiezp/mZT9vUMVC+ziUI89KH
	x1qsOnaAHtYcdYw+utkG+CoPXD8qu5FNYOwC35IGTwAVBaeG0CTvs6AGsXdYomUzk2hBtmq4Xfn
	6968cL2UKnx/GXxmWjq3vh82AhrUTai/81oxCgMJgdgt1vv57Gmu3AcapsKZX5rMJqMcJknnWui
	YND83W2xwoe4WspVLH4YnIYpZRNXMRtaLKZnG9eVhkL2ANHtx0WQ7jI=
X-Google-Smtp-Source: AGHT+IHWUc7R5dlQvBOepVJMbNATdkSv/zYRIZ13MFf9lk+DkYICE0KTYJsxO5+u8NDbE883OqLPNA==
X-Received: by 2002:a17:902:bc8a:b0:215:86bf:7e46 with SMTP id d9443c01a7336-21f03b3c62dmr686735ad.7.1738632598666;
        Mon, 03 Feb 2025 17:29:58 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331fabdsm83432105ad.221.2025.02.03.17.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 17:29:58 -0800 (PST)
Date: Tue, 4 Feb 2025 01:29:53 +0000
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
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z6FtkchYQjgjdv1x@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
 <Z6Ffquq8IORjCqrI@google.com>
 <dead664fa11ac274db00b509931c533883dd4fdf.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dead664fa11ac274db00b509931c533883dd4fdf.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_172959_579538_9F66A5A7 
X-CRM114-Status: GOOD (  24.94  )
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

On Mon, Feb 03, 2025 at 04:52:52PM -0800, Eduard Zingerman wrote:
> > > > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > > > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> > > [...]
> > > 
> > > > +SEC("raw_tp/sys_enter")
> > > > +int load_acquire(const void *ctx)
> > > > +{
> > > > +	if (pid != (bpf_get_current_pid_tgid() >> 32))
> > > > +		return 0;
> > > 
> > > Nit: This check is not needed, since bpf_prog_test_run_opts() is used
> > >      to run the tests.
> > 
> > Could you explain a bit more why it's not needed?
> > 
> > I read commit 0f4feacc9155 ("selftests/bpf: Adding pid filtering for
> > atomics test") which added those 'pid' checks to atomics/ tests.  The
> > commit message [1] says the purpose was to "make atomics test able to
> > run in parallel with other tests", which I couldn't understand.
> > 
> > How using bpf_prog_test_run_opts() makes those 'pid' checks unnecessary?
> > 
> > [1] https://lore.kernel.org/bpf/20211006185619.364369-11-fallentree@fb.com/#r
> 
> Hi Peilin,
> 
> The entry point for the test looks as follows:
> 
>     void test_arena_atomics(void)
>     {
>     	...
>     	skel = arena_atomics__open();
>     	if (!ASSERT_OK_PTR(skel, "arena atomics skeleton open"))
>     		return;
>     
>     	if (skel->data->skip_tests) { ... }
>     	err = arena_atomics__load(skel);
>     	if (!ASSERT_OK(err, "arena atomics skeleton load"))
>     		return;
>     	skel->bss->pid = getpid();
>     
>     	if (test__start_subtest("add"))
>     		test_add(skel);
>             ...
>     
>     cleanup:
>     	arena_atomics__destroy(skel);
>     }
> 
> Note arena_atomics__{open,load} calls but absence of the
> arena_atomics__attach call. W/o arena_atomics__attach call the
> programs would not be hooked to the designated extension points,
> e.g. "raw_tp/sys_enter".
> 
> The bpf_prog_test_run_opts() invokes BPF_PROG_TEST_RUN command of the
> bpf system call, which does not attach the program either,
> but executes jitted code directly with fake context.
> (See bpf_prog_ops->test_run callback (method?) and
>  bpf_prog_test_run_raw_tp()).
> 
> Same happens in prog{,_tests}/arena.c: no attachment happens after
> commit [2]. Commit [1] is unnecessary after [2].
> 
> [2] commit 04fcb5f9a104 ("selftests/bpf: Migrate from bpf_prog_test_run")

I see.  Thanks for the quick reply as always!

Peilin Ye


