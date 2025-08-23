Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA015CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxA3luhurcUVWkvkZ1vzrdADucUwQFAQPFRLCVSHP1g=; b=GZdxjUvQbzbxiqndguNE6zJM6v
	clRuiUosPyEv3cul7UJCYVSFpsPUUk52C1gbq3j62g6yq/sX9BU2OCkQVLyGliljxa/u27RRAGhOq
	llAZ6tS0lw3rLCvUYNGv7SDg5PMoY/ZptqbmRoTt/5yKcorhJ5XKtPzlidFaUHr4ssZcC7lvlYmnS
	Xw7VaGhRlDxM1UnuCdaK1WDXDQFfbniQ7F3dDjg57b5nwTfWU1FyRizF3D1UYIlDxN10j4c/7TeEb
	RcjJlrsDmEJuazRHdul+9FRUtkWkiJuT6f0psuQiVmJf/Tfh7/CsgDGmfzdllTCXdC9/HurUWwRCo
	yHsgMymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploc-00000004fB4-0FQ1;
	Sat, 23 Aug 2025 10:49:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upbwD-00000003h5u-2Clx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 00:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifzF//9peuV4H66IDCVUWccUCcZQ6IgzXQyX4A7LbJDcFMgf2FwFof+cqfqgbQE8nFI8L4itYZYEFUjdFNopsmdytZjFbDozBeVpjbbPgMiaMDH8TGSBbNcwEJdYWHpWq7dqj8IcUotTvqLvGcUJmaadjSra+U84OLhU7oslTgJm/Z8dux9hU+1Xxnrlwc5Tn2QbekVdPTk8HSKAt/y5L095ztJXP7wb0LbkXaEPkZHAkLS0LiAPWkz+4THu8k1bC/kMhmFmyoyEl9L6mfkqekU+syvgBgG7LQhKUP6k5Ot+8Gu6oIho/YUL/1cXHhCVKJTwe8u846I1rXs58wqDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxA3luhurcUVWkvkZ1vzrdADucUwQFAQPFRLCVSHP1g=;
 b=KrDvQcXYZMu70CBCRoeyIAD4V3SR05zYcvs7S1NZVleUxdWzm13MUWduaWAeVMSQ3BFIpzv+C0t0v4kVdd5UcmLtxUz4poW3YvcMnBUzYL51PCplo5mTUfQYTHCpuzP3fIJuy+1ccLp436rAfUEX6F+C3joSHBnfwbjNOs9PBpTRJFqoae1MPW7cCdIHnKyVwwtiRGav/s+6NDKU+S7kNp/Y0CFCqlN90IXepoBavRc4bHWcgXIo8A+OgLFlANhR0eyoEMuFoT1LCdBbjg19KQM9F6NNRMAFuC7+1PWAqfKrhetHyXldqHp4DvKTUZpWL0spmDV+hAtwbiPkAT8lOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxA3luhurcUVWkvkZ1vzrdADucUwQFAQPFRLCVSHP1g=;
 b=l4XCrIvjB/nmZfTcGxd8BZmgTFLqSk11xhGJfUv5UKqUWniDABUrAVI6teW78/P9NBcr86Z53gSssPgmNzyBcwCd2XKH7Bw4/OmZJ1iFDTTOlBeqZBcoBJa1fXN8QcbWXYNm4YjqNBfCMVskicFP5g/UOYWaEvYb9rsCkply/ICinL8x1BjMOoJJZPqnB2SOadAXN9/SGIYz4nguHuupYJJv6/6UCNLpD0aHUreRb76o3+LZ1MPzXVB/WMX5SSA+tzBeGTar9uIK65oUimto9Fw/PWl87t/TJfRE73IC0P5brOJq+vfncljSfp/x/qIDDQa7c4lz30humFEFzaZkkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6398.eurprd08.prod.outlook.com (2603:10a6:102:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sat, 23 Aug
 2025 00:16:38 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 00:16:38 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 05/13] spi: airoha: unify dirmap read/write code
