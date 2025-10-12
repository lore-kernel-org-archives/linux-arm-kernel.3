Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1201FCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=; b=vN/KsrbaYWqziG7OAOJoMPE4Up
	1WLBWV/t22O+WCzdRtEFCJSLo9FOTVYZeRIC6uyQwbGnvHOZRrfFjqM8X7PwNy9qw5AdllrG3vFu1
	MKBrlmUXH374azXLQnZv6vTfnGPobd4jQy0JOHxbote555eHmz0EZ3ClRcZPB/ZaNzgjaxC7Gsu/+
	JahcfJefJZaSV6L/qerTiS969gc5bcpsyLeJYTGReXhNasgUHmRSvfjk5n3HHRTugQwt9XFdCUXJM
	OeZ3iGO32CsOBJw4N/A5JJX6GMx6qfQxYRcIRg9YWJI/Ksxoclipw1IOgms1C+vRUGqbKzcEIppEw
	6xNYW51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v12-0000000BIk8-0pJI;
	Sun, 12 Oct 2025 12:17:32 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v0y-0000000BIhj-3cJ8;
	Sun, 12 Oct 2025 12:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAa1b141QWQ92Sk9TGuXb9H2i/IM3TiWZ0gTXbSQ60ZKgbNfgFyK//L1gEXzVnQLWARvNeEh5RleHM1pogADQGv8oL8PW2xkSr8dMhUFfEZ/Z+buotaOotek53BpY19MLQT5PLbtXBh6ag/lf4A0mtAhvv87dSwEnblYwE4+pr30IQzRauLLzGuWXituP+Tg3B2XWi16w7fdlI13BE/4B09Uqw7Q1reQ4qEIegcO4WXgpXAm48L44tTVt+6pct2/0BeInCPF4l1x6CYpPFj2WaFJvXfCXxe7GZ+ZjDn9k4f0kfcySpm6dCUf9xih+1ZtN19qzQN7ih2WsBbWbB8IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=;
 b=KWxlGp95jz5DUQzmBHNuYNbjnj59JBZHGru7IMUdSDA5uq6T76Mlfn0rwhOpVKpaSPTELwpb9nSJvXP6kHyWarU9zvcRO5vXpoHClAnGwmqdKWB6S/1d2zLeOVQnJF3+gTp+9599PavdsA6VqI1EPl/8x1DhA1qQzez4sihEC5Sf4b+pxh4Jr7rrb1YamNqpN2F+7x4aHcJ8isw5tGjEd3LnKU3lCAR2Z1zrx5+CabYp8ZG7QggdgbWZO07LMXieiKVQSraXd95ca3AxKpzyR6kWE/eWinQw4d0nfRVf3N5wbKF9CrinSqnLwoeoUylBd6rdLyplqcMEuZLy1tZCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=;
 b=zf6dcFBHQI7CfbMaToqO+Q74nTAYH0Oe3PeydohZsIwpGp0QQ6vuPTPPgAckcovJBjffniXSzl66F+K4QfL8Pp2V9wLUmZvL+xIuDKXDSPSmFa/azxxMXuTSRNS0pbOZRT4UBZX41v/jyEw2wfyF9yEihNXD/Oa6qWoVcDpEyqVw4EREudrdgeX4BgTHIRDpGVwz3MfuVOvHHPhTmis1Bgiq4itDJ+wZ2Efofqf4XDq5RkCGS/g2Q5mUHu8a2A9gpQDHHaxhVnrcRQauRPdnD9uFH8l702RdkqqI+pD/PTQf7tfpzeCGJMMxJZE1iZbttcS+bxVkkTNATjivVGPruA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:18 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:18 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH v10 01/16] spi: airoha: return an error for continuous mode dirmap creation cases
