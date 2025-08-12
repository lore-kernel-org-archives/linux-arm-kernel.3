Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A7CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8bt75lwFxGgdEjfsHV2lh4hnviOWwj2hs1d6UFM+Pw=; b=LhTDOrfZqkG/n30ADrwvm31Ua5
	ubtN4bJ2oK0HPijXW1CFLEB18tSl6F8bwHTz66COaJovZFh8LKmesB2y8nkpMjtM2UpsSIQ/y1Ijl
	iizzNNu65B+/PkLoQpv90XdCEU0FuF7Q/E7KUqQWB2uZ/FuUhGWFIqIDeXHlKhjzJTwtRJ8Ukhr2H
	F1uLMdxylaDwLsdJUGPEnt5RoZwLxUitucEZYDbzk3phh05nm2r3EKAMVNoX1NG42J+GOst59NOYH
	lAhRLzPKkx8rru4NLPyWTbUiVOlvoK5/aFo0sdH0kzEWN1s78at3kL/uciLcelJ/7k/BC813kGB93
	fGc33hGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluc9-0000000BpDQ-1aGb;
	Tue, 12 Aug 2025 19:24:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls4T-0000000BSDm-1vyZ;
	Tue, 12 Aug 2025 16:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF415601E4;
	Tue, 12 Aug 2025 16:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C953EC4CEF8;
	Tue, 12 Aug 2025 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016916;
	bh=qylFsF0HkvEqH5od8S1haU8m9Yen1Xq7TJ1PYMkZias=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EsA/mEHmCN10Kazb1TmB4OujmNIqjyo9ou7fbL6gpyghMgeQbNn6UY0w1lJWikO/9
	 IrkN8VHSFQYroUiu8bXSmnPX/YZbx9N7nHEa31yq0dBeHh6pj6GpcL8PY3VryKwMkY
	 45IgdIQA8S/q+W2zwMCj8kBbGE6rjxU0wbElH2gIBQ0W1vNLsVjl6wJ3XEcjK/2Ajj
	 bzLYDo5SUqHIT5ga7OEVia6GC6935zfdLh/uEyux7qeM5VNbO84dw+UHJRUY5HNfBz
	 /jlTgdPLSTscyikEtks38OHjPoYksQXk+9WSmn+v+FOJD/dIRw4/CO+h9zOgKqf77J
	 +EAc6qmda75fA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250723072324.2246498-1-jonas@kwiboo.se>
References: <20250723072324.2246498-1-jonas@kwiboo.se>
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Enable U3 OTG port for
 RK3568
Message-Id: <175501691338.633310.6315313120573301384.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:11:53 +0530
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


On Wed, 23 Jul 2025 07:23:22 +0000, Jonas Karlman wrote:
> The boot firmware may disable the U3 port early during boot and leave it
> up to the controller or PHY driver to re-enable U3 when needed.
> 
> The Rockchip USBDP PHY driver currently does this for RK3576 and RK3588,
> something the Rockchip Naneng Combo PHY driver never does for RK3568.
> This may result in USB 3.0 ports being limited to only using USB 2.0 or
> in special cases not working at all on RK3568.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: Enable U3 OTG port for RK3568
      commit: 4e346666edcc0506d8f0e581de4280b85b0d3e98

Best regards,
-- 
~Vinod



