Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FCDC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spTDi2Mxdc6/QSr85Ih/YXGCO5MVDGJgInOIk6e13es=; b=07K5ybGxPcjJfJQavlq/OGCB/h
	IDu72JPmHzZKchbGo1JliORaK5xDEhLVF3EZAiF/raqCcAMyKxehPjuiCRntswGwYCZI+arNF295b
	yjWdoGeLno6J2HpCMMMSN5lJmyZpf2UvGCFLWQAf/DcBaKIObICTYd/CXwPYvG2nEswrR3c0mTcMO
	cQy+DjqgYiudJ64On0dVqlnibYdqaIWUm76txTLpbxgJC820iLJK5rcIVCQDK9JvgIpib4ezpyg+I
	IS0JqprtKyz/90tFoEOLdW8wQ6F87aUMYKSAL0vSyKXf4pIcTx5rlBMl5r9vzlzWmOnHj4pb00HMq
	/Qx8B3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3cS-0000000GJky-2QZm;
	Fri, 14 Feb 2025 21:53:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3Zh-0000000GJJ6-19dF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 21:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63B88A44BB3;
	Fri, 14 Feb 2025 21:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408DCC4CED1;
	Fri, 14 Feb 2025 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739569816;
	bh=Kckz2TLbEWVxhN4tyZx07MCeYrJg4RMfeph7RfTIB/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cdOhJbgSdmNsof0RZWm2bNMcOgyMnbZt+W0tplE2Z42FRnhYN2MMjC/HZid4gAJnv
	 cXzgJPNOG1t4PpQILLyjXxjR2iCMHRuT8dtOszNUaK1l7M+y1R5CXFcEWykXJVOqoq
	 0oEZho2DelTmmNg7d7bolAS6148mq2/iyWr1V/ZAMtTvRYwBTFjA5j7AtiohUvk9SB
	 JZhIv/eEYDTmSx7F9ZN8t38fGLyp2TjWZH+9fUVfjtyhwhBd9NrePCBudywVlg3KIy
	 AWtEGEuJ2oo5x6guLSRmHSYSf331YWc5PdMca/CEcK/KScLXsHz1uuOA/biVVuPInb
	 DirROEdI0JIfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB383380CEE8;
	Fri, 14 Feb 2025 21:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: refactor clock management in EQoS
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173956984555.2115208.11664802737268824641.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 21:50:45 +0000
References: <20250213041559.106111-1-swathi.ks@samsung.com>
In-Reply-To: <20250213041559.106111-1-swathi.ks@samsung.com>
To: Swathi K S <swathi.ks@samsung.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 fancer.lancer@gmail.com, krzk@kernel.org, Joao.Pinto@synopsys.com,
 treding@nvidia.com, ajayg@nvidia.com, Jisheng.Zhang@synaptics.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_135017_374894_2CB05EFF 
X-CRM114-Status: UNSURE (   8.73  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 13 Feb 2025 09:45:59 +0530 you wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: refactor clock management in EQoS driver
    https://git.kernel.org/netdev/net-next/c/a045e40645df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



