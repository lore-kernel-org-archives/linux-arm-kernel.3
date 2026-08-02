Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28740C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0Po6SXhfV2vXQAkV6y/NPCPoeX6dz+V1IoPOu929LY=; b=whPkWb8Jr2eKo18JMdaUDNg5Fm
	vGpJ/mElxU5yCD9qPaPBHDhnpEaiYhi8eJtv9+hLThZG9zMeSV9j/UvdcNTD3ST1MXe9px5rLY4xe
	qoIeoj+lsswy6CAJIErVjsb22GRdBHM9mzJ7V7lGYVp1yD6iIZNPJ9B9AT+kKd2e5nHTRBQjOft63
	MNWmOtWdEhoXXZFje6fZ7DuZitQGvLKz3g6KPt0mU5YH2y7rFQmfzNv9I0LgdqS+dz8yOMXHSmxAh
	RP6krGCDfafMB6qkK6m2NnRcjWfpt2puw7rVTfU82rBYqrFVUzS0Drip4iHOua/ZAmvWMZNlsKSxX
	+b8HbDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqd2x-0000000G2zd-1nq2;
	Sun, 02 Aug 2026 20:44:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqd2v-0000000G2yv-05sJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:44:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1345546f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785703471; x=1786308271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0Po6SXhfV2vXQAkV6y/NPCPoeX6dz+V1IoPOu929LY=;
        b=PtV3/Kdic9gcLDxmlTWm+Y0NWOTFZu8fu3Kbjy0cORdRmfa1K393yhrKlPdy4WqEmv
         EJv8n6qmGa6Ou8uCz0DjjmuburT9IOcIQ6SfkWoCgp58ieb4wGI4OZDturzlPAgReU1l
         281oyMy3WWtEG6uh6Q119wpBplGEl3j4cwB94/GlcZd+cqGA0KGrlv5U5wyB4D2bicwp
         k9wv2RmhCPA3PfCCi5TAkRrd2DTP9u1WBxCufGjA8whmRlszKMQa29/H09zg7Z9I0WO3
         LaVtdx6t6iJ2y05xveJ3MoAghuxYZAnxhHz/psfTOuMcxiYuV3PAiJBP1aYQuuINKBNV
         sx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785703471; x=1786308271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Po6SXhfV2vXQAkV6y/NPCPoeX6dz+V1IoPOu929LY=;
        b=WDS0lb7Nsk/b3wgX2JTrHQuPcoZVvjYLCUeeyVfaR9DBWceKfZ/wYdUghuSIv6FiR8
         jhsH624av/SOHWn4Oi17bA6+cDfrFUx07cMwZxx5Nvcm5qCrGYWzZroYe5HugN6y8vsd
         K/G5lsovW3uHxewW/EGud8q3FXrX/keTicXbjnLjkdxdHO+/ZtJmSBN98aiTSwCkjqKD
         uGlGemeXKFzd68tfUGqkFRzzugBclb08FAXpdoIqq7PJVTygCeuxaKCUWZYa4MmOJgSs
         wwmd9i+d7hMZkm2u4YuDrNSjni1zGB7COdtTllezKFf8noqASFwD9TjSl6Nu2EEsM97D
         H0Hg==
X-Forwarded-Encrypted: i=1; AHgh+RpySlCxDl0Lueb/3C/tEazph5RvxJmN140a08pnDTAp/+rSdLF4wk3hzJYEd75UdbVfXQ7Sbg8Z6Zao1T+0FcYl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0DRX3+9ZqUHbN1v4l6tvuRFLo0tBWCKosQeshPnJgit+WenMK
	kzP463J3Gc/q0cRixrV4vXNoZP3KZ2LTh+MNfQz47ZPIVjoWs2F2ctOb
