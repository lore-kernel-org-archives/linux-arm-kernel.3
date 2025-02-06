Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07677C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf+MyN8ZQw+esGt53IV2wlGaZGf+hJkbEyhsO4S3xxE=; b=25ZGmCfMBD/ks6fV4hMzYqm/nA
	dOjz4agvs/qtOAVoxYzQfayvBrWrIbAVChQ18fv0sOJW1oy1gt+ihKrF8l0rAh6O+vAc7uog47c02
	CZ/ZdjXb6hAIM9E9fAF/uZNriZUyloK14uejaxxACnYwTYK9fWi6zlgyEuTAN7A6qIPKhVPgfttZw
	S+N/ge+wXGxpVurcfnCptG8dMIPcPCSUJTDsdLrV6yg62IoCiUdKmd4WNERz/cfpqzLFEmNoxULb1
	dZ+kKnkju+M7TBdJZGY+gdqRJyjVhU2iquA1hxG1Wy3HUvyQhEQfDZtCpehJmH4tHegsu05hNP6pE
	oSkpotmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyTc-00000005t4i-1ncV;
	Thu, 06 Feb 2025 09:47:16 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfySF-00000005sp8-0i58
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBuWmPtenxWCYXrslbzVF5ESGwfH7u+GNMKHqN3fCYzDZJKzHr4B5M9k32nyOfpeWbkFmAFgua+ox7jN8Syo9JO7vYTS/CTXyZnSNT1iVGjUpKjEqwIRg+H75MSpDvgNjhJKr+ybOypvHHWvAv9OR/SyxkQJwewaImx9DKEZ4JHhLRKUlatMc942sh3Ugdoez1z+Fv985p8/mAJZYG2TVU6bAV0HvRfpzwNzLzFS1kWX66MiL4HFxDzF+yQf2Im168GLn2WoCR4a3rVirn8FYBO57Wm+hUA/fZd7JoJYimCA154RyFhmSsAlaKdKkFIU5Pv/kpBugo2FEuXR5bTuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf+MyN8ZQw+esGt53IV2wlGaZGf+hJkbEyhsO4S3xxE=;
 b=KMGFnXM8P8SZ9sPYLah0j/VRHMr75JFSzZZJaFCMFP66PuBzY3sRHx2LdONCRcQgdtZjBbOVkCjz2ZVHyJ8sDJM9wYSQdG2vopwS7G0vDeQAhppMxctg44fKtShPU3qLMIbEeo+cwCluyXRiYlSwM5eTyvjJB0p6ivfovhw2oQWOXb39ESAYU/ylaxXL9kUaoA4YljXIQJY1Ys1pp1LfIkSC/nw6GKhXT5NxIie1BJW41t3luxs+4KIgE/C+rpReTtBLA+mQGTgtEu0O3ZmBxMXRcfFCqhoNOlR1uX6wXgpdeV7ethfxMnyIle1w8rGK9viLHECM49IAupJ+XwNSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf+MyN8ZQw+esGt53IV2wlGaZGf+hJkbEyhsO4S3xxE=;
 b=LoyIx2nhL//LYDBDwUj2ao1dESSNkIclJV9Wb1QWf2GNuiIgQolx5CC8KRHmeWmYhralbrdR5ZfobjIkVNMk7uVqiD82vqZt6AOCbowTOPB5XtdtRVxEiwrFd7IiY9SrViF8lFUbSs8mQvLBXjiSsndVE5d30w0dRXk78Bg9kUGbTGak6hqh3jQuIMFLOW1iPA51eeys5nO14Z4+GubsVry/xR4+47pEQmWB8qNSUdVxO/jNDfKSSdd8vy3W6oV+kGcfr14wKFDGPXad4nm3K+oJejhsfybtaJnKQu+jTsi9Nw6qOL6RD1ZDIGMd+LFYwYe5pG6bIGogTZOez2EzhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 09:45:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 09:45:43 +0000
