Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9874CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHS9S/v3+oyAtUL/HuoPZmv7hIToiahgo2YsiFuzBLY=; b=4fdMcMarIfgwnaPK7UjHn0GhMF
	kjS9DizhzIbniwGBQU8/A31dxmGewobqgbYgk7Z/DMMWoGe/lrUcsuvyz+UA/MdUISme0YtjdBgeG
	kjulTzM1QyAEoSExJ9qvOMfX1lHmNS3zHpRmAp/H/rKwePuMuOm0qhrZYs4b9Ftm0wViAktR71blW
	Nf6zMN5ELGmv3owup8jbgL7H/Rf3YkUkamKrIuD3IZiUcHk7NwMFZd3WqYJSXipf4lCMAlCZYniMX
	p8El6IfWkgoz24kz3kyx/LdDHVR5sWamoz7fwx5C9pBAVI6cwlzpkCc41ZqBJ6TIi5cMQqgjLMeDL
	XLd3dIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxTP-00000005mBo-00fC;
	Tue, 09 Jun 2026 14:30:35 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxT8-00000005lr2-3HcB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVmGZJBXR/CTbAM1NmG+Z8fevuW9mlYCBoYByshIGwr0zTpTP8DKkYpyeFFQaS1NCHdJdxf3G9pHcyznRViNuihicz1tZO1uRmq0u8rQsdJOOblmRI4Oi+JgrsQ7YZtkUFxSlithrkBE9NYgWt0u6FFRlThtfy+dBQJ01j69lp7L2aPGcAuX2IvpiQM7pPzTTsS8i8lQ4z5oi6BloCwF+EQwB5dPMYdGvvOMgplDFHG4xgQR1R7l35HYCwZc8DwsVGFFtMnb6rVqPnH6h/5+TqOJ2xuT+j7XJf4SQLnIbUpcQFrko/XE0ankNNlbvCDEYOCx1POhrCNDzfFJbNm7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHS9S/v3+oyAtUL/HuoPZmv7hIToiahgo2YsiFuzBLY=;
 b=yHWbfmUrV6cVEaCda98CbTZ7o/p7sxh9/i/KLnt77fqRsGv+U5nsGB32iRTU7qgiQQKCHvJG53lIV6vKmelgf0EKXnSmKVKX+4gIvdrsbyY5lNeIK5nTgywlXYZrLN01R9gVtwkJZx5Jt6ucJYozeB/I1ofs/4Tjpf17qA6S83LY+PFLMdkjFZ4Mxqb13un9GC6/SC3qufK4p7N+8e6Z2AktaQA9fGK7s5KshM3rB8RnhVaXJoLo2zg1I6LMQv+2salNftNQCzEJrxsPmxPU5m5+q8u6Nq8xZTrHqRN1xMLyznTMNwi290QydBrRAcgKHxUjDIC1Sz5YVTjwq0LRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHS9S/v3+oyAtUL/HuoPZmv7hIToiahgo2YsiFuzBLY=;
 b=Ljmk4CQ6cy+UKviVKgPgitC1foiWaSeYj/Mm2Jh2bFN1vh5LHGF5UV5zpQd3dgoE7oCFXAKYDWLJG/4pKETMj2KE0HZ41sbeE7BN8GEg0N4vOgKMJyCfQ4Bhr2zQKZAmeF+gJ5le/sZunSM+pstTcWkxRzdgw+qpynhy8ImcZftinZh2FF3ntzBxCAL5B/9Jyf6NMIWQx4zhf+FEVM/LsolL+eRLm0SjUN2xd9kzkjHDzyH5hLrygHU/VZU6gNr5FUaLn8NjL7VK50G8oke8Zed0X+A+LH7Ba6F3VklBxD6zzJx5Blw2Kp91Oo+8MRF7WlMIu+JK+a2qbZjjHKKrbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by DU4PR04MB10911.eurprd04.prod.outlook.com (2603:10a6:10:58c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:30:08 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:30:08 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v5 8/8] arm64: dts: s32n79: enable FlexCAN devices
