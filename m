Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E9DC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mnh8LT8X5YlXU5hyiTlPkJbulAPwVp6rPq/8K0MBcPc=; b=A0P/Zkxj/PxAg/q4gyJ29SaaHp
	nBz/JMg2vTUNvdf0qF1Alvw18cGWEofN1ozwfazJtZKbXf45DqDm4Br/Pynnl4HdmiTeNdQ/xczhW
	8NSiMiIgRZQnU/fgIoUVp9DIp6VxS3r8+5yepbkMxIPgE9EA7hyjDeEPzbm5a+wrpX4Rs2skOt5sE
	7HPpNd+Ml/8sc6MPfgKjqBx9pTZ5MHi0nSZjDtuUwgATn5bBuyjRAun0ZxhYiIhk9vDDgf5SDLWFZ
	UfuPlXOJFSgamJ+68qRrSFPsa6qPO/CeiR61gcFl8cAzImbIycS2armOvCBlea8mlI/Tal8ZtjIkc
	x8L6He/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETdU-00000009dbc-4BRV;
	Mon, 12 May 2025 13:56:05 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET0a-00000009VJo-2oGk;
	Mon, 12 May 2025 13:15:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acvkZjErFOBgmch0Ab3vuxbcZlhWE76agpuJx5B+P9fy0QCBA8DY5ed7k1cnqJ7LM6XK8Q6yFrAJc0OfbrLLiJuIyf+WjPEqo3RZ5U3/aEJzJMieJpbwdItG8DdOI3Y5EEfesGs7UozJ0DchVzx+htU3VzCzB8y/onvkDF/UWQnjWHjOE9PTGH2huVaH1oTTLEtQ8N6uOLxS3nYlsti1ZoyLa0gMAcGPLbBnQj9H3WXYzJE0M1qSaaz8X46WkncZBtabAISdCI/GbgO5anTxx875ciQUXgmAc7+/xGIk3SlnV2dVQwYlJf1NJumZmvNbAQNvlRdvB8hUM8JCI/SEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnh8LT8X5YlXU5hyiTlPkJbulAPwVp6rPq/8K0MBcPc=;
 b=i3N+WS1n0tfsz8XZbcDS5zOaAG0nlc9LGot0IPY6jKkEur+BSxAllPyJgXIW9ZL4QgpAKD45+G8tRWX2ySK6B7mEt2+PtfHdpljK2RluzZ5Vjc2/4+cm3RRdXiFSi6rzILjGdSdOVmVx3UXshpgAJbB267tni+lGLHzP8HnWrnYfImFYPf+ktyfwTO/R9dUWWqn00NQZFt3WECLu+ExcCaI6bCz2Hy7hPqQ19qSDj0Fn8g2rE72bi3vGSSsc3y7/iFahj3aa+ekAnhNAHPzpNTJVJ6bXz6gOe+YXY9fPjtN/ndav9O1NMahsnFT2E7ifoQExJ9YIPCue2JwGn4KDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnh8LT8X5YlXU5hyiTlPkJbulAPwVp6rPq/8K0MBcPc=;
 b=NtLovZEzAfMURO6u2afBjJ6g/xJww1SdUchC5YW/cJDO51ehfuZMHwsTHQt2zyFaIT6yrvoCOwBBE2jE9/chGOrMBm23gjlOOx/zJgYfoUMlPhsj1jK7bspkxftv/cAz+MH8chcBntGoj9crgdKJNiQ5ifZ7QnbLmdfWJs5bPfa6/WKUoHCE7AZ13pxlmWY7cX+l8lVkkI/eCN8V7/HFSz7k+SDTUA11R8NPO/B9w08DgrrLOpcgXv4rta4CIZ2I7EIgWomVQSUsAB4SG4IBrL0jpNfZ1daPdfC+LcgHuU5lyiqVwMQbq9yap4WetKWjuW4M18YuA/oukzGM0UeGWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
 by PUZPR06MB5953.apcprd06.prod.outlook.com (2603:1096:301:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 13:15:30 +0000
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::9d21:d819:94e4:d09]) by KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::9d21:d819:94e4:d09%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:15:30 +0000
From: Huan Tang <tanghuan@vivo.com>
To: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	peter.wang@mediatek.com,
	manivannan.sadhasivam@linaro.org,
	quic_nguyenb@quicinc.com,
	luhongfei@vivo.com,
	tanghuan@vivo.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Wenxing Cheng <wenxing.cheng@vivo.com>
