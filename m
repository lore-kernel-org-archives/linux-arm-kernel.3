Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C525C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmhHHiSRW+hXzZ9shgZOyboxYoaXharFtd2BchShwyw=; b=pPl+beP1q9/fcxC3iXPPZJwUbw
	91W31ke9scAWUb+LbJN5rFQ8FNfjV1I3TarqzBMVfsCdOt5XJbDyYW3mM+Lkw9rB7fp8SymQ4DuKf
	0nVEM6T9mWeunRZRYczsVXTrQp8qVKUJD5Q6pr4d9Jc7yGDRJ8nzAhYoUw8aoH9o0816D8iRVKPfy
	r2EDFhePhvAsDEj3LQIdnHupBgs0/G3fget/J7vFcSbOQ7F2r2Pztq+uVRhLBoaDc3VYcEreG/pwm
	/c7AQm6hK3bQIdYkgFvLxA/vS5XT2cPIdQbzrlD3AH+crIK1ljblDBmZAf4gLjwNUt2x8GDSZML2h
	zZcocSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTLp-000000062un-3xDI;
	Thu, 27 Feb 2025 02:10:13 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTKI-000000062VM-0Hwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 02:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgIiWTCc7NF7HmiM+jkUgT2XIT6wONVR068mI4c907NuD/yf/iGqmxSZDMJvkPIlR3KKP472wpJSCC2J3kzaMe4+ha7vzG8Lw6ItiLE0aoJq4BUpGL1cY4E8EeSk1JUr0PKdn1ckvWzHgYd91uSKJQSV96Q7BSoHdfFVyz6JPDbyE4xDaG4Xy/oTcxZxe+5pYkNUIKD5UtMeGu9g0VkzFoESu/zjcLZjcvKRd1QBhqinacQpyUqgxao9TLWICfb46ijc/Ox1gvklI9nyN572YPuJZQr0aLyw4jTA0O4rI3PtjpPC7pPWSR4QSNdE/UlDP9d1Dlgef9eStg3hgKj9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmhHHiSRW+hXzZ9shgZOyboxYoaXharFtd2BchShwyw=;
 b=EJYwbbfPSFF8JXyRX9ktDqezm4Bq36yu2MILh1WKH8t4gnUiW3JzVHRyx5a1vBwcWbWqXGJ3IZM/wo25FWBW6y4mVhK/0RlPsSdxScMgMJIHUZ2gnMIlzf11+m+dXR/vQC2aP3NV4QYHUDwPxuugBddlBguGe+m+ui5FmclAKZzh48okAB8kJWNoVqT4JnuRVD/xPWez8FEX2d844MRaV/eocfC43qirH7nGeKcr1l1bd7GzRiSvFaF3StuwH2lciNNyBj88XluDSdq0c0lzmKxcE1q1a3155Rnifmz6TYdqwLEFQwMRLcBmj7Xlvk/O/KzWfUDfiR+2HMTJlg5cTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmhHHiSRW+hXzZ9shgZOyboxYoaXharFtd2BchShwyw=;
 b=tX4dx2GWM/EQDKj/gjd9vLP+6VhvKPF6mgR1M06JNgIIsVBPendRVEDlgcA9fak0PMjvL4lyjsd80uOMMzg/p3vEhBn6J4sAyv8U37m8ZMQIj8CDqdD0mB7YzrgmRsI+tNWCMSuShWOc8V3nlJHEpgzGQ/B5x4QmxJC0vnFTPDtqt3CG6bvBB9NciyaaxfQnHPmG+o5OLLr/0GGAPsMQjCGZ/jXmP3sD6regIIqEY2A4rRzj7CyxdPKCJsIigK3uy/l7R+OOYhubfU1NOBEEJyx6Uy6K0J4IWD4TpDRKAFee1VeitzmduxNvczwGHI/sT/bYlRCqt6tGVV/HDTVltQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 02:08:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8466.013; Thu, 27 Feb 2025
 02:08:33 +0000
