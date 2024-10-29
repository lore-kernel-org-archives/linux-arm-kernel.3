Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A39FD5B865
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 03:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsK8RHcCHOEefNR6ESl+IsHvCZiwF5QN16eBjVKfL24=; b=Na/ipH2iueXnvYubCg7jXnQ560
	YUd5e0yJfCcuQRJ8BrrQaG5vZhrg704Z5X9vEqckzUkbtm2X7mRPOZLzMFqa5qnXVtfcm3w/61cWo
	6j4MWnTUFb0fqPT2jQsl24V1MFWjGBK7YeBEw+eQIg/neetvhfHfX2fLIj6xBuwSHrbV3+Wd3DJOO
	BmVDakTPvRNjOdFpsN+rBCreVsEyxlVdQKSrk7J/sOTJitLWFmGqUVlcXMtHg8auabe2qByF/VxkI
	i5DFfsGjKSJik3B07PARrFVblSjaz6oEJRagzb30hKiWEeb0WzBwUHDxuNFkdsPYGgM1C8diK/RHq
	5gHkS+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cuz-0000000D5Z1-24p1;
	Tue, 29 Oct 2024 03:29:17 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ctM-0000000D5KP-4983
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 03:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOOol5/90XnX40BLmeTRVsn0KTiquJUiYfVpUiNxJWaQbLBZ5H36BZ5bISTTmdv2CHHhaSbtZ54M2dA1GAc+eq2K5u3I0SOtANPRLgOknBGJYxTN1UVnZ+0tV82AlczKXkmmsZNDpCzswJlPpnFxXGYZ0CjFPfjfOfIaDfmnfUcUheayBQPY2x3I42i8TgTJ4VSrtjJJvVyXAcuaODWg/U2p3OAfDfVV7iQ0bRWKn3DJPAH1bfNb+noVeIRC5KYgdOxnZhfBsiljhxgjYa8+1CJQplSApX9C4wnt0L6AfiyWfCZXBXt4gHKuzooKNu/0fliz6n/Y5ZzIIPoKNhoXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsK8RHcCHOEefNR6ESl+IsHvCZiwF5QN16eBjVKfL24=;
 b=UOWyYWRpvRTjExsLiFd7RsOwHQq0fpJQbzyUkwayfysHzBktJgBFQFsoIuiC2JEPwUQNV3lNoTh/xTEuSLZjDcNLxCH4PPcr/5k10C7+nzEwVIelviCWLuNSNTDYv+lfMmbosIFqiwkKqqEEMAQL2qe1g+EzeEkAwjwL294r4D4AHSctD4Zn2MJXUVVHQXlB+Np6x/lLFspmCa40YoAfTn/UBGa6dFiaoQRQkF9PzpX2aq4WSvRIfaMIu0y2FvH1BPyFjOlVOQAeTLfbjr9p8NkNrlc8/40BwGp3NWdgpMYUncwX2+kxj0uMjgdvtQEOL1PcbumAoTvZ/wOAUhyHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsK8RHcCHOEefNR6ESl+IsHvCZiwF5QN16eBjVKfL24=;
 b=eDA53SbOXZGp/ehEdWeGNVInhvJ4Db2L8nCHEiGb9EY98Og31ueWJ4QAVh8tyK1HYd2s0h8QQxmlKgYhsVbRLAyG13CxeZtG0zhPSp4N433yigcQ9+z7nLpIsOaYCAo1nEwwr0cyYcjK/HNhWuUxNNnAOze6V+IfvqnJ0Kj3X+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SA1PR01MB6734.prod.exchangelabs.com (2603:10b6:806:1a7::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.12; Tue, 29 Oct 2024 03:27:32 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%7]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 03:27:31 +0000
Date: Mon, 28 Oct 2024 20:27:27 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    Shuai Xue <xueshuai@linux.alibaba.com>, 
    Jing Zhang <renyu.zj@linux.alibaba.com>, 
    Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
