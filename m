Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE8BCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Nhm8a9L6L8z1QzmhIhiwdE2dxkqZgaqZmmH7pyf0Rc=; b=dvu6AtA+bVJm1JIoQz4BIlkKDZ
	vH0Efp2jjaqhhHBrIWRqSx9EV8poLlW+NWTqWoPchqr9YAkIiomUKEgvmeweq3bUkpr2OMUiwV2qO
	rl0xAk2m6IgmnmFWMIZ8DT91USA23+OJjXd/KKQ1WVkwbbwJgaFk5JbQGq8wqjY2mF9gCr4YH2bxe
	1hfmocUr+oYZgw7GgmIg/LU+ArnX/nwpDTK6PYIcX1Fxjk2B0vqDRuI9FH9JfhvV56+eYSWci0Xxe
	6J1gNJfO+/Imk7FuERifRdxC89xIIxTFQMgbLt2yYi6CWp3Db0BZKsZFlj2DY/xf522pCRd0NOh4l
	OYnRa6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHxu-00000003M1o-0ph3;
	Thu, 30 Oct 2025 02:00:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHxs-00000003M1S-1oTF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CD7E404C7;
	Thu, 30 Oct 2025 02:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF0EC4CEFD;
	Thu, 30 Oct 2025 02:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761789634;
	bh=adIWWp6JkooxcKkGWYYawGCvhKj6QLF1nHLdmWN8kTU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DvgD0crXsz2KIHnfdi2gFAs+PUXtkzVqXmU0p99CXOjMOalyelax+Vt3tajwrE6X+
	 pLi7P2vQso326M5CXCD369G0Y/kUzkwJeIq/3WmqLYV9OmVRlfqC4bcxH94Ors1RCe
	 g5sACvH+KPESlK0/hcbU2jOKBJB6SW5X7Z1GWiRzfyncxOddGTimHShWe1HhHhPc3J
	 TLvq89M2lJ4wXUSGW8/4Tmx44Yx0w6Fdkj+2F78x2POLBShSO3YUdkEsIf0GgpBgpq
	 +2q8fzLAL8eM7lcXln+LKoQTc4cIV7C6cgv+3fydUpIDsDAdB/nS0DuRnPu1AYHL04
	 EjEUP9E3qnzhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C123A55ED9;
	Thu, 30 Oct 2025 02:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/3] net: stmmac: Fixes for stmmac Tx VLAN insert
 and EST
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178961100.3282477.1158388762703076399.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 02:00:11 +0000
References: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
In-Reply-To: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Rohan <rohan.g.thomas@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jose.Abreu@synopsys.com,
 rohan.g.thomas@intel.com, boon.khai.ng@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthew.gerlach@altera.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_190036_494918_971F8D6E 
X-CRM114-Status: GOOD (  10.10  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Oct 2025 11:18:42 +0800 you wrote:
> This patchset includes following fixes for stmmac Tx VLAN insert and
> EST implementations:
>    1. Disable STAG insertion offloading, as DWMAC IPs doesn't support
>       offload of STAG for double VLAN packets and CTAG for single VLAN
>       packets when using the same register configuration. The current
>       configuration in the driver is undocumented and is adding an
>       additional 802.1Q tag with VLAN ID 0 for double VLAN packets.
>    2. Consider Tx VLAN offload tag length for maxSDU estimation.
>    3. Fix GCL bounds check
> 
> [...]

Here is the summary with links:
  - [net,v4,1/3] net: stmmac: vlan: Disable 802.1AD tag insertion offload
    https://git.kernel.org/netdev/net/c/c657f86106c8
  - [net,v4,2/3] net: stmmac: Consider Tx VLAN offload tag length for maxSDU
    https://git.kernel.org/netdev/net/c/ded9813d17d3
  - [net,v4,3/3] net: stmmac: est: Fix GCL bounds checks
    https://git.kernel.org/netdev/net/c/48b2e323c018

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



