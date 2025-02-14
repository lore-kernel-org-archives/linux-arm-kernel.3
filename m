Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9944C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeS3gll7WobDpQxiIVo540nEKzgfS81Y5Wnj4CMunZA=; b=Le/x8X/rHpRp1bWkLJfU+vayfI
	Zto7+X8vKcZTARf24KCwwwCBzTSiqHBMR9O6ugbJd/3xV2Dk2pv0FL3FmOIpiEOZ95WwEvx6fcVv0
	QkZyO5Z24a5voLK72BI51ydNAkuRuYBa5mbkvieAyYX4WOrXIZ9xNWru6Tm/iZibXhY8i+18gtu04
	5Yo8IGt0CTl8I5ZhHdpvB/w7ongE6Iz3b069Cpi9WSfHLV/cKEClb53HDMSIkxwhJ1WvPI0hYHg40
	2iAj6SJv2W57lwVQuhvElkyz123NMk5KJ+S5NhKCGUuDcf2QV5Y0Y2G5SOnguOtuYp+v8Wfe0YhZW
	U1SbLxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipna-0000000Dud7-0W2U;
	Fri, 14 Feb 2025 07:07:42 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipfs-0000000DtG0-1bhp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:59:45 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DLUq1Z017100;
	Thu, 13 Feb 2025 22:59:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=B
	eS3gll7WobDpQxiIVo540nEKzgfS81Y5Wnj4CMunZA=; b=NwMkfZw2UGignPQm/
	CHqEJl/4PwlruQvJF4rsinpmubZSzPRRkK5lATQqdtd0psJdJoemsxIe86XC+ENz
	LPSRv6NoWJfGyZY2b3gfB9Wk6yrcjV+0VhaN3wt5gQkYM+kTnaIAOfWpBg2pKA1R
	VsLki4zvpXv5N3CyMtXmgQmI7F1JDMLqWM+tM80UcC2w8eqaMB9mI6O7E7OahWyp
	q1cjyIZd6/Kv0heyF5RcOqL/NFJnKLFHTuAK966b2RszX7O1vh/uMmA+meZsIyH+
	e4jEAhOue0DtnQZlUFqUyYcybdcC29QtvaP6K545Xq0at6RmLdZ+bYHegGManHQ+
	PDZEg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44srqh8wuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 22:59:40 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 13 Feb 2025 22:58:44 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 13 Feb 2025 22:58:44 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 55B233F7090;
	Thu, 13 Feb 2025 22:58:44 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH 0/4] Add Armada8K reset controller support
Date: Thu, 13 Feb 2025 22:58:29 -0800
Message-ID: <20250214065833.530276-2-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214065833.530276-1-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CD0fM0idsucZRPKOBqVih3KDNtMKKatk
X-Proofpoint-ORIG-GUID: CD0fM0idsucZRPKOBqVih3KDNtMKKatk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225944_421100_CB9379D2 
X-CRM114-Status: UNSURE (   9.21  )
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

Armada8K has one simple register for unit soft reset, which is part of
the system controller register area. The simple reset code doesn't
support register access via regmap for the syscon devices. This patch
series added new ops for reset line operation to make the simple reset
code compatible for syscon device. And add Armada8K support then.

Wilson Ding (4):
  reset: simple: Add syscon device compatible
  reset: simple: Add support for Armada8K reset controller
  dt-bindings: cp110: Document the reset controller
  arm64: dts: marvell: cp11x: Add reset controller node

 .../arm/marvell/cp110-system-controller.txt   |  32 +++++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   6 +
 drivers/reset/reset-simple.c                  | 126 +++++++++++++++---
 include/linux/reset/reset-simple.h            |  11 ++
 4 files changed, 154 insertions(+), 21 deletions(-)

-- 
2.43.0


