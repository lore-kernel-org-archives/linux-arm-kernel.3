Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68ABC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDYadGDopo/kQCy0AbShI9sRbHzG3KIQ1tPEzUCUA1A=; b=kjFCs1398rc6l6XazfC9zJw0U3
	pCwGLu9hx7STN6PUCdK6mdIs29k8pRC/qQBaAp9IRfRKPs/6FboyJQ0Y0NICSUC7qDkST8hVEtcaR
	Gk+ctTMTUC1S+tq1KBOh68jjv+hiHBpBi1idQB7gYEIqga/hOIqghZHdh/8Ww7Odt9CGOcEtnDB7X
	NOMb50EJg+LFtEly2U2i3aKx2tMKXPmMULNtkraV8vPmOcYuHcgn5vbrVKq7XcyQt3hhPH4TusTbG
	C6b1m53sK1puYCRPKTWDqQma3XWzRj9wie1ZlVySGH+rRR5R3o8rVL/5vYsFsguJlSMRzEUPdRa5g
	0KlHRN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaTN-0000000Bu6f-35Ic;
	Sat, 08 Feb 2025 02:21:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaRz-0000000BttK-3Qxo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:20:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21625b4f978so62725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738981207; x=1739586007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDYadGDopo/kQCy0AbShI9sRbHzG3KIQ1tPEzUCUA1A=;
        b=qs5hcegcC4Y6iV/K8UhiZ8lN4IgL6G0oj6DSwyHqEIg54f/OSCypia/lmufbbSEMLM
         tFS3ukAGQtFVq4woTzLTH5MiyGyVhOfYznvbJUTH4nJRvjySty9StEJi8yFnEabtSlkM
         xftBJnAUSA5ziZwz5Rzyvwf7U+NCjGtsBEabwRinFQTdSvjd7Q/ug4n8n1nzLi1gHF6w
         hUXZUE6eL/B7cTlN32sjpzxJqhydy9mOCTL8y2mSCgRfYlGiZesNv4nVSGeFDsH4I1hn
         TAOij5vPltcZLRaIEW+RHyO2dC/GaOaDIlsuS1PvcaQMsnTYwZYUGd1rT8cnoqPC91dy
         5xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738981207; x=1739586007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDYadGDopo/kQCy0AbShI9sRbHzG3KIQ1tPEzUCUA1A=;
        b=FTsLEJ9+ZEN8fmwLSvjGAphW+SMI8eQTZhUCDZ/WOh7RMfgx0zNPziJz8G4u49ckw1
         3VmMlsGo4Dd+5jFHx9925Gk1Mx9TeKeAFGcZFpR7ZhSqqJFFqlh/gl/Yes8H0JSlYW2a
         RSE32PAujLRSf3s0DTAiTM28FbDYmpAepxLuqyMlt+e6i5mUoXkBvkClWOE42NoKaFek
         vEr10DARKGp8v9t27bVbquf3wc7EuYnBTbbgE45F8vxTuWqQOFowh4kec2ChPda4z1rv
         +OTsdnilHhcGjKjcgvlVcG2BgHphKVBe2fq8k1l+laUzzw3SAxh9gaU0ySNf5dDspsO6
         7PHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUldxTUl9YKF3jwnDQZwajhZB/iKQtghNK/XmKiYZMYIpCU538SCCCnctaOqBlaes0e5gytbzekMTv+3v5EAw65@lists.infradead.org
X-Gm-Message-State: AOJu0YzH+eerzLqsy+6FttxxWjMaUHyXah7f1rqIsTapDOh36/DkMFVE
	rnsDwHu0iAbpLrY0uRCOlhVC+KSZvgr0RQfvPMcEINfo3VEMibiA3M9Xr5/1EA==
X-Gm-Gg: ASbGncu7WJ1U3T4ubOk1/emmox8vLF4mMl3njESwtpxlNrNnCfzT+MT7HxehjkBSRil
	ed0OIkUkZJnrF6T3AoT2zxNtFagT78pLrDljlhqoNMohhtMq7ihd9C1NtBSN+8rf3tgTnv4Ee9k
	b7r+ZnAqZICsXm8cGVhXrV8qpUKPRK30I4r1GZNs4OB6TBnwRwLcWd/rseQdAjZaxArzb3+5bQw
	90V3LHTNqXPCCRSWPPmARlFmlh83JcIYp69cO3H811N/MqGxZbOG3aOH3jIRR9/TUm3M3cTm1Wb
	he3oIMon6uiQ+WTViPlsIVMPh0bA8pM5X/E8eZcyg0FYLki5+2ym4w==
X-Google-Smtp-Source: AGHT+IFW7Dg0rfg79gNlOmOZ/6V2FDiboe3xwyeaFxXl+wT8n5p43lmv5zIvkgHsQpAmIZegolvnfA==
X-Received: by 2002:a17:903:1a27:b0:216:6dab:8042 with SMTP id d9443c01a7336-21f69deebc5mr1209985ad.12.1738981206955;
        Fri, 07 Feb 2025 18:20:06 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa4d1220f2sm16756a91.40.2025.02.07.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 18:20:06 -0800 (PST)
Date: Sat, 8 Feb 2025 02:20:00 +0000
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
Message-ID: <Z6a_UILNqVGBqnvY@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
 <Z6ajasn2k559SGNN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ajasn2k559SGNN@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_182007_859632_42AA46D1 
X-CRM114-Status: GOOD (  15.84  )
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

On Sat, Feb 08, 2025 at 12:20:58AM +0000, Peilin Ye wrote:
> > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> > @@ -6,6 +6,8 @@
> >  #include <stdbool.h>
> >  #include <stdatomic.h>
> >  #include "bpf_arena_common.h"
> > +#include "../../../include/linux/filter.h"
> > +#include "bpf_misc.h"
> >  
> >  struct {
> >  	__uint(type, BPF_MAP_TYPE_ARENA);
> > @@ -274,4 +276,90 @@ int uaf(const void *ctx)
> >  	return 0;
> >  }
> >  
> > +__u8 __arena_global load_acquire8_value = 0x12;
>    ~~~~
> 
> CI job x86_64-llvm-17 [1] failed because clang-17 crashed when compiling
> this file (arena_atomics.c):
> 
>   fatal error: error in backend: unable to write nop sequence of 1 bytes
> 
> After some digging, I believe I am hitting a known issue that Yonghong
> described in [2].

> Changing __u8 and __u16 variables to __u32 seems to resolve/work
> around the issue

Sorry, that wasn't very accurate - we need to make sure there are no
"holes" in the .addr_space.1 ELF section, e.g.:

  /* 8-byte-aligned */
  __u8 __arena_global load_acquire8_value = 0x12;
  /* 1-byte hole, causing clang-17 to crash */
  __u16 __arena_global load_acquire16_value = 0x1234;

LLVM commit f27c4903c43b ("MC: Add .data. and .rodata. prefixes to
MCContext section classification") fixed this issue.

- - -
For now, I think I should:

  1. change existing #if guards to
     "#if defined(__TARGET_ARCH_arm64) && __clang_major__ >= 18"

  2. additionally, guard "__arena_global" variable definitions behind
     "#if __clang_major >= 18" so that clang-17 doesn't try to compile
     that part (then crash)

Will fix in v3.

Thanks,
Peilin Ye


