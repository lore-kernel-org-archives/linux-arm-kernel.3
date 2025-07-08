Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263ABC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH87uithjfzP9Ykpoxmhz9d98lNSkdIORLDu4bcOrWg=; b=UE2EPgZnf58FbYInKaQBlRo1yr
	Oh2yRncgCQ0JCKCbKmCQhUXTSwx3YG08OcnmXrZ1EYMYBP65NRJpJ3qt3mip1cd+HpnV1GrfSC+5w
	uUK7AFzT9bx1TbQqX++f07BigDtWNyt6Mm+iVqGYz/pXmbIvDtQ8WY9q+Xj4JTBPWuSDmzuOFEw+Z
	7EqS2J+Kbxi+NB2K0913AQkEQ4nRILbz9037fT+qf4D1FNZ7JVtbsqjRoNg1FqMQHHklpRbhQw4NA
	AZ8VyuicAoM6gqA+kPkmkey9SiR09Bdj9ppFCJLdy88M0f4VRNr11EfJBKtppo6tv9ZiSP/XaL0ek
	JmcL4lFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5sd-0000000576M-3gnJ;
	Tue, 08 Jul 2025 10:48:55 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5kt-000000055Vx-0kV2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:40:56 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250708104049epoutp03948d2d0d80b2c60f1adca3a001cd41ad~QQJGqGgiE2787427874epoutp03X
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 10:40:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250708104049epoutp03948d2d0d80b2c60f1adca3a001cd41ad~QQJGqGgiE2787427874epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751971249;
	bh=jH87uithjfzP9Ykpoxmhz9d98lNSkdIORLDu4bcOrWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFZE5An8I4UPKDhyNrWZ1uIaoLRQWo68NYtgqYhHHThIXR2SZeyqwIsyrT8stp3x4
	 qMFLlUMv/KA1I8CeO2caI76ypjuswT4VrNDXGK2nZzwmia71I4VHIh7hefVBeGk7cw
	 FK2q2XSKZWntlFs8qjTO0zkbmTi3qWAlLI5BX7IQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250708104048epcas5p45aedc6a241e37ee683d7b1880dc8903e~QQJGIyyTk1622616226epcas5p4l;
	Tue,  8 Jul 2025 10:40:48 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.175]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bbyLl00Mhz2SSKZ; Tue,  8 Jul
	2025 10:40:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103231epcas5p1b9fe52dd6ea3cdd65a5df163ba05e139~QQB2zDMtv0987209872epcas5p11;
	Tue,  8 Jul 2025 10:32:31 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103228epsmtip11c2127deecf9c06a4da8aa251fc8feba~QQB0CXqJN2120421204epsmtip1W;
	Tue,  8 Jul 2025 10:32:28 +0000 (GMT)
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
Subject: [PATCH 1/6] dt-bindings: clock: Add PPMU clock definitions for FSD
 platform
Date: Tue,  8 Jul 2025 16:02:03 +0530
Message-ID: <20250708103208.79444-2-vivek.2311@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708103208.79444-1-vivek.2311@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708103231epcas5p1b9fe52dd6ea3cdd65a5df163ba05e139
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250708103231epcas5p1b9fe52dd6ea3cdd65a5df163ba05e139
References: <20250708103208.79444-1-vivek.2311@samsung.com>
	<CGME20250708103231epcas5p1b9fe52dd6ea3cdd65a5df163ba05e139@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034055_372468_D93F5C50 
X-CRM114-Status: GOOD (  12.15  )
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

Add clock IDs for PPMU (Platform Performance Monitoring Unit)
associated with the MFC block.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>
---
 include/dt-bindings/clock/fsd-clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/fsd-clk.h b/include/dt-bindings/clock/fsd-clk.h
index 3f7b64d93558..552e8bad98e0 100644
--- a/include/dt-bindings/clock/fsd-clk.h
+++ b/include/dt-bindings/clock/fsd-clk.h
@@ -125,6 +125,10 @@
 
 /* MFC */
 #define MFC_MFC_IPCLKPORT_ACLK			1
+#define MFC_PPMU_MFCD0_IPCLKPORT_ACLK		2
+#define MFC_PPMU_MFCD0_IPCLKPORT_PCLK		3
+#define MFC_PPMU_MFCD1_IPCLKPORT_ACLK		4
+#define MFC_PPMU_MFCD1_IPCLKPORT_PCLK		5
 
 /* CAM_CSI */
 #define CAM_CSI0_0_IPCLKPORT_I_ACLK		1
-- 
2.49.0


