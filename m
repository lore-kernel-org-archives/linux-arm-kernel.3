Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC6C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 02:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SqChGhMw4keKeAHqC8tY/iln8FiAHvXC0S3l67Wq7o=; b=mjrsis7ter6KkAqDv7OKLbLLtL
	TTp0r2jpPIWvoE85XU4wxC55gHyzFqVhndJXCzu5PeXUjA7prOVZC34ufXQkSTI2r09XG/Q4gHBok
	dRHqstuitOkgazCe9z+0Lxy46tIyCzyVfaM5zPtMlSF9fbykjU9KRIJR07KHDCAPgPCLqyLyPLT8A
	H3ecqld7BM2cMCiCUtcSaU9QWLbnyCFJe74zfGvc6HuDA5+jJOMhashAsZLu/buqt2xH+Yk5+nl5Z
	vMwUGwRul9inVkMyTwZ5zna/YEs/w4DHdUsNDJ9ZBraCciFAh2tf+62VDOgEvBQQ61321+7j1KTeN
	9iNbcLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK6Ie-0000000BxMO-1K1u;
	Wed, 28 May 2025 02:13:48 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK66I-0000000BwCF-0kLC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 02:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkAk3Kj2V5/MLwevSXoLryBymroPqubAVBmkRvxQo+Alw4FEPHtu3QR6mgH1OjsGdkov4by5px731X5PlbKp9wNnPEaauicGob1wjDVFngvW7HI1rtRqQdcP+/KatUUVhDUXFe1I9FuUFO9VN3bTLA1ajnxaM3GCJv3PIo5kVEXo3slc6ngv7W/RRBo+sAB8uuqm+tlLPoHcc7VI5cUj8X/sec1jX79bJppwilnijeYNNRPwQlPQ+HARScDcJcZuEdOCVB7aPPgtSSoOeQ65ZTG6AINscAuytSx0TLOsS5zWr4GjsKa+DIEcFCNqsfRBoCZcRjFYbMf7mtEiB2t+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SqChGhMw4keKeAHqC8tY/iln8FiAHvXC0S3l67Wq7o=;
 b=k9vQQmnQGSjP2OGtMRCB2psA+oJ8UYSj/gmJ2YVHF3+XbzaKLpsq/wvEeauyya+0aQ7e3sGdo+CZA90OHIWfbPEfCA3PmZtfsKvnrG4h6Jkq5U7S0IMfVaYVQKEmjkeW9g/DuH7/C8ydFwgrbA5dYg1pYXzevZa7BMJcWKnFRVSZJQp4VxPwCiVzoXa/cz/uMNrcWlwvMly3PzMURLDT2lTBYqGiln8S5/8AOWN2BSeiPnSHx76gVcpaQd2VtmXYnnrjybTAkppWDVImkp8WypEvhh8WzE7+ZPqwxjsEfyrtCs+X/jTVo7A9QzMr6G6zmYjEwoOmx7K8JbEWOFaOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SqChGhMw4keKeAHqC8tY/iln8FiAHvXC0S3l67Wq7o=;
 b=X1oKf9QPwG67W/0EMDwHgkO9NVx698vNaAAuMBgxmgGaKfHKRbvyvlSlsPRSdj6wRWyOqXfdsvmuCcOgpDhx0UodrCSsMAe2vDd9gnep7LvBn7N68WM5+yvd9fxg2iouiSGZxAyv74QZToBpnyBukLG0sf0C5z/6z2KpTjFrIPL9UG5aUMuNd2kOXTZJG+oPc1xPGodqhT9IYVYUi0xT/a9z5XNuu19oucFg9UcS/Ca/tRuR8af1Bxzz5P2qTkYLd7k8dNRczcMOAi+sYSi/VOFbhrU/uOZUhcyzgM1VCIILPvpPAaPexGZ/Xiv74XSehbflvTvSp6gYpKZ/T/KW5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:57 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:57 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH v2 5/6] arm64: dts: imx943-evk: add bt-sco sound card support
