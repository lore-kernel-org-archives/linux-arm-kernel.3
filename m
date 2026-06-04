Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA9ACD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg44805tHXrZI2MFXh1k7JymAUPm/8cNpCDnOcYJ4LA=; b=G0kyZRcMLYcG4hAGBsIGkg+USp
	EEvyCf+DEN/GHLvgHxI5dTYWiOE1d61d7sVf7IC7YLDC/XOFgqWySC+573vicabyrPX969ngmfNOJ
	sZFoyClsky2fhMQvSwXjpC3kkVDCI2pA/JVsL9W0OItONnqvy+vfHn8hnEK5iKqM3yAcPTqAvMmpa
	SU8I41i7FRV76YNhqWPBCbHZx7KKWjPrdRzB8bd25SZ+FPfwZoUd+MnWwcN/TK1btDQpyaVaa52UL
	VY36n6Tgl9k751I37rnVFsTVdpuicBLS1bKyZWNrOxn8Dy9McjK1jafEUpkvlNxIYh1se/ROAlwAX
	AN68Dh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6n4-0000000Ggwz-3cXm;
	Thu, 04 Jun 2026 12:03:14 +0000
Received: from mxd-3-706.seznam.cz ([2a02:598:96:8a00::1200:706])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6n2-0000000Ggvr-06Ta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:03:13 +0000
Received: from email.seznam.cz
	by smtpc-mxd-85fb448c55-l247v
	(smtpc-mxd-85fb448c55-l247v [2a02:598:96:8a00::1200:706])
	id 451ebd62fd7190ed47e027fe;
	Thu, 04 Jun 2026 14:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780574575; bh=yg44805tHXrZI2MFXh1k7JymAUPm/8cNpCDnOcYJ4LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=lIJ33aU4RSOjH7pERYIWfnMajC6hGTYYVbtw9DXDvoibOvd72ilxSJFKi3GAr1OH/
	 1iYloXtr5Bks67Wuq+auD63ep3apxdaOGN1tlQWl7iS/QoNz2K4ktdqt2vLWAbZjFk
	 7bHoZtGla0z8rHZOIjGOjglkBkppT0yz1GoLubd0PKqw7kuMdUVESMkDu5hEaEnUHM
	 Rkbwms5Mpn9+EZ5PBimuntCTvygE52AnVi72YyZ38+SQqM5VSZ8HSFzJeWXeWTuTcf
	 R8IgBanROqPZB9hpP15ZDEKuw/u0BVfkQSIcbLP74gvk6T2Cg4opJlVmL/QqohkJMx
	 fMLJPkfBijNGQ==
Received: from archlinux (ezechiel.sdb.cz [185.100.196.77])
	by smtpd-relay-b58bfc659-k9lmt (szn-email-smtpd/2.0.73) with ESMTPA
	id a1f98a3b-d877-4d67-a75d-db9b2bd38245;
	Thu, 04 Jun 2026 14:02:52 +0200
From: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>
To: linux-iio@vger.kernel.org
Cc: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Thu,  4 Jun 2026 13:59:22 +0200
Message-ID: <20260604120201.116925-3-vo.kratky@seznam.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604120201.116925-1-vo.kratky@seznam.cz>
References: <20260604120201.116925-1-vo.kratky@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_050312_211672_D10810D1 
X-CRM114-Status: GOOD (  10.22  )
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

Replace numeric PTR_ERR() logging with the %pe format specifier
so that error values are printed in a more readable form.

This change was identified using a Coccinelle semantic patch.

No functional change intended.

Signed-off-by: Vojtěch Krátký <vo.kratky@seznam.cz>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 479115ea50bf..5d7a61abcaea 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -508,7 +508,7 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 					     &sun4i_gpadc_regmap_config);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
-		dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
+		dev_err(&pdev->dev, "failed to init regmap: %pe\n", info->regmap);
 		return ret;
 	}
 
@@ -639,8 +639,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
 			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
+				"could not register thermal sensor: %pe\n",
+				info->tzd);
 			return PTR_ERR(info->tzd);
 		}
 	}
-- 
2.54.0


