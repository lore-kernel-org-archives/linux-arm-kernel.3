Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52865C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 23:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iwNqxyXX+1eY/JvvBpbWmyKCAKiA/P8z+kIxPWpe8U=; b=qR1VliuyrnnGeoxY7Na97q7lYz
	a4w5KUa2zj3qyuenyp0GKMnlhaUmNAxc6FBq/MowCHRvru1aApXlPehu0lC6s3lQa2K/aMANi0LWp
	cOcc5ROEfauVGsArYIxvO1HpNSDe7QGpDSad5eNc0uF0UI5dA/sP0PXwLEJczVJ+uljut8g8sNr4A
	Nsky5RJLYTtNZJUUFHJAWCHwjQXi20m5e7qk4jQ0a+v+N8y7QBsrrsChAiBDV1nkuU3ZgXHp8SQpJ
	WvtVXllrY3CzUPbjMrIttVLvmh9BoBKDi5389LQpmSaSDlkXL+3Z8uWGcgWDaTtraoy1WcgGbSrW3
	SXoaZntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY6C-0000000BZSR-3Amp;
	Fri, 07 Feb 2025 23:49:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY4m-0000000BZ4h-0p4e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 23:48:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21625b4f978so52465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738972079; x=1739576879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1iwNqxyXX+1eY/JvvBpbWmyKCAKiA/P8z+kIxPWpe8U=;
        b=e/J9rdQEZkiLMNfbDY5MK6Izvbv1gpFSQee9HwWsJSGIy/SJeD2Ik+1IYDLlnY8VXk
         EczzpQvUInHS1iR78SeAsFXMs/1RKvqBHQ/14vACDrhm1KnWLVli7+TAPC5N6ph+m1/k
         V7o1kU2fTws0fp7UJ7/Kht7Aya9A8Hwrx/YO9Zs4YXwbfIySTsz5AprISBH5jx86Irmb
         LAupQ83HZq681xgTRcJuAkkciAisk0wUC6bZi5jagaP0dniJlWzy5DQLJu8Tgog/bozE
         zGPEKY42kJhI6+6jKgjwEyP1u3dfU5YZe97OHfrhA8w4CJIijFlxjfNN4HrP8MBZMymb
         0lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738972079; x=1739576879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iwNqxyXX+1eY/JvvBpbWmyKCAKiA/P8z+kIxPWpe8U=;
        b=pABGneWpaub8GhCz/PE5csrnn1bVselhIjHEApDTTbOlvehYpThpn0QipxYRm19k0N
         jR2eUQDIb4XXzdoLU+FCatlCChhWaysAjig9s+9AdhULomWnxt0gWyLs0j17oyzAYS0a
         cPNXSXR+tssxYNZZCgnS9dQLkTgkCrbXqtlIzbSbbRO6s0YFyt4rvdr40zWZgdlqb6SY
         uGA+6AhOc/CyWJ+giXxjk2bZKTvCLLpHdUXp6UbS1ZIAv/0jikws6DHoNJGN8t3DWrsB
         vyuGyW4SkDM6m8Bg2MwZCzBycTjcVg/UeiIMSonqyDx/35AGMnjANVXN1jSBnk5zqesS
         ZeCg==
X-Forwarded-Encrypted: i=1; AJvYcCXEQFkgkRmM1wEoUedcbVTfMVWYajxVjL3HhgV7MO9HNxiK6C0LeHf1o7fGysPVZQp+XtP/agmX+lqDQWUMXtqK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ITK0Dz0dmVkLjrm04cC22E/gDtwFDHIGtIHD++RLnsDsaSrt
	mFwOMSvf98lpCRawKIEZpCEzjP7k8llnksJmgxMh3xJ6rhF/4FULT+N5C15raA==
X-Gm-Gg: ASbGnctYs1SfoH1OJQ6TBTCg8+KlyduKM4jm3U0x0IRkeMk75Tb1jz4eDQ7LBNOzaPN
	VwJciUJnZUzDjMARfv7gdIFMJLyEO4ru0+W444hUdHGuiSTPL+gZr9birp7C2ZPiV5Sy2/6uCVB
	DJ/wVC2mxsz5C8OJiGaV3q2kJ6Uf/4+3xivxUV+R4Ol/lWqLD4MTG8Sw3BONiz5rbGAuUfKBMko
	62xVSIk/5kSn2y2U5qFSd1JrdA1PnyoocWXlgEJ074m6BSDjOx5z7xo/id6zVeuDRQ98UwQI3Sq
	aFDyBM12INquIMSWDGoYxSsFFuFydbXYYkXct9A5A4PuxPSc832syQ==
X-Google-Smtp-Source: AGHT+IGONo3dtPJJjK/HmC8+ldNbaKs09fGFZfiee4cJhRCwYYSr1ACZHZYbwAWDerUtnX53vOlO4Q==
X-Received: by 2002:a17:903:19e7:b0:21f:2828:dc82 with SMTP id d9443c01a7336-21f69defa27mr932095ad.2.1738972079145;
        Fri, 07 Feb 2025 15:47:59 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16180sm3560862b3a.129.2025.02.07.15.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:47:58 -0800 (PST)
Date: Fri, 7 Feb 2025 23:47:53 +0000
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
Message-ID: <Z6abqWVQRAFHAUZm@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_154800_243210_7A17D802 
X-CRM114-Status: GOOD (  11.74  )
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
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bpf.h>
> +#include <bpf/bpf_helpers.h>
> +#include "../../../include/linux/filter.h"
> +#include "bpf_misc.h"
> +
> +#if defined(ENABLE_ATOMICS_TESTS) && defined(__TARGET_ARCH_arm64)
> +
> +SEC("socket")
> +__description("load-acquire, 8-bit")
> +__success __success_unpriv __retval(0x12)
> +__naked void load_acquire_8(void)
> +{
> +	asm volatile (
> +	"*(u8 *)(r10 - 1) = 0x12;"
                            ~~~~
I realized that I am using STORE_imm<> instructions in load-acquire
tests, and llvm-17 -mcpu=v3 cannot build them.

Can be fixed by simply doing e.g. the following instead:

        "r1 = 0x12;"
	"*(u8 *)(r10 - 1) = r1;"

> +	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r10 - 1));
> +	"exit;"
> +	:
> +	: __imm_insn(load_acquire_insn,
> +		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -1))
> +	: __clobber_all);
> +}

Thanks,
Peilin Ye


