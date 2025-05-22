Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD04C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8At0HOS+8LIG7VMd/Ljiv11OaY2B/NFB927QxvPiCBg=; b=HVtY3jzj1qHF8KUgN7Ba4MpAZK
	fjOafXr9lmuFyvTsUfnqu9RcwVuIhuD6nqtcXkxOczIkTM5CfBPiBWidOdGgf4/ZVW1EupiX1S9dt
	ChPAOXlwABRVXz/7B0oYVdu/W3HxVfNlvOYWtvazU13jV1OCuGAjWK9Lvcw/TH5TWHJYs96wT8WS/
	Hb8PjJkv0AJ39guLEQxLhR+RnGD8UrjLatsBQZAQ6/0RiO+TYgjIprwo4jatvvAv5UL7YmgKhQJJZ
	uGOudV3QWP+V7m3qFw1vC2gOgH8c/NvM4cTaW0Oru+ENrXWN3axQ40OPDe5pY5ETfe7tsWHajAU5H
	VXUzBcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Do-00000001Jcq-2hjd;
	Thu, 22 May 2025 14:48:36 +0000
Received: from mail-vi1eur05on20624.outbound.protection.outlook.com ([2a01:111:f403:2613::624] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI71b-00000001H1e-0np2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:36:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbA5bJWb9v68vTiKamtsT7fWKC7+dVumWjgqVXswx+UILsN+HxTDnPiv0AAuJJycWg1jSX58kBklVHXpoSBG4UnWIGoGBxWF6aGlGMud0NZvJhdEzCaEeoKV4e+juYU56fLGmJV6le5MALHgh+FcUSINrBIsMMvCp1BNH8/JPQ0O1cScqBZ1jteAiphl2GZ49wsUmzKx7ZnLYhiebEiMvimCBOff853Hzd+vz5eWBdjGePYDtfm3fiv3cSgpEj1LGP635LDEVGrNxMKm1Ybnn5LOMA9SicEPA8QHaTIKEeRAkvh7Z/0WAId69Xe14FfQKz0rzZEUDj+RYxcQhu/mJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8At0HOS+8LIG7VMd/Ljiv11OaY2B/NFB927QxvPiCBg=;
 b=kZb6bPknkQEQ83dLBM+UmNLMeFyu7BKJ1DdUlLI4Hry/lucJyD471EqdSP2fTB4YFB8lWGePH2Wo6zSNjte9+tql8t4KOqewubTtUxn86x6ONHcroz4WMlfznDncfDudzZfltXYT5LTB6SqWxk5Ry/1SpbCuoyJ9hGti7dQMDgqnlFt/QZ/fekHjivv1dWjW2M3+IV+LlZ8KakNBGKvjtJN4OX7czFvkhxD1LkCLxoDY0+/d0nol28uV0LWzZY+qCWMAiXVXdW8nbCszxTLfWwGzvcQAEqYL0ZsaLr/1DPaZVSARO+6+puL//9IRhRMpPmlrVnUvOrgi0pDpi9cJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8At0HOS+8LIG7VMd/Ljiv11OaY2B/NFB927QxvPiCBg=;
 b=IJ7maBlRS1eK8q8x5xnPBF5sQrZF1NP6fjeYmqnG/Pt6EIk19rfCl+5rp9dwQ/4Ojoj0XO0SpIOZeR6ci8JWnNuiTkGSxU7B6YXN6D4UsA/o286vBmQXm0rxTQIAb0NMstcP5wHMDMSRSYDdlJN+gvYcRLqkmq5RK7sXftmX2MzbWH12DM2qAb3vUco3nDaek9p7fsxGSsV6OCoK54WhBMYHQFOfkzxGDIY9h3NGYBPkZOZiJ2Pu9fi1S3GVCWHH1bdz7UgIuwjLM1xNUXbi+ys5/7e3hvvO9ro6Ax8MZ6Y2rhIAGC63scolGYo2QI5AnwPTiELHkgKIp0KjEOJysQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:35:55 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:35:55 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v6 3/7] media: mt9m114: Factor out mt9m114_configure_pa
