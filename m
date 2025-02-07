Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E01C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpmqbDlVKgWI46RiBOd7cmqJb5HFtWlucmHwOHZfM5g=; b=hjf85a/ECp++/LumPkEhuQ7xB3
	XHaZOwsXIZUYRD9qjKCGpZLsz8T/wLFvzb25kzsKChGMyJORM5p30wSti/KhjHrq0IuBO/HXGAa0r
	gY9/dwRqPw49w14R+1xE37nsk+AAWG0d8i4tOPetgqiSmqDRZ0cGVzRZ+6c9uCJvzjAU14rA7dXaJ
	gkGnIgsQzj9z/GbbF3G0KFgDxrNbRC8m+qUtFva3gXgkA6MMVG/WvJzEdZ1gK5e6jF1P4WRLgobbk
	2hUGd9Y++OF6udCJuqk0HQgsz8WBUY6IxzXZUaKU7tpF1ZJNSz49YOh3aI47sxQy9n/+h+/DNytNu
	i5DzNRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwf-0000000BDhi-3GPS;
	Fri, 07 Feb 2025 21:31:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvF-0000000BD1E-3PN3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f032484d4so45545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738963801; x=1739568601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpmqbDlVKgWI46RiBOd7cmqJb5HFtWlucmHwOHZfM5g=;
        b=IeBMDV1R7DhTiB4R0zCqIukdwkyr1v6e8lpq58nKZV+VGx+v+/ecClNme7zzVewdJX
         RzxAsNhqAsV3D039B6x2o08a/lMcaydw8CBNsckWTN++SAnD+mWHV4aFotKPOheCpfo6
         6wfmoA+/4ad9syV5Ax+lyEp9iiwMVNBEVuE8siF12jOCSKCKprMXH5tUyLlUGpE3fIcG
         3XvVJMveBOLtnXe9aaEX9W3GT1PMMyrehR0Se6he9v5P5ICysXg2S0W9PBZ24aE5hjLx
         FcIDr4QZs8cUyITZsADLmkDbnyP6/2vRGNAtTiSf5S81v9wJT08dAjj0OEJ5cRzjWmdM
         yfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963801; x=1739568601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpmqbDlVKgWI46RiBOd7cmqJb5HFtWlucmHwOHZfM5g=;
        b=ghR27P2jGbzpsLtLrV70oxH3xwsUsGiAEc/kxSukFkHrGhA5l5pCIJzOyhrBvOCCW2
         bSnm8+P5tZwejHUMvV1htNKAsx/8ULEl+td7L26LNuyLy4adjwWxcE6j6j/OKQLX1bmH
         0WbQZCGQxD4HaK81tR12IsIzNgtqi1H5gBWxEgFlNyxWrmw2D9hosuElSNt3WV0+VH2F
         Fa5MutKMgr23vKydGrvpVrwDyHcVmoSzi7kJI7eAhU/KHShOQOdc3X0Um2hdONbR6QTx
         mRWGsMoaM4YnpdObTkVxAAT17ggxZGW9v3j32h6wav5O7FtJ1u0xJz6JwEleoUvf72id
         7PVg==
X-Forwarded-Encrypted: i=1; AJvYcCVdYUMo6TtnW2th1dC0mZPASy4x3ijLzUPWajvlROcFxUVOhQqhI8Ec8ouCfjbI0pfbM1quvP3n8B0+wkkIZjkl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1rS7Y8kKhqqUsyNyGFMP8WnZk0kH3taMJ1izWsmpe6DgUJWm3
	R1zDFs+WLz87GEYz/A8VsgojMV8zZW2nkG7yChWCQ8M/H+WTrvHs0oRAeEdX/A==
