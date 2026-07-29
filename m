Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1511BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxSPeR/qOCWC5IaIobtTnOVkK5MQEeMxfQBafeblzVU=; b=5BT7I7kDCZZrJ8y9vSWmg7Hc+u
	vxHIlKftC4vAUjlaocVd/uR+CZiSekRjwFRWbWJiA5+palgfKaYIzN14Nr1GcLL2S61sj17eZfxP+
	XMB4A78cS792CqZvYeJAvp8CNJjMRti7rmC/jjXZdFd7DU6mT4D1Y/UMp57V4whroGwGJ/tQnnaVP
	RQAcDVO6flBHcjVV/I20c2XssX5kQqvAJWaU5Hk9ukb+Hyo5UqsoIrLswMzmxnLiifPzDIVKRht8K
	7itBZchH5aBtC5iLZUYArxRNg5zrhtu1cuhSXq2D/6XM+sIhM4r/AAiYi6ihMnmaHDU6J+UPf83eM
	1pgfezGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2tZ-00000007no1-1jUV;
	Wed, 29 Jul 2026 11:56:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2tW-00000007nm9-3qbR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:56:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so569199f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326176; x=1785930976; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxSPeR/qOCWC5IaIobtTnOVkK5MQEeMxfQBafeblzVU=;
        b=dol8xO/IWc4j2as84rlPIe7O7pIQT4kQ8h1zhsS540ZNTSrWLOXcPW2S3kMyPspYjC
         St9OfbTkWSCuqX/cMbt+eLAoN9GW6j6u9Y0DxXxZd7eabGvGuYG46FvKQt7GCMWeibJ9
         WNiyjNU21U0eESAD81t7yDKHozc7/WKFQT0iLxhS90FbJEbnJtfGlhedjx1JiuBZxUXX
         VsKD2diQIlKgyEZLU9V8UUXnBmEt38+wpjXyszA1WcFRVC6X8qXliSAc+3QZYVhfEm4m
         KNsLPsZS/g8YC3709wUDNTkV4PRq4pvAB2oBW5VjbVnSrNRutH4mmY3GSvWyXOu7NREI
         kh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326176; x=1785930976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxSPeR/qOCWC5IaIobtTnOVkK5MQEeMxfQBafeblzVU=;
        b=nofRl5p09R4XzNZy7mr2xq5QBonYub/udqbkxqWX2/Vp0aWKLbGxQERG19UmWbbc4Q
         k2cJrKhkwK2weEIHsoQjHUDObSBPNMG36c7ATmKS6ePY4FFUwPkiyzU5/Rxf7BNG3B9t
         pFzEpVvpK49/HIAYXApcp6WrtpRiyJAjbeuOcHt+UfC9vIU6wQuQol+cPU9zlqoPpA4H
         6L7DHcRnSh3LZY8T8esPjUiWIv6Z49OR4HBKMk6j67rXTv9S1+9V08O2LwYHdzL+/R08
         tu+0C/tYAAQtFUQq50P3rvXxO7XYpCBtFahG2xdk+p3Iv77OYBnto/xjtz5BF1n5tb5m
         /6JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8fi7pNtBEp+Lx0eUXqa4LbLvwKtzL2uH/R7dOkVCORFxGBGzL2nXUcXXr5Jfiw68BfrML5ToOFCJmKopBQtew@lists.infradead.org
X-Gm-Message-State: AOJu0YydO+f17xm7K86o7esG21VnFSISz09BuoPX9KT5K5E+w3mhMl4j
	0cRfnbMu/hpL2SJJAGRxCS0h7uHaYrWGf9GwFwxmN4Dd/inFvHzOEdX1
X-Gm-Gg: AR+sD11ppbXXqD16pAoEnNxUgn0HohWq1mqPzlLWXnStj1MVOwdE8w++jr7xPoyrbfA
	pu1iNfa6tNCB8VSDQs9l3JuFVgh24G0OaEYHz44P2nUMPpY5OdZnVsUr5It1c7IpvKKmZbT2qsJ
	UCshkvsNm+e8fsQ8U7GVfRDSWXo7wnu+424CeqKXp3VhhNf85F3LWhHqR0D+Pze41ZjTAHpWFSr
	QnJFIwp6CgaSS4OELlevRQ6hRS4lNXDKwTSakfx0+itk91sK1RC1pGtQv8gJg6ljSk3MiOx2evW
	f8K0+8PtBkeeAtpwA7ARhzUnYX10HvWgFbIm+I+moFBoWqkYSSBbvxASifS11K+VxiQuCqmmXbQ
	HLsD1omAyB9WwhblWfBujkgHZnJ8MFnP8oI7zu14nOvCY9ibdcc5DK5dUx2CAx3C+v2X35Mopr5
	ttVRk83yuVC7tXQraIYj3VPshClIBQV9ACZ9k=
X-Received: by 2002:a5d:584c:0:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47fb1ecaf73mr7057660f8f.3.1785326176317;
        Wed, 29 Jul 2026 04:56:16 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::dd7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm7531659f8f.8.2026.07.29.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:56:15 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 29 Jul 2026 13:56:13 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
Message-ID: <amnqXeC6D4mjcAe_@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727142844.21212-2-leon.hwang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_045618_974295_58395919 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
> The BPF tracing multi link updates several direct-call sites through one
> ftrace_ops. Its implementation is therefore gated by
> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> 
> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
> direct calls. This enables BPF tracing multi links on arm64. Also
> generalize the unreachable-trampoline comment because the single-ops path
> does not use ops->direct_call.

hi,
iirc arm needs ops->direct_call for trampolines to work properly,
that's the reason we enabled single ftrace_ops on x86 only:

  424f6a361096 bpf,x86: Use single ftrace_ops for direct calls

I don't understand the arm usage of op->direct_call, but it looks like
(codex thinks) that the fast path won't always work without op->direct_call
being set

from arch/arm64/kernel/entry-ftrace.S:

	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
		/*
		 * If the op has a direct call, handle it immediately without
		 * saving/restoring registers.
		 */
		ldr     x17, [x11, #FTRACE_OPS_DIRECT_CALL]             // op->direct_call
		cbnz    x17, ftrace_caller_direct
	#endif
	#endif

jirka

