Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BBCC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLOgvh2f183Dul+9MjhnShmgCj7KgqChu7uBiFlZxys=; b=BooW/q6+JXITKfdM7PoMkRRPGl
	2qx9dxfqxaalXJKB2n006y9I8Ag3byLbS70c4gzam86hxlgBjD6f01gGFHoH+fJaGIQyJiMdmEhzt
	61eNVogpLF0mVNF5sdbX0IE/fSr/9/h1u0hGcVl49L4RJ3Vs7CUo7L67GraK1CDDuFE48k8GHugNc
	SwmrnnmQ5DAIKXzAg5wXU3Xq0tAgPa7dF4zZ8hqDo1mcbVRqk3z0uWRjmYdVaojcX8lh3qDqT+5Mp
	dbJdaaqlGt3utns+Lo+N10R4PLl9y0vQ85elFosglpNjaF9pKZlQu08gp+tyPQA/+Z1zgrB2HInYd
	oZaUhl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilxx-0000000DQz4-41nY;
	Fri, 14 Feb 2025 03:02:09 +0000
Received: from mail-db5eur02on20600.outbound.protection.outlook.com ([2a01:111:f403:2608::600] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilf6-0000000DNqu-04Cl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb27ZuYmrn8jv+3UciFz7rzFAs19DgjAG4GjFYXMByAEfDNErFkeSC71y/baygWpmCS5PEcb1c+KiVH35e3oMsfcOgRKyWs7zcOLKb4/Tv2sjYYO4EZGajAmVoh7XqfUdr4pq3devg9SadAsYGVpXHrr0xnsv3ALChfn3nSempdpWRWGOzsscvYNrrEsNoBomyMASW6S85dlKndlrv9GoXYxJM2w7AoQQ4GB5x45aj3rar6TVfDFJzdr8okemuB2Zsfhb7WP8pRHv2N5zsjoClFcDWRkBuPAHzWCDwkiMsKO8MR4LyVBKRzC+LGDTuI6AhSHJwHxAlXIyJKOP5+CQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLOgvh2f183Dul+9MjhnShmgCj7KgqChu7uBiFlZxys=;
 b=qzH7W3BnWCqpVVwunDb0Wk/8cGrBjM268Rdsiml4dt6tV7xdQ7qNKboUbl15Ni2smEdaG1yMf94DzNsknDL3WGkMTCMhd0b4tkaeaNPYMhURISmHUc7pjgwkIUCxkHRypAg6Vp1wAKJgeUQMcKjt6FIqdFI/G+FezEloX8Uwkw8k9212ZrzcFqbhNJWvHMS/loYoi3RWnTvFPSSfIsEHhpPq/m2rVxcX/5yvtB3mbbYB+lOoaKSKkSdHLDY5XqEhiNhb2TteYxyaSo6f8Oo3naaZLOFqOF81E96YrQ8OptQ57ktJ8N5+gI/3P8nS35x83Ua5NlgwrUWYAD3TvnUdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLOgvh2f183Dul+9MjhnShmgCj7KgqChu7uBiFlZxys=;
 b=q11aI39eAdCnobfwbrrHlxWiUHMtzqukb0WswJzyJA61SG1SCwFXtDBSUZCre20Z9r4HyyQegf4lD5vqcN0wrEk0OzISP4539MxEye/IJICTPiWOJZn/k62IbO2zszzq1oNFqp62QB287nGZIuILzoQGMCmEVLPKWg9e2hsMfnio+yV8VT3FCPRkcczheb3q6aaff2kPhIa9BhQvfRj1s7yePELfq3c6wd4E3oXC3UTZ7cdh6hQByCqmZyZUWijBav5RDC9F6zRj+Zk2AsD6RBAbBr0qAijWig9PdvBQFznomIo7Gz6V2pC2MhdF4WEy9BHPZ4/YKFcFKiE81vC//w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10318.eurprd04.prod.outlook.com (2603:10a6:800:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 02:42:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 02:42:30 +0000
Date: Fri, 14 Feb 2025 11:49:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	marex@denx.de, Peng Fan <peng.fan@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH V3] soc: imx8m: Unregister cpufreq and soc dev in cleanup
 path
