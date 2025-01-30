Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85ECC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 03:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iozZcyUUIkHDUlZTrg5vhL4fOr44L6T33XHkD2MasV4=; b=yn32c4LGN7UbWsttMam3Az53PN
	6pgfgpIbk2qLuaLf9l8qPO1eyTMNlfwASpvEkGfPX5qe58Xb07IQ9ELZJfix7P4i2zrPdjjo9hM1H
	o4/3T6nToc3wSLyADC3doZRT1nhyDFR4qoSEc4LZoYQPQzrTPjjAxTOpIlZj3g/2+XL7PA552OjEA
	0dmFDVC/LrmI6p1IZgQ7q+L39qgogVmk2cNwucSddKQVMDgrmgb4g56GUCayVTJxhpZzbQy+EF9uD
	oCRrtATbUuTuDHjJM6Zl3Qjmv9sT2F0c0CI85qL2X9TBhI3k6iRJYBw0it07+htQ/+H3kysFuzGkN
	uKeWtKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdKxu-000000086kK-40yg;
	Thu, 30 Jan 2025 03:11:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdKwc-000000086XN-2d6f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 03:10:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-219f6ca9a81so38585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 19:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738206618; x=1738811418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iozZcyUUIkHDUlZTrg5vhL4fOr44L6T33XHkD2MasV4=;
        b=owUTp7OvDrQ+ncYeUFhFX78/sRc1B8QOQvkXpQZxeVOhob8wbqZsWw3R7OsHNh6KDF
         M+IV7ek6AWZ0gmbXGTl39G6WweFv43b3NBl2Jj3PN/kpevg2KMxrwHI7ugLluxLBbqRf
         ecjqo1M58OCHf9MDrvlfteiIWd8SJlTjaU1fGdRi5v1JPWCav10GJCe8IQG3jYg8AacS
         1avwTgfs1Nekcmh6trNkANJMWYzNF2LNPQahf1igQcCioYXM8SvTLiWn0bbWWY034nvN
         9syjtyNZh4T1SIBII/xH4U3fed47Gkpee0Six3XNvUTeE172icho7hjtNEZ//cH5gqp4
         iCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738206618; x=1738811418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iozZcyUUIkHDUlZTrg5vhL4fOr44L6T33XHkD2MasV4=;
        b=g2o0qJI7qUmfq0Ck4DuKfubfp0pIAPfMU6F2AoEFglOOFpymBvi+0pT41IBIYe8ESC
         mqFe6pKABOSQHgclJ2ZgqaDiYBFRa/6yG7BFMPKynxTeKPGMu2nuBV0CGIj2DJ5qXCpL
         qapVHqC4Udg4AWdcbnL+et4ETpjzYGgXxo0XviK1FjBiXQ+ihYnviEq7SSBHv5mvkSbc
         Yd4tn3Bfdt5cTXVeG2fbcRgHGHcMlUQtvRX+jxO/H6B7tnrfdwmQIvfxl5jg99CdBzDF
         5HIhOI/ACgAfBv9nSMUQSooGOOGcNyAYXEHHt12y/zowHFRBC7hY48/4oz2TjLtyTB8U
         WsnA==
X-Forwarded-Encrypted: i=1; AJvYcCXUDc0lHG8fHpvL90wNq4lYFoxRGdfRrHM24aaAVWX62KgJX3vi+QIVphhyXm6yz4qIBB++JBhk6Gf10y4qLUcA@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMvmSia8ReQB8qr4F/k0jJALp2NYEDpi8x8WcD8iWJppoOhk3
	m2eYhn+RkakfctG7dHCLxzCAjTITSUz9eF+q82d94szHxRTARQjRXeRfu16H1A==