Subject: [PATCH v2] ufs: core: Add HID support
Date: Mon, 12 May 2025 21:15:19 +0800
Message-Id: <20250512131519.138-1-tanghuan@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To KL1PR06MB6273.apcprd06.prod.outlook.com
 (2603:1096:820:ec::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6273:EE_|PUZPR06MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 0887b132-5296-4a5a-8bf9-08dd91571173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLeHWqWxzif1WJNZx+r3ALIT3ytk/DgxYElRO5D8/4XViC2Mu5CphBh3pTao?=
 =?us-ascii?Q?aFdUjWQYxB5segjzESg4VUoXjsXauMQX/INJ7CGmMTHup/IlvxXQZ3n6bxxZ?=
 =?us-ascii?Q?fNKFskYLkS9khgZ+wp2pc7s+DW1LAfAG99vL6x2tsI8UCSuBUMGSX4QlQBLb?=
 =?us-ascii?Q?2fGkwgYGObSailrEtLISgSTFLVcmq85FCsTpDE3N5uZNQcgU+nWMT4zYMaFH?=
 =?us-ascii?Q?ujA3q9fAdmS+lF4AUzA1uCIuIxrV+95gQH1KUHb6tt4Ec379k23+6dykUlag?=
 =?us-ascii?Q?RIgKNpFOHm6CeSAMSQ10z5ybk6kdY/w6I53OuxK/ab31tGoJ7xm8A/d4oBQ0?=
 =?us-ascii?Q?Y6TRNAt4gTSpy3hYHGPEeqQMWOw6PDlKcee2Qft3OGe8borsebEPYbb9pFBY?=
 =?us-ascii?Q?5zJtS/1f31amLrVlEsGqZnHqzPIl9jbRVdBI+OIGEgFqJ80gX5+t8+6Bu0tF?=
 =?us-ascii?Q?hy+1kIPfUECHmLXGzJhDo3nkdjgRf9Jwv6CfYVyXMwlfvlPeop84yz9SIFEL?=
 =?us-ascii?Q?rLxwAlVOz8TY7c9oL0NIEZJv9DAssAupvjjMpo/MwK/DM3T3fsALNSGVpPPe?=
 =?us-ascii?Q?ZpuKZoMrJNfBLS7ZUaxbZjX0+bQ1Hq/I6KPC7qszkiQvNCC+4fyFZQIaFEED?=
 =?us-ascii?Q?z0+PH81Hkmucxi9wOpQVZNEEb0nrdpACxGCX7VSqh0pxLGS4N0edg49gUIBV?=
 =?us-ascii?Q?qr9q+adZYJfOvbPD5W/oI2uXE8ZTOu1aRsW7lvTGPVcaIEP5wmEAtXnlxvt4?=
 =?us-ascii?Q?98/db2hX/gLejQOMyoXUFAdJdVxUyhQeRooLUXAz1oBeJEQrvevhgV+ghJ3Y?=
 =?us-ascii?Q?qk/y03iBkTGa6dv1jN9sO/03Oc7GRbzb/epmQmsAqc9HNpACaydKcmiSV2RS?=
 =?us-ascii?Q?dakTZpS6EgdqzpoS9F39n+C5UjqUK8IKbMyqdJklQ0+eZHO1HfiunLSetjnD?=
 =?us-ascii?Q?tO9mFLBkbNanC1rd8stPwy1f+HTWJ88TvDgA4o3iQ/UdW+q4H9qR/QvJdpYi?=
 =?us-ascii?Q?UAHp3uZDTAZb5OxtvcNpjFrAT2NC8lxZ5812EG1i00mTSBfup2CiS6PrDxKr?=
 =?us-ascii?Q?+zRkRlQp2UfT2UZmXPH2iIxj5qrzKREmk4BIvN9lhhRZel/akE26qvrrqkak?=
 =?us-ascii?Q?Ud/DDv70SVYpH+SRj9snYJHE29S1gZ/91nkrA8Gsf7JUCLxh5cT0Ce36+mAH?=
 =?us-ascii?Q?3mBde2Ye2cOMH0GEPnfdKqbSgJf6VlBFEw2Lfv8uK1LJeReyK1ISw4H8fZwp?=
 =?us-ascii?Q?GbmjERRX3cZVBQELFcrObKaVSBYiJZbdPykQ52JkUvLVUQ6sX7F0KnxA/mZh?=
 =?us-ascii?Q?BTosZkSe44sVUc7dpVgm63EVgl6zIGYvSqBtmCwLdmnXaCLjf89o//y7DMvi?=
 =?us-ascii?Q?yJ610N5sR9DROy5mLPHjQJGHGSapoAcyB1dCbBG+CpXf9DGxYcx8fv+nYwXO?=
 =?us-ascii?Q?VF0t3czrLmemfBXT0p5JfinkkPf4h6DW41AgfR/T6Dq8DR5kKO4asIv+DlZm?=
 =?us-ascii?Q?qDkmHg4U6hsZO0Zqsb9Hf56n89imvuRLYBdp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6273.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6PFdJXXOG32kWDE/eLMceTOoBS7Kej/ZqxgivkEHmGC6Brb8XeHz2IosrYe?=
 =?us-ascii?Q?QtHS8t2IGW98Rr55IlTCtAwN56nKRGwNwgD9pQkqKGT6tFD0Tu8SATAPxNpZ?=
 =?us-ascii?Q?+kZuE6xQj7RpDwev9iQPrsECkrtnx5FTOAYD45oldhU8RhGAy4x+PArL9tWs?=
 =?us-ascii?Q?C7hnY3cJjQr1ixicqx5xbw4tTZNh7Fd3WsTNQLKK8JL20IYYKTDb8/cfL3LY?=
 =?us-ascii?Q?Hc/YCOFqbESYBFAz/6i/hL9TOBU/B1fhDJTRBG18e+QKvfN4BNKwvdMHrjS4?=
 =?us-ascii?Q?/QbUZ8z/U4D7AcGmKPb6y/M/+i6h64vquvgFhASZMzogd3msMk1qEpwDLjH1?=
 =?us-ascii?Q?qAUneRN2OWMWPmZWLGTV2/JFxVStwO6CKaxDC2RrYnMUk786bCgQWI/H07cD?=
 =?us-ascii?Q?bNYqlfjx6XqXy3ChSMXin02Pt4AtyN0CPI/XR/By7ws0S4Z7CDfI6ELnYMcc?=
 =?us-ascii?Q?pQq9OmRdfAyvZr7s2+0NoDCSDogBkwlKv4xkJIqZiesEUMVt1IgJWHXVUaVI?=
 =?us-ascii?Q?N/u5lEDGB70ZLzok2WoMnuOv2mEip4xdDKP9jtvhRYZZY6IQ1tfdL28UR8nS?=
 =?us-ascii?Q?IkIAfVvboV9N+LaKfADLa8mXd2g3qZ6BRuBD32YRy8RXr7GmvgF70P010DI6?=
 =?us-ascii?Q?ntLlfgOwt92deZGS5VNQzwX5BCZ1FGiNWsNDNEtmkw9vRbhI0k+/DYGlpmpx?=
 =?us-ascii?Q?nvFlRyb9vYD69VrPoZrudP9vN24Q9wK5ge14Xta/mV8IgRryPScf509B/jrU?=
 =?us-ascii?Q?wdVoJ4Qe4LkXiLFn8s4HeWNH/JYCVMFLHepBkQywhy7uKQxoU6F/3Brn+VFr?=
 =?us-ascii?Q?dudZa2wxrMu9fhjcgaVMQucMZumnuqHVaHgB5EFb3UQOM0QZ9w7t7vv7Gm6G?=
 =?us-ascii?Q?2yqQXfwmX4G6zFYtMy+p1FFqkKk6RnxEjaET+NLm7cbim4Gss9i/jEjQgi6U?=
 =?us-ascii?Q?/Oh2f/FatM06Tobf22EAfb5FHwjp41Dqma0/GS+wmgeCHrJvp7cbSeiAiFv5?=
 =?us-ascii?Q?jgpQDdi+kCeDEV2E4/g8vEbNqRqe+CW40TvBvDXo16d1DrE6ugYbVEkVJ4eI?=
 =?us-ascii?Q?gRn4ZFbChWp8vI1U2Xx0dJlQ6X7XBqxCQjDk77T82+ADXUW5U4mIy6/tiEwR?=
 =?us-ascii?Q?PU7GqTdIv5e7c0bB2Hvo3xvAsCkSpsOK1rLT+edQKsEh+iiGCBL919XDLKV7?=
 =?us-ascii?Q?oJAB540oL+YpUDynuyDfLKZc4xKxKx4SfKd4JCX8eAsjfAcRC3rWHDMi77kN?=
 =?us-ascii?Q?Mv6b9CgYjzC4pHL+c0YJpMXRn372fp5dZe4HufSO9blzqgxvl9fMeDPzEE8x?=
 =?us-ascii?Q?RT7PSB9ijhbZ5Rcy8Z7tSdvN+YPQLZMLHT0bEdlx+zqV0lLaRFwi/iCxNf6K?=
 =?us-ascii?Q?ZjxPdOpGP1fdxATLKD/xJzf0x/ESGJ/Xf7LjuUtIyrskUnRR91xFpjnwwy3S?=
 =?us-ascii?Q?kWcBIV6JPTASHqgqKeGxnkgoJ7/UW+VmNX/NC3dm2A9iQPRCHjQ/lEXXy0bL?=
 =?us-ascii?Q?AkOibvdy80Q2iHwE7q9oBbx6p4dpURhkEEM6eNz67RCPrgW9v2Ru0RWN9cdp?=
 =?us-ascii?Q?Vho0x1ByyVeUpt5su12ROrgTeGWgm3qvcYPvShkQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0887b132-5296-4a5a-8bf9-08dd91571173
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6273.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 13:15:30.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIhCUQtB07Uf+b6bZFRW5btu6v9meexg/jaNEjpLZJVgTbpKvvDdTwy+VVJ4Qq08bMyZlxC+0hw/Gby0FfohSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_061552_815381_E58FBDCB 
X-CRM114-Status: GOOD (  13.94  )
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

Follow JESD220G, support HID(Host Initiated Defragmentation)
through sysfs, the relevant sysfs nodes are as follows:
	1.hid_analysis_trigger
	2.hid_defrag_trigger
	3.hid_fragmented_size
	4.hid_defrag_size
	5.hid_progress_ratio
	6.hid_state
The detailed definition	of the six nodes can be	found in the sysfs
documentation.

HID's execution policy is given to user-space.

Changelog
===
v1 - > v2:
	1.Refactor the HID code according to Bart and Peter and
	Arvi's suggestions

v1
	https://lore.kernel.org/all/20250417125008.123-1-tanghuan@vivo.com/

Signed-off-by: Huan Tang <tanghuan@vivo.com>
Signed-off-by: Wenxing Cheng <wenxing.cheng@vivo.com>
---
 Documentation/ABI/testing/sysfs-driver-ufs |  83 +++++++++
 drivers/ufs/core/ufs-sysfs.c               | 195 +++++++++++++++++++++
 drivers/ufs/core/ufshcd.c                  |   4 +
 include/ufs/ufs.h                          |  25 +++
 4 files changed, 307 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index d4140dc6c5ba..8c4678305f94 100644
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@ -1685,3 +1685,86 @@ Description:
 		================  ========================================
 
 		The file is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_analysis_trigger
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_analysis_trigger
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		The host can enable or disable HID analysis operation.
+
+		=======  =========================================
+		disable   disable HID analysis operation
+		enable    enable HID analysis operation
+		=======  =========================================
+
+		The file is write only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_defrag_trigger
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_defrag_trigger
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		The host can enable or disable HID defragmentation operation.
+
+		=======  =========================================
+		disable   disable HID defragmentation operation
+		enable    enable HID defragmentation operation
+		=======  =========================================
+
+		The attribute is write only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_fragmented_size
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_fragmented_size
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		The total fragmented size in the device is reported through
+		this attribute.
+
+		The attribute is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_defrag_size
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_defrag_size
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		The host sets the size to be defragmented by an HID
+		defragmentation operation.
+
+		The attribute is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_progress_ratio
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_progress_ratio
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		Defragmentation progress is reported by this attribute,
+		indicateds the ratio of the completed defragmentation size
+		over the requested defragmentation size.
+
+		====  ============================================
+		1     1%
+		...
+		100   100%
+		====  ============================================
+
+		The attribute is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/ufs_hid/hid_state
+What:		/sys/bus/platform/devices/*.ufs/ufs_hid/hid_state
+Date:		April 2025
+Contact:	Huan Tang <tanghuan@vivo.com>
+Description:
+		The HID state is reported by this attribute.
+
+		====================   ===========================
+		idle			Idle(analysis required)
+		analysis_in_progress    Analysis in progress
+		defrag_required      	Defrag required
+		defrag_in_progress      Defrag in progress
+		defrag_completed      	Defrag completed
+		defrag_not_required     Defrag is not required
+		====================   ===========================
+
+		The attribute is read only.
diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index de8b6acd4058..e993468b6a4e 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -87,6 +87,26 @@ static const char *ufs_wb_resize_status_to_string(enum wb_resize_status status)
 	}
 }
 
+static const char *ufs_hid_state_to_string(enum ufs_hid_state state)
+{
+	switch (state) {
+	case HID_IDLE:
+		return "idle";
+	case ANALYSIS_IN_PROGRESS:
+		return "analysis_in_progress";
+	case DEFRAG_REQUIRED:
+		return "defrag_required";
+	case DEFRAG_IN_PROGRESS:
+		return "defrag_in_progress";
+	case DEFRAG_COMPLETED:
+		return "defrag_completed";
+	case DEFRAG_IS_NOT_REQUIRED:
+		return "defrag_not_required";
+	default:
+		return "unknown";
+	}
+}
+
 static const char *ufshcd_uic_link_state_to_string(
 			enum uic_link_state state)
 {
@@ -1780,6 +1800,167 @@ static const struct attribute_group *ufs_sysfs_groups[] = {
 	NULL,
 };
 
+static int hid_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
+			enum attr_idn idn, u32 *attr_val)
+{
+	int ret;
+
+	down(&hba->host_sem);
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		up(&hba->host_sem);
+		return -EBUSY;
+	}
+
+	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_query_attr(hba, opcode, idn, 0, 0, attr_val);
+	ufshcd_rpm_put_sync(hba);
+
+	up(&hba->host_sem);
+	return ret;
+}
+
+static const char * const hid_trigger_mode[] = {"disable", "enable"};
+
+static ssize_t hid_analysis_trigger_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	int mode;
+	int ret;
+
+	mode = sysfs_match_string(hid_trigger_mode, buf);
+	if (mode < 0)
+		return -EINVAL;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+			QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
+
+	return ret < 0 ? ret : count;
+}
+
+static DEVICE_ATTR_WO(hid_analysis_trigger);
+
+static ssize_t hid_defrag_trigger_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	int mode;
+	int ret;
+
+	mode = sysfs_match_string(hid_trigger_mode, buf);
+	if (mode < 0)
+		return -EINVAL;
+
+	if (mode)
+		mode = HID_ANALYSIS_AND_DEFRAG_ENABLE;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+			QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
+
+	return ret < 0 ? ret : count;
+}
+
+static DEVICE_ATTR_WO(hid_defrag_trigger);
+
+static ssize_t hid_fragmented_size_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			QUERY_ATTR_IDN_HID_AVAILABLE_SIZE, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static DEVICE_ATTR_RO(hid_fragmented_size);
+
+static ssize_t hid_defrag_size_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			QUERY_ATTR_IDN_HID_SIZE, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static ssize_t hid_defrag_size_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	if (kstrtou32(buf, 0, &value))
+		return -EINVAL;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+			QUERY_ATTR_IDN_HID_SIZE, &value);
+
+	return ret < 0 ? ret : count;
+}
+
+static DEVICE_ATTR_RW(hid_defrag_size);
+
+static ssize_t hid_progress_ratio_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			QUERY_ATTR_IDN_HID_PROGRESS_RATIO, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static DEVICE_ATTR_RO(hid_progress_ratio);
+
+static ssize_t hid_state_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+			QUERY_ATTR_IDN_HID_STATE, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", ufs_hid_state_to_string(value));
+}
+
+static DEVICE_ATTR_RO(hid_state);
+
+static struct attribute *ufs_sysfs_ufs_hid[] = {
+	&dev_attr_hid_analysis_trigger.attr,
+	&dev_attr_hid_defrag_trigger.attr,
+	&dev_attr_hid_fragmented_size.attr,
+	&dev_attr_hid_defrag_size.attr,
+	&dev_attr_hid_progress_ratio.attr,
+	&dev_attr_hid_state.attr,
+	NULL,
+};
+
+static const struct attribute_group ufs_sysfs_ufs_hid_group = {
+	.name = "ufs_hid",
+	.attrs = ufs_sysfs_ufs_hid,
+};
+
 #define UFS_LUN_DESC_PARAM(_pname, _puname, _duname, _size)		\
 static ssize_t _pname##_show(struct device *dev,			\
 	struct device_attribute *attr, char *buf)			\
@@ -1898,6 +2079,7 @@ const struct attribute_group ufs_sysfs_lun_attributes_group = {
 
 void ufs_sysfs_add_nodes(struct device *dev)
 {
+	struct ufs_hba *hba = dev_get_drvdata(dev);
 	int ret;
 
 	ret = sysfs_create_groups(&dev->kobj, ufs_sysfs_groups);
@@ -1905,9 +2087,22 @@ void ufs_sysfs_add_nodes(struct device *dev)
 		dev_err(dev,
 			"%s: sysfs groups creation failed (err = %d)\n",
 			__func__, ret);
+
+	if (hba->dev_info.hid_sup) {
+		ret = sysfs_create_group(&dev->kobj, &ufs_sysfs_ufs_hid_group);
+		if (ret)
+			dev_err(dev,
+				"%s: sysfs ufs_hid group creation failed (err = %d)\n",
+				__func__, ret);
+	}
 }
 
 void ufs_sysfs_remove_nodes(struct device *dev)
 {
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+
 	sysfs_remove_groups(&dev->kobj, ufs_sysfs_groups);
+
+	if (hba->dev_info.hid_sup)
+		sysfs_remove_group(&dev->kobj, &ufs_sysfs_ufs_hid_group);
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index dc55c94fa45e..fb67eb582826 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8392,6 +8392,10 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	dev_info->rtt_cap = desc_buf[DEVICE_DESC_PARAM_RTT_CAP];
 
+	dev_info->hid_sup = get_unaligned_be32(desc_buf +
+				DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP) &
+				UFS_DEV_HID_SUPPORT;
+
 	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
 
 	err = ufshcd_read_string_desc(hba, model_index,
diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
index c0c59a8f7256..e61caa40f7cd 100644
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@ -182,6 +182,11 @@ enum attr_idn {
 	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
 	QUERY_ATTR_IDN_TIMESTAMP		= 0x30,
 	QUERY_ATTR_IDN_DEV_LVL_EXCEPTION_ID     = 0x34,
+	QUERY_ATTR_IDN_HID_DEFRAG_OPERATION	= 0x35,
+	QUERY_ATTR_IDN_HID_AVAILABLE_SIZE	= 0x36,
+	QUERY_ATTR_IDN_HID_SIZE			= 0x37,
+	QUERY_ATTR_IDN_HID_PROGRESS_RATIO	= 0x38,
+	QUERY_ATTR_IDN_HID_STATE		= 0x39,
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_HINT	= 0x3C,
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_EN		= 0x3D,
 	QUERY_ATTR_IDN_WB_BUF_RESIZE_STATUS	= 0x3E,
@@ -401,6 +406,7 @@ enum {
 	UFS_DEV_HPB_SUPPORT		= BIT(7),
 	UFS_DEV_WRITE_BOOSTER_SUP	= BIT(8),
 	UFS_DEV_LVL_EXCEPTION_SUP       = BIT(12),
+	UFS_DEV_HID_SUPPORT		= BIT(13),
 };
 #define UFS_DEV_HPB_SUPPORT_VERSION		0x310
 
@@ -466,6 +472,23 @@ enum ufs_ref_clk_freq {
 	REF_CLK_FREQ_INVAL	= -1,
 };
 
+/* bDefragOperation attribute values */
+enum ufs_hid_defrag_operation {
+	HID_ANALYSIS_AND_DEFRAG_DISABLE	= 0,
+	HID_ANALYSIS_ENABLE		= 1,
+	HID_ANALYSIS_AND_DEFRAG_ENABLE	= 2,
+};
+
+/* bHIDState attribute values */
+enum ufs_hid_state {
+	HID_IDLE		= 0,
+	ANALYSIS_IN_PROGRESS	= 1,
+	DEFRAG_REQUIRED		= 2,
+	DEFRAG_IN_PROGRESS	= 3,
+	DEFRAG_COMPLETED	= 4,
+	DEFRAG_IS_NOT_REQUIRED	= 5,
+};
+
 /* bWriteBoosterBufferResizeEn attribute */
 enum wb_resize_en {
 	WB_RESIZE_EN_IDLE	= 0,
@@ -625,6 +648,8 @@ struct ufs_dev_info {
 	u32 rtc_update_period;
 
 	u8 rtt_cap; /* bDeviceRTTCap */
+
+	bool hid_sup;
 };
 
 /*
-- 
2.39.0


