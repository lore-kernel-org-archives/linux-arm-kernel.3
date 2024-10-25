Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CFCD149C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKqCrV9EmISKmoW96rsiDycBuY2VbyxNtB/rBi8BNJI=; b=y5g27T04JucDf/3A865DiYRRls
	nePfIYIs1jtoA670Cf/YOYvOwNuoDFvF01oKrXoykzRm6WJK0evv2PfJ23h6huU0+vDw5eo8SP13a
	XFWBbGInDV2MYmnbXW4+BbiZFoY8kR+Vvmj7Ookxl9i7N28b1AqsJxStlaJa3GqpuDw88Rutu7Ql0
	BLzhEPXODoeGMRYDdP19eJrkMPuo6DgUQWmuXJRxKm/4L8J1NQRJ5o4jkXHqVzRDX123vLcboI9Q2
	ApDQ5EHRAFNU+AyYIptcr+OVWKfB+mju9CDYV8uSgM6ZSM8RJxNS7bzwsYiFZPtxqhGyhsno5Um0g
	b/Qqjvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N7o-00000004Qtp-0FxY;
	Fri, 25 Oct 2024 16:25:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3C-00000004PAn-04xb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F46AA43872;
	Fri, 25 Oct 2024 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB6CC4CEC3;
	Fri, 25 Oct 2024 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729873230;
	bh=A8cJWDTKeDzMBB3/niFbneNYQpYnEubMzQuD5Qt6Q6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u4QMp5Yd0KmGqDImk6OBOYiS3Fd9UqAfV2qDJjNdkdEZawUEBocach0mxBV0LFhhC
	 FlMVpSaCGnh7DeYZ3r1UlLIskVHIZxiEDKqVeMy2E0xLCCKYQQFMXxsiRE4rV5YWTX
	 xX7RRRVcjvjKq8XP4dtnyNVgt+6z5HIn23n3KKS7G2PM880kXeutK7q9mhkajTmJWk
	 y3LLgmEpAhYS8r9/k35tP2qcC84Zdz+nBK4mCx2PqzoS/+Dm/OBm7X8Lj7nteNAHTH
	 G5ckK/bsA/f0Djv86GxEnfYkkbAYbJXromIKAkJj+qx8k6U589oOK49jB0Z8Q82/K4
	 zgU9WngACDptw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E643809A8A;
	Fri, 25 Oct 2024 16:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v2] bpf,
 arm64: Remove garbage frame for struct_ops trampoline
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172987323726.2962335.8875079535119173363.git-patchwork-notify@kernel.org>
Date: Fri, 25 Oct 2024 16:20:37 +0000
References: <20241025085220.533949-1-xukuohai@huaweicloud.com>
In-Reply-To: <20241025085220.533949-1-xukuohai@huaweicloud.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ast@kernel.org,
 daniel@iogearbox.net, puranjay@kernel.org, catalin.marinas@arm.com,
 will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_092034_144827_8F0D5549 
X-CRM114-Status: UNSURE (   7.84  )
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 25 Oct 2024 16:52:20 +0800 you wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> The callsite layout for arm64 fentry is:
> 
> mov x9, lr
> nop
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2] bpf, arm64: Remove garbage frame for struct_ops trampoline
    https://git.kernel.org/bpf/bpf-next/c/87cb58aebdf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



