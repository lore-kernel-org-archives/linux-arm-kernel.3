Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B44E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI1l4lgGpTtJDBl3eixmiNVuGS9dnUuuN/r5rQWBbUI=; b=XLWLMe9OrHvN/jqJPSJdCdsKtc
	7djZiMOETX6gA5ewnBRWy3W/yvRfQqxKwVP17aJYvulGXntfEoKVR1DFbSsaXt7wqP6d183ZBwYFJ
	8M+9sVomhIZ2JDJKpr8ridSLvP/XQGx/+FLCUeFHQRsuojPaF5RHfLnhRQeOFoV6de/+EMmLFh1pd
	Jdz3/COywvjYcK10JHlMhx3Wv3MuUfEMitWcjqaYB8WY4pyAMRr2AXN0eaZ6t+ZtOKzidLT5kSso0
	4yjzV/rcHP+7YgjjIbCeaPx421E/cQ0+O5AEoozhfs58IJfQPiFMEM3T10KlL+h+2qeF7MZ1coa0Q
	0UyW4DiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnyv-00000001Xrb-1Efd;
	Mon, 06 Jan 2025 14:21:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnxj-00000001XWn-0yDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C8F1A41895;
	Mon,  6 Jan 2025 14:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999CBC4CED2;
	Mon,  6 Jan 2025 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736173209;
	bh=RKd7knf1LcOLKPssmb/Vq2FTYvbMnTcKGAZPremeTsY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rX0i1QG37+O46vITWZvwj7oCSpTvSPXyDRIb+QtnK7tdMNxN0o4sRXcfNyzuuEgHj
	 41loxt4nzIjAh9nPDgfIt3SRWGjJqDRB8Hqulj0HtS1nOOvaB29NLuO+MAjeswSr+z
	 Z9zL8pTK76aJpIYRJbOdWw2lj72jaXRQReXXp32m3hBsZq4nQduBEQhHkuLRk/i3jn
	 3PdaSlmMRAmDcL4ck3VR5pDXfzrromsjGcSgVeXRwgVsTU75eO/2Bn18xV97bohfl2
	 hAZxh3y1nryadMuoRB9ClAYoHluHa2+MH8pqfHAjm8kZ3qbqodS/CYmkfkDsRdA6Fr
	 OsMeDLkPsi7RA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB104380A97D;
	Mon,  6 Jan 2025 14:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v2 1/3] bpf,
 arm64: Simplify if logic in emit_lse_atomic()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173617323051.3507566.4440450851266640533.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jan 2025 14:20:30 +0000
References: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
In-Reply-To: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, xukuohai@huaweicloud.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, joshdon@google.com,
 brho@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062011_335470_F9B609A6 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Fri,  3 Jan 2025 02:02:53 +0000 you wrote:
> Delete that unnecessary outer if clause.  No functional change.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [bpf-next,v2,1/3] bpf, arm64: Simplify if logic in emit_lse_atomic()
    https://git.kernel.org/bpf/bpf-next/c/0a5807219a86
  - [bpf-next,v2,2/3] bpf, arm64: Factor out emit_a64_add_i()
    https://git.kernel.org/bpf/bpf-next/c/66bb58ac06c2
  - [bpf-next,v2,3/3] bpf, arm64: Emit A64_{ADD,SUB}_I when possible in emit_{lse,ll_sc}_atomic()
    https://git.kernel.org/bpf/bpf-next/c/8c21f88407d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



