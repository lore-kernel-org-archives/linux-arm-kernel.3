Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B04BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1dQr7Ppl0TgvxvMKid3GCHc1KrZCHrNt3OXe6GDVsc=; b=leKPHyr0V4V4iT/+cYL8ckGcI+
	V7ABbsBAp00uwAlra39/dBsf/G82EbW2JIiew3KhmzVL9w5UfTOw2qEOBNiwgRF5riy37p1F6hcPX
	9Dcw0x0DY87DNEGxjFGo5ZPp+0VhKCnB8mM88XTiqOW04sU0tsAtLQAAKn4SmBPLtvUZ2LnX7CJjp
	I8UgWl+Bbb+k9dN8rNhN/hwAwN012tiHHMqmcpqqbAz+xhkCLFD687uQ6j4Xbpq6DlqPQKUf7nCAb
	pMP7D3kPn1TqCVvoJKVk+0GIJztmL7QlIcAMZCKmT1kvUNqyNIo4Me5epkKr8Wq48oVpjaQ9jN/VZ
	IGb6qZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG07-0000000E2Cr-1tr0;
	Thu, 04 Sep 2025 19:52:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuB8T-0000000CHRB-0cU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC5B844C6F;
	Thu,  4 Sep 2025 14:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946EDC4CEF1;
	Thu,  4 Sep 2025 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996824;
	bh=TBFRnhMRgAXSe3LCtzGepyvZUvc13K9Ht6o2DOKRDgA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qzr1AFe309zcuwINaVjDTJpPHHWrJ/8Kaqnd+sgG09cF9Z0F4nhpTMfHqmNzrJFii
	 NombqeJZqb9agmtAM13Oczcd1VeQlhIj8SHtBLJO4p0PsDXcTsStOW0eaAwB+sucm+
	 NsPTmKAo8fnR1Apw+MWUPMy2b7WNTiwRZPRkYyAMDWj/ir9hBb8/TUqSD6enHtW0p8
	 hCT0UOyTGqeFl8A8zcb0n+N58DGifceplxRdcPzRRG22XxNEpYwZLGq3HBWxTlJl9s
	 opegY5P0mUk6HlA/UUw3Y3YYsWJxO6Bt8sDzz++pFnbALIN6x2UjPSXXuEXY6wOsWz
	 8PJUGYaOBPOOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFFB383BF69;
	Thu,  4 Sep 2025 14:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: xilinx: axienet: Add error handling for RX
 metadata pointer retrieval
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175699682925.1834386.13423794125453117971.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 14:40:29 +0000
References: <20250903025213.3120181-1-abin.joseph@amd.com>
In-Reply-To: <20250903025213.3120181-1-abin.joseph@amd.com>
To: Abin Joseph <abin.joseph@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, git@amd.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_074025_208077_1F2E09DA 
X-CRM114-Status: UNSURE (   9.83  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 3 Sep 2025 08:22:13 +0530 you wrote:
> Add proper error checking for dmaengine_desc_get_metadata_ptr() which
> can return an error pointer and lead to potential crashes or undefined
> behaviour if the pointer retrieval fails.
> 
> Properly handle the error by unmapping DMA buffer, freeing the skb and
> returning early to prevent further processing with invalid data.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
    https://git.kernel.org/netdev/net/c/8bbceba7dc50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



