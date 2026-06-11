Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5AECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=; b=mwTgnF61xQNL+i+aA2u025nw0E
	HyaG6mqZqMkgrS67Y6QILl5E9qw3NWNTmuY57jFeNTnPjemFnxygouj0hR6t9fUqwHIfhdvBGUuyT
	ZevXGPfwNtIxZR2cnvrpBeTWT14WOxWwPwfy6jl5pSINehGmD9ZvNXZBmhadm0BKkhpqw1OHZA7NN
	mu5G2KbYH9ohUJ5Q9V6YHNQr8JQU/Qu4GOIW3O+jV/VjefeTm3zNL0slm4ducA69EmJ4PAvNWB66B
	vyFZ6nfeXcvXAaYOEWydw+HbuycvguNklcmLz6oih6eN6cAd1X3c0CEeNG4RjwwFSLp+FMgs3Cbt9
	851rcVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVz6-00000008bvt-2SUz;
	Thu, 11 Jun 2026 03:21:36 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVz3-00000008bvY-24Fu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:21:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mde5YPfnJY54zmYDsXD7lJ91iQA+iqxDESQP+FBFe4OON4v9C8T7eWqpsT7N+LWKx8P65qg4fA1U/RBaHHVeAtLtjdSXLYHjxvUkJoJUzckXUsVztqLB0ocf66gq5PDRLXjPDuPWAPLLHki8qqsGmMZZjjihW7a5Jrfv8bRQJZ5cazvhvAVfCNKd2wv1TOGBJPLV62VxY0MyrkQ4jMhuyMJzSOgRgS07cGHqCpiElkMDuCGFAXDoVgyS+r140dyuforMfnvgP3LLo3seea+HJLZ0Cy+vg/Rs5jR7VrtjY773UAr4tWN8/LVoe0ZktYgrGmamZgz8tZrRDo/sNuO4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=MvBbtsevD5Zb6XGs65VGjIVnq5uxXqWcQBtp9gj4Dorq7IRoVFmxigpA5tyC4p1wbarqfMeXDPjBFh9CR5qFDoWpRpdVmo5ffeGp9VlnxpRkJobJHjEJt03MEQl2EloZWVCQTPJVU9h2juYcwQ9dLgA4xzHMvB9DhV92o30pbYUVq+H+wqwFI03NsT6M/7w1TqVgQk5ADnlhcF7owufTxjR4jYQuOx3UZdyPkenjSldrEdqYhYuSnUrxhteZWsoowDMktWvAl+W7LZftC9AAdZOLFL0Akqj4m/wjGQAiOiwF+L2gcTcNF5qAc2gVkxUtW7YyCI3X1LSzxU66EXBcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=WJRt3EdnJcWhpfx4i8bAikv/hwbMJ/FtH0u/KfX+vacyJGdewrxb5d/Jumbidcv0zr0noJjNFlmjLSD17MoxDy8glyKOA6OjokrEoB9jCfaFufiunfGPtN2s7XBQKne7l+nNVP8AZVvNDe60ivoFtHdb4PZgbj4KBgAV+adSM+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by MN6PR18MB5416.namprd18.prod.outlook.com (2603:10b6:208:46c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 03:21:24 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:21:24 +0000
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]arm64: BST C1200 eMMC DTS for v7.2
Message-ID: 20260611.111859-gordon.ge@bst.ai
In-Reply-To: 
References: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:21:21 +0000
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|MN6PR18MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bdd773-7370-4b42-03e3-08dec7688474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: D1dtj9Pus50ZXKOsYoVf8D4mJoN8ux/DzE8efLgOiQIYwNkM5FsTWSM2JaBXCdw6GyxJ+3wNi4Eknj2BUv97ksNNfsBICOK5FMTNI1wd2bKx7i7lrvrVZBNsN9gE66xsIiK7ASCqzpnGsHiGt1p5vuyRz04vBNeQc1UK3m+KQ6R95Dk2nr51MER6f79wES2KGKBi1wSgHmVQxj3QHszDVxjaeuHKq4EXaIlLY+mfnJAoYlMwfW23NJn1vjh+zH5LOO/lB6JbKnq54roYNawOS4T/UgMf6jonGDi/wkvjfCL5zpOpJqZqq8LpJ87hJe3bTBUH47o4TOaGCERns9iNHQrOeGB3t/yCMADmqXRIXyFO7mIxhRC+834Ze2bu2mWTDxQG4p2pkjzQDwcly6roCSz8+LKl3SeVTq04YJxJ+GUOHLPP/v+H3PuRkJDOvBveYEKGH/i+QYvHskZ4O5DsmosTm1499/xBMDIAZLrxSMb3cDUCv4kSt1W1jJvbgdxN4cJCkv1ifAdtuoF839YpWRyKbzGXMzs9dMIDQI8gg7u3aM/I7yQUdbWLmDNMrTjpsiZcDmGuFk6/4qfzz7I5px7JWfra6hhPHKUVsdhDs9sQFtE28lVPGT111vACt5tbAweeDAf5xSzksC0UMQ3F5RjZqXN5ofJdVJNIC1Gytfz4I/Rtg7NjUp5TPvn5i8zk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjJCNmRxc1ArZkp2TGoydUl3UUpUQ2J0SW9qREs5cnJ5emJhZzJTdWo3Tm9r?=
 =?utf-8?B?OEx1dFpLTzZmQnpvcjBLSjZOeXIxb2NlMGRyTTIwQThoVTR4WHlsR0htSklO?=
 =?utf-8?B?dmNmbkVkRzNDZFdnOGRVNitDQTRkRXlTKzJVb25ZbEI4cnpWdFlOUUJMMVhN?=
 =?utf-8?B?N2lRS3ZMRDdUYnBLQStXNjVRVDE2WS8wbVB1UmFLb3hRb2JaSEdPL0k1NFJV?=
 =?utf-8?B?UVUrc0I1ZENWSHRjc2ptVjg3KzQwaVJ4enRFa09HNGd1RjVmWW1Ma29MRC9w?=
 =?utf-8?B?blBRbVR1UjQxOG1KWmhQbmZnU2lPQ2p2Y2ErZmFmMWJkK3lQZDNaTVd4bzFF?=
 =?utf-8?B?MEJHVVE3Z0xTMHh6SWtENENTZXdSb0lXSkdscFZSdXVBeEZ1WjF3eVprUXow?=
 =?utf-8?B?eU85d09ROTV0enZUbW9RZktTN0lGUGpFYkZuSUNYMk1kcDVPcjNDcllGa0lH?=
 =?utf-8?B?QmhRcFFZWVpIM09lZWZIcUZLWEo2KzhPZjhveTNteDlrZ0FTR3FvNkYwVXQ3?=
 =?utf-8?B?c242cVo3TzV0OTZPcm1ZMFJaaW96WE9hNlNnNmEyamExSEZxVXJnczhVNGRL?=
 =?utf-8?B?blZWdDUvYlJXU293R0VuOFF6RlZPQjJIWFVwV3FVV2JEQzg3ZG1UV1dIT2lM?=
 =?utf-8?B?WlJWTG92cDVhZk5ONGFqMVBTc29odm9SaTl6dWZvVmEybm1pZFR2THhnMnVo?=
 =?utf-8?B?NjYvckRqaUtzYUR3V1FtS0FBWkh6cm93MTRzUnpuTlAxNElwYWwwRi91Nkl6?=
 =?utf-8?B?N29oQm1lRldycTRFRXp4M0dMVlJxWlRjcE1wL3V3MjJWd3E5M3RFb0ROMnFy?=
 =?utf-8?B?UWN0cnk3YjNTQk1KL0ZiWjZ2TGJJWTYwUXozRU1jWm8zNm81bkxSMC90eGdQ?=
 =?utf-8?B?L2xEdFBqQWFMWi9URCtlbUU5eFNVMXpJeXB5ZCtXS3F0S1BBaFFKbk95ZUFB?=
 =?utf-8?B?OHZCMXV1TmhoMm5wcXpuNEwyK0twVm05d0g0VVZmNEk1SmZ4QmdvNXQ0NTIv?=
 =?utf-8?B?UjZsdjd1eS9ZY2tJVGplbzh2MFdWczlaTTk2YkZHUFRWYU14L3VOSFZiSThy?=
 =?utf-8?B?NWVrWjdoZXExRkpTQ0RTeWJVNWJXVHNjQmtwZzlyNFlMZ0dUSEhqM1dpV25M?=
 =?utf-8?B?MjhQSndsLzZlRXpOdFcwbWdjQjc3LzFsMGoyWjQ4TnBaYXVDVDAyTnlSanZT?=
 =?utf-8?B?dEJHQytMTlNKbzNFQjB2aHNqb0NISUJUMjRNckdPZnBFODlMM1Y2NG9wSHY5?=
 =?utf-8?B?QjZVS3lCRm5wUWg4Z0h1bFdKMnMvTlZPQlNqcFROWmdGcXFqTkNNTTZ2ZTRF?=
 =?utf-8?B?NG4yMVEwdE5xckc5WXF4ZXAvelEwMFgxL1lxdXhjT0VWUGdaRGFvc0lkaTcr?=
 =?utf-8?B?YmVYOVVmNG05UEtSZ0lrWWN5VzgwMy9MbElGbURCblNyalZpZk03djRiWjBU?=
 =?utf-8?B?aFZGdDgwL2p4VmhOcGlsOGs5QWhXSzBoVzFvU2dNRzl6U3dFVWgrSUZHZ0hv?=
 =?utf-8?B?eGM4S3Fxb1RKeUtBc3VYbDlBN3ppVitjY282aG01YU4zSVdxTTZBaDF1emth?=
 =?utf-8?B?eEJqQXU1cHpnTS9rUVdHVS9MeWk0Y0lOZlVqTVhPZGJHcmdXV0dhOUlYaHBQ?=
 =?utf-8?B?Q3VZbng2S0FpelhUVmgyckdRU2N5ekxxeVVROTJGR251M0I0Q0xzdjVpc1lV?=
 =?utf-8?B?eU9BN04xMU9XYUhnVmtmMVpHdTdLaTU5YW5KNHBKblU4YW5JVzJRbVB1ando?=
 =?utf-8?B?dHBOWm5GUDVGZUVFdGxBRE9jbzFwbmMzYjFRS2FKQ2ZpTmh6ZStiaSt4c1pU?=
 =?utf-8?B?alFJREIybi9GRkhqNldqZmJsN0VGYWx1dnRjRitWZjQ1ZkxnWkJtWG1PTDU0?=
 =?utf-8?B?azBNbnB5Tzc5MDh3aUFCSnVLL0JHczVDWFF6eC9xdXV0cjVJR0pralIrdWxV?=
 =?utf-8?B?aDhxdXphNmVhWGh3dHFmTFV1dTluSHQrUXh0VFdiQXFFVzlrRlIzWTYyZExY?=
 =?utf-8?B?bXJjeE5DKytNeXYzdURIVXZaRlljRkovdWVuOFVsUENPaDMvdmlSODMzUkYy?=
 =?utf-8?B?cnpzVVVQN3g3ZFFocDRLdU9IaTkrR3ljNGk5Y0dldzcvNFhMUkhYVVFpVGpB?=
 =?utf-8?B?Smg0YXorL0laOTJHOWUrem5hZG45RzE4M2orY2Q4WmM5WGF4NERhWDJTdzhk?=
 =?utf-8?B?U2RLYm5CMnoyZnZibTJzUGtaVkhjdTU2VG1YZWh6bVVLTnF6a3BGd2krMVZn?=
 =?utf-8?B?UXF6dlkrWkpjYmg2VXJXT0gweFpJY2VFU2pCT3Y1L1V3YTZERDM3MkNib0RK?=
 =?utf-8?Q?5yqg/6HmHaq06ep7FP?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bdd773-7370-4b42-03e3-08dec7688474
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:21:24.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zDcuURJngepxq/OKZ2aGRWckiuknByOPXctDoiwK5AI3o1GBSmyNrF1XndXgzqsDM1YaE3NxlMfcOb2Tudbew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_202133_537904_C9305DF2 
X-CRM114-Status: UNSURE (   6.77  )
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

