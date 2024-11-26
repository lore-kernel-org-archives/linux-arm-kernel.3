Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F82D3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YOUyGNXe3y6v++paVmLtoN/q7IA+0dQAO1956H/jry4=; b=HwwLN1THQrOwJCda5w+lxC/H16
	tBco/XF69s4dY+zo4mLy5kDpqvYYGCooUHinGN1OmSvWXfHxHr/7oG21ODv+SgAWZILC63H9a15FZ
	Nth/MKh3ZlZZZsvbFqVipygRt/+aAGvbPrYvD9n2Q232ZEM49F0xzSQc/AtmCfB4RoazGpIFmlqMp
	XnWc0wFAADanAIeQhFsMW4FpBx6FB1e+JpkOMIzrBlERb/uu+WTUbB4XccTllcQdu9fsw5SXWIEph
	SHi9/4r78gVQYSnIF+4A0O0F/Ys5z5wI1D8yanKrgYtqhSYaUwsBMoBGHIvIlrmsBMjjzb8U0ZOCV
	OfTPystg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrPv-0000000A1b7-21P9;
	Tue, 26 Nov 2024 08:59:31 +0000
Received: from mail-mw2nam12on20731.outbound.protection.outlook.com ([2a01:111:f403:200a::731] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrOQ-0000000A1E2-0VVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 08:57:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+TBcu3skx7MJIIEheADxAO5ZMHTG8UteTrd2duerhJw/JwEeB3ol0x4Q88rBoGwCc4V9kSEVSfoew6ZUAZt2KW5hVeA+rEVHTkhtQLJwcdIoRCBN8nSJfeFLrIWYr47OnCE7juFPzVvRZen9M3HOBBKIuz8X1SJOHeGcYPzkuc5Y7Pm/xAYju8tRvrMJcPWIARsQgpb3bYHITYjKXBNdEIbu932nqgckcHWG2nvlgpCAWSrDj5PIeCqICZS3Fm3PM8vOb8mo0jPQFPw3v5T71iCWWtbU5GC0UIXYJT7dvpRVvyJajL8KVEnePlbv7vDRsNIIC2qyvHiO+3moHHtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOUyGNXe3y6v++paVmLtoN/q7IA+0dQAO1956H/jry4=;
 b=LwuNB8Nd/ivkezwgBKBLp5hL5ugSa8Q+rEZuTJ8ye1bAPDPg75wC55/JJ9KuNcozmVWQd9/q0fUpvqhUUOBVtvqYIPGdr4sTGGCTiSGcpECYhDsuKDRLp5yWHF413AhO5xc2Yubz20mgt2IdK2prKFNRqQFPfSMOvtybHGNO6IG2izjKRyxYMA/BwR9VfCxTI1JjDE7yUtUq9Xqc9nl/0JQ5JarHjXk+/PXoBXT8dNiXqGxgV5TW8iql254vXLTAVpECXT+0zckA8VSTjN1FcKdfTYacVcMgrL09nAGnsbCKVLOOMGTwx+AvHL/A8Em49peTkjcNpQtl9qc19Ss8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOUyGNXe3y6v++paVmLtoN/q7IA+0dQAO1956H/jry4=;
 b=sZ52aRuhlXsrOSRU6wexQsd9D4WA5YhcL2utTl9uLiBA1h2gdQC+DMtvOLhe73AwsLUlrClWY6oyvozs4lOzwSeYQIut7/AYLhnT24ls1dtbxumMkpCuJb+uUt7VQGVfFzy41rCARBtIR3ekp1GXuMckjqxRGtU4r95Ov/7ecvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS1PR01MB8869.prod.exchangelabs.com (2603:10b6:8:222::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12; Tue, 26 Nov 2024 08:57:51 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 08:57:51 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
	paulmck@kernel.org,
	akpm@linux-foundation.org,
	thuth@redhat.com,
	rostedt@goodmis.org,
	xiongwei.song@windriver.com,
	ardb@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	mark.rutland@arm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cl@os.amperecomputing.com,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH v2 0/4] arm64: refactor the rodata=xxx
Date: Tue, 26 Nov 2024 16:56:43 +0800
Message-Id: <20241126085647.4993-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS1PR01MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ca7849-27dc-4608-2891-08dd0df86805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/qDQxfvSZCduVUWMQHDxiboJeTYylOVoCTpDZHxmcyVN02R6HWXrDpnxe0sf?=
 =?us-ascii?Q?BbLpETMvYBetHoF+oyL8cHH+vzShZ8TjUqdVV517HvoYUWJIZ63lyo4ACX6f?=
 =?us-ascii?Q?nQ2+a8vBW/AIzK8lP4wyWx21byDIRXIIer/6yPwGsuRZXjkcY81xBWCRMqFI?=
 =?us-ascii?Q?O3UyUiZtu7uxqCMgjW0BnJMwXmJj1NwGA2D9YawNhOSteptS3sjCPl6838Bs?=
 =?us-ascii?Q?10MxSrjtKpfCCXFtgWm+3OR1It6g0v8sV2AhdGQzOEo4rn5qOASXLS3TWyCK?=
 =?us-ascii?Q?cuNs0WxL0YdCG4CW8QNsbmDZskMGn66YGOdqKqHf61UE8krs2pOjpaAYn19b?=
 =?us-ascii?Q?A6aFPQhgVyOjtxoah2XQLJK4P1VZ5bDt8LtfXcKSG3BF6ctr50W2x//9b4P0?=
 =?us-ascii?Q?+0uAzKPhUVRFfMX7ifQ4vuoXfOAH/iRAeX/V2vPUtl+rHIrBQMFv3uU7vC6j?=
 =?us-ascii?Q?cXH5NuP82vrblyjp4G+8XWkOnlKOTWSrvTRdIWQ3gpQ1SQlNQrSuCEFOdOPq?=
 =?us-ascii?Q?PSdJgGVATW5uPdJBl3vLXUxh7pCORq4jZKECTQbUx9CJOR7cIca9ht2q+swH?=
 =?us-ascii?Q?HhBgcXm6E+GXyljnfMsxNp/W23LOsDRkQKNHji+7jO5s12RdnVotfpns7UoN?=
 =?us-ascii?Q?GB11n05JH1zdauoKhU0i6O9N3qOaoC1U5Tl2qNgExd2ymA1RdKzJjhYN3/GY?=
 =?us-ascii?Q?EOtyyHpR+7jKEbmblkA/ZCHepA3HciRRODEJJh/lAqNc54/P9WM1LbnSrLLH?=
 =?us-ascii?Q?6koqsTVXJRC1KE2ZlYBZNp6OUuAbDKIJ+RX4dXSNXrhPU8xWxGF4DGE0J4CK?=
 =?us-ascii?Q?rzhhBOh/OMBRpVQURcvhOiwY7TNntFv8ymWLcVi5xfnoLBOPMIvapG8b8DNz?=
 =?us-ascii?Q?w9d+Y1sPXpe1Kc44O4iZsqhA13Qk3aN55LxIn5WzcKMZyRVw/FcC8eMhQbBo?=
 =?us-ascii?Q?ov8TA7bLzIqFRkYakPA9ba9Ho88BD87s7gJ6dC0GdrcpQJA4+teLg1FjpswG?=
 =?us-ascii?Q?T3MZB62qWDY8sHtrBZmvvsosROTY7j2tiJPrdY8hAmnxpWK3nhrDRh48wasT?=
 =?us-ascii?Q?bcWf/ZS77yxD3LDetp0F5GYcu7qa5qRpAD4w7r83EPY0Zok8z6rfPGGl5RmE?=
 =?us-ascii?Q?CZtZFzlgdzP78b8rrM2UKXnwSn7WQ3UIX4ujlSTA9UyTkX5jOP6HHjWbK1ER?=
 =?us-ascii?Q?Z6pRDK67Gxo6QJWa6sOHClDr3O/XmXSEoFjZY8Fs/AsU3/tNuCHxKqEwXMaI?=
 =?us-ascii?Q?1ba8UW2ewLjLKAdVEUCoAgwbcRI4ZXtdQrJJNDoAubIZLOeFtEbMJ/fNJccT?=
 =?us-ascii?Q?6ViJ+biJK2UCQwtojww5m12kJOkDLk/w7sKHHPUVrwFH0zr7RdMow629zayY?=
 =?us-ascii?Q?V9DOQBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbLG7h92QRYmYzuaV5SLvzOIgURdwJTFwlH9KmNonXlg6i0ZglgOEUIdt1Mm?=
 =?us-ascii?Q?H4+Iy6sfs2fwLVDdKxAEFqwVq6qYUWpQ3T3uyB+sIsk14ooi39ZR+uNAdlij?=
 =?us-ascii?Q?r4EEl8iF6CHELprnDTMjNVaRrepWPys/DPPDvEgs/1mwsRPR12VWUpOCmw5w?=
 =?us-ascii?Q?W5E3X1Is5zjRm0ihJq+3t1zIB6rAccUe07a9iqIW+V92m+S2+WFkMO95us7L?=
 =?us-ascii?Q?OVg2WGNuhqyHt7huBdkzPN89EcEBbCmD5wA8IONX/z631v9PUVqppZI1A1x8?=
 =?us-ascii?Q?VYuAwHVC20ut0fca2CTEP/5qGQiMBLM73a4HJQDTMjFZovVzQycQyuOKzUTK?=
 =?us-ascii?Q?7dFnRLEuCfuSXvCoMYsUUEP/Zi5Rec8ukCENYfd7mVKPHBPP44UrJXgUYe3l?=
 =?us-ascii?Q?Cva27r6b5+/TBwU13pcMuCDDDLQY4qX4nISAXfNXfSrN23bJjkAvCU6xebZo?=
 =?us-ascii?Q?h+nKo1GkPi1nXnHAZRMD1cxWPNRWWWaaZR7UKjettgVVEiG0m3eXiodtksEZ?=
 =?us-ascii?Q?HFu9Yw1VbGgdJKlHWiOmKcs3UnN/Z3W3xZP62RlabqO08TGfttWrZxVMOwKQ?=
 =?us-ascii?Q?g3BdgpH+hi4xmsjUJe+r7YDRt7sUp1U0FywgKPYf9kT1uJXfI1rGWIs9eqp8?=
 =?us-ascii?Q?depP03pqjQQhMDoTIrdogFOzMFhkbG20sUO1f04Cbm5VWP30FtkPAH8q/Ngq?=
 =?us-ascii?Q?76sXH1XKS8PGdbTTNe355JGhlZjVw/mujFMx55W4+tn7TEynpQvlT8ruh7Mr?=
 =?us-ascii?Q?GsbYDyuzIdyyFFGNivsS3t5bzbv/FLpy1ZWSUng3zxye262H7eDKuU8aZuiR?=
 =?us-ascii?Q?n6FFkdUsXQ9IIQ1Nxd1iDg7RHCRIswf7FcKzHPYDdRFr163pQMET/AOn9kwT?=
 =?us-ascii?Q?FJ6hvKIFESFd7HHQ1pZPxQvnHjDuf7i3NEZ8s7f3iIcRkbQ/XFrjMTLyXFFF?=
 =?us-ascii?Q?6G3k6EA/jvU2yavkwE5dLKdqu0sfP1MMcbEnMcZw54MgT8ASsBnTlpRJ4vx1?=
 =?us-ascii?Q?8pRmzMvvjNqY4KOBGT+PUA43MhDTafTlm+sTx5Cki5pWBKa7z6VUGrnoTilT?=
 =?us-ascii?Q?EaRvNggYeHnEO98A2iHZA+vuDL/kOMKTHZUuCkgtjR72MrOhsDfhrV/8yzT/?=
 =?us-ascii?Q?AejDJ/GcyY0SiqOWeF3x+sWWQGsXg3YKJ90kap6TedSFsLeqlsmKH3Wtfrz5?=
 =?us-ascii?Q?0DAnAItwO7BaTGGF9Tnn1E5rO9f3hcN0KSCYcwl8DzgTJCfLMRNppLqOrsQt?=
 =?us-ascii?Q?HlQf6/lSXzoqZ3ZgZd5dY0clbRV/wp4ljPwdwyUQGHSdeTSacumR+N8MTZos?=
 =?us-ascii?Q?68ZGz96w1CXKLjVId5J1Cgu8nSzeqewiecaGlGJZiOCChXCq0D2HBVN/Arwh?=
 =?us-ascii?Q?WNV5IdJ2mGKdkQ09uTj+dvr5OXgcvY9OBnCRDe9Y9AE+OwMJoO14QFgt3deH?=
 =?us-ascii?Q?wPefv2iZW5PQEcKkjYdKviWXH9iWnUDcUwgTjvrXP4jEmYFgLkV+AXUYOsRk?=
 =?us-ascii?Q?3BS2hwMpF3NCNWkSPGgnuKMVpgjGB/mazvJhNZzIqis3WAZoODqFxN2W7iKZ?=
 =?us-ascii?Q?YQ2xRN09eWayrL/8sS6/3TdP/2Y0NhxEmVainvI+ulOmz9ZgWRaYM5Pzm8PN?=
 =?us-ascii?Q?t54YTqjDgDR+lScmO/nv9rA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ca7849-27dc-4608-2891-08dd0df86805
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:57:50.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFSfabuqa0Q9XL7OH6GMpJZrgczQiXQ8IatCxFFMiOiLUSSMdi8pv6KIewS7ZICoLmzUX5q40hRfoghtW5wYOJ9XudrqC4ElMk3gUJwrSjvvfsQI4xrhCR0n9K/AlW48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005758_165543_660E6633 
X-CRM114-Status: GOOD (  12.52  )
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

From Documentation/admin-guide/kernel-parameters.txt, we know that:
 rodata=	[KNL,EARLY]
	on	Mark read-only kernel memory as read-only (default).
	off	Leave read-only kernel memory writable for debugging.
	full	Mark read-only kernel memory and aliases as read-only
		[arm64]

So the "rodata=on" is the default.

But the current code does not follow the document, it makes "rodata=full"
as the default.

This patch set follows Will's suggetions:
  - Make our "on" behaviour be what is currently done by "full"
  - Remove RODATA_FULL_DEFAULT_ENABLED
  - Introduce a new option (e.g. "rodata=noalias") which would match the
    current "on" behaviour
  - Update (simplify) the documentation

  https://lists.infradead.org/pipermail/linux-arm-kernel/2024-October/972613.html

v2:
  Follows Will's suggetions.
  Add a new file fine-tuning-tips.rst for the expert users.

v1:
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-October/971415.html

Huang Shijie (4):
  arm64: make rodata=on behaviour be the original rodata=full
  arm64: remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
  arm64: introduce rodata=noalias
  arm64: add a new document for the fine-tuning tips

 .../admin-guide/kernel-parameters.txt         |  2 +-
 Documentation/arch/arm64/fine-tuning-tips.rst | 23 +++++++++++++++++++
 Documentation/arch/arm64/index.rst            |  1 +
 arch/arm64/Kconfig                            | 14 -----------
 arch/arm64/include/asm/setup.h                |  4 ++--
 arch/arm64/mm/pageattr.c                      |  2 +-
 6 files changed, 28 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/arch/arm64/fine-tuning-tips.rst

-- 
2.40.1


