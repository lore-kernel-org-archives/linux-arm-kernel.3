Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D678ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iz8ds4uZ2EdfTix40+LNtvuVP+Qe5SJurgkLudTtf8=; b=oj3q49LgxZfHckpQA1jRtwqo+a
	XMt+acciiPBbOnTWX31bFyUeWEZoLtu0lAVepnJ+4dvZ+QQNfYN9FIWoQmsKSzVTWl/X42G6wH6mT
	4fGz+Wwsn3uEluVqR++w7yR3mgGAGMsexMTzn9nGMeBFjeq4wkNpvw8LRSQPqHqQ1g3H11foNyIUD
	w86bY+NsHrbn2qYYlbeMZPBWjy9FV9UerHIdq0dlcXnSF8iCD1zViPiqPwhnauAt+sA8Y2cmsqqx1
	BMo/JO2KhZcSK6ivOoywALHJuyrSGjqomDqxbJGpSqdkUafKJKSA2Wc6Sws6j+jJHgQMuefSkUPCw
	ml8D2evA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0U-00000005ndo-1him;
	Thu, 28 May 2026 13:42:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0N-00000005nay-295R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:42:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B50C40E27;
	Thu, 28 May 2026 13:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F1B1F000E9;
	Thu, 28 May 2026 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779975754;
	bh=5iz8ds4uZ2EdfTix40+LNtvuVP+Qe5SJurgkLudTtf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S/eOirRtRg+k9VxeW6cpoCGScVER7L0A1GqHjWMZGjObpzAi7rvaHZZBu9euEosWN
	 elg3rKSSMkJFV7O5icFbkbAV6pYAglZGtL/5TphWk1AN0VdOKt9dBxJs5jXtU5RbAG
	 TyOB7x92Fv4C3N6UKBJxYmCQhCCqBNJwd9YuvN6gGSED3+5/Bz5BpkLuiEZwi+mQAl
	 8xCRUKrQAbvujN/wzDQi0WtjiZxDnxJtGMixV9lW2FJ509ux3aJTvMx/a3p2L01sTj
	 C9rrf7EHngjvrhtbTb0h+GvxlEk5o5SYNMF2HV019QRcpjTFvBGcV5F6LSR3Q12vtY
	 lRbK4SVBt8nqQ==
Date: Thu, 28 May 2026 14:42:28 +0100
From: Will Deacon <will@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next v2 1/3] bpf, arm64: Map BPF_REG_0 to x8 instead
 of x7
Message-ID: <ahhGRE1efWfKsvZW@willie-the-truck>
References: <20260427234801.2104511-1-puranjay@kernel.org>
 <20260427234801.2104511-2-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427234801.2104511-2-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064235_589414_EBA22EE0 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Apr 27, 2026 at 04:47:58PM -0700, Puranjay Mohan wrote:
> Move the BPF return value register from x7 to x8, freeing x7 for use
> as an argument register. AAPCS64 designates x8 as the indirect result
> location register; it is caller-saved and not used for argument
> passing, making it a suitable home for BPF_REG_0.
> 
> This is a prerequisite for stack argument support, which needs x5-x7
> to pass arguments 6-8 to native kfuncs following the AAPCS64 calling
> convention.
> 
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  arch/arm64/net/bpf_jit_comp.c                          |  4 ++--
>  arch/arm64/net/bpf_timed_may_goto.S                    |  8 ++++----
>  .../testing/selftests/bpf/progs/verifier_jit_inline.c  |  2 +-
>  tools/testing/selftests/bpf/progs/verifier_ldsx.c      |  6 +++---
>  .../selftests/bpf/progs/verifier_private_stack.c       | 10 +++++-----
>  5 files changed, 15 insertions(+), 15 deletions(-)

Makes sense to me:

Acked-by: Will Deacon <will@kernel.org>

Will

