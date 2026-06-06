Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB2CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMHl4Z7qw/akNtwMt0KWmRxqh0/4x90mc1aPVUwnbGo=; b=zh6bqHgdYwZhTl/FBNUtwBl771
	5YAUnRCQE+JI9k65bnmNFHa5qJcSVPce0gHQNt41JBoEj0hn7nILdGBfV1RVUcQW4wo+1CtIOd3g7
	G2y+LZCT0VVje3dgrqeTxt/kM9rELAPoMJRs/hs54nEYyuTfPeQcYddeLxauHmrW6k3ppDjRPPs04
	BXwkQSBT+Fs4pTrRqfhCdKE6QQMTfk0tqpqtUiz4bhP+EiiuKe/3ftl8MnFrKABY57mPxKJSgOEis
	PVhxM0mWw1BMQIEgbcd89qGLRcf86HlhJ/hy0jVebGN9D3jIHWE9KcU3xoq/ZDmwNfi96bqI3IpuD
	1baeKVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOQ-00000001MrJ-2FkS;
	Sat, 06 Jun 2026 02:04:10 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgON-00000001Mn9-3uxV;
	Sat, 06 Jun 2026 02:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmBOV8foU8+F6vykd/UUFzr8SVMT1wsJOM8HTt56es1eJoDLrnW6fNg71VDsE6OA4Pfm2AHNAHJl9twLDHdnwArI9YCZyaaAlktuo5sTlBMDoQoruAT+aQk72OwSSKQIb9ZnDhxUNW69SJy7wwUCoqjCUfzfiQEFcDOjZoWMQiWHBzEpk7Bb3VZlMcVHb67yU8ZQ4FwXeBZvBYQUSyC/5iERH9Df8V6+2Cq7cUtBHL/NuDgMDY0PKcE20NoEYqzv7E0ox0Ksih2ddduyje2o/Z02FZavvjwT2mQs4xysdZFye8mj+jZeXyWVV25JOBSjAM5HNIuK29wsQZTRUZfL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMHl4Z7qw/akNtwMt0KWmRxqh0/4x90mc1aPVUwnbGo=;
 b=qZf70YtRrXeUd1NJV5k/zVwO1aRnvD96Y7DA1rmZ8CQ5UqqdlXSlXLeAXv46Gz+NGpXmT0MB8PKtwGW4BJfM1oGAMiTJPpkgXpwkPXUwoE0SynPdD0dI+KUiACsLYo3LdRg75ajVyJft0d5UEEPvzQy0Aes8wC5jBKHAsr4zNlHbu7UFx0pA90epkT7BtfCo1rDoSEIQoZ992LTUm0rVLG2KC7YOlSZwjph+yGyuNUOHwa/v+oe+YzNXpZpawL/9c7CwEu8LGgqF78EUfrxmTDXCMzAReNM98Im4TOWD1BOnMdPWOOponJ4Gf+Q4nGpaAFo0zh8ctxu/XBeON9eZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMHl4Z7qw/akNtwMt0KWmRxqh0/4x90mc1aPVUwnbGo=;
 b=AVABWzmsyurZtYbDFU4F7iUcMqUwHId8WFIDoc40qMKWnKIOld8mnqgWQ9AhT1HVIuyn0jm88gAjKu0U15kp+nPOHhl6/lVMrHETjj6OhI5aCo0R5WpVGm5wZ6wk+NnR4UPguNQHl7S3giuPV5f0+jyi9tVZJE+xD8WuIeTvfzZ+YLpKmSd7iFN7t8gzooLLqQlRuz7YbPOMwGOcD7U1ZHLNzfJPNJ58upTg5eOyRnBR8h6Q5Fc9tCGzpSqZsw/T7XoxYb4+BtNvBZ4ESe5spjmg+gjnh15CTZBvOpPvRaOzHWCG2xU9yQ4BSOgR79kpniOmmkuz0fF5iUv2cyrDYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:03:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:03:56 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 00/11] pinctrl: airoha: small fixes
