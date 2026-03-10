Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F36EEA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7COihU5U/wEICzhZ+ziyUbFf7yA3W4i8HZqKn9Kmtbw=; b=xd9/tl0+J0LLyEtJYPbQNK3WXz
	+uUCqMrs2N295xVnzajmrBWTUzONUrIH0q3r2teonoRM6sGzmGXIEna8Z0fa/GNpVZjtvYQtx7Q59
	Rk4SgEDxODF34dLFggIttihGbcczOBLozBDF9+Fi24Prks6C3F98GxovDagheUlSFfSgQDmLxLOhS
	3dbSuDX0tbNujLezd8vE0ZOVlbHOVr6BPguGTcoOM6SIBchYZx5aEdihF1kmxex4HUlErIX5kotJa
	0BIoP0/pKL6zByodCv3kapSQf1PUbXcah07KtIcpD1xhVPFHgvMSh1lm4TWBbeSjd8SaQo/XI5JqJ
	Eh9sj9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt0g-000000091kW-3wuY;
	Tue, 10 Mar 2026 09:04:14 +0000
Received: from mail-westeuropeazon11010071.outbound.protection.outlook.com ([52.101.69.71] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt0a-000000091jD-3KXk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp03U7UJ7CSwnD9rHaTmr4RoDr6yzxEs9Ic2q481C3V4z1IawLDJDeiy1x2R/JqgkPlu2ocuAAJxLPjRgohkM9l2y7TH9n2b/1y7epimBdGe6eVEW4edEHFFEF7hvJ2mBrDcXiMRsdfLfKaaAhhb7YhVywHH8a+WDCQUDUXKHPpZtBPjzpOo3N4w2ZERF9kp/gIdQ4cyHsb79sSdGNLmfS/cbo7cddgwUferkhCr9Rzb3y9VTqxUl1Jk11EIYvPEyrKjFOncYkiPJqOPS/9PlB74oV4qnOJUnV/CDa8slzWkz4gp2OFL4FWKcd244yz0yUZ4UZjKtbck1R08yK5kVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7COihU5U/wEICzhZ+ziyUbFf7yA3W4i8HZqKn9Kmtbw=;
 b=dnXdmDttF1YKmw79Mm8MD53/BtyxYLR25SyTvb7wI7w0UwhOFl++8mkHIq3+npjtsEi5cvY0RbxZiWOZzjxxNuVBvEgS0t5w2FOgzfApAHuBQ85X3swNQ8oaun4pqY5Se/GAA3o6QYXUms9k9ivWy1WQI10eTO/1jJJs2HdCQqVC80Mz6LQvPBA9D7m4O/OtBgKlcP+C5qToHc1brfT30F+zTF0GR6r9EJBjsdRqHziP1ztwVFUvQWNJgBTa8EQItM8a63rnHf1CVq9dwMDwTW4LIrnEa2B5qW+FDsi19ffSeC/IzEs6Lpzzq4FaFDkTfGWw5B5FvhunJHoG780KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7COihU5U/wEICzhZ+ziyUbFf7yA3W4i8HZqKn9Kmtbw=;
 b=F4C/mEYCxFPTwasl8n4XPm5qFJbaiLa0xmhDMFj1kH3giIbktAPSp490kKQg8ULycOxu4dWJ2LJpYJBWYiQgpWjXkm+Ukor24PtYPmTQQPBn5VYovwZX0ZwNVuML9nvkOP29XD8OJ6rHeHCgwzZvm1XFrdEkx1z4JpuqYHxp+N6/+uU+z6RUUN5HoUI+bYrQRKwEN0RxGGeuABYhwW2L3LHFTLUFEOA9u/5XffjqJJZjwlvvvkueMb1DpN3kRDoRXdOYbpROw8ExOhbH2IwQUxnOlNTBMerOmFNugl1rU741eY9uiqH9q3HIoUtD9yjOE7Maxg6cb/a5tiTOs/d1Jw==
Received: from DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) by DUZPR10MB8189.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:04:04 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::9f) by DUZPR01CA0031.outlook.office365.com
 (2603:10a6:10:468::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:04:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:06:31 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:02 +0100
Message-ID: <ffbfbbc5-96d0-4ae8-acad-c9c8fb6e0171@foss.st.com>
Date: Tue, 10 Mar 2026 10:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: rifsc: fix RIF configuration check for peripherals
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260129-fix_cid_check_rifsc-v1-1-ef280ccf764d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260129-fix_cid_check_rifsc-v1-1-ef280ccf764d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|DUZPR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: d393117d-9c14-4287-ab30-08de7e83fa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: 0VSrOrmLwm1r/sHHAFQGVUYKrtYSfhH3pVaSALI5zsCamNp+4Gk8k+lKGItjej+RW48isxrhhJGYZtPE783TP04d3CQPNyFaAJH2plizcuj6Y0O2tx6U5BfH3bdQxZ2iqwLaUNPnPogomPYdxgiIMObo2hapqUxelebU1pstEgLLu1m5DLfT61C3Fcb9JSZ5oZWRwsTXOk9k0ZW6pGmtKzTNWyBQdtAy2hzBcBNtFq2U1UW/Kmz7pVPeLQdQt3tHVurGJ4MqSgP43KLUWSkObYTQJrYtDbbTYnWPxnCk4+Jg5jAdUciF4qfVzNdRY0TO9EoK+nY+DARNqShFuoxySjvysg0bET5Eqt8xnGnZbLilrjz2xAAgpJwtgn/Ac58TaciZQ9s5//ImOhyq9al0cOKTQEnTLpgHTI0sNVI37+A1viamriN/jvQ3IFkh1DGDMJcGjKvJMTWJcpaiPCizKTpSJKWjkxqo1WbTTA0K7VyUA0ddOTmt87RxQtW7vZsTwDuz+R5FNn6vUQN6+sVKuz1RI2mVOa8J0RLIlcaJjrs2ayBTv543jKUfNSCNiNrU9P/7NGJR+2nHPF8SgnENXpenznBwOHqZsLjVAqnRMY67LQwPAvXr90K6CG91prRlZ3xrUHTWOre8yfNuJK+UOCFiZXTXSmeWtIpBxN6+s+ghtkAp8o3PuBfmTZFmaHT3Pe7GChq3blOujgGs1gDJ9TPE3YrJprsirX0aYskM5jmQZNWEytHP4YnosM4nIgjd1Oo2FDk4Iu2foBh0x5ODPQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9NnFgJp5ddc9B7rNtwLhshFN1OBwjPOyzVKacTpy0CMzt6RxgNxNmHB91Fao76NystXDTpDwXVnGW8g0dDwL5NJbX3WZTvC04DBcDPXNyoR3AJCikfAo20tZTwsxxB4bJjBF/gQxJDf+2I16fLaaD/zdMTqCStMJx5aDpdI6hBBNrCokodw4fmoR4nPl6ouk7RhOY4bI5Vur4oduTwGQ2bGpJJDeOH/0krEBIyw9Bjde/2nNXmVPKmPBkhaqqM6U6f/xJtPZQt/2dw0I87L6DAP3+saSv5FMukw3LE2R8mzuvWkQWKDxIgtIvDpSNTyZynpV7vQuIN3Ue299uYJGMfu26pM246van/5wzU+q5bqQxltgumt3jJ8P1QnaFEf/azihxUqSOJ9wC/OQe4CHwmXcYHwT+/KKjZPf0ATXgYGdkOt9LgTnzn6oJqlziWdP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:04:03.8615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d393117d-9c14-4287-ab30-08de7e83fa6c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020408_837968_3F564852 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi Gatien

On 1/29/26 13:56, Gatien Chevallier wrote:
> Peripheral holding CID0 cannot be accessed, remove this completely
> incorrect check. While there, fix  and simplify the semaphore checking
> that should be performed when the CID filtering is enabled.
> 
> Fixes: a18208457253 ("bus: rifsc: introduce RIFSC firewall controller driver")
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/bus/stm32_rifsc.c | 52 ++++++++++++++++-------------------------------
>   1 file changed, 18 insertions(+), 34 deletions(-)
> 

Applied on stm32-next.

Regards
Alex


