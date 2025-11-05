Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C03CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgDjghyPbc2sUc9ELyDg8fnXhbMYAqfPbZdKCdvyvts=; b=NMeNkPUpfv2dczDIFyQWmo+ED8
	M70kx/B3zLmMR7h71KBGMQAwKHwKtm9E9dtRzM7LqEhKvS0M7CseXSrA0E9ZzG3UGNWHHJd/xnjTD
	1fBP0pv4B1DenRUT9FJBRbjUwu5h1osS5DgdyG/TBbfTz3rYWehIjrq748WFG6csDB5gD16PZg/ir
	1gsnZcSrhjlxyso0f3sp9fv+WwoKh0yKFiOiJtAyTMbCJCru33zzi+F5k5ZZ6T9mFTFAYMyihTyXm
	36IQKvtQ0XRRLjf+l3FPQXfj7t90xqr112AhJpNSZ+18ue8O6Q4JmvmpfAlwSKq/dI4o+J3q0Aqje
	MDhBa8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUNy-0000000CxtX-0nMy;
	Wed, 05 Nov 2025 03:40:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUNv-0000000CxsG-2dau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 03:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7288404A2;
	Wed,  5 Nov 2025 03:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0929C116B1;
	Wed,  5 Nov 2025 03:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762314034;
	bh=5B5kQnMCAaWVw6WGeGQS9dS3UoKKKIwVg3qwHZW/Rzo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rcmOsQnxU6GqycZ44lCyEMzcsIfGIOEAfGQ+IWy1um/EKQEOqLKNil7+dksg/Wij2
	 fDZB0Aax/h+S/4smnkltZUXemjg58Mu43RNGYb0bqTkyBhvdf6XWY532EIJ2JD9lXz
	 8FJlqmzjEZL4ZvQsHDl/+xUiPaCtfjaSQubQr2CCQwztLjQ94/GNaOwxbWovnJOjvF
	 2rK+FOnfolQnBEicV7vp1gylfKFilzHvfI3uOr6N4FraXVcxTlTAOWx6Nra7z2ANxO
	 WjCGIZiu51xzpVD38XA+8u1rvoO5OkPUwZCqJ/ZNKd/AHIvbFI9hMGEqxeaVg3zspx
	 x0o1JNWPKnwuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B0656380AA57;
	Wed,  5 Nov 2025 03:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V4] net: ethernet: ti: netcp: Standardize
 knav_dma_open_channel to return NULL on error
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176231400849.3077655.12135200578922215083.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 03:40:08 +0000
References: <20251103162811.3730055-1-nm@ti.com>
In-Reply-To: <20251103162811.3730055-1-nm@ti.com>
To: Nishanth Menon <nm@ti.com>
Cc: kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 jacob.e.keller@intel.com, horms@kernel.org, u.kleine-koenig@baylibre.com,
 edumazet@google.com, andrew+netdev@lunn.ch, ssantosh@kernel.org,
 s-vadapalli@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_194035_683928_FBF2537D 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, 3 Nov 2025 10:28:11 -0600 you wrote:
> Make knav_dma_open_channel consistently return NULL on error instead
> of ERR_PTR. Currently the header include/linux/soc/ti/knav_dma.h
> returns NULL when the driver is disabled, but the driver
> implementation does not even return NULL or ERR_PTR on failure,
> causing inconsistency in the users. This results in a crash in
> netcp_free_navigator_resources as followed (trimmed):
> 
> [...]

Here is the summary with links:
  - [V4] net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
    https://git.kernel.org/netdev/net/c/90a88306eb87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



