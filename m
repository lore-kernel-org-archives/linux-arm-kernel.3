Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD47D3C529
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kla48VDQaXoq44k8Gp1jJDMLbDayWVkeuVZylDDSmFI=; b=KnbOx0zjxpfZfnYIfG2Et+m5K2
	MM8j+NJzxEFULLdTLpo3z2ZhTt50zkKRGhyfPzv9o2MIkrYaEzKZkIxL5Tdf3KuIKvjpBMPGhRAqI
	1ttHRdu4dDBndNc1vMRFXFjELCCE4rl1xmJEOhTwB7MtFZsVPUKtwVOg99Y42HJUVFOOmN0szmO1f
	YvWmN/zKWCkWGyo2O3kKrgIz1uOfsGHTaceSlbDIFxL9UhjbRqYxChws05e34mpdZhmsyYqrm0ARH
	u6pp2Tzsej77Xh1JjNLRn7RO/N9ptbLe1CF3Yzl1iSQEoUnK+ElOpD+TWe2oWRdt3wUwYoSf6jMob
	9PuWjOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFM-0000000FJdg-2MMu;
	Wed, 10 Dec 2025 10:16:36 +0000
Received: from mail-northeuropeazon11021104.outbound.protection.outlook.com ([52.101.65.104] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFF-0000000FJVD-0r53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjsbINIgLPCByMIySdAV+YgJLkJ1YzEgdEe8vNBusOpjR4WQhPAfrZX27PgBM4YsLSnmtc0Z9g7jQe/ru3WS1IliVZYsdY416dMdyP94CVh/FddYJ+y69gWOkKc/ABySwPD4uZKrTLgRaPfPoNG942GGxyZXaNLs+kutRHAVnjfdZKnosWw4xu2pQ49l5Y+l46G9spaZPTluAQSid5SnWVNWiE2+/YnebooYvk7geNyLzLiEkmqtRWu53hj9SpulXf7K/ewZyuWq32dAANqjzp+HlOF7cv0LV+dtEbIEBozqBTfs6Zlj5M/GrR6JI+6f5EcmL2VzG8wwWP3Hah92Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kla48VDQaXoq44k8Gp1jJDMLbDayWVkeuVZylDDSmFI=;
 b=OR7iS+GZ7fG2mOmj1oqC/mfV7S5R4mQYUT8RLe6rGfAlcsPNnObNztW9Bj2JdaZLqH8xiX0E1NcOpKerJOrGmIE/067YWUn/ByTu/OqljbHWLk7ZnYZHY5joKkd635/fQL05gxzxJT8ekaqJKMuoXeczG2G2lcaFv3o0u85EKl7vwhoXpLTxuG281UqN14kxRP/k60hgm+YM4wsGIpKNYcSHD0fxovlJzbXbejm/29TUvxNz8w65raPMffb/XjJ+NVBJQk6f+OqdYUVR1yl25TKBKYS139RSuQWHkPw/5RpASgMYWMLkuGF/WA47aExEfmJ1kaVDDVhZCocdm92Mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kla48VDQaXoq44k8Gp1jJDMLbDayWVkeuVZylDDSmFI=;
 b=zunComIIOZcM+4DIi4g6oGsQYDRUR6TIFiXy2hwljjhUnY042JKK2dnUCFwiYK/LxCqsTEQsvafAHdulORL3xFESqE/c8I1ODRIiBdP2bDZ9z0hhpiLRLCx+hlTSri3A2OpF1e2fUOI0JVaikKgvz6ITSPQqaFdPiRDW0blz9eE=
Received: from DB9PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::7) by VI0P195MB2874.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2ae::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 10:16:23 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::2b) by DB9PR01CA0002.outlook.office365.com
 (2603:10a6:10:1d8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 10:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:23 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:16 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161690-320 ;
          Wed, 10 Dec 2025 11:16:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 11/11] ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces
