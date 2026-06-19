Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98311CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=; b=a21OX6hbeK3dWoAsiux+McDiSE
	GqpQcHckSUU2wtqbFjA13UUpvwUbyhIRojwAeN+oxy/GDj+T04MfWPibH1CQzBfnPFW/EPMNZA13b
	OqLcRRU5q6P6okfZUyKp76O1u9jwaUzP0V7yktHOgiKUHCSbZyBkRMSut3t0oSY+h3OiveP+WK7KP
	nMndqRq4VZEfhuP9Hbvoi+iLcrD4UuKprbVkAMa4z5VkwlPaUwwL1ujkhCa8or+czF+CUACXCsJ4s
	GPHoirxNql8HZu3JH4WoZ9G6KIdQfRnrHzjZnioggjeutd4/DiILXYZ0I2k1pS5fTb3LVp8RLdGhk
	KIGSNa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDH-00000002TU6-19NT;
	Fri, 19 Jun 2026 13:24:51 +0000
Received: from mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d40e::] helo=MEUPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDC-00000002TSU-3ve4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgZuB/ptIr1OiWCnqGu7aSOHk9rcxgn3j5ZOGMnQMoADlgF6WygyeQpZaoZkGIGZJqzaYKQi+LEw5kcqjNTz0YBw/0GvahLO+wFcXeDYC+NHC9casoJpK4Lc5s/zCIHiSbtL19FLqw/S5p2etB5TJ68yAy53ijyoxylgNj3XmoBwQLcgFbP9zGYX0iDPaCLT9g1IBwbsuDeDhl4+fagCd3HpGNcSziC9MZd55wv3RpiJp+zVOCCeXISa1Lc8eHremgky+T9DHj1evcYKS44Qr/6/KzJSykjOJUVxzIasKgdiBDrI3NWUTXFHBnG/0qshwnf4L8FbfRMe8OF8JRbLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=;
 b=XzUykGFotkuuUCrkBYbidxqlDMmZtPXQ3JfezLlZUM3ufDjQhbMRrHVKmoHFKFM7uQLgLTkCCuH3lwob/m2FZaiRYwTbTBIiPQbdZszQ4ESooR0BxhpK86kTR5PsnIvcdIk+CO1TbqOwHL6ycElmlSt8Z6wznf3o6mEoD0/s3w8ipVyQFFNisMn4XLDsbvWePR8Vo/WY0qvs7EmpPjszivdITQszgEUcJqUgVR5eLjMzk/Yh//ABRC9UoG+oT7tC9l8peinJPcxDa2eXq+J91Ql9S33ArH9cw3Tur8RtGzU0xvWhkwvbdspm5N5tDVwGaJaamz2Cu9FjXRkZ96aUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=;
 b=TabsWHWwX+8pVet0bDj4Qmq8ACwi6xTgO/7z8VheKOvOKsybK6r5C9KXcFvGGTe1gyUEgCvEECwcXukBdU7oAw6ai6W5iUY9LduosY/QbQx9YVd6uXTtPak8b5o0ARL0f6oOOAMMSzP0n5m0aM6b24owF54BHZgclvqckw20/eZKb22yPhX8WHeYcjM0ZQL5IPZGt3Dz3OGO4M8quh7iwYQZoKMtj61zS4izd3thLC3gW8iVibsEKJDfmuM1rSjgbrCLenZHIfFXFPdulpWYyuFVohNQxkqfzBcwd+a2mYku+SHGR0LuDX/tHrUufmEARszNj0cdOb66Yz66wbGbug==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY7P300MB1372.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.13; Fri, 19 Jun 2026 13:24:16 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 13:24:16 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2 board
