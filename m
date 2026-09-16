Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504DDC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak8Q6+fNBlU8q7MtsTksV589MUX4tYAzsPks4YDw7Cw=; b=S2aVhKKav1jmU2dwsl9UmYHVgE
	ZoEzKbxDSNHKM0G0GdyHJVJZIoRKYDylmqbeyEAo4zxEJ6WoJhWN3l5eAWhzNMYdazoyyGOrPXuXv
	Z7ESkYHNNf5zLG2oDTKwW2x1FC0p41ofjRXmr+mkrSfyj0BvVFOHVl03wGy5VhIBg6On3ZZlyJYdc
	+2c/+eeGQ1mZ2fjufXe3gO+tWLGO6QYD4ZqeUJckwhO5Qgfx+fMOOXPH50YsTUWuoWbGVV8GgVzAc
	gsuc7S06J0Ri0uT0+sioVvTwUSiFL5r2aCWXLk+zpSyAe0lfRXTAWgT8vYhWcU9PD41AOh4jVTL+W
	rtmNCCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogD-00000009A7a-3L9v;
	Wed, 16 Sep 2026 12:24:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogA-00000009A6g-2H4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:24:00 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260916122353epoutp039c82c2edd3a3c6d6cd07f60bc94021b3~VzKRe2o890364703647epoutp03c
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:23:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260916122353epoutp039c82c2edd3a3c6d6cd07f60bc94021b3~VzKRe2o890364703647epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561433;
	bh=ak8Q6+fNBlU8q7MtsTksV589MUX4tYAzsPks4YDw7Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRuigGo21EnzTGn37Qtx8/XKXocFtIRjwbsd6H1CIhwuAHebhQhkewcBzfMKFXOIk
	 ijwuW+33coa2ZIIKTgLBSmHkHlcIaUtSP8FrYFQusiPRxgJAEc10pN/PwlQD1TAIUu
	 aFk0t3gMgy2SFiyx2XMiSYCvVwMUUeclJwwc8POw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260916122352epcas5p41a603ccf6197f984cd6a2b2de9559880~VzKRAL0uK2362423624epcas5p4t;
	Wed, 16 Sep 2026 12:23:52 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hlJ2v5YsMz2SSKX; Wed, 16 Sep
	2026 12:23:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142~VzKPm3pDt1908719087epcas5p3E;
	Wed, 16 Sep 2026 12:23:51 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122347epsmtip285ac663cc543167bf9709afe33e86de0~VzKMCPPGx1922219222epsmtip2q;
	Wed, 16 Sep 2026 12:23:47 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Date: Wed, 16 Sep 2026 17:52:27 +0530
Message-Id: <20260916122229.2604003-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_052358_763518_D83E78B6 
X-CRM114-Status: GOOD (  10.91  )
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

Add the Samsung USB devicetree binding file path under the existing
ARM/Samsung SoC maintainership.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a53620839407..87a1ab24a375 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/hwinfo/samsung,*
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/
+F:	Documentation/devicetree/bindings/usb/samsung,*
 F:	arch/arm/boot/dts/samsung/
 F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
-- 
2.17.1


