Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A079C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZu5YBJP+mbe2if3Fan/tOLenCxdIeGCVI20YnmNmSE=; b=AcFSFOEKYlI0ByqhG/1NhT4FcO
	C9aVIAMgX2X31jBe8DecpiTVug5eqDZpB8SZgCSVkRGX5j6Imq7SRv7bBT+eSUXXziZsxzrQeCYZ5
	1Htp+9EZSfY4pPry3D71qSCiQPPPzTsH00S2BvM9hIy8Uq6i7t/2CRGVEAWZLxWXBE+/CV9VfFx+R
	V+GpMbOwiwAluuM2+4RVqu7qxFW4edhM/FhiP8TQRj24KaOfnuIb26yk9MjDD/dZYr7hQ39JcNb3q
	Ve8JarpTU3MP01tlY2JFi3HmNmDINhxKImfkY7rTyMLjK7T4urkiHNpITG4IYvnrfgyqVHUGJ8GvH
	sK+rQQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zC0-00000002ZNE-0bmu;
	Tue, 08 Apr 2025 03:00:04 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zAE-00000002Z2T-1sC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 02:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6Fnlddiiv+TX1Y7s6jO1dUiNw+OrbKQ53q9KYUsreSAMQmp+HmdbWtfs+PHZaTTzZCbZsKzlAB8+8SRHIhwCvO+HttZNuZnyjgW2CNMQ0bunWGNroXkesaBEZAauW1EeAU/GRLfkH4TPJacdTVWmACm80PmOkmi6weMVlsWtxB+e5gfmw6AmY03yPycUq7GVXn0EIzXXDav7sty9mpl4L0C/V4n8E9oxzkyRgYym0tgiHLdRdpNdM/ZPzC/hqTAzpgXEUoNb5d4JifFRBc3ARwYeNQJ+ZKlGtQdixsHVslUrVbplqNGJfdVVGaekuM01QKoIMoDlY5jIC1IdvtL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZu5YBJP+mbe2if3Fan/tOLenCxdIeGCVI20YnmNmSE=;
 b=A9kQQIQwyn2VXNbLVhLdWinZXPb8Mj710UCxmPkOQH1sFDW/Qo7TRbHEvgIO/TPgTtEyNyc3dCijDopf+m2ayi/Mi8JtaGoWGjKgorkGMKrGdSqI6uZ/oYmMKBgGenEu5lC74Be09mOMfvReU03HL4wdacXPLwZNMxuNZ7XKOJ5Q2dYgkcocT5xaUhf5ixccY3y+lIPD49YUxhO8gcs0vzZ6zpk3h5BZGBgEotfkzQtmFcMJbZGJGuh7dAgzz+2tr444sByEF5m31Z0L8J2553l73xKhWug65VKkeJs2OjgLHJnpvqvPBNvALdNLVidYQOAC9IKArYqK+mCFQ62Y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZu5YBJP+mbe2if3Fan/tOLenCxdIeGCVI20YnmNmSE=;
 b=rPYnbH5Z64/nJ1RC1VMAALP+jiNkNvN3zCiaYJy8M7dRKRgR3jgqB/+B5mA62Twi57kGVwlNsX3HHnR12cnva45Y8SCUnNjBatKtL1lNN5+QAdp0zsoepCpBS92VwfUmEZmvzdQDiCcHBRrFGmXTOF8IpWihhwYIRfIfrrH1HC/Kj986lICPnXgr3gmE1LpFTlwZwoVnMoPGNzS5sLD01g3OiuOzB2AucKFYJ6A0ogi5coZDPX/kKNV9GgXihs20SvcvopPOhifzVHzCN58wRNY4hw+t5dXHRLNaaOp3E0M106jYAbLSBSuJgRQGFQcJfqEGtvjmHJ2BVXG60lR0Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:08 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:08 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] media: imx-jpeg: Fix some motion-jpeg decoding issues
