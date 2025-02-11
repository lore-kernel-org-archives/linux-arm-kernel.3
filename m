Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39E4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsRY8DxU5oOqkirUpQpSEfLhJyGlqAVxdTEVQkM3WMs=; b=NjXzCdposu0uU0k5Xe6Hk3q5L4
	KKBTXDPhFtPiyiiTqZKiglbswGr7T8l6OwvjxMMy86WnzUChVmg4efpxFA4zC0vLTYtL8+D/h2qjw
	aoh+HMvRHrZZ7YO1X3cy3MxotrTyl0Ajy8uo6vAtbdxRgM5nYu2WtmqGAPhhz7/ckBk1NcoNpO25T
	IckRyKwHC9wNM5/TN6QgfQXqCTk7h6YyAn3WQc+O/dmX1YwfL9q59lPwMqN+0auhS+dIkOXR+pzu3
	0tybyfqGDBeiTXXc3WwY38C5ThIl1zQsjcYNqjyFtfaI//5KIquCTf7YyEB5fB6AFtID7tBixXQ77
	MgvC3Pug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvfL-00000004xo2-01HV;
	Tue, 11 Feb 2025 19:11:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvdv-00000004xUF-2dGw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:10:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f8c280472so17315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739300999; x=1739905799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsRY8DxU5oOqkirUpQpSEfLhJyGlqAVxdTEVQkM3WMs=;
        b=tPUPIGfDPB7SGhwPa4iqNwSAl+ypSPhw/tzPp/qGI7yPMbU9wyGXQ5qbSl9C8IwM95
         r9U1G3ioTWe+Vu+qmOVuS4kd5CaD2OZFIO+dDXaZlecVVhtJUQ0pGIzxB3Vjpo96OHYZ
         GVg+DULkxAuivHfd5I8j7QB/cn6pgnJ9+D9qSAxrcAFB9nYqnF7liP3pPq9E37VK6woa
         z2yeCYSg1fgldVD03CVgBq3ld5+fjQgP9V7hkin3Jwzt5kY1dtWEKD3ZlW6lMccfVsjQ
         FbfMsl5rFsBFAbxOxdRs4rPb/EgYNkEjFgsVNSCvJe+zXriXFpd0Rl9zNAmpnij5B/HZ
         EBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739300999; x=1739905799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsRY8DxU5oOqkirUpQpSEfLhJyGlqAVxdTEVQkM3WMs=;
        b=TTX/2doknVc/hUwu08HnHIiAkpLWYDm+uZ9PT9su/xAS4D7d+GZ0NZH6Oufx0jL+tQ
         xWOvmakeavVdFxnvxi2ganzQ+aRFC8+j5EJrvycZ+0qDrS+qEf3GgCufmh8bX1I2rr8y
         HaIXu9AceIZLr47Et6k0N5ORpWDTlztVUI/TgUsD2s4cmN8QthD3Dy3e6PeNva6b/cut
         Iel0aYDd89si+iMOJHqClMcazWPSNw86an9l1352qIYT/Q+wITIB6cKkJSh4puHTTDwy
         zKqlg5NTcJuNCjsRqrDKbjjHZuVYcG/2i0w6eE2/9JyrF9GX9QAOR5+mj65a3Mrc9RPA
         S8tg==
X-Forwarded-Encrypted: i=1; AJvYcCUA9ogRaM58glDSaSgnoMKvkhIupIbNQRHLz9ErNWZo5J5A42Oui1uRTV58A55Tz3XATmkM4KQZyrSgkkkxrCFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzxWx2ywHQRrtbV+REcaBIxSJdRwdpG+QNN0oyafgxck/NZzB1J
	/ltjVdF1vR7zChE44u2xR6eyIA+kMBa08N8cBpgsFLmyt9vZ1RwXV7DJPoeQAjKSeZFAxE2SoMq
	0YtLj
X-Gm-Gg: ASbGnctrCqJ5NBJIZCP05huUYC0M/SpAHNhVqgpU01OSU0essQZk9JEN23b1g+UqvPd
	7JqIiG50WuN07btrKrB6db6VjSbPYa/cXIF89BMXxonp583k9+5E2GCuOF6mdlFUYskztKqr2yB
	VvoTPuZuRc/9XhuT0uoONFmgpdjyisyFdfNuAV0ISQXwhBxwEhCSBYdVuGRSwazuKoQxxDOdxm1
	2NekeL7pTTD2O/cuA6sNieXXtHU07NmI1LhTw5dx8XQ0Wy7PKvcEswh51YVJb3dtHk9bN7PrkBK
	0tdlzyLL8ZXoyCs7Sz/dWuV+R1ru04lr6lUtZuZmRg+1YqJxz4vdVw==
X-Google-Smtp-Source: AGHT+IHrWBPLYi6iTGNBgCMLpCFlEfO8bMl8chkgcZ2hAPZ3SiDkxvI4vmDKroixqqmvdANTGecJ4w==
X-Received: by 2002:a17:903:13ce:b0:215:9ab0:402 with SMTP id d9443c01a7336-220bca6d869mr92705ad.18.1739300998169;
        Tue, 11 Feb 2025 11:09:58 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad548cc25d0sm5126832a12.5.2025.02.11.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:09:57 -0800 (PST)
Date: Tue, 11 Feb 2025 19:09:52 +0000
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
Message-ID: <Z6ugQ1bd0opoGRYg@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_110959_686117_ED796F28 
X-CRM114-Status: GOOD (  14.69  )
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

On Mon, Feb 10, 2025 at 04:08:44PM -0800, Eduard Zingerman wrote:
> > +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> > @@ -0,0 +1,190 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bpf.h>
> > +#include <bpf/bpf_helpers.h>
> > +#include "../../../include/linux/filter.h"
> > +#include "bpf_misc.h"
> > +
> > +#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> 
> [...]
> 
> > +#else
> > +
> > +SEC("socket")
> > +__description("load-acquire is not supported by compiler or jit, use a dummy test")
> > +__success
> > +int dummy_test(void)
> > +{
> > +	return 0;
> > +}
> 
> Nit: why is dummy_test() necessary?

It's just to make it clear when these tests are (effectively) skipped.
Otherwise, e.g. -cpuv4 runner with LLVM-18 on x86-64 would give:

  #518     verifier_load_acquire:OK

With dummy_test(), we would see:

(FWIW, for v3 I'm planning to change __description() to the following,
since new tests no longer depend on __BPF_FEATURE_LOAD_ACQ_STORE_REL.)

  #518/1   verifier_load_acquire/Clang version < 18, or JIT does not support load-acquire; use a dummy test:OK
  #518     verifier_load_acquire:OK

Commit 147c8f4470ee ("selftests/bpf: Add unit tests for new
sign-extension load insns") did similar thing in verifier_ldsx.c.

> > +
> > +#endif
> > +
> > +char _license[] SEC("license") = "GPL";
> 
> [...]

Thanks,
Peilin Ye


