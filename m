Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFC1061B2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ty/sDAfMFwOK0VEPyR3jGBEC7B+DjE97oJ5TLYifTTo=; b=ylz/qOFvpUUA+KbX7lU5V4gXc4
	/rp2/gmut1p1ZCyTbx19/29alym3URVupFrRWAlBEARks6CvhtkSws3xaKsc98n9R0WUPDbCAF+VZ
	H5Tcg6fa4zaffmedlk6SdqgdDHNd7k4Gf2iSJGTpo9yD9CzynWu4rifKyDZ+MEif2jjvw+ZZo48YF
	AdeGuD1YmSbnzeAQtn8S5gGP2DCEhXUmCTRYSOcrOMYGf39j/+1tsLusTc9n5ePu/f53HDxKsjSj8
	RxKQSGSbLkShWd9GpkZxUJwS0q7Vqn3rHJVAltNMkZpzDVAfBgRyqkWdhjRln9cn7q+gcb2UpIksF
	roAvpebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7NrF-0000000C84h-1O2i;
	Tue, 31 Mar 2026 01:25:29 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7NrD-0000000C84K-05jA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 01:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+dYhIxq9dYiKhYzKAYtSYIUfFELzVFVGGJc9Ho+JUHlrRtvCQfFKQmzRoXVc5Y10x1HFuj1qEfWX6bA2BKlgS3DgQDsy1YRznyKmaXRt9mHxYCi+VEhCtUInt9OXGH8qIAwdNeg2mkN6mszxKwfkSn2nD9+rIDGKXtc4Av/WHGjlIE4jgzO4m1FsKYWJkFuo5Np7WHwS12iGCboaNRTIOnBKTYCV3RZpdr5e/ZW+a1pTbuoaG2Z7QdqMR6JKYzQ0YtG7lmtVkWDH5vbueSsFNOeSExrlUhJHhwTIQo2WUnwuOS6o5jxjxohrbEKxKNlGOV5tAMah4ctLoXvDBJHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty/sDAfMFwOK0VEPyR3jGBEC7B+DjE97oJ5TLYifTTo=;
 b=EzQhfkQJu/6fmF7tPK/c9pxTJqN4y+2D6tzyxqatA9AXasfekJstTCd8aL1FEtP5eP/dpLWBD6h6YXz2/oNmaGiLJu3e2qmk6Xs2z9P//Lx3vWEHA/by2Ywgh6ilQKkU8YuqzVVw6QupN4h5E6rhY3f9+u4aGVmoO+y3tOd0/Ebvvm2Y7DCNn2+fk6SBvKIlmnvx8TZeIx1MMWLgBMMhJlqrYIXHeWlmIDfe6UO/pSLOeX10G0ZApl3XFPRjjcu3/A8wMcub9Rrdq8AzpfSARMu5zNw3yuOqUzwPeaNgao+6HE0e030jsv7B/JkM9VfkYEX6rbeDBwlIhtDdFgM7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty/sDAfMFwOK0VEPyR3jGBEC7B+DjE97oJ5TLYifTTo=;
 b=ePk13YuHRKlMTzOq2Pcih2AqEW2pn31Qyp8/4T9VNhue9oqH89ilOcyKIysTJvGdH3FkQnMmyR+hCw7BfUFHTDLW09lugAWkkbEfJkfszA6WzLB90Vd9dzDt7atu+VXX1ucfbmFLeifhwpgEO0hNlTP5Ja8mlHwvfXWAw9lyNKkSzNTh2DvUeT1olYRvHrOuKBvO8xJgW0Pyn2/86WStSKA2eukEm2IBBuW69RADaib9FzT4r35jDOJKApsUuhrcTycQwman5lTSWJ5q537AZHf3njnb2hdlvQabi7CpwjXv3VO8rvNivMMpFBnx9bbhpJU18uxbCh83jQRIUfWaDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB10902.eurprd04.prod.outlook.com (2603:10a6:800:26c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:25:20 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:25:20 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	shengjiu.wang@gmail.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats
Date: Tue, 31 Mar 2026 10:24:50 +0900
Message-ID: <20260331012450.1298115-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0088.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::10) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI0PR04MB10902:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d01f66-841e-43c6-36e4-08de8ec45f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LRqK9xfv/7FlSy5nWyaS8paHwgE/t7uiExgJ6xS3GSR2bA7OBlySfm8I3kUIh82Nr7r6f5/W+dtqtIf6w6CDMP8QIIptqlSSqApUaiHtF99FA43v9kwfQwKC75tQuWY0jUj95yCfVT0WZioyhqeaLpuOtQ3i3mjVpRqUj/LqwnAp7CtPmjhAk+c33Y5cOMuqFm4GxOSgAUY8pE8R+DTN8SFbOzpLBD8B/trHfxLdD6KttrsOcAEZgqibU2YDnNoTaen2vBIhymR5QDl9QOm85AfaF+w+UpPqZvX08E3Y1an5d5cYTLPHHB0W2hP6C8yA0qk3vxEuSrFYv9xibo8x75idKZdcgMwy3NAy4Ex+P0+r/c740l4ZX7sFs5fh0aPy6zbrNAxXJ0ZuGZz557KZLLqHhZBVnJe3R1JSqxv13Bzj+BCYBuIygG2X6+V+LVpwCPXvnH6AyeptNWU7mgk71myOjKe5onhUkJ99SzvienoyxOge9X7/5pi7OhDLpvf/NZNulIm4LAsN6/Ls9ekOTFoLlN3GYKB6N2Nyf1srd6m6Ys622M3MAC3c7dW5xWLyCIruqjpc1tiIhJGAIBGh6FYZ5Sru9knShK72V8BI4vTHvD8rT3hbCrz15oHMVeoGXb2+b2zU2BJUUe8sIRED0OOE1a2bt8z1sCAX0CsNB7Icx8QXe3lTmotJht6yM1LwugM6oVjobkbro1n6VCdQ+ShSpQpfT0Jqmu7s7V8h5cwT9hkRI75jOA8dYxzlK9YreMtyUKtLzx1ohPov2Yj90TaJYXHfCM1sVlGcaXoxjquWiq/wYZyuG2AVgCkMuTxc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KeABa86CFOWQv1hbqlAK1JDuMwo1Xb49vLYrMVkbAd3z0sSzhW/oZGTXvXds?=
 =?us-ascii?Q?s1pnc5PvYXNvR5h65aanO0mWS1cj0yHpnvrWxN89Mrfo6MC/e2w5u8Fc4lW5?=
 =?us-ascii?Q?QsEP/vDdJ46aOKUTvcO5v9xMbUkVQWVnoVW9EBmTg21kEtOwfjRLuBnL+NSv?=
 =?us-ascii?Q?RU+BaxX2lB9DhBVSJYS+ij8nV8KzOMz1LpPHkVrBMjhc94qd8qPLrpaCJhNN?=
 =?us-ascii?Q?AcZoMhUB1aH9OXTmHhtzn+Cv+9CR9SHAPOjpoYq27oYFT6+NBuiaCqCbf/YW?=
 =?us-ascii?Q?FfgcK27iEIpPjcVeK6OE2wE7/091y1+ebOKz7ojbgsMIP3GKp5CK7vY/d31E?=
 =?us-ascii?Q?vGOt6YXkz8cjBId/Jr8xXasXZTWYcRdNY4zZqDwwi4CUVTUgwhCWfuw1Ew/8?=
 =?us-ascii?Q?RoyoTqgpoMy9Yv8KF7G4/URCBWPtWU3qMVJ+mrQGMgbsOmsuhVvON5AlXvnA?=
 =?us-ascii?Q?uIeH04KJ8/hw7vGDLU/st2tjQ7nELzvwq/kzvXkU0MgX2HnidXAQkS1s2b29?=
 =?us-ascii?Q?+Evb2TCPUxFl9IFDnP1sbUiY80pb0b1V9spxKcSli2eUH82hwKKaSAnI9PRn?=
 =?us-ascii?Q?Td3oj07XI0kptzgvnnmhA87pUPFK3oeIBesBIsvZOcF5moF0kfnYkt/j5aCJ?=
 =?us-ascii?Q?vIcHMv3g/3oKLAZByi1YCeabtf+AXY9tmnieDT/px5LyfSi1QplGuu/VI9ZV?=
 =?us-ascii?Q?ZjrbTvj6cu/eKnPZX6QKQwLDaRtkbRW7J6GNg3ZEoL4+b+2V2y2SoxyL5iUM?=
 =?us-ascii?Q?SJqK93qUPQd9v93dNhASGdnvJPAZGak59Oiyqqz4PXZoIPkt7NWVBcqXfVBR?=
 =?us-ascii?Q?sh8yu0knwyxBDgtaM+qZlt4ZsBTPKUbiRD/4pahxgnUFkwkGGw6bankA+c/H?=
 =?us-ascii?Q?TmI2LmnyNDPXRzeSivQgLGNfUiEcBoeksLUOmyE8mERnu6b3lHeZ1PxGOIjA?=
 =?us-ascii?Q?nnGIShVkgCy0DpPidO4DT+GTc+9t2LNkPtZua9iOHN72rZAduSquX0mwmch/?=
 =?us-ascii?Q?/H2p070BVY2XswWxfsO9KCtxc1zYaBfCwVlVufggNAfuvtg7F/LY7CKsSy0C?=
 =?us-ascii?Q?sG7a7acaJHFoxcTrMH2+U/oqM/wWQBnAviymzB979bVITFQHqzg+P8+71ior?=
 =?us-ascii?Q?ThjzA2ym1X6zLDsDPP9JAn8T3zjGgRJx9KEvUqyatpAnP+DCl3j//k628tQ3?=
 =?us-ascii?Q?cIU+AIDpFUAFhPCXDZoLVg74YXo3VW91EyG+rS/HRzmmpu7XN9yqS8aCYZWZ?=
 =?us-ascii?Q?Ys8RGza2nXPeweOtYYXuqeKklx1ByE/Z9FKa0exMXMZWYuNZ5lgbQkfI6yj5?=
 =?us-ascii?Q?zBlx3Yol9+mJBbJhUZLqlipZmaq58AbALnr0uo9hOwgqpNhFg6dpJABN5t6R?=
 =?us-ascii?Q?N2yiZSCxy7uDjAXjQNFZHC8aog4FpYmfoowcY1Fs+e+2AWTw4WlHvsCh7FNb?=
 =?us-ascii?Q?le5ODd+Ik/JUie2SQSe1qB41cMSKtQnVVoUuf5ZE8FJYyfYFezYuEdAyqsOL?=
 =?us-ascii?Q?DgLFKn2meaGRnNqK+xdYUJGL073BdEZCFz0hm/WDTxf6qQTctwmb6yUW6rov?=
 =?us-ascii?Q?+cEAXMIbhpo9ys0uOl1EQboPPGRGPwbTn747RmdZiyfhE7F7r9flSqhhAxX6?=
 =?us-ascii?Q?gD4Pe964PlWUc3m1ASRV09bywmk4meJbxBzOgXC7D6ZWQfhAjpzhU56cSrm0?=
 =?us-ascii?Q?pK9S5Sx95rVAw/5iFK1IzkcputjTILwzg3Jc5S38McmGPr6FoNtuTyU/A+ad?=
 =?us-ascii?Q?RiAepc3uMQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d01f66-841e-43c6-36e4-08de8ec45f87
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:25:20.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRl+35Dfx0UAPEQO/y7H/1k19CH6RJCEKOeLQ42Mtpp9Kx43ESL1z0YD/nM7q5Aaf07Xbl9Nia0vYXdbe9sSJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_182527_073688_CA11833E 
X-CRM114-Status: GOOD (  11.64  )
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

