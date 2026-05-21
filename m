Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B0CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 19:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk0zwC8qeFdXGPcQkN8OiVBkBI4vLtjc41xgv6hSHUY=; b=IIgyhnG5ACajH0L1wEowC9o8Hz
	5Usyz27PHYtJbLA/cxQ3dkh/OB6dYM6J4mT8AuDQIkHTn4mUgV6c280O+9+3wtZHM2ZRc5mH2H80T
	/a9R7TB7MG7jz+vWDQ+jESjrFPAui8ak/Wc+oWLoccHdaIJ9/NcsLcUY9z4J9jBZgnLT2LG/EUjRQ
	ddfNoAQfcOb0uS7Dwhag7yFJnaNCGwfzQrLDgs9BHIGAOKhM2SpDsuK5gt2gDX81UGQ7YQPmVwbZV
	2uLUKYkL4XhRz8dK9rMZE87QJSUzlZsfl3SlXpCILqpqw8S2VUbbmOZwYNg4e8Nm04cyKIAWy7/Jk
	wztgMbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8sJ-00000008sii-2f4M;
	Thu, 21 May 2026 19:16:07 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8sF-00000008ses-29Lj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 19:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co4OcXLNuU8gCd2dyMvvbksEHXw8KzZw3dPi1S7Yei1cn25cj1eV3FEIuX2wAhE7UYNSYVv5HuX1EnFDEHuTIXcNshjFqBCGvkMT1if1I9eGEdL3FLvkiPX9pxHtUC+oiHReCNI/fhMpR26R/Oc2FV1+SwBKy1w3URpXIvrvDwLSVlwAS44sQxSmQiOiuuIw3r+1tasL05TwwoGAiJQpI+jg/oYVYMBtE+nqjwXN4k/Y8nNgYydaixRGElQkOjRE146Rsv28Bn6nHMHhOu464aYU+UoxA9OF5FFMGvzgHfYtCcZAaIcn3dL6pLjj7mBStGUSrHTEtn3GWuarPz277A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk0zwC8qeFdXGPcQkN8OiVBkBI4vLtjc41xgv6hSHUY=;
 b=ppZBioyK5dNb/aYA1ChZnqwdZN3y2f9ZOncBhfsS3L9n+WYdyzGSm67x8srIMf1pBaRysX6TJCq4Gn9335wwlJBD5VQtdVDjGKz4veL4gNVUgk8HWR8TZ7mZ48Qd9PLWaNxCMAOpC7FYHupXYKgS7LGgVAhaqMH3iAzc5uCNdy21L+/PNKOhF4krfZZ+LaU6hYYFj4FxiXrKcu4f9/HgU0gMccNe0gbLU52jmNvfx2E56gjWRxXZeN8NJV21vpPXe2j+U/0BZ398dManVRPxkMoi0q9RY0i0g4GyjpRKBe7JAeozOjftSFKIwuSGZ0lI/RIQrMmTj20hI7aQOM1Wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk0zwC8qeFdXGPcQkN8OiVBkBI4vLtjc41xgv6hSHUY=;
 b=JFfOpeUL6jlhbqAhZl46wnswDNVLcAVFlg2rflvN7nKZYydZ+JXJMUsexjL7FNItTPgfWmaSfehpjmjePOVUxN76ycHp6YqBQfL3bmo/Dp5VTMPLJ9rajDEXG8v4IoSn4GjMhvFq09Ay3IMfc34zXNB1JiJG3QxE35RmDaccdCglxgWcM/p/cm3NQQ1hPpOZIoDk+lFuPBK+86lRIB7aADEZrTV6sjQb+uxGJmdI5M0STV9l6wBrMJ0RbMkleHMKGMxkKyqU5kskVq8uXX/oOuL7OJxlSIPdlfQjuvpfWmbeQLCD/1GZeqlbgl5CYFcaGooWTJXCTdu8L0kr4fPnCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:15:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:15:59 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:40 -0400