Date: Thu, 27 Feb 2025 11:15:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Rob Herring <robh@kernel.org>, cristian.marussi@arm.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <20250227031551.GC11411@nxa18884-linux>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org>
 <Z79NOeyWzfRio8qs@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z79NOeyWzfRio8qs@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 20de737e-e576-4e30-f9cc-08dd56d3a319
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?23FH24/AncEhTD7Cfa+srAWWMqRV4hsmdGALFu7sifpW7NLzqLUZ8cVNBCpR?=
 =?us-ascii?Q?gRWo28ntdPv3B3O3iSK6ZIFux66kvTGjFpurbbo3kbZHY2MJeGk8CDoN1Qy8?=
 =?us-ascii?Q?ogkTLJYhWoTq+NbrjqNGaNcYSAqo5n4iH1GgvLvLp4jL6KijKplfMWF6T4cX?=
 =?us-ascii?Q?oqaMTHr6Kkg9qTUuSxfJrfCCGrfnFqFWp5WOii42zFtlRDPIHpl0cD/auB1/?=
 =?us-ascii?Q?2BRwGaIFICn8tqybX6Au7LJfu58Jc/tf2ITEXtex+WOf7PIJTlydJVbFcYZ7?=
 =?us-ascii?Q?9mE81CsaLgilSm+5Vb5rh3Imsvr3cMXL+f2OnB7k4JzdSUDgl8EjWJ3L56gf?=
 =?us-ascii?Q?LT9qMTugOxq83j3zeAoteGqdC5gfOnMvATL9tE4PF043T3VVaAWZDQC/pGSA?=
 =?us-ascii?Q?F4DFMga9lubkDGHT3LJ5fx4Ke570wr2NfUWmVFnHW4WlM41Bizv3U+0mRsHo?=
 =?us-ascii?Q?Dteq2cQbE1MYobOr8GYhIkM93YeTCNFwLwk7qZ1TEXFOBAWItU4XoK3cRKMO?=
 =?us-ascii?Q?Fuj/Bo4WdwfM9gVI04mWLTffu+7rwpds8WpTkrBfet+hvHL+CAoVIejH8n0d?=
 =?us-ascii?Q?1FaJzpv3Cqtig8jmzaRyxE5iYONE7+QU6X6I8i1Z1VK3o9dyDaLiElC2Bn54?=
 =?us-ascii?Q?+tSpW1Hh09vX4JZOUrL1j6pRh3zegdWgv2hgVMnUc0/4mEKSWb/1jFiHL/aw?=
 =?us-ascii?Q?gjY43EsEPaRx9un9sn4BKIL+R7B8FuPpyloS9NUftT85cwq8w9jBBGWTCP8d?=
 =?us-ascii?Q?IAEbog5zUhcvvREk8h5rsd5wgxWtsup1OaeJpDKeaYtt4o56sGA8JfJBeztG?=
 =?us-ascii?Q?dwZKfusvCMLZGPylYfgsUSvH25hpmU1wh4pdZnJqvsGC7YxkhG6qQZ1Ja0wF?=
 =?us-ascii?Q?zT3oYaEZUfYsrXhFVPrfX2QqtfaB5VaB+8aAQaZc1UcX+dv+uJv6veT4mEd4?=
 =?us-ascii?Q?4PQ4dA1gVsrDY4NDrT7thzgtZqUPdAGwebpQQfeFu3ciNMKjN9ZIcr1Motp2?=
 =?us-ascii?Q?iKnpphwtNaJkLMGnDI3GxRWpTvijS3hotbbc05hSzePnCJDIS/49RQYSI657?=
 =?us-ascii?Q?CNzz6uWRObeaR7q+WO30JP2biQrgvkEK2F5OTSzIWGZ1leFG+gLqDzkZIjeJ?=
 =?us-ascii?Q?KE7H/HpxLOJv5gfdc/3ClSbW0U94iEzXG8IToJf1PQg75CtYiABHY7sWtV7S?=
 =?us-ascii?Q?3D+fqKo03d15mP2LGdy6GdfgopCIPdz5F2lD+iDvpDmDUkOiPOmpMOaStB0i?=
 =?us-ascii?Q?WPSk6uDaXhrnlB3UC3eFIno91n5J6Nw/FNW9Tjbnk5j1ug9QAmPShjIbmjbK?=
 =?us-ascii?Q?kPHX80+cJWhqe+0U08CEESFQp8SbIg31rjDvHsoAu1H7ZQwEsc1TTv++q7x1?=
 =?us-ascii?Q?e6/j+RU8fL9rYtoZRtfwqztegyv3PKzRpJvieIRvfXpYZI8r58QI+mizEZeY?=
 =?us-ascii?Q?/2Y2hEIvsd15vnX0VbVlwNlPYwIFn/Ob?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXG2ZKoq6EIRtyIh62Fg+NxJ4PxuPYcHGSzhDZhRUPT+t+YBqTxZ6/rmdQZN?=
 =?us-ascii?Q?Sy5rFe+4oJVGjn6+f3kRmnxJCU8wbtrtEkIfuFpbwe/zM/CO0PZT9JD2JWQX?=
 =?us-ascii?Q?6sJxa+He/5Zr+puBpmYty15Pmf8MmAQR9s7wUgtGlD6xCVi/Msu04o14eqGc?=
 =?us-ascii?Q?3esAt3EtAloRdeBFc8Bmvflw12odGVvt1IgN4HyV1x8Mmkj6PAj4MrkrVT7j?=
 =?us-ascii?Q?y4dxu5kXtk2RtzxNPV4YqCnKW84wq59gabbSoAne/+sBt+wCur1OlrX9UHj9?=
 =?us-ascii?Q?DL2qlYN+zv6jQ5Ohlt1TassFrXwdPInrLmWnFC1NHDqE1TAAd5PPekLFZd9V?=
 =?us-ascii?Q?bCD1xWLcW20uAXqV8l03z2Lx5koUWGoWeuH2PNo+zOMwnQwgNNEui/hiQcEg?=
 =?us-ascii?Q?GMLuxt6LnVmJXQuJ7UtKLJQ4Kf6csXfxXw7aRGjQMhHBeX7xY3wMF+QUB8av?=
 =?us-ascii?Q?Cvj6FLbYlMlvsvBnWN1YFBK7EK/la3Altr3ffqnhHlqT5HkMFVDyeMw8l3XV?=
 =?us-ascii?Q?z4MXdXDffXPIGqi2dQJBuNPz8edl5pBnN/YcJMbtB/n91tFkynTdJWcLMJbn?=
 =?us-ascii?Q?WCr6Rcqh/3hcezyCWdrycpxD2Kd1tzyJaBtw7PYOFhpOcoWnLp1Exi+37K8p?=
 =?us-ascii?Q?HNpj7LRc/fpJFz+3IcChOphchv4gHX1WrDFvucJoZTkwfdTN4qYzmOhWb0Ee?=
 =?us-ascii?Q?11ve9AmNwzaf8E+vyVzg3nuxdZjCKS58c+PMZOPQXBQ1x9pyYg66CydTiKSo?=
 =?us-ascii?Q?W5F75fs9OXM0oxV7MGGO5OLwOOeN4lu/YbJoCqbGxsalDNjvkr/BQ8bxJOz5?=
 =?us-ascii?Q?FQIw2BAbhdJjvvgQAuGGrn/KNb/sOEEjIWJojHb0LNlr2UE+zQFM+1F+e/PA?=
 =?us-ascii?Q?lN9CHQsTL3hul3zgm/seqDejy3IULPuG+LoiEoS7aJwm99tl8RxKWQYgb9zP?=
 =?us-ascii?Q?+p6/g3ORNen9pgqfgiO/eZEGu6QnfxR9CY0ERBOBnUGpHR5PCyuVIhYATeMY?=
 =?us-ascii?Q?CVF04t1Vxb1+Urz3Lwu6SEGex+0YUneVXnJ4d8PWrsTFLc+2oKQLMDVrtXXy?=
 =?us-ascii?Q?BTYSrtN9B/eUlxyEkRKgdvVBN/K+RzyXEXf44oTgVgcQMW2T1W4DQSLIrEG1?=
 =?us-ascii?Q?3cPFhRd2MmAd2/j9dmWeR4Sd0ItSCTlcIsHCk5YBrl39REWQphLqo8Ys1uqm?=
 =?us-ascii?Q?MykKeyGvZUTh/lnnEH2r3y9sgc3zZBF5XjscOELzz9mrQ3m+koBa70xPBcq9?=
 =?us-ascii?Q?2E9xFjSaJP56P5HfkISQ5gP+Bze/DJB+5BpMeQNjrVO9HzHP+3X/H3aKTaFJ?=
 =?us-ascii?Q?Y3WtIcXTtXW641+fiSHPlOJhiK9Q1TO376pL02YbOqdHlC40BOZQcYU712Da?=
 =?us-ascii?Q?S2xZdZi1DcWp+gV/dli0+bpG0a9UGUlGmZh/EFKJgopdurKEmBQ5YWUmS3MI?=
 =?us-ascii?Q?12yB1KaAsGc6puT34ErqG6WAPYVgXx5yOferrQKzrpkwQrHRj+HdfbY7cqOT?=
 =?us-ascii?Q?ZmABpq04A0nY+lpM+nri0UheEknsh7rAweSBrdJeuRKCu55hY9t/OhOuS4+G?=
 =?us-ascii?Q?YN01abE/a/6moUIyuMdiinzwyL9Nfb5hsdL/0Mid?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20de737e-e576-4e30-f9cc-08dd56d3a319
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 02:08:33.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUoNcmbQsAgSBvOwoePfu/jvIAdz5EV2yIxGTINL1VkzZ5KeiF2D+LIjf//yUTIve4H8xNSa9kI2CnmgVizqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_180838_107491_51E115B9 
X-CRM114-Status: GOOD (  21.22  )
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

