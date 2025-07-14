Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87E6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF8LI6VV1p2glvAcKkXgYtBx7vkrJpj99xBuRMu9SnE=; b=03dlnBzAAQu3dZVp2wc3AZraON
	bJIGiU8UKH5IdoCyCDQhv1dCrwu22Ufpn8iBR1ASMKr+7GeoLIBNk3WA/KXRufpVDPMxjf7LgIJMS
	WOmn7GxOOHDJyns6S7tq5qOLeNuXP7iuWpG0x4/fC8+kATmrV+oISBGS9E07BlONzqLRNxcCDII4K
	AVlmGbPTgyOshhO6XcphtdFGE9wu9ohJ+h4OGJATYEQYBODiwSeRraQtrb2jMSX1VRMqT4oEnva3a
	6vT/dCDXwcXWfhVjTvj4s46cn6dmiCi8Gitiezcf/5ezRSeSNHlsrB5ZWT2KzGEufJsz/wAelzGsm
	utNjYVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMv7-00000002x5e-04AJ;
	Mon, 14 Jul 2025 17:24:53 +0000
Received: from mail-mw2nam04on20605.outbound.protection.outlook.com ([2a01:111:f403:240a::605] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL40-00000002f7g-0rwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:25:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYm+PVqrTvWONsWiL7CSuOowGfP7p0dXDwj1zHQk3m/ssREK/MLkTPpLla9uYOTRJ4Yl/9Oja6FbbVioXfOskmatU0H8/uNqLT8VM7T0HBlc6VqDw/OlxzkZD0qFLuJ6A0UxU6L6Wr4kugjKPKp94D6Jeh3reALQ8e6v301s6CM/YCtgt19imzmqNtLtFmik+s7/vlBAxSDEFlTeZmTGQNNmJ9SFeb/itxVynZcGnjHfPjaho1YlVEQN0pTXD+2U1xTkWo1rwoMhVVHRMwj9QQPasAKlHOCfbQ/5A62J3BWxt+nIRGodXodO9PfUtyfb6odnr/Qac+zCisN/b9a5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uF8LI6VV1p2glvAcKkXgYtBx7vkrJpj99xBuRMu9SnE=;
 b=QT8lUCGHwChSbUBxFm9gdeY8UrpmfNVpLDRnK0KgZafH2RUCn7VlqrqPVxvGE5MdiYOHmVWTGrMlPYd2arEljaT3zJQolvZvD0AdbmACWoHk6E5ylzYDFKfNa0F/bGck39Cs22tnNySIN5cU9VhOnOTdB5bJ/bMrysea7ExnQ+g6F18wo4iv0w4T6cj5s7ehXVQwNzlJuGken23zjGNK8TqtMUq+8wyeQ/F3CTmTZEjuoP1FBJnhhK0HJuaCf9vr8EDTu/ITlGWwQaCwl51pOLkXQ+Oa3bq99kiMwmBQ5BTxUu9xanh7Fb35MsPevuFU/MNUN0Ph+ZOJHS6OALMIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF8LI6VV1p2glvAcKkXgYtBx7vkrJpj99xBuRMu9SnE=;
 b=otENX5UrSC30e1o4fg3eD0UzUwruvyIiFXGycWx09lfqaY4TbSaqL6bEfa2ox0+Fc56rNnEnDdt60cKYAK4hmZwwrvIq3dwA1ShyAio4cpTc6bJL7ZGrljrWLylmE4O5nnMh6vpKS926QMudPhO4f9vh5K1J5z4KN6N2yBYetO2qJJ47NnPiXkhAEhgYW9PdKzbD057Jr9lQ4XncOldbH10qKpfH+6Xbuli2lSMcuyXe2MjUTnBzXqbQqDDqcBtkFMBS4dFGlEJPgseKCWn3UH4BJ0i050O7OvesMzokzuLMxqjGoVL/FkzOuPzdw9+TpX+zc7M5xpo351DLaA2Kyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:25:49 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 15:25:49 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dinguyen@kernel.org,
	maxime.chevallier@bootlin.com,
	richardcochran@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@altera.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 4/4] net: stmmac: dwmac-socfpga: Add xgmac support for Agilex5
