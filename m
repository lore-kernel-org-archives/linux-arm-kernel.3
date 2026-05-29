Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A06CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmCG5c7ZdraaUuv5adtXfMR+L/IgQPNcJErvSgyx1bo=; b=0GUVGzh7jtg0UHfaP0g2S16jUl
	kJGFSpOOfw9TbPXZbK9tDpZwSV68QAV7XrqO6tnR/LA2VWVHdtP5CHFXBt+2uC8+KQYqItE64bYDY
	oMDoU1ZcVYtYeDrwW6gWD4J6QwhnnyvrF/1NBXnC5iBQbXuitzU3k1FxCdtw5wM2g1ycAuwvPT5I0
	kpDxJ4f2P0qggMY7QyopFMQVuz37JPj1gTxmtn8IVeAuZaBtgLyr12dgF/UkxzztcS8F1B+GGxcTE
	FKlAM0f3Xl/1w1wmryactzDAUaWHs4bxU/5tAMVgnXpJqJZOEfjlyS9JwJAn6Xg27oxRnqNtN3D/e
	C6RpJMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1J4-000000082Q8-3aMb;
	Fri, 29 May 2026 17:47:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1J2-000000082P0-2NGt;
	Fri, 29 May 2026 17:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JmCG5c7ZdraaUuv5adtXfMR+L/IgQPNcJErvSgyx1bo=; b=qowQRPp+vmiLNlYsmQPNOAQ1Ec
	lVyVhrZDC21fF+NNodAjsFn5ZcLORaY/3O9HnWneNKzwlKVyzCaMqEFCD6YpXPQZaIlu/jkFjH4LU
	shW79nPyr9Vuw/7MBwOe7jTui9E+JApfeBCOZOzB/0c4IgXOM27YFzvxDtMlZzCjqKdwTDNuNkl69
	2eFDFVrKn1c0x7H1Zs+aT/uWRNeYVF0EFSVs9xxFHNH4kIJjw4llpUhFwnfvg9jGOo31b85YL9i3f
	8NX0teUlNxgLr0V+HO7co/tkX2+E9EsRUkLST/cvFeqX7TOsiiYr64h27lHtYCMwcOwp3EOh1cVgO
	yEyYoYPQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Simon Xue <xxm@rock-chips.com>, kernel@pengutronix.de,
 Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH v2] iommu/rockchip: disable fetch dte time limit
Date: Fri, 29 May 2026 19:47:27 +0200
Message-ID: <5524351.eFTFzoEnKi@phil>
In-Reply-To: <20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de>
References: <20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_104736_664956_CBF90E14 
X-CRM114-Status: GOOD (  16.33  )
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

Am Dienstag, 28. April 2026, 18:05:31 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Sven P=C3=BCschel:
> From: Simon Xue <xxm@rock-chips.com>
>=20
> Disable the Bit 31 of the AUTO_GATING iommu register, as it causes
> hangups with the RGA3 (Raster Graphics Acceleration 3) peripheral.
> The RGA3 register description of the TRM already states that the bit
> must be set to 1. The vendor kernel sets the bit unconditionally to
> 1 to fix VOP (Video Output Processor) screen black issues. This patch
> squashes the 2 vendor kernel commits with the following commit messages:
>=20
> Master fetch data and cpu update page table may work in parallel, may
> have the following procedure:
>=20
> 	master                  cpu
> 	fetch dte               update page tabl
> 	        |                       |
> 	(make dte invalid)  <-  zap iotlb entry
> 	        |                       |
> 	fetch dte again
> 	(make dte invalid)  <-  zap iotlb entry
> 	        |                       |
> 	fetch dte again
> 	(make dte invalid)  <-  zap iotlb entry
> 	        |                       |
> 	fetch dte again
> 	(make iommu block)  <-  zap iotlb entry
>=20
> New iommu version has the above bug, if fetch dte consecutively four
> times, then it will be blocked. Fortunately, we can set bit 31 of
> register MMU_AUTO_GATING to 1 to make it work as old version which does
> not have this issue.
>=20
> This issue only appears on RV1126 so far, so make a workaround dedicated
> to "rockchip,rv1126" machine type.
>=20
> iommu/rockchip: fix vop blocked and screen black on RK356X and RK3588
>=20
> RK3568 and RK3588 has the same issue as RV1126/RV1109 that caused by
> dte fetch time limit, So we can set BIT(31) of register 0x24 default
> to 1 as a workaround.
>=20
> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Acked-by: Heiko Stuebner <heiko@sntech.de>

@Joerg: could we get this merged?

Thanks
Heiko