Date: Wed, 10 Dec 2025 11:16:11 +0100
Message-ID: <20251210101611.27008-12-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:16,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:17
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|VI0P195MB2874:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e77d64f-aa87-4537-8db3-08de37d52ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3beaL4GmcpAgf3TTZbY/YE53J2uu5lMH0XVq4woMx28sJdwRUfFkQZjjRhXk?=
 =?us-ascii?Q?epqmgLtcszMcs1ht43UwEp76KSVmoPp0zqQ9n+1OPsjPPeFrvDUsanoVeR6v?=
 =?us-ascii?Q?1/V8oksQryR9sjQjtm9btJnYZJ9L2I4nxJ+aoGEdBX1UZnJEQbu7QKHBDpiH?=
 =?us-ascii?Q?JvDyH15aJEqLs5UONA8Ol7qaRwUwpfW7hAfKsN6oZMlUnCHG223O2IWywAQJ?=
 =?us-ascii?Q?5LGQKhxzaarbHY6gYIkQLvbx9bUSlJIIIBrIuofAO0mCyfKWbJek9gBbZkxL?=
 =?us-ascii?Q?HjHJ6w/HoWWGu94v2tOtOdrOC6zpvDB5sn8XFULVS9XAlrIe3nnEUJRziKh4?=
 =?us-ascii?Q?uPs34eCnuvupzRI70jMfrUaMmzy7eEF60QmhPZ9qQ1imnB7g8JwZRttpxmn1?=
 =?us-ascii?Q?EdkXTEnqk2V1Lw8S6V2f3huQQYe4dO8Tlra6xCi3okrkJmioQShbiMpQFmTs?=
 =?us-ascii?Q?GHa9Q3id2epH0GxZtUo8xOzMuJ1qMg9FpvyegdSsqZbRt8f6txaQmH5pExXj?=
 =?us-ascii?Q?4KmkdIOitecJLfPegb/rME11wD1tmCq9HeJAkLCmeEnltZ4BEaaYlEIuHYx9?=
 =?us-ascii?Q?Q9h3E94NJK6JG5/mlZUi1nFRIx4HD/dJmvgApIVX08AjvH22U2nvHPX0npaK?=
 =?us-ascii?Q?S0phgS3pGhCqLu1dn/zhzc3SVUmOh8CRezbPAuqT8PAwdhiA0qIh6+EPyDX8?=
 =?us-ascii?Q?AaxI80HhRq2Ys175MH0jwpZ1o1gSkBeOd0pG2SiJOx7vKthBpew1AGj5Z4eq?=
 =?us-ascii?Q?Axu96gubdhuU5MGWpUHpP1cs5hLcToDuHeFwUBUC68Yt3ZBe1uQ4ymiynqUP?=
 =?us-ascii?Q?H8krJxUOPUHZQM4+PbX6jjM/W0SRXigIGL1z0Ib2H7M2xHc0pdgl0xKw5o8D?=
 =?us-ascii?Q?rQMToqrl8cmXwcCNEQDTxwRlA9mfH8AVrsJFWni6w1OblcqJmEluytv/tRxs?=
 =?us-ascii?Q?eMM0+Pu5qaYjKgIbWT3zhKHTdZKQ2OdY+yS2B3ydFySpPiiCJgu5im3SaL9D?=
 =?us-ascii?Q?+N+EbrP/SwIu1FklrezAlaczCkRHdujNfyIkOgRiPqxfbbNLCUrb+vYNyq1f?=
 =?us-ascii?Q?9xbaqBaFpuy2LRoPVfU2R9oMDN37gSaikgLLNtfyRjwJnPrPM6X/uLdgxU7T?=
 =?us-ascii?Q?NavLL0zWyYPYA8ZFmavY5Xyv/RGWtpfkb1MhzKLUnKGlkTERBMr23owE5AzL?=
 =?us-ascii?Q?saNCRB1rvjMCmkbSWOlX61JwIkCNgO3w0KMBE4EITgnMKzchFrynGxm0K+yG?=
 =?us-ascii?Q?/Wp/9UQ0dPuXWvcD6LyCzIGQvdORivHkYDlMUBFyFPe0/6NcKD2SN9220062?=
 =?us-ascii?Q?E2KO0Prou3BWeETsKwA1EI2GBgwHXv/GdHhyqdIS7rHyyuSwn/6ILTPfpE8B?=
 =?us-ascii?Q?Hd63lNKeJTALURJmXz/7qE7ZA9mGyjd41c4hizmtoywLCZuK4bDuRhZZxi48?=
 =?us-ascii?Q?TcL22OF16RLGejQU/2rsHaamy2MSNQPcIF37TWR2KjC7MXTI8pr3+ET4oWG6?=
 =?us-ascii?Q?wxVbDoUC7u4aTBwkc7NawHMg6cJvt/7xHaP18TDreWSuhKqtqXOQQ0nk9Bcu?=
 =?us-ascii?Q?nUvcTJzMmiD28NuOIoY=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:23.2145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e77d64f-aa87-4537-8db3-08de37d52ba3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021629_275445_1B7B7089 
X-CRM114-Status: GOOD (  10.19  )
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

- stm32mp15xx-phycore-som: add NAND device on FMC interface to support
the SoM version equipped with NAND flash instead of eMMC.

- stm32mp15xx-phyboard-sargas: define pinctrl for PWM5, LTDC and DCMI
interfaces used on phyBOARD-Sargas. Those interfaces are not enabled by
default as PHYTEC displays and PHYTEC cameras are enabled and configured
throught device tree overlays.
PWM5 is used for LCD backlight command.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 23 +++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 16 +++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/a=
rm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 20684b497c99..28a21dec9cd7 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -260,3 +260,26 @@ &usbphyc=5Fport0 {
 &usbphyc=5Fport1 {
 	phy-supply =3D <&vdd=5Fusb>;
 };
+
+&timers5 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm5: pwm {
+		pinctrl-names =3D "default", "sleep";
+		pinctrl-0 =3D <&pwm5=5Fpins=5Fc>;
+		pinctrl-1 =3D <&pwm5=5Fsleep=5Fpins=5Fc>;
+	};
+};
+
+&ltdc {
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&ltdc=5Fpins=5Ff>;
+	pinctrl-1 =3D <&ltdc=5Fsleep=5Fpins=5Ff>;
+};
+
+&dcmi {
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&dcmi=5Fpins=5Fd>;
+	pinctrl-1 =3D <&dcmi=5Fsleep=5Fpins=5Fd>;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-phycore-som.dtsi
index 0689967b8c56..23db635c39a1 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -345,3 +345,19 @@ &sdmmc2 {
 	st,neg-edge;
 	status =3D "disabled";
 };
+
+&fmc {
+	pinctrl-names =3D "default", "sleep";
+	pinctrl-0 =3D <&fmc=5Fpins=5Fa>;
+	pinctrl-1 =3D <&fmc=5Fsleep=5Fpins=5Fa>;
+	status =3D "disabled";
+
+	nand-controller@4,0 {
+		nand0: nand@0 {
+			reg =3D <0>;
+			nand-on-flash-bbt;
+			nand-ecc-strength =3D <4>;
+			nand-ecc-step-size =3D <512>;
+		};
+	};
+};
--=20
2.34.1


