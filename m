Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B4F105F798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TGQpx+AJllAdYpO+If5LgpzDRd1knbEJnsP2b/jmHxQ=; b=h3lcn4IXXevTVkmP10GaYgAR+E
	JFR42kOlp7gl2V2RmIKS805WxGZMxEqdgz63jQWBcid8iOW1EbC664UPTs1r6nDI03VzPmdKXqZVc
	fea7J0/r/dJVJnnrlKmp45BpKfxYh5ZLrb0YEjHsJLVkdOLVsBjxxGRGIgOH8q8fxOHSAPVRC2dek
	E3FzkmwGYiWxTAcRA/C2qoOHqEsjaNOnVJ0LiFuOGe2OHCOfsfMplQZkaCVlpL2rNi32Bk0ZmdBqW
	7DNjZs1+g24OV5s1JNHcOpMB5WrbBT9PrOnSuivaGStC43KZaBIlJ0rttlTuFZg1NRGtnd0Jo1eYn
	V2JY1FxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10DI-0000000HYeX-15vf;
	Fri, 13 Mar 2026 10:57:52 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10DF-0000000HYdX-0i2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:57:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrP6BSL+TlpZ65ZNPWdrXI5Npj175rj3GzU4v2tdrFEfZCeJ3u3Fc4qO79qeHWXWRecUhFER898rQcOLcJpuj0k+ao3jgX6nDEFOA41JS4S++kLm9+WfGiw+sMpa8UBN3U7XSVzis0nY8eUZJuqV565x4n7ezojhOIqnKh94hFyGdLKZElDX1GEdt1OFSQww6OHWv1YRSNalJqAAzQ+9nowitJkycujZTapdHGP6jqTfG5ri9wC7cntKMG5iCCa33GZ7Xkqua5DHCEEOtYOQORNZgykAhVde006FLCkVr5OqVE2U8dbm2+Y+/95b9lPzU0knQwcMt1p6rtfU/uTB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGQpx+AJllAdYpO+If5LgpzDRd1knbEJnsP2b/jmHxQ=;
 b=jLRcpSjGaGRa9wM9RDZNMAv2M5DyK71H1haqAkIAuf5o5ir+BValVvcISKH1iAJ+3+SYaJYRrqTKFUdxHpH1zi7TFGbrJXhQdLLAVR52//KG6GiGQTyzUvSkTP907CyelmKg1Sujx4rO5MzqPAixT3wRodnYoZJCM/2pCd+mPa6SHRZwLYFOW+1XakJc++yS2+Twfk3XGGseISTvhtNcJP3nvZuqBqyW/NnUtIbjzxhNo9CboIs66MdgoGGytO9cIOl2risVj6wN3RNPb8DbdThTfhdCHS5bFeLcVwSQngJsVuExINFye8gYOb/k1eC3j/vzKD0CvdjbHPth3gSvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGQpx+AJllAdYpO+If5LgpzDRd1knbEJnsP2b/jmHxQ=;
 b=mpmXzv0DkQfyrKa/Fp7Fzf5sRm7fj7VF/Am8aEgfVsHRVsL9UfGMHeWuYeRO+rxYalqDpEQ2ye+bntm5VQitw1/H4QfccKcfWByCEHXG6YMbYW4McSJfEaOuLSDBtiN2nN8aUKs2VpkAxlf7Pi0QolAb5PgN3wFb4ldd3kV/IrV0uj8gb/91fmcDGiHWbnGnyZLEWhB+BjwLCq5F9iJOVerUFwjhFbB6jdZXmkg2S+fjOGFlDa+YZwZ7GZt9v4m5kj3vOhnjuN7B7OBISDRFGuXCDpf1eWlu0GZSLcBYd0W18B29Ihj/ejVq2gHYTXXT+J/iSn1ZLZabU8EzH3hItA==
