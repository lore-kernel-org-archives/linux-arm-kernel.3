Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C882FCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaZ8+4l4VR/tRyonXSdloiHxXxyELF9qqkkFs5IHBbQ=; b=En3bZn3QU+JebvdZQZp/BC8Rxf
	LMR1XiXyejTJxcdRD52RTkGypIgncAWGe1BRYlxoOMgH4XCl5/Ba1D3cwNlWCAEcEPLAQKjUXYC1E
	SBjM7a+/WY7H9T1cvhhZl89M3GDSgUnGGXST2l6/wkt9r2vI3mZq/3YN0KLj70w0ZsM9WKYWHIlQW
	4az2qPd9e/62ylgc4diBX5/V18mBcmWB1GqSz4Xl4mDtOkjCzpQ5KOEACw02S7SmnzTfLjxPsi4dC
	UA6DuXh2UG/GAalXEc2I0bborKIH7Ihi5k2OJDqJOTsXTP2p3QAxnqJaBz1eeATRBMg/ZV4Sc6afO
	0C3Y8w6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yQt-00000001EDj-3HLl;
	Wed, 15 Oct 2025 10:08:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yQq-00000001ECA-2QTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:08:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPu-00057E-ND; Wed, 15 Oct 2025 12:07:34 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPq-003hjz-2m;
	Wed, 15 Oct 2025 12:07:30 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPq-000000007Ib-3De3;
	Wed, 15 Oct 2025 12:07:30 +0200
Message-ID: <8817fed4133752909c3660db2e412d73ce52c620.camel@pengutronix.de>
Subject: Re: [PATCH 4/5] phy: mediatek: ufs: Add support for resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche	 <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Stanley Chu	
 <stanley.chu@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Peter
 Wang	 <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Date: Wed, 15 Oct 2025 12:07:30 +0200
In-Reply-To: <20251014-mt8196-ufs-v1-4-195dceb83bc8@collabora.com>
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
	 <20251014-mt8196-ufs-v1-4-195dceb83bc8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_030832_616548_4A869BC4 
X-CRM114-Status: GOOD (  13.06  )
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

On Di, 2025-10-14 at 17:10 +0200, Nicolas Frattaroli wrote:
> The MediaTek UFS PHY supports PHY resets. Until now, they've been
> implemented in the UFS host driver. Since they were never documented in
> the UFS HCI node's DT bindings, and no mainline DT uses it, it's fine if
> it's moved to the correct location, which is the PHY driver.
>=20
> Implement the MPHY reset logic in this driver and expose it through the
> phy subsystem's reset op. The reset itself is optional, as judging by
> other mainline devices that use this hardware, it's not required for the
> device to function.
>=20
> If no reset is present, the reset op returns -EOPNOTSUPP, which means
> that the ufshci driver can detect it's present and not double sleep in
> its own reset function, where it will call the phy reset.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