Date: Thu, 22 May 2025 16:35:07 +0200
Message-Id: <20250522143512.112043-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0192.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::16) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ffdaa3-1621-4a2c-c63b-08dd993df58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dE15DvznkN5XelCCfn/42ZLSzQMWP/O5mUPipoDE2LnNw4rPz2A6GtVg72cJ?=
 =?us-ascii?Q?zoqCpS8StjkQ/XH586Kot6N5U899vT6LKvTzkZr0hg3jMf2ZzyPyc5dbYUuq?=
 =?us-ascii?Q?v56qNalUgt+vxA9DwePo0AyzQR97m/xedOMfzykym7HMoSmU9EBH3MDUuNfm?=
 =?us-ascii?Q?HEhSHQIkFq6Z0TCguDcSqIMjYE9qaXqKBu2h1BGu1SknZ9QrhGVQJvAsqPEp?=
 =?us-ascii?Q?FnX8j7hFvBxOE9UORVSzl3OCQN7m7BdMo1WAVvWTINSnWx9B/GPQh58QQuwP?=
 =?us-ascii?Q?GX/m/GeqiLSLSeQdATVwgwg3EQwgiJtVuXaSmtXlVDmXJ27n2F/ZGx0EcQ/+?=
 =?us-ascii?Q?q3H3cv6L8Bve6eGdz/7CbNKHPH7Q4a7KLRvsX4181beWVIB2uuV7GQvRbz3r?=
 =?us-ascii?Q?n5b5ny6yfUkfEKgBqiip6Tnpad8AU8VyvFbCxJTnhVhJjVXC/CYzrUYF7rzu?=
 =?us-ascii?Q?niVWMu7g1+vB1n2/bw1hMUdHeD/Il2UEZcJMYo16aEHmkxBRrsrsAVTweYHr?=
 =?us-ascii?Q?wlhq2BqCzDfWbfjmlWEgGR6gdLLqLVT3lRoA2wUWpYNl109uzDCKAseM/z8p?=
 =?us-ascii?Q?q1T3MDPaL9v04tNHfINmsYDT5Py1Eu9a3n9Px5P4GxxrE/aiB1mOfw+O0OkZ?=
 =?us-ascii?Q?Os90KEmkfWQFMw6LQFdEjHaeAyvFDzE0i8+504GQNH0DD4xXVlweNaEwQavy?=
 =?us-ascii?Q?MXDEi2oyeiNUhqBxdS7bRuoQCElGKORBN6B1MqfRQXvS1ehQs8eNyIl99LYc?=
 =?us-ascii?Q?Cx/ilPfiuUk0Z6tNqqVU8gGo75ubWirnzsOxxDEeji4AgZzM0bChNe3eD6R5?=
 =?us-ascii?Q?2nUE20q6trXiLX6D09u+rlYGHLm4hxTeSCMoVKoVPaqDDmgm1H3YW0cNZGNg?=
 =?us-ascii?Q?m/owGu3b/oRSCmPhJDZGhIGjl8dqbJMzVjzxd9M+95VE/yEtXcW491HDxLOP?=
 =?us-ascii?Q?S65c5/lWvnHsCQsIjpGw1+l2Hyn77dGvpy36fVJQMUvLPKBDl7wilvls6JFc?=
 =?us-ascii?Q?m8kwUL9qxts66jfCPvNkC+9WH/ku4R1ue/T5JaxJDQmG+HEEeO9zhVlF5rzv?=
 =?us-ascii?Q?bCaanZ/peJkyhfjhhytaPOJzg1v7foVDQqnyRyTcPh2i/nrJ4vYNe3SVITN7?=
 =?us-ascii?Q?vo+kcgMWaNBr8Po/OZQgPa1d6oYMfPo2D+MzhyS5//ipfLwyD4e3msBC3Xkx?=
 =?us-ascii?Q?vWBWezrtNHrDrR/LLrIUYUOnYQIiX6MYINanYzSlDbtWwh2oDTfcfwBd4j2Q?=
 =?us-ascii?Q?uMXuYu/FZAfBvuuxD2/uzxSdjppCIjLH+GxXGh/unU8g9gMp+NorSMfKQSUf?=
 =?us-ascii?Q?qKEySqS6WThfN89lRjLOVMgLiSy+ugHLnHXyH+2Q97+L1SWR1SnnG2igRqxp?=
 =?us-ascii?Q?/kzk/WCbVVbcOD+Sfh13hVJFnbpwOxWHlNxvwitgOB0Il8KiZ5fUq9kUSjBk?=
 =?us-ascii?Q?+voQiotZoRclaA/mTAuBQpaz6/FCcsM/GIUnNss39UKlvVziHLFpJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3hVcN1lGyKEDFICe0KA/m8YGXZp1zDaYZu66oKTXos/+bwSi9BQQf2gRdYar?=
 =?us-ascii?Q?4p6codJacdrf/L5KSE76HBhGMHoHLunF9NjUqHJAzmuoBTGDHI2tleAlqTj0?=
 =?us-ascii?Q?mGaMmJkN0zpPFluSHRTAoyqkzoGsh3/IIOB2jCvushb3ZkaONBKufp2Gs9Mf?=
 =?us-ascii?Q?H0ksKkaz/BNeuppv1twK9uDnjhqbdX2KzZGNam4GBwUAd0PqZzH6+y+LKzLp?=
 =?us-ascii?Q?U7MVOLAVWGMK7rpSWIjnn4BRvZINzaXlUjSuJyyyT3QIvVMbYu9VtQPoVKAs?=
 =?us-ascii?Q?XU2H7RnNLyreKGiTQrWWEs9Qo/eMuKAwGgZ8fd1uV12ISqzllVJLv3bFPp+V?=
 =?us-ascii?Q?K3eYaMi9y9/VdC0Xx99gkyF6njqRJguGBZup8dLJUfoWPCFQFxVKdzY+Aop7?=
 =?us-ascii?Q?s/FNmIg/fVOLaIX2DYjnlqEi50TsqFzbUK1v+ZJkaWH7ki5GLfHPUlj1S12d?=
 =?us-ascii?Q?0YA+lPFeD4ZclIxGE6MD9P6FJNzaHoVUKZ5lpvGthnkDVPBykE9qkztQus37?=
 =?us-ascii?Q?B5uc0tBWx1cRA3t2G5EdkzEOICYDDuzEojxTA2hBtuQAbiT9T0RohnTh9ztA?=
 =?us-ascii?Q?VKLC6of6L+X7B09/t/YPWSanWnznx+J7oZFmRxVikDIH4kBEkz/3bsipzgp6?=
 =?us-ascii?Q?JP5XZYYGD+giKfOYPc3xphy/2zxNzYubA2y9+0ocDD347qL+PXB82hxsO4yz?=
 =?us-ascii?Q?pKN962rHgt0dJc1RqgMQFdS8m8gLFhFVOZwUE/SBAeFJLpAOCp0vVGIvqQKH?=
 =?us-ascii?Q?op22LVz3FBySJZEn6Pk6MzxmDd66TYaxS67nZpVBSFuWgLyTjHgRTAfU9hQc?=
 =?us-ascii?Q?Evmuk3MVrUq1wgrz0iDXAmu/tzlYp/sLsOLm0bpBajNYZWODURC3qVVVw4K7?=
 =?us-ascii?Q?HZsytfRLcjkRF3YWsGBZS+/WqjxijnOzjFCpDnsv2MOg/49M5kN7h9vWfE89?=
 =?us-ascii?Q?qpNSCcx6GJjTB5Kmz5gSM89HBXEG9Lfiz/NlDqtWYUPFGUD6j4iJRoQ8Gib7?=
 =?us-ascii?Q?bmQ1ADGSsnwyG1a1f/czGHgYSE40gMUWr0FhGNYobYzWyukZPqb3U8vqNf6k?=
 =?us-ascii?Q?lO8B9RxLHVEM4fToE54LtBxthNInhzAyjQU4gPWZe9I8fpT1SMeHgTcgvk23?=
 =?us-ascii?Q?2OwBmnbL04v/YmQ3vT7tZfBqrKxC1k8ZkSlS9vtblNL504F2QHqGOp1GSB13?=
 =?us-ascii?Q?a7q3OfamdHVE6T+DfQnoCbw1L1YiM5lII0iK5cVjP5jySBGOMYnf6N90keVQ?=
 =?us-ascii?Q?uGB2k9Ha11LIiAnXk1UExM78/CoNT9ZfVqxDyAOEe/cbjUpDltyfKhAOtQPQ?=
 =?us-ascii?Q?elrPWmmW6LxERQfrYtXE69tMAWKe8gLvTK1DDcHkzE5QFd5JMZhohgDaZGm0?=
 =?us-ascii?Q?TCWBXVNQFKj78SuG3xRntXtBp2mHIspvr+dvWAEFpvSoNGvfU2TCeIyJakAR?=
 =?us-ascii?Q?x42+05lgXl8VFbmb7Wda7S+zFJPFQYxMLaB0FhfeNw3ECI4UEJwUVOw7g01Q?=
 =?us-ascii?Q?a6+5+0KZUb4eU9AEwKNM7Q/svXQIkxq7YYrdj/ZdjDAl2CYNnPb+gPqo5LBi?=
 =?us-ascii?Q?C0VTMITzDT9LmjFCiArfracLN7AyueL72F8afH7u?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ffdaa3-1621-4a2c-c63b-08dd993df58f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:54.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCs6xjexG8HsRn/p6vNMHAGCl1dc9qianVU6uSwAwyWGpypcAV+rnsKSMxP8jPsYo4yFEQfZviRX+6PpFj6A7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_073559_400388_0AFC33ED 
