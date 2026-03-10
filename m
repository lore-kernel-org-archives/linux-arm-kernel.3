Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39CFCC9DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/svA6IGRLKASuUEwjnwPJ0miVfqOkKMn0p/AqU9+mg=; b=roCnAOJHf99H2O8/ru57LrUhjX
	kdIyBvUOmrLsymfLRPQw+ohmmX6wKeuJ43nt0fuCr274sqdxhsQW5Iy4zRLa4sq2ttuuwayGkQWpA
	KJgCsZ4+kZ3TTTb8jGoYmpeGlR4qrl4bPWnWR2PZrP6cP9cJAiGTna3N3wrtMDDbvJKE3u5XpwpnF
	BVSHUVHfBCVggAyNWRRdWGQoquzp8CvBUDGyK8D/V6t3z71Ge/MjSeMetXn+0GGYGYWPZzK+SIAA/
	VzUDnp2gq/NeEr/GFhkC1nnloPiDzb2kzkx6YhTmK2+xnM2c+hZn+G+0mRJl4XcOZ33aA1uvbu++s
	rkeiVZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzszT-000000091QP-118p;
	Tue, 10 Mar 2026 09:02:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzszN-000000091NW-0n8Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOEBDf1karVss/wl0UnqNqU7t70nc0AzLNOS/Op0h7R7kfYqj2vHugYjbre63/kjq34sZwbagJGHgWHrcJk3pYsAkLOU/GsFR3Qo+3Er/+MiD7QkdJFLGtUdlg5cVjE0bAdvu/CpSuFm5eNjS4miuTqho9/5cK060HLa1QiY9ZoGGLf5wqGoZh2h+Jb/r4X+13+ZMBytyDKcj12gA4IHWbh+2RWXOaAgbrpYj0zLdu4qSXtnxuFDRHJ3ophTepWnUaHUF7SA7YpeF9jK2FZg6jtQhxkA7Fe76m6pSNGIQwrtjjugeFVvXLhhpd6Xwjzl3xPWYrq7okt+h6u5vJXkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/svA6IGRLKASuUEwjnwPJ0miVfqOkKMn0p/AqU9+mg=;
 b=RyWRwIw/y9c/e5wL/0zVIXw9uQg09p7sMBG92CTs9M3pvo1+k1fmIpKPO8YXmpNUifcOdrUsihXlhhq+mlIa0Miy2t4SOaBDTcrYRSaCPY6nmkuPlNtoLlnhhPElRF+7ON/mrpENZS95smDHI1YyWgT8HnOGOMBZ5FSLpfHFhxdcAZgVKuX3S6QO27se4j6X84o7DWjPkaCiXHJP7Dj1Q+6K1PxcM2B65GMdovERFreWRGZtAcxFBcDM9qO5DZrPhi52q4M+8b3r+tHBZMMnabNKwXSoYVwhtDq8a8CmSA7GPb2+zyC3NeTNJzh+3npPTUWEfBT8O/+w/EBIjXCDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/svA6IGRLKASuUEwjnwPJ0miVfqOkKMn0p/AqU9+mg=;
 b=dy45BwoxuPhiYzgOWSARtLUuCxvJMTybv7raExfCP/9Bpsk1uupRLAY3UfHwx7oUpyjQQ6u5rJkE+bawldJ8uyo5lsmalTM1zHPfAhzLjlUn+NQzEVj9uisc5cpHkT16pRs6H502+EXcP9hkl1jZuEAPQzi+swyDoNnGTgkCIFGT64MjH/ptSwrZ32Pt1nZsl5f4brXqCssFrx80UlgB6ua8U3ZDm3IY+jMLCbMBIt2NYF68lh5a3CrpnLA4AdIrw4L1IH1UoPzzUVo0zfzxul02yuvJh4VTl2UmOcB2CkiL964SbV4uT/F4DQsVm+XrBCW6Tl0Cc+6fIlPcrQUJyA==
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by PAVPR10MB7467.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2f6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:02:45 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::a8) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:02:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:58 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:02:43 +0100
Message-ID: <188cdc72-f35d-457b-b9b2-3bca4d25a527@foss.st.com>
Date: Tue, 10 Mar 2026 10:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] bus: firewall: move stm32_firewall header file in
 include folder
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Gatien
 Chevallier" <gatien.chevallier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|PAVPR10MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cad05c-e224-417e-6f68-08de7e83cb2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: sWW5/zD/oIxo0PDgUObdPIrpknaeuvEsc/Mr8ejdGftnHHGEJ8plFNuL6BMExdl66p6MjzHCt4HMlxwETSTCfqt5HAe4bLDgcWeFu+SB949T6DF38fAYAN4F0XZ90WZsRt5sgQBskKtRfTqoWAvVtNdfMDiyaUnAys0HypCqlNihv4EEvewNbndePBaCEYFs8oave5dvwN0ecNNnvsM5+/poLi7MY7TPeOOcjbVp5iKDL+V+2hlsTjjGNX8QFcp1fvWkZA7CMG87xmv493H9uKNKLBHnSVeqMaCtubsiLLfXH5E5yIis1smf+hQKnXJcwRME8WEu/Ewiqj3wwIuG976hZKTubF5sF4esC9ncedwnNM/yBeEHlqxwLQMtb9edV73SU5M7oeATLi08ZXWk59+LsVM+duO2w9Bj5Cn/SrtoRm9VeUp4DIw9+R0iVbLVLF5UANM37fV4Zoj5ue8R+MkS9V3xdRrFmLyCCIYmk09bw7tDdx0xx5c2x2T02bDf2Z2dPUDzksITECBP16PvJqwNX5guNAwLh7E+OfaNth7KRiy2aeap9nPzmgs1ASIulsrNJdoGsIOAw15Z7p6RtWStOiWZPVjqVou6f4FhI8/+a7Yhs9pizPwp0glUIiLwr5SCO6IBa3ZSX66H0pSUMFHEthtqhuVVmoNz087QE7xxKttV7wEGMdEQsmVLO3q6KrzQ6oh3frsHcV8/ZLmI81ggxkN3OZoPvl0+JbwjJEnYGjfwjnyFGVAVjax2s6WC+jUFtD+a0bCb2E1XgkXYU+2DFGjXCfoMk4ETj0EEICw=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1DvJqWgQzX8jidzaTpbzctnDsoFAKfvobc9OPAsCqGELkZzpeXKv+zTKh7XduWmQu45fEGESkxOo+5VkKUbo+29wSsS9d8dw/1Uo7yvZkMRpWGFbAgtfJilDjYUPbhw5XzOV230Zyp7TnQLlp1nsRqfKeBQd5MZqkkwG6Jqb+xHtqGOKKqjpXKggdsFSPt7QvWzj1sSm+Jrqt/iLhlHQfe/TYw2mRPTW9M18z4rvYzYnL/tLLHx4X9iDcgWatsfjhf+OZM7ETcN+Coc2HCR/dSV1vET9m/toZOZuYUwy4FcjX5rTgIluc3cVnxbVUQvA3UGTApP1RlBaY4mKFXx3Bh+B7iWFc9ysCxr+5FWBaAdY8CvaUqfX4NDp72lJ4gJal4D0eKVZRgM0LSijhuajsGI+LmxO0jz4Dcm7ZIrhutqDWOcLSpuCjVLNtwPL+JJM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:02:44.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cad05c-e224-417e-6f68-08de7e83cb2c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020253_228160_65E6E024 
X-CRM114-Status: GOOD (  13.23  )
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

Dear Clément

On 2/10/26 20:05, Clément Le Goffic wrote:
> From: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> Other driver than RIFSC and ETZPC can implement firewall ops, such as
> RCC.
> In order for them to have access to the ops and type of this framework,
> we need to get the `stm32_firewall.h` file in the include/ folder.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> Changes in v8:
> - Rebase on v6.19.0
> - Use uppercase for peripheral name in commit message.
> - Link to v7: https://lore.kernel.org/r/20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com
> 
> The v7 is a subset of the v6 and other prior versions, splited to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com/
> ---
>   drivers/bus/stm32_etzpc.c                       | 3 +--
>   drivers/bus/stm32_firewall.c                    | 3 +--
>   drivers/bus/stm32_rifsc.c                       | 3 +--
>   {drivers => include/linux}/bus/stm32_firewall.h | 0
>   4 files changed, 3 insertions(+), 6 deletions(-)
> 

Applied on stm32-next.

Regards
Alex

