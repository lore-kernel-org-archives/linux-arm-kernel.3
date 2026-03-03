Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E1EC145E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEkQ9dNY1XnxCyA9bBuiMFcOlaPpCMruxRKUrc6o1t8=; b=sAnxMqrXaLsYG/Q43/X2YluO94
	s75FfkSxG9nU7OIszuajWD8j8G3Hab91QUTcliqSd2qP6LdkNwvWEFZc/xZ4CTCBIkQbKxOTw+Yya
	/ukrAUL0i4VUthvLo++nIoPzU5X25t614WnuAjiyYpADcZeP1emii13kpt77T3X+Wp3Y5uO+cpiiD
	TH5pOG+qWiuQxl55jjfcSiBJqp59zdKBURrCSTxZaqZRgNkNNx5bvTe8uc/dpCrR92fd55RCESmu5
	JCNzmO2DmfshNMq6+RsdTGcMQ4kLgZ7LDjhRvun3NAKsGkxAD0cq1AoOEqyG1vPcwWVPUw/CAAxxH
	CqH7K3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRED-0000000FNGs-2Z7K;
	Tue, 03 Mar 2026 15:00:05 +0000
Received: from mail-swedensouthazon11022135.outbound.protection.outlook.com ([52.101.77.135] helo=MM0P280CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxREA-0000000FNF2-3Ez8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:00:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YARZWhoneTn5G0z2d7QWFevsOvedO0vf9LNhsu7Hma95sgBMorT89uCcj9skNKQ8gjpa15CRiFUH5tFavBQmlqdbYVQ7eitaVpYtENOg3LmcU+eHzBcFV2934orOTPOV+l7oBb6RUThtkJhbm92YlWybfdocctJdM26bVdpL9gbYymG/txWiHxFkKmDNy4+sFEarWnZLqRGIScO3CDR+4x17z6FtdFmeY4DXja5AQMh0sKTLChopZvUAwJ64mhn2HfMjex1kJqorDcmreltDfjOb/x1qvj7ji7BcU22hsa+8IJm7nZAupBpTqm5Suon9DD0YtA4C+9/FYtuKgUHyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEkQ9dNY1XnxCyA9bBuiMFcOlaPpCMruxRKUrc6o1t8=;
 b=yq9h7wU061yUOI3s+PcJFouT+I3dnYHhNtULJMz0tT+qWtHWv0QlXotPp7n/pODulNKrr6ZmyaugMCORNHbjz8U/BHP3rx80Q4etFA6BTD5z4eBrOLdZ8XBL9HTCER6bfGteXPzwJIOZfEItqbNtTJUTdR1uCqa3FA0VyxR4tzthbldzJrhAAuT7X/i4hvAQyoSCo3XV0kB5yMRqu8sWrez3Puk53kTXMh83yAfQQA0CcxDUHygxbBJmLMWZqh2HBbxqRf4Ly0gu/NwQagEvDshFDSHlCsjnxhFwWAsWCLxobArzxzbOzzbfYvPtVCE3YahYpLiOkUDJQcpB4UiXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=guidelinegeo.com; dmarc=pass action=none
 header.from=guidelinegeo.com; dkim=pass header.d=guidelinegeo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=guidelinegeo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEkQ9dNY1XnxCyA9bBuiMFcOlaPpCMruxRKUrc6o1t8=;
 b=c4idO/cuDAtkfktx/SlofPKvMk1oD59t0mHdYPDrgIT2pzqPlRMHpMcY1o37IdPPPNcfCC1gATrOapGSCOMo1G6UIjaC2uOnpo9j8Cn2oSzy907Ii8BAFK4KsHJSP436W0Hfzjt1CwS3+UeKGDApxqOeqrw3G8TEcs/Jmdgk298=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=guidelinegeo.com;
Received: from GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:14::9) by
 GVZP280MB0329.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:44::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 14:59:51 +0000
