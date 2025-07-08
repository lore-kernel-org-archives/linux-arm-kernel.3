Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DFC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKNM/MVkW5+UIAF/DDkf6NK4GoimrDLpjI5p5ZBJ8t8=; b=E8FHeN1joEG6iKLeOTrtvTS6LP
	KUbPxnGqSCkQ2pqWTevvylu020k3lgqUB7uZPV79FvP6SVhaTgXtdXbyfxUxMEhmW3iWJ0I1flFw1
	3/wBlQje+Ek3N5yH8dH5Ga5mZOgiSeti3accM4SOnx2HY66nptizI6Tq5Rsmd1zv9bdkeNXTNDtIc
	joVC3c2T7Usckq0TYbp7Wl60lTGI6nKeVpnZ5Vh5b003h0z71uxApmz5qG6AI9wufxEkeE55lg5tn
	T3RgiucW+/eaz8RP6TdFhFXDmw3ijjPJ7x0Hk0VCiHoDY3anxIjSKd6AsiO3W8NjeHi6v48teXRAP
	dJ8ZZXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Hn-00000005ADj-2RCG;
	Tue, 08 Jul 2025 11:14:55 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5lA-000000055bl-4BR2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:41:15 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250708104110epoutp01906773d570ebf6a652d12fec0f3764bd~QQJaEfiqr2791327913epoutp01D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 10:41:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250708104110epoutp01906773d570ebf6a652d12fec0f3764bd~QQJaEfiqr2791327913epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751971270;
	bh=wKNM/MVkW5+UIAF/DDkf6NK4GoimrDLpjI5p5ZBJ8t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQI0UJp/aEZHp3uJivzKfYJIBb1cTXi1bbF656pyNNMPJFAI01ZCufSdUCSzORIGm
	 xqLuOsMxWqtNfW5kUp6D1b4OnPNijKNgbTDNi67vS9OxTX5LFdAyFwzOgkWGkRsv6y
	 I7RAHtnOJaB9jOmYh6jdnkKw01XE+7Zbze3bWtto=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250708104109epcas5p2c53a6a032b6f49f6e749fceb3bf3b87d~QQJZeMmWX3102631026epcas5p2O;
	Tue,  8 Jul 2025 10:41:09 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.181]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bbyM82djqz2SSKs; Tue,  8 Jul
	2025 10:41:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250708103246epcas5p47b446ec342f9d49361c0a9a3929bcdd2~QQCFFnJsk0186101861epcas5p4N;
	Tue,  8 Jul 2025 10:32:46 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103243epsmtip152f34feb66a77e0fa50f13329b23b7ca~QQCCbn-4T1977519775epsmtip1_;
	Tue,  8 Jul 2025 10:32:43 +0000 (GMT)
From: Vivek Yadav <vivek.2311@samsung.com>
To: pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	mark.rutland@arm.com, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, linux-fsd@tesla.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vivek
	Yadav <vivek.2311@samsung.com>
Subject: [PATCH 6/6] MAINTAINERS: Add maintainers for Samsung PPMU driver
Date: Tue,  8 Jul 2025 16:02:08 +0530
Message-ID: <20250708103208.79444-7-vivek.2311@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708103208.79444-1-vivek.2311@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708103246epcas5p47b446ec342f9d49361c0a9a3929bcdd2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250708103246epcas5p47b446ec342f9d49361c0a9a3929bcdd2
References: <20250708103208.79444-1-vivek.2311@samsung.com>
	<CGME20250708103246epcas5p47b446ec342f9d49361c0a9a3929bcdd2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034113_189233_CFCA3E6B 
X-CRM114-Status: GOOD (  14.41  )
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

Add maintainers entry for Samsung PPMU driver

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca11a553d412..5895b4e70c9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21023,6 +21023,13 @@ F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
 F:	include/linux/mfd/samsung/
 
+SAMSUNG PPMU DRIVER
+M:	Vivek Yadav <vivek.2311@samsung.com>
+M:	Ravi Patel <ravi.patel@samsung.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml
+F:	drivers/perf/samsung/
+
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
 M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.49.0


