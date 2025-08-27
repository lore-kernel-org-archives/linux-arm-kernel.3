Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C440DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BajtxDy1l29Njq5BVtvh8bNIfbVgIUc5hkblfc4I9ys=; b=ynzYimhbwyf5G3GDjmeXAL0/Ev
	5WRUOU3FEhqV6sh2cbXuMJxCtPw6J+flw2x1+A751SZYZWZPBQhX/z6SvPdG+HDqz3tOO/xc6VCuP
	IorU3EF9Gt5c8QmD13Ff96RshVNYrn0p0W5i5SOznsq4391N2QDMj6u2DukBjCThB3V3Qo6Cx2KIV
	R6q35JR1fEUUqeCfRWLsXn78kvTXM86uv6tC08wQVRSahowf+0YPYA0MYoLM9rbUw9ZOksf2I/tJf
	b1SMFpbbMQu7OTeKMA1ZpJbyN/rdqwX7WIo992GWmSGLkM0gxpvbRHbnM1B6yfh61JKrUnJTag5Ip
	1x9u68bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRB-0000000G1Vk-1tJg;
	Wed, 27 Aug 2025 15:51:49 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFRX-0000000FRrU-3uhS;
	Wed, 27 Aug 2025 12:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbPEPEwg9Tov5m8ge9ExVEvEF5CvQx4at9LevXjm659FIkNcUAuYtkx4beXROn6gX4eNWSqSjYjoNXUwuf8DPVfm2UNiN/CCV8UMMehZoof82CV6aru50pdftQc5rcK42xjrEbd6JAdO1cYyRmn9e8fL4CNloxtUUGCfre/WOB2s7lRz+PNPbuoTOfzBfOzSszLySbynAwK9335P9H/555Q1WrSTAdPnHHJB1KV0i/9SXNDMQ2urDBscll6WznlKveCN0xYD2PGREPWRzoHWFjBO4zTnpq8xR7ShgOxzjzweJQ6dLixDVFkbvWphisRXY0a6O8R3PZ2dCGNs19e4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BajtxDy1l29Njq5BVtvh8bNIfbVgIUc5hkblfc4I9ys=;
 b=eKhedX2SdRb/9NLiVRuwoOG4RScFld1Ifn4tZjoAj54YEwsc0mXzl2fdpbdKReqlvLblx5Cyvi7BI+1opZK13JbZTJMSPU0ZqK0ETOA1Bwzda9LRTGMZxVJQTx3rWyK9F6jxVzAqVXgeCpFwdTN6yP3ECXa7CT00YFbeh/hmij2GUGjkd9eV5/QOXnxmuM/s1PJdl5VDvuKpaoIix6F7XRGkZPWlGZBp+wffx5LokoXQXjyNJWTZanPEjuxsNTf/0/0BaRc1QvU9OfUESfK4Nl89yiNn2emFvm9h+/yPyet9qMBC9qh35Dra4gAnxAO5E6ux6Ffiw/hun0L9vJsz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BajtxDy1l29Njq5BVtvh8bNIfbVgIUc5hkblfc4I9ys=;
 b=oQ7NsdRlS9gPy99ln4aC8ZdpAGeul4g8XnLIIw5FgBkaij8z3KbRuTfkK5Sgpa70Iiq5v5rQl7muB0xQrlkkH9+viJZ2et+tTyQHCI2cslFSE8rXIv3ofCynB4u7lRUdRTRZZ/NjQ6tqUFhea9uo+9TXaZYor87D9g+0fvnweJH0TcHVPGDlH58Je9pXDG1R3VTCNa/qT85Y0SzDRDziTE+Rzc0D1ItvgYP+RJRBpM1NzTE/gSLWnZuqNb/v5zPqR9euZF7r1zLeYfNfmBWNZlPAyN9I7Oy3LIBe4DKd6GNMEtiAwgGTlKTxoXX19Mwn53UjbEHIk8JpKUE24MVrdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 12:39:31 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:31 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sean Young <sean@mess.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-media@vger.kernel.org (open list:MEDIA DRIVERS FOR CXD2841ER),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH 0/5] media: use int type to store negative error codes
