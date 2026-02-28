Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2FEFEE4CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF1/THjpcZQztfuOh6ErgjzYguAKLTlwGeG30i60T4s=; b=sZNn3DBOb+8eunv5lbFlA38OsB
	ZiuQLz3N41MoKsCOr3mqdE4lFR5IkaiveDEzb2c+9OT/5sTsILeP3U13duhvHc0553M/6xDjMvK4L
	HSaMwobLnQzwc+uD0RpaFFF7tmkwH6Dji/N+FRSIQQ3qCbiwLZmehxk9kgyAz+e2PjP/fxeOKXAj7
	cvxbBCYwBZVejhCIExov+RBgdeX7978r+SClKgggSF/R0hewDDDb99JUXzTcgFZz2mmB+hRyPVGUx
	+ef55rKzV5DKALOoRtalM3vn5+xe0ZnVo/zuieo+KJK2TwgN9QmxPA/zrFLZ6NfXcJlpOvaODpL/N
	dv5WCnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyJ-00000009YQz-2HGa;
	Sat, 28 Feb 2026 06:38:39 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyE-00000009YNp-1J6X;
	Sat, 28 Feb 2026 06:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXa9i//rwxjOYl7tG6ZN11k8UfT81gKvUiVP5mwClROv/t1zItyT8+9QHYJi/96I5M3MIrTDq9MZbSItgIdV1NzltRVpqxRtqRdl7Sl23tUtF1+APLVWyJdtcg+Ki66JXD6IV1EEE1rOcnHghbsrwhwdqTfzbhuBrv/HxjOWbGdqUuZ3vVH8q23BgHAIOAlldy/eFg8Bk6xiYT+2VMzihxUiaDqtYXlUVzbm1CUN+jgkamZNk6npAKJGeCwSHQ0cN+EWIQciLVmIMZxfsvPH6DZ9vDQu1EatTeIITOv4dhR4zmbCtFONvYzMGRbz85dAHgsHbss1Vx3awb0YWpO53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF1/THjpcZQztfuOh6ErgjzYguAKLTlwGeG30i60T4s=;
 b=UrjNagObyibEWjFAU+NebegaMaYNVuGYQN7kxFWG8ErLl0CzR8W4AEPuk3rHym0QhhdoMRGXkQYp9LGtqnd1PwBOSWvjXCHNt6MK6N1TemfR/K5Mx6zL1Q82dS80oc9ZHuF7tJmMbENdJwC8yvxBEnSadm32uBvNzGXe4in7sEUElT41PZXq+0ftp1EKWl6EIVdFS1fqyahv1Yl8A33KnNh5QlklESqpXusdi4qgUnksvJwYdW5FfRXFKDGr6fY4tiMZJb90Yup3QJJL6rwvVjgrcVb/nRCR1YbXLg7mczqpZRhF76ZvhgX+D6JOWMZxyPYn55OVrmH2KMaT9cMmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI4PR03MB9867.apcprd03.prod.outlook.com (2603:1096:4:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 28 Feb
 2026 06:38:28 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:38:28 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2 2/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
Date: Sat, 28 Feb 2026 14:37:48 +0800
Message-Id: <20260228063750.701887-3-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228063750.701887-1-nick@khadas.com>
References: <20260228063750.701887-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SI4PR03MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: f6806478-a022-4e8b-53fe-08de7693fb07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: dQL7VD7/Wvy/U0IwvGs7WsmmdW8tcb7ouRmXzNqA4wf5HjUbFSXISULhT6tOzuvGyVPg5ccYisnDDj+eIGpAJC3dpfEqSlBm2366QCvY3DNDrbr4q/S45PuBLIgRsXySVGiuDplU4w/9oy4DOpk5jndKF3O+Qp2gMAB0+oD7GfsmmtkD2x57jA7ZRk+a5prd2M1aW6lWAmecIC8PaCAWo682FncUhruHxP8b2Tkd/j16YHu97MJ3ZdbZ9EvrXEbPp6v2BXYC4bAIHCZyiA2tEFNaewU3ZNIz8IKDfXs2vMcpBmGFTRzv3eH6PFxQHnOffH96ziUBnmyW8vYMShF6BUxEjDt2DHUw2hXwQF8+yGLd7LnTdMf+JC559gCLGVdidKauIonHFzFcga0acS6qlTQvPsLq9DEUReXEBo5hDXK+zIsIxj0VK4OlfvaPJOTB+Hgh5SeNBGrFZhY05iTyItJxkwk1G+Hdh/CfIHWWziu+3dIQAxKDycRA8TdFspqqgLW8H+IwqD9ZggU8aECFr7JsRF3yyZ7gD4ki7OoP8dCe9TUIFtDfX1NHCwYzPAo+Sy/SrvOhyXC/bytj28mZBNL8uz0QnvRGh7Wy4ck4bWESUruV9xLTLGUglN/KENQADD/VF7TYH4z1BYnWC1XQc69K8FGazD4fa3yCq81EeJT7leHmUbCkffR0OFPVXdYDbMhEWaQxM2tLBeYIfpmRuUFAJKNYbiVMEURDBdJeerbhuH+SXBrI9HsLU/Wont0tj2GZzJHYeLVXWfCiLf0b/5IYayTKGWKslVrP5q7Q6NQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TomON/oZ95p7IE7mJNBYt6DXVHpJqTzkzch1/sgkn+LZ8M5ueUrf4Mn4aNBJ?=
 =?us-ascii?Q?xRLp7QbfE+wJwlspviSidJ8bLITho4L7RbA0Jaj8O+Ul7xVeMVWdRoLmhZ8u?=
 =?us-ascii?Q?+n0EC+LCLVarzKIMBCq8vdfVqWw6a2v87fP+3FVuzogW8mV9pIv5eTohlHbr?=
 =?us-ascii?Q?VzQoWy5pgHmzBE63HN9mrQq1t6w4dkkvuee3LzzkmmWzhWaLZ9bNBYrm//Gc?=
 =?us-ascii?Q?23w3sDOUPax4dt+zkZAnuPcdCqag977V92jtjsjV773ESpJbMDSpALs+AuvE?=
 =?us-ascii?Q?HjtJk/nLnJTctfi9s4aRu9vBNuewj5hGyVuwa/ncgPSXKGe8VB8TtuPRMlPW?=
 =?us-ascii?Q?pJ6yWtgWFKzTG8d5hRDy2AEDDKb+ue+2zxvHMoHD6QBd5Xr4ro2ZCf7s6pTr?=
 =?us-ascii?Q?J/XgeVv4tB2lDAIAYXk9DMZGCEE02YeLD/uDnaR3LOe04SCUsf/hwI/RylPe?=
 =?us-ascii?Q?FcrAfyJJqKmt4/+baUIiM5nLqGx4RMMLEYRA3lxX451rHlXcEIoqqYTMMvxo?=
 =?us-ascii?Q?xRiKRd4eZLcoRdbZOMlZ2lTzSE+R4Jj2DQlwobpAHcTHHYOPnOeki1n9Ej00?=
 =?us-ascii?Q?2Tbz0rhlQBpE1DmHl4/IzM4juq09Gt9P3rY3+UipkQplmcobJj1yZue3EcA0?=
 =?us-ascii?Q?2PNQo+pRYYoOqxcsIgmNMGYg7TB5bDFvromCXXs1i9p07QQ4uXXWdduw3T87?=
 =?us-ascii?Q?N+Aw4fLbde244WGS5eAhz24rv0akEver3bRX2PQ0z20hDstPiaelV4m0LYFW?=
 =?us-ascii?Q?jQoO90cazLPZ0OPKgB0c5GSumNoRmBOFnsCJGbgOCPyOOR2sDAIHDhK7iAzG?=
 =?us-ascii?Q?r1bMpHhFroeiaGvcENlKopI+q46bYmOmGZVoNp2UsT8Rvu+0r0wGL4/RYUiP?=
 =?us-ascii?Q?vOIDwkaTzLV1595yKufxhtZ9yocU6Y/GMTutarWCjWkT1ptFBWoSfSfktmur?=
 =?us-ascii?Q?7UiJk7qUJWILiYRZ4HkUK+BTEXDwhHJkz7lv5+iRmOF8x8CXdmW4H6jTwoPq?=
 =?us-ascii?Q?BIb6hIt5ZH/03C9AbdM8sqqfbbxXemGaMQAmDNkMYN9/yQFcKjpD5ZUmIUxM?=
 =?us-ascii?Q?M4juDhy6eh43z1e6b9xvja4ax4+iq7QL7QZhucPYzpqWu70Ov46ZOLROnEwF?=
 =?us-ascii?Q?eVR2LkWnS3rFdQxLZ1g1RwXLb5Y1XGZKctCMJXII7+ZAMLs4yhlB0Rjj8Zwv?=
 =?us-ascii?Q?ir89efTw9ZwxeLIaH4zL9FkmilMrHeuG6nqcrtUHSHuoFKCLI0yazWMimZbi?=
 =?us-ascii?Q?03/BQrsCxGAfVqshDEA4X4oxMbk/vKpfW3IIj5phI6KgQTT+39nYFjql7Z/Q?=
 =?us-ascii?Q?XDFV1iADECw9JvU/pR2CV8t0gvj+SRjMOrFjI9CG8lFyBrpet+FQtiDehbLJ?=
 =?us-ascii?Q?3YqiLmImcwltlqVKz/rq86JB+SFoXijaVTYAJXCM01xfzvHL0gydl6VdlUah?=
 =?us-ascii?Q?rznW5iwdbGm+9F7ja+7T9aj4ne+MCxdHVKze8f1W/BTmceb7/zhkxYOLQmNF?=
 =?us-ascii?Q?Uxx2lk2kc4tA+Cvn6X2sSNgm95jX+0jrHB7E96WC5J9zWTtDhsQeLotN490B?=
 =?us-ascii?Q?UaZUrKs+7Tsyu5RO8CN3ZShIA+pc1miSc4+F2FOZY/LtcRHXJUWSbWmGQc5l?=
 =?us-ascii?Q?hV63Q8shwuDa8EgEb4IrHviXIZcSoA9KQ6TENq8+b7Vr6cCjpIMkqPYLyk5u?=
 =?us-ascii?Q?P+ngGrvOh9N+IUhP+w6GkAAbKvK/+TnCiZspVNnbst0VptG4?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6806478-a022-4e8b-53fe-08de7693fb07
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:38:28.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzlZg3Ez6PWHES0jC/vXbQzo7JoN/Fvm5muWX/mNZdgaJS3pStG6q6UHqzhQkVch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223834_350914_DB528CBB 
X-CRM114-Status: UNSURE (   8.21  )
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

The Khadas VIM1S board uses the Ampak AP6256 Wi-Fi/Bluetooth module.
The Bluetooth controller is connected via UART_A and requires the
external 32k clock (LPO).

Enable the UART_A node and add the bluetooth child node to support it.

Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 27d0f6134ea9d..d36533f5559a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -254,6 +254,21 @@ &spicc0 {
 	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
 };
 
+&uart_a {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&sdio_32k>;
+		clock-names = "lpo";
+	};
+};
+
 &uart_b {
 	status = "okay";
 };
-- 
2.34.1


