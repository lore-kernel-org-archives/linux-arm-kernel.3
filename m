Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C782ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=imZcMbdZ1qsqU/1FAVa9AEaJw6J+yiYOJZKUtAHFkAE=; b=tDw4S4zFEPN/Njwk0XHfsFBf/N
	0pfuRpy7Uqzl490XqvIS2er7ab+m5asAY4rVyDDnvHVXgJEIte1YGMda+b0Upb+zPxrn1wZSiQzbu
	VqoV7hkE36yvzmd1+ANxc9mC7fVHTvMhSj5FZlTtI5qWyD1HwSjMV1JU3zXUDQmfXaHavjC7mBdWE
	wseHmEk89HGaeePHHbtXjHxg49HjSpz//0icggnhxesmcydzMWdsAAGh2paQyAuvKClg96BBkK0ty
	JWtO9olM3fYXfEYqinYQqqjDPTEUiZplR7dzEkHhEsEUV8BH0HKVCGTNgE+yuJTwhPuw5Y8Cyo10X
	rzkZT7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umi75-00000000rd5-1VH5;
	Fri, 15 Aug 2025 00:16:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umh7V-00000000lW8-2kXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:12:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdNhGCAnD+YgcW5zn9xo1iBJWPeMPOwitvhsfIS/rZux90LzBA8XUFui2rDwGaTLSzvD8uNUUxIi+n80krv6w9Lq78YZnmza1rxXjp2B3eTSl1IYzM9cfzX6kJ6yOL3b0CbEOONAoDyCW8NlfTmeDmNTUKkapD0zwwcD4c4WO3zLN5TAQuYXEwAHg7Exd/yDKC7onbs9L9/JOY4nDdw7UrvtBPz8UCUMEuXrhcHfm2CTYCNw9OnaTZISIMj43w3X0pnF6YiUBa7jRFmo8SVpo+YMyo5ykiMT+o6NfwsbEWMI2a/EE5uatgnd1Sy7iV1Grq54rt8PAXu3CA72yar1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imZcMbdZ1qsqU/1FAVa9AEaJw6J+yiYOJZKUtAHFkAE=;
 b=X8v+pZkPpx9Wd2AOqUegKtlYH+8vHoSCrFcdBw/dGAYKMYhPgnDDyPWlDSbSi75on0/2zLdD8Xb5DYiJp4731AQLElp7r9yX7aJNmcDTci5gIopDuUvLQbotZz9nRnTETCcKDuO9Us+SUlrkALkD97E9DBn1F2NI5TJa6uq2xL+8Y/24W1L4t+urHd+LLE5KM4r2bs4656bkgXuVXwWlKHe1x7v0KpgRAh8kizXkvKpUVH+6EcTc4cyDz4l7SkcTlgo25oh7sRzPBGX7xNZHUWg0bnymAIeb2UwDOpy6Zi7+hPFj0nNWtPWdXX4semqJ6EPthE7xdHp5/nZ3Ge9OXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imZcMbdZ1qsqU/1FAVa9AEaJw6J+yiYOJZKUtAHFkAE=;
 b=fjp8IXA69sOsnkdZ0D3ki9JIadfFlrYXe32d9Vy5zxBQoULiAvJ6sxEsUMTcDDOTTYY7WsdoStZHN8XDkLsRVHlgZ+JWTKVMOtPgZgerV/IjLCSpa5fnQnpN4Cj+wYO5qfniBMjVcwHRB1k+YyjItlEAh/xDxB5M2S9FI+DcJLCAyXZsCiBn4xqTdxUJ0ZSi1yGAKwnNJYM3bK2+ccaEMAndqS5EQH5/fP0MXClqRMRbIUIi+2ho1Ng3gCeU3otM1gAjSslp2G7QSYeFllNeLafl7/XdXiMgTdSFt0o5eKL2M+hoyYPLJh7luD7MrIHds/TCYGodyP0dHEmLPxubZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 23:12:19 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 23:12:19 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 00/13] spi: airoha: driver fixes & improvements