Date: Wed, 27 Aug 2025 20:39:08 +0800
Message-Id: <20250827123916.504189-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f4f3f1-7ddc-4036-f0ce-08dde566c4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vp58ynMfenBgkbCSlDs1DI8wBM7t6jX6SItX5IyndPxOaNDcGqKKiB6VXBXX?=
 =?us-ascii?Q?qSdL5Uss78mSBc7cm5DF1eHpmj10fv2wyDXTHVBFdpUrnsiJYv20qaZsr4Sp?=
 =?us-ascii?Q?yy+mAzfvsHUP+YV6PSAUgWjKNAyfbkdw/Fi0BeRr2lT7PM0pJJjgzRr6K6if?=
 =?us-ascii?Q?Ruk7dYshgEOot3AodYkJoDJ0ZN6RB1x9QWxirYA9ato1quxrRxHi+81iUES0?=
 =?us-ascii?Q?ui/LqeDUHarjdWaXGoy8HbKnyR54FGJUCOFv81Hd4ob29DGXNh5zRux9oLqI?=
 =?us-ascii?Q?buK9For7COgihFW5NdQvNDzNSjJbvAqsR8bTvR2iLgzagaaoOBbhWayvkmeb?=
 =?us-ascii?Q?TNpqOSYUFUUV+GerRvBlnHFVM5bNwriOdEuyI1SWoaa5dvZ1URKiNBF2CMUH?=
 =?us-ascii?Q?YUMFfhlkpkV//q0Zhdam5wa3AivEaTZ/xtHv9HniN0P5TMqqyNyIabE5iPAX?=
 =?us-ascii?Q?iYQ2HPdJU9SzMi3ECT5vfAVE2xC8/BZV8ruagoEpeDWjY9VSNOO5KjwB2qlN?=
 =?us-ascii?Q?+bLxJvGDqoOtlYK33DNXitm+6PSn+Z7pgA/BT6G9soUnHY6sr4C8xmeBLyF9?=
 =?us-ascii?Q?07iSiYOomFU2zyj5AvKYzZSa4XJOShlIhizE8CSrxEGdGvvi5idoiSkZEn35?=
 =?us-ascii?Q?lRgBjusMtd29zjtXfyVtVohAGryyv/Tvswz8SGbrtynlRnbs/YbEqN808GEp?=
 =?us-ascii?Q?d7+UVxo92Bw6j0kj8KQkgFQxij1/Qn5W3QsK6mFhcvUl+Doqu+LFyGTZtjYx?=
 =?us-ascii?Q?72PPnVZByTsE8xO2w8Q9845edt7JuVPXY91tuOKsls1JD4qCUKrT1GnX/pAu?=
 =?us-ascii?Q?IF1Xno6ZBdTT00NmCTfmBnxpqSMmG+ISelaTz0xWK3UOY8wh/xDuRhSRbix7?=
 =?us-ascii?Q?G1bc7+OZI0HYw9wO8lEOPX47Uz4QK7OdLbmo+ylFYsaH9ZS+UoIEzmF5gjn7?=
 =?us-ascii?Q?55qJ164pcNXrMNGsdSCocm0LD/4NVElGqLf09SDHLq20SteFZKWzmfoQVY7f?=
 =?us-ascii?Q?ffM0bHl5XgFC8+of95hzSTZuQPxjFYfRg3Ru9cFFSorZ1quQbma8UagOD3sd?=
 =?us-ascii?Q?KH3HE2KHWr5CgSl05iJD5H/GugOGzo/uo2j1jbDyDG4GW0346dDwEjlOHn6j?=
 =?us-ascii?Q?/KmJaUYe6AR74QrdIyZUtVqoGjLnpGtfJvRAMq4V9oXQQurJIBBjHFw3eVoj?=
 =?us-ascii?Q?L0c9pi+QYDL9cUFH0ylTbbN/T4o5eGEMruwWCncTFCIJ0e0B4k5ghgrAL/SY?=
 =?us-ascii?Q?hLQRhTF0mDJXXZUXd2tngt910xV/N9HAepdzlciDzLWvRTR7rqpuDtIUMUu2?=
 =?us-ascii?Q?XiENGOccUY4EqmtBPpfO2C9d32P5ox1Q6kM/VJOlVQiKLCLBosd5wnGiW0Q7?=
 =?us-ascii?Q?ewikSzTEl1F5pHqfZZtAxkeCqPLTfiMCu6kQ3LSyTLLDeLGdqd0plqZqPTZo?=
 =?us-ascii?Q?XD178g0L/F6w5ebh+166AXrSpNybY/YhPFD3cW1YXhIdzhHfQV7Kr6FTP0L5?=
 =?us-ascii?Q?sZlQD8uSdGOJYNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kpXV3SWxPPadZHfOf7ticy1VtcTTFRXHsH37he9mnIadyqMQoBodiB50s9DQ?=
 =?us-ascii?Q?vdkCHqRG5GTmX4JaQqN3D6kBrRmRnf3wIhl1dNWxuhPNzhs3SA9u8TedPOwV?=
 =?us-ascii?Q?Ve/VR5F8zHok2dUrBtBBibiGOV9+DAAg7K3XBABtLBHPnEXz9BcHiUSXioB+?=
 =?us-ascii?Q?Jl+kyTMhk/Wpf9CQAop6ymflbaR0eMWS5vIOpHs3mDl+sVc0AhzC0vYjSIIw?=
 =?us-ascii?Q?bAKRwGdez/yHy2mNQFvDZ54/es7jxF/L58SOdJsACYWzlUlFjty5bl1fgnxd?=
 =?us-ascii?Q?4N5I6znZCgFdhamXp0HJyp62nv5RLGZ6Cay6ZeML9nmiPn/J5vghdON/rgS9?=
 =?us-ascii?Q?toOX3Y/+cOHB/67jQ65u6gOo50VMLyFC8fD0dtQRGm2WTYKxiYG+EMItZsa/?=
 =?us-ascii?Q?fN4SrMnBqXjgLel9Y050zbqV2MHfc6g7sZiQU/1/FrokiahCQlRM3qW0xaoJ?=
 =?us-ascii?Q?N3OUWK88PGbFjsBCRgU8s+Grexe8/Y1r1lxbITFBb9cnsZKerTqY0p3nVVRW?=
 =?us-ascii?Q?nyX08V8iHuyVygdNXNvSj6S/KTTZsoDPAgIuBo15QW3rxYNGINhznzLaOOKr?=
 =?us-ascii?Q?MS6xsgYqhlj8pWxbtEda/qFHSryX3AhdiUzGFkskLDs4HqxhlHnWCSXkJbWK?=
 =?us-ascii?Q?/7EIp7DBXKAWKJzqhVvj+Q1WXwGURsWiFGcGV8C7UjYiiHJk6GNEeezETZSc?=
 =?us-ascii?Q?+qHkLPe56szHwGaG525Lsqr7X9GGL8vhkH+GnY3VSZ29QWYGLBgzTd01IZvH?=
 =?us-ascii?Q?YDdw/YZ+m5hKAtwbROdfRgNlNSGZUhNdSM/JM5RKJh93bcfoypfXK2nzA6gf?=
 =?us-ascii?Q?SjehIISvZWQuDkqVWGWUnJDFlCG2KzJy2TIDFtkRTYqQJRUpqK95AHBDb/xZ?=
 =?us-ascii?Q?Wkm+qUZNAoMKdHdx6DUkF21idZtWX7f+1nSoHoWNZR70h0lxgE+eijUcwLRK?=
 =?us-ascii?Q?EHDa4bRAx7b+3qrDMXhvH20NgSsaQC3vgqxltSxc2aFjo2625J2IZziqkbpQ?=
 =?us-ascii?Q?d6L+u/qSSQEsG1JqrwwOACGFvcYg9oEzbooSbs2xvWJGLCYKaOfl88ZTcgOX?=
 =?us-ascii?Q?KvYxeodP4ke0yGBZJy8JvBfwj4zBwKxwwLddPc4thpv0t+bXcL+PhDbKLzSh?=
 =?us-ascii?Q?GY7WM4N8KSzAiZF+TY3R3FCU3HRTiUoDT3j3IRUpew1y7ZN3cBRIbqVs4WD/?=
 =?us-ascii?Q?CVg6oOW2bkFK9aHKzDBjETROGh8q5Jn3MKqRbbiH4RQ5deqCr8O0JXLLpmdU?=
 =?us-ascii?Q?2ZrVLfGwUXelk70F0ah6Av3ucFD9RUF0vzJ2+jiurnDy/LMfAOz02dEOmfZy?=
 =?us-ascii?Q?bqgY/idqwDau2jUfXULntNDeynKqIJxVJU3WhszD5Lcwwev0fkbQcUE4yoEE?=
 =?us-ascii?Q?jJRUR4QAmsPCp9+sliWAsyAsi53fqneCHLj8X/XGAL8BdDiySuLDlVIWyESk?=
 =?us-ascii?Q?if1bUfIHox9bmAicruFpriYVO09rVg5z+lSd5GJcB52+sm37IwbTdEzWVMnn?=
 =?us-ascii?Q?TSKNkOlIk3dWffICzcBiRcRhQEZHS2N7EYrjyY0vYawMWYNv57OTHbltmce7?=
 =?us-ascii?Q?jWpgiyyTMlE+8nBrc+EHDejNqqiQppR4vMLgzpwy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f4f3f1-7ddc-4036-f0ce-08dde566c4cd
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:30.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6biuBZwseYDDm7vUadyqNX0Jb7oF7ZKIUt9pqXYUjA5DScxnn/R/fE0xb5gCULmaqUs9ccs0qIhI8JSmFVbMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_053959_966019_0FADD4AA 
X-CRM114-Status: UNSURE (   7.73  )
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

The 'ret' variable usually is used to store returns from some functions,
which return either zero on success or negative error codes on failure.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but it's ugly as pants.  Change "ret" from u8/u32/unsigned int
to int type.  No effect on runtime.

Qianfeng Rong (5):
  media: dvb: use int type to store negative error codes
  media: i2c: mt9v111: use int type to store negative error codes
  media: raspberrypi: use int type to store negative error codes
  media: stm32-dcmi: use int type to store negative error codes
  media: redrat3: use int type to store negative error codes

 drivers/media/dvb-frontends/cxd2841er.c           | 3 ++-
 drivers/media/dvb-frontends/lgdt330x.c            | 4 ++--
 drivers/media/i2c/mt9v111.c                       | 2 +-
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c | 2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c      | 4 ++--
 drivers/media/rc/redrat3.c                        | 2 +-
 6 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1


