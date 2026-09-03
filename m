Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C65C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyr/0fEvLQuH4z7Eht9lxXGhoAt1RWvvUHvN984jtM4=; b=SJ5M+E7ZDl0UrhM2IwrKc2x56c
	89LOYD5jy8sVrHNeXm2hkrpNw+2CNmpfg4yFbIl7iug2npreAYPLkGHVb5/OaYmBoAzmO7hrEYye5
	p93KlU3I2G39lIBuZiyLZG30p/peYgdm7+6EB3stqMYTZlPyjL9yUP2uqjOOd1Bgf54RUo845paL6
	pP9a9pTA6GG8FJegyvj2tFFhlpbz+LN1fXzpF7pKEZBjwl27ujsOFwpoqTRnfdnvGb9Oi92P25U7u
	q6kInQNwQtTpHZsc988/xrEu+xVSIxQPzQ9PIcTDz4J4GbQqa/Y8xZjnQCrLRk7avnJU5C1tRShAL
	rAJp5RCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dW-0000000GXt2-2nmX;
	Thu, 03 Sep 2026 07:13:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dT-0000000GXrW-0ynu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:13:24 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260903071317epoutp04371dcbef9eaa205ac65e509f457dc8db~RviX3vYrQ0839508395epoutp04C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 07:13:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260903071317epoutp04371dcbef9eaa205ac65e509f457dc8db~RviX3vYrQ0839508395epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419597;
	bh=cyr/0fEvLQuH4z7Eht9lxXGhoAt1RWvvUHvN984jtM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcKJcsgzINY/Xw2xCetKgtD1ZTadiw950/xAmbNUlejwBruISNhRQbCzI88CS/b3D
	 ugYvDyBj10zH+eVptjdEJN+cAcAq0wdJYY03JEh27d+PBLZ17zVPeda/RGaiCV+of8
	 hqQZ0KvzzfX8wwvu5pLjauGiMpVRbP4vjmMsSHxo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260903071316epcas5p290dcbdc8d9d3bc41801a42a5b29a24f7~RviXQ5IvJ2559925599epcas5p2s;
	Thu,  3 Sep 2026 07:13:16 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hb9mW42Ryz2SSKj; Thu,  3 Sep
	2026 07:13:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867~RviVtAX-82559925599epcas5p2l;
	Thu,  3 Sep 2026 07:13:14 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071311epsmtip14d2dce7c3a3495747f584f0e76b7802d~RviSp9Kn_2402924029epsmtip1S;
	Thu,  3 Sep 2026 07:13:11 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 1/3] MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG
 entry
Date: Thu,  3 Sep 2026 12:42:48 +0530
Message-Id: <20260903071250.3421499-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001323_434916_73F6A3D6 
X-CRM114-Status: GOOD (  11.31  )
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
index 6008f16ae2ca..c1a466d772a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3561,6 +3561,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/hwinfo/samsung,*
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/
+F:	Documentation/devicetree/bindings/usb/samsung,*
 F:	arch/arm/boot/dts/samsung/
 F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
-- 
2.17.1