Subject: [PATCH v2 2/6] ARM: dts: imx: remove redundant bus-width for
 video-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-2-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=6448;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mMfnzH3qOKeVPT3NCKfNMI+HNBExCRqXGLNInK6ZoGU=;
 b=lcBCBQPfYE5+p83QWR5fHaT9MRLOX/uzSbVSVI6xg1qw6vR39EoFfou1k7xD+SierTgL7q1ov
 jQpsH6frnGvD5xf769bO2k80s6lp44pEYir1RhxREqUGQbArsfpkR5i
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0033.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ead4a72-921b-409a-dfb4-08deb76d6443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info: dEpTb5lSL66LPV8xzXHFlD30DDyZVVB3dG0VWejxARRbkJbbuV8vIth3qZ2l2DzuvHWPhz0X0EZwqXET3Ve/EVIFctJfPm8I+BCB8jB7G9fuRtsJJXU42/8QzIY09NisJP3tmfiG08sNH/DQZikQidlQpR/Ag83w7XvzfSOYJF7Q0mYkTEgl73RO8hWPePsadoNi8bAq+evBak3j4HaNblKXectSPblYQcvz2PBEy800KFVdzcgbgmlgNeXbJPxNV5qeuV8Xx2rHgZC8qx05Oy+1/lEnXIcW2DjuzV4LioTb7eEWHQd+gK8n6QiVnvOAAq25fAM1MrlXgrgqDKa6uKAOjMJ4Q2esrVgPDW5tX4uPcjhH+ZIARPtxI8Psld+KDP2EpG2UczrCHHVXLPOPYn9tNdqYHQLCTVyu8SroNqEV4UXKUFH8Lq/Zg+9R/OS3o0+yVBNTXTMh341YiQA7ywTtFKXzqko81RdBPKZeGwxdXDfZk/VgTrgrn8iSLCJh8OGQP+SGSlBloaLRrBAkgv9arPfXvv/P+qTgw5xM6yNUhdGZfoB1Ms+1jcxNfYcCxtW9C+dxyXO7yvWCaDynW7eKwDEvzGnCsm5NilXoSRL9F0eRgUzay7vN1nRqkkfg4w3rY/vgw1SSgoNDfmR494o5YprGnZo55yglX3DLPw4yuY4stADGIS/CRxKhu9NQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBoTnFaNXpTcThYbmtmNVF4MGpHMnB4YWlCM25Yc2hZZkR3WWc3a0RYZE5F?=
 =?utf-8?B?VnVJbVllcW5JUjAybEtobGJKcEEzVUxDS1RCUTh3RHJKa0dCSkF1RXZ3a2VC?=
 =?utf-8?B?emdyVU5VQi9odGpMYU5TNGc1YWxYV014VmdyOXU1SG4wOG1rb1NHYnZuUXJT?=
 =?utf-8?B?RWxOd2hKS0FtQmw4cnk4cjQraTVpWjVQV2JoYmU3dmEzVklJa1dXZkxBdzhW?=
 =?utf-8?B?cis5bGp1TkdmNVhTYjlKcTNxdDg2Vys4WkQrY2sya3FQbTFSUXhwMnVmY2tv?=
 =?utf-8?B?d25xS3BRc1dTZllEZFBweEtIYW9Rdmh6V0FXdUp5cmxwZWRubzQrT2xia2U1?=
 =?utf-8?B?VTJhTjdhVlNYTnNra0x6LytKdXBFUXBIS2wrSWlQckd4TCt1MnR0ZmdHOFlO?=
 =?utf-8?B?WmNyWFFDQ3NkRFpaWlNKWHdERzRqSHpDaGt1YTRjRGRDUHErZVhOeUZBckJO?=
 =?utf-8?B?Nk52VjVER2VyQVpEOGk2dzE4Y3ZSZHhNNjM3Q1l4andndlFrcXo1NjFLdnBJ?=
 =?utf-8?B?UnVNM0VsSlRtNE5udmE4V0dNamxKdVA1ZnhJMHI1K2tKeWN0cHJEZUJ4cjVY?=
 =?utf-8?B?UGZacUMyZkRRalVsekJxaVFjejRSWDFQUllLRE9RZEFOa0dZU01ndFBrNEtQ?=
 =?utf-8?B?cUxMT3pHaHl6Q0lGSUJoYkh4QnNHNjFXVzk1WCtmTlNTNWJTa1JVc2xZVEIy?=
 =?utf-8?B?NnJTbWN6Zi9QMmxoVmlSVFNDL1BMSU5GM0g4RlM2OVlNYVFudFhRS3JiZHg4?=
 =?utf-8?B?cUFxRUZCZEpKaFdGOUdRTmt1N3Z5cHFYWDhGd2xNTHZQOXgvZU1uUjZ6OWh6?=
 =?utf-8?B?cjNiMHRsM3hZVkhZTFh6NVI1bGFZbWJKWmh2S2o1aDlITHBFYTl4ZFJLR1NU?=
 =?utf-8?B?SHZPQU1wejZCUVArQXk0eTJQalpCZWFKYWs5a29pZjV2TldDUlpGTVExaHI3?=
 =?utf-8?B?UWJ3YkF4Rmwxd3ZKWVpRcFBKVkErL0RzNEFOQzVCYkwvbVZuN3N1VUx2MHlS?=
 =?utf-8?B?aSsyNUZGeTVyb1dENWEvcVU5SEp2eXJEMjdaSGpNQ0xZKy85OE5hZWdJaDI5?=
 =?utf-8?B?b1F3TEZ2eW5qQVlIc2I0WVl2VGdEeHFkeUlUS2JNUk9PaEZ6Wk9DRStCUm54?=
 =?utf-8?B?aHNma3FNcWQ4Q25DeU5WT0xITDhFQWo4Vmd3OURlZEVndS9mYjY4YXN1OU1P?=
 =?utf-8?B?LzlzY012amhSc2JpSHlwR0YvTmg2Nlkva29ieTlhV3pHS1A4RFBmNmF5eXh0?=
 =?utf-8?B?WUtMbVBaS2pKYjRINXQyUDRhOVJ0ZmRneFM2WUp6d2tRSTZreEl1OVNYSkJu?=
 =?utf-8?B?S2tOYk51NllZNGlneE9ERkc3QjhMUnBuenZ2VGFUM2F5aU1rQ0pNK0xuMnJs?=
 =?utf-8?B?RkNjNk5aTEhyZWgyRFZvUHhuTFRYOXZGWjJ6NmNrMWFQV2VIOFJ1cWVCQXNr?=
 =?utf-8?B?NVhKNk5FS0RpVGRpR04rRUZtdlNid2F5K0RBQTZ2ODdFYXZYOE5RUmtCdGln?=
 =?utf-8?B?bFQvM0d3OHBvalEzeWV4aElDMFlGZGI0UmZ3ZmVxcXZtcmFhcHFadllldzN3?=
 =?utf-8?B?TFhxTndzSEorS1BjVURVcGRkY0ZPckFxNUVuUitBMm9kMGR1MmJXdk14T2ZO?=
 =?utf-8?B?U0FjeHZHLytHOXBrRjhPWFVuVGsvM1BMZWJMSTJLY08zSnI5L1FjNnV1dW9Q?=
 =?utf-8?B?OEhCTnBOS1lxSEs2LzUrdkRVdGlKYXJYeWc0QkhYSnpmcGpXZno0ZUt6cHBt?=
 =?utf-8?B?QVRESUpkV3NyR0VlUEplbGU2TEkzZVZOUnZmbFd1T3g3UjIwbG96Ymhxc01p?=
 =?utf-8?B?VXlRZnhoT0VyLzd5d0hSR0NGaFhZV2tUTHpXbFQ3OERrZDVyd242b1prSFlF?=
 =?utf-8?B?NlZsbEV1ODJsbzFTeFlqQmcwd2lkeEpUSEhkYTRaallZOHQxWjZTV3Y0WlNw?=
 =?utf-8?B?ZmtkV0Y4ZFo0UXZwWmgvT2FQTGpIYTlEaVdPMzUrTU9ZK0FHbmJyQWRXUnF1?=
 =?utf-8?B?Z0ZPaGV0QWVHLzFCM1JtQW9FN0R6UGM2OGhZRWQyU3VDdVlGQWxubEk5Vk1q?=
 =?utf-8?B?dnlvS2phYXNTbWI4d21DdGlGS2g2MVMrZWUxY01rVkM2c1ZsSTJ2amFsZ1Fr?=
 =?utf-8?B?QWhZMDhlU2dydTRPdWErU3VRb3F6RVJ1QXRuSXJBUzJneW90S2RrMDJnZGZv?=
 =?utf-8?B?eGQwMnkyVUhlUXQrQmxzbHlqU0xHMWI1dWFlWWtvNDBndU1aRTM2VWppMHh1?=
 =?utf-8?B?ZnRRZHR4TDAvUWo3VG0rNEFpNUtGOUUvV1hIN2RPZmVNdzhsL01vRHZwOXpk?=
 =?utf-8?B?NTFmK2E5d21zWWo4aHRVOGxoeUNnNGdVWEpxYUlhK3ZrcFRaRmkwT0pBOGtT?=
 =?utf-8?Q?NA8gYOeK9hYQxWeg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead4a72-921b-409a-dfb4-08deb76d6443
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:15:59.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxVm9yIaHCJnMm58DGHbijNJa8njeubT4dybYjCpd4JNIoZz/B2JYVRL6NqCLYY8IbEvw9w6bsE/CDBk5ICmd7GY5ehpaBkpdc50SCHwhru1smPGQ57GTtjSPdlZ53Eq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_121603_566337_5A9D1C6C 
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

