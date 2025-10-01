Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A51FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux1isKseYcwD6TYau7kY/FyTZaKVnyeDUD3WyihxIOc=; b=e5ljr234jAaNFsRmFdvfn1BCl/
	NXOYryPRwtyHzrc6NzTZN14qlKxM7S8/YGJDXYGF8BAMUy8ABkTRr3RVV56ZgDWMFdLP92UytdCWM
	Yx/cyRNgtYektNT5HC5qqeJYnl6mjZpbvObEZPoLq6G8P7FTcKyNSxZGTQvlZM1r4g2q4LFrB7klK
	xp24NHlAonhg9v1XOR+6PzPH+fQY9FcHriHyo2UeipsdBXoJ7q9/YixkZ6lTjPAO5NNCZ7EIksF41
	khVr7yF2JwiVm/T+ciTZZikgvS3s+br3mXxhr4WW3nBTaA3ro0Lb+eUCJWGWltX0nGrgaheCPmiZo
	tqSwLU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45FH-0000000999s-1Pfk;
	Wed, 01 Oct 2025 22:24:23 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45FA-000000098ky-44wq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 22:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwuDoFka4l+b55zrMBDzOpqXPP+EM+HjSp1tAae6oxWakzWVaUarCnXJcturthLCRdz4mOxLcqWKeCH5Sz8UjP18M7baCuws9ruXA65c+rQJtfggIlAHMk4bXT3vN4/3uUcJ3yuh1aY+TJkFJdbOegDxhlODjn2wAVn6/qdL9rBTbgtfa/6J7kOun1eyX+Fkv8DM51ihd2uyS7MpCTG2Dx2uEWY4aXzOcs6OZ/BUdy34pooz5kg3J0MpQY7cI0Z3awYv2XoCeROzKF0NuRCTA1j0G8nINedQvou/bTbbPhHrtx/CiqLG5OIxAWG2N+sR9dpj9Ux7I5OOxvUrrdlaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux1isKseYcwD6TYau7kY/FyTZaKVnyeDUD3WyihxIOc=;
 b=DvSNU2yVwtn2Nubw9hNZJ/CunEslb9uxYz6GhXGYCfGQ2x4vANMuuSXIvsmonjWV7C/3n/bA9z36SdjRkc5MJNnJcm9NyVaPgSoDFcv9MSMyJXvQGbiMmwrXxUQI7Z0KvVHNhb/cfJpmo410ZGUIAzImR1/QkGlKzhJEyOIDfKyiVCvcgY2kfh+vODOo/29ec9MNoBLEvI9jo5Jo33oC71atG4HZUr9j+PawuDXvSYCPw63m5I6tcIOx4UBx0uCYXYTWU2+VseDwq97ywDbRUlUR5NXivKaGxHLThXpxayRedz0RUmvGgOjd676wAFfk4oTr6MEoB7xsE6lkgdZIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux1isKseYcwD6TYau7kY/FyTZaKVnyeDUD3WyihxIOc=;
 b=mDNLZ0SIqdJWWmUaLvvqh91Q3vNmQ1K0KpHhWUvDlAUQ/4QcjY0geti8VJq098aDYlyTrLLarNhGUvwpit+sT6JDKWPhCHMnRp+BwuKVYtsPdyNRD8m93W8kjD8r98zvbHToIJ/bLyAYbHDJpXiBMY/dhFSLPRE0UsjjwdgilFLjmE0ReUgtlTLaXpcVuD2poZwsp+97gqJsnmJOJEmQp+Nr1cZ9XxOOUfhjTre+aWH2amsPwLBeB+uJlMor/zshW3bVcGTzZBibq5FW7CXk2PTDjQMXbYc9kmikfZs36ynhgqZ7Pe2fpng5Z/fxEIAInfYWHjJHVEmkJWlVMt6DOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6302.eurprd08.prod.outlook.com (2603:10a6:102:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 22:24:07 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 22:24:07 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v6 13/13] spi: airoha: buffer must be 0xff-ed before writing
