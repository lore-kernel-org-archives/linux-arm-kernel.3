Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C7C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muKFt9z2UY8iQui6ZPO6/ddpa6A+7CeFX/CjkFugBlw=; b=GpWnQUTPFzgBL3EPy/XIAqmha1
	a9kBzFRA5DLgixh1+DxUuBXCKp7VAvNJHpeY2bg3JTEeVAeAf4lQpWFGMvX4BrEm6UWleEze++7Ho
	8Id0FwxAoqeRvuW7S6fYlH07AKBxPIAhRLIrCoiO8w4jtgqpyPsUJgIDV6HBys3Sjfol6+iM4iTbU
	nW/4KXOVXDIU7zH2iTfPABJpTFcgt0YhDI31V9xWZdqQNJA3IFJQszXXbS9k/QuIzhw7YYd7iqJ4S
	VNMd/T1qtsJRtOMqRvg6ZGfDILbD0W83XrjwIXDIXQ0Xjt3CWJ3STZIt2Z6X4Eop3vO4wZ6iIBIK6
	DJam5Y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjZx-00000003ql8-40p1;
	Mon, 10 Mar 2025 20:18:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjUk-00000003pGE-00sQ;
	Mon, 10 Mar 2025 20:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00404A46205;
	Mon, 10 Mar 2025 20:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78140C4CEE5;
	Mon, 10 Mar 2025 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741637580;
	bh=xEM6pFjBPHLs4DsygLv6xgvUvNhyjDWD4dquKB53SKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PXgsICyE0x+9FM6rPZWMI2kSvKm23bvxf00IUkdgmHflvb5JQuonJ3COzKo3cDsk3
	 e38kgtuQjaJSakJg/LaUDVNB8ReZmowej64+ramCYG5PC8AP7noqXM+5AGbmEOCoer
	 zkGjpeNVMOdHAlkTgfVBtFyFBwN8ftHIppfyw7IWCAp5mhGw5L+wvPDLybzQyCrrGj
	 tN3LaZk8h323+X1M4l+/fM6GtStN4DYzN0vRu9cqobmNaC/ktIXKBOliGvU5wsj3el
	 y6zkmR5tQmuyHsyjlwWXSTNbNYyU/4R87ownu7+7oea73PMcRcDoHK8kaY6M9JhMFC
	 /WwhDxsqc4E4A==
From: Vinod Koul <vkoul@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
References: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
Subject: Re: [PATCH] phy: phy-rockchip-samsung-hdptx: Add support for
 RK3576
Message-Id: <174163757697.467704.14207163796763946102.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 01:42:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_131302_111524_36D2B908 
X-CRM114-Status: UNSURE (   6.82  )
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


On Thu, 06 Mar 2025 20:29:23 +0100, Nicolas Frattaroli wrote:
> Despite the compatible already being listed in the bindings, the PHY
> driver never gained explicit support for it. This is especially a
> problem because the explicitly listed PHY addresses need to be specified
> for each SoC.
> 
> To solve this, add the compatible, and a PHY config, with the address
> gleaned from rk3576.dtsi.
> 
> [...]

Applied, thanks!

[1/1] phy: phy-rockchip-samsung-hdptx: Add support for RK3576
      commit: 4a8463ae8d871ccd491d48a371a6789eb7378243

Best regards,
-- 
~Vinod



