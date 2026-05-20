Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9B8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1J20+gZkBDYLgLO/Zj16KzsGulk0s5EUCVMweL77Q8=; b=Dws8mc2ELR994Zcwj35w3MWPuM
	ebjJJ2zK1ZSb/gIuJBg0I8Q3jrRtcOpmj/uKFTZ5d6zwLJYD5aysdatEE1wx9xW3Dput3CA4lFgWh
	2e/kZdz324AtgcQ0ty11I1AD2YlD3Nm4toguF2vPcToRj4FFESsYxi+yLs78eI4HKiFUQ6qcqbM1R
	FakCLPoiG33eVJwbc+GH+Akwnk09SHOdR7IFMire3lqO2MHFOx2+biL+QasrSG1CalHIBOZoKJLdO
	/55hPNZGy2ald/CS49Ad0ZhEGzUVIK4m0CtiZVFg2Wic1PW07Nj2g790jxs6fhbPcZc1rsTAnle+N
	a8dyAzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiNe-00000004tac-24jr;
	Wed, 20 May 2026 14:58:42 +0000
Received: from mail-westeuropeazon11011065.outbound.protection.outlook.com ([52.101.70.65] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiNc-00000004ta0-1oTm;
	Wed, 20 May 2026 14:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgTJKljgXaz4qyUebJFZs2rZN83pDNIybGJGrqrX9eIvr55bnkncf+D59MwHuHXMGRUCFhoOhBq8wL9bGX2Eu2Chh4Ft5hi0wu9MNT1SYox/KPWyIqA5IXcbGebFwmOuLRnhEfjpTwXjzcxHeHuW7vDNGapOCwAc3hM4i+slXpr3xMkMNBlg3+enUTnCNhlQ74sZWA/y9WjmsCnPhhxIXXkkXtaZ21gmU3II00CF6JpE7kuoUkoOZJparJtJM1YguPdrVZfMLYKyaGg7A07dtBo7obiOGlinUuAqZEdYWek76YnvT+Wm9FZwf3/1Bleu9ZOQ3RD55WwCyJnGxhyilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1J20+gZkBDYLgLO/Zj16KzsGulk0s5EUCVMweL77Q8=;
 b=MX+orgf7lfl47DV+csbD/l7LfrJ4LGmyj9F8TsXiV2ehXpYBWnyvc8NnHbk2KWrtTs2/KnsqdA7SXlGXvzpeGj2w6Jg/GbiYbD1sdTRldaEvTxyiPu+iTWxzze0Dr8ujHt+LE4unXEzHYo8LEfUIxNiF24zYhGYZ1xcOuV4KyNVOuIAsy+VvvyPbecdCh0pEsxze6Uh4Rn91u/7IrdCLmRtl75A0LeeLS7y7//Vnu2nCJ0FqMYrNQ8ZLbj9+UfSaQ0dwmhG78i0cyIYhFJM7PjMuGmUVW2meANlGA7PcS/D2AVnEtSI1qTAH/v/MQzvRRb97iHJFlxZKZ5ymGK27fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1J20+gZkBDYLgLO/Zj16KzsGulk0s5EUCVMweL77Q8=;
 b=Kr1dgDk6ojE+82R/D2Q1czXSOhtLcN621l22n8SKMC9Cdm6kW1lgHODPTFW15Hv+ObkDF9DBsAnGN/PBkxdKmZQlRaqBO2ajXohmrpnLWjR4CBRfzMsQRQqMafhrR3inwBYsPL2yCrma5XALTjR1wd4VKDKHAHHQTmzsd+W5F5w=
Received: from DB7PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:10:36::29)
 by VI0PR02MB10926.eurprd02.prod.outlook.com (2603:10a6:800:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:58:31 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::53) by DB7PR05CA0016.outlook.office365.com
 (2603:10a6:10:36::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 14:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 14:58:31 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 16:58:30 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <pnd7bx2j2pi.a.out@axis.com> (Waqar Hameed's message of "Fri, 10
	Oct 2025 15:39:21 +0200")
References: <pnd34a6m7tc.a.out@axis.com> <pnd7bx2j2pi.a.out@axis.com>
User-Agent: a.out
Date: Wed, 20 May 2026 16:58:30 +0200
Message-ID: <pndjysynn55.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|VI0PR02MB10926:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a12f89-a002-4e26-8df3-08deb68041ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|13003099007|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: HKx1eaA/WtVrHZQJJq+nUH2DNZyxZH8H3lWfQOTawXl27fCqOn7iBMfC+Bsl6Rm69JTeP6un0H0qaJd5w29ajy6kgTJ5BbEI/jdEEWbDqSeGy4bgM4+nHnGBlwP3PrljgtL4GjRNC93A/S4YcVlDUcjfSr9BMC7RR9e44O25NZ/v8ypq5P2jFN6oUyesp5fBfyLiKMyHmx3NuCaT2YGiBFoxOt1o7Q97J31Rk2AmL9Pn8CYBmjZ+f+qvTh8pQGqbme+5xLcWesJDSA3af+BWsgvR/RCBg95x7aRhm9jyeIHEw6Irp4Z/iCCmx/4fDUofiBprsqrazdV01oD0n7eGRFGWE9Q1Vgb4sSg4y9UBt0gsEHm1ZaXGvbN2IXRd/EYJ/dv2YuFCqRkYSYUeXmfSuUJeLPBKcQI1Os6w6lMQ5yIxNBwtI8AGHl0SQZYwVrT2PO2/FhcsH2eJ5fNmv1kfo+9mWGl+XJaQwRJxmyOg7KYnpKsDI0CiXCCGcQjpEejU6VBGHL3ZzeSYjGQDhdU+RHuuK/ROvDjlwEsVxULxNpcXtSjaAWEn2+Fj5cxpIWncwuXYdVJIahKuXk/yl5JOMoOLgY7/627LFwzh2ktSQfbvVMWNJmaK6Q/AbXZERVqVmMDf3NosGL55D6uWWg2QvWPXTukrx3gqjSgdsBG4ma+mXPJPzmla1k7qqWIlMZ31
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lloo1ct/3C/DhQx8m2uDzJK1hKE+3HxlkHjTCWjQyHVdrBEWopJZJaRoMoc5IFNaL3UuppGpNvdm36XGuX+R0r951UIXBFmKVCp1jMF5S+MqXxyYeGvHh92/EjtTSUoN1JOg+HMzM3HB+2PHZfK9Rnvn9JZER2uBCOp+Bu/qW+p38RUCVWwCYoY9j2RFEnNX1/isasZmpgGonTHt/PqA2+FD8rXUSDyu7x41zruLp3CBOfaqj/UUzJ5Dj5gtJM9wy0/2V6xiLA8t4wntNswCXmCHveP/Ucvy+OLTgysN9aHzxWORVLo/JxVqaSaTjxpSz+oQWnWdjnuVVu6/LbnwYfW59OcaGazlRaunQTA0vIY9rVkC27DpZerEDPclFPUG+KO4k6oj97NsOTfTFB6KUzW+nRCaGv58h9HiCH4cRW7vSyl1qpDLLglKcWrNpH1y
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:58:31.0858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a12f89-a002-4e26-8df3-08deb68041ed
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_075840_475486_1D4065F6 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, Oct 10, 2025 at 15:39 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

> On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

[...]

> Friendly ping incoming!

Friendly ping 2 incoming!

This will be the last ping for the original patch [1]. I'll interpret
the silence as a NACK (though it would preferable to get an explicit
one...). All other patches in the previous patch series has been merged
[2].

[1] https://lore.kernel.org/all/pnd34a6m7tc.a.out@axis.com/
[2] https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

