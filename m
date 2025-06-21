Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F6EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZitZ8bWumcyW1MR/MaKS/o+JAIlQ+zy7xef+odnx7uM=; b=cBgjgCx2/h/ig0pEfWOzoU9eUQ
	Z2Oj4WyJtVr7teErNytoqnPTr8g2w63bJqfqFx1ajx+QnUEPXy/gKQurKaswIzmD6xzPzFavc/IRl
	DT0RvJSTvPurHUsA6Yxjj+j8WDwJvjArdE4f3CI+tiFGO/0thGKiH3NbCtK5a84XWfoqGNTHW5nvt
	z7YEKuEOPwkraVDEVGnfjzDBTJgDS/CEdtOfcfGbIjHkm9mnm3bCbg1tzefPMEOLlqiGpcylV+udq
	Yau6T+hFSi9SVTBpeyHHZYs9BBK0Hm/agD0JjAYb7mMNG+VjOPvdD3jHmeWlE/nb3hb1mxu3j7M9O
	1E+otIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsr3-0000000HD2J-0N2h;
	Sat, 21 Jun 2025 07:41:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsoo-0000000HCuI-203c;
	Sat, 21 Jun 2025 07:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZitZ8bWumcyW1MR/MaKS/o+JAIlQ+zy7xef+odnx7uM=; b=C4NDFT8ANCUVmX3P5VsdZa6rIK
	/P3uu4Zg9awdZuPmOmGaCBUFrChk/ie0XymVM4KlvFRBxN3MHvPl36nrvChRlXiaeQro08YdVsIpi
	friKF9S3HzhCpJzy+007YBHJMZzP9K68EKsSCER1eQWAXmZDyunU5C0IUelZVjvWv3Ctf6UnjhNZF
	YB6b6VtqSfe6W/tkaiVwIbiBQpwD6dz7rsT1Ix4gAl92HEolqEZ9kXwG1Dtal6XTJJYSCNqtKCnnF
	JglR3KkfRhdGmVzl2iOGB4OGcNVidSBtzSc628JPCpGWvyJb3R65zV3wJvuILAsQQvhZOx7yaDaU0
	vzEvGF6Q==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSsof-0004Xc-TU; Sat, 21 Jun 2025 09:39:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rick wertenbroek <rick.wertenbroek@gmail.com>, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] PCI: rockchip: Improve driver quality
Date: Sat, 21 Jun 2025 09:39:08 +0200
Message-ID: <4760493.mogB4TqSGs@phil>
In-Reply-To: <cover.1750470187.git.geraldogabriel@gmail.com>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_003918_538435_DBBBEBA0 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Geraldo,

Am Samstag, 21. Juni 2025, 03:47:51 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Geraldo Nascimento:
> During a 30-day debugging-run fighting quirky PCIe devices on RK3399
> some quality improvements began to take form and this is my attempt
> at upstreaming it. It will ensure maximum chance of retraining to Gen2
> 5.0GT/s, on all four lanes and fix async strobe TEST_WRITE disablement.

just a driver by comment, you might want to drop the RFC element from
the patch subjects.

It does look like things take form nicely and how people read those
RFC marks varies wildly. Some may even read it as "this is unfinished"
or something and spent review time on other things.

So if you're mostly happy with your changes, just drop the RFC part :-)


> ---
> V5 -> V6: reflow to 75 cols, use 5.0GTs instead of Gen2 nomenclature,
> clarify strobe write adjustment and remove PHY_CFG_RD_MASK
> V4 -> V5: fix build failure, reflow commit messages and also convert
> registers for EP operation, all suggested by Ilpo
> V3 -> V4: fix setting-up of TLS in Link Control and Status Register 2,
> also adjust commit titles
> V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
> suggestion
> V1 -> V2: use standard PCIe defines as suggested by Bjorn
>=20
> Geraldo Nascimento (4):
>   PCI: rockchip: Use standard PCIe defines
>   PCI: rockchip: Set Target Link Speed before retraining
>   phy: rockchip-pcie: Enable all four lanes if required
>   phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal
>=20
>  drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
>  drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
>  drivers/pci/controller/pcie-rockchip.h      | 12 +-----
>  drivers/phy/rockchip/phy-rockchip-pcie.c    | 15 +++----
>  4 files changed, 36 insertions(+), 43 deletions(-)
>=20
>=20