X-Gm-Gg: ASbGncvZKjc0Msa/PqVUQX4jLs5dcn5DtUBstV1cFTuOD57TKtmKL6R6Sdkz4qmn/3b
	hyGXu2XYXP16XTdGTO31VdKkNvWpRdCJVVq9/25julzbUIBJEctuAk2BX2Hrsl12KKVdrZBrxqL
	PEzbEz/wgRiwwvdDcE6D9iQY6GYALSO79MWX6VdO8IjqcInhI+LmC4+jKK5anvA0S47qkMjfyk9
	SkrE03G+GZIyIuXh57BcY1mj1A7bxQiBeGdeEv/Uz+fak7PegDHnrfaSeYvFv+bhmr536P6QQ53
	4lY1uzfatQIWV0bh6nG+OW8hKFi/MekBXehypxwmZUldaGWKbcwrUw==
X-Google-Smtp-Source: AGHT+IHP6x7/nnWTD43CmRO0CpbJGNj6KB/SNxwdoOzxC7LfXgdBO2BKOfnZMBUjldNgUy6Lg8WukQ==
X-Received: by 2002:a17:902:aa08:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-21f69e34933mr559535ad.22.1738963800724;
        Fri, 07 Feb 2025 13:30:00 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa2d831a1csm1670429a91.44.2025.02.07.13.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:29:59 -0800 (PST)
Date: Fri, 7 Feb 2025 21:29:54 +0000
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
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
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 0/9] Introduce load-acquire and store-release
 BPF instructions
Message-ID: <Z6Z7UsB-AGD_Xhdq@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133001_853314_7034869F 
X-CRM114-Status: GOOD (  13.67  )
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

On Fri, Feb 07, 2025 at 02:04:54AM +0000, Peilin Ye wrote:
> Peilin Ye (9):
>   bpf/verifier: Factor out atomic_ptr_type_ok()
>   bpf/verifier: Factor out check_atomic_rmw()
>   bpf/verifier: Factor out check_load_mem() and check_store_reg()
>   bpf: Introduce load-acquire and store-release instructions
>   arm64: insn: Add BIT(23) to {load,store}_ex's mask
>   arm64: insn: Add load-acquire and store-release instructions
>   bpf, arm64: Support load-acquire and store-release instructions
>   selftests/bpf: Add selftests for load-acquire and store-release
>     instructions
>   bpf, docs: Update instruction-set.rst for load-acquire and
>     store-release instructions
> 
>  .../bpf/standardization/instruction-set.rst   | 114 ++++++--
>  arch/arm64/include/asm/insn.h                 |  12 +-
>  arch/arm64/lib/insn.c                         |  29 ++
>  arch/arm64/net/bpf_jit.h                      |  20 ++
>  arch/arm64/net/bpf_jit_comp.c                 |  87 +++++-
>  arch/s390/net/bpf_jit_comp.c                  |  14 +-
>  arch/x86/net/bpf_jit_comp.c                   |   4 +
>  include/linux/bpf.h                           |  11 +
>  include/linux/filter.h                        |   2 +
>  include/uapi/linux/bpf.h                      |  13 +
>  kernel/bpf/core.c                             |  63 ++++-
>  kernel/bpf/disasm.c                           |  12 +
>  kernel/bpf/verifier.c                         | 234 +++++++++++-----
>  tools/include/uapi/linux/bpf.h                |  13 +
>  .../selftests/bpf/prog_tests/arena_atomics.c  |  50 ++++
>  .../selftests/bpf/prog_tests/verifier.c       |   4 +
>  .../selftests/bpf/progs/arena_atomics.c       |  88 ++++++
>  .../bpf/progs/verifier_load_acquire.c         | 190 +++++++++++++
>  .../selftests/bpf/progs/verifier_precision.c  |  47 ++++
>  .../bpf/progs/verifier_store_release.c        | 262 ++++++++++++++++++
>  20 files changed, 1164 insertions(+), 105 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
>  create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

Looks like the llvm-18 CI job passed but the llvm-17/gcc ones failed.
I'll debug with llvm-17 and see if I need different #ifdef guards for
the new tests.

Thanks,
Peilin Ye