From: Frank Li <Frank.Li@nxp.com>

Remove redundant bus-width property according to video-mux.yaml to fix
below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
        from schema $id: http://devicetree.org/schemas/media/video-mux.yaml

The bus-width already set at remote endpoint (camera).

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts      | 2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts      | 2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts      | 2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts       | 2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts       | 2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts       | 4 ----
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi    | 2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi    | 2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi    | 2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi | 2 --
 10 files changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts
index 9ea23dd54f3ce..62b05fe70cd97 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts
@@ -32,12 +32,10 @@ adv7180_to_ipu1_csi1_mux: endpoint {
 };
 
 &ipu1_csi1_from_ipu1_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts
index 182e8194c2490..c1787510d3941 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts
@@ -32,12 +32,10 @@ adv7180_to_ipu1_csi1_mux: endpoint {
 };
 
 &ipu1_csi1_from_ipu1_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts
index a106c4e3e3299..934b0325e6f5a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts
@@ -32,12 +32,10 @@ adv7180_to_ipu1_csi1_mux: endpoint {
 };
 
 &ipu1_csi1_from_ipu1_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts
index 6e1c493c9c8c4..31996ddde117a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts
@@ -32,12 +32,10 @@ adv7180_to_ipu2_csi1_mux: endpoint {
 };
 
 &ipu2_csi1_from_ipu2_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu2_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu2_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts
index f13df8e9c8c4b..f224273fa863e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts
@@ -32,12 +32,10 @@ adv7180_to_ipu2_csi1_mux: endpoint {
 };
 
 &ipu2_csi1_from_ipu2_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu2_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu2_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts
index d5d46908cf6ed..804ee044be52d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts
@@ -90,12 +90,10 @@ tda1997x_to_ipu1_csi0_mux: endpoint {
 };
 
 &ipu1_csi0_from_ipu1_csi0_mux {
-	bus-width = <16>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {
 	remote-endpoint = <&tda1997x_to_ipu1_csi0_mux>;
-	bus-width = <16>;
 };
 
 &ipu1_csi0 {
@@ -104,12 +102,10 @@ &ipu1_csi0 {
 };
 
 &ipu2_csi1_from_ipu2_csi1_mux {
-	bus-width = <8>;
 };
 
 &ipu2_csi1_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
-	bus-width = <8>;
 };
 
 &ipu2_csi1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
index beff5a0f58ab4..fb18b87adb441 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
@@ -384,12 +384,10 @@ adv7180_to_ipu1_csi0_mux: endpoint {
 };
 
 &ipu1_csi0_from_ipu1_csi0_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
index 6136a95b92599..55647c1dacfa5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
@@ -440,12 +440,10 @@ tda1997x_to_ipu1_csi0_mux: endpoint {
 };
 
 &ipu1_csi0_from_ipu1_csi0_mux {
-	bus-width = <16>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {
 	remote-endpoint = <&tda1997x_to_ipu1_csi0_mux>;
-	bus-width = <16>;
 };
 
 &ipu1_csi0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
index 552114a69f5b9..bdbcad5e35d82 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
@@ -397,12 +397,10 @@ adv7180_to_ipu1_csi0_mux: endpoint {
 };
 
 &ipu1_csi0_from_ipu1_csi0_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
index b9dde0af3b995..40d8887cb8bc7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
@@ -245,12 +245,10 @@ accelerometer@1c {
 };
 
 &ipu1_csi0_from_ipu1_csi0_mux {
-	bus-width = <8>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {
 	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
-	bus-width = <8>;
 };
 
 &ipu1_csi0 {

-- 
2.43.0