Received: from DB8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::29)
 by AM7PR10MB3159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 10:57:40 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::29) by DB8P191CA0019.outlook.office365.com
 (2603:10a6:10:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 10:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 10:57:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:59:54 +0100
Received: from localhost (10.48.87.194) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:57:38 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<antonio.borneo@foss.st.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Fixes for stmmac driver
Date: Fri, 13 Mar 2026 11:57:15 +0100
Message-ID: <20260313105718.359614-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|AM7PR10MB3159:EE_
X-MS-Office365-Filtering-Correlation-Id: a88ba5a4-722a-483d-4061-08de80ef57a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ln6eSKLWpkC6Xk6yVUZhcWlsu3PMSHb2SBCBGBesEthiUflMkW7u2ZNqh6c6t07VBDSNbkG66S5J5EniyYx0daoMyDHiBuV+wBnAq9lqc1+1R5A6SPCOcK8+JKCkpauCOeCd0me39NP2wIV1pNg7unC+Xg3C2PKEsDDE1KU6ApLwH3LepTMEk/XQMtislUcIzgARaC8dTvWOMlqACxDAF+x/qHd0qeGmCb+nGuBl2XXKVOKIFqspJpoTLGtdZoJurhqZ/cqr4ZsAq9Bvz1g7m7S74pituGR9/wM3AqAdasMgbvFisMWXeUlwB3Z+qrvQHVwNLa9Wv32niiSvYni8ATOLdDvxA00jSJk81EhE4F71AKnIVueZKvXSQIvfk78ZOc5NuuILO1CtUtIVEssVtkvIchdHQY2wdw09i/LyzhvRcogYnw4KBkfPNbyerfytJ6n9sh0XCjwOw2Hx5X2P89NAnzxTzT4DXHVIVevrgex3Ohei33O7X+Fz0rUS2yt7FmkcykJobm1gyUqg6M5y84htJy2FzhbnW6uZaKYbEoZfV9P3bcfynKRevbbk5MT/h2E9fxsDeQa44O5JfKGgVJdRYg5rJ7ZSwMs3l/TvIMjiUOWgc9NOjb8FBX4TYPBt9gif2TTgYaQNbkmbTOyRI597x0npiPdlHWiVEgpP+6GjiqgBUTCzIZcz8HR0kbNQBfNyuKIqShnIGxr8PHukq9ZT6y5sDxkv6NzVtVWGwSRK1Ry1APDUD5VJKie8upl0oANlOUeTzGzoSdI4Mwuks+KgRzICAwbZvR2YSF19nCt7j0ABHS1ZAbdY+2nGYKH5
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nOOcSDqhZdurerV5KiA1Cj19yUYeZZASr+rxZWp0WsEHwqGlrtsuTP7FFm6qa3GY3vl4H53oUk5MnnhwHRlTJ3K9IipRppADGtBx6jB+c2ANws4CWV4y27wKOHCebkJ2/dznyRfkhBJI9kqQ4ekJsWJIhvQ21vdhzOMLvvz6DgHFO5opVVIqeG1kJX8v2mRYetl274ungG/lLDcdm3RI6xiqJkFS/I2p6Dj3ma7RRHuzr8BTWbuwOYNjwgGZkOpu0mZcBtNxZawWibNhjqcXYS7dTbipoKxtjuyz9nvsgYTv9oGLJujn4pDu8pxPck3vrSH7QuFW7Igy1yvhksLQpvkFE0UMuQJ01uuPOcJL4YZAyVQ/dwcPSSH1fwMJbkBecTO87Y6k70zowTUBsmKRttt7r2OJ3Sta8sfSO4xkciduzv5cJfvoRh350kAuaL4u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:57:38.7989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88ba5a4-722a-483d-4061-08de80ef57a4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_035749_508271_EA0AF371 
X-CRM114-Status: UNSURE (   8.22  )
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

First commit fix error when :
1 - Deactivated eth0 (ip link set eth0 down)
2 - Perform low power procedure
3 - Reactivate eth0 (ip link set eth0 up)
=> eth0: stmmac_hw_setup: DMA engine initialization failed
         stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Hw setup failed

Second commit fix bad cleaning when error during stmmac_mdio_register.

V2: - put Reviewed-by from Russell for second commit.
    - update first commit with Russell'remark.
    - Dropped the third patch from v1. It requires additional work on the
      pinctrl framework to add a new state, and I don’t want this to
      block the other two patches.
      I do not intend to drop this change; I will follow up on it in a
      separate thread together with Antonio Borneo.

Christophe Roullier (2):
  net: stmmac: fix pinctrl management during suspend/resume
  net: stmmac: manage error case during stmmac_dvr_probe

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.43.0