On Wed, Feb 26, 2025 at 05:19:53PM +0000, Sudeep Holla wrote:
>On Wed, Feb 26, 2025 at 10:09:45AM -0600, Rob Herring wrote:
>> On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
>> > Quote Sudeep's reply"
>> > I am not blocking you. What I mentioned is I don't agree that DT can be used
>> > to resolve this issue, but I don't have time or alternate solution ATM. So
>> > if you propose DT based solution and the maintainers agree for the proposed
>> > bindings I will take a look and help you to make that work. But I will raise
>> > any objections I may have if the proposal has issues mainly around the
>> > compatibility and ease of maintenance.
>> > "
>>
>> This all looks to me like SCMI has failed to provide common interfaces.
>>
>
>We can look into this if having such common interface can solve this problem.
>
>> I'm indifferent. If everyone involved thinks adding compatibles will
>> solve whatever the issues are, then it's going to be fine with me
>> (other than the issue above). It doesn't seem like you have that, so I
>> don't know that I'd keep going down this path.
>
>Sorry if I was ambiguous with my stance as quoted above. For me, 2 devices
>pointing to the same node seems implementation issue rather than fixing/
>working around by extending DT bindings like this $subject patch is
>attempting.
>
>If you disagree with that and think 2 devices in the kernel shouldn't
>point to the same device tree node, then yes I see this is right approach
>to take. ATM I don't know which is correct and what are other developer's
>include DT maintainer opinion on this. I just didn't like the way Peng
>was trying to solve it with some block/allow list which wouldn't have
>fixed the issue or just created new ones.

With compatible string, no need block/allow list anymore I think.

But honestly I have not spend efforts on do driver changes to support
compatible string. If in the end we all agree on the proposal,
I could start on driver changes.

Thanks,
Peng

>
>--
>Regards,
>Sudeep

