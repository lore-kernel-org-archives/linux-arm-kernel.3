Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2333E63F02
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D+zbTEgpTS5UZZwzogOf7rstvVJhCWU92vys06J65A=; b=n8tCvDZ1wjgVPI2zpW2u0QgLNv
	8kkXv27CCDfD80HvmqfsPi3F3noaNrcijzxwNm+wMF7Fbyfb8UthrDsv9xZJsaZG/+r188o9rutRm
	28j3ZBR39wrosBWOoYqKd83fTrxMg7hHgHMRUYBDg+GwWi7NUTOSELmec3pjLEoqr4k22G9WH506q
	NCYsHCnrqh6IeMF35lucSBCKzK7Iw0yBrd7rWaf95o2k9dSE5CQBwx7v68xFFOgyGyu/FktWIeoVF
	nCZtZTe+yTSd69nEq6254Z5DJyTyl9GrM6iGj+X+gCFp0BF4NiHwTgDn8Q9M7Def8MuVIexiseFQr
	ZzdzTpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrf9d-00000005VmZ-0fR8;
	Sun, 15 Feb 2026 16:39:29 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrf9V-00000005VVA-0JLM;
	Sun, 15 Feb 2026 16:39:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKal6C3wLQbwth065WEvWjVUdnc9O1JxAuiNsr+kCbmoyK4km7xsDjX1NS2A9gzcavIG4d6kQ6gabAI9v+O2ARI/RFx1G1ctqfMkRLgyTojaciC5YUVavnyHPwpxm/FT6+QHWRdGL824ZP31awo6OrKE84FDyPybRvXt0/vSADOlfTeEicN9XxJfZ5UXihzaVVbXDsdjrrYOQQYI96kNmllWCU1GV6Us7WWK6jDBDiJoLR9Fiw1cUytrXNMUc6SqpR7j3ACHfednuZDZyGUPBx/492XDatynatdc5pS54VXT8gfdo/nTKAi9cEGztQM8oFYvlEofZmRTbbsqMOE7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D+zbTEgpTS5UZZwzogOf7rstvVJhCWU92vys06J65A=;
 b=uqPCZ+3TViInKxNV53o97J1CX39ZZwcfAc7NZ+lE4ZLOZzlBLUikUg1sRtCx1y5hhtyt9EGeg9Q4pRsQXG8yjEocqfWunbZsdozxc5dZ5VAfTPHpX+/CnzTwHFKjHyRuzJ/iLzgEFzO7zr7/1WZDF/Ff4aRS4quLxTCZ2LFIHRIjgpCiZpWCY+Ui5PtCgvAWObEP5ivV8bWEP81168TcWgOF4l9bgmeLoFPD+U/yEaox49eC+UMKS74cTb51zvnJpNlBwrvudfBEr/x/ymIKIV+h+kesmAPGGqdQ/fWyND1azRsuX9lfTLo7qNuZ2cKuno99kjp52C7ZY8p0EJEnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D+zbTEgpTS5UZZwzogOf7rstvVJhCWU92vys06J65A=;
 b=WZOFhmwvXxC3eclllp7unooNyT/5X5R983pK+mIh7W/3SJLrFKU7f9hftPQp7buPwurOJZ32fwuk3ll4DcyDx+Eu5/cF/K/NKzl4X738oHs9Sq0r6BXeoAwvKw8ICZv8z6+2zadv88IonfrkyDhfE/U72JQl5Q28Wf+B75Bg+uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5196.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Sun, 15 Feb
 2026 16:39:09 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9611.013; Sun, 15 Feb 2026
 16:39:09 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	heiko@sntech.de,
	kishon@kernel.org,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	cassel@kernel.org,
	shawn.lin@rock-chips.com,
	Frank.Li@nxp.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ntb@lists.linux.dev
