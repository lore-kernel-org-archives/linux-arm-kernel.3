Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2651C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5r0+yUXSX3XQUcP9QrMrgeywepUhT6vyR5hnyxxQlU=; b=kqAbPJEoz5BfiPKuWUBg7Oe0XA
	nTNA/euSXtlefdnJk4R5F7ION93yksatFUDinYUT5Yt1BfwyTrRnn5x1vN+ZCZBFNB04znQAuCMPA
	wMl7NowLvaKYp2+14zQFwLAVZm3JPm62EsNrLY5KsqW4xeh8YEIJn4wZJet34SsenZKiFUO1inReT
	xI7B+y14sfLIatXnTcW9h2sq1zcnzg/jL32gFsMwk1OOGNDnKz6P901Md0zv/ee4AeHN00ap+qEM1
	QW2/s633DkFtatoNQUl3WSiTcznM4byhQOFKItagGQAOBesr68bqX/WLZM2fcevtSJRAeM2Y6+dlm
	s5fVUfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaHl-000000044Jj-1Diz;
	Thu, 27 Aug 2026 13:36:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaHi-000000044IX-17zD;
	Thu, 27 Aug 2026 13:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=A5r0+yUXSX3XQUcP9QrMrgeywepUhT6vyR5hnyxxQlU=; b=p0Ew9lVdxDMpqqMCJQPiMrrSIN
	oczAEJ9P4l57EslTO8aBrNgTsmyf3KIRpzzzqFAyIcw2u6VTGv3x+sBRVotqHg+IQZRnXc+D1L9bK
	FxpYMMrunx627E71POwRG5r8BxHZmMNbFPRNG/yqtxcaRD6x1Fm6sqmv/PGnNB8w0bWpcUdl4t8qi
	Kw/PTXYKZc7lLDpV9IGV9E54g6GXOB+Op8ho9NgvV4g7b2MsPZm34dGdusYELoqPjQASwuDOlkBrn
	vMK8mB1/bAo9u9yxPy/A9iDc3ygx0FQk+40tvoJK1u2vSs9N8PX7YM2nwxAwv5cH1yCg8sWkEMB2M
	uGh4IFRg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, jason98166@gmail.com
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
Subject: Re: [PATCH] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY core level
Date: Thu, 27 Aug 2026 15:36:42 +0200
Message-ID: <10904774.nUPlyArG6x@phil>
In-Reply-To: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
References: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_063650_307176_9F8CDAC1 
X-CRM114-Status: UNSURE (   8.19  )
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

Am Freitag, 21. August 2026, 13:44:19 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Jason Yang via B4 Relay:
> From: Jason Yang <jason98166@gmail.com>
>=20
> phy_create() only enables runtime PM on the new PHY device if the parent
> already has it enabled, and this driver enables it afterwards. The PHY
> device therefore never gets runtime PM, and phy_pm_runtime_get_sync()
> returns -ENOTSUPP for every phy_init() and phy_power_on(). The block is
> still resumed today, but only through the supplier link fw_devlink builds
> from the phys phandle, which fw_devlink=3Doff and =3Dpermissive do not.
>=20
> Move devm_pm_runtime_enable() before devm_phy_create(), as done for the
> sibling HDPTX PHY in commit 10ba8479f460 ("phy:
> phy-rockchip-samsung-hdptx: Enable runtime PM at PHY core level").
>=20
> Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



