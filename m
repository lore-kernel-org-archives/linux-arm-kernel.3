Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngz82wMOl5404DyPdkqsVuyRGZZ/f6A/F2lmTRxHH5c=; b=GvpoLJp9Yop5Du05qpUNiYEUez
	3AEsxX5fCNjDzieVG2mTjm+ZJDsDCOsoUzc9rRFjuHpYaxbkRKUpQHiFhYKFfm8s362808ARq+2xy
	lreI9TOs7xblvu9Xw4KBO5nQJl/M1iqkLzIXtGZSdywY+fTlJwTx/cU1v8k7T96KRaPAs48e4lD7U
	UjpM5mIlkvRTg2zV7Pp1XC4iJHeJeb9yIWfFHyaGtwJThmr+O8cDSNnx8AtejHfgVn/1cwOOrrsIc
	JIFWjogsgXwthjo6WkjDr6zRaXe+DJ4pRJqFQGZ3fgLIyQDOADDr43+k7vbaeNk2TjhLctoaEjk7f
	wRnj92Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKer6-0000000G27L-0sby;
	Thu, 29 May 2025 15:07:40 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdpt-0000000Fvx2-1DaZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:02:25 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250529140215epoutp02e47e61a5576fa880bd8585afc5e2edd9~EBFj-YydA1954119541epoutp02f
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 14:02:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250529140215epoutp02e47e61a5576fa880bd8585afc5e2edd9~EBFj-YydA1954119541epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748527335;
	bh=ngz82wMOl5404DyPdkqsVuyRGZZ/f6A/F2lmTRxHH5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JctV4H9WIHZaiqKzwpzJkSTxTy3of+wwR1rkobpUnWdnRlHZ6WKEfX5Wq0EYkAJrp
	 8QSPdYwLQa0fhJ5+vUsHj6IlqntOhXtkQa7lroAokCnC1DLYaT46yESVFsGRqqE87K
	 w4QygLG4XXFmbt4pCxrLXqdekRe74/nOiZfwIprc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250529140214epcas5p4b30a94fef30da102d97ceddd87383af3~EBFjSxnZv3230132301epcas5p4x;
	Thu, 29 May 2025 14:02:14 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.182]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b7Sjc5jNrz3hhT3; Thu, 29 May
	2025 14:02:12 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb~D_1ZpDcMz3240232402epcas5p2I;
	Thu, 29 May 2025 11:17:08 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250529111708epsmtrp2a3d44bba823829fe1e9b4d8af762493e~D_1ZnbkkW2239822398epsmtrp2k;
	Thu, 29 May 2025 11:17:08 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-1b-68384234d330
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	72.BF.07818.43248386; Thu, 29 May 2025 20:17:08 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250529111705epsmtip1663cf218914df0b247f64e91ac67fbdf~D_1W5MQW61843718437epsmtip1k;
	Thu, 29 May 2025 11:17:05 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
 definitions
Date: Thu, 29 May 2025 16:56:37 +0530
Message-Id: <20250529112640.1646740-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSnK6Jk0WGwaV9+hYP5m1js5jwJcJi
	zd5zTBbXvzxntbi3Yxm7xfwj51gtGme8YbI4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwu
	nnK1OLZAzOL7yjuMFkfOvGC2+L9nB7vF4TftrBb/rm1ksZh8fC2rRdOy9UwOoh7vb7Sye+yc
	dZfdY9OqTjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugStj0dq9TAUTuSo2ve1jamDc
	xNHFyMkhIWAisf7YfeYuRi4OIYHdjBJPdp9lh0hISOz7/5sRwhaWWPnvOTtE0VtGiaetu8AS
	bAJaEle2v2MDSYgIdDFJnPv3igXEYRbYySTR9ngb2ChhgSCJfxeug3WwCKhK/J/7mQnE5hWw
	lli7sY0JYoW8xP6DZ5lBbE4BG4m7N5+zgNhCQDUft59hhqgXlDg58wlYnBmovnnrbOYJjAKz
	kKRmIUktYGRaxSiZWlCcm56bbFhgmJdarlecmFtcmpeul5yfu4kRHGlaGjsY331r0j/EyMTB
	eIhRgoNZSYS3yd4sQ4g3JbGyKrUoP76oNCe1+BCjNAeLkjjvSsOIdCGB9MSS1OzU1ILUIpgs
	EwenVAOTz9r8mhcXlc77nT2coGF5uruSmUvyD6vPjAet5R/ZOh32HVSI23wkRX0R8wfdxpUn
	89PuT4k9+Cr13hntC+0efYcYPj1ou6mwOvxi+2fD+YFPAjKS7+x9f3/ZpHk1a25fOrr5/EpB
	4y1dKxc9ii19vvYD/00hh8LyrD9/5kj7Zl1u//VnVR/rX5+w6DXVBz4vu1nv8nDNRtnjb7VW
	PJ0pkrhZ4KDJpqTWXXbm+aJlW7rz+aOtdsb1+fz8HNBS+F3SUOvvzw8CTntWzdyi1rfnhsPn
	SR3n/76aqJfixTPv4lPV4z9quz7VONWEdmo4akx8nb3lj6G0PvOhw6kJAZc4k53Ea1MelRxZ
	yPjbJiaZR4mlOCPRUIu5qDgRALd3VcsjAwAA
X-CMS-MailID: 20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_070222_772369_908EFB82 
X-CRM114-Status: GOOD (  12.76  )
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

Sort all the clock compatible strings in alphabetical order

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/clock/samsung,exynosautov920-clock.yaml      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 6961a68098f4..77117b887e19 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -32,15 +32,15 @@ description: |
 properties:
   compatible:
     enum:
-      - samsung,exynosautov920-cmu-top
       - samsung,exynosautov920-cmu-cpucl0
       - samsung,exynosautov920-cmu-cpucl1
       - samsung,exynosautov920-cmu-cpucl2
-      - samsung,exynosautov920-cmu-peric0
-      - samsung,exynosautov920-cmu-peric1
-      - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
+      - samsung,exynosautov920-cmu-misc
+      - samsung,exynosautov920-cmu-peric0
+      - samsung,exynosautov920-cmu-peric1
+      - samsung,exynosautov920-cmu-top
 
   clocks:
     minItems: 1
-- 
2.34.1