Date: Fri, 19 Jun 2026 21:23:54 +0800
Message-ID: <SY3PPF19552C607716AE1AA440C85D348B6C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619132355.1776-1-f78fk@live.com>
References: <20260619102214.223121-1-f78fk@live.com>
 <20260619132355.1776-1-f78fk@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OSTPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::18) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619132355.1776-2-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY7P300MB1372:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a1a5e1-71e7-40dd-4931-08dece060fe1
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRnchLMhedyijYVtnHGPHlxrr40/l9cNqgMgLV5YYifNOCjY7rQUUqABV7usgnxBNvE5OAmV1GCYGBMKtpKUTXXzH+YEVvBm1Xr77SPddDEuACukHUXjMi31eArms+ObdF9CUWuXV4oyyI4dZsEqNp3HMphCkU7Jvp0+QFVB3nielHs/+3SH2YyiIxw57WWSIwsoRTERiwP+d92bqookKOEYAV4gQFFiPvSOvp+gOKl4bfCmDC0heOYw2FsirPywhFW44uOniLs+toaoitj489OcBTL/KrMrxWK9hST/MojIwBTy81LjKs7zh6UHl58ldTZUUOyYyT7TcJQkDpIjOKqDHB2n7Wza/pDrEwg5B5t/1A0PH4XfV6yGSZfHyMEeTkgu4tyCWYHfefpVUFTJlXbjXErt2sR8DMmhveBnLdWuXOCDlO0aRg5ZTn/xoCMhHc/PJLDuCiFIgyKQHkoAhEvqI35G/3ASxNuvmFAKIGqklv60TrFzNnrnBV2bwjGdBYzHDXpXYAs/Dc5lpCN6Ffpxq2h6AKca4JM893bT8BipkEUAKC8g90BND6xHvZ23olQDCzAxkgzqFW3K1pyGN1ZN+l9Hwl+5ROShGkcnHmqh3Xcw48uj/e9wKtGaiMzN4vjl/vxUTyVofIurN4+MlMJzhnhLIBTmiZ610s80upE53Lxojs14fWx+e4EraQSRnWvkYEnFVXSvRlDzur5+fNkSfosMCYd1tpIxUZ5Z8gEVY=
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|25010399006|23021999003|51005399006|25031999004|24021099003|19110799012|8060799015|5072599009|440099028|3412199025|40105399003|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JQdeda15zKLdcuAiuJaDsE6ilAoIZkpRM23BPT5djj3Mougjvk77kJxJMdIB?=
 =?us-ascii?Q?Zsfy/L2c2fPmb5RA3XNSxgMbfQczjqXyI2LmDwl9YLjZWu4UpDK8tVDmSidm?=
 =?us-ascii?Q?gDIIYZ/wy7ih0POY6ocTPhXsULj8LYpPup2RDEw/ebOEgVRyt7ofFKIeA/U2?=
 =?us-ascii?Q?J/LMg+co11CVb0WsVDwCvhNN3b88RJXnFYn69oc1pWrWqpU7MuyjOVlLyA/I?=
 =?us-ascii?Q?zW5QbGRw3AFzETZQ/gE2ixZ43DSHPyTxPXHAZD7oRRzTTrC5xRbBjf5A6bau?=
 =?us-ascii?Q?muHN9toIQ2m154bkcXx/dwE6Bf4fLYL9am6eN45byAshDfQ7sTaDD9bPXwXV?=
 =?us-ascii?Q?J7VkOVy4AmVLvQsGZwr395zs73tW9CUDEUNFJZ56tudVsWIsfuCUyvi5GAxf?=
 =?us-ascii?Q?ZTtZfN+qRYTVWC8ithxaFCtQFfOHeWv1uzz5t0BZ+zNYdngHc+5obD0/lJkN?=
 =?us-ascii?Q?dtlSktM3eUf7fL5N+tCbQuIulYxw8iiE4iOYsuoecFzlPwFxGdwtH0KNAMXu?=
 =?us-ascii?Q?//v/9mPe6RSxTY/6n1tAmQoeEDvYHoERZUYa/7yGkUgf8p8ndMVoA3ucO65F?=
 =?us-ascii?Q?R0aTmNv8sszE43drn76XK7+0Yw786jHe1I/mPdlDBmOKxrSB3SGcXtTQUmOr?=
 =?us-ascii?Q?Hl6bmVhgZEsyFTYX4qvRwgHDuz1VqTbFysPbM75yLG6OgfJlnCynFwg1C+Ix?=
 =?us-ascii?Q?Pdx+wOhT3tDmt+P2XvFmLfmHqZ69ffc8Y9Q8BadIPGn0DnGP5iZHbeId3osA?=
 =?us-ascii?Q?icatp3XnmhfANNBzjkeNXjPh7irD3K6e4ubcDKD/990A9FxkegvKOD5Jbjj+?=
 =?us-ascii?Q?9AHNC/UtmgCM5ui3JN9bjtgTeH8qGaqvmprj0kGpDQa6su9NVxIL6HI/czaU?=
 =?us-ascii?Q?FMnZZr+jY4GojRZfejCfO8rZT0yBWI73tg9pfQP089tGviyISAHlnKVWys91?=
 =?us-ascii?Q?WHby5ZGygXG5LOQYzcWDmrB2M7ldAJGcpCYtVqXrt4hVkgpJNkrL8j9ZF5Mn?=
 =?us-ascii?Q?93pq?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R8KKCoogo3iD7snQu5uVj0zrwd3oHGATFt4YCE2ow1rhcq7Khbm+iG5OIkoo?=
 =?us-ascii?Q?Jzppp0YEIVk2J+4Df27SvlYpt/jelPrywTTrc02ArQX/r8PMAK9Ev+Wa834a?=
 =?us-ascii?Q?3RHlKS0DBIPcN3QIstqa0cpQgQ5DYuM7RL2RRuqombh9OY67rMpeVWWNKOqo?=
 =?us-ascii?Q?fYObGc0LGqnfYCiAOqOH7K2WWy3qodghnGa0bnN9FYLWPLaWnDlShSQj8/Ib?=
 =?us-ascii?Q?4TMDfIR4xw09DbU0b88vZV36GOE6FnAJtX8mif/S3B85mNqEOD2sPBMpEjnE?=
 =?us-ascii?Q?/NF2VWLuZOgsH7/lOKgCMkLKaWcStw2er8EtPKohzbFiOhVdiPwT5rc9Z8v1?=
 =?us-ascii?Q?MH+Jch2eZuYYSk1aj+cygbjU9U2kE9FqxtAmAQgymBtOQj8NW8QR0Dd/rYFp?=
 =?us-ascii?Q?HVPYISGZJKy//a3pl/R8f/ew78gyYh7QwP/b6f3G/pGJNBEYdRwqRsxZ1tjq?=
 =?us-ascii?Q?m4AHIMZRiUMlcPEqmw9Pp+CVKooPeEGsLwD5L+zFU6rMtu88XELCIko5aPvb?=
 =?us-ascii?Q?IdE6hOCxKWbwYEv3jUH6wQlm2azWynEAinwzAHSg988mnRmlkmXnUQ9yoiuF?=
 =?us-ascii?Q?pOXl01X3VF/lqfHXdkAAr7t2jTdZoFnYuzLUj/t1lCZDPB2r/ogPclDQZOhC?=
 =?us-ascii?Q?DOsV4ibLQ1MiBtsqtJ6zHNFwT7nVKUla+Kd2LjJ3P/BONePsHKOeIwqf62T1?=
 =?us-ascii?Q?S7qw13okPb4tZ+ZVa6Siwj/I9e0Dmdqq6aecRFbEgw4Lxaxcl4xpLzIpmcTI?=
 =?us-ascii?Q?O4HgXtK6n36esTDvuiDomENAr937YeZV5blO3G9VJKyyYsPBmIBQYsHDTgo5?=
 =?us-ascii?Q?fR/5Jsx7p1Wn+psTgNyhOBYfmo6K6wQ5Skv3Y1HKZky3x8bj+WiP7/MJsxs+?=
 =?us-ascii?Q?wdELqlB1YIpAkgPBDMROIdyw4S3FjdFKrSTrLc33gWzkIyTRMyASOp5WcKyh?=
 =?us-ascii?Q?NJI1L7434dsvzSMguYaW6rfMDPhUu0mfcKzStm/t/TsDgEtzlHcZwAUlc7Zl?=
 =?us-ascii?Q?W++KZPM1O1DCvkpJ+k3VR1rxQTqB9bFRUGzs14ntsGX0iY4kkJYUGW6j90i8?=
 =?us-ascii?Q?W/U8WMUXoDM3F3QH5jvP5/rkinX0CykjdgfW9Vj7tWHdGblRijBXGLVYve7N?=
 =?us-ascii?Q?4rgT9b6RLqaxnYGM84AGGGbn4cJvXBCbecfy9AFsSkW6gQ2UIb5lH72mQdjx?=
 =?us-ascii?Q?1m62zCHbTxszyJNZQg8s57m7S+XTunyCn/iqtlUO2YwLX/0wQ6uzdvoJ6ROj?=
 =?us-ascii?Q?xhejzjGEYRp5Wg6nQ8tUqjz4Dt9XI6dh5Mf9c54sv5L/ztcAYAth/OFFCwPk?=
 =?us-ascii?Q?Ow/xz2wEuOqr3gR4awi/zLboTLniLNnm4OxfK/VnIJ7pfoSmz325Aw1l7r9H?=
 =?us-ascii?Q?fHcwXJw=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a1a5e1-71e7-40dd-4931-08dece060fe1
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:24:16.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_062446_971969_F8C16C1C 
X-CRM114-Status: UNSURE (   7.32  )
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

Add compatible string for the MYIR MYS-7Z020-V2 board, based on
the Xilinx Zynq-7000 XC7Z020 SoC.

Signed-off-by: Liu Yu <f78fk@live.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2b3..72a84b628da3 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -23,6 +23,7 @@ properties:
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
               - ebang,ebaz4205
+              - myir,mys-7z020-v2
               - myir,zynq-zturn-v5
               - myir,zynq-zturn
               - xlnx,zynq-cc108
-- 
2.43.0


