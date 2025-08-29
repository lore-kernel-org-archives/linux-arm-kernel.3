Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCE2CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=P/PSg7LV+0qqtsWnBqc+ufwU9SbD3VXOH9HxTbYXVdA=; b=qXdrohlM+F283RmLFeAj0Zw5Ws
	JYtLuzbEicFk/rb1XKxK/EMCcUTZAcLQn6zblOVnDxuIzf/nMRwPQwMargFwnCkPC21n+EqYWjrXl
	jItrSAWS8+p63qrt3Oq2dEPmu8W5JcQe1n5Vl4wDZD1lud2ErOWyYrXtkdaJQ8LvhH7Olq0XXODdS
	BUVDxYiA9B10tSxAYUbeXE0R+GJ9G7sfrPzNR4IOBjAUoshk33AGNlKx1Qt0FOX7f97pyQ0j1TiE4
	TrvIxPDTR0obbfpqL7twOdoHoVe66S6V/3wBcZhucxm1FCOOy92To/IrD+GiAVZzUDCwb7IjQDstS
	hgDJNMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Qz-00000006TSi-2lDj;
	Fri, 29 Aug 2025 16:58:41 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzbL-00000005wH5-213q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:57:13 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829135700epoutp02e17b511ffa9cd2f4e314bcb8fb592d76~gQXPVdt-b2867728677epoutp02D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 13:57:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829135700epoutp02e17b511ffa9cd2f4e314bcb8fb592d76~gQXPVdt-b2867728677epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475820;
	bh=P/PSg7LV+0qqtsWnBqc+ufwU9SbD3VXOH9HxTbYXVdA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XhQnqRZ20aj3IeB4CADNg0A9R9TWeCz4W+QlskSMqapwucLEj1+gQsR0VVBypvJHy
	 Ckk9k27vHy/5OyQZx5dgMViAR0lhnZCW6DVIUQianAjNZdlMgwz/YRNTEH30X/NCpX
	 FrYm5Tbm5vb20s8Xfis0S9A9Ifppae84x2nuKaoc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250829135659epcas5p45f243a9e12d857393ecd714dc6c5d133~gQXOyXHGE1269312693epcas5p4C;
	Fri, 29 Aug 2025 13:56:59 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0F66JMtz6B9m8; Fri, 29 Aug
	2025 13:56:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228~gQXNRLo_I3096430964epcas5p2d;
	Fri, 29 Aug 2025 13:56:58 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135656epsmtip2c943b2ae8c7c97158101f6967f651497~gQXLjQJAl0722807228epsmtip2Z;
	Fri, 29 Aug 2025 13:56:56 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 0/2] dt-bindings: watchdog: Add support for FSD SoC watchdog
Date: Fri, 29 Aug 2025 19:26:41 +0530
Message-ID: <20250829135643.105406-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228
References: <CGME20250829135658epcas5p24bb23c6fef2092aa7397faa10e0d9228@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_065711_686330_3BC96B26 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

The FSD SoC features 3 CPU clusters, each with its own Watchdog Timer (WDT) instance.
The DT-binding and device data is updated to reflect the cluster index and clock configurations as per the HW user manual.

Varada Pavani (2):
  dt-bindings: watchdog: Modify tesla fsd bindings
  arm64: dts: fsd: Fix Clock handle for WDT

 .../bindings/watchdog/samsung-wdt.yaml        |  9 ++++---
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 24 ++++++++++++-------
 2 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.49.0


