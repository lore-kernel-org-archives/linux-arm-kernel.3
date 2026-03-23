Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D3F532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiEG8fs8U4waGFe76frAqj8GUGT8PfbUsJqfEpDU4H0=; b=HXbS8uCowrE7b3951mQjMyVlMt
	hiTKcVK2Fp6vEGmN+armjbMAztIwaD1BraOqe1MIngRRDjTj2evWHCtC+QNdPR0tE04B6UuX5Qbxn
	yWSW3wFuw0EeNf7SXKRv/vACAEB0xQiXc0mfLnZH3A+s685QANMel2EKN765QqSZod+lgMGrnQcbP
	WRmPCE4iFwKBuv4mv64cMOBt+0cztmdW8VwBuohjwUBoWMT+a6Y5fp8XPbu7TFd/Fn0NrKEIaHi43
	3lPvd7e2YwtdGla4h+nSiZu/zQ/hsN/LEZxmCknN8IC+LvJtUUNYdObbzzz++07qZjA7h1MfSAVHJ
	RN+CEiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rX8-00000000P5T-24m3;
	Tue, 24 Mar 2026 02:30:18 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rX1-00000000Oxu-25HY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 02:30:16 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260324023002epoutp020970c2946d32538723c299fa28a77ba8~fphiMWwJB1601416014epoutp024
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 02:30:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260324023002epoutp020970c2946d32538723c299fa28a77ba8~fphiMWwJB1601416014epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774319402;
	bh=xiEG8fs8U4waGFe76frAqj8GUGT8PfbUsJqfEpDU4H0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RTFBubUceVdG5dBZjg2EJuOun+7AvU7K1xXJVOiY75v5S6AwPDX0GCIymngOFAphd
	 E4RA3K/kK+gtTKLgy3khdnDiPmc2cGWIz79uHvHB6IujWAiNQY1L9e+YM2hT5hM2cb
	 67/UCzZXuKEnGh+5DWuT53H601jKazX4GP44bHGA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260324023002epcas5p3c3a08032a55b26ba4a7023fdeaebf3cd~fphhsTMXr1327213272epcas5p3T;
	Tue, 24 Mar 2026 02:30:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ffvBx72xwz2SSKf; Tue, 24 Mar
	2026 02:30:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260323172713epcas5p4dd04df01adb71b7563e1cac14b927632~fiHlqRiPK1063110631epcas5p4A;
	Mon, 23 Mar 2026 17:27:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260323172656epsmtip1078ac64ab1a734cd90e8019874a7de3a~fiHV3p2Rc1639516395epsmtip1L;
	Mon, 23 Mar 2026 17:26:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Vladimir Oltean'" <vladimir.oltean@nxp.com>,
	<linux-phy@lists.infradead.org>
Cc: "'Vinod Koul'" <vkoul@kernel.org>, "'Neil Armstrong'"
	<neil.armstrong@linaro.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-can@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
	<spacemit@lists.linux.dev>, <UNGLinuxDriver@microchip.com>, "'Bart Van
 Assche'" <bvanassche@acm.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	"'James E.J. Bottomley'" <James.Bottomley@HansenPartnership.com>, "'Martin
 K. Petersen'" <martin.petersen@oracle.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Chanho Park'" <chanho61.park@samsung.com>
In-Reply-To: <20260319223241.1351137-10-vladimir.oltean@nxp.com>
Subject: RE: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
 struct phy guts
Date: Mon, 23 Mar 2026 22:56:51 +0530
Message-ID: <1891546521.01774319401971.JavaMail.epsvc@epcpadp1new>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJoz1sM+EbPjkyDopxrfJVWkMJWdwIGLiEOAj0DJam0ghnJMA==
Content-Language: en-us
X-CMS-MailID: 20260323172713epcas5p4dd04df01adb71b7563e1cac14b927632
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260319223312epcas5p183a1e0c31206025da8cf00b5d745a0ce
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
	<CGME20260319223312epcas5p183a1e0c31206025da8cf00b5d745a0ce@epcas5p1.samsung.com>
	<20260319223241.1351137-10-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_193013_000296_E1C4B373 
X-CRM114-Status: GOOD (  19.22  )
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

HI Vladimir,

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Friday, March 20, 2026 4:02 AM
> To: linux-phy@lists.infradead.org
> Cc: Vinod Koul <vkoul@kernel.org>; Neil Armstrong
> <neil.armstrong@linaro.org>; dri-devel@lists.freedesktop.org;
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
> <James.Bottomley@HansenPartnership.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; Krzysztof Kozlowski <krzk@kernel.org>;
> Chanho Park <chanho61.park@samsung.com>
> Subject: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
struct
> phy guts
> 
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.
> 
> The UFS core (specifically ufshcd_link_startup()) may call the variant
> operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times if
> the link startup fails and needs to be retried.
> 
> However ufs-exynos shouldn't be doing what it's doing, i.e. looking at the
> generic_phy->power_count, because in the general sense of the API, a
> single Generic PHY may have multiple consumers. If ufs-exynos looks at
> generic_phy->power_count, there's no guarantee that this ufs-exynos
> instance is the one who previously bumped that power count. So it may be
> powering down the PHY on behalf of another consumer.
> 
> The correct way in which this should be handled is ufs-exynos should
> *remember* whether it has initialized and powered up the PHY before, and
> power it down during link retries. Not rely on the power_count (which,
btw,
> on the writer side is modified under &phy->mutex, but on the reader side
is
> accessed unlocked). This is a discouraged pattern even if here it doesn't
> cause functional problems.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> ---
Thanks for the patch
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>

Tested this patch for basic UFS functionality, UFS still works. 
Feel free to add
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>




