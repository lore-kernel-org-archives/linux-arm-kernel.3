Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958EED10388
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7Qd1LNUgVTgSHaMTtGXGoj8eJJOJsPH8NKg/0kvIJ4=; b=hNKIM7DnjMdPfu0q3qC6ok5fet
	CdudIkLwlUMhjkPR2ZqstgtMBQE7m7EGwZmymEKZ4G89ZSGae+3xUGdQgC9Odtw0QknmdD9uSIQs+
	Ecju89vjfmXUhjk+KxwON7F9oHo0/M2WxEDW2d++WFn/BroIgeHrWx1tgOFhFKED2HDWi8iU/TzNd
	uYqLmNLTiWF3ultWRdm5ZfK8u5zXvIH9UcFNE4hoI6t5pf5Q4VYjuBJP5NXBaD8ba7p/M9S8JHZIp
	LvPmMyd33hRd4fQYAoEsliVd/c21H9vU5enRM22Axi1fdq+WZ6D00lDWYZt/pKUsTEUaP1KCxmDK6
	jS9jt9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t46Ch-00000001whb-0PqI;
	Thu, 24 Oct 2024 22:21:15 +0000
Received: from mail-westusazlp170130003.outbound.protection.outlook.com ([2a01:111:f403:c000::3] helo=SJ2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46B5-00000001wJg-3qam
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:19:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNqZ8ZCViDnB0WibaHVYuYzEvtG/Kv91oFi/WOkmC2FvqrXi9zW/VH9mGMecmxTuMhbady3cFNHX2IL6JowIp0sCkhBth3KF1NjNYXayHHyEb3W/LuNRpweTvAU88L6uS+ARrHZtvwUM2BE7p2pzleup8yNqlZR5vjSylROqoz2ANOqNmbe8T1nCLqz9+mm8DHmvfa62LegCB+OiyDeWZZ5BPpOaEFc9U4Mx5T45cQRt8eyNMOkMwdUa2SBZts3vaAVRHdrJOgyhujj8RFpL0rLhH55K4NfrW3+a2wquEW7YUGwrSxMxaGJMwZYVLakj/9R9FuQxCtUc6xFX6lzY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Qd1LNUgVTgSHaMTtGXGoj8eJJOJsPH8NKg/0kvIJ4=;
 b=bX3/PWmfmjMfSd/47CTwH8IbeUTdC5jjKXLllWvxWmDKd1gNQSWSThPgG9YwtK+/DTXORASh/qAa9fU3rL2J6ut8a06NK4jUwN/xVXdRA9uHiOEKusw8o0o8owk5TPX1O97C2zhWqbFpkHcCjhAC4p4XmBvbnxReUOTnDGDcgiLMDIpLfqkVNARgLrZgLZzQkdL5D+Vshql/ul05OvKHUMfgBiDJQNqRtJe39uVENaIguQAjaZ3w3D8bBNe5/fNWwBO2v5yFeIthZ7rGYQwYnwq3TPTAbNn0Tz0N0wydTqPTcpYQs5RCxLIaNw/wxkQMWLxoO1Z+PEIRNo6l2X9VRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Qd1LNUgVTgSHaMTtGXGoj8eJJOJsPH8NKg/0kvIJ4=;
 b=l2AvqOVRpZ/tgQB0Fe/NPDiHjnmMCZchAD94aZ+5MJSbVACfYvQgRXi2RUXoxCQM3ePRF1T4AXyDdOR83oQD6VmOFqAzIhwbpgrX1wdZQnyufasQnXDiIiyNMhqcMxYzZNFk2uDnC2Uf3KdCgs0g6NColgJw5Bikh8smGi+LMr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 MW4PR01MB6402.prod.exchangelabs.com (2603:10b6:303:77::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.15; Thu, 24 Oct 2024 22:19:23 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%7]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 22:19:23 +0000
Date: Thu, 24 Oct 2024 15:19:17 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    Shuai Xue <xueshuai@linux.alibaba.com>, 
    Jing Zhang <renyu.zj@linux.alibaba.com>, 
    Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
In-Reply-To: <20241024113201.GA30270@willie-the-truck>
Message-ID: <617bffb7-9dee-6139-53d5-524ba03197f6@os.amperecomputing.com>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com> <20241008231824.5102-3-ilkka@os.amperecomputing.com> <20241024113201.GA30270@willie-the-truck>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: CY5PR13CA0011.namprd13.prod.outlook.com (2603:10b6:930::16)
 To MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|MW4PR01MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: dbaf6160-87e5-45ae-b44a-08dcf479e991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SdXaSQzu3dcZGLUy6ZudpSvHyutYabKaE4Sj09mTS2OanOLJOd7idjbFXoGI?=
 =?us-ascii?Q?ijAMsN8oJ7Oyknj5qTZ/r060kSdHXaX4szWYnZEcEwDxQzrHVvypKCttKl4S?=
 =?us-ascii?Q?3ZSOzlegmgzmO7C7XAblfnK1XBh1ea+Kco/ytczHqItWM87h+5ANNXHd8Phw?=
 =?us-ascii?Q?gAOeUYtRRICWElYKuxPOaYEfGYlJ0sCvW8bB2WkEH6nimxPTw6GZpsBgtdr1?=
 =?us-ascii?Q?OLuCSkTWj2tSb+PFmuZu0hmT0WQF7l+584CiFSen8Mvjdk7Cd3JbvjMCXlQd?=
 =?us-ascii?Q?xGSOeyJcbMAdyFGcbXZRoPIVs2rGQOj49nfqNijFvH6iNKP8fUdi6nuSvoAt?=
 =?us-ascii?Q?qP/pE4B17Uzrig7ZmGuB0GCDWn83iKejPlRpqt64Jl2UvF9DXKcZwZv0NUSa?=
 =?us-ascii?Q?ZA/9jd3nDXcUBHUQQ5BNK2Z0BVeEeE27Ij1Q113ru500keIAYG6V0bVk+0mW?=
 =?us-ascii?Q?JSDdMcrYBLgehOudmWec+bpiG5NYbBC0aVL/c21ngYeMgoIoSJzLCeHszJzP?=
 =?us-ascii?Q?m7PWRqXjptQjGaW1LF5XIo+0YkCchpCGTjiRqlLpwon95PN8/AHM+uv9qmMh?=
 =?us-ascii?Q?XMU4tP5ZJomFHaEs17ANoRSYag7eJnLHTlgA1wTSb/dFS1ajZMrHbkh4S4jh?=
 =?us-ascii?Q?/pqIdR6lb+IN6ER5rWiSwHk2+ZY6jpVgLVhwCq4NsQ4GupnCL+gR5dLtecEX?=
 =?us-ascii?Q?LKNe5Otfg3T1i8wuw15jrI458IUhSpqSYP8H5mS5QOwe/XL4czb0YRIqip9E?=
 =?us-ascii?Q?kTJDobU3EeSDBwPLEWTfDOq7TyrT8sh6WLs7WyiJ9N0nASdsqH7QTQp6eFyh?=
 =?us-ascii?Q?qfCXFmhZEntRHwfKkjG/4J2oKGmEon/DnUE8lnZ2D2PfWDnsxojbS0ZB3czz?=
 =?us-ascii?Q?J6BlT4VqXl3Kortfr56y/Lx5UKtRX1d9NjXVWXb1csBK5IlPzLZ5jwy+NpbL?=
 =?us-ascii?Q?hGdIZIt5UYMNUN3BYBbg5an2is5vLhJem8MAzxKA9GjtizCRqZPPmskAR3Xy?=
 =?us-ascii?Q?F3J3vM8S/1T+QhV8T59Yr0bpeAQDl9i6jzQD9sHHYlwwigLlJKSDlfYnSHrD?=
 =?us-ascii?Q?8TjupcT49CP0zXEKMBD7hEB0MFHlQjx8+LLJc9pnHqshYnnJ+goLG+w2NQ5w?=
 =?us-ascii?Q?NDr9t5aVTBX0HUVS+Gypyt1iYijgwrRSRpyPm3B+D7aNQNO5omE9rnXlbmrZ?=
 =?us-ascii?Q?xUbx9bGOW/97P2lofic2jBqWi0MrE+ql++OnBm3lHBhJO5T7Hdq/rZxBn+0w?=
 =?us-ascii?Q?Z2V3eRyVnuGfRdbJG2+PzqPCnqR4TJXXN1pqfH8KbT/URt+JZhCmmaAuGd1e?=
 =?us-ascii?Q?htLECEIMMF+FhxBvJobwm6CJ5CscoBVtUC5wErKOqHWgWDzGqOCTW1gkcnla?=
 =?us-ascii?Q?bgedhTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?copoHvF6eEBnop+u8QWQ/oq06i/vOn5cLel4Hqn9JltcRSsPLeZ4cyJrTbYz?=
 =?us-ascii?Q?Ct0MiDi2lEx6B7OP3T+D/BA8KxPPnCHCRhgbarqHAdwYdhwjCsHRjrE89443?=
 =?us-ascii?Q?waw0rx/r6fwGMeuKo8TEYBy30fKwXGqLpo4/7J9hsPVegfb9jb9e2CGG3GcS?=
 =?us-ascii?Q?AbUfMofPCTNbNmdLsTOczlURwOI7ByuxilkO7q+1RIEQUjgWJ//aB7PEXztH?=
 =?us-ascii?Q?TBNsXJzQS4hTxU+dsdQTiJzLcMA5qHFrdHPrfmLUKL4X8EQhUFQn8tKvkZlx?=
 =?us-ascii?Q?62b2XuqjipUSrviEWG2GB1m37PPh0YvXFm8e1VS+bydSgcGqd7VmxeGwix8e?=
 =?us-ascii?Q?aB9UA5/0SrkllTpa8DEfjwGENodwiBmu8v6B14oy3pkNWAoPU/OP8ZPHdNBx?=
 =?us-ascii?Q?O5XPBpSHfy74u/swhy3t7gwiEPkUQVEbBsIr2DGPEWc4idBHlXEO/MVl6lGS?=
 =?us-ascii?Q?1jyDpqbWex86EU4qLq0zJvIqDzq41++jBS2NjIO9ttpYKwSPI/NwuFvIWO9r?=
 =?us-ascii?Q?TtiNU9TmjI4W/Xxejjuc7F/6cK1fXZ7c2IibhhP2Kr9jqV8E2CaXw2nDq4j7?=
 =?us-ascii?Q?GWrA9vWLraW5Mje7ltXjoMcH0TwsL0uhv95X+xdR2X6YrRIigG8DDRE4MiHr?=
 =?us-ascii?Q?VZYVQbU7Vzb0Nym/J8//ScfMPkrf8lUlwRHFm6o07+6JMMcBSQLRhTXsXs9p?=
 =?us-ascii?Q?Dk1zQII7MPJldzvAljYFjZBF2GLYZnY5ptXu3VJNHZswFI9CilEpsaUBH3o0?=
 =?us-ascii?Q?8Rd9HlS6Zr4pNUMq8oim4Jgrp7/0NQdi9JMU0WRSVJ8W8mHJTpFbGCz5r2nw?=
 =?us-ascii?Q?ia8BCtXuuFzu2gPkDYMfuf8AopF0Je5Ls4Fs+s+dfYq+poCZWbsF3mGOMAk3?=
 =?us-ascii?Q?K6qcrHFOtI4k9oMg47GOhuXkS65MOYRIWPq4rwEa7ZwsZdg7Yj+SHhubZj7a?=
 =?us-ascii?Q?G7JPYrds2lR2a29aoY3w3yYcH+3g9Yr9tvG9ZF6ybCByjhFN4QiUylqE7hQ6?=
 =?us-ascii?Q?8HFBZLrWZU5mXXM0Q6hiA5RYLOBF49mo0C3dWbEAnUof++eByvtY1h82DAZi?=
 =?us-ascii?Q?HOHasPuyZfkKM9rxzFWremI8tqpBLWaSpaE/ub+LUtQdBrmLkwvM7/ftTPm4?=
 =?us-ascii?Q?Qein85I9ekb00+onqTYb610+O55aIVDUCtULqHn97CgzOKqf9Bm1Rd8fk8pX?=
 =?us-ascii?Q?2qG/8GUpURi0T5DU61/bmN/OgJIrXSArMqBkHFFFHRFYof3yVLOfOteauCCJ?=
 =?us-ascii?Q?b+lf1Qfcy1ld85RQWy2CqvczRBteXpfmRYAS8b0TvyBYJQdwhKQIzy11OVJm?=
 =?us-ascii?Q?pwMns2TxFOvAW/N3aR7bF4A8AWqYFoAbr+4JiV+kEDWE95Pzt1Zai3tQFafB?=
 =?us-ascii?Q?5gIbOqOOE8EMxVIonVpI8B9xArD9SlF0l9DTiYcAqkz0/lY/m64snLsvmjqS?=
 =?us-ascii?Q?pmylgENshsNSXl3SKeXXeMdtvx9uF/lf12uJyJUMBZlVEmV3SdenofipRypJ?=
 =?us-ascii?Q?KyKsDv550TaooQVYzgkVRjq9ZwkTZy8t8WV7cq+mSrUiLr4sxfxbZzQfNnzF?=
 =?us-ascii?Q?RkY6SqKH9jtYcoRN0ddvnBNckH62RFk10RHFBLw3pPPjhgfScGwS5dC6biSZ?=
 =?us-ascii?Q?a4NXHwzs3Fvj2GolU4hJKDg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbaf6160-87e5-45ae-b44a-08dcf479e991
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 22:19:23.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/MbmQVmP2U0Cg7FyQYsXHOzOUn39sCTQcxWTEjzrAaAawcp89ZASmnIdyfGDMcnO9vP7sWqTYegddQr8tmSDhwTZwomRy5e7CozGGvG+PW70kAbeBDwVXc4ZowK2Iko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_151935_992694_43EB6B12 
X-CRM114-Status: GOOD (  16.64  )
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


Hi Will,

On Thu, 24 Oct 2024, Will Deacon wrote:
> On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:
>> Load DesignWare PCIe PMU driver automatically if the system has a PCI
>> bridge by Ampere.
>>
>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>> ---
>>  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>> index 3581d916d851..d752168733cf 100644
>> --- a/drivers/perf/dwc_pcie_pmu.c
>> +++ b/drivers/perf/dwc_pcie_pmu.c
>> @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
>>  module_init(dwc_pcie_pmu_init);
>>  module_exit(dwc_pcie_pmu_exit);
>>
>> +static const struct pci_device_id dwc_pcie_pmu_table[] = {
>> +	{
>> +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
>> +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
>> +		.class_mask	= ~0,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);
>
> Hmm, won't this only work if the driver is modular? Should we be calling
> pci_register_driver() for the builtin case?

That would be the normal case indeed. However, this driver is quite 
different: dwc_pcie_pmu_init() goes through all the pci devices looking 
for root ports with the pmu capabilities. Moreover, the probe function 
isn't bound to any specific vendor/class/device IDs. This patch simply 
makes sure the driver is loaded and the init function gets called, if the 
driver was built as module and ran on Ampere system.

Cheers, Ilkka

>
> Will
>