Hi Arnd:

Thank you for the review.
I have fixed the two issues you mentioned and updated the pull request.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git@github.com:BlackSesame-SoC/linux.git tags/bst-arm64-emmc-dts-for-v7.2

for you to fetch changes up to 6e3b49b69038ac794414ed0731634e2677b834b8:

  Add eMMC controller support to the BST C1200 device tree: (2026-06-11 10:=
37:12 +0800)

----------------------------------------------------------------
arm64: BST C1200 eMMC DTS for v7.2

Black Sesame Technologies:

Enable eMMC controller on BST C1200 CDCU1.0 board:
    - Add mmc0 node in bstc1200.dtsi (DWCMSHC SDHCI controller)
    - Add fixed clock definition and reserved SRAM bounce buffer
    - Enable mmc0 with 8-bit bus on CDCU1.0 ADAS 4C2G board

The MMC driver was merged via mmc-next in v7.1-rc1.
this is the remaining DTS piece.

Signed-off-by: Gordon Ge <gordon.ge@bst.ai>

----------------------------------------------------------------
Gordon Ge (1):
      Add eMMC controller support to the BST C1200 device tree:

 .../arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts | 19 +++++++++++++++=
++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi                 | 18 +++++++++++++++=
+++
 2 files changed, 37 insertions(+)

