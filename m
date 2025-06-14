Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E120C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q78OT8fm+ifRRsyfm9wiEB7/jrovv156VhuBxqexZiM=; b=0wGp2RsoNdKf2GvdvC+egd64S1
	z/9zdfAk/F4N4n8qrD3RDmatEk0BOfD1mBEuTdz76fgF4yd9ONBQ9WvQ7igiO3yBH6yj1/+T5XqSG
	ae/rIFXXljrkY7iVWof05h6Wntw6IE4lhEMGGRUygMDsl027HQKXxZl+M6kMqyS0njrYu8Tq6ZTnf
	/oakojsLKPw6GVJRpxWlhRDYDIZ5xVYOn4KY+QHyAuiNdtZoWCYsOVmgOVtHiOrB1vMr17tVRmDeN
	fWhntIDZ+biFGW1OV3A2kpqWGGZrxsDHmXz1sOAfgV84mlMspEnqsT6OUXCZfG1qvg54q/mUrjJfU
	TujOuvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQVs-00000001Hdq-0531;
	Sat, 14 Jun 2025 13:01:36 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQPB-00000001HFD-0iqo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 12:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO9i94lloL2jYOjia3/KP8NTu+QWc1cXwe5NasKiCHJbh7BH+W0ngj1bXdUicEa67HkFhgBCeCO0ni085ef7biSjCdlp1RAZ92aDe2oaTmLtPuQAFcxwDAULn1eWsvf4FlUCbzG77HrBd6iPpxXwkQ8bSqu9OkeRs/qt3C1fXr/3j0sFDhqrq+COLBxhLcrsBBv4PW17utw7q0cCKYgwdhuDcJDTApJjpJ2HoHXshlXRCVmoLXKIJPY2U2vV/C5re6lGAHOzC/2KmobD86k+RtK2VZgmBQbszMngs0xkTVqmn7PrFlERGMZyBwFzo254IUjZS1PgESxCdrmPQ9OXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q78OT8fm+ifRRsyfm9wiEB7/jrovv156VhuBxqexZiM=;
 b=GKwfoguAbGYyW4SSExA2i0kOlE29fZV6BVH9F0tFI6MkM/Ogb5rE+8r0ggxYT9Gkq8baTD+RsaASx2QQmrTCl+RuKzuc9QBXS2/wFrNMbjkvSsMk3oKJ7k68+oE+owQz3zvw8ISyJim2xowI88FX+fOehchxO/lT9LCbWUTpGXfSovdBTn90rdAZSJMg1ufjq2swJFW+HaIfcWInXnydG1rrk9oe9Idv9cS+EMHtBP68y+Cg7F12LZTxN+MY0iWMApcd43gSVMLbRTu3BBoqJkr+SfDvD/G5QGGCGwshlooyi1Py3zaZ+uTMrMR1QqU+hlEnDb6EgOQjs5VY6IroEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q78OT8fm+ifRRsyfm9wiEB7/jrovv156VhuBxqexZiM=;
 b=PND+rT13HIEpS7krruCUdfogcuBdPj8yQxNTDADeUQ3vin8VermAymvA9QULK6mVHvlky1ojGWxSu6fbEMgCyyxYcsN+aISTw6RwQAtEd2TtjrRWsCTDTd6O5APqK9suIBHfq4R4IKp/pV180udhZd12Oe5o8qT34d6g/wVERQFdQLhET3uyHyInuptsfUrQSt516S2iqmEVCIq9L2xM4RDG1QbE60bXgrgejPc9PvRRh1TYQ6MBMcBIxWM0CebZWl/o7ibzYBpGobEJut3CZxccOWKU8zAtr977AnZtokil8CGYLLt3VboHbYCayFQIuj1HtICb/QXFS6agyD/ylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:37 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] usb: chipidea: imx: add imx_usbmisc_pullup() hook
