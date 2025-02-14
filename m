Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768E1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqntbEvQ4oDjd8z8ktk+NOdbapcG49CuahKXXtXd4jQ=; b=rzUnoDuYTMCf/3rUSSVCwvQ8XL
	lf2iYEMX0coLKoZZOg26l6Xe4Gd2gj6Px9A3v2mwsfGiazoaUSezkRMGM9pM721jAqHEkhYkcetzD
	lhQJ30Ubjpv2k5tAF0H7wPJPwltQnOPKcAsMWnN1rhQMDvE2L96CNLMfxRRrUCHpQJQsb/TFZjaGS
	KeFXUvprTi7fcw13OrO4J+w4NVfx4Uy6sEAoQfETFBA3TB/a8bJiDSgWgXvAA8F+1TvJZiaU7XapZ
	J5R7tnXhjfkw8GlX6GlaYapW7i6B54RCsR8BirWjfHHSKUT2oZuWUi5lVtObSmVLfpyyE9yj9mOsB
	ispm5qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipkm-0000000Du0e-3636;
	Fri, 14 Feb 2025 07:04:48 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipfe-0000000DtCH-1bDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:59:31 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5nqkZ012347;
	Thu, 13 Feb 2025 22:59:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=U
	qntbEvQ4oDjd8z8ktk+NOdbapcG49CuahKXXtXd4jQ=; b=BKpiAB4xIa5QqogLo
	C6r4rd/+YvuQA4tLdceE3VIxYFSGvQj4lW9PTY7A7iXzqgaLPAvIuDSNsTipnVHK
	phmO/xjJmBDeSj/YBRtGV66vsUOajrFur2S6teqVLSVfzjgpZRL/ZM9wJZjU0fg8
	xngwXZjd8xmkiJdxhZRj8ZDnOGe59K82bmzmSY3BebSYWJZq5077PlBALM6Cf7ts
	wQlCMO0/ooEjh4lzqr+k0wPHdR2CRAF1yLOP8kQdC8z9XfmNpVYnSys9Xc+RkKzq
	d3/CryUU8hah3vqgVS65WItESWgcS9Dk4WXLZM1ePOROGn1YoemJzatZz8blYmSl
	Ahaqw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44t01f03fa-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 22:59:25 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 13 Feb 2025 22:58:48 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 13 Feb 2025 22:58:48 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id B61653F7090;
	Thu, 13 Feb 2025 22:58:48 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH 2/4] [PATCH 2/4] reset: simple: Add support for Armada8K reset controller
Date: Thu, 13 Feb 2025 22:58:31 -0800
Message-ID: <20250214065833.530276-4-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214065833.530276-1-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1FHO47QsLdwd09cmpuryZ2amASV6Uwg3
X-Proofpoint-GUID: 1FHO47QsLdwd09cmpuryZ2amASV6Uwg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225930_421963_6CDAFCDF 
X-CRM114-Status: UNSURE (   9.88  )
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

Armada8k has one register for unit soft-reset configuration within the
system controller register area.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 drivers/reset/reset-simple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index e4e777d40a79..a792b913e1b1 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -183,6 +183,13 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+static const struct reset_simple_devdata reset_simple_armada8k = {
+	.nr_resets = 32,
+	.active_low = true,
+	.status_active_low = true,
+	.syscon_dev = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
@@ -203,6 +210,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "marvell,armada8k-reset",
+		.data = &reset_simple_armada8k },
 	{ /* sentinel */ },
 };
 
-- 
2.43.0