Date: Mon, 14 Jul 2025 08:25:28 -0700
Message-ID: <20250714152528.311398-5-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714152528.311398-1-matthew.gerlach@altera.com>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|DS7PR03MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 5049b479-998c-497e-363c-08ddc2eab656
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wp2UVA2jkikUG1vFuOvhEnbF61EmNlyglGK7XMzKWz34nv/2LBxBQ02tK+Yc?=
 =?us-ascii?Q?uoZt/rhovNcVmAKgTFctkpGjTqsvmhtyJwcMFa7jz2hklgsULtPXkaXCMjoF?=
 =?us-ascii?Q?8I5EAY5d61qhUU/vMxJPXOlTSu3srDshRF2m07f4Dc+VvNec6LdiRz7l8D4d?=
 =?us-ascii?Q?7q+Die5IIAvZ219wJJ7s2BXUudrvRsu0IK9gTj4KjTUlxiFNiV2jnU8hOA/m?=
 =?us-ascii?Q?Eo1S8uoLBjiKgTRTJX7MveMbfXVHoxy0VrX3jTZWCDkJCX+tVSFfmHKyQCvi?=
 =?us-ascii?Q?2AMw76t9YcbQaL78bH8Fkyvzh4Ko/rtuVUiULDWaUxdfDPEd/cXfE3/zCat+?=
 =?us-ascii?Q?+qnkQkjv7t04whIqC2uKtcdEgrPsBK2Hy+8VWphgacSxpwADETxXSsEWW6yN?=
 =?us-ascii?Q?Y6czEuXhM2OOc02ul0/Yb3xOzORoD0TzkpL/Qk7wRzHIMrPdShCaVy2wLuOA?=
 =?us-ascii?Q?A7lV9KWuCXcTrxZWrK5dmls1ZzEfDf8pxY9+B/kgs7Cdtstu+As769Fg+aYQ?=
 =?us-ascii?Q?blptYICT9umjt+Goef06z91aFRw+kfRbIuYF515p1KR1myRSLakmYoQSFwyt?=
 =?us-ascii?Q?vmBIo+dGSN/qlalZk3vTOMplwiWP//uT+uuNiCdaFG0DWypSHmRRg4XAdjBq?=
 =?us-ascii?Q?xQYpOG7Ww/y9o4yieqzOUq3frcT67EiwhUbdP4M59QEs3WbkgNuEz4tIna/6?=
 =?us-ascii?Q?BHSt2HMt6uWRlNUJJkTXM2GY/M+6qk+Vg6ixjuWu4a1IPxuFmtnvsTIIQDnv?=
 =?us-ascii?Q?1b7RSRyTFRw9uAxaVUGI8VINADZOk5jmFLqxX7T+JKENFrNIXFjLDvgdNiNR?=
 =?us-ascii?Q?UMD+U4zy2jZoDn5taR2IpznKtQj2dz+dg3RuSY1tHxt+IPcgK4VoxU4ygBZP?=
 =?us-ascii?Q?/svKY2d7glvylkQm2zU23k7NrE2OHSFbZT57+eNdNOOcnavt7RzuNCrUKVsH?=
 =?us-ascii?Q?4eCcleU6gCSm09hwJYjrvLEOAz+C8IwRxiwlcnOfcKpTY9Q7rTJCEeEA8r0H?=
 =?us-ascii?Q?wbHpoXkPzl1AgzEj1xuPkbK6DpghgGS5ol7DzwCn1nHKSofAjKy9uNjCLnsr?=
 =?us-ascii?Q?tcPdSNabywPPE0U/keKYIPasJgxbQq247DBHHjaA1jpXg+ICnRkgLKAKcWo1?=
 =?us-ascii?Q?8PXScJPDIfTkAF/2UNRmJ/YTSLlD52+VHjmeb0C6E2w+3E82HX5R5J6sfOyW?=
 =?us-ascii?Q?GaHJ1YjoWeqUFIxJdiOhOOXuCP3WujOQyWt77KZgB86opD2KT0JdPh9D7F7Q?=
 =?us-ascii?Q?1DUFdeEx8QIUmWW5ztJAUa829kLq5tDn7k4S3p34iTWXrzAygqDgYyR1tgLX?=
 =?us-ascii?Q?UZCRf61Mww1Z7VZAn+bC21bN670lrzZm2GmmyjL+1GRPkzDo/KNv0l2yRveT?=
 =?us-ascii?Q?vNFMsDL/JDtJo+/6w4aQ9bikQ7AIfswbNK5awZEZWp0kQm1wbA1VToAAqh0c?=
 =?us-ascii?Q?Ft9HxXw+mldaEge1qM1lTbKaJ1E13EQ8JGfcYf1UDeZV8hHGOjIagQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/NXP+D+AjpCoJdb3pvKfbRW6HKIFyncWvluZaovkePWdokkak5/zR8srf3Qx?=
 =?us-ascii?Q?4ezV7JhmMHf9y96RRxrSsIbHRoMWkNR0NEOdh8TOiWIkkxw9Doj9vLEMIVqp?=
 =?us-ascii?Q?XiRuV3zdSyWCgmMXIIgcsPaBGOqXaq5wpkRp/B22M78dnSGeTB6hK0udSSkN?=
 =?us-ascii?Q?DrTZrAEi+mD9Vr8QQYf6mkcycTHNNmU2MFE3AXwoLtA3cFjLqdlqU8QdD/MG?=
 =?us-ascii?Q?M4AVUOEbCXMrrWhwAxEb+puPMOsG4UgRbspcgfkMZSGT/VNzcNMQxC2On+lc?=
 =?us-ascii?Q?PWiv1qEt8pvhd/cv0et/fwJ+Pbg/9InkKnH0A/xF1zZptcwgEHGE222j3gH/?=
 =?us-ascii?Q?jIxwKl/ouDU0fquXCI9842i5ZB3aq6k+Kr9mSalmienthUxGDZ8ogceiVh0o?=
 =?us-ascii?Q?k3zhhhm0AhxsJU0j/qCq68Ap+Yx99DbijMs3TXhhbuiyzIroiu9V3Ukmw5ZM?=
 =?us-ascii?Q?MqxiV+qPmidhp0+ApeA4aQxHvbtNAs9PZK5IinBn51mDSULUqQusyDzDsOZs?=
 =?us-ascii?Q?BelXdYiHQm2Q55JVGKNtUTBVWWowaQFDEFCS/7+52FuYT17t4SPpeMIIhaMu?=
 =?us-ascii?Q?7sbdPVeJj8MxfAH98SwvxzPUq1qvz1APtBPYbYz2nZUJwNZEU9czk/wuyOSd?=
 =?us-ascii?Q?pzmiNRH7TJ1vxIObRU1ry/VGYfB2IgJOCaLTiiy4lFy/K3t5mXJqOh5oNFuI?=
 =?us-ascii?Q?JDo95rWrfjsuwKL8UAiDweVAQAoBtQOcCRdbihE5ad0WwOPr/DkCwALs6nYm?=
 =?us-ascii?Q?mx88eXkeQL6NwNa2lCKOABP+NsfXBS8LY9kifgE7RKllbA8mBGWC8oHWRarD?=
 =?us-ascii?Q?OIRAqEzkvOOblbjl+t1z/MmHYyaLqz1AeHu1b8vlR64uoThzC81wZOzMSP2+?=
 =?us-ascii?Q?CfhI4YeZ2NoINT/o6bnY6M0ga/LP/dCEGSWARmZ9cHxuISBua4SJBxZmv0ls?=
 =?us-ascii?Q?9xZ4M9oyyFHfI6jBkhmS7jeZym5nK6Tj+j1N9GBB3Z52Hvc3BiaHEq2D6c33?=
 =?us-ascii?Q?nh7mvfSD6+p8I4X5bWKDd2jd3V4km+vbD4YpLRhywOw6qUxs+uxWCSxm9jNI?=
 =?us-ascii?Q?DGwf41zKJzPOMl5hMHOhuSYdJ4pkWFK8j8jW4pbiX+P8j713OR6GEOJ/lXC2?=
 =?us-ascii?Q?SAUFn8nXr7CMCQx/I8TLl/j4f+DDeEMg3/jcXJ+7QT1amF4y9/jOiALjdzcL?=
 =?us-ascii?Q?NKOYmKUwMjTKI3ZAODSRbsOtUzWvh2jU4hKsbjY11uPOe2Osb0dp6yTD7uoP?=
 =?us-ascii?Q?BsysPLnMKw65pKSuhSkxJu5jADSk7qII0gig1be8YigeyH5tvazVkQPp8cwV?=
 =?us-ascii?Q?Wsis8iNYYp4JSxzEveJdmIZHbz/OxSwRIYcTOIEkrX3vctxjJ9vLxBj5y1vc?=
 =?us-ascii?Q?zXd3RWyIz307YdJw2U7JkL0ZYTKBUu2SlXyiURcl79BQu5NYfNHTWEijBkNW?=
 =?us-ascii?Q?awSZ4EN+oWyl5TZwLLhGfkF0bp3zAupBFPGO5BcmEs23z0PQaqE+Kwg8Zy4k?=
 =?us-ascii?Q?shazX/1R0KQ2OAtZkjF2guTRlJ8IFGn2O4Sg9IcyN/bsZNWsTam/NWYagF4G?=
 =?us-ascii?Q?nqMtYEUVdnQsHimARH2qIeDpnP3ubkEp9DKASVIm5tUax5UFhhvdT+nP4W5T?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5049b479-998c-497e-363c-08ddc2eab656
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:25:49.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7WimPuLHZSAVVfl7LfrLXbydiQ03A0kskgXxPg07guonTldjDzzVBPQwYEEb+TW2UerQvFJSCa/WYDrGQT/r1QfsdhSyAUbNY0dE8BzU6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082556_260644_08788A56 
X-CRM114-Status: UNSURE (   9.78  )
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

From: Mun Yew Tham <mun.yew.tham@altera.com>

Add support for Agilex5 compatible value.

Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 72b50f6d72f4..01dd0cf0923c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -515,6 +515,7 @@ static const struct socfpga_dwmac_ops socfpga_gen10_ops = {
 static const struct of_device_id socfpga_dwmac_match[] = {
 	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
 	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
+	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_gen10_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
-- 
2.49.0


