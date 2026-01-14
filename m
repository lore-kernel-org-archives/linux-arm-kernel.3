Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74270D37E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMxmz4f/hUC+Y/4jYIO93MsAetGXAehDMVS7211Moy8=; b=CSkU9LVcIXt3E/U0ZVIU3Cq3f2
	YiQiP/ovQf5Y0JU7G3Pg7XZOIaPNLHTbhJmWDWDePn9XiM5bOAGSqVc4PH5B2ciIv7Km9a+i8mKGY
	P2y8kMgYXqC6yZnKQ37lz8Qkg0ryls6zpzNU1NMM/maZ2XdV/ZO2A9KBbuEJ69PUIHn/US9vyLIqN
	NGZDtkTp+nd5cMC4gN/zmJVxF9oHOU52/Nz27BXpriym2qsv41AKrtrOwibiAvFxsb6o6JGOWIAuj
	X4ZtiaW69yppPd6tk4bKy5skw8uXKcuPrbjgwrSSUpioqT5LAWImdNXVxVqJI9I+IwOkiH9dD8l57
	ZFkCv4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1R4-00000009RDk-052p;
	Wed, 14 Jan 2026 14:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1R2-00000009RDG-31j5;
	Wed, 14 Jan 2026 14:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C640960053;
	Wed, 14 Jan 2026 14:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EB4C4CEF7;
	Wed, 14 Jan 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399279;
	bh=NS4GOW/krUAkmuANNp5aNWD+Uu/DsbkydKZkOF5PdlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=psHXlupZoLOYoS0KNWN769c7cdM6cZnylgU3MwlGG+gB5xjJUKWlsfJXUt6whVYC7
	 Y+eCjtsLDEXrfsRM0EybQAVifnNUK1Yy5pxLZ6hTF2twHYM27qY/GfCzbjvwkkczLm
	 3Ce2UDgUjwuLDdMsHuuzof2yQDjZKEROGsNjOzP9vcTwKJQ1s/sHzdg9ZVOoYzFf9m
	 AE5sGACEdh5nMo8qH4yEkHPTfGaDMb3wgw+UafgsnHfZqzQ3RA9MyPCklAik04dTbo
	 KH3nS2taen0nQZUoXwg+XKRkqHlo2Y08JfFTMuWi9Pk0OhoOmS9/Sb8nD7AkDJv4pR
	 ybQBGERh7dGHQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260109154626.2452034-1-vulab@iscas.ac.cn>
References: <20260109154626.2452034-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] phy: rockchip: inno-usb2: Fix a double free bug in
 rockchip_usb2phy_probe()
Message-Id: <176839927689.937835.2359558250567308193.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


On Fri, 09 Jan 2026 15:46:26 +0000, Wentao Liang wrote:
> The for_each_available_child_of_node() calls of_node_put() to
> release child_np in each success loop. After breaking from the
> loop with the child_np has been released, the code will jump to
> the put_child label and will call the of_node_put() again if the
> devm_request_threaded_irq() fails. These cause a double free bug.
> 
> Fix by returning directly to avoid the duplicate of_node_put().
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: inno-usb2: Fix a double free bug in rockchip_usb2phy_probe()
      commit: e07dea3de508cd6950c937cec42de7603190e1ca

Best regards,
-- 
~Vinod



