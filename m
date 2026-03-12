Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1159F106703B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sey2GS8FAj5fuTEpteh4lpRwUnRy+reDLNR56VyWfrc=; b=3eQwrraK+HQ4wkyQ73oYtTYbwD
	UVgHUqoHG/rtKsf6GMSGCSzzbcanZWFo80cxx+3aTrUpsZZ8OLC2bG4osFoa85TjqQX2qWOVMkGUB
	snpCuS4phiPZ9ZJtM4y2IATcoGLzgW0TpZGhnr3U8fu0HspW8Arb90v9Um2jCtuX5YmYmIV300qO5
	SR0JMiC+luzSwzhK4Qn/5yMFY0X+meXmbXz+lrjSPdEvd78FjiQQ4vUlYRSAfMfZVplhjSeXOi28j
	JW02Mx21kprw7ZNE68SisD/YzhoUBhvHcf5yJb+gFglhWRajgx/LGt+6O+8xVmGkyTmRSTqt/SNQo
	/eURspJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h0r-0000000ECvI-0504;
	Thu, 12 Mar 2026 14:27:45 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h0m-0000000ECsg-0nS7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0FC6nXL6dwfHToZyx73DhlTglScuWc89hbKwszS7/E9QViiPVFKqG3YqdfpUvv3t6DRW0saJD+ZOrcbrnpVH1TSGPnC8Qr0TTNwxX+eMdepmUaZP03iY8iYDQOBQmZEEgFDc2r9JEwn3akoVdWw8fufZADg4S2NIJc/tSSo1zLBrkDVzySF7jDuxRsiFabXFx6X6ENXT+M9bVltfboyYLvtb/veJeDOCIH8uluoW6Qttf95KH1OcE3nczYoe7QirqdL207lmlQN0EWdSXw+274EgqV98EyxvL/G+98U+1gtVYAyhYu2b0tjQGyS+T09aDHZGwVV5W5xxEYN849tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sey2GS8FAj5fuTEpteh4lpRwUnRy+reDLNR56VyWfrc=;
 b=vT33hMaYXA7LIskUM4kdrd1IAMdDhm2MOclgUn2LXKKa0dCe4yipQ8Pr1/zuHdog+tq9saVRWro3KW0YUyKqr6X+7jdu1BFloV+Ks1Ox+2YQbkLnBkA97I3vpV1ieUR+OuKtelef4ZRvqo/YXmqWxEI0dY+ZRX634LD3ilhrLLhnJlkgcQBo+JVQJOM7Q5Px2VgIu0rVVpg6ntF9x8lUqi3QJIUc/r4ZWQl3HRtsz5VihsBUVddxUQcYhYtwZeSHNaYRXSaH/EtKbDSrru7SeI14IlpyEWFB6n7trGosJZnNr6uMZ9/72BkWu+RAxKIMblIRmhhGC7jqvoW1e4PGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sey2GS8FAj5fuTEpteh4lpRwUnRy+reDLNR56VyWfrc=;
 b=CRs7BoZ7l3DVn1jtDOrU+JGxv02noKEveQPaCQ3QAlZ9Fme5/2a1T8FAUHlzWpLRmUI30I0IaJ80014TKAm3R9c++WzPeecstlxCtDl3Z9cZXg7fyqMHfdLVIxEhBNGlMntH2x6ihaz3m8ADgPXzh/xogC5cxX6aB0NhFCcdVQDzrr9Y1Wp9kstDdK2pXPEJqYb2y7WE6mcJpys0Xfmxf9DgoOQ8xTUHAqvzBSIXuKzy0wllg21RHoMyCaVmTArBHqSaxKMVAaq946sqBNti99BnIayWkhxxavFxDFpP13Li8Eikj7AnvTun9gXYGsxmPiKVPftBxX8GV1eHmmi2yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:27:33 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:27:30 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [RFC PATCH v3 2/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu, 12 Mar 2026 16:43:25 +0200
Message-Id: <20260312144325.1311314-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
References: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::20) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: e7558e16-6505-4e60-e028-08de80437dee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: A4qVU6L89tIKPb5zMzhBRj97V0yr1Zj4VKM/lJKpJ2D+RbcjyhMrVRP82SSymjKYj1o+5RYMs24NkN8GoFPekkV0UrGOn43okx2kD0ebeP2JHOZMQjgU+FljrhYCkdcxZ1mnc857cYh4sOd8Hrtf5zk567D2DOsAuJNVk7ZlY3iKU7rx8Jt6X27lDg/HGGqOyxpth4Xrck5CcrOaOGu8/bN9Ij8TkE4eJendcilp64EkgfPTQjCAZHeuDOvOfqY6GbuJBuJvObU6aW3Qb7XCSUCzGEjJXeSaeOgjd037+TCJDqcdSsS0ICneA5v9xnuHAroXwR51wTHh89PJqjP74w3Dnp4WavbnLPpyxusTuGSebyH88B2ycbDP5URxJ4uhzQfy5NHnyaApRVremeRSgBXoQE4HY3XHBg36D1fUI4znzD+mVFTL7S7jv+jIbjm6xsdh+ufm1AhMNia+EAuD//OLnHWZfQZXgXfPwZ5TVBcPp6w0ekVA8u82OFePuuHft/M5cHXXvaSQJC/RpxU5gSJ6CqOIk1DBpN1cHixVXfbV4RcTVI3fUvvYAPzFQq0aDEd1TjHurDm/cQ3eSsjAjvhSm+ECJjBjxfHRnInLjMrlzfxxGC0ZluymGnGJCUcJ1LL3I0a+yYp8qfJLUr3iVfkYMMPJaXQtJianZ4E2pETd/yreA5gAHjoxwYsbaTwOSB8MQdX4eH8V6vmSIQO1ClNoyblQZUi92iw8swB9x5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ne94gdGaikN8Q++1HqDbDisUzRQON3mYFnFIzgTuofAHlq4/uBoAC4N98T?=
 =?iso-8859-1?Q?ER4fm625X4usChJdCpOoQh+26ZURBY9ArB+zIeGixJ/nloCvh2fwDU6vNl?=
 =?iso-8859-1?Q?H6zbAAAsjupwHXgwE9GHKR7NdtvxksIh/BihM5ufwxDWaLKRCr5pax/ukR?=
 =?iso-8859-1?Q?55uQ+IZJDwxbP1OHhT3/zcvCsNEKwxXO6p6pLstNyBLpljSTG8crNS0M0t?=
 =?iso-8859-1?Q?fZ5pc31X1FBnb6amF7OAt1obhDnVo3ab+Od/6BTGYlR1Qagyd6eVDCGq1w?=
 =?iso-8859-1?Q?6Z/nNjFlqnIwDYRzqxBWXObsSb80N6/WvDL8duk4vBvJOTFHIqCDku2uj/?=
 =?iso-8859-1?Q?S5z23Jr3X0QXHAKnPP/PQup/TAQhmujKPauAugeSehQJGk7FC1l399GAvB?=
 =?iso-8859-1?Q?JMKTGIb2mmxNNH6dztTCoejpz9zQy3W1Ne8ZUjWDVG9aoXsMFknY4n0/vE?=
 =?iso-8859-1?Q?K7UtKaeg21chBBhAuCh6blVYBoG4KkeAoKWp8wcnilPNsx6Vr52nkbfIXc?=
 =?iso-8859-1?Q?hNWQOqwo8xNuSJe9e7TkXy1Z+I4wkpv0xPEqKsNGoT0NmkcWTMfhEX55Dc?=
 =?iso-8859-1?Q?hOtt+mQTxJyI5C+eNiw3HcB3PHMxGGfS4GhlVrU/7EBZR7KByqZsygTe64?=
 =?iso-8859-1?Q?i08P/CEofwOTmFhy3iru8XIkQpCAiBjyKzVdri+peTQU19Ax6+VpON4Hi6?=
 =?iso-8859-1?Q?8eXKlpm2pAapyVxbAuOyLSTAU10pZJG1yDJmBzpX6JtYtxeU9f/yN5CfFM?=
 =?iso-8859-1?Q?Ur2JxE2OSf04Slf+WXXuRwkil4E3Ou+uk0RbSF2ofH5ztoePAzVnLL5vl9?=
 =?iso-8859-1?Q?Mc6rG9U+Fyxq67Y5VCfke9bcTedEbjlNYTKxRMuHjuJqpXXAuCLqbohAwz?=
 =?iso-8859-1?Q?sF5R7nwnbxM7x1KE7sxrDPAwwqg1k7yckwyjRLV8JD6moTmmEYFa2MJCZr?=
 =?iso-8859-1?Q?TNhEF7HofAYAEOOe7fKUceKCf/PgLUUkJr+UrTsJOy4pw/auGlYObqjpTs?=
 =?iso-8859-1?Q?siLF4lsYqX77mkdsK3GwdD7uzn1eRYksrnCcbxnmnrDlY1eLpg/8kHz8RH?=
 =?iso-8859-1?Q?lJRcwjR9vTCUcoun4pg3DLCtbIAn4epUVvJ7aWrs7o8bktzSTUMVhZSDO5?=
 =?iso-8859-1?Q?ShmUJYub66MqDZ42VV2hOnwYDKHIWKV5xGOFgD7cC4C7F9w/Ro2OxOKOFV?=
 =?iso-8859-1?Q?NVqZ/RGAVnGi6vwJiShly8KCFQbSFlq6kMJsGNbWeaNj/AcypKgkCUW45d?=
 =?iso-8859-1?Q?Z60biHhHCapfo4/M5ruSpiY4LhssmyXLwctxrOZ0GqwiyyaxET7oLSe/qf?=
 =?iso-8859-1?Q?3KxygR0Qw7I2i+YL7WWf+nMBAVfXmMzQeYikYBAuzsoAu8eRuaj4Bfw46e?=
 =?iso-8859-1?Q?BuAhtqDnCoNwKmp6Y6GqMAF+Ueg+zBJEmQOwijqcAN5Oesubn3yfQlnrhB?=
 =?iso-8859-1?Q?OyRw6/tNZOt5rd+fEgYPhY0iGWrSnROl7QGLfL1ILUBzPwL4YyF4tSAXFt?=
 =?iso-8859-1?Q?Vcjspv8bGobi6lCKtve/RxcPBvW+bxAqyFZhMeFX4s0A6dT/qGHX/eWv/i?=
 =?iso-8859-1?Q?Nr/WaJFeUxJIoqUXvcRrJsIVNZQ0gM0SGKdVJv4olBRVEMN5LnDZH2gyfd?=
 =?iso-8859-1?Q?bd6Cgdqcsxthi2sLksrEX6KGfpl3mu074cPAduWsGKRuxL2MMAdWxDdtP3?=
 =?iso-8859-1?Q?w/rHvVJHKfjOo/CTfKJrtJO3luGzmJ/d/Ie6hs+kFVmavlTWBqoSI8qVBx?=
 =?iso-8859-1?Q?ck0q7hI9zTKLMGzBkP287bR/Y9juBXS/o6ZapH3krsGcCUCGDc3M01SmKP?=
 =?iso-8859-1?Q?gKAmKBPlpg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7558e16-6505-4e60-e028-08de80437dee
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:27:30.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/XgG5BhI5Z3VsF2D0lpz0zf1sma4LOEKof5nWUiTMbxDCvRr2EQTyLp9BIpvw9XgXYh6r9rLT5mzhe1pKhAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_072740_236706_9A52430D 
X-CRM114-Status: GOOD (  16.83  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Some systems require fans to enter in a defined safe state during system
shutdown or reboot handoff.

Add support for the optional Device Tree property "fan-shutdown-percent"
to configure the shutdown PWM duty cycle per fan output.

If the property is present for a fan channel, the driver converts the
configured percentage value to the corresponding PWM duty cycle and
applies it during driver shutdown.

If the property is not present, the fan state remains unchanged.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..e6719cc9dc10 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -32,6 +32,7 @@
 #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
 #define EMC2305_OPEN_DRAIN		0x0
 #define EMC2305_PUSH_PULL		0x1
+#define EMC2305_PWM_SHUTDOWN_UNSET      -1
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -104,6 +105,7 @@ struct emc2305_cdev_data {
  * @pwm_output_mask: PWM output mask
  * @pwm_polarity_mask: PWM polarity mask
  * @pwm_separate: separate PWM settings for every channel
+ * @pwm_shutdown: Set shutdown PWM.
  * @pwm_min: array of minimum PWM per channel
  * @pwm_freq: array of PWM frequency per channel
  * @cdev_data: array of cooling devices data
@@ -116,6 +118,7 @@ struct emc2305_data {
 	u8 pwm_output_mask;
 	u8 pwm_polarity_mask;
 	bool pwm_separate;
+	s16 pwm_shutdown[EMC2305_PWM_MAX];
 	u8 pwm_min[EMC2305_PWM_MAX];
 	u16 pwm_freq[EMC2305_PWM_MAX];
 	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
@@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 				      struct device_node *child,
 				      struct emc2305_data *data)
 {	u32 ch;
+	u32 pwm_shutdown_percent;
 	int ret;
 	struct of_phandle_args args;
 
@@ -579,6 +583,18 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 	}
 
 	of_node_put(args.np);
+
+	ret = of_property_read_u32(child, "fan-shutdown-percent",
+				   &pwm_shutdown_percent);
+
+	data->pwm_shutdown[ch] = EMC2305_PWM_SHUTDOWN_UNSET;
+
+	if (!ret) {
+		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
+		data->pwm_shutdown[ch] =
+			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
+	}
+
 	return 0;
 }
 
@@ -714,6 +730,23 @@ static int emc2305_probe(struct i2c_client *client)
 	return 0;
 }
 
+static void emc2305_shutdown(struct i2c_client *client)
+{
+	int i;
+	int ret;
+	struct emc2305_data *data = i2c_get_clientdata(client);
+
+	for (i = 0; i < data->pwm_num; i++) {
+		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
+							data->pwm_shutdown[i]);
+			if (ret < 0)
+				dev_warn(&client->dev,
+					 "Failed to set shutdown PWM for ch %d\n", i);
+		}
+	}
+}
+
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
 	{},
@@ -726,6 +759,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1