Date: Tue,  8 Apr 2025 10:57:16 +0800
Message-ID: <20250408025725.1244-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: d87f7be5-f766-4597-27d5-08dd764930b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W6QknYCAWL2YhZTBWcTgCb7CejBrDxbAMuUHBUiLcv65JFmc1eaIs7PENq5J?=
 =?us-ascii?Q?C+rZsheLIvNrPyc3aAYX+LcTRnsdnX3r8HHHmQRd6pYCkgBjPAIQ1hO6nMhG?=
 =?us-ascii?Q?8s/XRpLxi1usf8crpB97FZP3U0HxWzDw5dbUJvSsIMSo0WEhAZIQF5MbphoA?=
 =?us-ascii?Q?vT2ougN54LhTDgZtpJ4MQm5yYasHOIuD2GnPVGi4vy5lh3U4//WFMQ009ZBR?=
 =?us-ascii?Q?+YxHdxoicFOBkLUAFqWP+LzfPsSPQpxNtiEa/LuRMeFt6XrrrPJPWgV77Waz?=
 =?us-ascii?Q?fCG3mWwb2phkOcV0n4AsdSvaf4OCmBmrlrU2u+3aUimflnpIAUqGxmYLN7ui?=
 =?us-ascii?Q?417JD9MbMwZNJjmSMVZM/N+myC1fxxVXBR5LekXVPZCKaDwmqxWj4zh96S/W?=
 =?us-ascii?Q?yps4rF5DEuJp59A9cqHtSdlSFOEwOKUWKyvWt3mYcPxblje9LvE/ePtSnje/?=
 =?us-ascii?Q?40xSkkWoHk/gWXMPZ/ny6AQW+cRQyLDLmKyzu/ukOhwhXVZUMnFfZnLb7l5T?=
 =?us-ascii?Q?ca/4nTjbCaST8d2JCqf/Ykh0mVZjig9NC3dRAJoLxx0K40/CyeJ6emGFZY2p?=
 =?us-ascii?Q?PuPZDQHi/4NzrYKfz9ApqLKVyHhva8Nn0nq/3gL1/xdYRRfKhdW36vMoVJc+?=
 =?us-ascii?Q?Prcwds2Wnj1XZU3e8qsQnGyqfEYoXj0ZBNIv38qcHNyuif56Nvuncp4TpqLQ?=
 =?us-ascii?Q?khyrvEbo6fI+v0D26g9xfjsGIaPH0BL8FTstA0SOE/MYssGTNJSVsV7iWvsC?=
 =?us-ascii?Q?GhYvM8jKKmDt69Qv5HMuvUDsKQ1IWQY4Y0gE3T1LSQL3nSNQ/TlPywc3YyNt?=
 =?us-ascii?Q?tXcYuQPV0MYwgCsR8Dg5jfzm4LvNczoTHWgVd87Ufd3BOVe8ivLL5BiadBVT?=
 =?us-ascii?Q?yTXEYShHS7Q6Gl7duIr8suGkx+Zq2R5YUtvrORWVviigategpaXc5bYZfZRq?=
 =?us-ascii?Q?WKSBEsETTWoF1k3AJTapcyR1sw8kn8cyJZCxHNuOR73zmGzRkdnKK1FH1pr5?=
 =?us-ascii?Q?9p7xS3NWfJrkqov5XkfwqVRAWmj4n/pQvDcT1vqtVAU7hJwn7BotVebvzMYN?=
 =?us-ascii?Q?r6ltmTGEExA+VQ19VMYovBSxyUSZlvzEkZYLRghzfroUpeGFdBQB+He6WA0C?=
 =?us-ascii?Q?cX5ID3RuTJTZNd80OxP4zAhfbTNTnuV8N4oDiKC3GvyQ7kLYSRrwoZjebL4J?=
 =?us-ascii?Q?JbCJSJuJD+v4Grk1Z4j2GLC/RBXQpHXSOsvmjw7D3h80iewX2H4tdFlOOwKJ?=
 =?us-ascii?Q?xHy2PcztBATpgPvTrAmA/A88TrD0hfqUgfZJWzpZ2vaEWlGLXjb13u8UDtXq?=
 =?us-ascii?Q?vz6dwkU73KR5YkRveRs4++OSHX+11xAMC8eYjIuUE23EGSQYGG3T1W6Fq7kZ?=
 =?us-ascii?Q?0oEL5odXN5CITPozjVqK3Lgg66skoMfJHBRh370TmUsgTXKKH8ALr3QBi0uX?=
 =?us-ascii?Q?KdjfyP//7cOYaVajL+aUux/Y9o4Byu8u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmvQ51kdOAqZknSCJmTxfw3BA3hpPIF+A/kzV1VhaJ2+uebSU5dng7pJLJr/?=
 =?us-ascii?Q?jYcim3UGguoipiKanF3a4UkGPJ8dHvPh/edImccrvX/ClxdQbd+K0yLtCg2c?=
 =?us-ascii?Q?5szILPO3jUEQJyVM1nEtndch3X39sQAroHRDXcU77YN2nBI1UVhTUkIR1sGK?=
 =?us-ascii?Q?phvyNc9XXwFjfXNtECSJYPrD5eb1XsNiZ5ZjWsfotD5ExXqSjpRaMmjLt85L?=
 =?us-ascii?Q?wUZfqE6dtOaYixv4Hj1NBWfDgho4fjj8zYQmsBdO8vPXnDTkDbjEd2QXB1M/?=
 =?us-ascii?Q?z8JRTbMw4mszftvfRZp5+Q3szrY1D70Zk2rV9e5B/R9aOUeWRAQ697dfFIl0?=
 =?us-ascii?Q?nDyTomtg0f+yLubgya+s18+t27DP+llg/DzF9Jl3+l/MNnnzNcSpc/4ks76m?=
 =?us-ascii?Q?db4KAENWyodyyE+QncW3khM2q8mEfC1SRyyoh+IPWLwfmezVEGiOEKGpoVpE?=
 =?us-ascii?Q?JaavB7p/XZI/gWMk4D2dARM+M8AfdxkQzvz6JouMYpzAG4LeW4+snt3zUHeq?=
 =?us-ascii?Q?45668FemA2rN0GJnWjWHws0A+jD8v3EA12gIoD8J2YOHMlaBZV9+JRhcaqhh?=
 =?us-ascii?Q?Vn/YAEc7bfymhitti/xgF/iEc5re2sBB6313vfYI1wH0zrl/4I5/duz08oHW?=
 =?us-ascii?Q?6eBvfxGlwIUdJLcFHUaD4WtxwJ88lSLZw3bbuiyBI1QEdeB12qSbQf1LjjTy?=
 =?us-ascii?Q?ln6V4HD0ovnKWi39tK/HOovmoHZObfqVbNj1N1y3Vz3Wo3N1ZTcHyKxLNdKw?=
 =?us-ascii?Q?2mGjFsy5D30H7efCvRDoIm2EEjpPpR+5Os6beE99c9CIs0lPsjethQUa+MZy?=
 =?us-ascii?Q?WOflppOaf2YxXXlAHZye+Ca8Ws3zbKfP/avrXnVf64BgJgqiqYbROLTdqacd?=
 =?us-ascii?Q?rd/TTVRCAQRIHVYY+WYuqbxV32OKcpVqQ90R+RKcPyIVWX0oQO9Lt3azXzmo?=
 =?us-ascii?Q?WSrAMv7HDx5/UFI0QOC5DuonzWyz4yKaEGImw1vzehkEVw0iuVwXbtW0PY5G?=
 =?us-ascii?Q?p81N3InBI8V5CSxL1Cnec1yOfOJpoek3d35EhH4eh7pHvH4yrTAHWpJqVzui?=
 =?us-ascii?Q?ofuWe2g9B2sNk+I5rApMZAK21cjNRm32Yu1Tkrd1vCOU6dGEkLjRbqE2svP8?=
 =?us-ascii?Q?53DkaNF1jaGFNfzKZ9zLPi6tNSLCzbdlrUYTuZTzzC5obaQaoTy5QbYmiB5C?=
 =?us-ascii?Q?k9hW/K6xHsxFqi0SOvToRqO9w0w84F6jWRc8lLYq9TNZv52XGXyuOyZ4isAx?=
 =?us-ascii?Q?GmBJxoipsLWsdF/BpiK8R/FB4Q7r1PZL3YYcWhPMRhlxP4fvUe4Hw9cuyQwW?=
 =?us-ascii?Q?99UjwtF/zYCgPCQ5w3yhnehPbNDocS9qXjV2axtsBEkMUggVYw05PiWzJS9K?=
 =?us-ascii?Q?aIwGQ+oQ7ovPhD/vjDpgnHGgLanDbsPpcAhnv/MYmo83N0PJZdj6bJAiHRFG?=
 =?us-ascii?Q?PWi0VXj0Cf773LlYJ9jCo5GcacwYO25b9BI768xnVe7vy3N8aFy8tdranceV?=
 =?us-ascii?Q?72Chrw45+lhKV1gxiPNPEgL1yxlD9hmiHxu2lu1OJOCy65HpD8x27EXwOVVR?=
 =?us-ascii?Q?ctzNNCddC8KMmpxlKJGVDVPMUBHhjn1yIMtbRj/c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87f7be5-f766-4597-27d5-08dd764930b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:08.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To/DlZHcT1oYKaybVWUM3Fh2NqeZFPphdE6iAN3BR6poeNMb5057ksCrD2DkRRsiOxRmtH/mBem4zuHJ0n9dsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195814_500019_DFF49F6D 
X-CRM114-Status: UNSURE (   8.37  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (4):
  media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
  media: imx-jpeg: Cleanup after an allocation error
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 119 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 96 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


