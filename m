Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcAjDILi5L3J0PF/8Icl0J08H/mJVW2fLcJqSFmlArs=; b=4nPtY7F/VhSu9FPa2FwcVWEou7
	jWXZqIuKDIHbFfqSLcNXKIzsXZWAOI1BPz6gGXT38bbHD8PHsACTWaBMVbKPn7oSzct6LxhGs36aZ
	zjaP91Qw2AVnDX7pg2ElJ8jbDjIlY0jMztIBZ2j7CvWnz3ga+yWW3+od2VtpHYEwFmS6Pp2lpYJjc
	KYTDQhz5hXaR0uY9apkwg9sKuObXEG+DqpbzhUZ9HGzzNIIHJressuANmFu+DeOvZ9LFL1OixFlSJ
	cPcL3jsLWVY36U0cf5OSYSYhYLt1Ur5/qIpVXvB31Xvc8tx/3hc0gpC38ZVYh4sZ6NQjYz4zmju1X
	PUUqYUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluc7-0000000Bp8t-037w;
	Tue, 12 Aug 2025 19:24:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls4H-0000000BSBi-44xi;
	Tue, 12 Aug 2025 16:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB32844B9A;
	Tue, 12 Aug 2025 16:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B88C4CEF1;
	Tue, 12 Aug 2025 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016905;
	bh=QGGDJtpzAvDGfqv7vg9yuxITaE/1e8imJeia0T1EH14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/kTdtEhphOT6xszjdKktCKpnJpfZa5VEwMlu+vUa4rn37Qe7G6XfB5had/tshpCT
	 dKCJtPpwMY5mlN89kaeWEyCs2IesyHvzUj7WMcStNXTkp9KwDGuHpOjRzeUdmUkOQi
	 jeuQd/v6m8VGR9de5HDYzGXpn24NdCDY07RoaMj3IScRqWuVEyqKERtzoao+6pRdSN
	 9DhZycyPdSIwSY3WLvHPYdG/RZ/6YuPsBoB/wRIv9MRS5lrdh1bZVutkQlBME8rj3w
	 nOUm7fqbxZqxqssQ4c6Wr/W2f8t+Jhu5KLpiKcZe2TPSBD4psDFdK4MoJoNFM5Ax/M
	 kRjCYuRti3Bog==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250728102947.38984-2-ziyao@disroot.org>
References: <20250728102947.38984-2-ziyao@disroot.org>
Subject: Re: (subset) [PATCH v5 0/6] Support RK3528 variant of Rockchip
 naneng-combphy
Message-Id: <175501689991.633310.3061565953624951232.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:11:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_094146_033937_9E463BE2 
X-CRM114-Status: UNSURE (   7.28  )
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


On Mon, 28 Jul 2025 10:29:42 +0000, Yao Zi wrote:
> Rockchip RK3528 ships a naneng-combphy that operates in either PCIe or
> USB 3.0 mode. It has a similar control logic to previous generations of
> naneng-combphy but an apparently different register layout.
> 
> This series prepares phy-rockchip-naneng-combphy.c for variants with a
> different register layout and add RK3528 support.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
      commit: d7122636eca216ea2876baae45483d17e40a55f6
[2/6] dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
      commit: 19bb2bfdfa5dc4a912e7e5e3432290204e998ac9
[3/6] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
      commit: d9e0fd60d8d44b2cabd41f5e370e9d41edffe6e9
[4/6] phy: rockchip: naneng-combphy: Add SoC prefix to register definitions
      commit: 11f1896e60f61ca1948cb7920585a79ce5254c0c
[5/6] phy: rockchip: naneng-combphy: Add RK3528 support
      commit: aee07ee1b97d9a3825e8db609a1c76157218cc59

Best regards,
-- 
~Vinod



