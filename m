Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBECFCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dRCvTWGOl4rtGr/7ywmzZT5k/xz39aVGckb+LebX9Gs=; b=2qtU+upyw22j07s6J6joGW9/Fg
	GwsqGJ2H4KXQ2JP42YnkHP8S3sdKg2qmK98WtkJt03HHY70v42PyrQ3W7y4608/Ca6QOfc3ZJTPJt
	J7qmVk4eX6P3ErSpMCXj6/ELhLDHEKRTxdP6wjxEF+bjq6d/bGAuf+k9AeefeFVkXXpwp7/zWf2vz
	VIvCU1Ar+I7JY1FxFuUW9vYhBP5y+hXWA7UR/KjqjtQYJaJWgKDf79FHsCO+nblv8BYqaAxkEWqvd
	/KOQRyprOmyqHRHwFGhY0I1s1HsrHAvtTHhcoX3VxusBwxOtP+UEY0Y4LWyScnqwYwBNVhPdDtSEL
	vaVB/SrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Gq-0000000GCKm-2yYq;
	Tue, 21 Oct 2025 07:59:04 +0000
Received: from mail-southcentralusazon11023142.outbound.protection.outlook.com ([40.93.196.142] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Go-0000000GCJI-1uNB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na5HTHXAb4zYbrwSzcGiK+5SZuUQD9laJPWfCZnOHuMtFPYh8a3ZJaCoRsLcafqVJdKBZCId4tpj2fS2OVf3KvMmO18yVjJLmrvMHHQTZ5s3s4neIqX6v40gFU+UYD7KAYcOBMojcrtpkAg4IzbYbX/A37ZTwZgloAto4jRQ4a9CrTiVEVEW6lelSZdhWcVGCuzs4hZhkZbOWJ7MGL62eATHgmZ0b0a+LXRuep9MceY+90QVjsHO5ga3tF4NQyFtk3t4XL2g8xthUSCTtwNVxxCZiTt4dcuvULCoTSEYwB6P+6Ge+YMtv8gWu4Lwuky7JdJuwfmMSBl9v6gOW/Ztpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRCvTWGOl4rtGr/7ywmzZT5k/xz39aVGckb+LebX9Gs=;
 b=wrOHawFn1Oy/GTiZJNfmD4Dhb4EEq8XAHyWstd6Vg6iYaaLj6F+9vHCcQPn1O03GlBPNsD6rEskPSl8RTAzZcdlsASpuHDd4Wu95ZD8LwatOK60SgA75279O5GgHZuoVtNLMpPp5wR32qXWKfyv2mfKhJLR4YV0jwa0VrfshTcDc8PqSQ4yS0dL+D2tVNpt6xBnUGHq4BdxkL/VUSWWtznLb4SX8yZoAegVrVZOsN3Sp2FqZPBxAV+E89VGclC0+gd4xO1e9wVCKRpiMb5+gDyj7DUwcrULV5D1MizDkoBiw5oWrqRU6vCZJYIaxA0RRbPnuT5NK/UaUU6/kiP90tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRCvTWGOl4rtGr/7ywmzZT5k/xz39aVGckb+LebX9Gs=;
 b=PzRBJAP1OR9HiFoKKwa/VPdP0p01gJ/fsOYI4MUSkK3qUlstSmoiFeHy2NaP2mWdz5z44gIVBLWDXyErzSWS0HFfLQP2mki/UxzpmZDKOKxqRcxQbdmussCitfuErSXNLeq2ECFpufnW3KTzbJ4b//Sn4WwDQ3my/0g27SOfaEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ0PR01MB6208.prod.exchangelabs.com (2603:10b6:a03:29e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 07:58:55 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 07:58:54 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	geert+renesas@glider.be,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	soc@lists.linux.dev,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
Date: Tue, 21 Oct 2025 15:57:04 +0800
Message-Id: <20251021075704.527626-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ0PR01MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c77389-ede7-497b-ff12-08de1077ae37
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+gQBX2TrzU2trwvTtXHGTJMCXdWtBTGEHbwFMozOAubZz5+PjfMaUlZhccmC?=
 =?us-ascii?Q?ZUSoqPo6PySzJtJ4x3+6dSzA4Q5pzHeggCW3vTsKMIp8ioLTod0N70ePSrPJ?=
 =?us-ascii?Q?DQfs1DcN4mQG9vCqIrEDZ8zh1RkUaPDUWANqhDcYaVZqqHIhY00E1On7mj6l?=
 =?us-ascii?Q?I3K0v9PUSb1MnHL1N5MmgrhbzWdFvETqRFJtoeVQgNsc4yt3d5KOVLpjIcXR?=
 =?us-ascii?Q?3GDhGvJ9t2KwIOmIk6uuN00kqksuqAbg7qPP41kUYslZEKeCPt4wkJkH4egz?=
 =?us-ascii?Q?BbksUA4zEctiPhd+4gijNi/b9KLeUHu6T9P8KPOjeZjJ/TfxhKrCT0un0ECG?=
 =?us-ascii?Q?LJ/xdg8IFKHRvjierK80T6exTVHCCGCQj4SGnQ5RIPRr9+FSPw9gNkpUg6/E?=
 =?us-ascii?Q?5mtuP879YM95wjopt8C6SX3o3eq6LfM2Ao/L2ot0kupu8CqDHok4t1R9kbJG?=
 =?us-ascii?Q?OcsqXgPhfde1GLlWj3tH52rbgjNLqWq/UzuilwBVS+EK42ZGPPIuJj2pC44s?=
 =?us-ascii?Q?gTGMdRWxb33xTN/zESYJolJpz9mlI38BM4aMo1zr7b79+xLdlTanF2CVQPRt?=
 =?us-ascii?Q?AC3wWayv9TWkhzvwNVVg1ot5kXBRIcQFp6QiK4fzBDZe7ELaexmu6nnIZPOX?=
 =?us-ascii?Q?4as7N9nmrV2ELpDRuAaEkaGFvQuREJNJvkdRa3JzUjMnv2aOaiKDaDkb+/xt?=
 =?us-ascii?Q?4FSwGqjPaY1J2YqmBDlAQaOz2QgRIdYbL6leCsUQ2OU2E27x+LbJ79c4gLNv?=
 =?us-ascii?Q?D6/Wquj1o5jLdajuVc66HdM+4+q7OM6eMnAGHUeVjIoFH8mNppJjivsm24qh?=
 =?us-ascii?Q?kgkFZbB9w6wM506oH01vYtUaS0gmDvA0Yd87f93O9e9tRyg6uZ72Qz49vHJc?=
 =?us-ascii?Q?T21LGWJpliuj1A27tKxDmqt8hA8EuNzm6+ca+gpQRxCOoQ87iOjpxgDAV8lZ?=
 =?us-ascii?Q?rd6l+vCgDYGW3dtYyT8OLKAJtut0pi/5oEnnAnWsY6sr+JDfZxULLyNwG9K6?=
 =?us-ascii?Q?JgnD+XqGTNJcCWvHTwuT1tXlzYMKRYd7lJKw6eY8bG0SzAQFhAHvnmwH/w+9?=
 =?us-ascii?Q?ZB0I5oqJ0zn+lMQl/BT+m8Y2tzdFtfUUvK+BGPi6nPhtn98a+6aro7x4vm+g?=
 =?us-ascii?Q?kGxGbzZAeZU8hz4xXZDIuUZNkgFenDFw8e06Z75ZVM+fq9/bqEeZ7wTTT7Zj?=
 =?us-ascii?Q?hCBBLC8IrH1+wikLTU7ZuIy2Wl2dRAsuO3hdlULHkNX1Jcsqal2Xfq2+JgqQ?=
 =?us-ascii?Q?KK2m+EGhy1FKcuCoYTceoCWY9KFY3SwOOQxcAudxYt/87SOeWdwB6LZzl0lk?=
 =?us-ascii?Q?KDnNXcSUn4fbX+P3KrhhMXWZ2o/gDIcxxQU91KPxgCy/pxvFydLbvC0KJ8Qt?=
 =?us-ascii?Q?eb8xFCf/8mypUCmGNOkfItzZeW5HUNIB42ysQhWNPiVRlp1rL/V5jn3UVd8t?=
 =?us-ascii?Q?+eZbLnrjaJGDpC4pkS7xNO9ONNoJPDKo97wsnAWBxkf8fkYqQf8SeJyPTZFF?=
 =?us-ascii?Q?CqCXrGDOfPgk1zoaIsUnvWUQgVeNtHUvTYca?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u2+pjrP8Ovjl17TwBaAm21ZZShJBPcXRv5B4cNsjsNtpaFNTVJA7w2/wlJU1?=
 =?us-ascii?Q?cTSeTgH9Xu/hS8JRsp4nEGOzpxMds7BCBDDVz5J79ZU/Bj2etAoIpsQ/n6y5?=
 =?us-ascii?Q?YxZ6Lf78RqUs/ySxISYyDXyRcTHIV5hV95Ey5EbXqNoHlzrtbmZi/jMKTiMu?=
 =?us-ascii?Q?xNYBR535KACHmGp8R4B2m1qrTb2waAOOzos5WPFa3aub5J4neaegRsUjNYdm?=
 =?us-ascii?Q?fTw9uIFGGP4uJzkONlR8SkYw+16yeJlbTKSrXKnEN4dFfZo8NyZjqDKJifiU?=
 =?us-ascii?Q?xiF2tVRlbP0wzn1s4jEhLhrUM7Xbb8vOZtqOZb2QyRGz+ebPCUkUFj7WWJPO?=
 =?us-ascii?Q?RpZiyWcWdvxF8P0Binte+kdnqGQ9+iLBuhC8kI/GRBVcLtYo2fM2nM5VRM89?=
 =?us-ascii?Q?paCRckVb+Nmx9Vf4eh03vrVmGPITvR3iiRNCYxDQkXyCnehbB9D8BIS5Hjb5?=
 =?us-ascii?Q?YWipwVijzs4M/PLR/i/0WxZCn0tlpCyLZAIuaQg5WWh1L1Q8kgq7wXWkgCrO?=
 =?us-ascii?Q?OOdDd1RiYuM8iApr8HX8ZEFzWtJXp8cJKblO4pOS87/3wVUoqW/ptkRKOYYL?=
 =?us-ascii?Q?UTpz7MZIXOiqYzOuIgyqQNLGSpv/fuc0mrJsukwle/sz3A/IM/Z3JElm6LsK?=
 =?us-ascii?Q?6HTJZZ40MefIzkBROF6RBAmDVMr5eenAJQqhlM+8CDsqAQFlwyzbs64ugFJH?=
 =?us-ascii?Q?TN88kYaAo5P4qj42FkzI0TNvUMHyG+3iYC8GpTXZNWrrjHs1Xtgx0xwWXtWa?=
 =?us-ascii?Q?t3yjPtx7/l4//L9wHl9BHQT4Uy86rAj8zdkJuUKTMAEhmk8j9qwtDVAnCLTh?=
 =?us-ascii?Q?k2+kGCW3aNxsLfKcUYSMiM1a0hC9ruGYNsZq+fBYbYsb6KGjl9Q1Rn50aBna?=
 =?us-ascii?Q?iLEXaOxZI3XKXg8jRrFjUAmkWmOCIBiR33dkRqvyP/d9axDGLjibTktlIay4?=
 =?us-ascii?Q?gfwjcv2f9AV1921ojz/xplGDuOWzJHP8AMyiDvtKLddHG3bFdfsB+1RIKmKo?=
 =?us-ascii?Q?wF9qWSN3D73lrAG6TVUmcDtf8zE/0wQESLYdqJLyiHBEU4I0ZT8A2Bihhjig?=
 =?us-ascii?Q?FSnjyscTYgpWJtLrvqDYtEhF0IwWYGstNr2jC3Do0034hkA9N8GDmPSRc6ue?=
 =?us-ascii?Q?gbE+DtZoTqA3Al8+xXy+NWMBLLiIe0HesXAdjBikBXt43cy2zz14lVdct7OH?=
 =?us-ascii?Q?O+/B+Ve/WQQI2pVAmaXzDLxvGgmIjcQGt5Jw7pnVtkBBaZwf0g8H/XQyOEcd?=
 =?us-ascii?Q?VcLyUiYpTeA/8xPDo49bLDdCcfPvBexHdykR/v+vXynxAB4lFVFW4sBWkETu?=
 =?us-ascii?Q?klZh0u8K0mJn7sTowvUEdYJ/fDHJ9b4uCd+Emn4HfmM3AGt9LU5KSw/FBCfh?=
 =?us-ascii?Q?My9qCMahpufgnpDD6c0AR/XTRYQVFp6mkNPxFyWr5tkYv82jUsmoEHaV4pDt?=
 =?us-ascii?Q?7xFQmk6NTVsaZH0O9xLcbMn0/+7q1Hz8pHLTE+KrwCSwaGLaHotx1VkF/bzP?=
 =?us-ascii?Q?h/sDOK0yePMHEgdt2PMg+lJ+g/SvKepSoZlSxZ+SlH48D/sTr34jzD+2zBex?=
 =?us-ascii?Q?8erjZnPYfOaYXyCdt58rqMfzcgmqtwFRZiynxoTgGvUtBjGcs0ZUzXvoSZ4X?=
 =?us-ascii?Q?nRedyhtjdKg4C/PP0d/nZ0k=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c77389-ede7-497b-ff12-08de1077ae37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:58:54.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH+tkjR1KSJL2G+Cjcr5uWugJTnWaWeqCES2qQ/iMgMsV6ilttkG+2u1ZXChRke2XkeiFYtQqunUCBFfNoPxiWKmyM6Ca0vpJJVTc8Q7HbCVgMe75ovwgkPHvuBYXbq6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_005902_506968_82698E47 
X-CRM114-Status: UNSURE (   8.56  )
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

The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
has enabled the SCHED_MC/SCHED_SMT by default for arm64.

So remove the redundant code in defconfig.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
v1-->v2:
    Fix a typo.

    v1:
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..f089ec615b90 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -82,8 +82,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VISCONTI=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZYNQMP=y
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_SMT=y
 CONFIG_NUMA=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
-- 
2.40.1


