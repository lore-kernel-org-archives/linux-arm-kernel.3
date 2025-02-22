Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F4C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzYj2SBwZYdiAHJqAPsKe/dFQvpKAGWUcio6ju4eMVk=; b=ukwJIa0jIiblD3NfPQJJJqM0OD
	T2oZQQhjfRE+w24BDtNKUAJNQrFG7CYffmKeAlfNFGSyaaf5zGWYcWIoBpd3ELNEDUHbljdhufEC2
	uH0vQm8rVLGIFTL5/t5CJakMagwKgu3xd2URtiHgNoJwjx6yga3D2CKGM/eLQj03L8E9zPAzknqTv
	Ld1roI4pdDdqPL/I5nb+HrmGM/kDm0RW027XP4A/Kmzn5dJlmmDXEwyosynsSUKGStuZ9CkDB/X7q
	1lV+z5Ffr5uMpbtCoB5pZ6RldWujly1qaSJmLesc1w8afrov5l1qYx3trN0fC9MbsPUOkKhHH/1if
	VnDVKMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlzKR-00000009KVo-3Y40;
	Sat, 22 Feb 2025 23:54:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlzEk-00000009ItI-2B4m;
	Sat, 22 Feb 2025 23:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tzYj2SBwZYdiAHJqAPsKe/dFQvpKAGWUcio6ju4eMVk=; b=s5Hgk1ZaHT8uyo1V0KFNKBG13Q
	zjV6RXP84BOVzBXJEm+GgJgVWSEmzBLzu9mogqDdbrgilm0MVthYje9q9/mJnYBATkiHYTiX3w8wQ
	fuAE7X0bFIvpqsz5uZfs7TSHF6fulhi5E94SMS26d6w3HSfO8M4vKtVTE6kAEBRY/CMblw8OyJ1u1
	ACKVx9wTemKktI+imsrHU0umpqVfWHZl3c6jo72DeDdsln+qZgZPO0B0ya3QOihMhNFK18sLfcVR+
	Fg6Q62ms02VS5GXU4Gquz2fj8JzZGD5axR3ZFMvWIPEwL9JZH6m152GRYj+ygcchPIPID8xgbJgs8
	LT1kRlQg==;
Received: from i53875a10.versanet.de ([83.135.90.16] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlzEN-0004TL-OW; Sun, 23 Feb 2025 00:48:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Tim Lunn <tim@feathertop.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Alexey Charkov <alchark@gmail.com>,
	Stephen Chen <stephen@radxa.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v5 0/2] Add Radxa Rock 4D support
Date: Sun, 23 Feb 2025 00:48:16 +0100
Message-ID: <174026756680.3008209.2974583864870803696.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250218160714.140709-1-detlev.casanova@collabora.com>
References: <20250218160714.140709-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_154846_553955_995F85F7 
X-CRM114-Status: GOOD (  13.96  )
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


On Tue, 18 Feb 2025 11:04:17 -0500, Detlev Casanova wrote:
> Add the basic support for the board. (Not officially released yet)
> It is based on the Rockchip rk3576 SoC, so I haven't added the
> following devices yet:
>  - VOP/HDMI
>  - UFS
> as the support for those has not been merged yet, but are close to be
> and I already validated that they work.
> It will come with another patch set.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
[2/2] arm64: dts: rockchip: Add Radxa ROCK 4D device tree

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