Date: Fri, 15 Aug 2025 02:11:57 +0300
Message-ID: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: d023a6da-81b0-4338-ed3f-08dddb8803cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EOTQeAAT0AC1aA9m0ygXVpVkvjxvCRyK7+R9QeWdtX0cdJlRzamKGuW09NVH?=
 =?us-ascii?Q?PzZH/dOGa7CrpLLVWKIYDOEDodqSyGn6blm/syGSwY6zeNa0mPF1rH+4Eh0r?=
 =?us-ascii?Q?7XaEpTuIxh2Dfk0Qs/Fg5y6/HInkT6c7qXFomkUHxtK+HJDfM4oj3cM32m7T?=
 =?us-ascii?Q?kF1Sl3x3j0z1t8mJrsuCZhxeSB1K9Bx39F3hXJpifrRgKOGiP9KsvePWMEKu?=
 =?us-ascii?Q?lKyQVJzrrusxVLZQ/AsQMxUZy5Cp4MUWAKcaWdaF7mtgW9EaSzCkaYOBqEzX?=
 =?us-ascii?Q?5C3KvQAL64Ga+VQRvViPZMnApkWpQ/0W/vbq6XCEOdb4wEafNO8NvtQsKaHi?=
 =?us-ascii?Q?DZ9UwAKIMGwRQzfGh23VPlyxa5zNYDix4x/W8MKAwunTExzquwf9c/TyevmL?=
 =?us-ascii?Q?0JVxc4K9EpRDYutNy/P+wc40MeNTi/lIgSz2LbDffMrKvzjx2lBruFmfOBPb?=
 =?us-ascii?Q?w4z7bpNiaPewiMGUoUpQMS9Bj9eOvUmsfZ9yhWKBx1zwsQUrW5QFfoKDRKdW?=
 =?us-ascii?Q?kTnfFmpoe6Ep+pJDgmS/HwnlkBWBHwUsZXxlN4nxhDWWdGhlg9XWOLCzslVJ?=
 =?us-ascii?Q?9rTndGPKqc2wHDqVmdpJ1GJsGGiLSH5dBRPfkCJDD9vsbGUPb0s/NU0fv74k?=
 =?us-ascii?Q?zKkTxVnD4gC+LEb9UAGo2QpzTgf0uyJXrVmpy1fxYc4DKYJH82DxT4Ei2AdQ?=
 =?us-ascii?Q?pjhpw5XMtEeW/PlzyCCHt6Cx522k9jH8U+7uobF38wA60u1Anxtvs6BaVPG5?=
 =?us-ascii?Q?k9zYT/KUxGEH95Zh6UkLbdWkcbehwvxCymLu/3TMNLtBlTXXfS+PsqbJW9kN?=
 =?us-ascii?Q?8qdApW4m9DgJToGpWQDpTzoXCHkJJqQR5DCbA9Hi9Pr2X+uVxeMk3LzohsGa?=
 =?us-ascii?Q?MXTUln3lf7lg7S2puZjU1xUdT7T86BhDcAEslva2Ae/y9TX5DomiwUdaBMlA?=
 =?us-ascii?Q?B+RFixWpqIXC0RQOnGORMwHAqPUD+hO1G57a10y4rhh5cTAXsxdKl5AmZtDC?=
 =?us-ascii?Q?XdBGeeb2tdFlN+67Fbuv3c7nCUGxPwYCA2N4E33FW2LPsRBtN5DAgWVTTeAG?=
 =?us-ascii?Q?I1V+w7XNFZn7xRhhj1YkuKpGYPtm2A4F0diNqnZeTF4LQHZrAA/KnlZAraMd?=
 =?us-ascii?Q?3v5ZcudGsOtx+tw4D4HftzLhg9lXiz9QC/+bJBU23HgoED4OGU1S2HZtfIaM?=
 =?us-ascii?Q?K9lEt7o8owaEgvdQmcg7Eeo5LVWtMPNi/VaDwGIJlyKvyiMbGPJxwSmICVmL?=
 =?us-ascii?Q?23hvZTwiX2faJeiVv9q8D5gW8FZLoPwzL7c02LLB7JjnBKdBCcPoYwxB/uwi?=
 =?us-ascii?Q?5gv4JnPyMYYN72wvZ/qzpV30hobGHJ88k2KiUyTxAq69DPwZRYbEyiTt/lX5?=
 =?us-ascii?Q?N84Mxd3DCu5jabxAkU/emFMcDmO1Xz14CFM29M7aOxXLt90gBv+whj7pC+gQ?=
 =?us-ascii?Q?IU/peLkMYsQvnVSGzWbYietc67k54cgwlxBDiIukQbrSroxtQCdD4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XIZk0rWoTyexQ7F5azOQFlIoIsWudHgZJQxPOH3gqfIPalGzRTKuOQle1fwq?=
 =?us-ascii?Q?ykZdvWl8to7erAebx3Q/C0e5fUEow+v1TkJtGOXywUCYpNezjBsd33owZRVT?=
 =?us-ascii?Q?hD9OwD94t7Q6VP7Bf2CfucQZGScp/VQo6i7cDqk3XaleFpVJYXz9a00ck3SG?=
 =?us-ascii?Q?6K8vHT15x5lAblS/wI/+femhanmOOc358Hb33BD+T2a23hfn565itLTEZedU?=
 =?us-ascii?Q?+a4G7LY1mDU9SVvhMOkNwaY01hM9bPjoMSk2Lwmwm0sIfhbqNKHOHifzdR3M?=
 =?us-ascii?Q?Ogo1k7H7izZerGy0whx+PRrpx5tnHWrkoaTeJzoeMGuSJrVDm2OJxMpgcqJo?=
 =?us-ascii?Q?XZWtzlE25aTMV7bUt9FemU8t/nlks/aoCOqVZe9EwECoO2tM80ef3FHlZdRQ?=
 =?us-ascii?Q?7QbpsuGH4eBIFC3cDWECdQ3vtxqGzhnwPycvFK6sQNRMcRT0LkWaDEhdXmS2?=
 =?us-ascii?Q?XMBz0IGCeYpjWsD9U0UldNqWIxv55kyXZp6jeuI6zYybKL0T9l1/+RMHM6gl?=
 =?us-ascii?Q?t0Pvd8Wrbt6LjnfpIzPWiOKeCSre7UzH8w2PXAHyDTcZLm1dqNfYO6nASoVo?=
 =?us-ascii?Q?2jGFw0xB3zl50HWFPbjhmk5lgbo+3ZC9nfehHBQWWxsQuNAPjLOSOwwzjkXs?=
 =?us-ascii?Q?+zolZWAn2R97oHD2HPIcoSPD6MdNEeSfPa/NadXFgWDszNuYm+wo0iJt6Scd?=
 =?us-ascii?Q?ryQU5kSbc/OYIJGNG0EIB0NMWqzFDUPOnbIWd93OVfBQFH3Q5y41oho0sNir?=
 =?us-ascii?Q?Zs7e5JaMzhZcq/yCK/ZjA/IBpx6Ia7lxb2LXYCE7CtUq/Mu3P2uiU3lZbGLB?=
 =?us-ascii?Q?+mNxawUJpWicY7k6aJC2mcfTrH/3oTWVmO9843D13AcwWfTCmCS1bpqutev8?=
 =?us-ascii?Q?dV9uOWpI7xoGzRcaKEFYkhiKVnJV5NhldjiEDaPUvxXtkZIbGm8iwbIuUW2q?=
 =?us-ascii?Q?gIpfCkz239yY+8zKMBlxivxqxeFD+h0ctCSVEL7YhhFHM11ohVDcW9In+/wH?=
 =?us-ascii?Q?vMP5VJPKD5t6fksaOAxTCKGqUbQioYnVqb6G+j/GX/geCWiia4EAqUBDvJeL?=
 =?us-ascii?Q?X+q0vAe5R8VoCDWaBQtKqqAF7SZuWzHUiZ5idaMH0vwiYQDXiivDgQwYFW3Y?=
 =?us-ascii?Q?6KA01WbGDMrYoXOpfnDGgYjY0jVWDIOndm5aI/sAU4+DwdgQdsRP/nJk8zwt?=
 =?us-ascii?Q?/9JSctJyMU827jWR+LmMfyAC7GRSoQyNJnRU2Tvb7yuesgmYRoAhVRAHH28i?=
 =?us-ascii?Q?t8flSE7NWHCTEkrpPweniPjTS3qxIBR/hoBjEAw+IcNEI8aNTiD75XzQ3MyI?=
 =?us-ascii?Q?TIm64jnAEkTrqMcVwr4vZ9N4KPtfOQolvu37a4RbjpmRACAJ397qiCWytDVV?=
 =?us-ascii?Q?86M/OuzWYeAtDvywCITV1clScFs8Soo+EV43qQ6BH+iEb7CstwGpROblxenm?=
 =?us-ascii?Q?MWohsIWxbxuEGyuhKaNCf3u/skmqwBhlO6IcofnGYe49RXDH5sEqUYD6un9j?=
 =?us-ascii?Q?CDrnUSFlPzXzOnkpsW6z07afIjq8fme1o2ExoZiDDXOCN57u2nj4/YzIeLJq?=
 =?us-ascii?Q?tphc48NV0Kis9s2rimgvIqIZpJWKrKIZGEJPKcNuBbU0i2cE9S5LQTiUrmjE?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d023a6da-81b0-4338-ed3f-08dddb8803cd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 23:12:18.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYAqD9Li9Geeek77ZVRE1dzIduWDK+equaVfqu6QjLtWV7+sWqyFbCsxYuLglqx2l+K1N/+UyaI+bcBCFJY5gfQpopTworLUtnWWRRWTZ28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161229_697569_7E43709B 
