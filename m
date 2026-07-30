Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02EBC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtmEW6LmpN3hbmzYM7Cf4iCPw5cw70uOQWik1DIJVKg=; b=OqdiwfhIju69Qbg2nRj/E+bu9f
	OxvTgClBSSvpROwNOP6S4tX+wwLIudjTa/Su/CV1CqV7mVbuvKQ+JgJ9NGJbB5rKPSk848cRWNEUn
	UOWSWMrni8YirpeNWcQrT3TdF+0Ala2WWiOGcqtJ30PQjh3YuVJ+zUgo218aum5BxcRdbcjMw0VzT
	vpaB/GY6tGl/bTYZSOScIzj34DwpU017Xk7sVbUdS5et+SN+ogwDzUQoxbPmUIup/TJ5O41ep1CM3
	Y5MSzW6+nOJLg/s6uwtuNkQe71QBDxRnV5KnD/NhxLDGneAS4jjh5mZj3RmSm9gvIU9OcjPIAKmXb
	jSiv7VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOTC-0000000AHkO-1gzm;
	Thu, 30 Jul 2026 10:58:34 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOTA-0000000AHjo-0yJN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:58:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c12614b81c9so354715966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 03:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409110; x=1786013910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BtmEW6LmpN3hbmzYM7Cf4iCPw5cw70uOQWik1DIJVKg=;
        b=hfpNjX0zJ9alku0QieuzK6anBmdBBGnhupbLa0QVhiQgi1iGeMw8ppgjD9VnvgVDR6
         4nrG4+AUpD4wJH8BN4c5Z4vkEle7FJhODTo31bLdekTf0kLpSiuYtuKzKlqHpiHwCUXJ
         DterB1XkbELJ7V0EFNMjYoyYG0IYVjqvwUrBUQ4kyc6o04oY+7BpPFxRp88Dkvg7AefN
         aQvU1TG8YKpjh+CEJ8FWEYo9d7ulb5mxCzbZs2cMp3myXhnrVYFlpNv5w+zpjVFIt0ce
         qyafg9TrLLeGEr7hf5XhK04wUMgWPOHAfukMcSJy9hALgXCikQ+LucXFpwZkp697g9ho
         WiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409110; x=1786013910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtmEW6LmpN3hbmzYM7Cf4iCPw5cw70uOQWik1DIJVKg=;
        b=BsgrnY0oL1s6zMVTzIqYb5Vc7l6nWR5hU1kFWCjDcWtNqf26VpOuhHqqwwicdGJcH/
         KFGJGCdlrwN8Em79d6WAzme0fOc9T1AvBICuizs4BUHm3lhrPCb8hq0m+9woMwIuKWAE
         bJbnmlKlSJLyGRUx7QLHZRpsNTBIL8CtiN0EvqNy1WZJyWxTgCzm1Rtq82STixyS32pP
         dRc4FcPEfLULF++rCRDaUGn7hmC315RfMfyeUMoHhUNpDnImFMrIxxpJ9FmiVDRng6Oy
         a0aVZBo6xhG3pH7+ewDdzhZDdH6PpffKgVNZMl5eFK3s2wBf2YGTz+7Iu/SL+KdqgzDm
         Nq7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrj0ET4ijcpgY+A3NAPgj5rrviBdf6dTxBgxDBxop9/Bq2dRs5+aRau8DOFAXJJlwc0iWf8511t5FbB71rttoX0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2iBwOtZA05+fs8rtnKVqeReT7K+ZRQweJDqBu0NwhlfGqwSEv
	LPc0fOVKHwc6sW9S/9iJ8IGhbAAGaXW4DP8CCJcJOhX9X/nFZ0a7aTEN
X-Gm-Gg: AR+sD10e9Ar1s1/ekiKzKEYr/HVT2ejuTL6La6b6CV8y9ITZ1h+VwOy6m5DJ3XU2ZG+
	Bo4PZScdSS6xuvIq0+4wrOan8CmmIdD+9WtuL2olAkdPElUQCvr3KmwKg1g9fzpzfDmwWk2XmIk
	zsp+EmlvDtD1/BKizBmsFnpQoURMUAqSp/67s6Lm+BA2TYjECl+KVsM9XrBZ2SniAOO351R3gh+
	VOO6vA40bZJn5vTG1Cp4/E+LCy9xfj92dZgU8AAT9vYjewqMCQy7C1m/v5n3K+rvAgMrQXs2Pzl
	TJhNgIZPLyfLfMD/HtY5XyRGltwK69U77Ib/m4RZgAlJdWlEXCQRcftTToJXahJv+lyroHdbWtt
	EnORujruIxvcxgiu0yM6/a/xsC+2lmNFsWoB4GpYDItH/i6fhKlNh/X/QYC7XRJUUX2bEEA2Ooz
	prSqa2ibhOzdejMft+engK6PVAzy3+ZCcQJ57ewtY/aYcBt5A=
X-Received: by 2002:a17:907:9443:b0:c1c:4afd:8d8c with SMTP id a640c23a62f3a-c1fa558e48emr104613966b.14.1785409110114;
        Thu, 30 Jul 2026 03:58:30 -0700 (PDT)
Received: from krava ([173.38.220.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8578015sm55934266b.18.2026.07.30.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:58:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 30 Jul 2026 12:58:27 +0200
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
Message-ID: <amsuU7eXuoziObdh@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_035832_310301_1039C80F 
X-CRM114-Status: GOOD (  21.45  )
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

On Thu, Jul 30, 2026 at 11:05:42AM +0800, Leon Hwang wrote:
> On 29/7/26 19:56, Jiri Olsa wrote:
> > On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
> >> The BPF tracing multi link updates several direct-call sites through one
> >> ftrace_ops. Its implementation is therefore gated by
> >> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
> >> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> >>
> >> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
> >> direct calls. This enables BPF tracing multi links on arm64. Also
> >> generalize the unreachable-trampoline comment because the single-ops path
> >> does not use ops->direct_call.
> > 
> > hi,
> > iirc arm needs ops->direct_call for trampolines to work properly,
> > that's the reason we enabled single ftrace_ops on x86 only:
> > 
> >   424f6a361096 bpf,x86: Use single ftrace_ops for direct calls
> > 
> > I don't understand the arm usage of op->direct_call, but it looks like
> > (codex thinks) that the fast path won't always work without op->direct_call
> > being set
> 
> 
> In theory, op->direct_call is the fallback for the case:
> HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y, out-of-range target, and non-BPF
> direct ops. This is what Codex thinks about.
> 
> However, after searching the call sites of
> register_ftrace_direct()/__modify_ftrace_direct() in kernel, which would
> set ops->direct_call, the actual callers are in bpf/trampoline.c, which
> have been gated with HAVE_SINGLE_FTRACE_DIRECT_OPS. That said, for
> normal usage of HAVE_SINGLE_FTRACE_DIRECT_OPS=y, op->direct_call is unused.
> 
> If someone uses register_ftrace_direct() or
> modify_ftrace_direct/_nolock() outside BPF in the future,
> op->direct_call will be used.

so any 2nd user on the same function triggers the slow path,
and that's fine, the single_ops handles slow path correctly

but IIUC the out-of-range target will now always go through slow path,
which in current code it doesn't, right?

jirka

