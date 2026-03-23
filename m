Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E63F4613B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYU9K1BczlLtBMfJPDu28QIk9pzoA+hXl3yf17nC2HI=; b=RTtA/3MLFe8D5KR7M0IxMqOAfK
	e0LUpzd3U+i8uzlCzp64aJ6ABf46hMHwUyjto9Ujk3wZvn5VzbcdJrde90pur6WiEWrfL/H8qNvMm
	2CodcVVhh8jEJVRnghVpWnn2l6HDLACJfdxq+kKZdsNZvKrosCMj/wbrXg/B5VYbWWNNiEnz4UKRS
	zWawZWGXSjqI6UtL/MOHh+OuxxYZJZwEUbwiK4JMx3DvX6wuoQQkOIrps9bEeMJ0TKmXnCJBXLVWn
	NY+F76wgZrRRai0wEHdxRKysDqe0yAhCPdDMWX1QShRf6Rq0mCnsozHOLEEAuRv3uo03ShtiLPfGZ
	BRivG5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hME-0000000H31B-26iB;
	Mon, 23 Mar 2026 15:38:24 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hM2-0000000H2xg-0v2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:38:14 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260323153802epoutp04a6524d00b31d85793e60ef15cd449a1b~fgoQ3ZA7-1364513645epoutp04u
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:38:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260323153802epoutp04a6524d00b31d85793e60ef15cd449a1b~fgoQ3ZA7-1364513645epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774280282;
	bh=MYU9K1BczlLtBMfJPDu28QIk9pzoA+hXl3yf17nC2HI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mgU9aFrC+5Kx+21CCBQ48vtUtevP0XGV5aHjupTGFTw7s0wbx2FYZ7piHu2gEGNx9
	 7FiJ9iRzTsn7N6OtZVcQFwqx9+/yRy1FbPgDJReQh76dJWCUi3xQdbS9llr9OgF8ia
	 3KFTDuksHm5/ZDwJUU6SICm8wW+RY1yai4quNiMM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260323153802epcas5p1bb1e979594c5257c037cdf6411e7a177~fgoQZrLX82373723737epcas5p1t;
	Mon, 23 Mar 2026 15:38:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ffckf0KMvz3hhT4; Mon, 23 Mar
	2026 15:38:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260323123542epcas5p349d0e7c45d02ccaa06c84dbdf1777126~feJElRtj12139221392epcas5p34;
	Mon, 23 Mar 2026 12:35:42 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260323123538epsmtip2099c850de3b514ee4ac3f5a0092dd02a~feJAkDKG92361023610epsmtip2P;
	Mon, 23 Mar 2026 12:35:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Vladimir Oltean'" <vladimir.oltean@nxp.com>, "'Martin K. Petersen'"
	<martin.petersen@oracle.com>
Cc: <linux-phy@lists.infradead.org>, "'Vinod Koul'" <vkoul@kernel.org>,
	"'Neil	Armstrong'" <neil.armstrong@linaro.org>,
	<dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-can@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
	<UNGLinuxDriver@microchip.com>, "'Bart Van Assche'" <bvanassche@acm.org>,
	"'Peter Griffin'" <peter.griffin@linaro.org>, "'James E.J. Bottomley'"
	<James.Bottomley@HansenPartnership.com>, "'Krzysztof	Kozlowski'"
	<krzk@kernel.org>, "'Chanho Park'" <chanho61.park@samsung.com>
In-Reply-To: <20260323115848.ghdu4sbk75tvggfb@skbuf>
Subject: RE: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
 struct phy guts
Date: Mon, 23 Mar 2026 18:05:36 +0530
Message-ID: <1891546521.01774280282025.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJoz1sM+EbPjkyDopxrfJVWkMJWdwI9AyWpAaSC6pgB9ZOp/gJXIgBltGJxFXA=
Content-Language: en-us
X-CMS-MailID: 20260323123542epcas5p349d0e7c45d02ccaa06c84dbdf1777126
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260323115859epcas5p10177db12a2e8aee9578271ff1411137b
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
	<20260319223241.1351137-10-vladimir.oltean@nxp.com>
	<yq1a4w3l04g.fsf@ca-mkp.ca.oracle.com>
	<CGME20260323115859epcas5p10177db12a2e8aee9578271ff1411137b@epcas5p1.samsung.com>
	<20260323115848.ghdu4sbk75tvggfb@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_083811_974948_6E6FA5D7 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Vladimir

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Monday, March 23, 2026 5:29 PM
> To: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: linux-phy@lists.infradead.org; Vinod Koul <vkoul@kernel.org>; Neil
> Armstrong <neil.armstrong@linaro.org>; dri-devel@lists.freedesktop.org;
> freedreno@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-can@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-ide@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-
> pci@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-rockchip@lists.infradead.org;
linux-samsung-
> soc@vger.kernel.org; linux-scsi@vger.kernel.org;
linux-sunxi@lists.linux.dev;
> linux-tegra@vger.kernel.org; linux-usb@vger.kernel.org;
> netdev@vger.kernel.org; spacemit@lists.linux.dev;
> UNGLinuxDriver@microchip.com; Bart Van Assche <bvanassche@acm.org>;
> Alim Akhtar <alim.akhtar@samsung.com>; Peter Griffin
> <peter.griffin@linaro.org>; James E.J. Bottomley
> <James.Bottomley@HansenPartnership.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Chanho Park <chanho61.park@samsung.com>
> Subject: Re: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
> struct phy guts
> 
> On Thu, Mar 19, 2026 at 10:15:17PM -0400, Martin K. Petersen wrote:
> > Vladimir,
> >
> > > The Exynos host controller driver is clearly a PHY consumer (gets
> > > the
> > > ufs->phy using devm_phy_get()), but pokes into the guts of struct
> > > ufs->phy
> > > to get the generic_phy->power_count.
> >
> > Ah, newer version. Would still like an ack from Samsung.
> >
> > And I hit the wrong key, I did not actually apply this...
> 
> I will have to resend v6 because of an armv7 build error I've caused for
ufs-
> qcom.c (which doesn't #include <linux/interrupt.h>, and relies on a
transitive
> inclusion from <linux/phy/phy.h>). It would be nice to get the ack from
> Samsung, but I'll send the next version in the upcoming hours regardless.
Will review and possibly test on one of the board later tonight




