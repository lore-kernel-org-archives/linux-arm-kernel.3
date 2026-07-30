Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F77BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydodu81n7knCIk06pQyWcecZlvdniYL8nY6DdEvlFXo=; b=DHwa8/cDZsYkXHZicA4MHQPeRa
	GvSZ8HVcc0A0RV7vhlVEzCRV35q06f2XQs4EpShw4j5gFgq27j5f3Cs+tHfwAAID/PtOHYApC5EFD
	jgRMZk6GECCRUMIgF8lwlPaOqAV9Ygfknnyj/HyJbtQjKr0+NSx+ll1dN0LAlwrGsUMou0iUlhb9+
	n/buUeUVCG+LdvfIuJEGk5APfQAaf4jxCjLRQGCV8/dWW5ndAqQEuDEC/j338XifTxQb7InYkRCLH
	jxkQfcr+A3RIOyNI2uAYZxN6Trr49jn1vKiXvu/oL/8S0CcBaWVL419XWwGkWAzL1eYppSi/F8ZXr
	aU6i23Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIQ8-00000009TeC-3Rhv;
	Thu, 30 Jul 2026 04:31:00 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIPw-00000009TaH-10L4;
	Thu, 30 Jul 2026 04:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjFThNEIynNW9XmbOUM5m+6mJVreusYQ5RUSUfWjfSyCYnqQPN8ExUHG8/W4d1d9u5kAlMUCvJE0Kda+AuTR/wGc3kx3kIgDAMSUt+vXfoSSZXwVE7aPL6AHW4aTRMOFD2k+XfmcR00sbiakOmgGc85eXqXMz9odCPkNQDPXk3IOFArVgtvlP9QA6dH1LBzP5b9Nq9eEu4li7ozFnVVdepzKODrfNHkqndTu82HVB5pZmWZrUhI09EU9EDjCnvuT4wYLABZtR48RgfzcG489w7t2haxBXvAvwga4pQMOO2IqnZFzRq7XFv4o/jO1NC1fNTQ1kZrHSd3rQ5jy6vSwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydodu81n7knCIk06pQyWcecZlvdniYL8nY6DdEvlFXo=;
 b=mSdhiJ4nw7lqE37OnRzmljUfpHSihNajs9u1gfWDzHfqJKUrUjL3+AS8SbymCRkKcHCFH5T7ynLwIzuMdE9A6+mM0yZEx7SXnNdtRDVzvGmaOpI+1t1l0ipHuw0RipBOjYg+EBgtu+Ye60cbhukaCH/gDD8B+mmYNmNo0KBTGW92E98o0IYtsyjBvdtT4ainC9wwIcr8yfUVriCmRWAV6ues4p0U87G9TTs62kv2qrgqDuJy5msPn4YlaNZHM0H37KPMIKO7KRHRzHF35ut2KXNrOBsbJQ6cE/G7d6y/Ndl6Wu+dPeNonOZo70ETCPQLfWQSQB4XVyqCIic5LN+MuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydodu81n7knCIk06pQyWcecZlvdniYL8nY6DdEvlFXo=;
 b=GDRtS323hhS96KZM0zAwceLnawMEndhQws+oD3GK0b7LlA8giM1O7DhEAlu5zg1pN5/b7v2R+roaIS2tA7GLHusamWDyCi2O/cQ6wh4AhYqsQFYTDXYHGCyaaCw41GcMO9PfN9T4or2he5VSCoRcjBbbroyjUJcwIn5GoVeIRKXgeIuuYZfECwNZWnIG0Ho0y7uPLbpNA+mWkvhZzIM8WvsI3EJ3jFvcnw6w9XfC79JsjTYJ8bQhjHdifboC/twHH7CbzNSRJNTXBT7h19Y2hMAKMAAL53doliPGCDw3XAberAsaWu4sspFbzPWQHw60BOU1lxJz3gwsbL43FS/qRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PAXPR04MB8239.eurprd04.prod.outlook.com
 (2603:10a6:102:1c2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 04:30:43 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 04:30:43 +0000
From: haibo.chen@oss.nxp.com
Date: Thu, 30 Jul 2026 12:33:27 +0800
Subject: [PATCH 2/3] arm64: select HAVE_SHARED_GPIOS for ARCH_MXC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-can-share-silent-v1-2-63fd603f943d@nxp.com>
References: <20260730-can-share-silent-v1-0-63fd603f943d@nxp.com>
In-Reply-To: <20260730-can-share-silent-v1-0-63fd603f943d@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Haibo Chen <haibo.chen@nxp.com>, qijian.guo@nxp.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785386048; l=718;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=xk43Q1BuC+mc13f7FmRacCCWRx3DKBbM1Is8nMAcuGI=;
 b=amyUvjIudXpJLEZhj28OetkTDhE+uFB4JjadETxc6pHvBic3XiUhmM0gotgcV5+5zsBOaWPAq
 IUABqkO+OULAzNeFMiGzuOteXqCoFxzn0xiQAv8MaN97ECE6W6z2NKk
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PAXPR04MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: d116c001-39ac-46b7-4e29-08deedf35181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|23010399003|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0QZDhVzAcnLlsguINv4OhObXuNbYg/Wv6e15ryMEv4w5b9gE55E6NAt1tr9hp3T4xcX0hnPGEfUbKFEzAOSUbm+7X0cTH+yBhKpKZOyn75t7rz3MWNvpZToiKJAA1yuJV2K9/qf9ifyhN+wrukvBu5C8y0TuLR7IcHwOIyn4GkhIKPPKayPMnxZPmp3vWtafb7u7ftt0jRlSsXSzN1StNzZE+MDEV+OeJEgIJISoQ1V65rPKbkPIV96HQnMUverfqi3pYQx9uVGsMdOkMGXF30buxg79dbU7OBhXsySodd5ftqVSZ3lpqAX961LV/R2M64kxzPjStpL2wrYukhI3QTntC7eBAzaW4rq6dVwltbVUyf3vc5wn9OLgjLX3bhpWcHGf00SNsvLOvzkzQdGtFOZaN5J3sPUA108+n059Y2NI1f42g5scUPyf3boWqYWcrXpMaNl9u3K8rqIMlB57/iGtXk2f0McfxJFAQavE0FYZ7nE+MG7wQwM/L0Yn6RrcY0jr/AoP0eqmg6UT5oWAs1ZADzclvuQzeIILsUVLWGxVOHddjdpD3A0BxkQ8Slyh0K4r+ILNoXUVRcgItePiffPUOpitPAD+OrcsKJuy1hdTq0Xws+lNgsnAH4Ql65pXwhQlr1pQuryFtQ3k7IUnGh6xHqvADkAAE5Z+PpptUozk6wBr9SnyoEjVzQDht6zXEL4EGwyq9wDdakbmOCNVeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(23010399003)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1nUzNCWFlHd3lIOXVmUHJUdUdhc0J1WXQ0U2hFV2U4dnRrV1labjZGelc2?=
 =?utf-8?B?SjNaT2hNZlNsTUhKcEZHR2J1UTVRNWcvWHgwbUNhcjc5bktZcjQzeFpESlJh?=
 =?utf-8?B?bDBOMUhMeDJjaWRzVTBWS3hoaDZmSUljOFpMeTRIM1lxMFMvUjJwdE5EVFQz?=
 =?utf-8?B?UkxsSXM3MU5zUnBySG9KTEhhZkpWSXFyYlJhRWF0OEI0ZEt5OWV2dllBa0Fk?=
 =?utf-8?B?K29PMjAvRmQvWTlwZkpNT1paRzYyMGg0VThpTU9xSlJ3dFl3WXBwSTV0TlAy?=
 =?utf-8?B?YlhTT0FpSnJtVXo1RGZJNDc5ekVOa0o0aVhNTmZUK0oyQW93amtCSHJxb2Vy?=
 =?utf-8?B?eU84UDRTdm9SSUp1N0VpZ0JWYk15b3dBKzhXNGdRb0RHMXZ1eTg0Vk5pQzV1?=
 =?utf-8?B?SlcvVTNvWmtvdGxLc3hmYlBxSEI0NzJ0c3dEckpBWHZ5NlZoRm1oRG9PblNk?=
 =?utf-8?B?R0JieUduR0xOUjR2Y0hNR081M2psaFlKSXVjR0lVYUtWZWFaWXdmbVk5SzAx?=
 =?utf-8?B?TVdLbHp1Z20xZ3NqbmdEamtBenQ2Mzl3VW1mc0JvRDlpNm8raFp6aVg5aU9C?=
 =?utf-8?B?V1NoQzVIdE16dDloRmFEQU9kMStzbUQ4ZHRBSU4vVnFDbElBcWEyQmJrdHpj?=
 =?utf-8?B?OTY1TlBtbWhTb2pjeWt0c3pDWUZCei9aUWxjSnEzSU1hdmhEOCtRc1lQekpj?=
 =?utf-8?B?NUt0VTJkRHA1RUxqdjBMQTQ1NHQ0MkdFOUlhKzQ0bUJRN09qTDlmbjltYzdz?=
 =?utf-8?B?UDEvSU9sS1VLVUdDTFo4cUN4aEJaYXg4QTdWSjNNMEM3dm1jYk01SVVRTGFr?=
 =?utf-8?B?T0pBMkZ1NVlOa2VISVV1OHhVNThlTE1oMjd6Nk1TZjAzbFl4UUFRS1dBYzJ6?=
 =?utf-8?B?aDJadE9kcE5DN1lqNUsxbUlVSnZTWVVwbkszMWpPMDFBVHJWdEtKNkpicU5R?=
 =?utf-8?B?RUR0MlVWSTNXZk5kbFFiZjVZcnJtZFd1Wmk2bmVNWmQwODIrRGR6V0VFYllr?=
 =?utf-8?B?T1JpVC8vWUlxMjFILzZwUVpJcDQydk5GOThGci8zNlZBSUNRVVpqYXFQNUx4?=
 =?utf-8?B?Y1dUcERUbWdxbzZzV3FDSk11WXpQandQSWNZT1cweFhJZlppMytCYnMrYlFZ?=
 =?utf-8?B?NEJ4V1dlM2t3YXBLVXlpelhaRERBSFVhWVdEa1haNm9JZ0VOZmVCS3h3Zmhx?=
 =?utf-8?B?R25ic2JNYXpma1NJc21Rc1I3VTdQUlJHYnNPT3RoeVZLMmdnVHlEa1l2bStx?=
 =?utf-8?B?SGQvR3FkaEJuTU95ZnN0dWV1NE9BMXpOc2xPbnk1SWNETDIzd0RPSTkxZGxj?=
 =?utf-8?B?OXRGTUtER1l3dGd2N1pLeFhrN3ZTYzUrcEd0NThuTmE4ZEtDN3Y5a0hoQzdi?=
 =?utf-8?B?V0ViMWJQRDFSekNSK1Y0aGlHR3BPeitsbkxLMXloRGpHRVUwU3VkZUEwbUpK?=
 =?utf-8?B?M3AwZFRPR053RTcxckxWYTlkb01VUzc4dlVqQzVMRkJMMzBEL0xlQzMzaTJo?=
 =?utf-8?B?eXhycjBKVDd5SU1rNUJZSVdNR25ZenlXUkk0VGIyYjhKdHI1Z3pUWlorcFZy?=
 =?utf-8?B?ekYxdlJvbTZ0eDNDMHMzWUdsK1I2VDBMOXBLcmZzeGxJRnJMcGM1NVpGa2pa?=
 =?utf-8?B?RWdod1hnZEdQS1JOR3NxaXkvTzU5OUZOSzZUUFpta1haREdKVlpzRHJFTHAx?=
 =?utf-8?B?M3hubVlMSmNXejNiSjMwSG9VblpMY1FzZHE3aHkxekJCMVNnTERncWEzdlZy?=
 =?utf-8?B?bnB1QituRmY4djdYbWNTa0wzc0pncG5KT0RoNk15SldJUjdRbVlGVGlHN0Ji?=
 =?utf-8?B?NWVWYjlBYkRHbkQ5aXlVamNFaHRNR0t0b1FTRDhYM3VORlhmb2x4RU02SXFo?=
 =?utf-8?B?K3lnT3NXT2VoMURJS0VldjcyMmZvdnZaTkl3c2puQ2g0OEJ3b04wUlpwRElh?=
 =?utf-8?B?M1ZSWC9MM3BBNm9Jc1B0L05MbUx0QlIyL0VTWkxMTGlCVFRyV1lUTDZaaTB0?=
 =?utf-8?B?RTdST1lvWTJSZGRTMXdURllicWxmRHE3SGJnMGhoZi92cTRIaXVFYTAwWVdN?=
 =?utf-8?B?OENlT0dwQ3NpUjNJMEFpL2JwcWZWRE1hL291dWNjVy81KzJUNk1oSDFjUmVH?=
 =?utf-8?B?WGtWY2FkcmE4VEU5WTdveVZVZ1VQZzZhL2huV3hRZ2RiYjJITGR4OUJmbFFO?=
 =?utf-8?B?UTlPOU1qTjdLUGt3bXR2WldPTHBNbkFQUklLaDkzUkNJOEp2R2dOdStPVzQ0?=
 =?utf-8?B?L0llS3dzb2M4amZQNkpnZkhyUFRMTmlJVnpoMVh6d1JTTUFjWUZRdmZWa0t5?=
 =?utf-8?B?bUR2NlM2dnRXeXBOdnZpVDJsTmt2eFZ1YVMzS0JLY3g4RGx0L3E3WUFYWk1n?=
 =?utf-8?Q?WVZ9IwBX/+63stcPWO2Iwo0Qg/qdVD7rFPkQZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d116c001-39ac-46b7-4e29-08deedf35181
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:30:43.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Tn9eIAaRCdDtKOs0M80kHeJZvIaSui7n/5ANFmlPmF1m4Vzco4P1eylgBF1BRZftDKFUgRL+VCo/Z4gaMSKfPJq6u9yufFcCgiAa1IhhUDvCoji5uUz8HqOQc/k1ivR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_213048_315016_47A92AF8 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Haibo Chen <haibo.chen@nxp.com>

Some NXP platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac7300372dcb023ac419f5723b9b32b900a..dde2d72525e0ec15c05f437a727c7e8a1c0c80bf 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -277,6 +277,7 @@ config ARCH_MXC
 	select ARM64_ERRATUM_845719 if COMPAT
 	select IMX_GPCV2
 	select IMX_GPCV2_PM_DOMAINS
+	select HAVE_SHARED_GPIOS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SOC_BUS

-- 
2.34.1


