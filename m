Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oUEgD/rN41C0bVeA3gI1cpMDgX5748s/d/3oZ5kHgc=; b=lj1/2Y8b5U5d8/LKv7BjAoQay7
	jQUgpORO+olZUyMmsKiHc9odhyKhM/+8goqPPm4a2NlCmRsg9gOGytyyEmbFv+aeOIO2UcR8tiU90
	C2cTy91/ybqaqOYlY6Hyqial+JttZNkvjiHcXSX7D5fkNHnn1iIb0CLZNAPF59F+UjFC9u1NdbShz
	8QlhH806OriV94riUM0RV6e3ynWX/BDpBTzeSZU6ew8A/+Qm8NzsjPp7QQsYhMSKqG+qx9K2GTB50
	OWBfIsmR8rBcxW/d5R2SePdigqQmnzX4ch5MwitjUxMMPFV3hjEFFp8gOeiRsuzZDfTaO+eGKyE0g
	llXGSn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N2u-0000000Cc6G-1seU;
	Wed, 09 Sep 2026 18:29:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N2q-0000000Cc5b-2GZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:29:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2db858d60e0so21455385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788978555; x=1789583355; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1oUEgD/rN41C0bVeA3gI1cpMDgX5748s/d/3oZ5kHgc=;
        b=ciV/80qKVZhJn38/sQastxJFm8bJfcVZ4Xd0kPkkgjx6t/D9hwMgKO1ibsoYRmvRkn
         cR+slUsZZ8HsDX3vI6pEs7CvoDOjqTY+wzbuL0qd0bPljokpPRhNyrtTNiGtEqlVkPTd
         Rl4DVVJT15zOIk5RpSusEbjCTBRs4U+S8lj1NVPwRWefRDhADcjFAE06mXdUv1aa7YWt
         W6NkUn8ugC5iUqIX0oA6YcBM7yz265R+5AxImTg09UJgG9P/8fj2LcdLbiMh5DB/d2ih
         GLouqBnGS5wm24Lz5e5qA4FWbqTEis9Pbxo3R2d+zcWVZZK5jdjpO3/63E8IFNxC/0kl
         i00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978555; x=1789583355;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oUEgD/rN41C0bVeA3gI1cpMDgX5748s/d/3oZ5kHgc=;
        b=qr56HYwbFacbRUofgApBMAr+8bKZ4Dj7SqKuJ3KDIfBDOUCuG9kzooNRQgpuPoAsHi
         yMUnapfKbUag+htOLHWD+KPxIl9vcFcVHzVHkMr8Pp3n54YscngogG6ENoNRupHAc6Xz
         llvotIV6hMHub73pxvBxdCQeuH9lJw6gtMOgCVhF8K/8nVxV63jXWRgPIGqsebcYCF8z
         Eq0dW9UpPeSIFvRbUqk7NpmWNvLLWxDebaK5AhBWuB6D2KPoSlM13RQzyFW7BzIVLGrx
         xHm/gSYNdf9BzUh7qSH/T74Xnu4rCbc9cQmAToKnn3E8gvf1bHjdRgPYTlfAElPtSE5g
         8jDw==
X-Forwarded-Encrypted: i=1; AKwUvBzip/9WV/pKCQ9WZHfSXOi58qg/9elDex5pKfQb3OgA+W8hmjZBlMsXptLuPzPooXKk2kYNec73IFtd3G2jiOBD@lists.infradead.org
X-Gm-Message-State: AFuF++kMAjZZyeGz82BoI33Ep8ju9YlaqkdnaLmIIwj//71FwzOH9f4m
	LoeCfFr5cD22ktneK6w2yclWUd90IdHFO7bYjQdVub1BDJFi5Yo6EFaDUCKH+mhzeJA=
X-Gm-Gg: AYBFou30a9kQOmmBFMdDBA7VeqDRMKwu0a2DWBjVDg9yRY8zDCt1ciNIYdpFDy2Qxow
	2N9Bi4v4RAC4qTkVBQeGG84rpivheNWY9+jmGHoA+SZy+5YZvIZffasc0vgMvIC5oPHuiEtksV4
	dZXy8AyfI3AdxSAEXMYVVbLoUul5k5wTExA/lpOiF45DyurjZVPPmi1UK1OBFxhO/uhE62lVOST
	glDFzntAp75qrLqhgciI9R9fPzNhRZIHAzfpFkdAlt0zw0vjoYCmRxbXuPue0ZZ7XXdIGCoWobK
	eXeraR23RlpN1QpzrWs9VekW5L7bGFBD94rHc7K4UYxFSrfPolEOQmichs12sGbU18XsIpa+iIv
	7RucGomsTq+bQyqoR0QsMpTwCVp321miZ71tCJbqroVh48zgqReSDX3P+MOSu7IbxTIr9vxdKIP
	fSphLrwVt4DFqb/uAwFo0obh2XS8RCDsyJOUMV4EAv7j3ItG2BasTOwOnLRk2Bac7G/fIiZxprD
	aXIwFofL8k4Md9X4YomHBb4LwMl
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr58011908a91.22.1788978554953;
        Wed, 09 Sep 2026 11:29:14 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5b2fffsm1727085a91.4.2026.09.09.11.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:29:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 14:29:12 -0400
Message-Id: <DLAZYXG7B54C.23SY9Z6V3JRT1@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kselftest@vger.kernel.org>, <sparclinux@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 0/7] bpf: fix typos and repeated words in
 comments
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Hemanth Selam" <hemanth.selam@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Russell King" <linux@armlinux.org.uk>,
 "Puranjay Mohan" <puranjay@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Hari Bathini" <hbathini@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Naveen N Rao"
 <naveen@kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_112916_583136_EB126B36 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue Sep 8, 2026 at 1:48 AM EDT, Hemanth Selam wrote:
> Fix misspellings and repeated words in comments, found with
> scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
> Comments only, no code changes.
>
> Changes since v3:
>  - rebased onto bpf-next.  CI reported a conflict on v3 and asked for a
>    rebase and resubmit; the tree has moved on since and the series
>    applies cleanly again.  The patches are otherwise identical to v3.
>
> Changes since v2:
>  - moved from mainline to bpf-next, which resolved the earlier conflict
>    in stream.c where the typo had already been fixed upstream.
>  - renamed the selftests patches to the selftests/bpf: prefix used by the
>    rest of that directory, as CI suggested.
>
> Hemanth Selam (7):
>   ARM: net: fix typo "arithmatic" in comment
>   bpf: fix typos in comments
>   powerpc: net: fix typo "upto" in comments
>   selftests/bpf: fix typos in comments
>   sparc: net: fix typo "evalute" in comment
>   libbpf: Fix typos in comments
>   selftests/bpf: fix repeated words in comments

NACK, this kind of churn for no measurable gain is not productive.

pw-bot: cr

>
>  arch/arm/net/bpf_jit_32.c                                    | 2 +-
>  arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
>  arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
>  arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
>  include/linux/filter.h                                       | 4 ++--
>  kernel/bpf/reuseport_array.c                                 | 2 +-
>  tools/lib/bpf/btf.c                                          | 4 ++--
>  tools/lib/bpf/usdt.c                                         | 2 +-
>  tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
>  tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
>  tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
>  tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
>  tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
>  tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
>  14 files changed, 17 insertions(+), 17 deletions(-)