Subject: [PATCH v7 9/9] PCI: endpoint: pci-ep-msi: Add embedded eDMA doorbell fallback
Date: Mon, 16 Feb 2026 01:38:47 +0900
Message-ID: <20260215163847.3522572-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215163847.3522572-1-den@valinux.co.jp>
References: <20260215163847.3522572-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: a78af44e-447d-4ce1-383d-08de6cb0be0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?srR/A+YLBEL6dfM+bKjdq1KPFwceVs/GVxy2FtpTanJrhrG3Q/9h6mlE95GR?=
 =?us-ascii?Q?swi2/47vn/cYKiW2HCI3iXc+qjzLNrOjQ/JnAjFM5SPTpFnK1mFqAjwC0tY+?=
 =?us-ascii?Q?nv7cS80FKWHof7Ktc7GGiQTfv1643PeSKT3yqt9+TE93FtS/ahUX2dBfTT5y?=
 =?us-ascii?Q?BN6BaQTlN3DUAi4KT523DP2f3AYF5Mk1mcCag+cYKrI9I7fiY6wzj9Brpnmz?=
 =?us-ascii?Q?j105SjrrB3seAWq/zc6PBfRbmoE8I6yhe9BJvO9q3MgmV78/jUrU2h23DM9k?=
 =?us-ascii?Q?W0gLXRZZf3l47zK4WF7OFDp6VI1UO1VRccc8GQAJv2G/Y04e+jj88GMMPt5o?=
 =?us-ascii?Q?lIM916Om2krgJAmRLVkRCLCaUX6D2JTutpd7rfAMZwAHtTnHjrd7JA1Y21RW?=
 =?us-ascii?Q?99AHxuDtreMe105Fyky5kftK1CuEtGPUNUNl+07UrQM+nIT1MQ8gHdxGLU5U?=
 =?us-ascii?Q?tK/+yFDiVEY/ZYOXkDHWZ7iH9UTA6oe0WZvEDPWPDZJIOpzCFHiH11589Z3R?=
 =?us-ascii?Q?P2gURIwa6O9iBr4kLuOqIu7h+er5eHSyxVVcYQIF43S/fUmX8hiwrgQgU3+Y?=
 =?us-ascii?Q?0SwGmbZ6/nTEsTy0EoomuesDxkraKcnTPEcRzuo9AmVrorKoyigIeIXbD4E1?=
 =?us-ascii?Q?5AMHDjenAiqeO6fnpcWlnSt6AYj9CJF92HCR5CR7UT53xem/mwlbHuRxxRm7?=
 =?us-ascii?Q?h2sPuAPMeydnXmW+5YWRKGA835d0X9XsHymYYBgFtFNhopq8YU4cwUlUG58H?=
 =?us-ascii?Q?bP8FOwTn7FN1eaeGeyN6kjYG/t6pCuIdQRUjBIM+EyqgHTU6g3MiOaPZONhO?=
 =?us-ascii?Q?Q+HTUBMCXTYG4/wukmQNlubnh9DnFmIDxcMHkk8yWrM5ZmHQ6EfJ7PnCZuZ0?=
 =?us-ascii?Q?1jPCWdGCfCVDRMZIW+kx2+SyuGXpPpa5zm68W3z6ORuGuiZc8zbv+PbIznGd?=
 =?us-ascii?Q?EP6/cbLXJDyoTHAiEw4bouZ0ZGTw9G8/T3TZd/EXfX/muOeiBwmbCpoxdk1u?=
 =?us-ascii?Q?oElLUb+nqngGTBvrg0gx7bMhNnNkRu233gIAy/JdyTNVGJlWiWcaqRR3Ou0q?=
 =?us-ascii?Q?ajpx3+DxJaxYUsDLAS+IWAIbZ3a7Mh6JGbi5XZQbYPYwfaNyAq0SBJzFZ4Yt?=
 =?us-ascii?Q?NytaLx8Ykx9xns0R4OEDbZja9wGwhTCdu4b0WTvksvvJP1yPfX6gHcCd0+8q?=
 =?us-ascii?Q?uYz13ASnnyn6IgXxwnz3CHvPT2jE8hoH6A1kkwy+alemk1QAHsR3B+gvs/qy?=
 =?us-ascii?Q?sPXxr7fmQ1rBB63av+bjPzBJiqYvDp4vVCXwiiYTd7R0Udl1RmTI0TcSW+nL?=
 =?us-ascii?Q?vvSulVuNUNqL0duCe8FiiY/ukKv3Bgm5usnNLeH1gf3nZpOb/9BuCG97lY29?=
 =?us-ascii?Q?v+8R5gldMuKuR/VdLVRGX+Lu0MqFbaMQGfBmgoq5iZgRFl9YGqM1lwNLQPqN?=
 =?us-ascii?Q?eqLqrnTNTyzmJx4GAoJ/y3YIM5ybE420hjqz1LACEPodT0jY2psZ3LHoAvpg?=
 =?us-ascii?Q?hr0yVa20kKEWVN3eVODg8HSzZKyJ+6kubsoshgicfyHPEq149fbcStbw6kcq?=
 =?us-ascii?Q?2JtyKfBm9YiDbk2WZ1lua3gJmUB02lirzmyJeaxjsAMndEFiUTaByxzASYzD?=
 =?us-ascii?Q?jA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MvX0mjQKhr9/jNYb0+txVA7Y3nZbJtfaPizUcG+Y5j8OAkN+XALPXoefro3n?=
 =?us-ascii?Q?pk4w3fUxj0Vaq5PPcvrbbl2mIKHVXwNkb7+9zMYtN1UmUReVh9UkH3XRzYTh?=
 =?us-ascii?Q?UFBERBytRiskZZ74fhnqiGgqJjBnNrFfcPy7JOobKSsTvlZ20Tw6WLz8PNsy?=
 =?us-ascii?Q?esyXHjWRFu1C6mg0SmlBXsz+CnjMf7Yr+W5ga8aJOB/1Yn6FxRN2g6Itnz7N?=
 =?us-ascii?Q?Pv7gnZi/+q5NsLQbG2mEPeDQKWGHVmAPtk7PTYxfds9a1ZGQssk0nI5wEGer?=
 =?us-ascii?Q?OYD+UwfVI9HuqyHO1qylhoXZipQduxG6lkNkxGP+xqWNTFKuvnFi+kZWKSQH?=
 =?us-ascii?Q?exO1TP8YFPXSvf5oxPfxEjViU526Y1BkIjmMWzkGwxfdCRqz3HeAG/dA1jhC?=
 =?us-ascii?Q?43fW7NNQzkamA/o+hTxmOvYYHmgMnvhv2EGtE6/0Eqav8R8FFq/7y3TdAJPh?=
 =?us-ascii?Q?Zcw0rzWO53RhUJYRfncQ51UtSe0XwB9sQc7nOm5hbYYVt0I/mOOOgrg+2I2p?=
 =?us-ascii?Q?7gELFcGAgxnd+7X+TYtapeScCeyCR3yJ/REsRwLHrqRI5DpALVoZYW2avfZv?=
 =?us-ascii?Q?j5CYnaPKPw/hRh37fNm/itKj3Rr9TDrU/kcoaR9IWEa/FjXdX9gvL8gQW/fw?=
 =?us-ascii?Q?YzvCvYy7jCSrzVDYW4g9RqZvD/HXD84ZeRJMfrZp+KyoSYW2RpTkTCwdnuyT?=
 =?us-ascii?Q?T16T7WopEpVeM7UvpY23yFK9ynCXe05tK335oybaLcFNoEHvkmdqpcNCDCE+?=
 =?us-ascii?Q?vxWoac8jFawb4RBxDgBuIRuo8hPJPAvDIuSiehajkg5eB7s1MKbsTr+RWTzT?=
 =?us-ascii?Q?mNoy4FJbPJXnp1zLw6FGnDoCEkdVFpqBIv5EqTxULzut+ulPhraE89U6oVqG?=
 =?us-ascii?Q?upyLlor9IH/zXpCH8wS1DZnN9iPHuxc9AoKSqK3Wv3xW3NNOLJ8sRR7tOHbI?=
 =?us-ascii?Q?0+k0+3twPP773lM6IdPySoc0bmAcNIOJrlVX1sNX0xoYvJwo9EVxvIpqou+N?=
 =?us-ascii?Q?sD8DtVWK7WQ8HHVNOXN6sH+vT4YL+SulWOp+Nvi7CpVnwf+JrQqu1Tkp240m?=
 =?us-ascii?Q?+pzytQX+Icp9FS0QGLcr26XVvUrJj48C+d785KWu4I3VEHI1RxJW3oWRs+X2?=
 =?us-ascii?Q?PWYHSe1oPY4rfzWBJ9y0n6X9Fl2tjR7ohe7qghJVGVPv+8caBsnwJJhaQu2n?=
 =?us-ascii?Q?+dhuuSZpQjW1up5k91JqcDBiOfPWiVHfQukm8R81lsb+3eFig1EoJ1vNvuKT?=
 =?us-ascii?Q?nwcRGKE+ZUWHdfWOhN++2Zfuta7XHMx00X96dK1EDzoK7gK43yCSpbffNFWO?=
 =?us-ascii?Q?HtNDvBEvo79J12IA86pVSt5g1s13rokYRdhXVaDHfWILpL8mqW6tkLQT82oF?=
 =?us-ascii?Q?en44uR1f/OwCxBEOInUg/7NUVv2SjNFMIdRu0CFbE+Y+NQlbTzW/JGHQMRTX?=
 =?us-ascii?Q?kR0ffByoD6uCirb6EwhwGxZWNjd9uYwIg9volgRGHo7kC6eJsjMkzu8lpBb6?=
 =?us-ascii?Q?w/iCfoOZmVoTYiJpbTTyafM/K0rxSDajMjNN021SSSCnAjHp8TY8iGzWQazG?=
 =?us-ascii?Q?xVNlJlWIWc9nacKlTvZZE44KCinC7mCnjiGOPHMNHc1l2VeIa2v94ZjWNCqA?=
 =?us-ascii?Q?fAlq7C0req34PFR7TrxMcLpwtVL+hCn3UyWMOdvSju/W6+WDZaOGCubIdUW0?=
 =?us-ascii?Q?/j4A3HeZa6ockKKw76fJy29vfHywzOw0/ttA8MIAjcskYDwDGV3t6D1Tx6OR?=
 =?us-ascii?Q?rRSvKK1iv/Q03Hd90WiVJ1H2+bDw+RpaQd6aMFAY97tyAgYwPSTM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a78af44e-447d-4ce1-383d-08de6cb0be0e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 16:39:09.2379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTYq4Iivc/zW1APdbFHkpBWVlAXSO6i+Rad8ivWWDj/DOzmUEkj9aTB2gxCtB3WpRvwcHXRdwpkVLhIlJGi+pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_083921_154407_3D418D22 
