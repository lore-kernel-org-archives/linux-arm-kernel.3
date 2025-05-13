Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A28CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8VCkCR/IApHyk9BqCXUUXLqrQa1jsH2d7AbUh9eYbY=; b=xspayzjvOqI1T8dV6HHyrf1epY
	Oe4zzRUhO3qhWdh8KCVg3fNNJNsLSAXVohj89WHyVnmb0LL+kAL7dkoz9fG0ba4GZ1guqX9vTXtC5
	Tebf9JM8OqM/odZ+hL+jsTQtnWEPrHtUX9DY/j1j712OZxt77aLZAAYKsPA+F+gQZl9/v0vm940nW
	MkgaRjW23R5FOS83C6XLgo6FzvW6owMlMbp+wS8hDdJmkD49/YxgWdiP5uzjXjNR1m18/c0EV4rrv
	ATnfUGwdQxYg7NivbjohgX/XZwq+uaoeyCQr3+gSeHthperSM3pT7FZ//JIo1C5tJjnwMkkThvMhN
	7N9bh1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvPu-0000000DO0L-16aN;
	Tue, 13 May 2025 19:35:54 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEv1S-0000000DL4L-2mSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 19:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jsh4v5l1gUDUzYrFTNWSJ7ex9ZptlOqL6jL4gJFBPADNP5pF/c9leRjCYsV6kKdYzUi/mEP/1g1wPow1EhabUzH4CaUqDp5wkcJn8RH3Eu6On+1P1RsPoyTSE966XR90NQ+8N7FqKjE2xhBw2qTDzsM/FjQqPk6RfJ7288CI6GKuKwt9+UK/bemyIjAmNlIX2qyQA7jdEscUkBFCYqDqTWJVmhi8gUi41ghUMmgtOdRkYhTHL0GoIrzNAA2sU5mhT/4pkuR2nze4Oz1VvJAydJQOcmT15kT39H6hGDDfDG4Tu/Ht4R+JFqY3i/lSkUJlzvAC8gYxmUbdpnxc6jteww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8VCkCR/IApHyk9BqCXUUXLqrQa1jsH2d7AbUh9eYbY=;
 b=bbW8Yoks0rPofMs1L0DFhlHIQVjtOh66S8vXLeGO4KbIpuz8tjg5tTzMXZAuA0TtcKEQOtne4l+ko+xe4jXxJ2h3Q4wqvjQaTHqB3EHPJlHeyFh+fEAQCOQ/fzrnjTaFCFWtlZ14dytuXRK2erN9l70xyjl5LOsSKG/n3Rn88X7wscT0GbekibYxtOZvvteJL2kOvzfZsWvt1c8kd7EeZmQpRZH85p+3RyNC57B5GWFqDmFufg6qt3REw8qZK4NENx6W87stS40m4Mdwtl1N0omdu5Xpu2xWe747uh4PYWC4ylc2moJrrq7ICo8u1+jJ/2rqcIZurWbO9OKhlx8EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8VCkCR/IApHyk9BqCXUUXLqrQa1jsH2d7AbUh9eYbY=;
 b=IzXFL8BykO4b/xZrYhh2QAmLjcx0qi5UmkBKCUZcQG4IkQhtz7SMyfKKSCBERkWkK/AwcxS4o6KUDXhPos8SksFqIfzKSJpmshUCFp0XNG7KFdW/03XM6xJXQelLlVIKwk9h2k75xsyrykF/5vpeo7BKeg9Qd3CBotUKQ+OAHFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 MW4PR01MB6130.prod.exchangelabs.com (2603:10b6:303:75::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Tue, 13 May 2025 19:10:33 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 19:10:33 +0000
Date: Tue, 13 May 2025 12:10:29 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Robin Murphy <robin.murphy@arm.com>
cc: will@kernel.org, mark.rutland@arm.com, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Initialise cmn->cpu earlier
In-Reply-To: <b12fccba6b5b4d2674944f59e4daad91cd63420b.1747069914.git.robin.murphy@arm.com>
Message-ID: <6e3c1f7a-ec87-d135-bee-1470da25a8fd@os.amperecomputing.com>
References: <b12fccba6b5b4d2674944f59e4daad91cd63420b.1747069914.git.robin.murphy@arm.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|MW4PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe76e0f-215a-45d4-1e96-08dd9251d57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VMBDimJKkLa7zokLz9az9QnS5nLIVXfOKlMQvnq/UZpc1ReZBqoI6jgrgHO7?=
 =?us-ascii?Q?/YLRRUBOzaEOdmAoodIdREQ2p8ijRsYHGm0ED5KuPd6hHQbWWACA/ixpDBez?=
 =?us-ascii?Q?mO3LRRwL0DQG1w/tLZFNzaPWxCokV76HSLISmvEP4FCez3hmgUl2NKNWXXaK?=
 =?us-ascii?Q?5PhF1VEfuu+1KJfSpgBB7yUIcpLCymYz426x+5DHqcSqybm5wuMyV7Ww0CSb?=
 =?us-ascii?Q?ipBgOa0D7gVI+esMFVI+y7pjVKTxqeeyaDSW2ufq1uOlt8CLWmRdgg46KayE?=
 =?us-ascii?Q?ay2XJMQ+qJpp0hupRJ/nw7YB/y6879qTSDwVou/pv8V9crXfZ9URvglV8J9n?=
 =?us-ascii?Q?XlIXXRkjATGI4xTVLxHG0Ndnq8r9bUrmNqlIxHJzQ5DsQQxyQDMtXq5bt69t?=
 =?us-ascii?Q?WJeGnjrYJ81Z7LvFetLNa8B2OpRcDmBLlDOFk2Sy6CJxbwZrC5hysUuWsq8y?=
 =?us-ascii?Q?jWNPWKB6wT2p7Crxv801y4j7Gjxjc1A/xYJK1b738dR4DjeIHi6/RRA1Ab2L?=
 =?us-ascii?Q?3i+IbkWalDr5+fm65+sv4rYBpMfWh5UTfMdNq94xS/CpYugpgvLbREMRHpfP?=
 =?us-ascii?Q?3Oxs4mdc6zRmlBGmziOcR4XMpwR2TEN7qVX0tltXqAM9jl9lmJa9W/JBrAPw?=
 =?us-ascii?Q?/LiLoH5fuv30MyrAouOrBOBcN6Xek9YCtMZF1ocvli6Qxvl9dvE5PXQUdmSA?=
 =?us-ascii?Q?vVp0nCaEdRUP/KWVzFroVABXCGV5Zk2KXY4IA1kuMbwP91n9JMZC0FjpqoYK?=
 =?us-ascii?Q?bf77UQTbgw5NUscY77RK2XqYjjrEq4qRQncoyC5JKK2yIPvB5ygVZwWiZngv?=
 =?us-ascii?Q?010isN8OJHR4m6XJtcwMvVJVbBq9PvWv+lzq0KBRBjSxGO4S7FPN8bwL/hKr?=
 =?us-ascii?Q?KIhzkfKAoVHBhCGK8I8zvydw8e6SGdIbHpGWYP4RG/fqO/ESVxiprBssgcXb?=
 =?us-ascii?Q?oTBSL6njdv5cDc+6T3Re1ZeJEVTPlO0zUomATpNcjUokPSeZeVYcG9fh9dz3?=
 =?us-ascii?Q?EDCjU96Ty6tNrS0suXnreovI+2l4dOxlzlWv7vXEogaohDacsEals7HenDSx?=
 =?us-ascii?Q?hGRgmWs5YPNig1VXqwgEWNzn1QZ6AqWUkKHeI+c1DujWOUUSjRBpZlTj2Z7u?=
 =?us-ascii?Q?C/EDyMb7oY3CrcyqYPT6ln1qPeL4r04uafLuEvxo5jJfRlDbBu6oYcew3k8l?=
 =?us-ascii?Q?0sXhm/8zYzlbOlMIlc8aAuB4ck+NqhvZMdhcmJJPyacqWUnqlfZYNwRseqtI?=
 =?us-ascii?Q?Fmvmhgs4tcRIDgXdTmDdpPGg5cs8GG6ZuoqWN0ja/F9giX13VOZT8D32tSou?=
 =?us-ascii?Q?EX+lzl9Z2kHMMoX3vD5L+bjA4sv/9maQuYmE2TvrSDFyjjWBU7d0HKp2KVwV?=
 =?us-ascii?Q?9D1K+zts1CuEK/1L5L4k/FycaT85ibhCt0sb/BKvC2FZ4oliEFm3vvQkwJlv?=
 =?us-ascii?Q?4ceVslZAvucq0wmRoVGchN6ly3apfA6EmWXukciXeJyuthjFwo/hVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fwvwS9ubZJ512NE//EVkXSeK7Qs7WdlkF5nbr54vUYVsC3Zpy4RxWOCGNdpV?=
 =?us-ascii?Q?0IIcuf3b1Kn5+gA6GT9RCtSMM/FS9lmOU6986H5QYH8Fj80udKt6Aa0zEEGH?=
 =?us-ascii?Q?YVvH2Cn4Un2fKCcUnKkp3379bSrG/KIWC8JlrPYmGqBqDhsfxezN7GzQmJw5?=
 =?us-ascii?Q?OyJ6bA0GPonJskDh5hG9A+EJWQ+VkZpGCWuknC8AJKAu8K3hkK5VMRvCKDUK?=
 =?us-ascii?Q?AlWzt+npFwjGzuJIYDV/rgXPFvehcBffM4bNMSC3aqPVMS/SnM0ag4FF6STv?=
 =?us-ascii?Q?RiYwhYuH+jhilQoC8qmvZrkwW4USHQ6GDR/JHo3oKCI4fVHJN/sAhukrF2KS?=
 =?us-ascii?Q?CVGtZlBQk1aMqUPya2ttnmfIVgi55/a5vkSVZUdKLvypZ1RPbw1pF8av5H2c?=
 =?us-ascii?Q?F57gP+MNOxGkA3Uintj2A/lAzVytBVaMC/2Ny6MF29iTWd47lYFHcTtXe/2W?=
 =?us-ascii?Q?S75R9N999Jba/bjXNHV7qSbcNmjrt1kX7z7ElAJrSxRY9WFtqwthNbm2b35A?=
 =?us-ascii?Q?2j1VoDRkuB77pMOsXO35CrV3eWiqzxsfuxWzHGrZ1U8rLUSprV3lz2Iswgdn?=
 =?us-ascii?Q?qvFqtFkdyjuT3qOMjfguMYUserwC2PBlAvhXHjdbQdHnAZ+AKs9kocvXUPoJ?=
 =?us-ascii?Q?33BT46uKsulGeLpuHcUj5C2RXtexpJjqWst7H4aielUhCEDmg47TTozc6iDR?=
 =?us-ascii?Q?qYkkSqtAwJwR3hZJg9uD+ELALrH3TrOWki6jsWecumuRBEb8y2h/SezTlDqA?=
 =?us-ascii?Q?Axz5I9By1FYKeAYaUblHu8JwDsXS4YiIolvG5eYPnUD/HG6Sp/wdNFtiftnW?=
 =?us-ascii?Q?pHV6vAIpY1M0/N2W9my/Uoc4g8BdtCEYsK30DBj8JIglYuuhz/4hfxkmuUqT?=
 =?us-ascii?Q?N8ZgcM6mXj9QfOXmzQ/wGbbRA1LIuV0cR4Qf75ENHIjVGDPGkqvLX2ZTHGNy?=
 =?us-ascii?Q?FZLwprkNfXYpzeRfZ8oDkAyxZkJjZwFRxe9vFHLAkYY7OfHlwC4DuJP7v6PQ?=
 =?us-ascii?Q?mbxWrI/9OTuIUmmcz/7UwH85lxxtpzVfSxU3JNyOAN1KrDtEmCFHqvlWS1R3?=
 =?us-ascii?Q?ch7bIQozNCVGjX76eL16JDl2Ti9xlRZ6WVMwjWUNUSAdyaVw2GrekNaDXPGJ?=
 =?us-ascii?Q?hGer1yv8bSkd3D5Xg6ipse5A99OFg01atc4Md9lZVjmLqtxmXf/63IAOvVSV?=
 =?us-ascii?Q?BtTPvs/W6w6yLlRXwQcnBIu83nMOkQ5DLQlaC+dHuLXoAHQgGfU+niYn8o68?=
 =?us-ascii?Q?05OFq9xkTGjdZLysq/LrjXA9y0/k1Hih3LRqEk4rF7zkc7rmZxDkU0OGsBNK?=
 =?us-ascii?Q?tPBYfUs9xBLmHRtTXfVWHP51S3ogSxCACDxGwKd6GlQNc3pcEnxFeNb8ZSyJ?=
 =?us-ascii?Q?3vknn6wNSwaCD/4v7weEZYzbiB6c5ori9DsrOJApzYedUXN7sNbX61IAkR78?=
 =?us-ascii?Q?wd5YnazwQxqDvqy8WRIyNfCo9pcW/AceAKUG7ER37mJWjCv1vr45kd1oZqjp?=
 =?us-ascii?Q?7LwLAdNG56S/tLNvl8FWNp9nbrkF4ojcxy4O2+AreWFtRAHljrB6GYTZOa67?=
 =?us-ascii?Q?0L33eVp/71ssbqtjMVGaJAJ6QoXRW6a4FgjohNNIumFWA1NtAl0wOaHOotQO?=
 =?us-ascii?Q?5oM413J5YxPEI+9NwRyO+3Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe76e0f-215a-45d4-1e96-08dd9251d57c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 19:10:33.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGNIhi2wuGcqteGKytOOiMZBl+xf+UKs1iR1jX9DofsawcmsaYuf6oCKMsJJwE5dGGiav5X+NIJqK9py/78RtTSWGmGRIVcNYfUKWmKG4EaFvObdWonAEe6d/XKQNmgG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_121038_708882_52E53070 
X-CRM114-Status: GOOD (  14.64  )
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



On Mon, 12 May 2025, Robin Murphy wrote:
> For all the complexity of handling affinity for CPU hotplug, what we've
> apparently managed to overlook is that arm_cmn_init_irqs() has in fact
> always been setting the *initial* affinity of all IRQs to CPU 0, not the
> CPU we subsequently choose for event scheduling. Oh dear.
>
> Cc: stable@vger.kernel.org
> Fixes: 0ba64770a2f2 ("perf: Add Arm CMN-600 PMU driver")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Good catch.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm-cmn.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index aa2908313558..e385f187a084 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2558,6 +2558,7 @@ static int arm_cmn_probe(struct platform_device *pdev)
>
> 	cmn->dev = &pdev->dev;
> 	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
> +	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
> 	platform_set_drvdata(pdev, cmn);
>
> 	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
> @@ -2585,7 +2586,6 @@ static int arm_cmn_probe(struct platform_device *pdev)
> 	if (err)
> 		return err;
>
> -	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
> 	cmn->pmu = (struct pmu) {
> 		.module = THIS_MODULE,
> 		.parent = cmn->dev,
> -- 
> 2.39.2.101.g768bb238c484.dirty
>
>
>

