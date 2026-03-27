Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B388E10F2868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkGH12uo304r4vo29sXvLbJT1YloeEpsZSg3SvudV3E=; b=mm5V4NXt1DhSMUTBzoQUjGM82M
	oYpQh4bRLcBjtoL4yINBwFoK4U0A2OGvf4ybbIRhRGxjlUp7zqlumSCZLy6Gl84BjyQgjvwLHvrRu
	l2MnASFXJSSmgQMeLr8M9PjZrrZ7Xk2EyOQ4jlFISkgPuI0oqsxzYonVN+hX1uzb6UjszlSlt//jB
	PW/dytuSIRrv6zbM/Duz+o6VoKTklSLtZMA4vRBklqDamf76mO7mCOE921w7blMeDFKHJzANVgV+e
	VJw6SYY+a+sl17q+t9x1dwIzDHAP/Y3up4JcKhRt+8zfOwRdRIDuKgwQF0EuK7jc1guwiMUYRg4Nv
	58Qu90eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CG3-00000007zb7-1vEz;
	Fri, 27 Mar 2026 18:50:11 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CF7-00000007yG7-1BMj;
	Fri, 27 Mar 2026 18:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjYRxWun0niFNf/6en5Lz8A/mpEy8YfelrKJ6g3P8difQX71Yq3714PbXfxnGxbpp4SghD6NN2WJ5FLJ7G9yT04Ojv07KoAyohZDFfoaJ79EL9O8MuFNas1x/BQ+Cngh8Bfw4z2I9QznZmNUrwAblHJM/+cXYHfuKWQHC9VvASQNXYl8QFyAU/YqybnQzHV8NBwkaqEEP7mUJIKTLBuSopg5rV4jalyFisfSV8m9jlyPGEU8iZHWesJC/ZoBfxYsFhCPBi3jvnlcj8bSHAtq6HZIu6vKAVFsPHFIl2IXtV5EeFLj++2L2fPH2QXgNa8rPbfIn/nQm62Gb2sAmptONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkGH12uo304r4vo29sXvLbJT1YloeEpsZSg3SvudV3E=;
 b=MvtEyUzr7mgvvR+sS+iBRdRe9159ge1YaP4/eySNbGNO4th1I6ZurVU6vkN+U6mwaj+C2veZYHd/oXRJIVRWm1b3n3UkScvZ6cIhqefVsP/n8t37RXeHVn61LAJe3zWuF6/BJ7O+OWWChvCw2MUYuXB1jJ7SAuHGatRVD8vandflrjJoBgrEpf8ONBDl3veEXD+ysEDRTcYPnLSjpozFAb3vc4lBe4TvAfeyEQhvhgSIhazTQ/EA4nB/wCyrRsWXfdnjjFzXYbWoKYEWhJ6n1puuvFdOZpcGIzcWw5TIR6CTkLN6+ZPoi6f7UQt6nwtum37CI8YRDP5+N9zixbf1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkGH12uo304r4vo29sXvLbJT1YloeEpsZSg3SvudV3E=;
 b=Cc4Asdn3gPan/gogkJibmGG9PaPVYQwcT7w3b6N7tdbfD7RK3yCROLdX7lBRHWm2rCIcO5ikumeb0a7S9OwfKQy5xO2Xo7yQikcNdeX87WRb+49xrpErGVE4sav678cFoR+9ze7vCCzFwKefibE2JohzBVYUuE2vP8nilCbM1Viae26yAb5ZOaHLJoRY5Y0FJW1JXJ797UIcJWVcjGShtrLbZaCdNrNPHb7fucY1m9ikabTL/Gr+dVfeXWHE4hp0FD5551cY+cWy/LNFRPctSsK2hh25G4P9LUlEf03Zzkw2V09VI3XkHnH+hdadsWFn0IoHzdgCUxjX0eiKJY1g3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:49:03 +0000