X-CRM114-Status: UNSURE (   9.22  )
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

This patch series greatly improve airoha snfi driver and fix a
number of serious bug.

Fixed bugs:
 * fix reading/writing of flashes with more than one plane per lun
 * fix inability to read/write oob area
 * fill the buffer with 0xff before writing
 * fix error paths

Improvements:
 * add support of dual/quad wires spi modes in exec_op()
 * support of dualio/quadio flash reading commands
 * remove dirty hack that reads flash page settings from SNFI registers
   during driver startup

Unfortunately I am unable to test the driver with linux at the moment,
so only the following testing was done:
 * Driver compiles without error.
 * All changes were tested with corresponding u-boot driver. U-Boot
   SpiNAND driver was modified as well to matck linux-6.17-rc1.

Mikhail Kshevetskiy (13):
  spi: airoha: remove unnecessary restriction length
  spi: airoha: add support of dual/quad wires spi modes
  spi: airoha: remove unnecessary switch to non-dma mode
  spi: airoha: unify dirmap read/write code
  spi: airoha: switch back to non-dma mode in the case of error
  spi: airoha: fix reading/writing of flashes with more than one plane
    per lun
  spi: airoha: support of dualio/quadio flash reading commands
  spi: airoha: allow reading/writing of oob area
  spi: airoha: buffer must be 0xff-ed before writing
  spi: airoha: avoid setting of page/oob sizes in REG_SPI_NFI_PAGEFMT
  spi: airoha: reduce the number of modification of REG_SPI_NFI_CNFG and
    REG_SPI_NFI_SECCUS_SIZE registers
  spi: airoha: set custom sector size equal to flash page size
  spi: airoha: avoid reading flash page settings from SNFI registers
    during driver startup

 drivers/spi/spi-airoha-snfi.c | 502 +++++++++++++++++-----------------
 1 file changed, 252 insertions(+), 250 deletions(-)

-- 
2.50.1