Date: Wed, 28 May 2025 09:58:36 +0800
Message-Id: <20250528015837.488376-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d26d7c-1423-4aa2-e9bc-08dd9d8b7c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rqeoWmtGtqxzHKvXRjZmxH1ldNSJVS1Y53+hcdakdx02/8A7ggDWebPyYB8D?=
 =?us-ascii?Q?qgAd/MmTqx4bC6Sg/zANlkJaiqOGM8Cv+4J/HFQAxmkgf1F0kpqvjs0P7Zcj?=
 =?us-ascii?Q?0DH8mFDKpl7VSxr7H0krU6WUZJha52fOkJPbpxTN/HKHXYqYIH4VdPIuZFGe?=
 =?us-ascii?Q?QnXw0BLmNFW3U0OJTPMoaezRSECpgRWZx5gIKQIAgDXxAtoDVi2U1ghaW9Lf?=
 =?us-ascii?Q?uszbYi9rfdtm0ki3PmiJ1ENpht5wmctIKY8sfKbWLsS8xiQz96gfx88RZee9?=
 =?us-ascii?Q?imabPBXxi+4WNtkm2Sr1LX1FB1Fr5B0p9Zx13gOFSn7ngqutLL7tJ6PXYgyC?=
 =?us-ascii?Q?PAWCMX8OJK1oF8IYGkmcMOYXb5CvgCIE0BC4kOWSBqPfqu59OqqOVtGKfd7m?=
 =?us-ascii?Q?TMT2v2Zi2UOJbx6gcmRUpLclVwht5O+qvlO+mT8km/yZKx8Oq226zoyFXJH2?=
 =?us-ascii?Q?jUr36PX1Upu4PACdnFVDRyhuHsfrBpBBWvG2ek6pkHyKcM2gb7sqx/A9qpcE?=
 =?us-ascii?Q?XOKnmhMwdWhlO1UgM8/7iaHcUrwjFdHrhElhFQMRTZEenuDgIl9fPBLqJeDC?=
 =?us-ascii?Q?/DHSjLB4ZZyzCcQVp6CvKEzTIs1k4hGA55MYeDRqjF1fTedyvVfMJf6AFWOX?=
 =?us-ascii?Q?2hCv+kPwqMIQ2k/C0s7Y+GbqWbJ5Qe6xt+L9+4LIEALcZ9Mq10czigStISjS?=
 =?us-ascii?Q?f1waZF1VgMiY7S/1Vf8pWiDAqwuXB/1tOeDjOJu1PvVJk7vfuYGZrT0kc+Lw?=
 =?us-ascii?Q?yOZOvNPvFFUfJKRRFvUQP4ATcO5LmSCGbmQQuxV+j137cdEP1YdLgzJYRnhe?=
 =?us-ascii?Q?vdgbp4sioG88Sw8USF/fJ5MTDWA3nIFY7gA0giCqEX8qVNDG/s6TuKcHWaSB?=
 =?us-ascii?Q?yx53s44G9ztiAqz5krDYY+hTnKUc2RsKbB9x2+1LSO5gFogAjFhuueiJQjaZ?=
 =?us-ascii?Q?ZUrvPeUM0fIr5xLUveG/AFdI7NuNINMbJICYuqazfNR1nBurNiCK0NwqaLjm?=
 =?us-ascii?Q?ne9Sj7VfUUnQzmATAETgdOu9TPy2tFQHuoRfHpkEgGENRavdvn/KalJ8lIFZ?=
 =?us-ascii?Q?pALeIiejmYtUsbTv6qQ2OAoqe6GxNg3kks+mPYRcGuo/Sp3VF3/2Y6EybpmH?=
 =?us-ascii?Q?NNO05VFX7LewU8cDmtZa4fepgcBieGHOEeQrNIUCQyaOBPu8bS9OvwB6CTkm?=
 =?us-ascii?Q?m5Ejso5tO65dMSqEveLsLnK1rBMRPDVtJ4sTdogfrBrY3g/Kd1NEDpTt03fE?=
 =?us-ascii?Q?rI0uPG42K72tZGerY9pDl0Via6FShuc3VfRFbER8mewFvKdGBXli31+YV6gy?=
 =?us-ascii?Q?gOlgC8NaTEAVqeioPnCspTawaluE76LII7wqUIr08VYVXtlxEN0KucD/HKkZ?=
 =?us-ascii?Q?b6HPSeplkp3R9uE3KeeDFymnVNXBvqggjdcmrW82g9iW1V4KWwslOe/q+b7q?=
 =?us-ascii?Q?uUpb1PHyJkDd+SffsXv/QP4R9UnJkyuseKpt8eifKAxRYIULUEtgi6ZWQE5d?=
 =?us-ascii?Q?sLuui+oVqRVuC58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6OEg82zHHZcicuURSwzXqfHchdz6WOINvFy1CeQJfo3vptRnAb2xmemAWFAg?=
 =?us-ascii?Q?UZfk5EO6DVcaAvWMd902/zC3F/00vZIrY6xKCfigBvmptlbdsKT8BQa36aff?=
 =?us-ascii?Q?eqTOxma+rfq5Wm2/V+bV6LwmIQBwQUH++RTyzqUI9T0uJ2UiT3od0nscBB5d?=
 =?us-ascii?Q?19vDchMsyoUd0wSOKnzGRJQjvL7AyBcaCD2gbIVX2QY8LZy43cocz+NlY2Mp?=
 =?us-ascii?Q?IgxQbuzt5OOqXHJJkuW5ZCFGNK8wS61VokavnATB5MsvZeeKmP5fzUpS0cYB?=
 =?us-ascii?Q?7vXkEMFRtMFk8pIxgpsU7AgeNpATOg/eTfob0P1HlxeCQ9zqJxyLFp6ejmhr?=
 =?us-ascii?Q?XbadSyDPDv/rU4oeJBEYBIhmzLXnOzCUW9b6RS7w/1k2Wf+t7AygLS320dWP?=
 =?us-ascii?Q?P/1+CIqXdaKnaLuZgHnZAReoVSU7pV7GbGyGGjTCfA4E2FtEFkIU4+/cmW5v?=
 =?us-ascii?Q?MJl2xHHARbeosmr6N59XKG8dVaOa+nAHanf/BcOiViEDmYi+q6vUkwujeI+p?=
 =?us-ascii?Q?/5W4Tfr/Epy9af9yMW9hZ2OxATXd6EEHEWIR+np5/lOfvctc0YktyA3RskTJ?=
 =?us-ascii?Q?2ztfzGhSYWeGuN2dCGUqHisBeo9xAnm2yA7gJVDzj1hlXasgYGDXlyh8gRqr?=
 =?us-ascii?Q?BQPeEpYy5oeIePNXO8yKmFGnZ4pMqTBF8saOB0LWuwPRnV3nydTaEb5Fu5oL?=
 =?us-ascii?Q?MOiZgMNwRZ0TjZGdZQlQ2ObGH+Cw0waQNpdHD0lhysul1qi826w6Ej2zUAJP?=
 =?us-ascii?Q?FpWpxoWF7aSreJ3NM3Lr/B8MBRNV47MfxSPI9V+k8cOnwqWtESCgQv3RgYLq?=
 =?us-ascii?Q?vZXZBImU3z/oiPSU0Ci75Lu97iutQ0zQ3YNp3SDBW2ZbFXukJaOxTGICcutu?=
 =?us-ascii?Q?Rgr3eKJYumfaU/RcxuezFyJxGhK6VfWrpVAfuh2jOEglRdkbSRsMo9KmLu/H?=
 =?us-ascii?Q?R+rRUvM68WNzV2PnVSASQRt17fml/l+/QAwBSfsvhDDX/ifT/rFrUsqFzKol?=
 =?us-ascii?Q?WqwFDpJRlxavmf2rnJDlE99ESGW37WdrQPCSLzxrlx6Aauz99CTg1iTGgvcE?=
 =?us-ascii?Q?iXYHVc9mMZdI+PjwkoARCvDwRYXmgVJnhCVPujU1cbr/1zogKjehlk2Vv/mh?=
 =?us-ascii?Q?1IVzYdfTJVRG2LSkuJvDkOGo994ESV29cpIG9uybJlP8RDQT0isatUrAQCYL?=
 =?us-ascii?Q?30SoPd2rw5tUJ/4xvOPaBU1iFutPbjGihAK59hJn92ApPMCuvqcOUYMDZhzQ?=
 =?us-ascii?Q?/F3uqKRrzN0/WuYSQScogR3zj8ngo2YpinxVK+Z9OIXAbWr0/XnZJKz/99Og?=
 =?us-ascii?Q?TMGQ6r5m7Do3z174hpoJuxsrP4ZYzqnftOw2i9IbiZTNDQkDe5JM7i6I44nH?=
 =?us-ascii?Q?ZCPmzjyLUtxwjwJVimxzIXcQUmEb+tT7YrwlxGaAHtWE2++BNCvLJArQloP4?=
 =?us-ascii?Q?J4qDS6WS04kb+E6pzhOkrO0K9z0IreGcly/DWFE/BCj1haLI5Fzdb7KifT9T?=
 =?us-ascii?Q?qijQJgwlYvOXGmrFvDUeuDns0eBxzdKVfTC++8pvAuzgsek49SFmi2nA/ILx?=
 =?us-ascii?Q?6QcowpH0sGVmGdpLaGvJ9Mqe4pngHm5paE9Gie2B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d26d7c-1423-4aa2-e9bc-08dd9d8b7c1e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:57.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3ZwQSfnyc0NRnS78YH8YnYcEpJVdzKJEZDeN3ZdqOemG9nbVObMd5BrRMjStGcgDKUIErOrhoy/gMuEW8PWEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_190102_218837_FD3D6FF2 
X-CRM114-Status: GOOD (  10.81  )
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

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index da08aaa95904..85cec644dd92 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -20,6 +20,11 @@ aliases {
 		serial0 = &lpuart1;
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -59,6 +64,25 @@ linux,cma {
 		};
 	};
 
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&btcpu>;
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,name = "bt-sco-audio";
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+			sound-dai = <&sai3>;
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
@@ -290,6 +314,12 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
+				sai3-sel-hog {
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+
 				/* eMMC IOMUX selection */
 				sd1-sel-hog {
 					gpios = <0 GPIO_ACTIVE_HIGH>;
@@ -331,6 +361,23 @@ &sai1 {
 	status = "okay";
 };
 
+&sai3 {
+	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX94_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &scmi_iomuxc {
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
@@ -376,6 +423,15 @@ IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO42__SAI3_TX_BCLK	0x31e
+			IMX94_PAD_GPIO_IO56__SAI3_TX_SYNC	0x31e
+			IMX94_PAD_GPIO_IO46__SAI3_RX_DATA0	0x31e
+			IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
-- 
2.34.1


