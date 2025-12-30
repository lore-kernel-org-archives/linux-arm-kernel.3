Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80780E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLlCyzqKc2KLKf3x0gN6g+7eXl9evjnXGQfFmbFp3sA=; b=BhZA3MnuoOoRnsc9P962OyBz0C
	V87isMu0TocGJ5n0hrySMLecYwe282wDd9agNUkGnneosIDs/BgTVKUn6Jcksujm05SNy4fmNXlL9
	Y+Frh1MD6GqOAP1Hxazlz0VBHqLUksgQOkpGMaBVPhEoPBcx7OmRuudyoSI/JuDjji0REdpivBOvp
	Pc5Kgju9/pOSb2kRAIruphUiGUCgssYTGtHjAF4D7d9fq9sUXjmjHK0EIlV2xx7k1/BSEp5Idx15c
	jeAaucD3YCYASOHXByedj4iPh9J1eaNb3AcLwcCBuXQnK/saEQds6lWVP/+sWeJ+3Yu6ssQQWGvUZ
	wF4Lsgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP7I-00000004Huz-3dLn;
	Tue, 30 Dec 2025 02:05:44 +0000
Received: from mail-koreacentralazon11023111.outbound.protection.outlook.com ([40.107.44.111] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP7F-00000004HuW-2yh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isKluIfbA6Qt+TCGuz/FuypZ5sEKCLzim7fm/MJbr+RPsJN8YJL8Hn9/48MAZKeVSTOguT3Ze6At7jtanJ57eM048PFM94/1egj3srjGPU4pO139p6sH0cP2Ig/BAotCRCGkL+LSE6Ep+QsvTp1u1U42S598NL6w/BBgPxiW93Ws5nO755P56Ogi4rbqKINETSbME8JDUbr1qHERgsdbfGygXiYeVDSQXdhMxti45Yc6tU35wAMyEKWTVMSXCJ0pLIy3VfbfcLoxuC7vKZSowvLrVvnhYX6tsN2mocH6VT+1LgZkRdbpb+rrGV+PY4HOaqaecUL0vQcvlaxYFF0ZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLlCyzqKc2KLKf3x0gN6g+7eXl9evjnXGQfFmbFp3sA=;
 b=ZW8XEnr8ZdG9ViTI3uLaF4sB4A421SSs+aG+E2cfAwRR9Av2LDgYZip+KezmpB6O+uEJywf2fr8sflyLS9Xqd/AEq22eHt73dCFSL/OdpTyEKq6K9HDWSCONVPo7g+Uy9fDCfbH6esJfipcfURUavX/Q7HxVcKMTFicJ8HFmX4jf8ZLMpZFIoAlJgUYSUaL0kO7ymWxYLtj0DWlIBP2koRTa1PQ7NHU9nUh+16qgmV88s9kvAVKBZzdhUfyUGR13kciSohrVFvGsmjMC+yViP8WduqT4RZ6MdVbc6xdd5PDvtI61YM5hsjifA1Y80WA5+aKDGkR+rk6T/w/QxgYZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) by SE3PR06MB8069.apcprd06.prod.outlook.com
 (2603:1096:101:2e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Tue, 30 Dec
 2025 02:05:31 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::e5) by SI2PR01CA0009.outlook.office365.com
 (2603:1096:4:191::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 02:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 02:05:29 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D9E7041604F8;
	Tue, 30 Dec 2025 10:05:28 +0800 (CST)
Date: Tue, 30 Dec 2025 10:05:23 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: cix: Use lowercase hex
Message-ID: <aVMzY2VTFn-mNCEA@nchen-desktop>
References: <20251223152424.155253-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aVHb-kbi2QbChxj9@nchen-desktop>
 <88e9e4c4-13c9-4b96-88cc-abb581011e87@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88e9e4c4-13c9-4b96-88cc-abb581011e87@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|SE3PR06MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fab9bb-fe8b-404e-24d8-08de4747e82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Lvn+mnh+EU8momO5FuO7hyjqjD/pOxI9l+qIR0VlZw8qiF1V5vkKn8FKBAs?=
 =?us-ascii?Q?fSKgBDiOkK2UnOO8beZDpAE8WBntX/9HQB9rjncZ0SOjtvpQUR6/d7e1YQoe?=
 =?us-ascii?Q?5F63hDLZyB3zAH8Q9tAx29cdc1zNWAix7fXEgEmcpToNqPlkD1ElJdeo/fUd?=
 =?us-ascii?Q?QyPf4nx5aOAwAVO2X4rgXxLs7suhSOuutQIx/Tdl0GmoWs8AebQ0nuYC+SSy?=
 =?us-ascii?Q?K++iXKumsOJw6xtMfNf2PtoOxM2mkTdqYmrLa1g3hKwYC2VQB3h7TupA1qf+?=
 =?us-ascii?Q?RaV53PohpMR2IZuM90Y7p0n2SCtzVKBDDayVxGXc8+l1Hm0ovBriAyIWk7z4?=
 =?us-ascii?Q?J9of0lWB6TIjarwtFVbWzdVWgRBA6RvbE1Gs8Ra9blWYfBS26aK1z4AZT9l1?=
 =?us-ascii?Q?e5wrwqGOk+MuYIMsyZrfiOhWlFOD8w6ksjwCnaCxWg7cGOXJ7D/2QQY6popb?=
 =?us-ascii?Q?WQCTNhIhayVbuXTZjn7wvq+UsDEWFyDa6EYY7fu9JR3lbQ2cPaEqyZKX4/SF?=
 =?us-ascii?Q?lZ400M0GWxKhiRUcx20QcfY0nfl1FmvrHzl0E374KSHneQWZWBs59TgGOLLG?=
 =?us-ascii?Q?dmZ8jwNUxpK2tD9/BuSnBa5aG+fYsIn5BxHKwPeRIJ+KibfHjZ4s18V9yDnd?=
 =?us-ascii?Q?czD6GZ5rAb3kL/XEur4pr2k29O5GaOPlpSXpZWO8/tTpeyTRvtB3LFn7zxXv?=
 =?us-ascii?Q?/wvYjpgsLvi5xf09Ajjnm8QFZT/DmTcMaDyOq5t5S6Jo3d972A8snaWF76Wb?=
 =?us-ascii?Q?wI9W1DZNAf3PddpFD8dFCA50swi06Q4woX9t1OZLC2mxVuHWBvHfUQpo50e8?=
 =?us-ascii?Q?qHYXWnolcAktnaB/XrL4imJg4gHttrBhiPxHSJkGZtEE+vQa5stCMQtJGYJq?=
 =?us-ascii?Q?nqUXB3jcM2UfW3o+b8qegpsjrwowUksD5UKveAaSA8ecZWvmDjtumDruwTaM?=
 =?us-ascii?Q?ff8eCvqDl5S5B4FrYr8cmd8DTYdb60lfua8TxJMbbF4dZJgJGYKmaJiVuPht?=
 =?us-ascii?Q?zNSQ6CYOr2Sum5yd66t1jkSmv65UehFTHx5GcXJXmWZ0LuIM/Wu9g5PuG0WK?=
 =?us-ascii?Q?pRBtKMPC/y6GjQg4VUEp3iXduoctFAAYi/XtZoKqKWFQPndYeZ9XI8F07w4o?=
 =?us-ascii?Q?XEZMNfREKj01lW++OBbGHSt+C4UIZrhUIDRvoo/oib32Y97goknVYUh445H1?=
 =?us-ascii?Q?/sk9VDNQVkWzFvBFZ+2sHEj9k0b9LCdCljtbg8PFgYugAHKVfaCKRPuezOiK?=
 =?us-ascii?Q?iqFLYUZrLJFuHmxucVvfJsyD8GsM2/uAzDzgeZYYaDbQ6smrB04Lf+m9kYwX?=
 =?us-ascii?Q?E+8dqrIGpazNOB/tM16xh5kcpXFwN9/qArwRlU4fMImX670lrU2Cy2AKTROx?=
 =?us-ascii?Q?tTpeR17mpyULHi3LmDNv/YXROfbx07P2EG0wL0RQxrgLhwL+nKA/BSxg6iEO?=
 =?us-ascii?Q?9BDXNXN588HY97rZMlM4ora67jc9+/PkTkyOWRZNPJUskjCqyz35RafcoR3B?=
 =?us-ascii?Q?f/EImMoOI3bH6WKyNYsKAcyD8wVM5ovMKdIno7BbrSXw3sCCOTT+67Uo5zGr?=
 =?us-ascii?Q?Rt6wiFMe8Cd7J+IuoXU=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 02:05:29.4915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fab9bb-fe8b-404e-24d8-08de4747e82a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_180541_755817_20EB17E1 
X-CRM114-Status: GOOD (  21.20  )
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

On 25-12-29 08:17:15, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 29/12/2025 02:40, Peter Chen wrote:
> > On 25-12-23 16:24:25, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL
> >>
> >> The DTS code coding style expects lowercase hex for values and unit
> >> addresses.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> ---
> >>
> >> Patches done with sed, verified with comparing unflattened DTB and
> >> dtx_diff.
> >> ---
> >>  arch/arm64/boot/dts/cix/sky1.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> >> index 64b76905cbff..fb8c826bbc97 100644
> >> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> >> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> >> @@ -523,7 +523,7 @@ pcie_x1_1_rc: pcie@a0e0000 {
> >>                         reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
> >>                         ranges = <0x01000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000>,
> >>                                  <0x02000000 0x0 0x38200000 0x0 0x38200000 0x0 0x07e00000>,
> >> -                                <0x43000000 0x0C 0x00000000 0x0C 0x00000000 0x04 0x00000000>;
> >> +                                <0x43000000 0x0c 0x00000000 0x0c 0x00000000 0x04 0x00000000>;
> >
> > Sorry, I could not apply for v6.19-rc1, could you?
> 
> What do you mean? It applies cleanly on v6.19-rc1 and on next. Your
> branches are not really updated, so maybe you need to fix this.
> 

Sorry for confusing. The patch was inserted by some special characters,
See below: "=", and "3D". But no these kinds of characters when I save
internal patch for upstream. Our IT is checking this issue.

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sk=
y1.dtsi
index 64b76905cbff..fb8c826bbc97 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -523,7 +523,7 @@ pcie_x1_1_rc: pcie@a0e0000 {
                        reg-names =3D "reg", "cfg", "rcsu_strap", "rcsu_sta=
tus", "msg";
                        ranges =3D <0x01000000 0x0 0x38100000 0x0 0x3810000=
0 0x0 0x00100000>,
                                 <0x02000000 0x0 0x38200000 0x0 0x38200000 =
0x0 0x07e00000>,
-                                <0x43000000 0x0C 0x00000000 0x0C 0x0000000=
0 0x04 0x00000000>;
+                                <0x43000000 0x0c 0x00000000 0x0c 0x0000000=
0 0x04 0x00000000>;
                        #address-cells =3D <3>;
                        #size-cells =3D <2>;
                        bus-range =3D <0x30 0x5f>;

I have downloaded this patch from patchwork and applied. Thanks for
improving our dts

-- 

Best regards,
Peter

