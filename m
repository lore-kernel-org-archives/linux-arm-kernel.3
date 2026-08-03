Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80A7C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CzhwYnTuISBxWmlEwSFh8VN4OkPjbVgBBPoy72sJg4=; b=1eu/LDMVFDbwxMYxb1OrY2634f
	FsSfhij/qOS9dQ+Yj1W8Gtj8XPUQH6XjOtzhksAgBs5BcBeo2ToTuomQ0Si6bf6NvNlcbqCQPKQvf
	p7e8XBO5C6YmC0NEBdP7z6UEHMCc8PDIpuxQOfdTWgrmI/LOz8n0DT6mubfsCZgpLb4l9osL5JwB5
	6GTF/GjviVmXX2CWPRIn/Fry6EFdaIgYy1MCSxfcRWP1eAjHXjpwW2d56GRcVkM5FFMDK6HNfSTp7
	pdvA1oF2zwM5yYInmOAknhfZNMN3NLZj1NNuPzwNH8k554ElQ3pyW/LsJTD/grAflvPBmbJubFYPs
	Ux/6+OZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmjl-0000000GUGr-1yTz;
	Mon, 03 Aug 2026 07:05:25 +0000
Received: from mail-centralusazon11010060.outbound.protection.outlook.com ([52.101.61.60] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmji-0000000GUFC-3FpO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:05:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGnCqrTEybUxdad0RShvFKyDxUBatE72K9tE1BzOZa4Onnu41Yk6YhxEbiuyhTostMarT8aQGFtPwWzBqinY2W9VkQmV9tVqxtivRrVwyA/OaN+lEEVZWf64TnnODZklF/IN+VpgcZBN/yQjAWN4B1wr/nsBpTV5m2U8cgGszGaVC/RzQWtWMi9DZvn50vP6voECavAetSmq07odvma+tskuIh+bjx1qIo6T9aolazrc6c5lZrpCn4gqRFj2WQcYJC8ug/MEYkaeSLBwTh/ube3ZsWgxblaK4n/vIsCGNMMjw96AbLrP0OKCD5aeFkGCzbOBU2zKICDezpK0nZUjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CzhwYnTuISBxWmlEwSFh8VN4OkPjbVgBBPoy72sJg4=;
 b=FgNgwSLtp8bw29WWJqXjOFMRJ0xs6THobcPFfq0ZOstJr3d6Y12fUg8Lvy3hSAk43/OuWb2tUokq19SxmsCgFLQn1T9ckKJ9DddQDsLmdHDZBooqAluDVV854zfRduwAJ8eUkzcXBDU/1Wv6/iHdv2aeCuVYvlx7aQZuTxgJg1wdosvgznCi90oFVgAOYZBtY8VyCASQFWLypMplINhyLPKojxw9/DnHWML3TdRmk2UjQ0mUjZQbhKKgGGO+04QoIv/2an6lxoGWQTgs564W0qcs0P14OjUylbmZQkMfepiyNNoRP1wuPeoCq+zuUz+fgKrawUCTTW7/m95q+l63tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CzhwYnTuISBxWmlEwSFh8VN4OkPjbVgBBPoy72sJg4=;
 b=pgOiYOSinESHmqnhVwXIza2Cvy3QvT3z7ZDJjJhFh0EogjBHw/bCzb6ojou9sE6VPkXZHpBWCTKudufHJFUkw05uW2U8+e3l6JacN9P+qoiTSXYx8yk7uJEQEiv7DPUm/kWKjCWtU+L/VDBfLJDJ5kLLUlB9/7goU863FT/FMrwfvNhzX3tOsqa9NCp1UMekBTCHL0ivBF7rES7qzckKUMVvvgJ++nGZuZJKFpjj83/jH5PLkR3Ch5rr5JQuULov+Y3zbVo/TpExuWlYXrMLYhWh8HftEAwUbTA9vI686WXJXTY0i1fZWNGaUouOCqVyC9haYDcYuOQlZKxIJFkPjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB989258.namprd03.prod.outlook.com (2603:10b6:510:3bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:05:15 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 07:05:15 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: Add snps,pagepool-tx-buf-quirk
Date: Mon,  3 Aug 2026 00:05:11 -0700
Message-ID: <20260803070513.4657-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB989258:EE_
X-MS-Office365-Filtering-Correlation-Id: 8912e0a6-3aa2-4b12-56ad-08def12d918b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|56012099006|3023799007|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uaSyz8LOfEyVf/ZWq43joNsmfGu1KkQr7s+rml2Zz6PwTvbRk02IgK80U577e3kbUAecUAJlaqYuwcL30byPEHHZI/ItUB2qZaWGfp+h08Z0YsIYohp1k/b44wtLGoqc74ZIUJaNVr1Q6VTWzb0KwaF+RqbMlvCgo6rorRto2/vebaDN5q9v7jisxeA/7oJqgd8zWd+sJvMq8zuop7HxHSfQRy6ro7YXPHmj324siQX612LL5lLzFzCuO2y/YZ9wexi0wKP6DrIuU8+N/Q3Hj3sWT8cEUCGOpmNulLFOx8TM4J/X8cnzmHJxRn5s77uyMS4E0OYWGeePPRQByipVxj3arK+t+5y+TfRHD1XVx/vIzmf201RAallWW4zclgW2urptMeLqxjqXILX76g+03dX8UUq3xLpt25yLzplYLkK2mnyEpAt2fqNeWyHBeOkaiKYngZvlLhGy9pwDvslCkyw7YtTBmn4U0Kjgl/Nc4ADHmwMVLBxZPq9GmTHzLw0egPAvHPym7V00Ply6nkep17E3QQlErFqomFBniCL8cJxY9JhF7RqmQG/KlJnXPBa12W0l/aCcCtkKoJbCPUTrTCUey9sE0vtVvxAv4cB69SkcDywXnHuCn0QOc1ycC9fEoacm9jxJwLRadvs38EnBjxZjzfudlg0u19cdjnbsIbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099006)(3023799007)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g+HCFcl4PwJG+394GafquplvfyvtnTiKwKHd+bjebDwyRIybpTULN9Ddo5zT?=
 =?us-ascii?Q?pRRl1lprYp2XxkWvt/yjjNqDs3tSbGKun53xDJptRQGIvyAp49cJPse9eNJf?=
 =?us-ascii?Q?hDrjnk7DCIz6sCkwHxIm1aJgb5Oczh9bOl0RKT211MnI8Mzg+M2EKgdyVY9E?=
 =?us-ascii?Q?eTHCEOHh6+51MuY98iedWy1ds0phdqr+MPR8QqY4hVkZvbSZVg/NjpiXzvZg?=
 =?us-ascii?Q?TnAY33LrEFSzwsJ0lqj31hrJNWOFeebH+oS6K0xX0PO7/8ZAumCyChN1wKpt?=
 =?us-ascii?Q?nfmnttzMbtOayFtJs8eOADrhpVO+7X+PQUzsyYcel4q3jkN7N+oo7qxlUsdD?=
 =?us-ascii?Q?Ps+JGSJHG0mdBaapE0G1Hgy8J+Bwbbus4wo+yVPvq9g7MoOm40Mcd5zg/JFd?=
 =?us-ascii?Q?efYAf+qnmoL+Qx+7KMnETcN9Rib/Fl8Ales10UVacBLt3UlbH9s1Wcxa1wV4?=
 =?us-ascii?Q?T3SLWuQsswUE87k1ytiN08iuxiYjtTGthfbt8PtV53em5oxQGQVsbZQ3GOR2?=
 =?us-ascii?Q?tt6MIN3qZBIjaV29dGZKgbnQMyJ7uuvFo85+vub6DMqRrrT9CM9IdxUmvyKX?=
 =?us-ascii?Q?8BRLl+t4pkXawm2Xi1Qzoy9JJwXG0Zn5vEbhc3C1vzcoa/Q7Tu0qka2BM1Kx?=
 =?us-ascii?Q?yjZGf817KW9rKR6TSuH8ym2rsUaeljjH/Ei4ehE8+54hzNCQwpJiVdjWR1hI?=
 =?us-ascii?Q?u0Mw343Gwzee/eYgMIEUOGxbefdYWmHLVO7qab42CeJphKtv5nNXkj9HUmYG?=
 =?us-ascii?Q?fLIKh0h435jDHtVNv3AQRgS5cmGez2Um71+ZOC3cvhRK/Aj/X4ElpPNSjt2E?=
 =?us-ascii?Q?KUHhgJTW5jD9iWJPsWMdY+LJW9gQEYzPdcskjH0Jn3lDe/TlRgcWG8c/6g7/?=
 =?us-ascii?Q?pRDuGWRTU/W6LgWQrCuxfnQNuis3Jjh7p06B0x2mm9r8mSGOKdppuWqvqlIO?=
 =?us-ascii?Q?nFNKf856NZ8p5aTrw2PP9cU8/7PsyP+wyb65hYJCI8OObHr+8XUH5Qj3DDk6?=
 =?us-ascii?Q?pelPlic3+MC13ecoAmyG85F7w4wNDOahYTUZ+GlunTLlnL3LVXBpCaEavVuI?=
 =?us-ascii?Q?hAMEPlZYcsmeTM4C1WDbNf0kSmNEqouz/I9UxpdMssjg35rPACjiuFJ9WcZM?=
 =?us-ascii?Q?CGozFz0iSyKbdGmyTt9iFNme1FmhX92NLZWBkZ1ngbsG3DU9HIv/D1RSNJj3?=
 =?us-ascii?Q?2axs+27qpSznWpBYHnBY33h2BxIQ/yvOVjyTe7pid1k3hA08hYa6p2MJD8t5?=
 =?us-ascii?Q?PUuDhx0u+rN/RX/5h8lHs0Aj3/PuVZw4lMhrFnMyaNBPGlXsnygxVqg+uVJw?=
 =?us-ascii?Q?M7kH/CR66j4rGM9j9m+o1NyWUL0KhfySgL9JalZ22tSjVrMKr/JBUc4beKP3?=
 =?us-ascii?Q?1f5IZRfK9/YZ+WW+0Wwps+1BVWkmNZ9KPhP3bio96MFgmvVg8xLjvv5lEwF2?=
 =?us-ascii?Q?4diFcKYHWlJZY7ZI1OawMa0PTLb7VbNXk2epp/c3UeDs1UW0UwoyX024L3Sv?=
 =?us-ascii?Q?vDCQZB4Ykj7/CWdI2KI0m7DaDBexOwGWXgTE0ldNJ6nCxtf+E1EzAUqat6Fb?=
 =?us-ascii?Q?IscZ31SviakoC49EfX7nY8LS2pbN1P39TYNxjLu4lFiAMFe5CUdpvfgF1DTJ?=
 =?us-ascii?Q?QKaPb/94mVNvOJIMhRN8cgOm5SmHaX0ZqnHnB727uGG0/A6BdOaJcsaEBuSn?=
 =?us-ascii?Q?yr0uWyjiQxtGdx544oLpuyTv84sndbH7mpASIQgs8xpMcqGwFg1DbVtgZdBH?=
 =?us-ascii?Q?KgeqB6XTEMiHIfOrSHTD2tn4FWKKr0ATfp+0yL/j0O/4pObP0DZl50CqM4EC?=
X-MS-Exchange-AntiSpam-MessageData-1: mCDb1ElWC0SuNg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8912e0a6-3aa2-4b12-56ad-08def12d918b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:05:15.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xD3QakFdCxQg3DwbpsrocFR/Dz3A5dKUAwsSXefiNTDXrYcoT/Zh4jEl7TfDDGDcVeomoRhBJCRnJqbaSKMF1PJ6RDCXUA/GnwvzZVMjoCX1IWoCghqVeqiOMV1+Zr2RmafCVhmXQrL8d5e/VjhIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_000522_826076_705CF2DF 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add a DT flag to enable use of page pool buffers instead of streaming
skb buffers for transmit. This avoids IOMMU invalidate wait time on
platforms where that cost is high, with the trade-off of copying data
from the skb into dma-mapped page pool buffers.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28..73045511446f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -545,6 +545,14 @@ properties:
       Enables the TSO feature otherwise it will be managed by MAC HW capability
       register.
 
+  snps,pagepool-tx-buf-quirk:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable use of page pool buffers instead of streaming buffers for transmit.
+      This avoids IOMMU invalidate wait time on platforms where that cost is
+      high, with the trade-off of copying data from the skb into dma-mapped
+      page pool buffers.
+
   mdio:
     $ref: mdio.yaml#
     unevaluatedProperties: false
-- 
2.43.7