X-Gm-Gg: ASbGnculOtj/0FQdtSwNneu90kHhap412h0wCev4ZZN08xrbje5vQdhWHZ2FiJ5KAso
	XM0bR0vdh0p43d+kueggBBkdYvl6CTrxhNDHxGxNmToX/GQM8IJ+rDcuQU2v3f0bzQpX8s4sWSb
	IIO5AjnkzJIQ+NBf9D+q2ZVNBDqg9exjaSiD9Wy7wZqVnMGZDx2m3vgUzIb1EbSUrHfchChmzFA
	5+DTIHOhURPtC8pXWRHGlhqpCFOdUQgDGXBhxizjk6Hlmj3u6WWQngi8E+aeMkgsd0ccJndZj78
	FH2ZEPo/qCL7GMamuVl5gSC1WnKrekV9wGbMw0yeSDuLCgz/QUM=
X-Google-Smtp-Source: AGHT+IEEKyHbZCP0iiK15ABPuaXmbOXW1jxN8hiCr6k8KYnVexFhjDvy8HwRqZberwcgcNwTXgzgng==
X-Received: by 2002:a17:902:aa09:b0:216:21cb:2e06 with SMTP id d9443c01a7336-21de36959b5mr855465ad.19.1738206617674;
        Wed, 29 Jan 2025 19:10:17 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce51dsm263323b3a.134.2025.01.29.19.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:10:17 -0800 (PST)
Date: Thu, 30 Jan 2025 03:10:13 +0000
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
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5rtlTv2pz9H-smw@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
 <Z5qmBaGE4a7NtaFU@google.com>
 <da01f44bb1f3463515574796c3ac139bbbf7b4dc.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da01f44bb1f3463515574796c3ac139bbbf7b4dc.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_191018_671090_7452C321 
X-CRM114-Status: GOOD (  22.47  )
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

On Wed, Jan 29, 2025 at 02:42:41PM -0800, Eduard Zingerman wrote:
> On Wed, 2025-01-29 at 22:04 +0000, Peilin Ye wrote:
> > Thanks a lot for that; would you mind sharing a bit more on how you
> > reasoned about it (i.e., why is it OK to save_aux_ptr_type()
> > unconditionally) ?
> 
> Well, save_aux_ptr_type() does two things:
> - if there is no env->insn_aux_data[env->insn_idx].ptr_type associated
>   with the instruction it saves one;
> - if there is .ptr_type, it checks if a new one is compatible and
>   errors out if it's not.
> 
> The .ptr_type is used in convert_ctx_accesses() to rewrite access
> instruction (STX/LDX, atomic or not) in a way specific to pointer
> type.
> 
> So, doing save_aux_ptr_type() conditionally is already sketchy,
> as there is a risk to miss if some instruction is used in a context
> where pointer type requires different rewrites.
> 
> convert_ctx_accesses() rewrites instruction for pointer following
> types:
> - PTR_TO_CTX
> - PTR_TO_SOCKET
> - PTR_TO_SOCK_COMMON
> - PTR_TO_TCP_SOCK
> - PTR_TO_XDP_SOCK
> - PTR_TO_BTF_ID
> - PTR_TO_ARENA
> 
> atomic_ptr_type_ok() allows the following pointer types:
> - CONST_PTR_TO_MAP
> - PTR_TO_MAP_VALUE
> - PTR_TO_MAP_KEY
> - PTR_TO_STACK
> - PTR_TO_BTF_ID
> - PTR_TO_MEM
> - PTR_TO_ARENA
> - PTR_TO_BUF
> - PTR_TO_FUNC
> - CONST_PTR_TO_DYNPTR
> 
> One has to check rewrites applied by convert_ctx_accesses() to atomic
> instructions to reason about correctness of the conditional
> save_aux_ptr_type() call.
>
> If is_arena_reg() guard is removed from save_aux_ptr_type() we risk to
> reject programs that do atomic load/store where same instruction is
> used to modify a pointer that can be either of the above types.
> I speculate that this is not the problem, as do_check() processing for
> BPF_STX/BPF_LDX already calls save_aux_ptr_type() unconditionally.

I see, thanks for the explanation!

Peilin Ye


