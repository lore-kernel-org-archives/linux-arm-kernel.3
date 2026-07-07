Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A88ZSXA/CcXghW30GUtGD3wp1bvMMR3eqiWgX0T0ySs=; b=fHwqwfxN2eAcsIyrT1og7e+Tmx
	xt24Xz5G6e64SKTHddt1eQG0nhmtlk5caTNvtya2akkXiA0+2k9W0yPVAfFY5sc8F7PnYcWH1Qw5L
	KagNUK3oXdy7ec59X0NYFTysAnRI+xdIUt6V3EdCSt1mRcFrfC5yq7zXoO3hQuJug+HL1GKYfPgu4
	ys42bzCQhszOaNz7BsiJ4Zf6Xrpl670ojSzsd4e6i7DVsb7dMgy11LVXqlne83GifNEdejMsXy0WE
	eeUTU7WKjgQHng3yLhM316zeJEd3gLogju6DP54b8za+L53jHunoroA+FVXDzoykd0E6xuDpHBbz+
	Q1BjcJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkp-0000000EGmP-1ggD;
	Tue, 07 Jul 2026 06:58:03 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkm-0000000EGk6-2OCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:58:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPBGXm72UmbEjs3aQaGJN5JvdtxPZj1iyf7QPCN7srUzxDpkVF9LovZbxuZcEDUJn+XrW/9HcDq1uOA6yzL+JkwBHwgBu2B6yexxHd164cCnEOX1RXzRbZbY/F/T2wMBpbh3Sx2boYyIisXly+Ky4eJiRlrO6LX3qDnY54aouyQJ9TbltGJFE5insCFVgt3n0FnOFP9hVCiUBxujBvu2aVpApL0RwcP5LflNm4mWIhmQ9RecedTMvgEyGJ4kx0YQZuridTVmYRh5rZbVGN+Ssw7QbOz1s7D2tlGfPxaenqxDqU946oVE87m56J7t0ELnmYCeVxVdNRFdwnlLlssK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A88ZSXA/CcXghW30GUtGD3wp1bvMMR3eqiWgX0T0ySs=;
 b=TI5pmBZ3p/QAgGBFBv9NhLfB25G01YIFFjn2zRVz7eaocHWDbTOV2IeYkxfviLMYmnNfTlymu4o4eWB8JM6JOAaSDnxKvkthCpcwP10SAffmmSs2NeVseo83JhROdxLG3rDymsermqeoLbHJZ6tEEKh481uJTUJUHhOD7ZHdGzi8lP8LO3LCWeXTDGMpWijBzSnyo6pIm3YoFZHm/P2r3c4qDFOhs6FfRLUurlWH9h7+1BYqUHvx5ASSofytQ3E0zeDM6N30+xeloR3nqkj5m8S9VXCYUn4BlEyaRaC9y5vBUsnzqNGKnvMNGG1bAILhPF97B9/gZe/AjS0dMkzAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A88ZSXA/CcXghW30GUtGD3wp1bvMMR3eqiWgX0T0ySs=;
 b=mX1h0mQ5K9JPWd7KQhuWfck2MVc7Tcb7R01WYylAOKIJ567nky1ki9iV+yv99xFO5mwfb170gvKdXPNmHSrEWcV2s1sw3eMmgszCh1Gkx+ckts87L76wlG1z4BSvebHiwGbLN/oLL4KG8lO0wC/L0KzldCJ0hFeKSikftDPntqHeI0dWzcFLoKCqpjT1bjmah3QbpvgMU3rKY5+hRDOXQLTVyULxbGxpnPckUI6kzxbmcIZb8bSTDjvgW/Ri9AWF7hGv8KZ5gQyo0FESF861m1hwaFyuX/1mdWXY+tAWpINczZgDKDBWbaSfbj2XQk0KUDyk6gKJp7DeLsic9U5VNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:54 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:53 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] ASoC: dt-bindings: dmic-codec: Add audio-graph port support
