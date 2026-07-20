Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892CFC44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVXPPwKTUoYiO4FAYkJKWNRb7FwnaVy3gScDM0+Ns20=; b=pZkonPK85c9+wQDBU/V79mIJLj
	fJc2yr/7xJfn2LWi7RfgtoA0Ah285Wo8TzsNtuPchmEFQCHCMu2VexZV07pNr8LDc/TxceJfCO3YO
	mnKZehLTG+SMyc8nMLEHvak/S3l3zCb28EYojA24dfYUjsaq4N5izM9tvnoSwSBOGXF2odhLrvBsD
	lepLKVjAhYFE+chNfTyNtXx5FaoXCE05rvlDN17kY+RyVnbepZTGTJo6nqmMsNz/0M2SdULypO7gQ
	KomzFC/cJfZ5ZBtE6FzBXQ0o/8R9uFFjAb9rA8kGS0rdVOvhjGlOfiUb16SEVBALWComKtSnJRows
	HKsf8fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknQ-00000006P0F-3vuK;
	Mon, 20 Jul 2026 10:00:24 +0000
Received: from mail-japanwestazon11012025.outbound.protection.outlook.com ([40.107.75.25] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknL-00000006Owf-1i3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYMyNhRcTBKe+u1A/qBSof89ERGiWDqYIt13fbkxMF3X+Tzw4FwqiZ1M8L2I0vSaFVGmtluLKTFbndLpEVkoYIxuS6batnsiKjuZwWaYRKKmESfYAMzEHXirVOFzDKWggYujNroKBOcw9gplOY37WWQVBRVThj9Xy08sYBdzGmUpzH3wCY/FB0Nv50ntKXVTRGQUGvgCYiQnSSlPzs6oe1I+vtBKeGLKKV+O5wFbMcyY8C4WOj7RRM+yB5rcUY1XYd/L5ZwlPN/8yEqq4kj1fNCULAVrOOAjjaE9rPHlSihQaxFsrict5uPm9uQNdZb1Z/rTf8hQTJptbh5SPJ+mnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVXPPwKTUoYiO4FAYkJKWNRb7FwnaVy3gScDM0+Ns20=;
 b=uAo2o/rwrLrC5u3Nk+gaj+nVy0WCO30ysY3d/5Svqc/8QIEkiziFL7HdsHG4R06UYw+zMOj4IdctJqqejUHrO75WgYZPN2TChR3xn9L+enYhem92kQKO8di+dzfNQyDNsrHlv3jtxCYey/Xo/3ljpxM08YYO/C5+FQ2FddKlhhccw4cIPEb+rm48nPBJtwK+hJcO7pXqOn6fRTLfInE7jHdTOelfMotUsjg7by8Y72zQHC/jIGAXAhAGSQB4ArKXuScl9fcoN1CncqV9HKd0KtVceSuUj+DEmpJsAL3VTwwOGp8DLSwtTwaKsWM0e8GbS0fK4JkH2S5fPssxlk2Hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVXPPwKTUoYiO4FAYkJKWNRb7FwnaVy3gScDM0+Ns20=;
 b=D5BVq5qjwq0d6rlU8bIcQMVHIKrztbdHBIilcPE5NWA4W9SA/428n9E9sd2z8NB5AWlOAIvjmAdO8fpcwWLQNumxoP5703SpPnaSXk5poZZ5UBU6qgpktzsyDfG0ijn9hCRYym97Z7O6HcU1fckABi+hjf43/vxbFPPNM8VswBH5amZA1lWwjj2PQTY8yDY9YwiGKsi+tdY+WU08RoM1auNvyDiaCaZ/Ax33qwiVYcOT7C8HIOR3oFDSxyunop4E/kC5WJ3wzyZ19cnzbOjvTu1r1+7G3BAjTrUwM0utaxgbLSspAMzpKpWWst5Bb114I88vo7tNWuvZo4d8F471iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by TY0PR06MB5633.apcprd06.prod.outlook.com (2603:1096:400:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:59:58 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:52 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Michal Simek <michal.simek@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Pan Chuang <panchuang@vivo.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] soc: xilinx: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:13 +0800
Message-Id: <20260720095920.542801-8-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|TY0PR06MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d289a4-c339-4450-df67-08dee645a4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|22082099003|18002099003|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: F/Y7iTlB37/zlWCeZesyKW3yV+UdCnc+JXIgBeHWbIxs54mqhUzjLUgHOX22mCXlIaOPKYJpZARAPYFScBl8ifiwSWXzAsms6DMF1Xoww3r0nJH3psZPpz6Jz5kR2LmsgD9kIRDv9ILuhEdp6vpGEP2yU1/c/v9UILa+xa2Da69xQyj4EbJRMkWBPUvZNLHVnwY1+3dEZ+xTNPB2T5YUIMXT16AV2MrZNMuaUQ2brGDsSCJN7q3ZnZPkIupD7FKP3vHo6biv5B78p8VFHEtR9VfCKTeeKMUKQ0ZCPAypuKMCBUJYvbnWv1Anog9zdm/kgJsrYTdhtsP9XwmiC7ZcDkDoq5PmbysrReFh1GEKBYOXpDyUwmmU9KTguDiJ9uUEaTAbjp2A5s2bDIfV0GMbfgvSmGBLDmOf15caE2Ib8HOWzgk10o+blpq+wDGuVm1iCtZ/f6+Ugp0ajMV/pnfjnR6/eAvKLMM/Zti24147vKv3jgr7zc9vhvnJGzLiafyGh4m0mPWdHswaYrroCvDT/rQZ9KmlWuj2kgXjOx7Z8BVspgnV1kNZWFGMuRx26v3PfHJDXoqgh28fKQ1KTKjs3ctKLXd+Ic7E9ArcXmk/ci77grEERllJDOBFJd/q5eyQKCQcmKX7zI74pxJicP21IXjW0//yFjCewq0fcLOG9GUcWbtNvpJ/hKIggPvC+oxvj1AgZL86JCO+UZocmtYurdZNyJ94F4A+1WgYAzG88lo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LynQze8OoVAuWWUZzpPJM9Ap32pKQThrfPSqa0tfuTSEuy7Pj8gQ+IqP/Dpb?=
 =?us-ascii?Q?05LWKtL9En2pEZv9VNYRLPIZnM3NnvSC63YEqtwsAGYWOEH4UV6QTKe38gYs?=
 =?us-ascii?Q?BHFoudLC2qMf1eg4l+N3u43Vrvgt/1/G/hU9hDzIsFIpE11EBVu3UDh8kE71?=
 =?us-ascii?Q?duin1BzUtbLDYnZxrlk+nPjOFw0NEg7M+DtQqPG7pfLH+T8d7OXkgDC1EY/F?=
 =?us-ascii?Q?YvtlyD3Q6AiMkSJ0YfVdk23xbzlivPEp8S1/bJpJylZYaNNwk3m3lXZ1s/sO?=
 =?us-ascii?Q?0FW4nzPAaOwXU7FXlEubjhL8VVkA2GBJPB59lQRWWDMax0IUXcy9wZQA3S2Q?=
 =?us-ascii?Q?+0yXheYVqCC/z5Lu++WpaBYRBy5ezY1z5MSlmNZqX9RNInFJoGy6LAlzm9Vr?=
 =?us-ascii?Q?iGnqL7OtPJz/2LC+4C5ABMQyUSiCG3f8+SB2LltRFR9M4w+kr/XPQIqBfSgC?=
 =?us-ascii?Q?Be6vvOPAaO8Tyu96SnEbLNFKb9VZR/TlQjBwZiirPAjt46s3TcDwm/hn8P3j?=
 =?us-ascii?Q?07VUBRypf9ugFE9zpSQagHCDUIupDwNsYw6IGcOgau1duTwFk93IdTJXJJmW?=
 =?us-ascii?Q?OvqdhqxP8pbdXbkteAwNzIMqos+sKud4uXGunnbhbM1Lt6ZZmYC/xHjQc5Pm?=
 =?us-ascii?Q?9B5Rui26LpuXmEJEpev14BWh+egzHoEpnqm6auchz/vl+sc5rF2r+8H4JVtW?=
 =?us-ascii?Q?DKttECmtyKOeW7WfIwKE1/CIdJsr+XhI9zArtiHcYJ2sUa3hWis1/uFv7pPB?=
 =?us-ascii?Q?IZEkywzUkMZEFT4PGLQQ7GEG3K72KXrHtdGR4AHUVX5IHuQYIrUH/zdxWr8h?=
 =?us-ascii?Q?Dpuv2jSxn0Nu66sxflt8K/lYeBeV2mP9og3ZiEMuD8nIqeY8/bNBjFnrkCVO?=
 =?us-ascii?Q?/cgjlbFDH38y/JOl0FhupVcb4k62vwM+JfDyiEh9fXXivTUg9yAUV6K0LirQ?=
 =?us-ascii?Q?p0/TLuWHdmzqjiERlYusJNeS+DEAEYokHrnkoYkBNVnnXRyyq7CL40rQIviy?=
 =?us-ascii?Q?b+q/dOLRvRdlDrf9mehy5ZnQgSGmYE/j+Ol7JqyvC1p5xbtwdleRSPk6s4FY?=
 =?us-ascii?Q?WNHItVvLvrk1liMyJs40FoWsfho1k+gRCaHrf3RJMfg7X9aSFTJ6G36hAqoK?=
 =?us-ascii?Q?3BBdJkEv102vvP1RkImMN6sn/h4iK4aNOiUJsM7AMxSd8fr+j0ONgfR+D4U6?=
 =?us-ascii?Q?rUkd1mbieQ+xO9pz+MERNWcG8zWvtkSwr9sw7IsTV8lrn2xCY2nVjuwNXF4l?=
 =?us-ascii?Q?5NPmVj3Emdi77l+oRlqeYd+zI5vnirap8/9KKSCZAQQ+z3AsPxJkKHgvNRI/?=
 =?us-ascii?Q?Q4cJZz4Ie7vFRX/OWpw282Sek2IDAQMjNNIpr+UFcwlH9nK9oog/YHySbSui?=
 =?us-ascii?Q?1SrFgtNrHAYgxre/qvVfGPfTXYrsxIqXGijMEEKJmKarSl4VXBIGxY8xew0b?=
 =?us-ascii?Q?4xHHmYxN1PtRXhE0/UK7wtLsNX7wL65W6e36DkM797Ju9KU7Iv5GbkEqB8Ys?=
 =?us-ascii?Q?p/IIvwrKV57TND99BzZoYIZVqZqqDj2ZAfjW1KcE63Znrf9hP6NkxjXPzLvc?=
 =?us-ascii?Q?EcVbUYBhTvVEFxGJ0NWRCxbtOUji1suzIcTefa5kBF/m31g/r5SwfxiJe5IG?=
 =?us-ascii?Q?nwm0mdHjZKC6s04cLb769BPInrfR41XMsfDmHvCwi/i7S7Gen122TVg+QeK4?=
 =?us-ascii?Q?3X7voBX/B5ptluBXhbrVwbe5BLW7rU6q9gRu5X48IBO71+bKXwHB7UQw+2dG?=
 =?us-ascii?Q?/iOaVW7XBA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d289a4-c339-4450-df67-08dee645a4b3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:52.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qT115Xe2OxckAz2z78o03Ezmbt8LFlqTz0hKw6M12ui4y4d2zgVfZnYDeluRHk2yzHd6RCdKM+NitZRjQRZLXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030019_453050_480211FA 
X-CRM114-Status: UNSURE (   9.37  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 370e61ac47d8..54c796afb89e 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 						IRQF_NO_SUSPEND | IRQF_ONESHOT,
 						dev_name(&pdev->dev),
 						&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
-				irq, ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		dev_err(&pdev->dev, "Required property not found in DT node\n");
 		return -ENOENT;
-- 
2.34.1