Date: Sat,  6 Jun 2026 05:03:31 +0300
Message-ID: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f71fa6-2afc-45df-8823-08dec36fdd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: iL9yt/LZbF/TyUj75ThjX1/vuS/YxgseZc9bLMIl7myFSrqVuTL7DeFNzF+aC4/82br5bkr5IiOUh+yeTYMjK6F4skzAPO+xhkXdstrpNsQEP7EM7agULfC+eT6vQoMXiKrQmwiMsCY+Y8/AG5d7nv+bU5V4gijdC9iMSbsRa8j5jxdH5I7TkRGBExdnq70pjKXE3p5QE8j2zOEtYtY40ccHFUSMtcfgMm5XBL8hxG74OUkxiMHuOLi93Z0A4jvSi8Uqn5Ho0veEwcLE7z5qXSi18E4++5qqPcXC8Q+w/12XrpxarQSvcKg/RPEdljtJ2B0zFszVYXXC00ci5imJtFEdpNPJpSJqxpZhJJV4UkwkxDgkgG8ub5bFxjXG/3+H57yriw6KpGD4XEC1YaUxaDmCleYZ0krPlIhc3qWHlnL4fvNplvxzjjsSSs7FBT6el2YUV5MrZpzJVYhugeMP31+BxDJ/5S/vuMYTjFGMmlmiquent2pUzykMkZqSxYCZFdqKfPTx24bMQueJ9GqqB6Qm3K6YB7+S/xukX5Dvba/odJkaWG54Ei3JvjvouorGHiR65p6f3SIpoLjk1C2q0tOV7v6Mxnb30LVANV05G2n4+0MJ4cfk85wRCd3YRo6R5ZUh4DbNP3rdWgaCC0JAaEBYy9BnUoGpurUDu6FkzR8LfOMepzc/fMB6jty4dYp2qIT6WESD0z1KnVYFOgMAyT2NaHTzthJJYYKh0BsIv2WiDGmSx64FtpWFY5jsFJL70ILloH8N59Nzfg21ciKNSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++nB2cIifZ9RWC/AmgQSNPk/XxX0XBdm9LW3BKhJQTB+6VsPIsXfkf8nuzY3?=
 =?us-ascii?Q?zyEeGSI0MYiLNFnffhCXlGaVLXiTLNEtOBaeGrOFwqTxSehcLn9N9U3In0cm?=
 =?us-ascii?Q?selltesvAgZEkFnFte93bOSFWriF9ix9gvmMxwJeEAUsQue2V48cd2pJHtXA?=
 =?us-ascii?Q?j1ttRQ40t0NJhpYHnkmzoKcesc3pn4Ic7cPqeSeS3D+ye84YhWS/30nsCDWd?=
 =?us-ascii?Q?mcj/2/wwrpPy7DyLEH8s6eWFufVe+9AzZz01PGncRN1JIF7dhgnEujG5+aSU?=
 =?us-ascii?Q?K5GLAfugDidfEl6NWyJCHS57FeOJuJBwVAWIPnnqeEKPIR1p1QwWbRIDestK?=
 =?us-ascii?Q?9qdyNOQ4JIVuVT/TQzRz3sWK1OYV24XMPCf7Q6pDUg+DWcHvOz7wYVulaA7W?=
 =?us-ascii?Q?xLJqsQFoH0ej0GEwVEgdCFJAmrn3pJN4pzkfNG05g1Uzn7LqmkaNeuiaMhUq?=
 =?us-ascii?Q?FUuldZtEZnPEobf+v+8gt3BbdNooK/Ug2VChWDm1mpc0xBlF7FrukJNyWFcm?=
 =?us-ascii?Q?frxifu7a1wnjjGFENLboTz135mTFNitauVVZ/wvDukjiFNrlPbOjEBkdksJ9?=
 =?us-ascii?Q?wV/Ig7wbWdEMiyk3Z9noAWh9pK+ZDqgk0RnvCwfyDovcPUOBfCd25MA6MFtX?=
 =?us-ascii?Q?f9Z0GDrfz8uKgqxeMB3oqEY14qwJkZ/T5ulSb20I6OPUdleT8rjxx1DzKsNG?=
 =?us-ascii?Q?qbFYYU3B4CfhXRzHOn06734+lETrhPHcrMSNKdqigJdZjt9VJ0vUDdsh1/DL?=
 =?us-ascii?Q?ObBcj1rNrfPdiXdIwb/HiqV/s4UqKJflehIV+bL43c1bJpTaDowP+Ue693ln?=
 =?us-ascii?Q?uukS5yQvFp1uOMwsXNihkNRvWrovcs39+Pdbr26clNv0/cyUSv+oGx+V1ipH?=
 =?us-ascii?Q?Z2lK4BGP0AmsaGvVUn53kwWKiYL2dSTVPRk/nfjaMgxYMhMJCHwrjgrT2LK+?=
 =?us-ascii?Q?Fh5aBpe9i7M4Q9f25RkiYaNhK2zCpODcg1zuzuSPzpBf86btS811slqSr1yx?=
 =?us-ascii?Q?oWPMOMCNUY8Sl2IMx9N7snWtU8ZPaYKCFbRbM3xXnoiI0V5ZrCYkkFDlzlF0?=
 =?us-ascii?Q?siqbqOLbtiPQkxfRCOHiZdg1upK1vW4/ar18sLdxFsfaP5ERBspu3PNHoSHV?=
 =?us-ascii?Q?UASisYKP+1zvOeM33/kogZLH9MQtWUpAV5I8ta41OqAV4TMH7+uEGzqYT0j5?=
 =?us-ascii?Q?Mhkx3JH7HLTIPfuTPDSCKWJKR8EZas0C/aFxjHBgYdnRZYitrCld2jW1S51M?=
 =?us-ascii?Q?SHGpSqUgK/RXHGqbFetRJdUHd74gvCiURkCq/0es+SnEvDZY7IYr3XwAYsBr?=
 =?us-ascii?Q?D4moFbBkj+4szUpUWKfjrDu4FMLZg/c+dNkbowSAK1oriPolKPrqScipbCKy?=
 =?us-ascii?Q?glDs30zWAXI4lBNzQiwSWBGpv0ZVxDMI7uzNYQJ29778vM52e+iildZPGbE5?=
 =?us-ascii?Q?KDbDVNnjdW/4b6z9TYLHfI9gy8O11vfNxTT8y4E7wOYW0D7E716MAZLRSJwe?=
 =?us-ascii?Q?5k9yofekf/jK6KDY6CmnNGtejkHfbgzTEiVpnNBcqznNGMYmVRh7K65KMQfc?=
 =?us-ascii?Q?Lg/fL9tJC3c/OEvIy/FdJ3ps1QsVPaT77psAs05koQ7Sz1vbCnEekpj/HCMd?=
 =?us-ascii?Q?s8HbIg8LuROBaguhLnqMesPXno8eZ61tYaoBF4E8cvOf3b+C6dzfl/ejjkuY?=
 =?us-ascii?Q?IARK35YOJ8KbxDYdxweHxS4A64iCq1uXNpb8BFht7AebgvTYkpgY61ki6epS?=
 =?us-ascii?Q?kmfcFAc5ICYi/cA8LVCZ77qDJKf5uoo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f71fa6-2afc-45df-8823-08dec36fdd8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:03:56.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ/e81BzFrA6o8WwXbA9pRmQcsviIoRE6t6xLUKs5StBDQuDSwDPs6wA6jys4l6DlewGOR2D1M+UicUe4EMQHvFstiTqv4hwtsIOp+rODjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190407_979618_88C0CC24 
X-CRM114-Status: UNSURE (   5.40  )
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

This is a set of small fixes for Airoha pinctrl driver.

Mikhail Kshevetskiy (11):
  pinctrl: airoha: an7581: add missed gpio32 pin group
  pinctrl: airoha: an7583: add missed gpio32 pin group
  pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: fix pwm pin function for an7581 and an7583
  pinctrl: airoha: an7583: fix gpio21 pin group
  pinctrl: airoha: an7583: add missed gpio22 pin group
  pinctrl: airoha: an7583: fix phy1_led1 pin function
  pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin
    function

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 122 +++++++++++++++++-----
 1 file changed, 98 insertions(+), 24 deletions(-)

-- 
2.53.0