Date: Tue,  7 Jul 2026 15:57:22 +0900
Message-ID: <20260707065725.312450-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::21) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: cfedc191-f2ad-4327-8bbb-08dedbf510ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: oOjW8ND8XF+IWmUPeQmlyp0WT94m0jmFfR8fYCWpgAid9Tfc/QqZse8CRPZX2Wo1sRgE13mcqpux5bV0AJvKssvuSfFU/Iz34U4PHNL1niV3YKF4gzW9tw2vpS1QkTPvr0nXhIu3sclvwWVyM+UJziRp/mY3KQJrNcSsZBH9z9zHsXPWmaHAXf+WJA3HUYST/Tpg9uR/kkj5ItZUv7gb1HZsbg/HD1miQMiEpZZ+isOHZ9YZYHCO18+nkYMnxUff4TJPcXm0BIuh0gURwvCJyp/cW40Nxmep8cm3VXc4RHaI9x3QKSL9PcNDEBqxzSKxdyGWO9nd58mJ2hxuWuqFjrpWpsCsQEg/Jad9HjYwVJuM8BxUNAotpdbHB3AJmSy/hmqWJb4TA1B8BXR+YkfzsYwSY9sw0DVHql/IgOM6EIoTdGU1rEKDOX9PUJq4vTyURXz+kgBFiNGu8IWAOBktqo1x3XMhqp4RWorlaZhXUSLY8Bigu3M/fcBYNAO91xL7DxKcYym8k77ElZb4nBTVO2P74PajWAw/mQ/oEH/vlAnUQhNFMX55zOQbc0h7WR1Xfk4kIUbi50DDlcrHYkidH3A4vDNbk5OR3ON69DhVd16zCO8vbhMmiga9U4ke0+A4pEiQ6kmDW7++pbsvqcKIB7+YenhSmWlp3isrbZchE5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCe3IRTwunJRoSIjJ2PHeK0a5q+zcGRrGyz7WhCStwU3F/BDPIUz54ZYhRCI?=
 =?us-ascii?Q?wftV5xfr1CkS8vvUV1/oiAVn4fJa0b/Cmtnujc1JsOKc7CRURubZGkcX5KIN?=
 =?us-ascii?Q?oGpJK61cG0+Xxx8oD44xyDm9tkSCy2aYwT4mP0lpTcKEURyfKyk1DIeki/uD?=
 =?us-ascii?Q?15a34NU3E8VUWLFz9OLmu6L7Ui+VN5xR2kVTJWK7yFWjuXWx8hvr/Tjy45gM?=
 =?us-ascii?Q?eMDCJ3AdwD9cEAgiejicfLQgNX0Ey7SOISGZ1pre7CGdy9MsQdsW+kmaJ/Al?=
 =?us-ascii?Q?GpY41d/jthCOavxKyM0vl1Q5pE58TM0khRNdfKE/B9vz5h4Do9f3kXSo30TZ?=
 =?us-ascii?Q?ji94qi+5Dxzq0Yq9Gg+bbxTnlu1pAI6W5rSGbyOf5I947FX9GSwVycT0Bh55?=
 =?us-ascii?Q?5M15nD7ulm8M84Xvwl5TDP4wczEsznOmA/mBjEEzvfdOnT00YzJ3gcQbQ6MV?=
 =?us-ascii?Q?aM8u3/TsKHYdDySoAJCUcMrD+/hFgRfKdKUbfRDE82Uz7WX0h+T82oMSXe23?=
 =?us-ascii?Q?67a8euZpp/00z2wU6KejZqBVTKFI/EAv7gfKfh72riGkg9eKEo48/cxErLOm?=
 =?us-ascii?Q?MgInMXrsiUnMUCi+duvxXGMVjPHRif32A95VVztTQ9RlOcm6bewvRKzArOHP?=
 =?us-ascii?Q?ii/GZWMPCmB2sMcNkQmWoXbvR1z8k9tCLSoyfLRIcS9HvFOURbaIZNZsLWK+?=
 =?us-ascii?Q?5DrQSNX5D07vQZz4rITPQjSzBSSxzfcxjzdt6fJBY3O4w4UUZQGPD6NWDkwc?=
 =?us-ascii?Q?2fGOBf7RNInpbtjKxFsbfCuSmhYAvpdMy4yX7vg5546aOomjj8x/mAykZ5jd?=
 =?us-ascii?Q?MjCboGAXPuEy5WF6HjAYGHKDnMoqGXNMV/KwDLU8qsaR8gp90/OI5KbjMcOf?=
 =?us-ascii?Q?24x4fzNVsz22dyzqm7d5A/lh+oUrfsAfUMMAkEwivoRJRZcl3hfROSB+HUk1?=
 =?us-ascii?Q?gEOZHAtCoer4bGHVTAO22/aufZhX5PuQdh50Xg85aAYOTjeWV/Ux64qH4o1B?=
 =?us-ascii?Q?zemcznZ+ctTdtzrA/OS8j4PeAKC/o5VY/2uceFBCRb2jQJWVqexWQ+PU+Xuj?=
 =?us-ascii?Q?xB1jRlUDHvcY9iR5XrSWrbvUyaE3IdwInH95vqBiUMJ75tvWxEJoY6yDavDS?=
 =?us-ascii?Q?FwpZ3SKKiLxXXVE6A3CN1gsU2zwbWOD+ewUIMPP4t1GLWLwHN/YCcChuUP+d?=
 =?us-ascii?Q?XkpLbyisuGO64LfcfkeCg/BkmelVXOxfXnNY9WjTLmBkzwuNy8tvzkEy0kSg?=
 =?us-ascii?Q?T94LSdvVx6MlavlWA8X4H62luheKSBj6oFMODbY0sJKr0C8V9c+hHcCmSo7C?=
 =?us-ascii?Q?E5FUIkvCowXZKkTkESQy0uvmLnAM1fmpz0XMCyj29DxciewU8i4pDQXBUntP?=
 =?us-ascii?Q?wzgIB0k8dA+Jin1cpOyww1t2c3GWgZQrZwoQIBJgYKk3DDcase8XjW/rQtpE?=
 =?us-ascii?Q?X/sK/LisXAK5fW3n7WB2U67gxlwvTpg8aeCnG/qnsep4UwHZmaBpcvMHlEyS?=
 =?us-ascii?Q?CW7Xmvhp0JuH8Cuh3cd8x6r/VS3jNpnxGRI1VrTyzEzi0xRWZJeHE8Phm+Po?=
 =?us-ascii?Q?NOfAt/tcsU1ec/z4422P8kGwf+2oipjY2jGyLX+zZFhN42aSM9n4hIGuHRfz?=
 =?us-ascii?Q?vxTZ3SLzAC8bQZyk3zrFJ+RCI6HK5QeGsVnVWWft+lPo/H5d5mb161efpQ6T?=
 =?us-ascii?Q?VDdikMVCTIl42FAWB8d3vr6Ny7jJWNY/KYCbOGXvYsT98Uqbj6huU4Wx3oSy?=
 =?us-ascii?Q?fltRcwP4WCeJnjTVPzaArDezM/zJOxFaA3ydQUSkpuQHsrMmCHQk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedc191-f2ad-4327-8bbb-08dedbf510ea
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:53.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+0hYLCHTs+yu6E2qmOk6BIW7TJHZ6SflU91jSbVUecf2adEaMiQVbPmRfMxH1GZezD9FU6vI7zFpiUThqfE/NNM7FLr3pHXLOQzIaW+yP5pwOrKlugSbnt82Zmdo+aq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235800_622108_D62566AF 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add port property referencing audio-graph-port.yaml to allow DMIC to be
used with audio-graph-card and audio-graph-card2.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/dmic-codec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
index cc3c84dd4c26..83c23e029ea4 100644
--- a/Documentation/devicetree/bindings/sound/dmic-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
@@ -39,6 +39,10 @@ properties:
   wakeup-delay-ms:
     description: Delay (in ms) after enabling the DMIC
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
-- 
2.50.1