X-Gm-Gg: AR+sD10kE8r71FeICyQcxWGkA3IxpeWarA1GQdge/jH+JpbqcykLXFoWgVCyoMMpas0
	/Ho5Hw4U2EEXvEyOZjiQtJ8ukGEcT28QRIS4SfoUQeRVJQhOoNDvGYG4pnPMt7uvfpYnxMG9mjs
	4Tlv2IxWeEkl9QIFXH13t6KgD5KkVzA65bXRSqIk0e7drfrXjbT1NVFvVohId9s10+lMPrnGpzo
	ShNftR+yXutTm4nm7b8aG3H45I78lHLEUagorUnSCJHVijM70iOJWMzN25Pb5wPxM6QMIqEYwJT
	rXrPI536H1aWEnXuWqCRduiI7y5oT8QL81ozkvBtRLmMZg5iKoBhqBmAiiRJzXi4viTgJGEvGRR
	H7gG0TpGVv622olV9de9hK90kuGKWJc8TTkOZzWbFK0vTUfel1cqve0drtgYm1y3dU4xpm9Ui6X
	EgZuDYPCkS0SyramXp4u9EzEFpl4l4MKIOQmMkALg/7/PFSdko
X-Received: by 2002:a05:600c:a4d:b0:493:e46e:157d with SMTP id 5b1f17b1804b1-4980c693eaemr164544645e9.19.1785703470644;
        Sun, 02 Aug 2026 13:44:30 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm218215135e9.3.2026.08.02.13.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:44:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 2 Aug 2026 22:44:27 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <am-sK_buCVI3khJv@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
 <amsuU7eXuoziObdh@krava>
 <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_134433_075486_1396199D 
X-CRM114-Status: GOOD (  22.37  )
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

On Fri, Jul 31, 2026 at 10:30:37AM +0800, Leon Hwang wrote:
> On 30/7/26 18:58, Jiri Olsa wrote:
> > On Thu, Jul 30, 2026 at 11:05:42AM +0800, Leon Hwang wrote:
> >> On 29/7/26 19:56, Jiri Olsa wrote:
> >>> On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
> >>>> The BPF tracing multi link updates several direct-call sites through one
> >>>> ftrace_ops. Its implementation is therefore gated by
> >>>> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
> >>>> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> >>>>
> >>>> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
> >>>> direct calls. This enables BPF tracing multi links on arm64. Also
> >>>> generalize the unreachable-trampoline comment because the single-ops path
> >>>> does not use ops->direct_call.
> >>>
> >>> hi,
> >>> iirc arm needs ops->direct_call for trampolines to work properly,
> >>> that's the reason we enabled single ftrace_ops on x86 only:
> >>>
> >>>   424f6a361096 bpf,x86: Use single ftrace_ops for direct calls
> >>>
> >>> I don't understand the arm usage of op->direct_call, but it looks like
> >>> (codex thinks) that the fast path won't always work without op->direct_call
> >>> being set
> >>
> >>
> >> In theory, op->direct_call is the fallback for the case:
> >> HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y, out-of-range target, and non-BPF
> >> direct ops. This is what Codex thinks about.
> >>
> >> However, after searching the call sites of
> >> register_ftrace_direct()/__modify_ftrace_direct() in kernel, which would
> >> set ops->direct_call, the actual callers are in bpf/trampoline.c, which
> >> have been gated with HAVE_SINGLE_FTRACE_DIRECT_OPS. That said, for
> >> normal usage of HAVE_SINGLE_FTRACE_DIRECT_OPS=y, op->direct_call is unused.
> >>
> >> If someone uses register_ftrace_direct() or
> >> modify_ftrace_direct/_nolock() outside BPF in the future,
> >> op->direct_call will be used.
> > 
> > so any 2nd user on the same function triggers the slow path,
> > and that's fine, the single_ops handles slow path correctly
> > 
> > but IIUC the out-of-range target will now always go through slow path,
> > which in current code it doesn't, right?
> > 
> 
> Right.
> 
> Pls see the sibling thread with Ihor. With in-range BPF trampoline
> allocation, the slow-path regression should mostly disappear.
> 
> Let's continue the discussion in that thread.

please paste the link/subject for that thread

thanks,
jirka

