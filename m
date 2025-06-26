Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLhzwapi0AkxnvdyFSAFsl6i18Eotm3BGz3JPLqH/dE=; b=Xl9hj7QkFm7jXqqdkU/wIz85x9
	+qodbUqD3abnCQCqS3UdrWGGZ8Vx8agFm8UtHY2oLdCEYK+drvI5FFmjsiK9n9Lf4jRVTtQkf2JYm
	VY4msezIv8wLWX2H6DJ6yLS6uVBVgjqO0SH2OLcNUjk9UefByXWLJeCYn5Rjqusl8Ne4PwavcYJg5
	GAm4Jz6x4jq4u3RamO8UuSmYaEhtFsXprB1MMEs6MXMhRkuUVdL70B9noHONF5DS3auOVMhvrc9hR
	rcYnsOQfcWNOMoRhXWuK/ZGKSbpizVm2CAj2G6zlofj4b91biSwpRwUf1mXd2xE8h5DzeE2nj8Ytq
	k8KGepDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwga-0000000DB29-28Bg;
	Fri, 27 Jun 2025 00:11:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvO5-0000000CyrI-3Fdk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3228F6112E;
	Thu, 26 Jun 2025 22:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C18CC4CEF3;
	Thu, 26 Jun 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978088;
	bh=R8CLx3lBBBA7LvBgT58Sc9bRYzTVrORcyxFh0G7ROJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zk/V/Q9r0eFXhj7iEBCs7Oehj+R3cZd2JUeipOAReEk8S3l744NsU+t+jn2Bapkyo
	 Rh+e4lSTKlouajX/NAqfhZOYEBZ4+AFtXeXLmtVyqain1uXjng7723WJ+HWcRxL2wO
	 SzFKq2k8XNQ8VA8d6ZHYjyVeycTPMmnlxzmH1RR1zkws4WYUH2irgcG+iOCKqJEM0B
	 lF/ZxKdmd2yC2df1oN44OIQBFzXSXWFz73G0d5MkHB7XG1ai7kHeYR5xlJiPX/QeEX
	 QLj20bEkI4AW6Xw8VGgrWUvE/7FYh8PDgGbx8+Zuqu3gJs5aZ2NdlLLgJ5r2PzXo1z
	 QHhC/+PglSnvg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Julian Calaby <julian.calaby@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20250625085450.154280-2-csokas.bence@prolan.hu>
References: <20250625085450.154280-2-csokas.bence@prolan.hu>
Subject: Re: [PATCH v11] dma-engine: sun4i: Simplify error handling in
 probe()
Message-Id: <175097808852.79884.3766453152059490417.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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


On Wed, 25 Jun 2025 10:54:50 +0200, Bence Csókás wrote:
> Clean up error handling by using devm functions and dev_err_probe(). This
> should make it easier to add new code, as we can eliminate the "goto
> ladder" in sun4i_dma_probe().
> 
> 

Applied, thanks!

[1/1] dma-engine: sun4i: Simplify error handling in probe()
      commit: 814f047fc96d6631bb2c76557aad8e4aee8f532b

Best regards,
-- 
~Vinod