X-CRM114-Status: GOOD (  17.70  )
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

Some endpoint platforms cannot use platform MSI / GIC ITS to implement
EP-side doorbells. In those cases, EPF drivers cannot provide an
interrupt-driven doorbell and often fall back to polling.

Add an "embedded" doorbell backend that uses a controller-integrated
doorbell target (e.g. DesignWare integrated eDMA interrupt-emulation
doorbell).

The backend locates the doorbell register and a corresponding Linux IRQ
via the EPC aux-resource API. If the doorbell register is already
exposed via a fixed BAR mapping, provide BAR+offset. Otherwise provide
the physical address so EPF drivers can map it into BAR space.

When MSI doorbell allocation fails with -ENODEV,
pci_epf_alloc_doorbell() falls back to this embedded backend.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-ep-msi.c | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
index a42f69ad24ad..6e1524c2d891 100644
--- a/drivers/pci/endpoint/pci-ep-msi.c
+++ b/drivers/pci/endpoint/pci-ep-msi.c
@@ -6,6 +6,7 @@
  * Author: Frank Li <Frank.Li@nxp.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
@@ -36,6 +37,82 @@ static void pci_epf_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	pci_epc_put(epc);
 }
 
+static int pci_epf_alloc_doorbell_embedded(struct pci_epf *epf, u16 num_db)
+{
+	const struct pci_epc_aux_resource *doorbell = NULL;
+	struct pci_epf_doorbell_msg *msg;
+	struct pci_epc *epc = epf->epc;
+	struct device *dev = &epf->dev;
+	int count, ret, i;
+	u64 addr;
+
+	count = pci_epc_get_aux_resources(epc, epf->func_no, epf->vfunc_no,
+					  NULL, 0);
+	if (count == -EOPNOTSUPP || count == 0)
+		return -ENODEV;
+	if (count < 0)
+		return count;
+
+	struct pci_epc_aux_resource *res __free(kfree) =
+				kcalloc(count, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	ret = pci_epc_get_aux_resources(epc, epf->func_no, epf->vfunc_no,
+					res, count);
+	if (ret == -EOPNOTSUPP || ret == 0)
+		return -ENODEV;
+	if (ret < 0)
+		return ret;
+
+	count = ret;
+
+	for (i = 0; i < count; i++) {
+		if (res[i].type == PCI_EPC_AUX_DOORBELL_MMIO) {
+			if (doorbell) {
+				dev_warn(dev,
+					 "Duplicate DOORBELL_MMIO resource found\n");
+				continue;
+			}
+			doorbell = &res[i];
+		}
+	}
+	if (!doorbell)
+		return -ENODEV;
+
+	msg = kcalloc(num_db, sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	addr = doorbell->phys_addr;
+
+	/*
+	 * Embedded doorbell backends (e.g. DesignWare eDMA interrupt emulation)
+	 * typically provide a single IRQ and do not offer per-doorbell
+	 * distinguishable address/data pairs. The EPC aux resource therefore
+	 * exposes one DOORBELL_MMIO entry (u.db_mmio.irq).
+	 *
+	 * Still, pci_epf_alloc_doorbell() allows requesting multiple doorbells.
+	 * For such backends we replicate the same address/data for each entry
+	 * and mark the IRQ as shared (IRQF_SHARED). Consumers must treat them
+	 * as equivalent "kick" doorbells.
+	 */
+	for (i = 0; i < num_db; i++) {
+		msg[i].msg.address_lo = (u32)addr;
+		msg[i].msg.address_hi = (u32)(addr >> 32);
+		msg[i].msg.data = 0;
+		msg[i].virq = doorbell->u.db_mmio.irq;
+		msg[i].irq_flags = IRQF_SHARED;
+		msg[i].type = PCI_EPF_DOORBELL_EMBEDDED;
+		msg[i].bar = doorbell->bar;
+		msg[i].offset = (doorbell->bar == NO_BAR) ? 0 : doorbell->bar_offset;
+	}
+
+	epf->num_db = num_db;
+	epf->db_msg = msg;
+	return 0;
+}
+
 static int pci_epf_alloc_doorbell_msi(struct pci_epf *epf, u16 num_db)
 {
 	struct pci_epf_doorbell_msg *msg;
@@ -110,6 +187,19 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
 	if (!ret)
 		return 0;
 
+	/*
+	 * Fall back to embedded doorbell only when platform MSI is unavailable
+	 * for this EPC.
+	 */
+	if (ret != -ENODEV)
+		return ret;
+
+	ret = pci_epf_alloc_doorbell_embedded(epf, num_db);
+	if (!ret) {
+		dev_info(dev, "Using embedded (DMA) doorbell fallback\n");
+		return 0;
+	}
+
 	dev_err(dev, "Failed to allocate doorbell: %d\n", ret);
 	return ret;
 }
-- 
2.51.0


