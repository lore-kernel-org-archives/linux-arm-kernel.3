Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533CDE909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZFjciKFXeEbtpnHHUeEPzUHZfLHRDTh/GRTjatnXyg=; b=L+aWbNaQAp9+HaqPvG8HjVBs1k
	xxPg0vpjJvivgvXjVTNnwTCgDixPEnE/QKOR3aB4RibRX7XK8qu6JmdNlvUoWCLmbML+y3hALDP4i
	wxbOf/2WCWEKHqYh6bmhr9ojprxsk8e64tjCbm8KTKaNXaQghSkc58hxmgjfh9HZEw4frbPoYLPZC
	XbTtGmjzNuQF5bNRHNgq2fVcO7gai9BQp6ENBFsS15WR/ydlRyllurmcObVAy3q5TE4SE1ILUUwV7
	eS3N62XSgIjVRzFiDzZglEW6WMSow0N4hxL4rwUmJDr6EJ5ro0b7BAzai5CFhh2hj9u+2+ZXNxPmS
	iJNnWgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYA-00000008Mur-1cQr;
	Tue, 17 Feb 2026 13:55:38 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY5-00000008Msj-21wx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmNU+gub20TCTAfQukczupGzNlkv1metq/wBpukr5ygqm2iZwAsiv8uWC0H/6PD+Ygnr73Q2WVldfIl0c+gW/Da4wn+S2i6WmgApKqkn0zMMsIyQFd7nChCGn979W3NxX2+WrIoiJIL84uMDkm8TcncTeQKobJxld5d9trORYpHA1qbE1b/68KggAHmVfLGpjXpnP9g0gngaadJnHVBrtD+Gnv6qxhGG5hEzdC7WJATXzco8yL9WvG43f8nWqwaYNOaIsu8E2DhBKjHEli/Oju5AtcMXv5oF9DywxVSHpQc0jL80Ob0ylbjUxOr+nSXuELXOFAgfUu0qBVfx4MyA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZFjciKFXeEbtpnHHUeEPzUHZfLHRDTh/GRTjatnXyg=;
 b=rxBgZx4sdGtU+4PXcWC9qI+vaN9SZ5Uj9kKlcH3VN5cRo+wsD9KMp2cn+y0fDEfjQ7FYeD2WU5aP3DItWUsoEcfowqga8iZcwJBOyuRpcxGzo56NbMTOtMB2vdLlXD8c6U+JiblovA3IYIAa63GE1BCSIzTFJGuVAkkpUksUTuHWKLFDJ9r7gLIqqFMfekHtnbBhhJVbsIYahsoNVwA2oBRt9fVD/EUFAF4aTLS8S+u+PquaNiUh6huRgAXkeJwZAiIU5rFbPRpZhpv/2cTLO7/NJ6Lm1+DbQHL6b1qYTY5upEXJdDI5/MO2W5kIP1e1YW0ZVysGl7SadZuBHhpdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZFjciKFXeEbtpnHHUeEPzUHZfLHRDTh/GRTjatnXyg=;
 b=cQwciBGzYMMKClG1KPZ+Z1cLndtz1Oy83l1stR5C22KruQ9n6fjdfrKgIAFm/uIvzhNVgFaXGgOc7pvqaQIdOzVqD/INlj+d7OVCkWGgYOioYKl6VaDmyxsHxXtxcBdRbZz/bz1GH7EEC/alfZaiDkPDs+n3OIAwCPL49doziuYo1APY4DHeIMKcfmw2tkvdNZA88vo2WrkU4GC6I47zJUalYS2yoUbBVz1vagR0/jauUC/NBzpOjvtYlCzjEzNjqW5XCeUFuxNlZEXBlnV7slWve8EfZIICuUAyCihd7Dq35pEucGrQM3LXREN7DjJZAIZmUOtVOD7C3VTYgYlcxw==
Received: from MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15) by
 CYYPR22MB4262.namprd22.prod.outlook.com (2603:10b6:930:c9::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Tue, 17 Feb 2026 13:55:27 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::f4) by MN2PR01CA0046.outlook.office365.com
 (2603:10b6:208:23f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 17 Feb 2026 13:55:26 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A998EFFDA0;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/5] ARM: dts: imx: b850v3: Define GPIO line names
