Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD35C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlhKBHy6jTNZORz56+SkRLI693VM+RV6Nhe5BuDkraM=; b=GuDeQIor/5i+UZZ0WzFR6qovfH
	D92vG1y4vRC0V6e/W1B6eXQCgWvTtk05zooAWj+D6SO3xfkK/UeJruit1RCRTyaF4D9VdBHdVGKEz
	bXl3IL4GccEFPBlF3XXBCY4rDSMssJtMTTLTV0UsN2zKixI4CT+wsPYITbqzpv0CEGUlG8/6GLRwQ
	Y9S3bDeDEr3YXA3ojpB3PD/QUNAyV41XN9h4QnpOoYQ2q/CRz4rQ50rT+u9UInLD4JWnBcE2/zJXd
	taQz3JKkwBBYQ/BYicMRpsC6BQgSrukMHqKa/7vh8WRo10dVmmZZCp49zRqjseLvWcGBLh2zTlfI+
	+5QzqEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuDz-0000000FBpN-03cZ;
	Mon, 03 Feb 2025 11:02:43 +0000
Received: from mail-db5eur02on2062a.outbound.protection.outlook.com ([2a01:111:f403:2608::62a] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetw9-0000000F9TM-3hPW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZcbUkJFlOHkW15dx1KCaN0hjdsde7i37/FUM/sArVdPTajsi6WyRUUKZes+u2L7RTKdTwuEM3AZVpkY6dtep7BJkB2mtmSH/tUkvvlhFKyCOH4c7SEzWSSq8D2OeohWD5cLeIB/ukBw8chpfwFD1WE4zquHXF8FXY3nPtIFsmv/QeY9bc+9fTtKTehgGt/DNQBPwmgW0XOzNcitAV7Dt4W77vHDVmDfQAISVvvVGgJFpmn/wvLBwHSAUp32Za1PE/+zMoft6EqMv6JETU/7Xk0Qk1P9VPW9gAn10phijVqTm8ZUnyqVXMKk1T0rza9iKkZdIB/2cUM7uFzeLhP4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlhKBHy6jTNZORz56+SkRLI693VM+RV6Nhe5BuDkraM=;
 b=wEM6AjCzuqrA3miCb+osuh/OQELs5ls8DPeMr79IpCXwznr4fGZL/JWqv1PGre0eDh4HlvuaRXJA6zNGtEvFhJG7v7hJvq4vjL7NhPZZnd5PV/pemyWbpoEWA3ObaWjm+4+am9rk/phDhBgPS8XEFwg4HKmVuxOcGWh28ojpj5XMEQBdw8nbgyRQip5GFXpdQ3EtZ5h3JNlYtxEepeMY71rNt3RxU1WXlf0E33r+Mz6XetdPZc5OepXaBQb4WcbX/cd/2i/AsOfvXXMHHgSql/oPTrkIpjU+avVcH0rEqx48G2UIDCnbsqzJrMJb8+x68iF//jKx5YPvS/HPyppycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlhKBHy6jTNZORz56+SkRLI693VM+RV6Nhe5BuDkraM=;
 b=cp3toUogr6X7gduYl28OchqPtQCA7ZWcvLmr+9peSfdw+9vgVNaW/69em1hlh5z4dZOxsOVvBTIxKVFiqAU6YhBsMmcCBUd/zvEHTS74D4WLgb9WeFB8l7oQHNJc8pkoht/z4BRukSx7WgMLittYKiVi/wz9yKOWaGBv4RoH9ikaO6GEeD4ZKdJ9pQkDErkiX5BT7ReklVKrLU9x9g2GbuAv9BlFbcKGRtYcsHpg3ivVoU6adRHzccvmHZe8K30ytNO2pON7RitWVzlrl4mam8Uu5zIx+tewwxpOGLZNOFr+ACfGkDu13RbqxGgVzOIXScVymVksdY/tE+PHdQjGsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 10:44:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 10:44:13 +0000
Date: Mon, 3 Feb 2025 19:50:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250203115050.GB20298@localhost.localdomain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: b23fb926-8665-4a7a-c018-08dd443fb325
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1DCg+cazRfgvPfQoePDTW9+acEu22lvdQTCoaWPqQNSLML5ri8UlV3G7rbY7?=
 =?us-ascii?Q?GXQfbUFyocfT7b4lKl1Aisxa1SKJyoAOlgXqus//C4iKx8zloHWMK0tuLb02?=
 =?us-ascii?Q?LxP54Y3L569CakczRH59ObmzjV6qa6r8eMfuMdu7iawP8BkiTx2tL2f/l5Sg?=
 =?us-ascii?Q?1sgZntoRqFxu8HD6SgWzQPB+LSCQftWdE+Wu6iwOs2BBb0oa+nHlJ6J1bT+x?=
 =?us-ascii?Q?WrkdHHPgQN7iPqQYvACEOw/2MDC/O7GLvKcUcJgtO0lWe/golRiVkjayejyt?=
 =?us-ascii?Q?PFxSv7fOvPVtebANAfnWCrih/yZePZ2CoRAtk25v0Z3Xzi21u4gfIvcrsY7q?=
 =?us-ascii?Q?rLDL+hBtFqP3+cnnWmdQnlJ/kxOyHZKPhWM5qvhdqIUx0zDu91XpBfT/KcKj?=
 =?us-ascii?Q?WgVc52hK6qgqmISko9++mqVl8nzriGs4eMtvEKbDprPMDaEDeojhwN4l0yt1?=
 =?us-ascii?Q?xT6Q+dUjBUm4JQtBocj3AufIC82apgK+cMd9fcY1acQqmRIEzefhfM9E/PjR?=
 =?us-ascii?Q?Wa0od03gfpobmThKtbgEyYBuJjkGY7k8yuxf8bjfbpsmdi8ihRFiOb5Nv9RN?=
 =?us-ascii?Q?ktNp1Ov3u1xCI8IuTJ+Wiex4HHFdkQDqcPLkdlYoTqtzUiDIzCRaWNgyPOI/?=
 =?us-ascii?Q?h9+QoM13wxfE/thdbd7HN5Xvz485vMbeQZ4MxwZ1LnEBbsEGADJDiiE3gic1?=
 =?us-ascii?Q?55cDvNe4RcM/dH+zVn9YTgICCBnBFdnCaVx+XjmYWWcDz1rFQHxPzFozWyic?=
 =?us-ascii?Q?d+EkohX5F2GdAEQz9nSfAMrE+e4SMUpWjpL1wXsW26UqtG01QLEASdPEZXz5?=
 =?us-ascii?Q?hiC0EEZxLtnkPMG8ffjdy21/qy7HFS9Ekb1VySlpbVVxz7bYOtnEe6ws0LJ1?=
 =?us-ascii?Q?+2rmHrZuwnbUruRjiAs+uvYWfsdyDuQRDkOtlJA+FInbd7A9OkJiSKXdNBJP?=
 =?us-ascii?Q?zUorC+G3ljOIw783sMbcW2JNJzpAs0nqY+86dArdNQjqwCc0FxpleFXIA79Z?=
 =?us-ascii?Q?EB/Z7pkFnoyZxp/thSv0MNbWsCtNW0sR46tM1DhTrbJoyyK3ggnD0reGPgRn?=
 =?us-ascii?Q?fvMwVTvittrosmsI6usQ3sWp+vsnHl63pHX6WaaJDtzicnsfZ7wiRAE+lpE1?=
 =?us-ascii?Q?bdeG9TkI1BHbSfVwBrPjamcaGcw8wRO4kSicIxMcQLcRj2laFXVE7z/35f9B?=
 =?us-ascii?Q?AJ/hmyi8yC2Zm1H3sezEvBEehZe87S8i5Va8TQjXr84xBOSqrXdSDJLVzlPL?=
 =?us-ascii?Q?1DVPus6uHGGjgBZlBX7SUqcQIRZAiKWVlOB+TotbINNJz9/+d9LdMJUU4lfV?=
 =?us-ascii?Q?102u2J8QABNgBUtgJhCc5elCr/qBbN9mphmrbE0j3BV5BwcwOIjDHhUXNfhp?=
 =?us-ascii?Q?98304/ChUr8sdU2ZWgnknsb+PYly?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q3XHxWQUbrORfkZLnNiRvAHRRXK7ad1qd5MZ8oR7avErtZpQRmZTIXPfYfr1?=
 =?us-ascii?Q?S2DAnrn5DrokWiCPB40pdZr5O2pQAQmxypMLbL4SdksstCo5ui4cPhn4jBPP?=
 =?us-ascii?Q?hO3ltTCbcJDOpAvzTOa4vYVqYCB9oZZVKY1bI6zAf2MMBT83B2NQss0qmYMn?=
 =?us-ascii?Q?NUQYENR7fUKLXX3quFMgUcFU0bKlbvkHELIknJOYESiM5m7lbBb901XQ3Ao9?=
 =?us-ascii?Q?GhtGr0Uokr52a+I16x7XS+qbXpwwqV90TOlb4N2ToscDjo2hZoQXQqBMHZky?=
 =?us-ascii?Q?XirSg9BpweLNJTFaHJ9bhctDFBDZzxj9GIsh8MSpZ0vkRQ9neycNQDW0qs7B?=
 =?us-ascii?Q?77iAClhle9fepU5CUVARgcyD4u0ZGIxrCov9eUSa5SCLBUKfA1TWC73Hvfjw?=
 =?us-ascii?Q?Bbq5iEM6V8EejHeKA1QxWJrQqW0mymzVdHW74BeVKgciDakNaXwU3EfHcXIc?=
 =?us-ascii?Q?mD82wqdhScl9HkF1DUxMRbv7bgPGxJDWhZxc9mSLrNLf1fLndEDuWPkhS+Tv?=
 =?us-ascii?Q?vR3H1WKu4ykwMFe/WhRR/ZpVwj8C25/kuvtFqOOQM2bxVUS9pqonULX6MPqt?=
 =?us-ascii?Q?CCITvt21MKzh3bFSQUkrcj8NSQKTJAJdot5S956LJGJ/8PZHS4x3rMIxnnDi?=
 =?us-ascii?Q?kT0WfAkz/bajCEXAoMWE4bCb/rzwPewIkqgr6NgHxEWv5970MwwvTSOwVpId?=
 =?us-ascii?Q?L1aktmoMU2wYCUeHrhquvGOMrs1jEZBVAV/JAj8o+DBxiAtKX5cIQDxiXZTg?=
 =?us-ascii?Q?QN8rKSv0/fUG0nxKwsVMh6JscHKCN1ChFmhL19Gnp6fYg4YMFCu5Qnr7rlnO?=
 =?us-ascii?Q?qCT4krzdkU5ONpTA+Fy6i9NDZHdKWw8Gqn7Cs+AjpASbI/cry6IC9/a/62h9?=
 =?us-ascii?Q?NxGiDwRFZjO89WUO25B2dkj9Efq+D1E6vVaB5gRZBzSNxL5Mbmh9XhNaU2rG?=
 =?us-ascii?Q?1Tby+FGyx4Lz94UJva0JgmZBGXmoxxw9JHxAAFHPRFjWM2eLF7Hizbj5pw2L?=
 =?us-ascii?Q?l+Utp4rJFo+AxodJt7R++ihshaynQu3YDs6Vd3QyejXt+3rHHrfOrlZY60gy?=
 =?us-ascii?Q?x0arr5FYf3D8z93rGAcyPs18EVfDknOHDnHuKsYphrq7+MfeN7mdAAsP+l83?=
 =?us-ascii?Q?gf+VNjkOfGGqJSYLqNgjc3lwi5x+Fqo30zCW02E9aYpNOs4IaRiQbL2P4xbV?=
 =?us-ascii?Q?pO/maIQIMb0R4UmKKv+h/ljD4W2S2xKxq6BwfpMcmkYZiavBBbSKD49K/2sZ?=
 =?us-ascii?Q?KIBnoNp2U7Ju1/qPABAkvomEWGwsqPMOWY/ly6ynVcyqjTKyuQywNpbyanNJ?=
 =?us-ascii?Q?iDrds8pJEwBW46PLDjWpoJZ2k8H6oX2xy5SN3ty0vGXRY/b39bOmv1J9d6Pa?=
 =?us-ascii?Q?bVcIy7P8yf3qqP43RJ+bi8jJh6SOKT+Tb48V+fU9D0Au2h+Kz4QhulL8Xefg?=
 =?us-ascii?Q?lfe4E+mc2O+aVXatRGfrKCstc8WzGyw4ewMvnmLmWN1mSfbUFwKQCnBbX9Z1?=
 =?us-ascii?Q?tSA9crHlc2Yj0KuUxq7DMK/YWGh029CFHhmAqxpTuL4oUlXyVQy+MXU+z62D?=
 =?us-ascii?Q?ju5AJ6uFWt6yS/SOtKcvV8ZGz8EfuZ3bQM1elton?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23fb926-8665-4a7a-c018-08dd443fb325
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 10:44:13.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoR1XsCSLYzzgg57AlsumHaZVA4zPdZt5JPxNvNxGDo/5tGhqsQynbWjbooPPsBBkt+WIMP3R1qew31SmsYmTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_024417_925216_801306DD 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Alexandre,

On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
>Hi Alexandre
>
>> Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
>> 
>> Hello,
>> 
>> On 20/01/2025 10:25:32+0800, Peng Fan (OSS) wrote:
>> > i.MX95 System Manager(SM) BBM protocol exports two RTCs for EVK
>> board.
>> > one RTC is SoC internal RTC, the other is board RTC.
>> >
>> > The current driver only use the 1st RTC. With this patchset, both RTCs
>> > could be used in Linux. To achieve this:
>> >
>> > 1. Support more event sources for BBM protocol 2. Add bbm_info
>> hook to
>> > let users could query the number of RTCs 3. Introduce
>> > devm_rtc_allocate_device_priv to support setting rtc device
>> >    private information
>> > 4. Update rtc-imx-sm-bbm.c to register both RTCs
>> >
>> 
>> I'm sorry but no, you have to register two RTCs like any other system
>> would do.
>
>It is the i.MX SCMI Protocol exports two RTCs using one protocol.
>
>Two RTC devices are created, but share one parent device.
>
>Do you mean each RTC device should have a unique parent device?

Could you please share your ideas on this?

Thanks,
Peng

>
>Thanks,
>Peng.
>
>
>
>
>> 
>> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> > ---
>> > Peng Fan (4):
>> >       firmware: arm_scmi: imx: Support more event sources
>> >       firmware: arm_scmi: imx: Introduce bbm_info hook
>> >       rtc: Introduce devm_rtc_allocate_device_priv
>> >       rtc: imx-sm-bbm: Support multiple RTCs
>> >
>> >  drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 33
>> ++++++++++-
>> >  drivers/rtc/class.c                                |  9 ++-
>> >  drivers/rtc/dev.c                                  |  8 ++-
>> >  drivers/rtc/interface.c                            | 16 ++---
>> >  drivers/rtc/proc.c                                 |  2 +-
>> >  drivers/rtc/rtc-imx-sm-bbm.c                       | 69 ++++++++++++++-------
>> -
>> >  include/linux/rtc.h                                |  2 +
>> >  include/linux/scmi_imx_protocol.h                  |  2 +
>> >  8 files changed, 100 insertions(+), 41 deletions(-)
>> > ---
>> > base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
>> > change-id: 20250116-rtc-3834e01786a8
>> >
>> > Best regards,
>> > --
>> > Peng Fan <peng.fan@nxp.com>
>> >
>> 
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
>> bootlin.com%2F&data=05%7C02%7Cpeng.fan%40nxp.com%7C7b5c28
>> 0a03ee47dea25f08dd393c2e53%7C686ea1d3bc2b4c6fa92cd99c5c30
>> 1635%7C0%7C0%7C638729652821885462%7CUnknown%7CTWFpbG
>> Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
>> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata
>> =xL23vC4m%2BtiTN8eNs8QptUHgfo%2FuHEUcEewGMdeYWYo%3D&r
>> eserved=0