Date: Sat, 23 Aug 2025 03:16:17 +0300
Message-ID: <20250823001626.3641935-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::8) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAXPR08MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5a3da2-bd01-42dd-c304-08dde1da540a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uHUGa6up5gfU+jNK2AvmDYck0ImpWun9VTVoMFXR5k/7B+C3JuLodHbE6H+X?=
 =?us-ascii?Q?kf5t0j6g+X4gjxN5nDERDct7ElwY5fmRvWPcNURRNRvcg/3qKtPcEyCFLqNI?=
 =?us-ascii?Q?BeWQOdD82rznAjVm08BQIVMmklWsNi3pipzRLnMXCCyrhE9v7WzCCl5mRhxf?=
 =?us-ascii?Q?hbWU45LrKlkDk8cujllEa6oIKYbFjxB1mBPfXirj1lOEU8RhT9jjdfFy9FZF?=
 =?us-ascii?Q?pKmEfUpiA9DhkO7Yy2F+RnMUWayUgL431HLbaRE1LC81XqQvGQ89ruBw1LM0?=
 =?us-ascii?Q?6jl4p9itJ6LqLE0UciMIQrxJxw8ss1I/D5ZHrMptWElgRw9FLimy7TzrY9X5?=
 =?us-ascii?Q?YU1qttVE9kjfm+k9uvAog6FmTxSvhhNsztt28eOaoLnHlhslUNY+/qMLP4NO?=
 =?us-ascii?Q?vslzP7Am5UuQHmUrW+Wy2Kp7KCGOzxTxatglxgnJo8JcRYdJ6bFCUaM7mMeA?=
 =?us-ascii?Q?kfYYfrHorP54EW0ZnuM/KpgyO5zg88SE6Pq651dPyTulTaa6rQi6T12ZTDt4?=
 =?us-ascii?Q?LVOrc4oS4uJc2jUZYWQT6mGd/DrW9g7KC8uqJcIGvMubNE2Nlp3SnL7xIia3?=
 =?us-ascii?Q?NupkzdZ+Fwp7F79aHBtDw6ZW30L2/B1gcKLbS3iCdvxyRhICdmVuPGxFQsMT?=
 =?us-ascii?Q?iuJJ3//UxMohr7IugvpJiiLXBsblbRT7dixpXKIG9jj/Q85eLw0PK1rumw0X?=
 =?us-ascii?Q?4/HxZPcnX9y+zf0wfplrnabBb2Pwe7mmEzwXyuCUGKiD3jbhuJ6wS9fpF65t?=
 =?us-ascii?Q?hDLkFsTNQz9O8BP49bZ/kTpseJUuBzzKy6K3N6mMkrEw4A14hfSoA5JlXOPZ?=
 =?us-ascii?Q?Gq9KQ5PUamAmPg6675dsP3UxMFN79JgYrA0RHIEnPy32L9Z9AO8sTJkAIc5d?=
 =?us-ascii?Q?cplX0Hh//26L+/bWqcv89aL04oaWDsaA7DVKzIYYZpoPcs8GbPcHR3Dz4cYD?=
 =?us-ascii?Q?71xwDQKJS5dW5jSLsmfhPtBeIyp39WhEOn8lsJXc7rq3DQrzC/DZIRPZvnHN?=
 =?us-ascii?Q?p0H5ZjBhy/A2NSnYY8KvyoF/2QrAVpdspFtmJXWXmzZA5+Rm+9j0z0rznGjB?=
 =?us-ascii?Q?0tFJTIASix1lc9G6+BomwtM5xupjGl8YDOW/idne2hHgwuVmu8VUt4fnoGkL?=
 =?us-ascii?Q?lwsVE3yvXCs8L3FUApLq5e5N1PyBxUGkO+jqbS8qyI/mI+NvK5MouE6B+dCP?=
 =?us-ascii?Q?IUoEr5hMW/lAk5ex07bLgYPVoOFnbfikxzbpQmQPNe3w2pnqaRe8OxY7vIsa?=
 =?us-ascii?Q?impL8RmjGhzsWgoeEAqXlpMp+BRxLeaHtDzLOfhVCSTDo7RtpatvVvjQTw7D?=
 =?us-ascii?Q?BdJDuVZ9MC5K6pnKPRcq98wN95K7PpFkQ3MeacKBRo8ITdFrY0F1GRqQhGYV?=
 =?us-ascii?Q?wHsi8JIgJTfaNkeuwftqb8upFjiV+9G1sRHGQPbOnBwv35mxeBB0JOX7KtUw?=
 =?us-ascii?Q?E0Tm56IQbH9lOSxrrz2jYAEI1urfP/r9VOlF0YXTFb4ZOlao3mEyhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Z9AkWgKXrd6BNC3uAGEIWPWfGxveYNiqtjjIHBzRlzz1N7S7xeKe9k5Ersx?=
 =?us-ascii?Q?9AXYu9Zh5J9+j58jmq5R/CTOHX85CA4rdSCvtpv5NumPfZtKGhqI+Wlp2Way?=
 =?us-ascii?Q?Agmh8a2S0dflTgoW2HSkl275/NLTnh18sQwRz7KC6YrFuUpO+nEu+wuC9Sxp?=
 =?us-ascii?Q?E6eVm6x1BRGrsze0ht0vHrTLJCuhHritHSEFRl2bnFzYUnWJLFCpSK5PLmZN?=
 =?us-ascii?Q?efDHU4bstH2cAmcXfqrRsHBzyJEQYjBTbdg3oIcSyNV93Q6enQdMWIBl/sik?=
 =?us-ascii?Q?t4znZBVNv3zg6CmtrGtZwPQT5AS7/E9ICG02DXAwF2wRe1qSP+qtelGWKjeL?=
 =?us-ascii?Q?Q3SRRNmJeWdaoMtTsCZxDYlTrHeUFkKSHp8lyxHXM0XH6L/V+fV0a0aoXTfi?=
 =?us-ascii?Q?h3vkwugAmA7pWcNieD/LJNRl3M2ufSxVA3EMVXstloruO6UiEHTBCvVLcjhg?=
 =?us-ascii?Q?jWXWUKdmABLqArRBZ698rTrGjEqCYkitcGy+KhuVOFrUWTHQqZkRogLEThiV?=
 =?us-ascii?Q?j8sQumjhpx4nG/47PKXh2pwQgHdiSK6fifj0wyFNs00kHVoCmt5H01lDViFF?=
 =?us-ascii?Q?k4bBCooAJIYjGOapvB9HcXBuKMQrn8/68v84+73DMaYPYigLW+aFA+V18h5g?=
 =?us-ascii?Q?cUz04FPQT/b1W4cCIpUplIHXN7hiIqh0eDSceLbm5cBR9I8bRk9dwMs2rzmu?=
 =?us-ascii?Q?Hpoz4uTfFgQf66TiuAqZHzH8uF+gjAcYcd52V/tLDAZDG0sEIskBpB4s0IR1?=
 =?us-ascii?Q?0aK+hkrf0iGn75eZ80IOyo4QSXO5EqwTqteypeKAzpWDcTigewWiI8fmhH2z?=
 =?us-ascii?Q?7TUyFEof06WvNsP4JinwbxlT7AjVOuB443/Fp7HPjwZZ5m4AezjDh4ge38BZ?=
 =?us-ascii?Q?qkGj93lzZy4yQ+R4yhsjbfKM7vZC/q0L7x/SB8cKJrFcVne4GOZCvidOLUgB?=
 =?us-ascii?Q?pFv1J7khyv0s8kCL8lxY2EM9/BeoHmc4WNH70zZj45Zmy9/pqmVAwT9MNZo1?=
 =?us-ascii?Q?TVtD9Dq28Qx5o9mNNuNfju+iDg4R1W2AHecjD+v41F4EKnI0NMfrCtZLj9Dl?=
 =?us-ascii?Q?r/ondmv7+y3tpad7fDgdwaDieaPW3JvfI/cgrXlT8AhxE565JYrtGwUu5gMu?=
 =?us-ascii?Q?xpdIfJrTaDSEY9b94qCj0w75ga2UiG9Zrq+ejSNiSybFSLT4bhBXwOIGlBkv?=
 =?us-ascii?Q?dWxyxfQIQ0GEpAs7FO9DrpJ4T7WB/1VEcpG63OQF9MdOcjv/nm+SUZt2E95X?=
 =?us-ascii?Q?mIWSWTgu7dqi2j3sy3JeGEAerCqeXYkQl3gVQwxaJ8CL8KiLKG9e3uB8bLLH?=
 =?us-ascii?Q?xHJkjLGXCg4AXC3wzLh9biwTLu2WE9xPTFIf4/zH0nVUbEBRGJtFHWFacl9C?=
 =?us-ascii?Q?lBbiuIRhkJ32pHXQIqfoJ1cT4Mw/C3eCa+ieHjiixCgvhEYerwoTq5g5MYar?=
 =?us-ascii?Q?20yrF5OGqkolYhy6fK9g1XlzaxxD7kkxQ7lhd/QBk2y4vvNcR7cL3LcB05UN?=
 =?us-ascii?Q?UqXkTGGapYezaWYO46qS7dkjrFLbrjZly0HKkUvm+Zz9O8IlJnTtl6zZuBCJ?=
 =?us-ascii?Q?GyoGcSDbaRI444l2/tRYJTmytnvkz+s2AGpLi1bdUtfzgR+4HDrhp8OXDZJs?=
 =?us-ascii?Q?ABil2km8IWiraik/RfkK/mk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5a3da2-bd01-42dd-c304-08dde1da540a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 00:16:38.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN7xkqqK33KexdtTESZA+Wv+aZ4VVWL7SL0yfYiD/WZGFgKwROogasVb9bgACd6SHewQNP/Fa/YI5JQujbgE8LAgyzODuvzE+c3psPcGR/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_171653_573130_8527C75C 