Date: Thu,  2 Oct 2025 01:23:46 +0300
Message-ID: <20251001222347.3386506-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001222347.3386506-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251001222347.3386506-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0447.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a1df31-f970-4485-6168-08de01393c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwM4zMsYdWX/H6Y+K/fOeETVtwac3xtusO7C/wmorlm3HJiNbzkH0vFzHsbh?=
 =?us-ascii?Q?rqfoK/205YJFZ/JHkCoSxIHolKL0dM4sRMnc5ZeIMSI08HhEy9/LMVrT2Jyk?=
 =?us-ascii?Q?U5ZCBsbcB0bEHh8IHzC1bGUtG5oap03WEXpEr7HjOBFwQbUu9PUBLGjMGD3B?=
 =?us-ascii?Q?hbCCHUXmenDiRDUNqJyd49wQ1dHHKJAnKII1wn8kcJDknXeHgnNIj2xZ/m3m?=
 =?us-ascii?Q?X1g4BKFf0p3Jd4y7vQL7kz5ll8R6K0dUCLmhEdU6SVM/AYbUOS9fuwyrf2YY?=
 =?us-ascii?Q?YV3S9fPdoed0ailWglT4htFu5HNWX4fM7AdQgKuNq+4uckUzvDntvr8L5d+d?=
 =?us-ascii?Q?QTCI+aOdL1ZwF3SJ1j+4kA8M8p6I9IchHTZe31BMj+WVx4zUJNdSA0O4hOQI?=
 =?us-ascii?Q?wz9+u9Iqsr1luxkHU+odgA1Plzawvbd7olj2jifg3BnPG4FKLhFReWd7s58c?=
 =?us-ascii?Q?0FRnTmChdjrwjlC+yU/Bjz7IGSb/bXNvHoCLgMmtWqacgwoR2/LOiXCPhnUM?=
 =?us-ascii?Q?Tjh/XJzqz+lNKt/ucS3ueA3We7ysLLVLTDMIU8fxEfbQzxuqYqtUWJs79o0u?=
 =?us-ascii?Q?rYrN75KRFl00rtVupWXBnH01f0u1ulzNaAbJpH0Xt2Edtf1GWB7dZsJ6dn4n?=
 =?us-ascii?Q?zeOgdl6IPRmjpips8zCVMPhfmnFOi18skugFysmdgRV/vIR4RwTOzoOt4IXQ?=
 =?us-ascii?Q?k7LusXsHuTiFfAF5U0hzj9nVqrFMxOfbHLtcYO4ArLHz6gCK+T+T7uFhojqw?=
 =?us-ascii?Q?KFqXBJvThOOwe1u9XS85541d7D3Q0/z2CHmT2ZKxJ4TiZn1M/9uFQWSWpzgs?=
 =?us-ascii?Q?tea/jS3+NEP2x9QUsjQpWSdxyOUrafjrtXvb2T5q7jPSOMbw3vP8tF2jWot9?=
 =?us-ascii?Q?NxbWVZrJ/TNd+atazSEccXs+gLXQN57vuPh4Ntq7MGHQHBVV08zMuVA1TkA+?=
 =?us-ascii?Q?RO/fxSlvQKPmFEGWqn1ZW39ulh9wvdGh5VzsFM4RFUolT1wJz3KuBgeRtsjO?=
 =?us-ascii?Q?zrRf/Zoyl/oUBsPXyKfzzT9WVLPjxnLVtpHZeeI0M9S7WbI0NVNPLH/A9XsJ?=
 =?us-ascii?Q?TwT6CxvhN/kZjaP7QcGBexCoJuOrR9COA7MnVzAYubThIRSeBEYZmfvcT6uc?=
 =?us-ascii?Q?qQ5f4MuxLIcmuZMoxOQM1ok/LNVW4RZlK8ffp0EaS+iB7row/j43Cft2QDFd?=
 =?us-ascii?Q?ICc33LPI2yV6POvUu/kuu94yTrVPaPQEd/vAgBL+QfJ4mpCBDay3CfXLyGP7?=
 =?us-ascii?Q?y3PAneuIg/uSd6Z9Q0oWxl73PUNjFK0eM7kNhs1Qh1gI1+VT3kEpdEoyKKUO?=
 =?us-ascii?Q?MLjsNxly0Pt/C+FFZ5gbf1ghTUUBaXuqc6QqvBXd71sL6I0yVm8tf0V4p3Da?=
 =?us-ascii?Q?agWx4a70UV19umCUEJJtu7vxdjux5AThSffSYW8JQu2WC8cnj58Zjkl1h1so?=
 =?us-ascii?Q?E6tomPyWY2T8qmbsbFJSeSWIezunLZv+CVA0JQEi6ntlHPR0bqec0YFXh/wc?=
 =?us-ascii?Q?cDmCLq6taTG0nX+QsrqoslwIFeU8wa9vXtIp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UbdRM79pDUH8z8V59IejjUr3KL441vc6JJW/ksgN3mSwvKle7cqtGQadyZCO?=
 =?us-ascii?Q?oQhpbw+Frvx2y31xWL+o0LcO5RskbS0bQq2UJc8jiiyQjbOynEk50XGoO4hi?=
 =?us-ascii?Q?Odkvb/QM4u1GRHr9i4Ejd0lOYHQ8WSJeF4NeyRS64ZVQNhFZey+pLpw0dm+A?=
 =?us-ascii?Q?9llc6K2Y3vemicvdOso+38BxGey7l2p+brK4HApTVB55YnGNpqEbfYpwPbYv?=
 =?us-ascii?Q?tRK0xsQkh1NPGNHvce/vS+9Mhq7eUmb862BnkguaSy2epckEdasB5JroRgdj?=
 =?us-ascii?Q?wr3/WUtGe+Pj9nHA12ePKNMAUHIv77dcBS3o15w4qGNSHvYz+6gAahSQ72P1?=
 =?us-ascii?Q?QlXFHtprDaNNvqTmk7XWAWBjgBw37O+xkZTYLrqLLCdX/u3uTGnMDRzND0ac?=
 =?us-ascii?Q?c8uU+MrEsk7atbtpDph7hNIaGjeLpokG+/NmrGn3B/GPJweONKxHVfrWPRQy?=
 =?us-ascii?Q?cvtwzKOdAR+DI16PkQSRsW2SJ+VlSkLNPcqeVJAf6H14YQCnkThb2tPM03Dq?=
 =?us-ascii?Q?NaeXutSMli549D2HpHkYHFD2B/NO3wEIuN4sOwleufTuG2PQGg7cZS+cckbL?=
 =?us-ascii?Q?/wlpy2k8JnvO8DAVMIt/ofSd5YIkjaKagvwTwAvtNxgWdD4u0IO2RgUoA5g7?=
 =?us-ascii?Q?W/oSUdIO10vFDJCLHwB7qQfVtnH7aoxJxRFiESj3mT6i9iLivkUYanHRXcbX?=
 =?us-ascii?Q?JU2xU7SPhpQnsU2Dyeq2ASHLiDlF5cqB95mZXy0/098ZDyaA6Oa/Tf5IeGeJ?=
 =?us-ascii?Q?HYIZYbcCnM3ZUECjefiepO1npqY/3j9YBH2+H9L3FPNBNdUTEVXaJhLyeSkP?=
 =?us-ascii?Q?dY53/ZhDAYEOtU+7MD9fUSW3OjfY0SQaF4eHdgpnyf1W6hcZiMoQ9E79KY1C?=
 =?us-ascii?Q?6fNt1kuGKzCzGgb1mbEVF57gRmtNgvC6/w8DnIwDxqp/LRUbwHYbxe6O8vVP?=
 =?us-ascii?Q?wGEk0iCo4wg9AyTg3GH1GwhOHv7m2hYgqiG/OK2DxOcFp6Dmf6GciicB94tm?=
 =?us-ascii?Q?xjXgMgndM0eWbnFDGvUXLO/o8YqU+XmjbUQxsGBw19Pcx7lj/UPNihhKlo9I?=
 =?us-ascii?Q?uS1au+Vn2XtznhJk6Ss6lWPjpJOrf/onersQ2HJe4Lwnp0q1vuPNnmvTf0Se?=
 =?us-ascii?Q?WsEdt/BLBCUSLz/UVlzjemuXqWrbMHZy+7u3h96Lhe0ZJOpNGDoiAdKDQDkX?=
 =?us-ascii?Q?cIHxZdQx7o2AppuzFlAaEssmgpEtRYa/g7ta0kqikWm+vbMb8tlST7yzYtoW?=
 =?us-ascii?Q?YLpg2sDeB2t52i/NEJZZHKUc8N9jaAFxDFIR2yeBnRmocZ+272H8BWY0BhUT?=
 =?us-ascii?Q?FUoPRad+K1SBrjXXCvH011T6M5X6NEimCN1FkwYUiJxxtauaetS5jwe9O/rM?=
 =?us-ascii?Q?fZyXFBF4TtHEsSTtSbG8bpDa37ai1Xl9Oeg4kLeHQBX5vvpYjlzR73FgOSoS?=
 =?us-ascii?Q?g/LWiBL41PzaaL6WWuJMQg+gkaPir/7eQBYf/TT1D0SgxiecUGHF8rbjM+j3?=
 =?us-ascii?Q?9fyhEh3udWaVNNstpdGk7A/1/QutzMo6Gk9a3/yDGWdfyXtTc1qf0WMvn4mb?=
 =?us-ascii?Q?WmrKM/AhBZyrsUcdeL7P0WYRApTWBwDpYBJT2nGuF4mzqkG/0/I+dyU4oipG?=
 =?us-ascii?Q?fsJIKQNrojenutUK6+6j54o=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a1df31-f970-4485-6168-08de01393c85
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 22:24:07.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBjXzwalB+TnJP8lT3wyDJ9yhT+0kaCQBvdLqUT/b55iLJFexuDrWD6f56lBAZfc+0Z2N6u3xxHp4U2fvSnKG9woEt6xmnAnd/qFyM8n3pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_152417_115189_5E58FA98 
X-CRM114-Status: GOOD (  10.44  )
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

During writing, the entire flash page (including OOB) will be updated
with the values from the temporary buffer, so we need to fill the
untouched areas of the buffer with 0xff value to prevent accidental
data overwriting.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 437ab6745b1a..8408aee9c06e 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -776,7 +776,11 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		return -EOPNOTSUPP;
 	}
 
+	if (offs > 0)
+		memset(txrx_buf, 0xff, offs);
 	memcpy(txrx_buf + offs, buf, len);
+	if (bytes > offs + len)
+		memset(txrx_buf + offs + len, 0xff, bytes - offs - len);
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-- 
2.51.0