Message-ID: <20250214034923.GA20275@localhost.localdomain>
References: <20241219145029.1776006-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219145029.1776006-1-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca0f65f-ca6f-484b-6176-08dd4ca139c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4e4iIT6HzNmO9bNFcJC4RWlCJCbslUDiiW+IsaBhcu2M5/SGK4ed9NpG0GGy?=
 =?us-ascii?Q?nRomV/550SqfKKBKd8GXn152WDCNoB0z9q56lP+labkGprPQlWWvg1mcH3ay?=
 =?us-ascii?Q?lWO9fyFH6UVTpxbq1mEid80AhzTCjPdGWPB21ny+gitag0CBYWTYyMBNbrpR?=
 =?us-ascii?Q?W0ZHJEdjk7sKAJoq5sNigkJvpuO+nSDmIZydvscZGy6EFckSPDSs6UD0yOtp?=
 =?us-ascii?Q?jtO3FgT4wzJmIrMaaP0saJhx6RodMZUREeNEL0hcPzjHNaAgMbt0s5qu/SdL?=
 =?us-ascii?Q?ce5HPI1LTMsUBb6JJv7eUbkYvkNboJZsgzIB0KuGL5W9ALJetcZxYR2kFvUj?=
 =?us-ascii?Q?Z5JlqplFm0yw+tqfliGvqVNQAETxmRd3VqMohEkV9scGvT4/lCT289S7VWKF?=
 =?us-ascii?Q?5zXUoDpyfw6J8av/8AuoZZDneT7vaRClq6vovJjkq94bb6RWgkU+5qeifzPv?=
 =?us-ascii?Q?ktAX0YJE3NjihfulAsBAVaeYM/t4enWvYxw5smPf8XWsHBW3Ur8FfjqNS4Vn?=
 =?us-ascii?Q?ddMyofQ595Hmi5cUVh9LRa2q4JpQ6x9JQIWlVx5fop7kUXqAZYDXbc04hWz6?=
 =?us-ascii?Q?7wq7l5l0aVV+5D9U4lY053hkymgogJ4HoMlnt1cJMVPCfcqHh+ZqwDEPlHqs?=
 =?us-ascii?Q?OIVcxgn66VJN9bZGphS3z3zBH8w2EeV8hq14Uw8wOydOChuce6tIR4T6I9j8?=
 =?us-ascii?Q?AnbZaXr2CrzSLcw3dgp85KAOEmaBvs2uDFbasAIcX4rTtJg8gXOJKIARysRO?=
 =?us-ascii?Q?fcXihzaXFMwCG3gZbZjlyotX4qTjCG/hIE5Z50k8bNZ2Yw6yBGPJ+PPmbmkc?=
 =?us-ascii?Q?4u4XwXGVxez0sFtn2/Rw08hfFqDzSDF/FpuG4Q1bSailxdZV558uJdvlD1kU?=
 =?us-ascii?Q?UMYKkWgB5hB4CjowTh6VmWQ7dicM9gWZRc2DqwiHwRWNXolrXT216DhfyZ2S?=
 =?us-ascii?Q?sU/RuNBDwdJbsKxePJbTiC/NJLe1l1kt5oyjgjRnnI6GkvHw3V66h5WGagSx?=
 =?us-ascii?Q?sj7uWUsSyUVN7QMZ7tJ9ZoHL+M2djkbt1mQnPri5mf5x35EHAzG/GMv+OUvZ?=
 =?us-ascii?Q?MON8JbPiNimOJXnhELzyGeDFbpjDoDeIK3v5IV9clYXzyJgio5kpyNql5tTU?=
 =?us-ascii?Q?EmLPjRePS29gpItSskJhaJkmSnGkCyw6KkkoOs36083PUG0OThm3VOKXtcZz?=
 =?us-ascii?Q?fa91zEeYXgrWi3poR5k/RRe67OyJnVq6fLUkfiwdWDsBv/5rokFITWCa1gm5?=
 =?us-ascii?Q?mWsvue81IoKcmAaq4mnR6Q6EHPxjcCilKxBdWp/JX3JJs5SOzXbnlQQj6Oa/?=
 =?us-ascii?Q?ZakLImLr4pCViqLL0JU2RGi0Fdq50TEIATX1xFTU24WwokmYuku7bM+Mv4VF?=
 =?us-ascii?Q?Tt9xHTOnO4AHEgaDLtq8u318AmNxEI83M8rOggMcm9nSPgRt0v2FDh6Cdu4D?=
 =?us-ascii?Q?0jcbeC1e2QBMJFfBb/ylN5O08por1v0o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D2ImlMQnlm5SUs7FhDDdHuqFHEeIlgbGuyJ9QlsA74nBx40B/fDOvpBLJ+Vf?=
 =?us-ascii?Q?AELYhZtqnOswe74wr/bL6R1AVlHBBTARyZJZa5azxnC5fKqShM2f527fneFS?=
 =?us-ascii?Q?mmOu20XuMu+vRPiVvzMEOE8dnIDrI1WiSk21uCtLozP6+bn9hP2RRfp6ffMd?=
 =?us-ascii?Q?nssYhLYOmjAmAyF84XUrcyhRap39RS74bXoBUYKX2LhtWv8ZHTr6ZlrR09hu?=
 =?us-ascii?Q?FZ7vy6TuLTEhJ2AbtlKESBmAr46sYWebYmEFNuAr8zUVymFPIIztXJdLUq4E?=
 =?us-ascii?Q?i+73t+xNrOwwFDrmlcAkHKSyq71nM5vgFynRn03EH/kVapP/30kUVffZU9j7?=
 =?us-ascii?Q?yiVDYpTg1hRMF7Yxr1T4OY1UjS3X/1cR4JbI5p37LlMNxPyLVDbbro3JZPMf?=
 =?us-ascii?Q?NpZhG45vijcxpBiEX70zfBFLcfF5ROYPM+uhWZZSCJa/vq2xLk0RLwz9leLa?=
 =?us-ascii?Q?6jOv7O3V9Syn8X50TB3qlMRzRCU5yGtOaa9VUH7pOmDHcB4Pn4hPTbbTz+3T?=
 =?us-ascii?Q?hD5iZ3Gg0C2kvdKx70aUEZvPzpp9eJwQ8CrFZsvUrGK3o0awreFxFEyv61zp?=
 =?us-ascii?Q?4ZEknwdk1c/45iM2Y7AzsVXa7bYAdJgK4fGDId3ANwxn2x0yFp4VcSlhta86?=
 =?us-ascii?Q?OqNQP/DmAjGwuaXGbyiIADAHNYfHH39rzDief+Kd/EdQrLI37AblNDh0TdW8?=
 =?us-ascii?Q?c8gBrvXEjK5T1YTMXXQZBK9HguGSj+MgCHz3JzObtN1E7yvMNMRww0unpHF1?=
 =?us-ascii?Q?I95jyXfH7eWvhd2wYKlJZniYsyudGHK54vgsjFFVr6Inzhn4eyA3V1mMij3N?=
 =?us-ascii?Q?N7iKykL2omwJwzu6mlZo2EMQTao9GeShwR/gf/kOcBPtdpf3z63x2faJKhyD?=
 =?us-ascii?Q?I5kJc8kk3Pqgba5UkPyHNtWNEFwuYkv0LCr8K8gvKYcXFoxFY9saPRrwzKF0?=
 =?us-ascii?Q?nHckR80Cax047klF3/gumY3/eZ9I14994+Jt7q9qYqnXrFLX9b33OXwwYMRb?=
 =?us-ascii?Q?x45Lfkbcz/BIJUft9GMiasqT0NP7LAk7oldTSFZXQAPT8106eKncUdw6dMDH?=
 =?us-ascii?Q?sB7qV1+MOua3LUfS7k7fXtr16ueE5TlqnEFC90VncwaUU/Eq6DWCwfsYne/8?=
 =?us-ascii?Q?vEulJGJe7vSSre3RtRpY6n2NhtXgqmnmPYIC7r3EBZLP85OsgL+QQyFke7s0?=
 =?us-ascii?Q?6TWVoEoWPDyf2jfP9xDFUQhDWwOj7dtD+rBKu6g4qrnKI1VDVjB7qx24AdeC?=
 =?us-ascii?Q?VIihAKsMQl6eGPP5Y/5gqMNPQa0bWwaJZBY5nn5+Out6Uc3AOiAkVAJUFq+f?=
 =?us-ascii?Q?tfhUimxeD/YeubD+8a9W7+YXk9xgoFOP803pGdiMF5F/baL/aM++BDQDsC78?=
 =?us-ascii?Q?LDB48XT/7ATzQIgRozM38sAC+uY42r5VWdBXzmXQZveZ9+QrnptnR/0n7Cgr?=
 =?us-ascii?Q?fyBB/5s8ap5Swp3gTHYp1JZrs0VxWlvBjmZ5YhLOxM4OqhoF+3S0zsxrmorn?=
 =?us-ascii?Q?VlW3eF9iU14kQPDybuAmXEzL8qLDrrOXxfZmY1gWVGzntdT6BnSITwAmM/MM?=
 =?us-ascii?Q?lYTawEbqChhqfLztDdrUTnJU4fXvjlOj90x9N1Bw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca0f65f-ca6f-484b-6176-08dd4ca139c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 02:42:30.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc2QqnnmWMgGUAZ9fhgm9d09rju8QnKoe7n3AWY6h7426peH6nACIoU7TcCXAI6SSTFJ+gYOWpx9OngggDFzEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_184240_072294_3CBBD666 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Shawn,

