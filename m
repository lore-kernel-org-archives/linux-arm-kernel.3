Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BBAEB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4vr6gptzdDKs9uerszC1rybeckfyJT0vmtY2zLDKAjQ=; b=ToBzBmGac/8ZGnXN35hBYkU1K+
	rDfKB+ugn2Rd2tYZfMcsHlVKDLz5l0X/ZO/vJR6RgFUjOTbmiRcr473bRGwek+ZK8H45ox2W9OzDx
	y2uXMix8OWNqwVO1vUrnOh2/NJWMr43kSGicU5oyeoZHWIrkQatFfLbwsi0S+IGisXyHpxKsqSBs5
	FTfdVzpFE78fsGNr4m9HqCTaJ3gkySyHOPeAQUF9HjFcM7lKXgegNF3PFI7YPvH435p+3QoNDsOOq
	sy8nhx7GD1aHk5KZXH+HHiV3qnzFFiNUHqTjkq5b5jzaWM8oMPBjzAxO+7tN3OcJjDf6nenPHUvU0
	FEkO3c7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiDH-0000000Gq9O-0LDS;
	Wed, 04 Mar 2026 09:08:15 +0000
Received: from mail-swedensouthazon11021114.outbound.protection.outlook.com ([52.101.76.114] helo=MM0P280CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiDE-0000000Gq90-2PQf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDA04c3md3A0Vh3l/SbydrAR9vFM5baH68PcJw3UsjrKKh/xByq4LPikpnGYq8EUT84ix2BMFkXdR9TMxqtObVrq2gpg5Rrnx0HWws6e5nyltuxM7xI7Rq8jcsWGdS4cPTFM044/lNnGPiWquMIYNNp8LxQjv5a/7S1SkApjfaJW8Iha/hSF+wnUvE0dzj6Ls9rDiMsW6GEIzx4pzBI2M9cHLLgv/XsxMVI+E6qOqrKt/PgCfmhqHiA+2lv/+Vwlbfeq7l90xt8O7UOLAkrdTjvUhGxEPe1S5prDd8Nkftqegw6J79XnEenOqJXm6uihbJu/xx5OmzFz46y97LLezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vr6gptzdDKs9uerszC1rybeckfyJT0vmtY2zLDKAjQ=;
 b=pgnLVIZ4O4htms+4O2x7fOmOp29StWxoECMH5MnrqQxRL0u8aef9AIThLvCaFRyiOnCpEHmobRFJ+PBsLKPsoXhznBu1vsZ7+PJTnL0ZzLJddkK77CCaBa8zd86pH7/wo4WxYwwjCzHHxYG7sMHV1Z+qvjMM8PFfbb1rXJIdghwuEa1Z/f5xjKfD5ou/eg+pKLgagl+Y7Sir9jyGwKcTlj6f/re4iDbHytJFjDaA2goGRKU1cg0cguw0cLP98Rhv4S1RtlYuXhAhH6Fm1Ka2P0oZ2fT6IEwz0wGET8fUWs1KtuUT6b/U+63Aq4bR3vpjA52+n+Au2Rd6UAI4UuZGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=guidelinegeo.com; dmarc=pass action=none
 header.from=guidelinegeo.com; dkim=pass header.d=guidelinegeo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=guidelinegeo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vr6gptzdDKs9uerszC1rybeckfyJT0vmtY2zLDKAjQ=;
 b=nnPeYgCJZ7YIM9f33+aTZ/W+KHL6jZ3P/+V4OC7gx5JM3dxTVaeS2t98Yr38/enzOG3QUUIzSUUCxbZGd3FGHF76D+twhyWqdiAWXJN5mU7Z5wRCcuvm3FXnykmnULBJpMWA5id1ix0Q2dGKJhZrkeep64Nc1/GE6/212AehB5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=guidelinegeo.com;
Received: from GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:14::9) by
 MM0P280MB1644.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:17::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 09:08:05 +0000
