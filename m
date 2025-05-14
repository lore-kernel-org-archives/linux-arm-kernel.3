Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A6DC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=; b=HBlX1D2kcj50KUK8Od4fpMcByd
	l3INja3M6Ey3IAzRb0Ki48BZB6xB1OovwH8DDmhoeG8pzeoYYSpVzEZa0xPCVswI/xaxwyfkZdyxN
	xfNURCcQfu+xsZYceR2wyZW0JuS6Iq1qeGoNAHSClNGtiwNGCc8zRe0p1IQvLEiQ0tSSjmONpiz7P
	+kMHCG1pGss1XIQsbf512loYIlgWFKGzvsrNwNwkXO6z5RW1D3AZALBovr9fr/WchmMsuyrFzp5DR
	HEm0K08GYKJ7B5+cPl90a1J6vFxQr+0PktcJuWVjzmT9tIRwn3YAJ2VaRRfN15JXh2jr8RKhj25a9
	T85J1d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5eC-0000000EAeX-0Dhw;
	Wed, 14 May 2025 06:31:20 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5c9-0000000EAHF-439N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:29:15 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad2490d7838so7304166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747204152; x=1747808952; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=;
        b=a9GSbqCzxofdOydLZ82ZmwauSjRXBi3ruS4mYdu77K+0QiV/s5gzR+WtKGD0Cm/8rR
         LVNR1D66xiJMDbCoPasRLUVzPLulOw1n3JlH5J/K09HDc3hzm8xTgWpU8uJCWHcLL55e
         afSTAKc5uAnsAJBUE+M074RdqPHhGDvYeVLH/qQtzz7jD+oxws7P3aZL3plVL0uxGYd3
         4I61g5tMcicq4vdEi/cwTlorhM0QI7RIk7fyBhvMGA7uamMzhUwYeDqZ42nxWFkJM7VJ
         Y8WFUaX9A8c5FMi1w1brAWmqIqw2D7RmVyKDRJTQR4sn7iBDAoja8c7EhEMBsh+on5PY
         CkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204152; x=1747808952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=;
        b=IgLLUhslEtjvyL0MgifoZWmyIhPCZnMnPywwn9Uy86dB+ZT4MNiLpijRjmtQ8lSqj1
         BT2M1Y+CQtbA2hC8Tyg3zg+WDhTCi2rbM/wJh7lv4qMRF462+XF0yzjsSN/pAmjsfBv4
         cqcgtRx8Ccxfw3Qp5YsKGip8hH+pIX5mFcuFrxh3RXGBLJT9e3jZNT/U/F+sQzf+uted
         b9MYw2wKeFvB+Qs5D/DKZ5n5SFxikJVK3w2Mnntaj+ss7HNWavRejyw3VHgwtBofJCbX
         jqL3LO6NT+skAEXN2pXnKZ7jFRyXR55inEVi5my61Gg71ohJ4+zx4q3fSsp0iE623cYH
         XkJg==
X-Forwarded-Encrypted: i=1; AJvYcCW1tGDVQCoTmNyViTGC48ESyGzOLdzZnnwnqxjoEDMogY7QkegVSO7maUL+KhCgl6+a6ZW1u7QRJOaE3ZRxzpVe@lists.infradead.org
X-Gm-Message-State: AOJu0YzlfqIQp3fPpWjXdQL74RS6ZswZLFuBPqgz/S3RK9/NjS8/Ut4K
	yQhka/TVL0IY3v2K0GdBgsJnnuP91orXG2qfaEjaIsNtZhV9QIQpwdACMPUMBTgCtL0Qlq9NbQD
	teOeKxSDS+3BHSGJqK31dHJFDv6w=
X-Gm-Gg: ASbGnctnCDDuaz8pmAc4NhypDT0zZe3w+lrdb/IGkmNGM+vtVmzC/B2BbHoBk2FOYDJ
	tn+RBXymYjpmSKYhE4F4R+pjG10ba5phfE5WDovkmRO2fg/jaqRd7t42fBVjZvVKD/Ac+aqxvPU
	CmMt3zPRtK3yCFK/0MTwyIGgQpp5x3yC0=
X-Google-Smtp-Source: AGHT+IHLi9l3uVX4nW5VLQgBm2lV8tVCO9VuPjaDsf+SxaW0IV+yhko+vLUnG1ihrIh/6U5EoZfOVotR/SX2Qpqfql0=
X-Received: by 2002:a17:907:a0ca:b0:ad2:33a5:f468 with SMTP id
 a640c23a62f3a-ad4f74a5448mr235593066b.54.1747204152004; Tue, 13 May 2025
 23:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-11-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-11-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 02:28:35 -0400
X-Gm-Features: AX0GCFs-O_hhLomt9V3PLJCcKSURYY7CSGwd6Ua6n88FsUsqIjk4ubR7DgQIDuI
Message-ID: <CAP01T75oU0zfZCiymEcH3r-GQ5A6GOc6GmYzJEnMa3=53XuUQQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected var-offset
 stack access
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_232914_000448_A6890E89 
X-CRM114-Status: GOOD (  18.26  )
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

On Thu, 1 May 2025 at 04:17, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Insert a nospec before the access to prevent it from ever using an index
> that is subject to speculative scalar-confusion.
>
> The access itself can either happen directly in the BPF program (reads
> only, check_stack_read_var_off()) or in a helper (read/write,
> check_helper_mem_access()).
>
> This relies on the fact that the speculative scalar confusion that leads
> to the variable-stack access going OOBs must stem from a prior
> speculative store or branch bypass. Adding a nospec before the
> variable-stack access will force all previously bypassed stores/branches
> to complete and cause the stack access to only ever go to the stack slot
> that is accessed architecturally.
>
> Alternatively, the variable-offset stack access might be a write that
> can itself be subject to speculative store bypass (this can happen in
> theory even if this code adds a nospec /before/ the variable-offset
> write). Only indirect writes by helpers might be affected here (e.g.,
> those taking ARG_PTR_TO_MAP_VALUE). (Because check_stack_write_var_off()
> does not use check_stack_range_initialized(), in-program variable-offset
> writes are not affected.) If the in-helper write can be subject to
> Spectre v4 and the helper writes/overwrites pointers on the BPF stack,
> they are already a problem for fixed-offset stack accesses and should be
> subject to Spectre v4 sanitization.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Please also address sanitize_check_bounds, it's probably prevented by
retrieve_ptr_limit rejecting other types but it'd be better to add a
default statement for clarity.

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

