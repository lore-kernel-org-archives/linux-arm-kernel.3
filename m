Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC348D78793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q88jPf+G6KpfZjTFvz1a97IHfjHnZjJ6aaoJGFmre9A=; b=CthegrDW9LFI7UhAfYeYCcaoz1
	Azq08uXcARs6Sa/XRXNrxtk14InS7jyMeyKqqk0SnwjNaUFBI3MGcbCiOfwYpVYn0q5hZZSdKQ4rd
	3K4l+UU+GvhEwgk0V4/+MGbhgNCFMoYYaPZY21bXgtHitJILZFRpgF5+ydz216X3gdDY8PRaNbfJu
	QM6iNN/N+ItcJOR1ZWZWBT6/iAhpFIC7oqk4e+AYVEWSfEN9SW3k6l7ghVeFdQ770HStgRPr+QAmq
	Klb4U+g/IyiApv5JVyWwwGX0IoddT/47+3dMcKLJjzBMOz3OcIRzWq89SyU01d4j0m71ppL9zTsr1
	VGvzDOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcmc-0000000AXSs-0T3v;
	Fri, 19 Dec 2025 15:52:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcmZ-0000000AXRy-0ji8;
	Fri, 19 Dec 2025 15:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKB6Ec9cCu9TeRzhyQu6+sZGzNtmNmPYVRmCgvPMXoCWdkHuj+RRRDWed3IhfRYtp0+1c6je9Suw2n+87ORhC2OZfOxPneU9idePwXS6J8hAlfJH93/7yk3hpz0HRM8DPjaY2fwcRJlI+QvrYBsKM/YqaGzEBdN3vnJ7546xZGE2eJVJQ98s7X7SMcChm6TYc2zoOpBg0K5015IOpldJoAJVbrvnNyozo/hadj/Yy7bo5rAIC/HDyC6KmIZGl4lHcgTUwmlBddzWXEZgqqAjo3oT5C9b2as0uT0SV2ywwVpVlXLIMujswEsHJgafBR3W20NOTy8yKTSSXKQfesJfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q88jPf+G6KpfZjTFvz1a97IHfjHnZjJ6aaoJGFmre9A=;
 b=yyh/4nWOMkwbpqwYZiu/NOmzBk9lRMJWjeQS7gC8lntHxpVzDYz5f36Ew4+CYQnTGdh/pvBAx1maGCnkM8PVtOvLc2SSoXd7IFjA5QClcfipzDig5gck1AWG4Y9gndk1LTQ8Oav2ZH6StbLS95ih2V2qAR4sjLStBuxoAcfq7JKucf//vAhAzOc3Z7aaQSN+R0GozSHX7kcRfUiIV22y+nVazRnyRqsH9pShjUZsu35C5OIaY45ZQmzisRa/Vf5GNFar5BSHhzH7W1SapZNd8ws+wJS2ScfBOmxAfiloXfldkIsHIroo3ZTI2UnJhufqiEiAxC7YYCLowuuIDlHz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q88jPf+G6KpfZjTFvz1a97IHfjHnZjJ6aaoJGFmre9A=;
 b=PmXthdJ5AilOeO+0NQ7NH4t05210tZBVXrsxMzzKag9uYdcHFqtxt2TSO74HuO15zr0qPmyi73/S1+2JSwweQNG+PtI0zEyQo+sJxec+LXPK61gwFqqojay2dIbn/13yTEiZsSUXvS4LvnjdauCNKFILUURFoVVkyzMo6EhWyvHG3aKaORszaUxJPeqND2Pu739GvbZ5XzQ1Gn3QVY1sVGzkhjP+toZQEL1hU7sI/1H+eiH+21P2IPX0mMr2Cjxk7KqRluwMy0BF7QUMUwFFNYZJccetE5+rNfGMiD4R1tTcp+FLDEqA/5N4TW/JxOu0ok/l6g1RG6UVs4J3z372iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9724.eurprd04.prod.outlook.com (2603:10a6:10:4c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:52:38 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:52:38 +0000
Date: Fri, 19 Dec 2025 10:52:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Message-ID: <aUV0vn2VPWKAh5f7@lizhi-Precision-Tower-5810>
References: <20251219083004.3883898-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219083004.3883898-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: 364cd9e2-7d21-4c87-39a5-08de3f16a2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pMqjuZTVCa6NAJ9eNnXm6kizneyeujUL8jf5XCq9BFTzHDkIMRg9/hDgnY8H?=
 =?us-ascii?Q?E/EQ3HE+lAuGxm7q0s8N7/LNGlOw3WldpBuh7TRcmYCxeuqepM1GgNPTpLqZ?=
 =?us-ascii?Q?Y8a6GafbaEK+rQLw9PI8uwApPz8EupLANNktEtPLVw09rGTM6KBOds3QeW0R?=
 =?us-ascii?Q?iGOasRS4JuCZTm6zUHIMwNoUb1EoQHuC7RdUBSeGBCibL+Fx4uefYmedf1Al?=
 =?us-ascii?Q?AkrKnl3mMF4+ltRlT4cbp6dkDBSAAgFZ7hxZumpmLJdcVTFr9vkhqhTwcxsP?=
 =?us-ascii?Q?z8LS87QQv1o373m26LAqvCK8I4xWjgGHCKvZJxlSuZPf1kR3IO5fnMlWCljP?=
 =?us-ascii?Q?cqUbEKHyX2gcAvHnT9jwqjmpeZPBkPePRIgmySHESy0LLo3UYBZ0XiWl8BzK?=
 =?us-ascii?Q?2Jun74K0AcH9wZHYVfFzsMqzK5Udea4AZK9zzY2Pb3WD4mnxHgkJ4XyUf/4L?=
 =?us-ascii?Q?satkm4BxkkVqpTX7FX5ms8NRhv0hhRmHvNZUwu3MGGtjhuCl5JE/lSxIBLGl?=
 =?us-ascii?Q?lI4j0YgeON7FbCpw1CX9sJYyxp/AuVgABbm4zateup0i5B8xFiqGSF0d2liH?=
 =?us-ascii?Q?nLEfbWsowV19o5ji2E2mCYzkrpcqUCq+xOq4Mhvh2HZl0HU26MnwT5r2e47b?=
 =?us-ascii?Q?5gxYlNDCcMUPQcJ6c2fu9wqeL8WedjGImLkBC71XPN5XHdnn0+rT7rZlZR0d?=
 =?us-ascii?Q?MOJD3jjNeR0QEXSl3Xk1F2O9ohLucMbPr9NSwuX29XsXBFuApOo95+mUpZqJ?=
 =?us-ascii?Q?mDHGgziOzmPWNibSO6W+tr566yWqGiG/OWWi7oDMWoCsczTzo5lDasFY2/cF?=
 =?us-ascii?Q?HUBPIMd61NqskmdgOFuyvaYVyp52wHvx4K0J7i2n/IP7SM9G5+fjaCrXGolD?=
 =?us-ascii?Q?n78AsYsV2qER0Zmreb21ytvNlC9okgVe9gSMi3VriTA0xKw8rHyCkuuxbdl0?=
 =?us-ascii?Q?14LQXlqrF2Q4HT9E6NNmT0Pfl3JV1Ixb3cT9aWnkDVhcN8k1wEL8Ttf/CRX8?=
 =?us-ascii?Q?6yRFljzvbz9iOjWXCQdbW4VykGdscloiVAISnBo06nPSsBpYmNVcieWxh5pr?=
 =?us-ascii?Q?OhwtfwrL8fBV0crwb7iEW1+kOP6iKEH7BF+vhJ0P69vnqjc6eFTMNSbZomc2?=
 =?us-ascii?Q?3PLfR6zZWrFihHs7m6m826drREA9nsv+54CXoj3Vb+bacWwRUEvRJLvPcOtH?=
 =?us-ascii?Q?RmYVQ0K8jMFqMsjYLSlwIe4biw2eqbdXZSd8Qr7mc9nFUhuycQsgEwL4i/IY?=
 =?us-ascii?Q?Lhdofu4ntE81A9Df1iRNK0YB75VIoG//Lun1k8aOzGUpnfaWKQwFOQ+Y9545?=
 =?us-ascii?Q?G2vebOmSb0SxwTsJU5msL82AobdlulYs/8iHr8H5Q+T+3BcsbfNRQ1GNTPp1?=
 =?us-ascii?Q?jlfdXdJb3jOG/eNxiODveCbQe9UHQkGeGV5cvsw+w8myiCVrBf1aoZSu0etH?=
 =?us-ascii?Q?Nju5CjKwhxr/h1AkFFxDgT3qufq1OCm5lO0bC26r647gKjAzHY69Ryx0vgUc?=
 =?us-ascii?Q?Hr1KJMp9iHezywKm3KURkLJHgzIiJIxKjnz9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPH8s9XqRJk48kIGe+lwvlETvSuoPrPEGvRMQrQMHf5gZPqp0E0iHp/c/cCw?=
 =?us-ascii?Q?CIsjsWokffPKHh40stCIbo+1RaTP+P6f2q2r5PrGTt/SoUOkjkx0kXpsJ1Lf?=
 =?us-ascii?Q?M4F2n8JR0noXB18s2vLF7czlu7ZXW62IaK5TKp1moM1kt4SVTC2jgdOe/bYB?=
 =?us-ascii?Q?eh6a/YfWtFuGgqJW1jz58+j/GLHqcCnRHjUIbyjhO5knMEpC+PHGmAB7zfjd?=
 =?us-ascii?Q?zpOOnM/osr0lhCDnYGrKmwwaWqxmpSeuvkTKxLXLK6UyVGwX5B513SfRcLV2?=
 =?us-ascii?Q?lqnE+2zB/1EXeU5URAzb8yKrYQtLOC1uSjpe3iNE0AtOWGlQkb0/amqaGrqZ?=
 =?us-ascii?Q?RYwkXpCiWi87UaPAS+7Ac4J0hfwWYvc7RoRFIE4TV4Tc8FWOIt/zd4eCDKoy?=
 =?us-ascii?Q?RQ6COLY/Yepk2acQjy3bzpJDwlIFOCM5QaJWOnz0zpuX1uiAQbaumgAdkxOA?=
 =?us-ascii?Q?qmjGXygl37t/wzi1vuJeZM5fA/W2MS74AGYQd3rls9LbfkMeU5TnsMZgywcH?=
 =?us-ascii?Q?6TKs1r1pSPE0xeg6zhh5B8lPHs3+RNRHRv7ACmra+Z3DSQQIwmbCRb/ynjMM?=
 =?us-ascii?Q?tGgYhOIY/8AJPFkGsmMdUPajeNTB2HiYk5rzY4CXbowYMOnArXJYChFEGCsP?=
 =?us-ascii?Q?NRAm/VxsOaUUHkJlJm6mVU9MIOS/b1QX27pnuncJFhjf897UvKpDmMQ3OfbL?=
 =?us-ascii?Q?2gaFZN9H9Y4pHxSrhQh6QX6dxqu+d89TSnKoD9pfMI8CD7mX32FZM5h8r8kM?=
 =?us-ascii?Q?QiNoTjEK45UTxWu2zXKEYVzZfLVywYuCo4Z+52mD7sOcaNRDGJD0DIbYB5wd?=
 =?us-ascii?Q?Wr+EbvjwQUnxuaeEsJcQexLU9OJ1xE4uciq6nPdt4PGNvMgENU47Cl3CIUgT?=
 =?us-ascii?Q?xOFglY9DzoLfLFQtE9einKvm6PuNwcr7dqHleFa10FFPHCqp+fvHb+lDq1x/?=
 =?us-ascii?Q?3c543hCvzU9MAj1rNEoKIYH9dZYzH662GuAFTPs7pXfGKk/H8zhQCBREdNBQ?=
 =?us-ascii?Q?R5EwtpPrvZYX5m0KK84uRdA5upTluz632brHmUsjUY5NhDVSIcXhBjMz0xca?=
 =?us-ascii?Q?VA4Evn2lRBLyAC0qPnj59ejtpJSEv+JeMJF35Z1bh+TER1O7jTaejhuS0mhl?=
 =?us-ascii?Q?CnMCU4g2lyeUr6YVCp/KIZjnMP0r7b9iuqhcgiL21dlrSGPHo0A7rZKlqW+i?=
 =?us-ascii?Q?64rDyrfBTJ2kdNisgSfiJ8D9cMbKa5F/E5v4aKsEbs5RQWJ3LrNXUyjREbzN?=
 =?us-ascii?Q?Y0gibTZRGmoCeVOY5VZbC+Ac9BeK5ewUq0mQIn0Wj3HnN5epRvb47yi+Xutt?=
 =?us-ascii?Q?ZvaenUOvD5ELqhN6Tqw65Lzg0ydT2sOb2GqIt3Fykjr4rj7X9lzWSWrS1o0O?=
 =?us-ascii?Q?xzuI6hDrDMvHtTGhTtG9Pl4uiwBimJFFEJYO/IvAeXY/BrkCawkC2Dl2tVkL?=
 =?us-ascii?Q?u6ZHvuPpy/C9WSCzJQR9P+rBrPMwafRkySHxg5yH8ez7VA4L+vbUe7T4v7g5?=
 =?us-ascii?Q?lZgVSBrz7C2yUaBzSUZuFNPPz645zwEql80tTrpaJaWrnMTof1CZl67Oogrp?=
 =?us-ascii?Q?/Zgc7wgh78SycT1eMSrPerBnjVSmLljlTmKlO1Kfw0XcBpNqP51s/oQssBAC?=
 =?us-ascii?Q?K0VxuTN487tywOd/sshOkJXpdM7IyOgoamkoYfd/BVUs4a6xtM5oEmssnx6H?=
 =?us-ascii?Q?+KOAbxd3F/UEWOFCJBa+QCW6XwcA0TAlY2oXAKKFhE3C2tHo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364cd9e2-7d21-4c87-39a5-08de3f16a2a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:52:38.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSX/AB539yZZb9/ZGXc/RWm4yMimU6W4JAbyGXOKtBMXqvTUuLIjO5uNAffe+emLEWzgcAsPm9G1KI4ULdHRRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_075243_217860_05230296 
X-CRM114-Status: GOOD (  20.22  )
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

On Fri, Dec 19, 2025 at 04:30:04PM +0800, Xu Yang wrote:
> This is to resolve the problem of wakeup system by USB3 device
> insertion if HSIOMIX on, in that case, the USB3 device detects

Do you means USB3 device wrong regconized as USB2?

> RX term on so doesn't downgrade to USB2, so DP/DM wakeup can't
> happen, with this override bit we can force the RX term off when
> enters system suspend, and disable the override after system resume.

Enable RxTermination_override_sel to resolve the problem, which wrong
regongized as USB 2.0 device if USB3 device plug-in when HSIOMIX ON.

No clear why force RX term Off can resolve problem. Please rephrase it.

Frank

>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 02d9af409b08..0831ed465775 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -52,6 +52,7 @@
>  #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
>
>  #define PHY_CTRL6			0x18
> +#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>
> @@ -847,6 +848,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  static int imx8mq_phy_power_on(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
>  	int ret;
>
>  	ret = regulator_enable(imx_phy->vbus);
> @@ -863,12 +865,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  		return ret;
>  	}
>
> -	return ret;
> +	/* Disable rx term override */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	return 0;
>  }
>
>  static int imx8mq_phy_power_off(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* Override rx term to be 0 */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
>
>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
> --
> 2.34.1
>

