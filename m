Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AA2CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Z0srYiA54A8lgqs3OX3sZSJNkoKj+lK/TSgd2dh5Xs=; b=IyVasyNpnFsKhQ
	+0w1QaCoTCL7FuPDxfs+1aTCKISLj70gsPbelSN6sxoNnQsZAlX6mz4sXV8uk49Ws5yID0MB0YRRm
	1zogoQFz35G0NnHIt+MPavsOklGygz6nekY5Aq2ur9J5kCAwQrg6nKgz1Bxm49ZsFxE+N/OPuKWUy
	ZoYOEdvB3W5Ck0pGsOv9bzb7UfqtQ5DIoT7AL2dbXWqWvfk6Go0PRhWDAylmG5lj2sBu2VGrXwHZM
	WaY0jZ1CsswMKBxjK5a36+dc6pDWxl4uI0cvgsVM3/lpG1aX4uDHAQHcOxoDiwz3vWgPPmJjwG+9u
	PqZsTNTY/DPM3dGroDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbKw-0000000BSyH-31dj;
	Fri, 02 Oct 2026 11:21:58 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbKt-0000000BSxt-2YYy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:21:56 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2e2bfc2540cso19928195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790940114; x=1791544914; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Z0srYiA54A8lgqs3OX3sZSJNkoKj+lK/TSgd2dh5Xs=;
        b=bfiCPiYvxiTPvL/dh23vWmZ0riosJSE1VRGGYD/wRQKza5oQhaHPdYBlx+W71MWMiy
         zhjFvariw/XiwjCm3cloGqnwSBf9rHmcMjioWdBcgjDwv0ke0VqxSJZK9WLQu4hR/iOR
         c5kMWriO8ZXfOtRVft5ZcnkYlen+of4UaiwuGhdGRqO0eX9JGhVy8s56XM0YhU0qwkgQ
         lCRoh5uuoWAiidipXqjozTq7ZcJ87E1wyglASVnS6HhYTXCDv+ZUS4tYFgR+rRVbtAFV
         yohImR8jyWN47vIesi0MBE9Gkx8f7vhL4bz/obnljmTOU1alWhIuPLB48Xu/Stq+FKqZ
         NERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940114; x=1791544914;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Z0srYiA54A8lgqs3OX3sZSJNkoKj+lK/TSgd2dh5Xs=;
        b=usn/cyl4aUBN7F6cJsXP1mUviopbD82mtJg3/ynyHI3Q4WFTqofQj2P33tAT0H05hg
         eyWRgb5lAfAF1O8TTEIRttQdi5NT1GE6cUYlNkCrr0mzW2PYNa9T9p2PXY0XzSBPws8j
         NC0O/v3Cx68SI8i4j+9qTnf18pcP0KffdklgWPxGbK0AHt/X8zMx32OLMWtZYsvDGFu/
         msW5gF8XAxiyPiwfsKwCTdPW0V69q/oofRQphjqv6BNstSaRQacg3AqFghA4AgqWVjrR
         viT7CslQSNh7OmuL6zYyTBRESFTA6LF4NPKVI32xeFhoDuLBFK+omBYFEHl26dmT8qRH
         94og==
X-Forwarded-Encrypted: i=1; AKwUvByg6TzwMQEZUdQai82+GXfKtx9xiI6XQEPHV5nLx68Slubt6F822Xs9hD5wTccVimeBxHAAVlgALJSZC7UaSKpQ@lists.infradead.org
X-Gm-Message-State: AFq9FYK12713634dotbCtj4L8TrLOPBuPv6+Y/Y0yVwymzOzyjbJCynG
	VnNJhGBmgC4xN7iee8kL3UTGBqlSjuVGlrjc/clFtINESve2XzCwBPCf
X-Gm-Gg: AYBFou3d+p6c3ttn6xtIPxJ7ffsnHMoEbYbBhQeubdSLHizWZVzvs8Eq7CgPnmsYXaE
	4jvU3IvILlk5fl9PakVbbivjiYw8VfGzwVCvoVeBDr6yE31FalhhVRoNuHwCGbWY3wZYFh6GIaO
	D7MvwZOxl7OwOExM7ty12IEH2tIiPcTGY9KzsX1OC4TTxR+s/kYmKi2LlINJ9ln4R8A2A5M34K5
	xzCsQ9DPaFHIegKGnwUlyurykT1CabZsamPc9ekuBKnEnRCiWh035wLpE6tKJgTi7yB2UT2IEno
	pSkvnBdFwYDrnIEOYarPJf+oVkfNS9mepZIiyeo5gNpIKFDhHPybTnx7CjvhTX4pZull5ourKuC
	ONIGg/1yl7e+eVXGA6Un4/pIJ6DegjKBz1TzTv4vlfr6xhr6WDjkrAp4uAew+TGCYLeCEdFt0cx
	yGB/8AAk7+BU+1lf4tkf+VtNDnyRPjTvoZK2vK5CO2C+Yz5v7NoKCSoW37HC014QoG40BSrMxVS
	0M6fXZtoue80dX6e+UUgBVaK0iLiN2ejtcsJUIxi1/NNgdiFX/ILW7IUtJg834qdo05uhdyfF4V
	jySF
X-Received: by 2002:a17:90b:254c:b0:3a0:cd4d:5133 with SMTP id 98e67ed59e1d1-3a6ce3ba9f9mr1722036a91.2.1790940113693;
        Fri, 02 Oct 2026 04:21:53 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm3957416a91.10.2026.10.02.04.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:21:53 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:21:52 +0000
Message-Id: <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
Cc: "Breno Leitao" <leitao@debian.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in
 bpf_arch_text_poke()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Matthew Wood" <thepacketgeek@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
In-Reply-To: <20261002044050.1277356-1-thepacketgeek@gmail.com>
References: <20261002044050.1277356-1-thepacketgeek@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_042155_654365_EBA6438D 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Oct 01, 2026 at 09:40 PM Matthew Wood <thepacketgeek@gmail.com> wrote:
> +	/* pages of the bpf prog pack are shared between progs, so the
> +	 * set_memory_rw()/set_memory_ro() window below must be serialized
> +	 * against other pokers too.
> +	 */
> +	mutex_lock(&text_mutex);
> +
>  	if (plt_target) {
>  		/* non-zero plt_target indicates we're patching a bpf prog,
>  		 * which is read only.
>  		 */
> -		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
> -			return -EFAULT;
> +		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1)) {
> +			ret = -EFAULT;
> +			goto out;
> +		}
>  		WRITE_ONCE(plt->target, plt_target);
>  		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);

The lock hides the crash, but set_memory_rw() is the actual problem.
The page is shared, so it makes 64K of other progs writable and
executable at the same time.
Use aarch64_insn_write_literal_u64(&plt->target, plt_target) instead.
That's how ftrace_rec_set_ops() and arch_static_call_transform()
update 64-bit literals in the text.
It's atomic and writes via fixmap under patch_lock, just like
aarch64_insn_patch_text_nosync() below.
No need to change page permissions and no need to move text_mutex.

pw-bot: cr