Currently this binding only lists i2s and dsp_b formats that are used
by existing sound cards. However, DT bindings should describe the full
hardware capabilities rather than only the formats of current usage.

The SAI audio controller of i.MX audio sound card supports multiple DAI
formats, including:
  - i2s
  - left_j
  - right_j
  - dsp_a
  - dsp_b
  - pdm
  - msb
  - lsb

Complete the full list of formats supported by i.MX audio sound card to
ensure the binding correctly describes hardware.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
Changes in v4:
- Completed the full list of DAI formats (i2s, left_j, right_j, dsp_a,
dsp_b, pdm, msb, lsb) supported by i.MX sound card.
- Rewrote commit message to focus on describing hardware capability
rather than current usage.

Changes in v3:
- Rewrote commit message completely to describe hardware requirements.
Explicitly documented why only dsp_a is added and why other formats
are not included.
- Rebased on latest code base. No functional changes.

Changes in v2:
- Updated commit message to explain current support for i2s and dsp_b
formats and new support for dsp_a. No code changes.

 Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 5424d4f16f52..950e3eab2942 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -37,7 +37,13 @@ patternProperties:
         items:
           enum:
             - i2s
+            - left_j
+            - right_j
+            - dsp_a
             - dsp_b
+            - pdm
+            - msb
+            - lsb

       dai-tdm-slot-num: true

--
2.50.1


