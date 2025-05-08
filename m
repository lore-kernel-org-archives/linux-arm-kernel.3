Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F60C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7KUB66ex20KKbW6a9zIjBnH56YYjFLFeSIV7Lf5sII=; b=17KhvyE2poruVvqaNY4tmPuxoU
	2o+oZb3XWFnUKjRuUfaAQRivCiAGiheX4vwWjIrbC5U3d2vyJSV8eccV/NTSDiTH938C/6Gzs3gUk
	yjTSfkVFV6CUCKCccu/WPiDrV8I0jzLPNj+o1IstBPJzFbwI2x++ATg7b/7qIDQpXhcrR/j6h/H2l
	eFcofONBWBtj9ItQptGxwI5bGx7a2uSDOyyPrH+t8V9I5uOXa26AoRG8fQfHrXaOC3QELrXWqZzcq
	jaeffa2PFl+q0pPpagaff+3Wy4l2rPg016n0tYt4GYs2ZGB2H2XXzN9X+jR+eyFq6haAoSsWjDtNH
	yPn1bd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6AI-00000001ZPJ-0ldG;
	Thu, 08 May 2025 18:40:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD61S-00000001Y3C-2E9S;
	Thu, 08 May 2025 18:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T7KUB66ex20KKbW6a9zIjBnH56YYjFLFeSIV7Lf5sII=; b=OaPDzJii2050EtK1qhFtB8+nCi
	X8I6PNRJgiMH3Ia5j9jJPVVCXT8ETlBAiKH/V47JhXbMmI61aeY6X19BfeQ4YV+cxZHGNzo5jQ59E
	ynD3GdidrsNiGXoEvD/zs2lOAhMSWrtHb5yeeyK45PGFvMr04hPtt+onaCPXPXSX4QTGzCXBAQpew
	0K2NpV0XDD9VWn1pnXzqG1g3V0IBVLrZDj6b1giKCan5m4dNQodoiH2MplrWjy97fcZEOmeDgzkJl
	bBAn/qXRrdutShJN5xFCw+qB8nBMls1P9zu0f63sluAgoQsAjLww2ZSClqy5RCs5gZednLNC0n4IY
	sOdScCyw==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD61J-0000vi-Qa; Thu, 08 May 2025 20:30:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Thu,  8 May 2025 20:30:44 +0200
Message-ID: <174672902820.1927548.18239697985612657696.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250308093008.568437-2-amadeus@jmu.edu.cn>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn> <20250308093008.568437-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113106_633830_9F95DFA9 
X-CRM114-Status: UNSURE (   9.43  )
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


On Sat, 08 Mar 2025 17:30:08 +0800, Chukun Pan wrote:
> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
      commit: fbea35a661ed100cee2f3bab8015fb0155508106

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

