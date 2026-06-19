Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63657CD98FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=; b=ANpREEGgGRUCDPCAj4ENS4n29P
	GKUQZ+CbTe1bBcwiD3rLwn6YFJu7EJRt0rsQ5q6O3vznEqlftVrQtYKzeApjvaf6ibkoNKDmun6BE
	/U+8TiyYGwVixD8zY4CLcHzvBd0NmTuVIUGzrLOlFH1cyftulhCc3p3Y6kWsJFM3piNjvuGVpbcRo
	Zyx45cdaH9g52b26i5Npq6rl3ZTxpaGYBWNIHOPRrF7aXgHUQaX40+ineTRv/Didoxp5IV6Xlzj26
	ftSK2VBnqB2AeeEuVXCi4SiDVCmwSVjwkgNJa16V64uUH8d2mFQgeo/GAwZO4TRn/IaWY36IvIqmg
	tFULSzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWNC-00000002H7L-0JqC;
	Fri, 19 Jun 2026 10:22:54 +0000
Received: from mail-australiaeastazolkn19012069.outbound.protection.outlook.com ([52.103.72.69] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWN7-00000002H5A-3ZbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6gNmbvhdAhLdc3CS9l59FNQYn0c+fgtrQ7zAvf9l/mDgYX8nt5+S7FPsOf4vwwKWHUkZHM/1+8R3x9m4k7je7XAkee6st1UyVw+4DroKoQc7faWojYp2Zi3HZMLCXA+Ju4iM4OhSdonCg1nMJu3zugYSDEQu46qTtHURioVtDAzzUG+lRYF2veNub+kkEbJh1TojSYsTrjLj+gKcZNIMnIXzYvzDFWQ19fl4emsG/0763JQe41eI1+yLn3Gfnx/RqNSl/l/dxz46qVRxJatU97pA8n8Gbfj3phy1GgJ6Ca5KC8Wq7ififdjuJQiLodFXxtDI15WlalqhcOH2w32kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=;
 b=lHIHpQeu5X92OrZPh2OK6uDdogGQWYyJ4EQ8CZutUiEYsvj+jFxxj79GS0/7YT+dZItknUklzx9XIpCPETd3Bb0TDcfh1l0+3VOYtAe1YkHz5tD9qetuGhA6UhebnHsVoJHO1pwRg6R1QIial4WCiYtB19UB3PunVuofpe35FOtGT90agsDVSs5g3uRc3hEo3hThTa9/F6hbfbJoTuXEI4HQWNCXb4iMOuE1qeYHtcXIrxQhROn4RU9psDZUd+a0UBvnQqgeJnIdPNtVbfwWqDUIy6CDPhDncXxgeOODOAOSOgpyEz4XyxRfWhKjjMej0OITFzrmZ107xLcjf+DP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11oRPNIaBM/MlvSIgs8lKCMCNIR7YRZrKovMQIU/RVs=;
 b=BopjYxsG2H5A2YpTsD5QDLefAZA0q61ujwqZ3sOGmeWugNYARQl20xYsqkx/9wnBpL6dYyi7mBbeg+bq0/LmG+/uRcwNx7BD/gaadglW/aFdzaVe4c99QLX7/DYz45NVNurdoakPrNH8egHYMm/K+DbbDpZN3GocOHw7jV8jNrFrsl2CZqUTH0BEaQmrjXmSYm2IaH7B3cjQUcPRipzuYpec+8WmnDZcxwyYKF0d6LvOGhpzPG+nGNAtP4eAIebIKAZ2dzU+O9vtstfzGJkfcqEJlALF8N9GlKod1TLSvUYFxIeIrgmhCrw0QDoaiZPdNdF6qNxq/CwzhM1JA6g4SQ==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY0P300MB1571.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2cf::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Fri, 19 Jun 2026 10:22:40 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:22:40 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2 board
Date: Fri, 19 Jun 2026 18:22:13 +0800
Message-ID: <SY3PPF19552C6079632E394EC9ABE7C9FB7C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619102214.223121-1-f78fk@live.com>
References: <20260619102214.223121-1-f78fk@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619102214.223121-2-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY0P300MB1571:EE_
X-MS-Office365-Filtering-Correlation-Id: ad70e395-67f0-44e1-dd9c-08decdecb0f7
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRGO9jA2nmj5nHL3Mbi2nhaO6+cEM2gG68NWlU07fLpas6ouhr9qCJGh+u0WU/hYI2Jbo+6IJNQIDEd7Ehfko/mhbdXyRweaz3EuzLMPO5lhUlxOMa1agrRPYN9pKwFzQxETJkad0gGGJQGEKiq6ZEuxRa/Y7zzHLcxgDWAhBYc+zZ9ObD6nV2vuhLxkkaLbIrMkTGhwjJw5r7ChH0Fdp09/uMLKwNi4gk6fNS0mkvorIuQ6V67YPWHCtg02PrVQazO6U0/+3JoyC98J3xZwometA5lEcj/oXDK91GMv9xCINqA4E0W/yBBBU9uv5VLdRVN7dKK6Y0qqxyuXiRXHV+onpKORY2cHOf/tWonCbcQB3JOs9p1szXPL29d1ECcvQtiJkkbfKUI8nTmwG6oh8yCqJB10owd7zrUZ9Lcw8pG8rIscr/k+JbqpKUZ9VZG//tXIvS9e7/TPBo2inO6hudyzWjJ+2kcyo83Gex4GXb2f7iKiq8sFs00O7exoEdaq3L7nBQo46/tSuLlrGv4+grO8PIcRikyU1q6jKNYvuxp0t6MVWIqAHwlvS6cTOy3ovfqimheSxMA5O+6zsKVUOtKh3rQOlMNetJfYG5eV0UtoDLTGulzcvaHqnRf9HPnte7SWRIQXMi8p5jNVGBlFn3i0akC0/Fqc4qHyblC5sFPn+druIpHGMnpEWmmIjuXknlYBWe8vTA/t/5ChCsrJ+lCc+ftqGGUaubuuuq6juLhA8=
X-Microsoft-Antispam: BCL:0;ARA:14566002|25031999004|15080799012|23021999003|19110799012|24021099003|51005399006|5072599009|8060799015|25010399006|26104999009|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?88zL7vwlFs2T41sjgRnEB8f+o5x51o/oP35wXM+arnl7KfRL33hotvrjQQSJ?=
 =?us-ascii?Q?Z2qWNb/tBQ3xBYnpINby9azSfhNxIFYULN1keZuen1uejfvUoR9Rt6OXmVEY?=
 =?us-ascii?Q?gSamQR1zVueZhaeO4CRbPjGTmMBh2WFSBFvc2wibg/sOQ4rImDMiXJFVfdAo?=
 =?us-ascii?Q?G0WpnySql5R2S3p2gkjwjAIcGxfYE5fu2ncwO5cuBQVtS/E9lfd82OD9eMc0?=
 =?us-ascii?Q?YCYzNqFtcaIf2yhDBK6eYj1NgM1QcBo1xrbHIlyqxbjhOe9/GISL0Yb1dNo0?=
 =?us-ascii?Q?Ehaf8M+lxf3rn7bP3L2z/yfdpV/g9JZm151T0FVAqWFbplgbsOWgKW/tvpaL?=
 =?us-ascii?Q?J6rtI3YpXuMFauI4KR5f3K6WqMSZrUEIaBqx52AaC9UHRFJpQsd96Hke8GtQ?=
 =?us-ascii?Q?kadjuzrZCZmUXbS4hZRT1mJBKr06a4askMQj/cxgcdd/HYp+MZBa1Sc6ol7Z?=
 =?us-ascii?Q?1fEOm5xjKhVUbXtldcs26OnwofH+6z4Jh1Ckjkx7NxZ58/1hZ/ercJibC7hJ?=
 =?us-ascii?Q?ylIHi2O+Jp/er+matXHQq1HBrpbNCHbcxOHy36CLUk/j/URGjG1KqlmXzZO5?=
 =?us-ascii?Q?hjIwnGOED75/p1myvx2aITFf+hgV2k+XI4hhiD3WDiUhNq4fX3W2MCImCL/n?=
 =?us-ascii?Q?CPg294DugweR9t2kWvOGGvvkH0IgjYVFsun9WqbrqottfpCVgwm2c+mKsRZv?=
 =?us-ascii?Q?xyGjUgyvrPDYfz/0T894/eLkkfLWy9BdjG2IPo/7xNoQFYQo1MjTW4/FZNUc?=
 =?us-ascii?Q?+baI0z5Gn+DbxVqP/jONq+KgL98+97uhlb/uDmQn2GRNKq4YIIncL4UWuLxx?=
 =?us-ascii?Q?Zl5UYKx5+9OPlcHj3PubkdNGfHSOhuMDQgdjo6G+DREy5YR2zq2j9mlIXUic?=
 =?us-ascii?Q?0wM4E7lQy2Vh7kp7kJj6Qauz1dqci8BxaFEHGqVjDc2rGh0psmzR6N1qz36X?=
 =?us-ascii?Q?9pxzW0hAd8GEcFjVIRq8/g0Yp3GXypdFb3KxZ+/TwPiMu2gpyg3+SsMBH2sy?=
 =?us-ascii?Q?paZ3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GzdpyL9hrcEwzAO74aUlGUm7dD1azqtIglzuHLOpVbPdPLMSGg0RvuQjH1wG?=
 =?us-ascii?Q?YT5vS8heCAhmU2ejC2A9yrZl/UMK9AoGWZZG07sk9/KmWcLSpvbHDgaFLD0q?=
 =?us-ascii?Q?N+wH+VlAQI1aACPk76ngwQO3c9GqqHrHT/lOtvFiQBCzlgtW9qmACWK7T3PC?=
 =?us-ascii?Q?vFCovkoyw2qRzxc/ALTNavp8viqpedbUd0G/d393BTZstxOH/+iavxjoVsY5?=
 =?us-ascii?Q?ZVztVxdXeJQAMGfhQJYDI5eKtR0yGyJUZvJslFNPMgw4eyGpNRi7sAqwOkap?=
 =?us-ascii?Q?QBjWHRCiVRZ3A9WnDG8oXarzANCwI3Knpk57RZ5SdJZIt0zA4XnIr0j/1L4c?=
 =?us-ascii?Q?5SKbg11QHlILdrhdY8Tiyhw3Fk6jIEmZDIeRpiKUN4L4K5/XuODnOvlS31Vb?=
 =?us-ascii?Q?KzBNzX4JqRy6YQNSs4sda/dCOvPvMKtmy3G+5utlCgx4KiCUoY8IN615q26I?=
 =?us-ascii?Q?WL0x2iSjO8xe03qHLPHMUtHo23rlSbC1XI8sJ/3UnvNEPN7uGn1NwGqG9x04?=
 =?us-ascii?Q?8ViHnwmrTky80kebMbPZPaVRwYg+45bkfBuzT8XAXhP1iT+H1wAlgXYf25Xp?=
 =?us-ascii?Q?A8GUaKRLc4XY0PXZ1Yr2q/3DPAjP8JmzF0Ba/LpGzULvpN8gRiO0cxwDydT/?=
 =?us-ascii?Q?cWJ0gn8RL3X4xK2lHacjEse1dvJOTVjD3c4dF3UpZYRlhQvNlB/ZWGV0Gay2?=
 =?us-ascii?Q?3/xrX/pAKXyri0wivnqwhVMU7JlVzWgxM4I9mmHkKN4wYd9fpWFNr5mCm3Nq?=
 =?us-ascii?Q?UQzHy+CnbI8wiqBEbC3S2hml5Fmm0YXqR3MWXlO/holnUId+mTHgLHEICvO8?=
 =?us-ascii?Q?ab1XVLxEDjWFMUIYseIWsnsDVtAS8iTZFYpTsW5bnyCXYBELAeSt6lW71GXJ?=
 =?us-ascii?Q?4Gz5HtKsxD2YDPA0VVM0Kpc4qj9FztDXdACuno+0lYzxRzL4F3aUzdw6keFw?=
 =?us-ascii?Q?8xz7CEfEPE60TS5Egtjb8PZIaMo0M+XBDMwGlstg3XquLXyKa5/aYLOModVB?=
 =?us-ascii?Q?jJeAlPV/rUHM8sq2ByZbvnTL99Myo1kURommHleGu3ysF2wzNDHwYR4BLvdV?=
 =?us-ascii?Q?HHw6ttDkrvoZHWESI+Nam4YwVD9gQt13eLa2lbB8xraK6Es+ZoNMLHQjCRe9?=
 =?us-ascii?Q?27SZV9rgXRlKj5zxTRy2IT6hOPbF5dchZdnhcG0wbB/5VKzyosHBu2Vz202t?=
 =?us-ascii?Q?fJKLmpM30mGC+xv0nISLsg2S21ENFal2Jm4cNTVSJ62G9g4QXhEYezprsimc?=
 =?us-ascii?Q?Nagvy9+pcAN1E0sQURJtQdL19czpDRPKeihdM9bzs1Gqkf46RlgAxhS+zReV?=
 =?us-ascii?Q?llzZpnONWnKw3AbL8bWZ165YDXDEAuyHYRegWDMNdit6RmrtbIDuIWpTEiBa?=
 =?us-ascii?Q?yIGAr18=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ad70e395-67f0-44e1-dd9c-08decdecb0f7
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:22:40.3564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB1571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_032249_889683_3DA6BB8C 
X-CRM114-Status: UNSURE (   7.50  )
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