Date: Sun, 12 Oct 2025 15:16:52 +0300
Message-ID: <20251012121707.2296160-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4f578b-1dc8-4d60-fa30-08de098949c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9lX6rkcIDHm5WNJb5dirs2fw4Y9EPVTM4RNaPhgVF7kkIuCaDAw4Epq5qeq3?=
 =?us-ascii?Q?DYOoh6zMVUkbOgDQlhUX1cVW9Fso+Jnb346h6f14YEs+cV7Zo+gWJSojlNtt?=
 =?us-ascii?Q?2DjtoxFOD1CL/pV4t2PP79bns9HwAmbslPOk8O5oiBxxjpU5FwCKj8MSKzXr?=
 =?us-ascii?Q?aEiMlHfu54CE4EeJLaaNWsFFQDlZmRMNOTLSde9IXmcH7hz9OoKbAdS/v8ik?=
 =?us-ascii?Q?ZUA/eVro0SJyxwmEH9WBoM3YdlXamDXvbptkhH352cxFDhENMs+sv6hrx3Zi?=
 =?us-ascii?Q?22Jfl0BPQJ2YImGCAKFmU7pyOIwvw/0Sw+bD9dzfcXLMSGBq+ID7eWoQROHJ?=
 =?us-ascii?Q?A7UaT86E2gWY65N7NSP9OR0u05NmbSiedD6r5HYzXtBgdxuZpJqZ7G1QciCq?=
 =?us-ascii?Q?BBRYMhxwWGq+zGooH0/wCXUWfGDlZZFmbCTVmkx3R+g1Kp8qOzePLoU90UBe?=
 =?us-ascii?Q?eCNOA54FV4McNVhHA7PtyKns9roWo5CddnKHMtDJeQG8V36I5Je4alo3NbcK?=
 =?us-ascii?Q?GhPTN06pAu2D/4qDbmNmkKGZtssmAO/B0OKhgpnvbiW3Ey7+SHjIUbmPOBTz?=
 =?us-ascii?Q?RDhobLul1uyiLcfZBR78GGQiK2s3CWYpOdN41zdoMzZ/9lieFSAIGehsr7xm?=
 =?us-ascii?Q?mAnQ69oTy86qAyiAA6SLf6EUNB7J+BS6t9l5T3A6KxeSXKN1S02bbNMqqGsi?=
 =?us-ascii?Q?PmHstFV14RD8q2vW/caiGDzNiZcotV41cjq5pNgA3EEV3UsxFR18TmU6F6qM?=
 =?us-ascii?Q?eXcsR6f0J7VqIXPSetCRQRk9JA97D4LsIMrhcFRkPctvfuiXTqnpmmX7jaAj?=
 =?us-ascii?Q?9TayG0tTw33BKft952z6LUlMlROazLm+75j83WJZwiwIk0S5Axa33L1I5ONP?=
 =?us-ascii?Q?6zfr9trBsiqV6ydHWPNQiRWTq5vf5k6UdGS2M39iY27qni8cpeAWBicl1he7?=
 =?us-ascii?Q?Fo1eYWFhbHWWFqFrh6EjDrvwhvPZgJ2cc5sMC5mzDfpAVfgqyfps2C1kVOYa?=
 =?us-ascii?Q?hAmyxyd6rD4rhzFICA1xUhH7PKF0juG1NDwjYVfFndYwz+GBkeA80UQrdiUh?=
 =?us-ascii?Q?6inoFRvyrzsXkuJUHimMhHdW4KI74VMGbCR14WZiYdUBfqmWw11/x+rnIlBw?=
 =?us-ascii?Q?eCMlXrtpEqzB0fZjR6QCodvP18+GC4fvUIbpPGMlw965sVKRjamVCEXPBRzL?=
 =?us-ascii?Q?Mkw4Y/Ic0mMSLcFcH3uSpMxHtHGPCW6k16zrsMnIfCKU/TTivubv8DDMi0ap?=
 =?us-ascii?Q?Kf1q6r1Zhs0CLTUr674Mq09T52m75yFuiaXKCnrTjCG5ob/I3K6DJVJJwzbf?=
 =?us-ascii?Q?YJg1ZyPqKwu/nEN6SLEhjTHy3EnnW5fO5RtOv/VENu/cYmHF1wNeGNP9LddV?=
 =?us-ascii?Q?nZJtpmcFMbed1a6DBv5QbtGNDXC2UbLXxDkPdw3Yr0aGCPHo/6/hmdegvyk/?=
 =?us-ascii?Q?rTtYN9GuwIJPPYcRNWwt0HgXDcmEzGp+7oR9PEbZb1C1hjK4Wz5DMYHXkbWN?=
 =?us-ascii?Q?VfmD3T79WhS6WKleyyKs3CwaF0zLPJkDNJ7GkEugGa9TLsmDQ2prMO3Dtw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y9CYaKcgOrBBPzU8NYn/8jx5QMB9EBWmj7v+ZJbhReHqMxxwLL6nkSPfy8dR?=
 =?us-ascii?Q?lTsAYLno3cAxXCo3JmL6DQsq5YAGpzA9Oe6zl3U+YlyniUX3qLS0nus61xto?=
 =?us-ascii?Q?lN17k5iT0cgQfFm8gt/Bzef9X9yATh7Pa9TQEEfuL3y/hsWKgwqhdgrgUwJQ?=
 =?us-ascii?Q?2lo8SuwJbCzjLeVsLO4bFKi4pD9T1aJ40eXroTDYCfXARkCXs8lp/84V+GhC?=
 =?us-ascii?Q?0KdqrT+Wwkv+kUW9Y9xINeO6jRnARIAKPdnBTmzDJzkMn2zYZ81zvlTB5mfR?=
 =?us-ascii?Q?/sCF6c3X7yuGKp3/edr/a5ZyGzPKzizPM01YJfD0lquXJvlyAP84/Iw1ZgoV?=
 =?us-ascii?Q?DFshjUsoAtNsquqT7O7UCtkbWKiGSBFGnXdYhaUrNXTLXb7U8enW5LacBnlC?=
 =?us-ascii?Q?pGqvJf7HztToGiMpvVzorXPpXPf3JpUtWkWlOF2jvLIoFEXJVwKk4CPnfHhD?=
 =?us-ascii?Q?Pi9FIdZ6rs8n/1AHzmzD2gZVyLkvnNRtR2b4Kp3wMhBVTfP/HzoCbRKRqMK2?=
 =?us-ascii?Q?JMCBNkw8LoqbwBHYtrfRjc+p7KnbCFAIGJU8OT35hwD0Jbe1z03/acc//glB?=
 =?us-ascii?Q?UxOgsQIUApq/Ea5IZpCnT3zV0KnaelOPskAKf5jImRNqpd7OO2OB5pBVe16l?=
 =?us-ascii?Q?oKZPt6MEWOEGfV0M4OcpgtgGfeE2LZgX2nW9k+aixlbrCpro42r6yKeYu7w0?=
 =?us-ascii?Q?5/YWfbEIyud2aIS2ibYXJ1piQCaXhO61W3wHGqPz5bHupHj9eh0crNdpqzQV?=
 =?us-ascii?Q?GEh8jUOmvBDl7aEia4rrlVZe6Op5JeaXToVLbnmI+lNqUhlp3akx6DRHhd4b?=
 =?us-ascii?Q?1/vC0ny1URSpHy78MRSmkaxKE70+1T5vicAdLsGRv/HFrgD23CPdJdyZyPoy?=
 =?us-ascii?Q?DxMt6OIEBXzXwN0u+POaDRIwYi9+1u7VPGA+5fVxYkLZXOXksbjNoySOt4Aw?=
 =?us-ascii?Q?8JPyzCYAr7jVMgp7TxrL4l7ENa3RzsIah3mh1+RLjqc3Ytou1KnnCGRTnz7k?=
 =?us-ascii?Q?unyzn8Eezj4NK7DBPfxf0BIljMKBVe03wAhbpIF7qxWGYa9l4biFxDAm7GHy?=
 =?us-ascii?Q?FQuqGurWlMFdyX7SKZi7L9mSlvWJVX2W2svszMBDHyd45zkbz/ZNsgDXTiGe?=
 =?us-ascii?Q?qRC5CyYdaa2mxKPwx0HX6vLMaWCV6IfeUBBtQgTgoqKBqGwWGKsy7EBYMVCv?=
 =?us-ascii?Q?3rSaIe8AU7qzwvN7HlbWHU7v05+0+xxfc0W9t8by2tRKyopyerxJ3UnDDqGd?=
 =?us-ascii?Q?pNAmb5PeM9WDPPVeH6rQT1ia+48CV/vVul4aUSOmV12ht/ae8wk87whmwy31?=
 =?us-ascii?Q?IYaX8XfMYyz5HlP4uKfaOnQERMJ/dsbL8SmvYQahOk7FOlqDOvHwyH/qPIB2?=
 =?us-ascii?Q?LsoieApehdpprXsL0TxczaqSjXtTebxM7OAnoi9/FmZxjnVm8LE0KKVIyNRk?=
 =?us-ascii?Q?PU6RdDdzb2Qsau/bNdszYeIqxZqWWvbK0x6AfalBZufMo7B7RsqKtxcQl7Wi?=
 =?us-ascii?Q?3jqBChKV9d4SsktxhI+wvhWM8fmrdKYSwdECW3YR9/IlvJjdQDvXS6R2O16s?=
 =?us-ascii?Q?V1R47OWkMg34CXKfOvIXl+JnpOQiodhEvgBaqtr5atF2Ant+8wVv/HsSN7dp?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4f578b-1dc8-4d60-fa30-08de098949c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:18.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4LaHMXYWHmdFpYA+7lz+eTQ3vudQfk1yqOYJw6zHRUgA/gUGDJgFvGLGLs9WxrTTlHS+2RO6TCFgKj1959Absnh685Ef3GN++SVsmSeWGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051728_896075_8207E3ED 
X-CRM114-Status: GOOD (  11.55  )
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

This driver can accelerate single page operations only, thus
continuous reading mode should not be used.

Continuous reading will use sizes up to the size of one erase block.
This size is much larger than the size of single flash page. Use this
difference to identify continuous reading and return an error.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index dbe640986825..043a03cd90a1 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -618,6 +618,10 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	if (desc->info.offset + desc->info.length > U32_MAX)
 		return -EINVAL;
 
+	/* continuous reading is not supported */
+	if (desc->info.length > SPI_NAND_CACHE_SIZE)
+		return -E2BIG;
+
 	if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
 		return -EOPNOTSUPP;
 
-- 
2.51.0


