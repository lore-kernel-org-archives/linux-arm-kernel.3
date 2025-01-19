Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904F2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 01:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6uw5O4gBCZgnWk48cjzJThbcnk0l3aFOvOKp669TIg=; b=gANomx3n12DgC/aztODd2rdy6F
	r2hP9VuGuR5U+IDPgLx2z0FqRNgtvPTQAk6lIbhV45Iy26pcHnzJnFGVDhbcHB4mXWtATzVhTznJO
	cek34jPYZNbG4bjs1ndWbG35lcUBTySyBzWHGYdIiLojO4uqtn7kVxuqwJHJdoc+m1mBsRnV15EVe
	A2dhC5Zg7eGSctT4YWmC/PCfW3ijXTQUCKAbnOvWgBFe3FsuRVoMcGVgdbDF9fi8dLYhYLyZ6gjnW
	vcnMH8J8bCSHaoe9ZovZAApaXNMcs7eawgHyw3bGyCgxxP/HACDn357UXW99vWgrSmfPTidSe+cg/
	jvEnKkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZKTQ-00000003DU6-2AvY;
	Sun, 19 Jan 2025 01:51:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZKS6-00000003D3b-1PMs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 01:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9ED795C0B05;
	Sun, 19 Jan 2025 01:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0B8C4CED1;
	Sun, 19 Jan 2025 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737251413;
	bh=EsCgqF0PW2Pf0IXz2LO3tp2VrjrQFmgzM4n3mbjjuZA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JyhL6CT7wrR4YIU1OOrpZMKJP5jwqXKXBTd8E4Re5GYYKFJK7JporA36PZoUVbYIG
	 aUN54YVCoRDgUlODgXzqY6hopzs7tYq3aH+aG7UabxLViBUC6UfBWq8x2an1Ew0h37
	 N5I0vmRUgMYgkLk4y5I+24gLBF5hGf8gn1wJ+jcKvDVb/4MskYn5HWLNwe2XN+3NeX
	 5ukPD7SxlkcQph/t5GNShDWs44NdOPCIwBBSgadIN8IwVs9KhA6AOytho7FP6rer51
	 SmMWV0WIVPi3GhX0xnD0bMsMbZRrFi1k85WuJ2nYBFvOMdZNizQcoiL9P4CSq5Eesa
	 GWRbU/GRhyUhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2E380AA62;
	Sun, 19 Jan 2025 01:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/6] net: xilinx: axienet: Enable adaptive IRQ
 coalescing with DIM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173725143649.2533015.4073289679568150020.git-patchwork-notify@kernel.org>
Date: Sun, 19 Jan 2025 01:50:36 +0000
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
In-Reply-To: <20250116232954.2696930-1-sean.anderson@linux.dev>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
 michal.simek@amd.com, linux-kernel@vger.kernel.org, shannon.nelson@amd.com,
 linux-arm-kernel@lists.infradead.org, hengqi@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_175014_467522_CAC1F924 
X-CRM114-Status: UNSURE (   9.96  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Jan 2025 18:29:48 -0500 you wrote:
> To improve performance without sacrificing latency under low load,
> enable DIM. While I appreciate not having to write the library myself, I
> do think there are many unusual aspects to DIM, as detailed in the last
> patch.
> 
> Changes in v4:
> - Fix incorrect function name in doc comment for axienet_coalesce_params
> - Rebase onto net-next/master
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/6] net: xilinx: axienet: Add some symbolic constants for IRQ delay timer
    https://git.kernel.org/netdev/net-next/c/5cff9d1756fb
  - [net-next,v4,2/6] net: xilinx: axienet: Report an error for bad coalesce settings
    https://git.kernel.org/netdev/net-next/c/9d301a53a532
  - [net-next,v4,3/6] net: xilinx: axienet: Combine CR calculation
    (no matching commit)
  - [net-next,v4,4/6] net: xilinx: axienet: Support adjusting coalesce settings while running
    (no matching commit)
  - [net-next,v4,5/6] net: xilinx: axienet: Get coalesce parameters from driver state
    (no matching commit)
  - [net-next,v4,6/6] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