X-CRM114-Status: GOOD (  12.99  )
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

Makes dirmap writing looks similar to dirmap reading. Just a minor
refactoring, no behavior change is expected.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 49 ++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 1ebf7def7ba7..ce4026611e26 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -672,6 +672,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 val, rd_mode;
 	int err;
 
+	as_ctrl = spi_controller_get_devdata(spi->controller);
+
 	switch (op->cmd.opcode) {
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
 		rd_mode = 1;
@@ -684,7 +686,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		break;
 	}
 
-	as_ctrl = spi_controller_get_devdata(spi->controller);
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
 		return err;
@@ -747,7 +748,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* trigger dma start read */
+	/* trigger dma reading */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_RD_TRIG);
 	if (err)
@@ -803,37 +804,47 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 					 u64 offs, size_t len, const void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
-	u32 wr_mode, val;
+	u32 wr_mode, val, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDOM_SINGLE:
+		wr_mode = 0;
+		break;
+	case SPI_NAND_OP_PROGRAM_LOAD_QUAD:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD:
+		wr_mode = 2;
+		break;
+	default:
+		/* unknown opcode */
+		return -EOPNOTSUPP;
+	}
+
 	memcpy(txrx_buf + offs, buf, len);
-	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(as_ctrl->dev, dma_addr);
-	if (err)
-		return err;
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-		goto error_dma_unmap;
+		return err;
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		goto error_dma_unmap;
+		return err;
 
-	if (op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_QUAD ||
-	    op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD)
-		wr_mode = BIT(1);
-	else
-		wr_mode = 0;
+	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
+				  DMA_TO_DEVICE);
+	err = dma_mapping_error(as_ctrl->dev, dma_addr);
+	if (err)
+		return err;
 
+	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
 	if (err)
@@ -847,12 +858,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write command */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL1,
-			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD,
-				      op->cmd.opcode));
+			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write mode */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_SNF_MISC_CTL,
 			   FIELD_PREP(SPI_NFI_DATA_READ_WR_MODE, wr_mode));
 	if (err)
@@ -882,6 +894,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* trigger dma writing */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_WR_TRIG);
 	if (err)
-- 
2.50.1