In-Reply-To: <20241028173132.GC2871@willie-the-truck>
Message-ID: <722266ba-1572-2c2b-87d6-dc4f8ec9a274@os.amperecomputing.com>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com> <20241008231824.5102-3-ilkka@os.amperecomputing.com> <20241024113201.GA30270@willie-the-truck> <617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
 <20241028173132.GC2871@willie-the-truck>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: CH2PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:610:38::41) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SA1PR01MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f1cce4-0927-40f9-0548-08dcf7c99f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xu+i2WpvKaXRgpCJ07xoQxZZ62s/ECoZTCZQq9usL1OaUomOySAAvMdf7ren?=
 =?us-ascii?Q?Q0QfSMkhijk9Gy90wWE9BlopSXLehUIR+m61iRczaJUEcDBaZctEgfd3dc7z?=
 =?us-ascii?Q?OtgI/YE5RNPwD8PXvIHE10w5AdfwgE7pUehuc/s2dqNC0x5CmR5nvUcXRx84?=
 =?us-ascii?Q?ZAvu5STLwO5hnvQv28Twnnr0TSWgJpWftaVWXSiz1FO10gJ0URzQXSmvoLx2?=
 =?us-ascii?Q?+X/Z+EIvCwD3+UKsxDXVB9+gXeUQU/liJMamJBh/fZREXEm1bkC1NCaSBuyf?=
 =?us-ascii?Q?eb6sR29vjgWw+tIUSnhk+fHTegjDJwSZX+oXQJz3kihkhKPZp4+zJvPak/0G?=
 =?us-ascii?Q?VQQnS4/6TBjwZ+VnF59Zr245YuOIRsWUrtFbqMYy+rbi7n27q6RMuOnLefjn?=
 =?us-ascii?Q?vixEgNEZMIIkv/A9Ay7WTnh2DPx8H2eAM894hbiBXOhECjZKAD4bUQLnj1ry?=
 =?us-ascii?Q?x4/UcKkorUBARI8a37n5RS2PGsqL5oa+5+bIdMwXmrL1zPWPgaVIkiX0x3ha?=
 =?us-ascii?Q?VmaPQjrbvY3lelAoyck4haCIiOGzDOHP6RfOo6+R+8aqPZlOmCE5TAeciikn?=
 =?us-ascii?Q?Kh7/vn2pwol5oa+X/x7UtAuOe+CZRzT0L6bLV1ldhp7e09mM6lOs6D2dV1jR?=
 =?us-ascii?Q?ocSY8j26uACnNZa1yV0ZsrB7lHE8Mx71qXkolXRh6qHc7g2p/RSprDt5Isib?=
 =?us-ascii?Q?gw50zTTrJXnd9USOX9A4yaxhg1hXL+JifSJ5jf2rDHmAAwImSEg/E1SuiETn?=
 =?us-ascii?Q?V/z1rscwyHPzHVeJM2GfC1tbMpZp+V5AQkzDg0Ua9ocLnHdVi2SEsdnGmLoD?=
 =?us-ascii?Q?Q0JQlLo58PwLrj3cL8/VMqaBFjqCoOFOr0JhXcXZ9asCSu54YEX75ewZsQpI?=
 =?us-ascii?Q?7SVDhrYzryXkBDJiSemGHF3EcN6s3BbZ7xA8C3cunCxchEE2oQQ7CALPWU3w?=
 =?us-ascii?Q?xHHD086C5O9iheU+mckrvtlLy6or/fwJcV4mqlj7XqD4LwUriuNYa1Um6K1A?=
 =?us-ascii?Q?LchycsRV8Fp6ppUQAGiQVtnXWkWJ7QUEYHvt6EZcvwrQml9FzUM6qBxqqepP?=
 =?us-ascii?Q?1pRgssPR8+7G2w+jfqZ+9tTfdDMlOrHjCP7FQGWxWuIOvrM04ku70isFlSmj?=
 =?us-ascii?Q?OGSmw/rusn6n212GtRJc1WH5QybgHgH4tCTT25A2l1IkQvyPo4bgscRb4btl?=
 =?us-ascii?Q?xrpX+x3XeoL53qSwB/OyLqv+ryEA9HzZkI963UAilGD0qW5WxEj7XG36DG3L?=
 =?us-ascii?Q?APuds3Z0Zz3V1jlYcXaXMBXMJYZ9ozxBUBg6Wk2NHCL58NoJ+dfjkJ7S0Kxd?=
 =?us-ascii?Q?0z+BISFxl0IaPNCfbom5b1p3GI5tC6hHN+jpW5eHqndmyQzJiplnN26Z8dGg?=
 =?us-ascii?Q?U9+ve9U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZIiZqdc9MwnX4OBNlMBr/LJtkhkVbjyw308zpt1EoasrPKoAVLpm/H69omc?=
 =?us-ascii?Q?9iCogu4SxQmzypAeT7XIAY3W7H1LwUzHQvW74c5xpKW79S58sfC4xbF1pWPI?=
 =?us-ascii?Q?hIbZnkgxaTpXZc1ZTpWdlesHhvv2boPU+PEcazubOs8R7Bt/Mxoh6ZgUEfOu?=
 =?us-ascii?Q?V/V/JmhwffmiygoclVVbXTHzunSA4l2Xjzk3aF/0ftPlV0zkYYOqxS4syiCb?=
 =?us-ascii?Q?rW96CddYM0UQEiJ4Ra7yt7Sy04e7YumBq1Tah46ERez+AdoCK78By1xuIFXk?=
 =?us-ascii?Q?AAd/u5U/8QvT8vixjDnVjPRMlmaemoP7kjbRSKTfayH0m9outC0wIsZuefzR?=
 =?us-ascii?Q?oZOphjot5zmMWYcC1/NGo4pgvOj2ntgfkZtyXuUn3lW/shz+mQWXS/5a8jcr?=
 =?us-ascii?Q?y2iEhdAosunkCiX6hYqZj0sfUoccwGUgWPDZdzyGfZFZG5L+EvouIxGm1Sye?=
 =?us-ascii?Q?yaA3cB+wF1gag8eADKZrDsKUx/jc3BRv8nObZRvwqPskpga21BVijosZokTH?=
 =?us-ascii?Q?WjJL/Q5vVBO9tQKCqvxcOw1/9gUzH6cLY+lyuxz8sk6PtcPfQFuebKg+P1Ep?=
 =?us-ascii?Q?oy8GWfGBBl/HLJiduPwWN/X3q0wdRtQ4S3/w1moASQ/jtMFYhXof+71AIeAd?=
 =?us-ascii?Q?+w/JrSgjahCe8a6yZabJXzNEdxKivMVk+4W+RfzHltWwhyxWwxekL1GaPSZ4?=
 =?us-ascii?Q?51hhxItvg6511Bj6RhjhbRadzJQbZ6CxKGnPxItMaAiMbrpy17zY928kY65x?=
 =?us-ascii?Q?O2e1u6uG3p/WTdL7bYBKeJc2NU022QGeXoryxgecuMWJCEJe+0dZsZAlv60D?=
 =?us-ascii?Q?AqmWJupE2bFjjsPymX/14z0uqThNMx0T6HY4I9/9P2ZMsois/Fi9+dIxllJ1?=
 =?us-ascii?Q?IdMterwU1GwoU4JPXaFspo7Cyg+GyGmG68hG/EiWC430oD/nCRFjH29HH1/Z?=
 =?us-ascii?Q?7gTRAheDjyJgd42JUkZiufjce+sdsAdir7mKk0YPEFoITxW47o9Qbq4cw1W7?=
 =?us-ascii?Q?FQhW3DsHJNH52Zwyk5ZrhSjEAuhtR+VTx83duqCoA/mqDTyFxwNjSXsO8hYN?=
 =?us-ascii?Q?/n8J0/OtUKKnKC1hQx4Ttg3pUeLqK7gVUgFlqw4fcLp39LmtcC+6eWqxXfwR?=
 =?us-ascii?Q?InLPn98JAtMnv4XS9qjvVMGtTp+Yhav2fFaAe7FxQQwkINezNqNu9jb6w4hw?=
 =?us-ascii?Q?vbcDf9Wgl4xzPTDnseSkPfqg03GmnHhh8mdY2UIicAxOdTiU61NDFGmtLTrt?=
 =?us-ascii?Q?dtUMVeK8RkW2y4j+7Fx2qDOIFNIEiHyL0HlcQE6v3GyR8x0/KU5ExX+rgeVR?=
 =?us-ascii?Q?iFtMAHOpf6ZkPkjeZR3PDC25EYz0ANMxLZQ4vtgVPiZuo9WyXKtuU+0NRTTx?=
 =?us-ascii?Q?pDa1vfc9R4pA0BVhmPp76c/KgnkdBXweIKWeKtI2ga9nUZEInM+rdTok0J08?=
 =?us-ascii?Q?9dLETDkSO+mwwZ920guixypv8aiH7LjkdfF8PnN5H6cgD5M5nMNcceNtXuDs?=
 =?us-ascii?Q?3DqW1Ct+tMDzjkDwRxlJ0v/zI2WaWA5iVBRld9Nu7eP2GOiVj6YQDZS1iK07?=
 =?us-ascii?Q?sw6SdPQLuCGTz40kzwS1LmLlcjBGAdcy8l24krJfa5fwciJI8iH4kXP43g5d?=
 =?us-ascii?Q?GhGpLi1w3fjKgv4olECMwG4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f1cce4-0927-40f9-0548-08dcf7c99f5c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 03:27:31.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI+DMZM1p+5YL2WMUtUJMFO1VqCatUYY7I5I9oqePCMPs3ekDkY4s/Rlacod2dfUoZfVdktnR24wzD2nYFCjzzoY/jfrXPO9vGCXBjkKsw0JRh/oF+/1gKIbczkQkioA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_202737_384974_8167BCCC 
