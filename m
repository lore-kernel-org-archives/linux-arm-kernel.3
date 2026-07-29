Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E6EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gsasmbp0e7Rsv8S5FAS0ots0cPKU2zruq7kflrsHZ3E=; b=ay5ypEECRgH7wKzuWEKurOj7VX
	4J0QRMaeID/fOKtPTLhN9FhXaYD0GUr/boA2LpfABCnrfbGAl8xcY/xp9+V7rohK1rvB/MVmuv3lw
	yFqdmDdDhahgRe+6O214EJ9Rty+ggFMcLdyQ1Q4bhU5Fb5z3iF7i9+hfjaxNkNvPYiuqWag212qni
	YZh1g0uQEHAP5mfvgqebxS0m1vNquuSV7vynFkghc6vjwsuldbasy52769ExxolM3yHkaNGPXXjDZ
	zK+qGxSRUTMcnEaI5mLBaDNeXRECI74ffQxCjqoK0l/e+c0ctr3giz0ameWACP9eNggz5ey8oFkxN
	Cg9cDmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2U7-00000007iwE-2ET4;
	Wed, 29 Jul 2026 11:30:03 +0000
Received: from mail-northeuropeazon11012054.outbound.protection.outlook.com ([52.101.66.54] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2U5-00000007ivD-2IJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+k00qnaeY0G5S4Mk/Jpe7ulT1fIPPxingxaGAmk10IPnDu3u/LnD0gyq0f+QLRCzYzHlwiymlNALCikb+Efzb1nNs35qRr1LCorqVpCakydy+wB/xqs7pxxL6wznBrnkYBrXBAyQLWBBtAjHCHD/cCEmIPA1nr4tVMDG5XKsU1aKX2cNtLawQIgXmnsye7mAIHTJkvEzg2md6V5EQoVLtzSLaJbOLk/+lvlOBYRlWTFCHy1iykL9n5a6LlmmSXmuUSlAtJspr6qDe5BRmw3y1qGT6xs7ePm1tsLVvwVssBKl/r1f2wt/+bvf4B3EssSlZvWfdy5QuP9m/i7nLjLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsasmbp0e7Rsv8S5FAS0ots0cPKU2zruq7kflrsHZ3E=;
 b=WMuGY2tVNtTzjS3RYO9B6tzl56uXDJxjVz5mGPJoO9RcI/oNcrBKoCu/rJmfS+OkIthskvFMYKKpELSXb5hl7i2YI5BOGVTTnGzN3vWxP+1sAVp4azkYjrYKe2SIUK2t+N/1csrB6ZSddTavWNsrTaw6oJS2KW/AqjBU9eOXgt24n4OjT3t38Q3V37hbPFWwRyS+o2tRGVita/wJM/3NQFLt0CFTFQ6ZZqP+nU39F5tkPUERdeEUFs6JfJ4sx9ks471fbr9v7K//DB/V8hv0pUkTPLXzXDlyd1Ey+aVM/Am1mvIeXhoMXZLZEsJgImPU3urI6pqdx4NHgKya2TqLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gsasmbp0e7Rsv8S5FAS0ots0cPKU2zruq7kflrsHZ3E=;
 b=l4GAjyYME58tqKPh/TZSp+p9UjxTAS12ywRU9TO/MLg1BB3luadDp0fbYworHrXloy2UdZtVevwbq7bLbQ/I4j7zvfV953OyZMK6kZLqEDC9T2H2EqfykMy2BNty6/ggXiE9MLwvttup8MzRV05So7aHxHu79UP4yPUvVUHDZNPg7JmmC3kNC6NTHHkadpXWAhQ0OsJ8EIui0JkYKORk7RZDda03IKrj14MaDlEEZQ7WSf3V9zrqkBp8WYxs4eWNKGcNvLYIdHCv7+tKuXobUC5ntSpRPik2JLFYz/RO4fSHXxuSOi+b7tEKHudiQM08lj1ici4m00YwQIzQlOCJeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by VI0PR04MB10544.eurprd04.prod.outlook.com
 (2603:10a6:800:26c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:29:56 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 11:29:56 +0000
Date: Wed, 29 Jul 2026 14:29:52 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Guanhua Gao <guanhua.gao@nxp.com>, 
	Roy Pledge <Roy.Pledge@nxp.com>
Subject: Re: [PATCH v3] soc: fsl: fix kernel-doc warnings and typos
Message-ID: <wzbqqb5szbgbujwjsb2qfhhpy5mcp276bauj4j6h4irabvdeoa@zscbuxq6yuxu>
References: <20260728004924.904210-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728004924.904210-1-rdunlap@infradead.org>
X-ClientProxiedBy: FR4P281CA0300.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::11) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|VI0PR04MB10544:EE_
X-MS-Office365-Filtering-Correlation-Id: 51757a1a-155e-41bb-9633-08deed64b793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zGrGjBRHLeJr6FUM929nI945I+hNJwxyITO7MxnGMvxy7S92pPTqNP8SsHNoBYUtWGX0hHK2qvNMNR6c/v0npvLBFUFvo1/bI4ovqEMrBbyC4x0c5VpxzfxraHt6/VYTWYD0Li1R1LBa6LxI/JJxkrvCkPV229zxkRtbS5Ou6o+8Q8kxRjphDtHsg1MaLosu44n6v2Jghyk5fKkClU8HRBRAVDrJjvqJRjRKE9wpaqAOCzLI/cfx4PlKgND5l7YDnskGjGY7JzXTZ5Rl6zhsxFFVidXOxxi+5yOuZa1WNgEwxCAXqGMl05qLu8mz/wE6IIxCJ1ZTo1wAgQ9QPQK9Fe0zIR+0nMf09VJrqmumD0VN/kgokFsK6uHvOxZJH04jA1Ayck0r+gqiJNKcn3qFLZvWUoV7b7vY5aJ+kMaIFwW/oyDa1s8LYUSKYT44i1u6rCxYXQE6QVLnW7h98RjNuzIpL24Ac59lA8VDzKhLrGthTlzwPhJFqryL2T8yB1cw5FjQ46ZHdZTLukSORY+vk1PTgxR1U1Kn4qAZFRBDjVDwfvcfGO7bxtgBN34YQogKoMteQvCZ+sFw8HhE+jM//LeAS/3acZyT1NtN8uaxoua0e3ZPKRJXyKINTf9I1bPW1EBT0Yglxrq0S6W+j4QvMIMugedKxNshHqDVayQ6hy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t/U7qrovKy0TIAQDNkcmIPRDm2NgvqbkyZy4MDYVcDlRkK6UXOU4p9U1sVwT?=
 =?us-ascii?Q?yvunhtPO+X8xFtlP+asyfQbWA3m9EMyE0d7P0EVwkw2y2hXcXbvXFZGx/6a7?=
 =?us-ascii?Q?NVps1sfqnxq7E/4y2HIkuuivc7aypL3QKA6pXZwLVerM+fhy6RsSR8iojTp9?=
 =?us-ascii?Q?+8LX23KRp0k6+00CM/LoX2+nlebJ+pz82fgLKVwAlEqQ/Hh1Bu1LWCNmU9CV?=
 =?us-ascii?Q?ehFIt4vvT2gIu6Pe8PRBVasz7IQxkId3++KVdfnvb/AzRhsMbx96kcqaLTQm?=
 =?us-ascii?Q?/Csa5JQsJX3mugufd7J2QDGNjZCSsHSAUF1xLmWYw4T64FpN5TToscARIcfS?=
 =?us-ascii?Q?ltK9CXkMOGN7ZB9Y00ymu0ESVLHkPxyRTYjtsf/UIFAKQKakucO85UHSDT78?=
 =?us-ascii?Q?NRwCG+qWGp1i9Vn/BIUvBfBZhMr9Z7Bpmv+sJ8zjcwYY8fTvPxH6Zyyxtqcq?=
 =?us-ascii?Q?Aaede2TlTLymUdoyJfTkBjbETXSnelCrNO8sTIRvCYTAinnUIuoKoy/6ANWH?=
 =?us-ascii?Q?MwwTrLq34txzgzOgd8JbykZG4DIGiNNlmSDE8B9WfrGyotS4j8eBtulKYT6H?=
 =?us-ascii?Q?EpLk/yYVgVxgGI3aeOxOo4zKx7/14RPn+JEQPI/zDqgLdtUFlzxz6z7ai1V4?=
 =?us-ascii?Q?4c/+m73DF7kc4MBAUvo1xUbPc/Kgi/JnggqbpJvhmkQYL10HIbwxocgcH46T?=
 =?us-ascii?Q?vXG+Wv31M8lWCBs8L8UoVWDGhU+XKjn7LKK+hy4uReHRpd1SAzS7lOEvU2sb?=
 =?us-ascii?Q?CpomV1PQBgcjASoS2veTwzRZou3AOCZYhjSmevu50HeebXh+9ixZOaaHk4M0?=
 =?us-ascii?Q?qrtDtcQqK14B7Xd+1zmsww2CIw0dSZLlpjkiFvOIdrm9CV+nqbXQ5ZqpROE7?=
 =?us-ascii?Q?bcXHYp1aWHtU+aVI1EjlAfH4O/ejwi/xp8vftYpCqit1S/zUZxfOFUFdZleK?=
 =?us-ascii?Q?RoASigMpLWMcJMzqRsjv+Vs9xG977Lcj6TH7tPtjWs/CFaViYpeVLFRtZoxE?=
 =?us-ascii?Q?08dZja9L7Tdb24UhnOgjejQwm80B/Gut1kHs6OpLeDOQ2KWjcl4clI0ZqWNS?=
 =?us-ascii?Q?ypmC56jJzS8gGYb8btTzbkvTszYkMH+jPAXhA6GL7JM5aP7HHtrKXG5SSeLX?=
 =?us-ascii?Q?zyeBiQsbK6KtLTyX0NQE7oMYdXStlzUYs1vqoySH8J9CG9nl3LqfgMhqPNkc?=
 =?us-ascii?Q?fx89THxEHLjYqN9kHBzHHFn3x6tGjU14vZ0nixZIG94db+PHKcQyUqeSXWks?=
 =?us-ascii?Q?fWCYdEhXXSep142tKkaj4B5xmmbynIO9qqFtazwTh7F1pZMl8xBEixgKVmWM?=
 =?us-ascii?Q?F/Mxs0vb/aHqIl5nC7zOKSGRfiKNH+GET1wx5qZvJKaHKVPpLBA/p2anOmeF?=
 =?us-ascii?Q?qlJAb50Xw6RRAQ/ySDEhtHWV/p7/T75zRIYVcjMgkNF71+BvBHAeAiUaBzZp?=
 =?us-ascii?Q?6b55vgpKU6ooiLoS9p3So0lyOg8DtyemLrOw0LBaKszHJJoEonNPTyn1ANl2?=
 =?us-ascii?Q?MwPCYDiiAVsigp67bdsB+EFc9OJ2/NMn9De9z1znXKfZcyeRcjfhZ00zmcXJ?=
 =?us-ascii?Q?URTlbw9oz4pvxH0Y9NpeIn/52iB5BraQVGlLAHoCRekAA6E7V1lBSPPG6cuf?=
 =?us-ascii?Q?RiBHSHYqcSY9qKg66i3BQulIqmFzfBku3dojQIMfqEFnkXTNxP22goNinPvg?=
 =?us-ascii?Q?VqEe1IoKoaT1VFfhdMYdCh1tF/rJpiFb9SN7CbGjNb1IOc9elY86Eo1cQ2Sk?=
 =?us-ascii?Q?V76Q8enNrg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51757a1a-155e-41bb-9633-08deed64b793
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:29:56.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gfw7BB/yfNWvjeg6fLyn9N2UqfMudy9JvqzUvFaoFs9tP1fVLCjCFnIN8b6DRbkIs1iAlOXjTczBVpj0tTdFeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10544
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_043001_588670_F2050917 
X-CRM114-Status: UNSURE (   9.01  )
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

On Mon, Jul 27, 2026 at 05:49:24PM -0700, Randy Dunlap wrote:
> Correct spelling of "list".
> 
> Fix a kernel-doc warning by describing the nested structure completely:
> 
> include/soc/fsl/dpaa2-fd.h:52: warning: Function parameter or member 'simple' not described in 'dpaa2_fd'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