X-CRM114-Status: GOOD (  15.39  )
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

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m114.c | 95 +++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c3ec2eb0b134..6c80c6926aef 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -790,41 +790,25 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor,
+				struct v4l2_subdev_state *state)
 {
-	const struct v4l2_mbus_framefmt *pa_format;
-	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
 	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
-	int ret = 0;
-
-	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
-	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
+	int ret;
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
-	hratio = pa_crop->width / pa_format->width;
-	vratio = pa_crop->height / pa_format->height;
+	hratio = crop->width / format->width;
+	vratio = crop->height / format->height;
 
 	/*
 	 * Pixel array crop and binning. The CAM_SENSOR_CFG_CPIPE_LAST_ROW
@@ -833,15 +817,15 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	 * example sensor modes.
 	 */
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_X_ADDR_START,
-		  pa_crop->left, &ret);
+		  crop->left, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_Y_ADDR_START,
-		  pa_crop->top, &ret);
+		  crop->top, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_X_ADDR_END,
-		  pa_crop->width + pa_crop->left - 1, &ret);
+		  crop->width + crop->left - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_Y_ADDR_END,
-		  pa_crop->height + pa_crop->top - 1, &ret);
+		  crop->height + crop->top - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_CPIPE_LAST_ROW,
-		  (pa_crop->height - 4) / vratio - 1, &ret);
+		  (crop->height - 4) / vratio - 1, &ret);
 
 	read_mode &= ~(MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_MASK |
 		       MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_MASK);