Date: Sat, 14 Jun 2025 20:56:44 +0800
Message-Id: <20250614125645.207732-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 99dc810b-a117-44ad-b4b7-08ddab429e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o/BAPsX0yYuwsfF1cQWSyBTiowlkaUoqO/X/ZOI3TCQCuG0zuvOCSoMeMzf4?=
 =?us-ascii?Q?ImF1hmNZJdKJei1vFnzT+PBTXqrPvavLGeR/4gscplMT6k77W4ElYrTHlpYz?=
 =?us-ascii?Q?hnuwqx+IqkNo6Ymsu/aZsn6zv9dvkHdcJb4h++rzEVmDwDehVjSwIebILK7p?=
 =?us-ascii?Q?asOBquypUVHyBE69lh8Km7nMJfMywwU+c9LPGDO1Xt1SX5qtbAGSINcRgC0A?=
 =?us-ascii?Q?F2umtzDrPU/oEUOk+VY9PjODnKUrwxi3k+ovzVL47HLlnJLEzZhwEMIUnSAt?=
 =?us-ascii?Q?GKcckBrSVTLOsUViGrYTge6nc/780KzDVG3tRuDTBLbmCC7PN8r1o+RNOB7R?=
 =?us-ascii?Q?VfZ9kAISQyk/qRBgClr6Ey0eGe09p//m7x5QdfOsaY+poYJp7s6VOvh9q3DK?=
 =?us-ascii?Q?7onq1FdPrdR0OBflCXr24a3dTQrCrsDsqeuF3I5rQ5XuAt2Yg60hci3lH5Rd?=
 =?us-ascii?Q?uW3/BU5LnXi9bii3uq54Xb6t5dORao3wSuNxywpgX3G41QZFtZXIftFvIoOy?=
 =?us-ascii?Q?f1Tdc3ZGsb38QvinYKS/M1+YTAKlwqkSmJWdUTfzzIMWCMbNCL99hZ6ZxzQz?=
 =?us-ascii?Q?8lMGMD8uqVXL9c24jyWrsXTPI4l1TaEB7ajAQGre7X+E2srDZF8vVnOVGpPU?=
 =?us-ascii?Q?4rCCgbOWJA6C2CTMl5WxQCwcDINCGlU7C1NUul9rBHspIjI6ITrb3qGHKQam?=
 =?us-ascii?Q?Bg0lobkL3p4+kDqeUSdEDOy6BKzKYBCeJJ5BjC5yDS6qQnxH50lrSQcuamIH?=
 =?us-ascii?Q?MYBVR9OWok0rfIPCCgtMzJmc5m9YCJrDkBn+KMTCSdggZdNsJd9qV7HYKe1Y?=
 =?us-ascii?Q?BJafGBvikroQmk/FGm7MSWI27YQ7ylw3mZxuvsv5Z6dFwecckx70oaLbNsvA?=
 =?us-ascii?Q?7XDVq8xOa+m37mqSZnG/aFBc741D8RtBPOm/m6E4LbXD7YCRPCoScfziogvU?=
 =?us-ascii?Q?MZi2grbInzLeS07aaJOrj7PqKir+bvP4YT/qo8JTwY27mNZXJO0JioYnEGN3?=
 =?us-ascii?Q?FVsNoDlXdiaR3lHUyYby9fmNKfu0/+1cuLGMSYMJsXMkHqGC/oAyOCAWmNmW?=
 =?us-ascii?Q?keOOcR/Xh2Kwq2QHeR4wa+yt8L4EBOVZKk8MHK+CfcIAJWICdZF4PbqOHIlL?=
 =?us-ascii?Q?3p6pTi2ln6EZxnQxDG/7eSXwTsyWvUldiMV+px1RUn0ansLicF/MDxsZhw+n?=
 =?us-ascii?Q?aK3qU+80DsANuN6iwKn4wWrHQzLfeIwd/8eYg/4FttYFw/ZdipUK5CLLMlgq?=
 =?us-ascii?Q?uE96iKDe2AhQk4FXpVsauxP6saOLsewgCFjByLTczUQQOo+7PEPrl322IQ20?=
 =?us-ascii?Q?IpxO4IQpmI6VCnBZo9XU7sK2fazTjBzF70622E5VPwKfSSHlc01Cgq60NjQl?=
 =?us-ascii?Q?Wb1WnLbjv98k5ImOjorKB2D9NsIYBdvWzUZaEDDEk3n55aVLKn4XpEN/Rso9?=
 =?us-ascii?Q?2i9pJKdaDoC4D7TKgGvtl2XPVw3EzbMxJGsnHeGiRAvAKhyS4TMHNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/5Nn3buH3PPbe/1UjI7AMPpEhSEFchkCZQuZjsjOtVtaINtw+md6XbGQI2G?=
 =?us-ascii?Q?qgnEU1V00WyNTSflp9hJqvOtgYgr65mJpjbDohKB/5luQSpPLjJz56CSyTMx?=
 =?us-ascii?Q?cnjUGBBQgKKsf99CXUgQX9DkY71ZUlAcr83Nj78hlE72rVBPHLtZo5i5km1t?=
 =?us-ascii?Q?k4YBCsoco3AhXPjAEpyl/KBGEHj4DnoeJfZr1YIfZOHSZj7gFD8eSSzEa9mD?=
 =?us-ascii?Q?EmY/POaVJD9axVmGFxVpftsncE2h4eHPnqt/QxNtgVQTOybdUL/050sf0gt+?=
 =?us-ascii?Q?QpDjg2K6/qiNXxCGsd0VOKpeqmftYdb1oop4BBJkHWQWehik6dve5ACEYwxX?=
 =?us-ascii?Q?PjiGXOlGG0zlPTTc1ZRswcVU3LNtOM6JE368J6alXi7BlIlJqDDtUEHENR5q?=
 =?us-ascii?Q?FH7vc2DCMaYFpYxjbrpznsPWKkhZh/7uw7V3qFnw4tG5t7CHoQLdgeYWl/d8?=
 =?us-ascii?Q?4EsoiX/tzXAoTpJgYmscLHCo06YByA/D/NtiUSPYQgMJCUwV6yZ+JJjuzkZM?=
 =?us-ascii?Q?5Rm0H69thKpXADBHdFl3nMF5jxc0lFPHOgbTBKuPfA48Yfe7/BMBqPmIPOTH?=
 =?us-ascii?Q?ntBHojJDC7AqDjEYe0OPwvxEKvGDkLyxLH67AQAiEcZSvKLR7iEaUEBpPPlh?=
 =?us-ascii?Q?mgByswl6lWoQsdAcNWjXiUUXlpjlBATT0TwY3IxkpVx+qPXtG3YXL6TpHqt2?=
 =?us-ascii?Q?XexhW3GdabmiW7EzoKswTlkBclduLY0yg02brYejOxkP/1pRiQbdY5VG86KY?=
 =?us-ascii?Q?Y0Cm0hIbD/mVGOB+UaaO+kGWVTqBusK15HeknrqCXvGgHz46IaDlnc0kMSQb?=
 =?us-ascii?Q?KjyWx3MoZKoxmDx66a88WUu/U+tl21Ic+NEBcqhX57rd4D7r9meRmuxB0CdM?=
 =?us-ascii?Q?ncqd6txIKVEJ2HB0orWuS2JxapBvxl9cgd56wJe9ONIIPGQJCPqQumbmBX+r?=
 =?us-ascii?Q?h+KNFpoWZuTNmkgKo8aBbD3dGjNC1mIwuecn1uXmNjitWva5IZesYtT7IAqU?=
 =?us-ascii?Q?0QPIIlHYZ6aPhJeSOXGnJ5dsVEykRI0BHTRMA5Yf7/sAPpUk8LQSla4D/hWA?=
 =?us-ascii?Q?t5xALUoR2LMpcagpmwJWwLEHK8nXOpEvBiF1j4UpSc+7zHFA10U22Wi8BogT?=
 =?us-ascii?Q?Y7KjX8rzXuK///UFhOc68qA0kK/xjiB5QjnhjpMOYLqf8E1beQtBpHA/Luwv?=
 =?us-ascii?Q?Y537nJeN0LmzL3fjAprzu22vLz1NQcQufSh0GupTxPvJU4DdXgeTKhNFtAJl?=
 =?us-ascii?Q?uD0sP4oMHVfFrwjjMkT014zZ0ckyFz1Ww/UYzMID9WhUfe5tu5MnhuOjqeY6?=
 =?us-ascii?Q?zuhjwNMcJUWJqcndfJ6Hz898WQ+8dH8GVKv9OUoZblyBf4fiz11RJhAzPFO3?=
 =?us-ascii?Q?rURb/eZIQ6T3aWZJPnjVGDUEaCU390KxbwSyc9cHpg9LlJq6pPOWjjUHPTUn?=
 =?us-ascii?Q?/vz6IltEnyE8nEbvoflUEM8ynRAtSul++VR2XURdNcBR7fWHmWIDLMJqW7G6?=
 =?us-ascii?Q?PzFdUDRqfrYCxlrVZ4dFavbHlntWtf5YOvWD2J1Fv6fRDJQXfjvcxA4L1FsX?=
 =?us-ascii?Q?IhQp+LwkyeVajN8ajtnaBWrau6nAZz/7cPWqO5VU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dc810b-a117-44ad-b4b7-08ddab429e6f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:37.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYthUV2ToYFWfkAY/vHcOKaGBKdyhD+VjXg7IxT5W50GQeyWLXDybIUDA/cWtkYVprnIySQ4AxY1wCYvPorJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_055441_214692_F5710768 
X-CRM114-Status: GOOD (  10.58  )
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

It's used to do other pullup related operations if needs.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 88b8da79d518..cb95c84d0322 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -37,5 +37,6 @@ int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
 int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
 int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup);
 int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup);
+int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on);
 
 #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..9db67d6d0ec4 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -170,6 +170,9 @@ struct usbmisc_ops {
 	int (*charger_detection)(struct imx_usbmisc_data *data);
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
+	/* It's called when device controller changed pullup status */
+	void (*pullup)(struct imx_usbmisc_data *data, bool on);
+	/* It's called during suspend/resume to save power */
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
 };
 
@@ -1225,6 +1228,21 @@ int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
 }
 EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
 
+int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on)
+{
+	struct imx_usbmisc *usbmisc;
+
+	if (!data)
+		return 0;
+
+	usbmisc = dev_get_drvdata(data->dev);
+	if (usbmisc->ops->pullup)
+		usbmisc->ops->pullup(data, on);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_usbmisc_pullup);
+
 int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
 {
 	struct imx_usbmisc *usbmisc;
-- 
2.34.1