Received: from GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 ([fe80::5a42:b24d:f94f:a5ec]) by GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 ([fe80::5a42:b24d:f94f:a5ec%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 09:08:05 +0000
From: Christofer Jonason <christofer.jonason@guidelinegeo.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	michal.simek@amd.com,
	victor.jonsson@guidelinegeo.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Christofer Jonason <christofer.jonason@guidelinegeo.com>
Subject: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in postdisable for dual mux
Date: Wed,  4 Mar 2026 10:07:27 +0100
Message-ID: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0048.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::10) To GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:14::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV3P280MB0065:EE_|MM0P280MB1644:EE_
X-MS-Office365-Filtering-Correlation-Id: 12332086-394e-46cc-841b-08de79cd8bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: gc3rqOtsPGikvP2mI4PSA/3uDLgr7KziJCjKiii7+/jyE51ofxarB9qTFHz5ADmjRB8S60e7nwOO2DyIUG2fAt9pKtuIsB+E82zwGrK0yqzLdKJjXiJscZcXVqjUzWPyFR2p5mXiAhliisAIQTE+aejzlPKsVvu7hqEjtYSXtfIEoCgp7MF4ZRvkD9tWaRpBgrPoSSpk+P8HfhWBcKajx7sd3XQ7sWybVgf3Idr7BtYDt972oqhGyi+TI7iyL8DPYTwUkDcwSRYebcgcu8qfq3JdfME3lwgWxOFQOa6R354PvUYrysZwDx/luNyPvvXx91+feM6B4VUPe/JmS6Qlbda2Nyci9m3iif06nZkste1VxBpYIMtT+c9SQ0mBGiP9c5CwCFDkJwWnKYOsGcVwClyQX2SztuhGZalMGMLgl1iVOmJQaMfSBABNkIWmUSO9TprdRA5DPMJX+ll+o7aouA+UEPDrvmDRFu3Kbl8hT0701arRAKdtmkBJC4/VNdXWGYtANrFPZDRoOZKKvOgL01sRthE6dE7alzpZnzHAhlRxtAUsz/dr48hkHxhzPAPkBW1G6bbl+qKskOr8DEhZhvzARuyk3v17Ucd9f2QqicRKJNFzEOQIJT3NX+BdjlLz9bZkSH7iEhoq4op2dgf7K4bN2rp78uJvnhhTHQizGw7O6ZBqw8vgTc04HjVb7nAPsB009pcKuWEhjOxK74b2sPCDh4ykhzURL5+Xt3D6Nl4aDOPqwf895bxDCpTorwcuB/ty+r47rsbaKVSELZqQk1ZsMksSZiTRagCJWsfiS5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXrRZ4RbRfL6bKkEH8r8gmYlyQgTtWpC02OXaHwZRfZR1ZwLG5d3LY4Wzp3f?=
 =?us-ascii?Q?aBNsOl2ygqqFKHH1nbf5+a6j5UAKmGD4bRItoGBfIR+085sxcdEhKCKhlS+V?=
 =?us-ascii?Q?tBpuZSp3L0D1V5yYhHpJrZGhzt/uASWuHMYZbZWE7SFOb3BswJGmwLlHXzew?=
 =?us-ascii?Q?JbdvEjZU962CQwWnsh8YmMf58U1aEcZhG2qcKRmuNlLYglOpP/pLgYM9jlcL?=
 =?us-ascii?Q?ijtFfvHw5ZpHR0N4yNUGsH4v9zcYmnwofTMVcRGeM0nTuWsG1wpHhD4bzpRt?=
 =?us-ascii?Q?LKp9O8wqGP7nEvcLpS1RZnIFJKR7AqiZfOxUtCEZOYR26g3FCEpkmOk2hebi?=
 =?us-ascii?Q?P4s5FH3a4PvFSLXgd9+gTrzFS2vUsC+oSR4NjboYP9GnuewyVNsnbfUomDrY?=
 =?us-ascii?Q?3MP5WR2uVT0ve3HgCx1y2E7W/QqZrRpRRUwqRIYu+XoN/xmvr4IUdyh15yyf?=
 =?us-ascii?Q?Qyg9/zf/HL43ouW3FtDGibIKT/e7U3hTuwl6cCbb7eOt0dMlC/mFI9rL0avq?=
 =?us-ascii?Q?zl7gqNhxbubbHJ+CXRqKfjRHCf1KpkpaznxIYDsAFtjosnGkvrkVaHflUZ80?=
 =?us-ascii?Q?ECHdQZuYJUU3wbzzRWyyASEESU2N7Ad/432DDZNetUw9X1hz1Wi5PyaB1RR+?=
 =?us-ascii?Q?7FBpwFHh07C+Aiymgc+alSMsnAL4XAA095z1Re1Z1a72Ym5ZXRuE70+ZvrkN?=
 =?us-ascii?Q?GhpKnNHjeiWwYRDb6rH0IvtFz6WG+hTE8/jfY7vtwckAySBdc7zQ7jClMBlL?=
 =?us-ascii?Q?fQGNlj9a1dJYNXOSmb8QVLj//VmiOYMjvZsc2N96UrA1E+PdPxPXIqjDsXCU?=
 =?us-ascii?Q?36IxuSWurthE6NoC9uFA9AF0mWBq+2Mibs7Ocr9dNTuZc9++0F45M9SCBxNy?=
 =?us-ascii?Q?txVETOOeLwPOWwR8QarIXdzFbe7WytmHQ3LBzv/nJdrcdQVtwuZ/VEFSL8o7?=
 =?us-ascii?Q?q75c4R0rKGwCEyrkU7U9ewk6kmM9SHMR468mpzfwgkHPj9lniOYy8Ly3KbEz?=
 =?us-ascii?Q?09rqdcrnMB7tbH++3Byn4IriYce8hXuVfhqCj5bDyvPNYmCdZJXa6yGPvxTG?=
 =?us-ascii?Q?Asay4JqT8lGUvoqqbWJpkIFvrp2DqF8fYEZvHCJoGDUc4UI5mK9BGhStWNbt?=
 =?us-ascii?Q?K/o9ljVE/6R/Q9v+wp2R7/RauHpIl8NNe66SMr9XleLw+dGCGcApFITKWNrK?=
 =?us-ascii?Q?cYa+oA9piPi3pE4Zw5NCeb0jtgUxVAD5T0SrKvneuzQU36FLr9vwYFkLOQLF?=
 =?us-ascii?Q?pPZ0cQ3PeBOct3k4BhHLD7hXmt8VlHkYeoP8gcYxrr1ugFQEO1NBr1fHE7Dr?=
 =?us-ascii?Q?PpTCY1Jvt2hIGrQtPw96okbIqnoGnY37S62RkQpRZKWJVb7yjSHJcReluyUl?=
 =?us-ascii?Q?XMCnoDhL0vd6CErFjDU7D9Bapy/vcEpgSLu223kAwhnilfYBdqeE/MMDq2o1?=
 =?us-ascii?Q?4oS5PWuzBWH9y60/rvzggH52E8D7bqoH1/0kGYz+lkKBzlTaVML+lIvjbgGO?=
 =?us-ascii?Q?Vde6DBdzLf8rR4WI6wuy5U6GEYYTrQS0TSYAzztlwpvoC/dmkRINvpAfoEJW?=
 =?us-ascii?Q?3wZ23LijhhF4/b+xl84io3gbQQ4blxO/BKzl3dCdvNHN92CknEaI4D2sIAI/?=
 =?us-ascii?Q?P1GU4p8EirUUhUTHmzEnh/vas7m1pCbtiftXwtX9uDIa4II5hFQ5WP1ZBOIp?=
 =?us-ascii?Q?F27O/EDK9Y4Z0ceYYjSy3kO+f15yq10wpuhDqR5LmxBPH4wveUKzqBIGIlPu?=
 =?us-ascii?Q?3KSZkNG7IYpVw0pKCf9t3qCMxP7wiHuVyb3MBrWYVLykji3v68V3?=
X-OriginatorOrg: guidelinegeo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12332086-394e-46cc-841b-08de79cd8bbd
X-MS-Exchange-CrossTenant-AuthSource: GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:08:05.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f3403a73-63c2-4dc7-b628-287972076881
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pag0YUxfKZAiXekZySbbutBvIrUDX/l3myyzAy7oFLNbfprwOPefjhzAw3lP2HU1VXde83COn665/5UJQetthn2Z7o/XRtna3VT1NH5rvJEAkywzYpCcz1LKiY2PT7Se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MM0P280MB1644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010812_621619_EB7CC0CD 
X-CRM114-Status: GOOD (  14.50  )
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

xadc_postdisable() unconditionally sets the sequencer to continuous
mode. For dual external multiplexer configurations this is incorrect:
simultaneous sampling mode is required so that ADC-A samples through
the mux on VAUX[0-7] while ADC-B simultaneously samples through the
mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
VAUX[8-15] channels return incorrect data.

Since postdisable is also called from xadc_probe() to set the initial
idle state, the wrong sequencer mode is active from the moment the
driver loads.

The preenable path already uses xadc_get_seq_mode() which returns
SIMULTANEOUS for dual mux. Fix postdisable to do the same.

Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Christofer Jonason <christofer.jonason@guidelinegeo.com>
---
Changes in v2:
  - Align continuation line to opening parenthesis (Andy)
 drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index e257c1b94..3980dfacb 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -817,6 +817,7 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
 {
 	struct xadc *xadc = iio_priv(indio_dev);
 	unsigned long scan_mask;
+	int seq_mode;
 	int ret;
 	int i;
 
@@ -824,6 +825,12 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
 	for (i = 0; i < indio_dev->num_channels; i++)
 		scan_mask |= BIT(indio_dev->channels[i].scan_index);
 
+	/*
+	 * Use the correct sequencer mode for the idle state: simultaneous
+	 * mode for dual external mux configurations, continuous otherwise.
+	 */
+	seq_mode = xadc_get_seq_mode(xadc, scan_mask);
+
 	/* Enable all channels and calibration */
 	ret = xadc_write_adc_reg(xadc, XADC_REG_SEQ(0), scan_mask & 0xffff);
 	if (ret)
@@ -834,11 +841,11 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
 		return ret;
 
 	ret = xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF1_SEQ_MASK,
-		XADC_CONF1_SEQ_CONTINUOUS);
+				  seq_mode);
 	if (ret)
 		return ret;
 
-	return xadc_power_adc_b(xadc, XADC_CONF1_SEQ_CONTINUOUS);
+	return xadc_power_adc_b(xadc, seq_mode);
 }
 
 static int xadc_preenable(struct iio_dev *indio_dev)
-- 
2.47.3


