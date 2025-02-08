Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDD7C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDnmsDfQ9ygAHi6YHL8PYxVfYS8JZ6/Tk4H6j6DXAnw=; b=ItMxDAe878cZddq/ZyYjuoLCMi
	JmhMiwaFY4d2VA02IcKIeAP+H4Pd6Lfv0F1p//S/A2mRdMQYip9Y46O7qb28FQWbZp4C9j8+AfRYu
	pQwC0UfYSzUAiOEVY/CB1jYYISufKBxTx2qVN7xuEjM6pKlA4XJUruFB2wMfXMPh886ThfglnWEfS
	gk+dlIVspFc7wjYQ2ca7GllyO3Zw+ZPICg2le+cKDgCi6nd1tZ+nRFFt+K2ng4pOxFRppKq9E0RL0
	RMYU8zu7/1Hm4quU1C6L9b+Jj2InsFxL4b1KO6ze0JGH73OmPnzt5cMcqGyEx7kEXQ2dk8oQNW/De
	LaPJtUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYcD-0000000BcZD-1bpX;
	Sat, 08 Feb 2025 00:22:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYan-0000000BcJK-3nMr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 00:21:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21625b4f978so54915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738974065; x=1739578865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fDnmsDfQ9ygAHi6YHL8PYxVfYS8JZ6/Tk4H6j6DXAnw=;
        b=SUXl8kW7LiV8+o+4p9/wimgFsT+w/7ZgWgzGTiJjOve4J+rdHjNhkERrDlfZO6DtDX
         P9FCrYn18GyhrH5pMx4uPv+v2MOzkObgr8KfX7u3qgr15AGWZplQyLRj3LBbtBzd6uQv
         1tqlrkBUtDYSK4RBNNjmOhtd64BvwAjJkiiOLF9D2GuLI3Eu4aW8tv1FyN9huNBBOKda
         bLrjPiXI7tLKERzNOzZGdmrMqIpQhDx2/laelrEQ/gdTx3TYsJYMW1Z8E9bk0JGZ3mur
         n7L3NH6EG9r88XdYdgrvWrNHUGtTGdJNU/kbGaLT6FlVBsdvjylcFY8dDMjM9sxxb6tA
         Mftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974065; x=1739578865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDnmsDfQ9ygAHi6YHL8PYxVfYS8JZ6/Tk4H6j6DXAnw=;
        b=cQfytsI8B/aLOY+tkZj/oLnqnjBEADUbtl4bqMpKy8BrKRLnMKQfjXeeAffOSnM628
         Cf2ZmJ7ixI3rX1twiAqI05fcGrA+I141qFNXO5M8cpaSght8l11BlCU6yVYaNx9Hoxm0
         FVC5jElbn9QybTKhi39OL/I9wwK1AEUCdRkOz+BRVwExa86dk3mgz2BfiCW/I9hFJq4H
         +t79MI4El9P2tIS7ReSKY2w8zU8haJm2Krhu5EdWnxkJeQVROqrLHnVS15/4Zbn9pGXz
         pf1ET6CPrdjg/b3wn77BAGRKSwQpD9t1/5SNUHaToF3tsnoJDR+quTWZUog8GcBjIR7p
         sUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUirGEwufsm3FeMeCMST16XZ2J7nobxH9Hd5r9uhMyY5BFVRVX0ZQS5UkNvjR+5dGYM/1gBfo6NwZ3D5DwjuUHd@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdtXGQgjUrCyGMfAWKJGE5NObI6Ym1yXuPuucFL4kGEU4WmYf
	w1XCsYcTOMQod1f6Q7T3EYOuqiriYMGuNBG/kC39fm72f8l6PjYoOCDpcc66mQ==
X-Gm-Gg: ASbGncvb1aZpfq8v53hCZI+xf8Up3FQq6g6HRUwsUKmETRLwK4Xiz1Akrc+aUdAmyms
	4BVi6E3AxDoh+VfyQUXTvIYFAbfKxt87RboUFDZwNSdgxB5aGWXutUgkyMnkKIk2cvNhpRcn5PG
	9BMmZ33NvLhVZIJfjv+B5Yybn5YZLOWlKIrr12cUgJi9xRPiip3QDqC4saNPkkg14pCnFj1kLMW
	5VQZuOjN1wnPl/vA0SxWX+vjuF3nkF0oVP31qeq2q163aC5TSAZob76/4v5kKkCXnq9tJdH8g8W
	PtcAKownY5wAhPapQ11Qs7komEeb4mwz7LtHbMdYmER6OXfEIsDdxQ==
X-Google-Smtp-Source: AGHT+IH8AQ/C6vnrRRfpvXO7lMPRI+npMeB/Vc/zMwEExBzDSAg1gMLPiOG7gxdFT6Q7rAfmKqEZ7A==
X-Received: by 2002:a17:903:19e7:b0:21f:2828:dc82 with SMTP id d9443c01a7336-21f69defa27mr1000515ad.2.1738974065041;
        Fri, 07 Feb 2025 16:21:05 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm36748745ad.54.2025.02.07.16.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:21:04 -0800 (PST)
Date: Sat, 8 Feb 2025 00:20:58 +0000
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
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z6ajasn2k559SGNN@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_162105_963190_62EA72DA 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, Feb 07, 2025 at 02:06:29AM +0000, Peilin Ye wrote:
> --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> @@ -6,6 +6,8 @@
>  #include <stdbool.h>
>  #include <stdatomic.h>
>  #include "bpf_arena_common.h"
> +#include "../../../include/linux/filter.h"
> +#include "bpf_misc.h"
>  
>  struct {
>  	__uint(type, BPF_MAP_TYPE_ARENA);
> @@ -274,4 +276,90 @@ int uaf(const void *ctx)
>  	return 0;
>  }
>  
> +__u8 __arena_global load_acquire8_value = 0x12;
   ~~~~

CI job x86_64-llvm-17 [1] failed because clang-17 crashed when compiling
this file (arena_atomics.c):

  fatal error: error in backend: unable to write nop sequence of 1 bytes

After some digging, I believe I am hitting a known issue that Yonghong
described in [2].  Changing __u8 and __u16 variables to __u32 seems to
resolve/work around the issue:

  +__u32 __arena_global load_acquire8_value = 0x12;

Will look into it more.

[1] https://github.com/kernel-patches/bpf/actions/runs/13191887466/job/36826207612
[2] https://lore.kernel.org/bpf/d56223f9-483e-fbc1-4564-44c0858a1e3e@meta.com/

> +__u16 __arena_global load_acquire16_value = 0x1234;
> +__u32 __arena_global load_acquire32_value = 0x12345678;
> +__u64 __arena_global load_acquire64_value = 0x1234567890abcdef;
> +
> +__u8 __arena_global load_acquire8_result = 0x12;
> +__u16 __arena_global load_acquire16_result = 0x1234;
> +__u32 __arena_global load_acquire32_result = 0x12345678;
> +__u64 __arena_global load_acquire64_result = 0x1234567890abcdef;

Thanks,
Peilin Ye