Date: Thu, 6 Feb 2025 18:52:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250206105218.GA22527@localhost.localdomain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0e9400-c8c1-4892-2dc3-08dd46930541
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WJ3z6ZpbSFG6boRib06zpBD9/sh/qgLKapPUwCZfMHL1LVjWptf4Qz9yFCfV?=
 =?us-ascii?Q?cilWOp9W1/gT6KrDArabacSPbe/YxW3UsTLst4F0w4Tb27b6PmGeTEFynWfd?=
 =?us-ascii?Q?MLxwSfV/L01xjgGCjEQeol2Gd70eL5HYk2DdRxXLUN/C94YyEqtrzWWdFiud?=
 =?us-ascii?Q?1ys/Mm1bN4VyfNtrS3doQMoKNQqwzoa0oA4ksu7HzNvgvKzestlW5rpki79+?=
 =?us-ascii?Q?x05y5l5+TvEFSRLF8T127L33eoj5Nb+Vw3J/VLu5eYurzlGtH2VZ079+ddMO?=
 =?us-ascii?Q?1Rqr04zeKRD0ZuMu673rvtiHNGUJeuqbAPkzKHyXmnjfZwWcKbsy+fkGcnkY?=
 =?us-ascii?Q?pi7PlcQS2zQVQTG88oFQ2KKr3WSHdGqpS7WTg/uYPpxOHr2NfFaDF2BBNdYP?=
 =?us-ascii?Q?QeMwLig0UsQKrR/+enqEZfGB0rd8WA4sJ5YqXuwKoQ2ALit5eYsswWaPr0To?=
 =?us-ascii?Q?SWdetASvjipnYKA+RTY/67YDTFzng5GiADj2dPe//NQO0ZrQrU+4BS+emibf?=
 =?us-ascii?Q?CtRik59N0dCMYzevJPAGKn6iwDXZA3UjMMkKltVkX5D7q4HMSDC7OlUfPL2i?=
 =?us-ascii?Q?d2GNdOqxsr/8SY9pSprk5LsMN/1D6w9KLiJnlQ6OdgppJKGiTj20QNPJrvXn?=
 =?us-ascii?Q?ux0bw8Ibcypqoi63TmAPpWz4oATuvQP++Uso+3X9kIqF842kd83LBmsp67Rb?=
 =?us-ascii?Q?R6J/UZuGdiknS4vrGe1WJFJTHkFQ8dPMVDBcA5uY4mkbC8NoXd+XlHAGhn98?=
 =?us-ascii?Q?vfRulaxwYtTSjb3a0lqmgxbAEWTlETQ3vzOg2S/zbC7fUmm38/mIG6JVlWft?=
 =?us-ascii?Q?NgbDz0qjBVJwTtn3Ngu/t/sGJAiSuBz+RJNcA7GRG7FtoxCCq6jxr9jEiXWY?=
 =?us-ascii?Q?zlCfm36gn9p9R4j2KlYs4Uj/vRZUVt5QDPYhnFj3G+zGotEy/8Foz1bgvof6?=
 =?us-ascii?Q?owpQ5rGMIdFvMtINFOAtsykePCz9kQLiH3TPGgqKgrkLz0YaPna8068MG3+3?=
 =?us-ascii?Q?m65Gfn/YvOfrJNElm/7xVM+9CufDNDmtPOjYi70/Mm2zj7nAt9P+rpIdXbvw?=
 =?us-ascii?Q?L7UEadmb2nkf2jF0BtW5E2Uuk45W5Qd1Ucs7+4cIhRk4tokWhFlOaQHg/VOc?=
 =?us-ascii?Q?EFcH4ogpuTaG51cl0jKhJ/rBXRn6l27RnBFDqB+6aIIfdJnw7rfABRWTQY4d?=
 =?us-ascii?Q?nrI3OjU8n41DKffcVOl15hVVoqtUO74A+y/m7Bz/eaAHJPu5ajuL1Jur8AtP?=
 =?us-ascii?Q?m5oVYcwPOWbST4UHKTSJaBkACHZQOAACfGW3AtJTKuCg3SPOME3JsfOzolRb?=
 =?us-ascii?Q?4xAZhrsukjag+dY7hXqlnu+NIro42Ci5V4xaaSRH0fBS86qjsBff+rDP4a+w?=
 =?us-ascii?Q?F3c8gOi3sOaJn/wDQA1KeOm2YxoDuZHuppCTJq7ZpEIXRwGNQ5o7HpkX5emA?=
 =?us-ascii?Q?Q5UIHXPrHctyTkm/qxJGcYyMFILqXYHD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWF/eYNbHA5CSr0Ws5vUcgeXmxeeuVGl9SMzsm8rOp4qkCBZp60mSqHmCkbL?=
 =?us-ascii?Q?dF6UQQ8eQbfgeUCVJpQl31C5PRbXO1z8ks8kSeBbvaui1fMuP15Mh7LyNWfL?=
 =?us-ascii?Q?s+zIXJwd8La8Q7RLVPkMLgm0HKHQc3rQZXr1Rhp5Z1EsPTe8EaiIdW0lnLMX?=
 =?us-ascii?Q?j7EEIyZw7xU3O92VK8CNwMaD5juS1NrP6QXY3gaxHRjWIT0JCUXC27qJ8E77?=
 =?us-ascii?Q?LEDIMu5mGNZIVzu2K20+M5R+gOOiQzhL4clcFUqXqOVfweU84+UVf98KuDV+?=
 =?us-ascii?Q?r/ogP97z6DjnrjGWjSFfr6xI1s+t4VgpnigdE/12fuPUh5hM7Qt42GDqUf6B?=
 =?us-ascii?Q?+yi0f7AaYv36G2jZjZVCGjxsUElTnjaJRte08lMlJNvTayur8TG6PG+5Vzx4?=
 =?us-ascii?Q?YG7Tetl5X/YaNq2l6QAnESKHkp9Hlcbdop4tXpt606mNy8cZcYq8ihXdLT8o?=
 =?us-ascii?Q?56r5l2ZJKKzX7gapXTvExUTQIHNYmnKuCt/wUVAsvDnyouqN62VIMTTUGF/J?=
 =?us-ascii?Q?SZCwhGhryV6EnYBx2Yy6N1pIr6bgzO/KzJx54cUlBpQSfdWMQxr2XHCaGy5n?=
 =?us-ascii?Q?p5LpAyBAVdtXigbv2F5hTbemMRVPwLXrvcQIgxmKEbRhyhK3RqUHCg3zVBMJ?=
 =?us-ascii?Q?ERyTkTaXCL1ELoSJTMIr6vnpfTXnD5uUEVUPiBhOuVAtYAD+5HC6V+Xm9gsL?=
 =?us-ascii?Q?aQd8cabQnpVZ/kgP3dbIArU9NuTfg35mQEkw/1Y3QB2UOxbUEscfKp6rIIUC?=
 =?us-ascii?Q?Ive6KyBH/cQ0p0gPvLZcvb/c2pJe7wmVVZdLa0mONN9HF3zW6F2cPCshUa2X?=
 =?us-ascii?Q?t/8b+8h6UUMNXoBOyI07hNihq+k1H1ZkO7e5mMFstm5T1hVdb1KhOsqxEHa2?=
 =?us-ascii?Q?bI+wiFOL/CUJw2fkrN3QtlksvxgeF+7jXEiMDDqt7+6sPMaNqjrB32L515Au?=
 =?us-ascii?Q?oXHQOrms8i85y5wCtA3LqC9VsoxvnDtaw88b/yBRrVl0cMUFV02cFW9RKGmA?=
 =?us-ascii?Q?q3g4853KkaqKKzvWShNi/DzcfjmtIhQd0WbRcKGafD1++4GoqmI7oqQTYOIP?=
 =?us-ascii?Q?UxEhSwHvWD1ae9u3PmDKyW+8m6g1SMEFsOEKXUuB1qy8cMc+2pshpWc51ZJ5?=
 =?us-ascii?Q?O0o0l6GRjvSGw7BbeskfxuxbkAFmNteUgTL0kE0OB2LXPEd8CIjvb2qFjMhH?=
 =?us-ascii?Q?L7WGl7AeOocHF3pmgbjQv5qD9HPXuyZoOXUmY6nFfSoxsZqlKaG3McYD0u9M?=
 =?us-ascii?Q?C4rf3KfySPLp7vdt5qT1PryZVhtHh1rmj3b8jJCmjvHwEwlAcaCwvNMo8vz5?=
 =?us-ascii?Q?X3I3qqN8N/kx9vPE39olm0EBbxztlxCBtHE1f9VP0r9wWZmI4ldF/GTMP12c?=
 =?us-ascii?Q?l0KItxCzSJC84p33HCjmtomSoZoOvMZBul5E2jnK3QeGJsyGphhw5Ii/fZQZ?=
 =?us-ascii?Q?S+6t5DCb/wxsigLtdiXAQEU+X/VRsHYqdSVsPKTFw+191Qk3osfN3YaOGUCH?=
 =?us-ascii?Q?A+cwIZsIYJKmEbTkucg13O9bolGWM9NJgcUkVco5706IZPLBLJTDw3DUJql0?=
 =?us-ascii?Q?H2204+1yaxp2tNkSnnfsoSMM0EyLZQWuMYfgonPc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0e9400-c8c1-4892-2dc3-08dd46930541
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:45:43.5724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5YO6qle2TbX+Ejc2e+3zy+vVt76R5rIO2Ioj0wkh9myi8JaD/NiKWpFGWg+C2cV+JBxU3fVsOHIUGDqU11VtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_014551_219171_49BBDE83 
X-CRM114-Status: GOOD (  13.88  )
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

On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
>On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
>> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
>> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
>> --- a/drivers/firmware/arm_scmi/bus.c
>> +++ b/drivers/firmware/arm_scmi/bus.c
>> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>>  	device_unregister(&scmi_dev->dev);
>>  }
>>  
>> +static int
>> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>> +		       int protocol, const char *name)
>> +{
>> +	/* cpufreq device does not need to be supplier from devlink perspective */
>> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
>
>I don't love this...  It seems like an hack.  Could we put a flag
>somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
>because that's what we're passing to this function).

This means when creating scmi_device, a flag needs to be set which requires
to extend scmi_device_id to include a flag entry or else.

As below in scmi-cpufreq.c
{ SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }

I am not sure Sudeep or Cristian are happy with the idea or not.

But back to the patch here, we are in the path creating the scmi_device and
cpufreq scmi device seems the only one that cause issue. So it should be
fine using this patch?

Thanks,
Peng


>
>regards,
>dan carpenter
>

