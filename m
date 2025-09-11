Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD81CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=RLpdNx7Q7daLl1m5w+1HBX92mGtsG9KdY01cT624FQQ=; b=kW+D22HRto9I4RkyzJsb/opnsz
	FHqYP01SB8gobHKm5+E22519wM/a8cxPSUPGExLQcveCqrAaG20ewJm9+LHOEUbt+bmu332jdZcXg
	q7sT8B+H9LC1s6UJPSvjRsWJxgX56ouee8/bDopXcYQ5T3DJZSUcorjkw4f7QXdEKFGxI1VS2f7oj
	rVZ2KIXoGv0oz2cUkNgol8pocRvkjIXL/dXhGBw04MQLm78LFoSV797bcfnhZKQ/z4v16xZ4Veer2
	evTGrsygDNSvtCSfNaISwRiZvBj85QGcOiGaxtb5G1/i7ColpMozX71f1Y2/ST1FFmdMnx9lW2Bw2
	+89335YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6x-00000003Ucz-3ug7;
	Thu, 11 Sep 2025 14:17:19 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6p-00000003UbD-2o8J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:17:18 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250911141704epoutp04c842b69f592ee587d21e1b2317370834~kQBeXzrWh2085620856epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 14:17:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250911141704epoutp04c842b69f592ee587d21e1b2317370834~kQBeXzrWh2085620856epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757600224;
	bh=RLpdNx7Q7daLl1m5w+1HBX92mGtsG9KdY01cT624FQQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=patOuB017iAODXDePtilJ66dkb0gEC6N1VU/RJczUip/26hnOiE/qxD33Lp5kZbmY
	 HnvpnuPfqwhQWE3wLQ6cGeNSuwY+SvXliiR96oEnnTExZwoHk7SsF+lM/M85luGu2p
	 sM6X41V8dqUBe4RkQOFJTk3ahTWUXeksV8rj0kqU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250911141703epcas5p45f1cdb7fe1cc1b01d11f889708713a03~kQBdmAcvf2847928479epcas5p4v;
	Thu, 11 Sep 2025 14:17:03 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cN04G6Kmdz6B9m4; Thu, 11 Sep
	2025 14:17:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250911141702epcas5p23d6a0708919eca66f9b29104efafbc1f~kQBcMU3Uf2246622466epcas5p2c;
	Thu, 11 Sep 2025 14:17:02 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250911141658epsmtip1c22551d755a82731ba8ba8a915095e45~kQBYqjAjg3172231722epsmtip1b;
	Thu, 11 Sep 2025 14:16:58 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, alim.akhtar@samsung.com, arnd@kernel.org,
	krzk@kernel.org
Cc: andriy.shevchenko@linux.intel.com, geert+renesas@glider.be,
	thierry.bultel.yh@bp.renesas.com, dianders@chromium.org,
	robert.marko@sartura.hr, schnelle@linux.ibm.com, kkartik@nvidia.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	ksk4725@coasia.com, kenkim@coasia.com, smn1196@coasia.com,
	pjsin865@coasia.com, shradha.t@samsung.com, Ravi Patel
	<ravi.patel@samsung.com>
Subject: [PATCH 0/3] Use exynos8895 driver data for ARTPEC-8 platform
Date: Thu, 11 Sep 2025 19:46:02 +0530
Message-ID: <20250911141605.13034-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250911141702epcas5p23d6a0708919eca66f9b29104efafbc1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141702epcas5p23d6a0708919eca66f9b29104efafbc1f
References: <CGME20250911141702epcas5p23d6a0708919eca66f9b29104efafbc1f@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_071713_204615_F32578DD 
X-CRM114-Status: GOOD (  13.46  )
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

Existing samsung uart driver has separately added ARTPEC-8 specific
driver data, which is added long back (> 2yrs).

This driver data can be removed and other similar driver data
like exynos8895 can be used with some changes in the dt-binding and
device tree.
This patch series does the same.

NOTE: This series is useful for the upcoming ARTPEC-9 base patches
where uart is exactly same as the ARTPEC-8.

Ravi Patel (3):
  dt-bindings: serial: samsung: Update axis,artpec8-uart to use
    samsung,uart-fifosize
  arm64: dts: axis: Add samsung,exynos8895-uart compatible for serial
    node
  tty: serial: samsung: Remove unused artpec-8 specific code

 .../bindings/serial/samsung_uart.yaml         |  2 +-
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  |  3 +-
 drivers/tty/serial/Kconfig                    |  2 +-
 drivers/tty/serial/samsung_tty.c              | 38 -------------------
 4 files changed, 4 insertions(+), 41 deletions(-)

--
2.17.1