@@ -854,6 +838,29 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure_ifp(struct mt9m114 *sensor,
+				 struct v4l2_subdev_state *state)
+{
+	const struct mt9m114_format_info *info;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	const struct v4l2_rect *compose;
+	u64 output_format;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 1);
+	info = mt9m114_format_info(sensor, 1, format->code);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	compose = v4l2_subdev_state_get_compose(state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
@@ -861,18 +868,18 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	 * not in the hardware.
 	 */
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  ifp_crop->left - 4, &ret);
+		  crop->left - 4, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  ifp_crop->top - 4, &ret);
+		  crop->top - 4, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
-		  ifp_crop->width, &ret);
+		  crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
-		  ifp_crop->height, &ret);
+		  crop->height, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_WIDTH,
-		  ifp_compose->width, &ret);
+		  compose->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_HEIGHT,
-		  ifp_compose->height, &ret);
+		  compose->height, &ret);
 
 	/* AWB and AE windows, use the full frame. */
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XSTART,
@@ -880,18 +887,18 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XEND,
-		  ifp_compose->width - 1, &ret);
+		  compose->width - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YEND,
-		  ifp_compose->height - 1, &ret);
+		  compose->height - 1, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XEND,
-		  ifp_compose->width / 5 - 1, &ret);
+		  compose->width / 5 - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YEND,
-		  ifp_compose->height / 5 - 1, &ret);
+		  compose->height / 5 - 1, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_CROPMODE,
 		  MT9M114_CAM_CROP_MODE_AWB_AUTO_CROP_EN |
@@ -903,7 +910,7 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
-	output_format |= ifp_info->output_format;
+	output_format |= info->output_format;
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
 		  output_format, &ret);
@@ -934,7 +941,11 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		return ret;
 
-	ret = mt9m114_configure(sensor, pa_state, ifp_state);
+	ret = mt9m114_configure_ifp(sensor, ifp_state);
+	if (ret)
+		goto error;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
 	if (ret)
 		goto error;
 
-- 
2.34.1