Received: from DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d]) by DU2PR04MB8584.eurprd04.prod.outlook.com
 ([fe80::3f9d:4a01:f53c:952d%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:49:03 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	JC Kuo <jckuo@nvidia.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 phy-next 14/28] usb: gadget: tegra-xudc: avoid direct dereference of phy->dev.of_node
Date: Fri, 27 Mar 2026 20:46:52 +0200
Message-ID: <20260327184706.1600329-15-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::38) To DU2PR04MB8584.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0d1e12-505d-4571-678e-08de8c3183ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r6h1IEjdNqfbjv2JWAk2x7G2DSIWIQxpBI+Ud8DBGBz1xb7vRIB5fzZClPhzMCvl2A/VK22rKI11V9dl9SZZXjRUjYCCwDHqC8YA/x/OvkfsDdejWWORe2F27SnKG0UMyyl6gV2/DsE8XDcCeri5CG82YA3M2GCEMEuUdmZ3tU8MoUeV0DSGPNwM2AYi5QrsjrX/WCszJFKJQcvN112p+QHmbjVLpuKmWSRjNqNKRvdlm/VcL/hMAcydGOI/112GG9TOMqgN0BCqmjvzs61Q1DiOPKCSeCdXM5J7TauOZ+3I6+bJvR1PmvVcSX3jZMJGuSf7OKm4mjA7BkgV/OrKYToBqiEq6FRv8Tj9eibgSLE5SC7nprGbEyn4742dDWNKsw4nrmD/ySaUz003FIRhvnN7YYS4S607IF8Er3PU0le+m3R7tJ3YnV54maai1zfnNlQM+sp8XJ+iz27098TC02Kn0CeR0GsGQIAKJMeL5ki/maYcHwBKyqSuapthvZ5lv1ljFwWxCV0/mIfApAu7QKPawy1L4A8j9uAivRnLpfbOaTY6IsU8cpADmESWlKiXpbQ518MK9397hWRds58gqdySb+3vFluXND7ccpsSHHF/SGKc0STgDTkqPM6j9vYnFDI9aB4W48DlNNia1HTPUfGYxXMbexhlwaAkw4A7b1NXYX83q2NHMRw5pYphKQzCGb+CiX+kbi1lcsn5G6tBEFujtLik55Ijg5AsVhG/6F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8584.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YeIfrv1QqqaOtFRQmjr8CHM6v3ihISxHvtzn2/1IYJp/PkxXdFvQpNmNkLUA?=
 =?us-ascii?Q?k41tK/HDOr7kB3wSaee1lhh8pTLQAmytov513ZVtB+s/L7i+9kV2ZsCJ+5AX?=
 =?us-ascii?Q?qXerXVw+MmfIXCXsOvSJ4Uw6Aij2ofIWL4jk2sslGAChem6NO8Qm0O50YVco?=
 =?us-ascii?Q?Mkdmqy8t+sIhAqtK1s8yNJ1ZlgUk95BBMGnWVNatoGCRmIqpbfeNjB+H5iD2?=
 =?us-ascii?Q?0BzRPCC1L3A3e0V8tE46r/sUWKLfKOo5sBwOkTzmDooxjb6XTy4yEPI8RzoM?=
 =?us-ascii?Q?BMT5H4nPO8MHH8IKCaoBqvtyglHXtw6axdb62GHDJsOG+R1lPLHvLFzVjaRQ?=
 =?us-ascii?Q?/JD/1cCb3xatk/ngbJRbTvLZzrvdh3PTZS8Fngm+6gJCwJU0ke75NHIEgoqh?=
 =?us-ascii?Q?3EZh9J/4ILiSBJWwLA2iOm9frbQOrEm/Kf2GrKAwNnQuxHoeepEHSzNS0V2i?=
 =?us-ascii?Q?HROJYs4mHm8iIboyHxS4F0slUKvTE2PFx3Rrm9thce/nal6FyFSMr2YLx6AK?=
 =?us-ascii?Q?9HoMSH2jZxQ1Fcv7qk7eZyOFJhcqzmDjzEzivRd37QFZ3GtMt++mw83Cip64?=
 =?us-ascii?Q?INec4BvhcyADjLfjFXP8+G4Yb7IXJ0jwV0sUBv8ovHT9nFSqXvY43TEZyGVo?=
 =?us-ascii?Q?NDRZA//YWhIIoewu6FzlO7LfMhQiD9mQX1WIusN1rXU+7sSVcadkIv0UVCDt?=
 =?us-ascii?Q?cP6bKiKktH7Qh1BR0jJVZX/WLeV8ewHhKRlxTjwG8JzBq6oQjlk8lOxEp6oU?=
 =?us-ascii?Q?HuVlYmiLBFBrhgmGrG6fG3yv1PScBJwGIWHFMLGke/gXtzkbLr4EucQKdbgR?=
 =?us-ascii?Q?y6zT8xchsgtC9dbd7xzyD25ESifdIxIIq41wjUqFzkVnu7b/l+wLkbFceh71?=
 =?us-ascii?Q?KAJcY/5b1/GEBcr/pz1uAoawyVNbp3O7BQhdd8MRYbVVtCJwskpJ6Od0w+9K?=
 =?us-ascii?Q?0L/baYeZmOX/SvDsicCxoQvh/tE3stWn3AO6lLBFRjWCQPxFYP31qHZc2mLK?=
 =?us-ascii?Q?9PKYAR3Sbn0v2i0QKqZpE1Hi0/v0W+7PgbMpwso0wPkEWq7Ih1PSuDGKxiu0?=
 =?us-ascii?Q?bRQdfswWSWJh0nSr0KDRPRouWv89osCrhYSd2Cwn6ofhGWndw9hZOIMKHBpk?=
 =?us-ascii?Q?fc9xXEhBrld2DPG7F9J6G0ZhxiCwBwfA5KyVVrWUqP3h1nqj+a1+q1pVgvDi?=
 =?us-ascii?Q?iRMtF8SwXEDdqIeCOj32FoOBoyDFQ6/DdvxuIG76yKw2TO7vLLsdZsHNTegV?=
 =?us-ascii?Q?gdgSRr3bxN4759LwjqhPNQuBaSnIwH7NNRZ5Hp/0tospM+Qz+fKHz8H+W/KK?=
 =?us-ascii?Q?d7UQbZtd4lxFqmf/j5eNDq4QF/wvmzS72MdI27/nAJ2RuLHGq9mLRtMR5fGz?=
 =?us-ascii?Q?m5uAI6TVUp1XxoIBZW4OAvkGkj7skDsyWCU88k8Bb+aDhNY4TFs5GBNLEPdt?=
 =?us-ascii?Q?5mCrorU2AA8wNPX5jn7OoX+PEu4khxxvxtXRXb4RLNfKUWwBkKs59VRfhca6?=
 =?us-ascii?Q?FS+1oFYn4xqAt9ETz9GrZFLJakVOD9s1mxS0MwAbB76wSOIBAIEKJ/KUDcnF?=
 =?us-ascii?Q?eLsVQPZ091j14gr2yohAHZ9lu76s7vg5xUWsFmgJw3Dehs7rOHW1BoEbX4VR?=
 =?us-ascii?Q?y9FLhp9RIdxLM9N2Tqlys4HXIEUVrLtPUZ6T57oQ9GVA9IkwVosJ3Nq1aqyW?=
 =?us-ascii?Q?lkHzDrNRWJp2LWl6PZQdfu4oBNdkbhbNInoEXpjrv/XzyKKmV2aOhY7kT7nV?=
 =?us-ascii?Q?Rj/CMcGCPiIEgHp+oyIR7mHF5H1HwY/IuK3EofeM+35PFiM0uYowRlXDbLpN?=