X-CRM114-Status: GOOD (  22.22  )
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


On Mon, 28 Oct 2024, Will Deacon wrote:
> On Thu, Oct 24, 2024 at 03:19:17PM -0700, Ilkka Koskinen wrote:
>>
>> Hi Will,
>>
>> On Thu, 24 Oct 2024, Will Deacon wrote:
>>> On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:
>>>> Load DesignWare PCIe PMU driver automatically if the system has a PCI
>>>> bridge by Ampere.
>>>>
>>>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>>>> ---
>>>>  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>>>> index 3581d916d851..d752168733cf 100644
>>>> --- a/drivers/perf/dwc_pcie_pmu.c
>>>> +++ b/drivers/perf/dwc_pcie_pmu.c
>>>> @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
>>>>  module_init(dwc_pcie_pmu_init);
>>>>  module_exit(dwc_pcie_pmu_exit);
>>>>
>>>> +static const struct pci_device_id dwc_pcie_pmu_table[] = {
>>>> +	{
>>>> +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
>>>> +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
>>>> +		.class_mask	= ~0,
>>>> +	},
>>>> +	{ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);
>>>
>>> Hmm, won't this only work if the driver is modular? Should we be calling
>>> pci_register_driver() for the builtin case?
>>
>> That would be the normal case indeed. However, this driver is quite
>> different: dwc_pcie_pmu_init() goes through all the pci devices looking for
>> root ports with the pmu capabilities. Moreover, the probe function isn't
>> bound to any specific vendor/class/device IDs. This patch simply makes sure
>> the driver is loaded and the init function gets called, if the driver was
>> built as module and ran on Ampere system.
>
> Ok, but that seems like the wrong approach, no? We end up with a weird
> list of vendors who want the thing to probe on their SoCs and, by
> omission, everybody not on the list doesn't want that behaviour.

Ideally, dwc pmu driver would claim the supported root ports but I think 
the PCIe driver is doing that. How about if we simply drop the auto 
loading patch and let users to manually load the driver as they have been 
doing so far?

Cheers, Ilkka

>
> Will
>