On Thu, Dec 19, 2024 at 10:50:29PM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>Unregister the cpufreq device and soc device when resource unwinding,
>otherwise there will be warning when do removing test:
>sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
>Hardware name: NXP i.MX8MPlus EVK board (DT)
>
>Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
>Cc: Marco Felsch <m.felsch@pengutronix.de>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---

Any comments?

Thanks,
Peng

>
>V3:
> Per Marco, drop remove function, use devm_add_action and update the patch
> title accordingly.
>
>V2:
> Add err check when create the cpufreq platform device
> https://lore.kernel.org/all/20241217015826.1374497-1-peng.fan@oss.nxp.com/
>
> drivers/soc/imx/soc-imx8m.c | 23 +++++++++++++++++++++--
> 1 file changed, 21 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
>index 8ac7658e3d52..585631b7ae44 100644
>--- a/drivers/soc/imx/soc-imx8m.c
>+++ b/drivers/soc/imx/soc-imx8m.c
>@@ -192,9 +192,20 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
> 	devm_kasprintf((dev), GFP_KERNEL, "%d.%d", ((soc_rev) >> 4) & 0xf, (soc_rev) & 0xf) : \
> 	"unknown"
> 
>+static void imx8m_unregister_soc(void *data)
>+{
>+	soc_device_unregister(data);
>+}
>+
>+static void imx8m_unregister_cpufreq(void *data)
>+{
>+	platform_device_unregister(data);
>+}
>+
> static int imx8m_soc_probe(struct platform_device *pdev)
> {
> 	struct soc_device_attribute *soc_dev_attr;
>+	struct platform_device *cpufreq_dev;
> 	const struct imx8_soc_data *data;
> 	struct device *dev = &pdev->dev;
> 	const struct of_device_id *id;
>@@ -239,11 +250,19 @@ static int imx8m_soc_probe(struct platform_device *pdev)
> 	if (IS_ERR(soc_dev))
> 		return PTR_ERR(soc_dev);
> 
>+	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
>+	if (ret)
>+		return ret;
>+
> 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
> 		soc_dev_attr->revision);
> 
>-	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
>-		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
>+	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
>+		cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
>+		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
>+		if (ret)
>+			return ret;
>+	}
> 
> 	return 0;
> }
>-- 
>2.37.1
>
>