X-MS-Exchange-AntiSpam-MessageData-1: ieyNC1udSNsdUcgAJ42f+DMBgFcMJ5EWwcM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0d1e12-505d-4571-678e-08de8c3183ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8584.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:49:02.9998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2agizCjun8Bvo0jLa7Kq8/E6JfW/VcQX8LTCFOWSWwnBDDXUtMxGWaJhx02Pn2AXNtLkr1bzIynycHSG2zTcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114913_443960_DB873E6F 
X-CRM114-Status: GOOD (  19.32  )
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

In a somewhat similar situation as the Tegra USB host controller driver,
the Tegra XUDC driver for USB gadget mode needs to get to a struct
usb_phy that sits behind the same OF node as the Generic PHY. It does
that directly, which will no longer be possible. The PHY provider is
also the xusb padctl driver.

The rework here is also to implement a parallel OF node lookup path
based on the "phys" phandle and the #phy-cells of the padctl provider.

Some further notes:
- create a local "usbphy" variable to hold the devm_usb_get_phy_by_node()
  output. This makes the error checks more obvious (avoids keeping an
  error-encoded pointer in xudc->usbphy[i] even temporarily).
- the "if (IS_ERR(utmi_phy)) .. else if (utmi_phy) .. else if (!utmi_phy)"
  pattern can be simplified, considering that neither the IS_ERR() nor
  the NULL case continue execution in the current block. Therefore, we
  can move the case where the "utmi_phy" is a valid pointer outside the
  "if" checks, and this reduces the code indentation level.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: JC Kuo <jckuo@nvidia.com>
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>