Date: Tue,  9 Jun 2026 16:29:54 +0200
Message-ID: <20260609142954.1807421-9-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|DU4PR04MB10911:EE_
X-MS-Office365-Filtering-Correlation-Id: f6aa9e16-4fa1-4dc1-3829-08dec6339b6b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e1hdITRvNvt8E2ug2H0Ok/iIwISALlFbPjoZ6yyc/HCs2nDMuc5EhxKMzdxro4xEldyggac62ANYGaPZXqKpma2nYILyoGFvNDG8gP/R9hx5pIWfuAJLTcI8clcR1xLNyxVq54XsBtl0ZfXi1L+hZOCAGLVE9XhFFLioXAb9QXtp+gmxVafs2LOvmnFtdfR40AWn3BxJDwa+JJZhUe4URnTmtKPfa3oExp72ZvkTHN8LpJb0OLyPgHGzgp77AVQTIsxm5q9DYWGjxBzKKcjB/3dcufQLoRlG+Rb/TE0cpJxECoHmG40DrERekuU4TLkHMiY0FXdmu2j0YPdmJA1HBP+LPvNoEG/jVXUJIEu+QgC/B1P2iHsprxaF/XbLDnQTta42oIHARljj2b5GKmgYu9E3j+Und+yPhXZagGHYQ/Be3LfFaJSu0LY+gvIyPSywMSMM5ITJEyoXCMbk2fCsoYeetm1pox6CgZJx4pD2uDGVfoi45+wSPXsTz5KUBcwRk8AElqgJ6Mii19Wv88tWj+qg/9QnYB84sfbsKmticGKc7kyEUL07fZEW9R5tIeHlUPqeyDd5frPIp32atzomY5HZ7KOa3E8kHgd/MZFwMr6xAdwPSDssTl5DCLDLqNihhhbW0aZAtGicX89/tCIkSHxBOmJjM3UHYK28K/PYp//jMVTkVxjQE63oYZk+6zpn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2piaEgwTFFCeVFscUt1cHhGSTBSY2NiaHRpRmxkSXFOOWlSWjNFVlFuOG0z?=
 =?utf-8?B?M3pjMUFGWXBBMUhJdzg1Y1hHVlUwQ04zMnl6OGtjd3E5RWRnNDlPeU1yem9l?=
 =?utf-8?B?b0NUUS9iazc0S2NWSFlITUljK3p0bGw5UGh2bmNOREp0VXVZTGdXNy9MeGdB?=
 =?utf-8?B?U3BtQkFqK29RN1FOd3lGTDRJR0s2cWE0eVBLNkJyQ01TVFltL0FpUzRUcGtK?=
 =?utf-8?B?RTFXNUtZb1k5TVBRY0dKY0NVZy94ODhWdEh1U1dXeDVYY3BtRlFzVHUrTzdo?=
 =?utf-8?B?Q0tLUGdFd3JXbVBmc2dPMUtqM3dQSE5ETUQ5SG00ODFZMCtsSlpDdDJQQTVh?=
 =?utf-8?B?dVJVWWNLdVZ5NEdUcHFoSW9nVlFGS1RZZFp2SDZ3NkZ1anVYcFZqMElPd2ky?=
 =?utf-8?B?WVhGTjlHTHBxbkVhZE15bC94dWptQUR5ZkhwNGlqcFc3d0xtcGk4UlQvVTJK?=
 =?utf-8?B?UGlVdXhRa3dVVzFESjNjMnExbExJUTNUUFZuQ1UwTVc1MnJ1aEFCQkdVZ0hv?=
 =?utf-8?B?ZE5jNE5qOFhXazRUbGRndHJWd3ZoRWhpYjdZeFdTWnQxWnFlWGdoMWwxSUwr?=
 =?utf-8?B?aERwL3pyL08yK0JVZFM1ZXBobWJmdTB4M3M0VHhJRFNxVG1JS0ZwL0JCajJ5?=
 =?utf-8?B?ZlpGeHo4UnBxTlYwMkM0OWY3ZnhocnJsTkZMTUhQTmlGblF2YlVucndyOE1X?=
 =?utf-8?B?OVRVMjRQZXBzRDlkeGI0UlZZTnFBWUNabGpRWmFyVWJLTHhMWER5dHRHeGJD?=
 =?utf-8?B?ZmMyVHRMRVp1OHhBdWpTWFo4OFFjZ3ovOTJFTXB5OUtzRG5heFFsSTRHM3ll?=
 =?utf-8?B?VHpGVWlPM1c5R3dtZDVMTTNYd1ZVdzBXZ0FpSjJrNlNpeFdUeU5BbjZJcGd5?=
 =?utf-8?B?U1djWE11QmdKNkpITzZLRFNMVDgwZUxKbno1OXQ0dEV5OUxUQlRGUmJtUmRw?=
 =?utf-8?B?bVFvT2hOMEFMQXNLelBvWUZDSE82blMvcnY2UUFtUU9INzJDQ29hVTM4cGhm?=
 =?utf-8?B?NzUyRHB1dlZoNll2WXJvOExHM0pLNjRTM3ZFTzR0eTFEUTNCUVcyL0tkcGdE?=
 =?utf-8?B?eWIwVEFiWG0vejhKRzZRL1VTbWJiQ0FYbXhaajNMQkhPaDhuZVdUV0VlLzVz?=
 =?utf-8?B?RUJnVkZZWWp0Si8ybExGcjlvRFhKckc1b2FkOTNSL1RBSmZpSFoyTWh5emR2?=
 =?utf-8?B?Tk55Q1k3SGxIZ0ZSYUlZZ1RicDVNUE94bEFXSjVsUmRoZmpOd2VBdC9YTFBl?=
 =?utf-8?B?ZWJHVldMdEptd2pBSFAvTUFQL1RZZlkyOUR0WEI2L2FTdDg0QW9PWlFoVUhO?=
 =?utf-8?B?aWljenhscWR1L1FSaithcHVoZ1A5NVROMjJsdWs1bnZVMmcrWGoycUhaY2Zl?=
 =?utf-8?B?TDJqaUYxOGlKalBRei8zOGhnSm9HQnU5YmY4dEMydS82KzRXd1BWd1RsWURX?=
 =?utf-8?B?dDJZS215ZkRNTkpwZzROdTl6QWJITWZHM0EwRU8yd0JSTnp0aFZrOFhUMFFh?=
 =?utf-8?B?RzgyY3RrajhjWkoxQ3FZNmgyZ2RTODN5Ynpwc1Rpc2krZnJDSmpPc1NMWnZx?=
 =?utf-8?B?ZFdFMGlGUjJvb0FQbTErRmFqTnFlNEhpWjduejRlNjBMR2syeUJqY1Fic05t?=
 =?utf-8?B?K2tVSG5aVGVrbGRiRVRWZlg2a1FQYkF4S201dC9iUHE3RDJnakRZYlExUzFI?=
 =?utf-8?B?OGsxMkZHbmlvbFBUVXJpS1lESUd4MWlCMUdGSkNiZ1BkUjg4VzQ3amxpS0ZK?=
 =?utf-8?B?Zjc5akJxVllzUFJtWE1EeTZHMk54SVZoczZxUlJqdVFnVnQ3bGVyYUpYOXVI?=
 =?utf-8?B?QUFjT1FKZkhzQStsUXM5RzNKbUJVWDNHcCtEdzF2WEZUaVg4QmkwUnkrVWtG?=
 =?utf-8?B?VVVSamhHK2trQndnbnZkWFJDeEN6RUVGQXF3WlJTYkk0NXlMY2hGR2s4YU45?=
 =?utf-8?B?cVFUOXZkMmJaWWlwSy9RLzlwbTMvbm5ueFBYVGhNZXB5TjQxalZ4aisyYmRl?=
 =?utf-8?B?MDU3anB5VUVZQWkvemhQNTZjbjN5aVQzdENGZVRMb1NzcEdZRlFvbm5JYk51?=
 =?utf-8?B?VDlNV1l6S0NiOUV3NkV5VTdQVnFacmlMM2tMS1h2VXZaY2JHSUxsUmRaY1FF?=
 =?utf-8?B?Rm9CTmpvZThRNjdxM3M2T0tSdTgrYnZqQ2s1NjZsNEQzWVMxSTJ5dXhUWVFC?=
 =?utf-8?B?dDRnMFVFbmNkdzlDdzFFMytSV3hqRjNXOURkYnBIN3J6NnVSQzZrMEZ6bk9R?=
 =?utf-8?B?ZDdjenYwTU9NK1NJb2RPcE5CNDNobDdmOTFVQ1QwYm90bmhBVnFuUU9yWEpS?=
 =?utf-8?B?S3pBUlF6Q2VCMEk4eVNWRGUwK01oNk5sVGVLUHN3Nk1oSDg1ZWkzaTNZaXFp?=
 =?utf-8?Q?sv8G42pnUg0bGe8w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6aa9e16-4fa1-4dc1-3829-08dec6339b6b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:30:08.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUc6V8NXSOPvJ3MnuvITcoLqSJOD/Gishy+mctB61nZaMBr/FQv2nsfTHR8biWr9WzaV7X4wUnVLaZWRTmkgIaqkrMK+Z8l32VW+ZUpyrzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073018_832681_413AF015 
X-CRM114-Status: UNSURE (   8.15  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Enable FlexCAN controller instances (can0 and can1) and the required RCU
irqsteer interrupt controller on S32N79-RDB board.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..65a595d7535f 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -43,10 +43,22 @@ memory@80000000 {
 	};
 };
 
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
 &irqsteer_coss {
 	status = "okay";
 };
 
+&irqsteer_rcu {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.0


