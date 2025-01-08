Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C05FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoqnFYUo08zl9sWUFbQWTKaMIDKJok6y4m0E+eEGjW0=; b=xFslzuEUQBLyAxQ4yGRTeITNOn
	ngwpuY9HL7rYtPDD3tmvqiNqjgIexVnbboJb/iB6NUDxraC7Cm6jyE5TxzLSShbx2mMxijnqnBc9T
	q9KYqzTps7c3E3lGTcFGw1HTbXdVe8yE5VsTa8QjBFjKMAmfYL7JqpiEhWxeU6H+RrtTszqIWhF9C
	hTK7Orvt4dhOkF9kDYg8b1bF4Rqp7xDw/3H42HSmWE+2bCDvMhUiBk4Oo+jQe+uFqBTJmcq08zr3Q
	onWuk1+6iweraz7lekSiCLzFiOlH4ikc+1ZKaKgkU20VHjmO87m5RyJDTrXO6OQDTyLRrHHoDdMVB
	LXV56W5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTtn-000000088eQ-0RDJ;
	Wed, 08 Jan 2025 11:06:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTlG-0000000861v-09Ab;
	Wed, 08 Jan 2025 10:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NoqnFYUo08zl9sWUFbQWTKaMIDKJok6y4m0E+eEGjW0=; b=eIMaio5zc/+B4GTx3PuSdSuLPd
	nDICgbOAAgkMxx8haKwyg7JDocSjvGKLzvzW68TJkq0h/kO4ekwS9IJfder0V2RMwCa0R49+VTPIF
	lcLoTebP3YurjlCjif8qQzAw+oojrEE1gJzkpBznJhzlcAWZQOjXZrCPVNSI2dYTE6pEZJY+3Z+7l
	eig/GIGgCrEV8wUak0Ego/S479d+gz/6Qz56BBp1JdxCHnbotZ7fKmdb0sBf9ntF2/0AyVRYT0wnc
	vlFcqZik8YJq1g6Ln6iQXLNRIbf+6zyOgkYsI2FcUdS7VFeah7e7xyD5U01qAKZfIVPBTxypwqGiC
	JhBfd5Yw==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVTkw-0004wu-3A; Wed, 08 Jan 2025 11:57:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Simon Xue <xxm@rock-chips.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	linux-pci@vger.kernel.org,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tim Lunn <tim@feathertop.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] Rockchip: add Rockchip rk3576 EVB1 board
Date: Wed,  8 Jan 2025 11:57:35 +0100
Message-ID: <173633124858.2752317.13499985925633362517.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107074911.550057-1-kever.yang@rock-chips.com>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_025806_074946_94156213 
X-CRM114-Status: GOOD (  13.51  )
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


On Tue, 07 Jan 2025 15:49:04 +0800, Kever Yang wrote:
> This patch set is for rockchip rk3576 evb1.
> Based on the naneng combphy patch from Frank Wang.
> 
> This version including the patch adding usb nodes from Frank Wang.
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> - Update the commit msg with sort rule per required by Krzysztof.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Add rk3576 naneng combphy nodes
      commit: ddbf63b25866a4a58222d763f9f2d29c309e00e8
[4/7] arm64: dts: rockchip: add usb related nodes for rk3576
      commit: 23ec57a32da448cb3415d6abad3457b14c69af25
[5/7] dt-bindings: arm: rockchip: Sort for boards not in correct order
      commit: ffd07673f08a03ff5532212ebbd98fbfd0dac00e
[6/7] dt-bindings: arm: rockchip: Add rk3576 evb1 board
      commit: 88dc3756ece1d19ab0aa85ceb6ffb4e5f9318ae1
[7/7] arm64: dts: rockchip: Add rk3576 evb1 board
      commit: f135a1a07352b848d3d39557413dd1cd3716d930

I've dropped the PCIe patches (and pcie nodes from the board)
to be handled separately and also sorted some things
(regulator nodes, button nodes) and fixed some empty-lines things

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