v5->v6: none
v4->v5: patch is new
---
 drivers/usb/gadget/udc/tegra-xudc.c | 35 ++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..cf4e6c87e44d 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3494,6 +3494,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 
 static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 {
+	struct device_node *np = dev_of_node(xudc->dev);
 	int err = 0, usb3_companion_port;
 	unsigned int i, j;
 
@@ -3515,7 +3516,10 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notify;
 
 	for (i = 0; i < xudc->soc->num_phys; i++) {
+		struct of_phandle_args args;
 		char phy_name[] = "usb.-.";
+		struct usb_phy *usbphy;
+		int index, err;
 
 		/* Get USB2 phy */
 		snprintf(phy_name, sizeof(phy_name), "usb2-%d", i);
@@ -3525,22 +3529,31 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 			dev_err_probe(xudc->dev, err,
 				"failed to get PHY for phy-name usb2-%d\n", i);
 			goto clean_up;
-		} else if (xudc->utmi_phy[i]) {
-			/* Get usb-phy, if utmi phy is available */
-			xudc->usbphy[i] = devm_usb_get_phy_by_node(xudc->dev,
-						xudc->utmi_phy[i]->dev.of_node,
-						NULL);
-			if (IS_ERR(xudc->usbphy[i])) {
-				err = PTR_ERR(xudc->usbphy[i]);
-				dev_err_probe(xudc->dev, err,
-					      "failed to get usbphy-%d\n", i);
-				goto clean_up;
-			}
 		} else if (!xudc->utmi_phy[i]) {
 			/* if utmi phy is not available, ignore USB3 phy get */
 			continue;
 		}
 
+		index = of_property_match_string(np, "phy-names", phy_name);
+		if (index < 0)
+			continue;
+
+		err = of_parse_phandle_with_args(np, "phys", "#phy-cells",
+						 index, &args);
+		if (err)
+			continue;
+
+		/* Get usb-phy, if utmi phy is available */
+		usbphy = devm_usb_get_phy_by_node(xudc->dev, args.np, NULL);
+		of_node_put(args.np);
+		if (IS_ERR(usbphy)) {
+			err = PTR_ERR(usbphy);
+			dev_err_probe(xudc->dev, err,
+				      "failed to get usbphy-%d\n", i);
+			goto clean_up;
+		}
+		xudc->usbphy[i] = usbphy;
+
 		/* Get USB3 phy */
 		usb3_companion_port = tegra_xusb_padctl_get_usb3_companion(xudc->padctl, i);
 		if (usb3_companion_port < 0)
-- 
2.43.0


