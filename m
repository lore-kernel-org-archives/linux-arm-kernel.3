Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F60FD8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EonJmlhbwUDzmQeXYiJ0axPPLrsN1kPZnsvsqphIcpM=; b=z0hXMKTe1aRgcBewtBNr7MxCHe
	Cee8dXbRLdgVdt3KGkkN2xh0O7B0mIXE8ymp5V2v2Uazc4h+orbUB6MB0Vz0uUzYTcjdhYFmeW+Yr
	cby83G2WOkWQofpUeHBvYL8Bzgl2CIho5qA5MDMr1ipORJAH8BFnBBf/TnQjxwzQ0j3bVUT8hjmRM
	z2JV7SeFWfnov6jloOjTqXrMSmyGG2BzYYcaqPo8vxjplaJmf9PhMzHVo0bP9TiS73RXIP0psqgC2
	ooGNjAbZLs3DIk1yliTY3Ds+kQQ6cmAcPbKPgmasgBEkTIbTHWbriKt7cK4KQDr0f5tN2w2TupP4X
	TB5pgieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvh3y-000000073hY-3bbG;
	Thu, 26 Feb 2026 19:30:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvh3w-000000073gs-1YF8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 19:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9614A40718;
	Thu, 26 Feb 2026 19:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B268C116C6;
	Thu, 26 Feb 2026 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772134215;
	bh=0G8qPDzKVsdPsC890ZJhECY9NPwV1vP0d0SMSHyL+0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jTX7g73A4+N56R2BHzV0jM7WboiGHSUWY8s5TGOA3BsWlDmDc2EgIiEU3oogwsy7O
	 KhnMF5JNdDkAbszu4lDnXkza7kEPxt/9+Jkrq07LcJCPrp73EqQj/rxKAWtPv2+BhK
	 6IpSNU/HbUGyBR85Vxy6YWvg+03Zd4AGerH9kUtjZaZA5kd+PNm94/R7zlaRIwY6OY
	 YnnwDJaFiHEXN21PPE5UrUsIV4lAd74kAB5Yyd3bUucpSAIewEjVjAYQZWf+q4U+w/
	 M+du33p55g1RHoIMrnSasWUkVPlCOQWwXiTiFWqWp+T5j1R/Nta61LVzC0eITczhCq
	 2qEdJn3SbHReg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D333931090;
	Thu, 26 Feb 2026 19:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] arm64: bpf: Force 8-byte alignment for JIT buffer to
 prevent atomic tearing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177213421954.1808439.8748044844634571383.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 19:30:19 +0000
References: <20260226075525.233321-1-tabba@google.com>
In-Reply-To: <20260226075525.233321-1-tabba@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 puranjay@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 xukuohai@huaweicloud.com, jakub@cloudflare.com, jpb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_113016_426523_8B7BB2B0 
X-CRM114-Status: UNSURE (   9.86  )
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

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu, 26 Feb 2026 07:55:25 +0000 you wrote:
> struct bpf_plt contains a u64 target field. Currently, the BPF JIT
> allocator requests an alignment of 4 bytes (sizeof(u32)) for the JIT
> buffer.
> 
> Because the base address of the JIT buffer can be 4-byte aligned (e.g.,
> ending in 0x4 or 0xc), the relative padding logic in build_plt() fails
> to ensure that target lands on an 8-byte boundary.
> 
> [...]

Here is the summary with links:
  - [v3] arm64: bpf: Force 8-byte alignment for JIT buffer to prevent atomic tearing
    https://git.kernel.org/bpf/bpf/c/ef06fd16d487

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