Received: from GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 ([fe80::5a42:b24d:f94f:a5ec]) by GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 ([fe80::5a42:b24d:f94f:a5ec%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:59:52 +0000
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
Subject: [PATCH] iio: adc: xilinx-xadc: Fix sequencer mode in postdisable for dual mux
Date: Tue,  3 Mar 2026 15:58:43 +0100
Message-ID: <20260303145843.1712811-1-christofer.jonason@guidelinegeo.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::18) To GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:14::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV3P280MB0065:EE_|GVZP280MB0329:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c1248c-b6ff-4b45-592f-08de79358642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: pgcoMLFaHCdpyU5+PN2RjXwgU3AnmOja4LRVYM1rdDWOczDYAUzEdNdUlGAoXsXlBuQLPi9zTaIWx7VSl9KatoKXhNQTE+8hxicJdg6aENhGrXOnSCUMjey/4tYvxIl/P92hEDKXeVRT0CE6+079ADU246lOmzMaPWBL5Rv3EVs+i+Ex2Jj2/5fUYbmstV3WzziMWFQMyqR+FeQBoT5qgiBtjLnCl79m+2SPducrY3MVf+oIwkW9u7grXfUajPgNpiOnVw+5mHiWA2w8xBnuZyYbtj+jrN4wapYR5UBPTyEgCACFKUFS98qqutjVa0M2/qbSyo+0gqvmcZ6PhHPNqBkhEyfrdjEy6J8GfzuEmqETzdgqw7uvbBKYDu6vNebdmQYrzcBKj9V2crPQxs2PXBv7YvoMMvqJga8JC8PGIaeuwV4wW/SvYPLC4Rnl+zL1pk1mKRFjptO5J7WeVIURmpI0C1pxMj5ZsFvHvjWT1QrW90SGKeC7Ibbi8FKbHBHPShJ8PHR7m01PdE7sJsXypRL6+GQB0jdc1oMEYqqeWZAsRu4FQR/Xq7Yx8u1noLskMsGXCkzeFUTujMmk1tbBOSoHxxeFY04DwCKB9/vmuetSjbA1ISf2BwrxyJWx/yjC8TFLS9beA7nC+lAYURqhsCfPkPQCcbpUOXCgr3+Jhk3u73egMfDBLNp2WbGzYX5MJXasCJT9bynXUyIcH4MU33rZSROs+4DnC/2xwr4aR4svRgq6ICQ38G5Z2cZkwTY4KxD6zyZjToc6MOl5Ti1G8p0koV4dbNC5MOZCqdDuXDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JldqWuT3obxtRf9kDopme8nUXQiBZjLqPooMbxwUhfC9hnMBV6cIzRjmZYFa?=
 =?us-ascii?Q?0Ehvbzl1C/GHzsaBIeHbzKAq6BgD7JkRzDmD8BvwnhHhzbhEIm37TQJ1SqVI?=
 =?us-ascii?Q?HW00vvs6OPVVR8oYNpw9VLG457gDPDrc/tX+NUwoe7R0BF95JCe6hhsTSz1X?=
 =?us-ascii?Q?XZrcgzkFbafHe6KHuj0/HOFQCUqXFJdpoIyjUuEYlo7T85IkVDuPa+hr/aP1?=
 =?us-ascii?Q?gKGtoiOkZaNM6DuJxv2wUq4qCIGFWJcjizgyPPGaCK4yQ9yBBPN+/XRnEHb7?=
 =?us-ascii?Q?dCBbUbx8VP+jB/BnDfl996h1IgEfILDyRaTAPKs2x6T+yy4MvprrjRv+DY1x?=
 =?us-ascii?Q?knYBiSojxGgH8u1RLgV5tgiQ/9c9EREac4efFijijB5bYypXrAdPhdgjsMA8?=
 =?us-ascii?Q?34MmTjniygLfQ9Fgd289dc1B4Dmce60oBjFoV1HoCF+vfXCKZjwvK7EAmz/F?=
 =?us-ascii?Q?A/+HcEo7jEPb9KeR9Gya3eGS186oUFFGK9WoQRJCtblElPDCY8OQFdUgz1/Y?=
 =?us-ascii?Q?93+gfmLGh4AS+3x2KV5wXBbbm6nO8oT9zAnT4myJkcFnMEVq7NpGYT6jhWwy?=
 =?us-ascii?Q?sM4XSTjGJ8JoCIrNIk4oUUS9Og2kRUZoFW45dAHFdRhOh64ETJtn61jMXQd3?=
 =?us-ascii?Q?OwV6AftpPRLTPt3kgCqg3A47f6IbRfi90aEg7B+3U7XfMniZM7IK8kqeMFw+?=
 =?us-ascii?Q?Zqy5Ij0BZMiW1WC8ldjVdcw4hQQomaoVHWYr3kEzP8DdmvPlGP5s9MtpRPQE?=
 =?us-ascii?Q?FAo0uplRSdiQgpslVd3cj+h5WriVMzvlRgXqX+0qfqurwVsuXo1pm9l796NH?=
 =?us-ascii?Q?Xe1k8tgI4DwtCoKb2LaMmAHPN7r8HVMQr+UKj/hbVGgLwkceU2grfAMYa6fi?=
 =?us-ascii?Q?mzlpMo7y2wtUjPlDHHGyI85w63LSHxXW8VTZRoTaJkO++Fj0VgU7M47wl/0f?=
 =?us-ascii?Q?gV98j5NqpcKAaV5BUCLkfFDhsoIYNPHYqj1dzdWYW63Tu1447hWTGDfVm2oi?=
 =?us-ascii?Q?Px4JLCYiBiZ0jcNKrWmjh6uaQkbivf/4bwquFE84xQVGRg9FChZ7d9nA5+S+?=
 =?us-ascii?Q?a3wdObIjpPT8CmnrBK0VD44xosy0tE30Qhj60r3Yo2MYJV+bbrIVDicZJB4B?=
 =?us-ascii?Q?ou/08oqDQIrlp2HqaE49e0r0QzDOmIp4qxh1x83NuYWYMp9ntdukLFIU/DFW?=
 =?us-ascii?Q?QeE2yj63wKdmlJYWZ2ze4s+F5jLEaUBcpQVS9QXWI9eCwkIS8r0SRPkjn419?=
 =?us-ascii?Q?l6Wpg6oUzkkG11gxlKObSF6ULfk/1H/HjtOOSn30zJJdO2gUUdTrMxJ9qcMd?=
 =?us-ascii?Q?UnK7B5Q46wWrMuNjviwyhEtu7snX7j9FIU8L7rt+fO0ZTNE66kAaVEe3+wCU?=
 =?us-ascii?Q?DsUHHUlstmZYOG0C6h5i10yHEGrdneIqvxkfD8Q1fgKr4wTExe4gHKefUAKV?=
 =?us-ascii?Q?eQWLU7LbJbN4v8iW2bx+wIZm1ThOIwQfZu2Vszh6ZsdBHnfUz9AUk+btB9mq?=
 =?us-ascii?Q?1xj845kKcIhvRvelXKlhhg/kkb4mGwNgTcm4JUMUTkJYfP0hq48v5+y1/z6q?=
 =?us-ascii?Q?LjFePdlGygp3sOgNoRxS31l87f+lmYasduyOY1bpTG3kWUJtZRdiH/V30oSl?=
 =?us-ascii?Q?sHKnn9+xYQ90QzswMeKTxut0bUze3FHXD6yf9PtPwdvBV8Rep5SRvaHF6T6i?=
 =?us-ascii?Q?ewVHv2Jst6+KoJzHWQgiWJAXGMOe/7+JIalbc6f4qrGB12fH3ASrbUY6pDGf?=
 =?us-ascii?Q?0RoXCgjdH8Ib+MFKLvKzJonOVcjTIIW6UCRnbdSNuF+26LyxM36i?=
X-OriginatorOrg: guidelinegeo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1248c-b6ff-4b45-592f-08de79358642
X-MS-Exchange-CrossTenant-AuthSource: GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:59:52.7302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f3403a73-63c2-4dc7-b628-287972076881
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2eKDNpluZ1fBE/UJsPEODq1acfbTJWt2B6MEEex8NAKg79YyzWln6r3rG2pDyRAFBPRVgy1Y1xFQRMDYrHKoDjwGO9w2kH4JHWGHVdViYBFenpqtBXhFPPcy2WfvoPl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVZP280MB0329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_070002_831014_0FCD8250 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index e257c1b94..89d435d72 100644
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
+		seq_mode);
 	if (ret)
 		return ret;
 
-	return xadc_power_adc_b(xadc, XADC_CONF1_SEQ_CONTINUOUS);
+	return xadc_power_adc_b(xadc, seq_mode);
 }
 
 static int xadc_preenable(struct iio_dev *indio_dev)
-- 
2.47.3