Date: Tue, 17 Feb 2026 15:55:19 +0200
Message-ID: <20260217135521.65742-5-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CYYPR22MB4262:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fb2e8e0-49d3-4531-9732-08de6e2c348c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4l2nuR+v+95/EUHQAOam+anwARjnoDYb9z03Rx+FznTeuBPbmGcd3o0NQAEX?=
 =?us-ascii?Q?smlsDnucTRUi8zPdFrFF56c+6Rav4Bi1mLdC+45ujIMHeEV19CQ2Q00OVXjM?=
 =?us-ascii?Q?Fhv/Ensvp3aWqWpMg5+6r1ZE402Vp3QYC5uEgTCylyJkoGv4Wy75QfOaeX9C?=
 =?us-ascii?Q?mqtYGgge2iVvox4F5xtebaulJ40HjmbZoaFLmDLcqR5VqoMFfNg6vqth8JBx?=
 =?us-ascii?Q?97lvVQf9KuLFBZo43Q7305oBulEPMD31F8ryhLMIw/DA4c0JcuYdsbR2Oyv1?=
 =?us-ascii?Q?nlF3U13tf673bYkgQR+pppBizaxGrj+ghWstnFbf2UdjfcRxPRXeL16s2Oh+?=
 =?us-ascii?Q?qfkgGpErU+VnU47nd5U63skafKD7C0EMzS+tHbPjl+0fljrVsDwFT6KAI6LO?=
 =?us-ascii?Q?hni+F0UXN7AVYX6u2Bd8a4aqeyUk0lv3Vg/bYIo5RHtOqzbCHS86LUH9485v?=
 =?us-ascii?Q?IzR2SETNVL3oxCQ0hcqJGZWTNCKlqt3b45wh4EG/iXthHFiWDckwMOKc4YQX?=
 =?us-ascii?Q?YZ7w5F7Y0psUByhoxcl88A5a+vGtc+TSWU6V+JW48ygWqto0FwYa1wIuo3x4?=
 =?us-ascii?Q?iBOJaVmuD9SpYG75vmUas77EzW2oEpitdjjnAHKjnj79bZvuC6jXsent0M38?=
 =?us-ascii?Q?EjWtmDCvdyD7cuihnpLeYltfP7YegcBFzJkFdBFaN3WZH4nM9VUJ390LqNa5?=
 =?us-ascii?Q?FLmgTynDoWUuEOr1BzorD9JVBcOkVfraZ/CvOf/miFiUnO4idD9ofO9jIOOt?=
 =?us-ascii?Q?vhS2jpikik94X1le9PjDjLdzSmcVPietKXnKG4Yx4UgsR8GU37l7Jt3uqmyu?=
 =?us-ascii?Q?YHDQz/vjVFlPyalu2wQ88AZWXZ5vt9eLbUwq45ltiLNRKGLhOT7Zg0SbzgdI?=
 =?us-ascii?Q?vFrAF463PRHLj6DEHVdlIjTKftw2UzWHhUCtx06ZGPrJgvyodnovU5MUmMO8?=
 =?us-ascii?Q?9h0eJd6Fcuoyv+TYMQwgtAJ66ao669Wuz1ewHh3inVzDpykgUCTI+zl6YcHD?=
 =?us-ascii?Q?ta33UpB9NbKR/aUBk7jJ8pc3qRywdVwAtOn7gRl5Db4niW5ZjR61aFVwSHao?=
 =?us-ascii?Q?kr43miK8dKYBuFoo8cfck2fAxSZUz36eF1f7nKqA6W8jZdMYXcnYdjZFao8u?=
 =?us-ascii?Q?g5Xe6Y0OHOWWtZManMhywDI2SJg1ZdV6NIBUFXDevMG5sIcG9MmdTTumNyGW?=
 =?us-ascii?Q?euUbg2W/MVpGMAqPA78Wij+c/5uST9/9rvbePYPFLIP70dk0IinziDuYCndb?=
 =?us-ascii?Q?3l9hl6C0GQa5/jpRGJYy341AtWIxcoWkSNtv2z5ELbxWa4wOMCWDlnZzIkd4?=
 =?us-ascii?Q?9esJ2KMx6mRpcRu0pt5UCPGN3XfEqe+XmDDGsGVVgi7HvjlbyC3nrSHcYjVR?=
 =?us-ascii?Q?QT6g0h36b3SfQdED8RvYZ6l6Bd48mvnTY8esNa7Z07AKjG+hn3aJIYC1iwbn?=
 =?us-ascii?Q?Ek+PjRGY9J3lkamUW5SIe+LHL32Fo8zr93qjk9cakxAA7DMjVdagr4hn5VFW?=
 =?us-ascii?Q?KQ8Af5irQLR+Ndi0okvJ30bfl9i9nEBsgfnCkmXwdQZgPpNiitQ/xZU/A1T8?=
 =?us-ascii?Q?mDmdsRRBBUGl2Pl4FTpDN+Jd1b0aJtjnwq2GDh0gIFwgLYutUCGQK4T3TQ22?=
 =?us-ascii?Q?j3bF3bQ3KSp99C3tOkkE8DtVAasfzq10WhVNq+ZHsY8MtZ2W9P6oYNUQi5gW?=
 =?us-ascii?Q?5r8aqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N7dE3frlmdSKF2FHK79cSaOe3qYySqhOhyof2SqSGnZMLBjXgpXklQPPqCSsopnkcr7BmOjCXXK5rUaSbCTn1V1FYT7BHCABkuplNHQAjLVzZpk6qpxz99h/bMlMqgoJPYAZQHeKGxvKvhyQvmDhuVrQ+HcSY/q/bAIF7psuAL8Vkcbb5rWcIQNawN8uSmUj2hHhizPWvourpKLmAQzF5Yn8dt6r+ZuP/dzKgeu25Xf0AevgCftqVMOUXT/KqHG/qhMGZh0jR37GFVhZXyZ7FCIVJYQWoePF7UogKTL17ZNfghV3yClxS0gWlXlbj5Paf39OsHSu2Kdb4YFvgXNdftvlRRCfhtZ4UIpajw3+j4upDolBly/zlMQpx7b8LNVXxzuuGF3Xnae5yHt0Hdd5Zd8AD3qBuQ8VdWnhXuO7tix0DE1oDhCazSdtgNTp/k+E
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:26.7735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb2e8e0-49d3-4531-9732-08de6e2c348c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055533_520671_AF9D972E 
X-CRM114-Status: UNSURE (   7.92  )
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

Define GPIO line names for gpio4.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index fa5814287f71..e5e66d536a2d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -53,6 +53,18 @@ chosen {
 	};
 };
 
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "PWGIN", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "";
+};
+
 &hdmi {
 	ddc-i2c-bus = <&mux2_i2c1>;
 };
-- 
2.49.0


