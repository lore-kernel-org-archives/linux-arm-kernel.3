Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F3FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Content-Type:Date:Content-Transfer-Encoding:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPP1IHL/Wned6/wBxQKYoPlPgI9xes/RiyzOVMbDZTM=; b=mOARoE5rrMo3dpEqnaCI3yN5Og
	1bx0sFzQvTv20LxF1uu3xz76tyM/lNrt8MSH3O5hFezOBg5jn7Mnbf8XyQiOcz9SCQEz5UanJTqoe
	hXVt56gaHd+jYnTeH7WJL++Ynk60SWxebdN6JF5XfCiSeu/wqDWdFlrGUjKOOYR30EAKfJBo53zZz
	MLYZS0GZD7t7+ZvQcDvXn75XS/X3YN3zJK0xh//Jn6nA9QMNMukWqlWPdeKQgiSybhNqtVnmgWznb
	Do0L58sUEtvf2J2P0qAnvu9LbOLnk6bDZ9jmlY6qctQpuEa3uWiYm4FkCjmDFH8xjQ+rVx2NVbEgU
	UBLnYifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcqL-00000009hrr-14JT;
	Thu, 30 Jan 2025 22:17:01 +0000
Received: from mail-southindiaazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c409::1] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcp1-00000009hmL-2LmV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 22:15:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYSiwjd0OC7opgmnN7y4z425Te3oEExJ1hAqdmH0+pK3hDK2hlpaaXCpNRHmNjhg7uGI5zToTRLcJXz97q3SR1JC3yS88w0c/GLrwvsIPYRiJGwzUfgtYRhXKhNhlwbx54g85PO2+zlMKIA4Tbyf7HLP5qOyy8+VBuNVg+vJU2LpN9i1A8YWr+V3p3Xty5an6BufeaCefo3dfRJ5RWMLHv9v4wkk1OGwYZQpF1bu5YA2lkWM7qBcGU/YlDmBcY0frxxeewQLYbVnddnLndXkyHlG3XFEacoSGDRL32G+UkAsQ+8c2prht23qaN2zmc58+MQLd+DXo5qNQQokkocktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPP1IHL/Wned6/wBxQKYoPlPgI9xes/RiyzOVMbDZTM=;
 b=xm17dItTI1KX+e8OFQipLP+oesY2PgqbK1PAcjxUVXlElVEtZ54X7Ij24wUY+p21E3OO95lBVRkemHvKFnFSs5Ay7wGdxdPBi5LJxWN6XdjGZim+0u0y6ulVeIv+1OHl7kKvKLlUAOOmWve9gEC1JVL7wAMjpdqGFTc4wJEFBprfeMUe0TKLpuvXX0iNQN+xNGqjFgGGIh7BkYL4IAmdQhiP0vfkeek/oYjGYuVY70waORZjTRxJqS+lbzoxlPoEI7jwnpx0+7WWDbhD7ipg0VKZVze/2/owDDo7FG7UM027MKG2kgnV4i2MuAKbt5mmYuuMV/P+1zq3ROKG982pgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=expoinsightnetwork.info; dmarc=pass action=none
 header.from=expoinsightnetwork.info; dkim=pass
 header.d=expoinsightnetwork.info; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=expoinsightnetwork.info;
Received: from PN1P287MB3741.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:250::5)
 by PN3P287MB1577.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:191::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 22:15:18 +0000
Received: from PN1P287MB3741.INDP287.PROD.OUTLOOK.COM
 ([fe80::4fd8:3302:964c:8213]) by PN1P287MB3741.INDP287.PROD.OUTLOOK.COM
 ([fe80::4fd8:3302:964c:8213%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 22:15:18 +0000
From: abigail.reyes@expoinsightnetwork.info
To: linux-arm-kernel@lists.infradead.org
Subject: Lists - Automechanika Shanghai 2024
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jan 2025 22:15:11 +0000
Content-Type: text/plain
X-ClientProxiedBy: CH5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::20) To PN1P287MB3741.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:250::5)
Message-ID: <PN1P287MB374166F5660A86D3E4931BFBFFE92@PN1P287MB3741.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB3741:EE_|PN3P287MB1577:EE_
X-MS-Office365-Filtering-Correlation-Id: da229a48-73b0-4b9f-508c-08dd417b9427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xK7gpVMu+yw0T+VwfcHF9kHQwmkZ30rXLXTJCLpKgEE6pu78a0QQM4ow+PM/?=
 =?us-ascii?Q?foGh1sjmlXpyR0U4pV0ZfYgaMq3Apjp3l5G5ApwQN7Ssqtg0eYYB8l4GzurR?=
 =?us-ascii?Q?ppJghSQAD07hSj6BS/T355iDSGA46JfuyxfQ7XkQRtZ78oWu5cfyxB8gJkiL?=
 =?us-ascii?Q?rkhaVaS0IGg+etHWLz/rNULmAU8bRz5cKlGJRvXUZJnGSrK1BlILcu15nWGs?=
 =?us-ascii?Q?YhPzkZrUbjtTZsUScOzyNmXe+rGZAhE2BKAbYkuVZYjNvGS5beCzfvSNSDA7?=
 =?us-ascii?Q?YWgyssG4UbtSJUqyErsw9x6yNbECzQdJPubvQKrKJxlzuLsuvYzQnvmgNFKX?=
 =?us-ascii?Q?hi6Y0KvoYrLyDA2gyBfrVPCysDnzPUTNI6N7GGTR+kkZP8j6NpAxKNZD1GDU?=
 =?us-ascii?Q?IsR2+NNdFp8yRFnKJ7iq5CZFE5S6se2mHadxR3TQYmNIJZ+M+y4eO6b5DjST?=
 =?us-ascii?Q?DsoUSPNgqUwdtIIk4lsek6mZ9TvG1HeiUOdwtcKV6OE8WN3pWHXaTi4zNPhr?=
 =?us-ascii?Q?9lPZQrgiV90f6YZgIoNmiW9jaNPaGYKWbKrNcOcdlzZ1OWN3AJbbCj+E3BmR?=
 =?us-ascii?Q?lYsFt1hNck1n1A8p0tQijmVbiflN5vf1ZXbgQ2sv4h1vDz71T3euZzgiaRBI?=
 =?us-ascii?Q?Ao/um5B8oZRBkDIZ4wKyYjWtnkaB9JkI5k4AykJztyeAW56/YEYFJKdWCQHV?=
 =?us-ascii?Q?rZLP/mrXQFBFB63hoRUeVFZASwVAoqSd5izKvYBkooypyegKgw7ESBFRl9M4?=
 =?us-ascii?Q?889UPf5S4Jk/vUAdEJJsWTq98DjrBYIE8Vwkz1ZOEQrUg1Aqkxzep21JoRBW?=
 =?us-ascii?Q?iLoP4Cs2Ed5irA9HcmQYoB2xJiAnwo/NP+1p5eG0OVREDESMxaWIx4S+Zipn?=
 =?us-ascii?Q?nxD7lODJ6M1TUzyHcuZHLO6u4LCruHYCp+g358xPlwBnGlWokDjyFanrrK/I?=
 =?us-ascii?Q?N6FC9jUyMze8Q+rdSKiUfm1f4gkmfASwnj7XHkfQBupNKCtBJoBF66snHRmM?=
 =?us-ascii?Q?KxHsSkPd60sHmvH1C/8x+xqkxDKUWlHv6/d9/h7DVdHAvPpgjjRJO9Ul2uO8?=
 =?us-ascii?Q?m0WFLbndFks4QrgTg/6B1e64YREEeIavMYP8gJLKnq6+VEvjALFS25EZRcyn?=
 =?us-ascii?Q?Hbtuh0Whw0gcR1aZtShBJNazAxJC4gcrWQsirfPBYlViLkVlTSksEmS1/OVT?=
 =?us-ascii?Q?6beFLjF2sUXQvn7IgzFXMf2JCYnnQ+BpPAmncZalmUSLEe9YY3cZhk3hggiv?=
 =?us-ascii?Q?u3w3t57Hkt2O8NnP0CbPnBIkJcKg02yqs0ze9cAY3/yx9Pn6qgmPS1mAzXsT?=
 =?us-ascii?Q?eTq8E2oHFFL9Mlx4ATezZXU7SB/8XjVVR20mCeeb4nVqxe7h9Q9yLbm4QhMa?=
 =?us-ascii?Q?V4EqgqZBUgY7jlBib99MNZLacH5HO34GztgXMD8pgadldqtb23MrunbFDy2Y?=
 =?us-ascii?Q?s9KS050Y0ZgwlfgVKITSx4vOY3nuRqT2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN1P287MB3741.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWNVLWELy12t3mZs09GPXQjlFUrRKkvQjkCViBdZHJGxYRzesSKgCpEWe39c?=
 =?us-ascii?Q?QeaieIs+KUUbNDO8QkLgKI4Da/glo9YxXX/X+f0gzA/WsZ6o0FQVl5crf/sk?=
 =?us-ascii?Q?5eZwNCi6a7AP0gx6F4ZFnS4ioLmLOE1HcblZq7ZD0zdbYDYWuXofMkadew2o?=
 =?us-ascii?Q?7sy2TPVq2/WLaxCHxqLhguUKc1IQydQOkKn7TGub58qq8vKhh/6y3+e9pTba?=
 =?us-ascii?Q?SLXUOqyzOb1mlIRWba+btoIvcFiMvlfOe6Ycd1JMEQtvkPixARCoUW4aHBfY?=
 =?us-ascii?Q?74oqeJzJ2P649K0Rh0KqKp2XOlJ9Xe/4jhVwWcMGORlpXPD88e1jbBo7KCq7?=
 =?us-ascii?Q?IToEA3mYJNeoIsxx87uEQPBeHTiNDjqCgL8tZHWvJJomqAcAIdh4q3Xmohzp?=
 =?us-ascii?Q?qEiICWx/uVog71B8MiREYPQ+Tzf5yN75kWe8/MFCrC9dRiPLq5MpWkhzkKLA?=
 =?us-ascii?Q?42PnVJ8rV36jqAmHchBYq7rZgK/PGK9GXz9YIQPosqzEMZqzwJ7ffyIXsDvm?=
 =?us-ascii?Q?CVLNBo8QmEBn8cGmQ7X0RUxz6IXdMhTumdLS0OOohceOtMR5Da3hw6RQjnlp?=
 =?us-ascii?Q?800ITpYlulAR+Bt2a4utbKVXWzxOS3rl2V4CGH7dTHriR72lHfpumMC9Y4+q?=
 =?us-ascii?Q?oKOtAJ9e1MZKDdONc/x4NA1pir0135omiPHPNYYquFyDPyOTEISuaFQKgm0T?=
 =?us-ascii?Q?9HLzUwOZZkoWr0R4Qb9TyTVqq0S3IzS0zm4oflB/pX3RtFUesq5cFhfFJeIP?=
 =?us-ascii?Q?OmCKUddNKLbogAt2F7lICZJMBUTrWvyYc3ld6GxuHCULYDFoq65MT4M6heNG?=
 =?us-ascii?Q?XlwZmcOmMcOLyk09mSvoESw2jurzTGSTooSgdYz2rzCzB3tZxkK2VEt04SAS?=
 =?us-ascii?Q?EKOCMF40tshCoNv1DUzfRupubtzt5rd/s/El6ObUT/jfKk0MdFfRndonFLu9?=
 =?us-ascii?Q?cN6ceoM4fp9MCUg0ZtXa2QMryCLtw+0yfWKUXvs5/fJUUQz7lXLX/I0AShQB?=
 =?us-ascii?Q?0ibFyt2EBLpAFycz4mRyVdBT/IHw6xbOZvQq6GsUxL1B1CBkpiT1IFBDeJmu?=
 =?us-ascii?Q?0u77spTelRUF5xnO3bpsMtgdKKu+tDafMOsAuPefDYHbsekDgyk9r4hD+yI7?=
 =?us-ascii?Q?/lUX5hf+UWiZk0KDHKi9pKIFe3wJHAkDgyUestMOK19JM0KIKuYbT6xfNzSg?=
 =?us-ascii?Q?ufujmH+gQPMSOQbVISOzGW3cGbmdL+Q9pYAIdL2riLLEmvY6NdKgwhND2tGF?=
 =?us-ascii?Q?FzhR08zdCQrU812s2dbtvQSFUhU9+G8xA8hk0Gnk5rLLeDlI/byxpab8asfB?=
 =?us-ascii?Q?SBwAGfKN7CWfPwf/6W/J7JMP+UlfAa+CUxm20fdaM+ZuNr2c1eH1NamYpDZe?=
 =?us-ascii?Q?T/d78/Yk8FuoSKcJ3I93pa4utOAuFv1Tz1tbENhvJApKLJ++cEBmB0OduudQ?=
 =?us-ascii?Q?b8XbO5cDBc/d5l9T+LWzc49Ja3pfG+mb7jn10/AYMr55d6bFbgVnAfFH4dIi?=
 =?us-ascii?Q?Zx54e+0S3BpKmsTslpMyltab1wVERcLA7DkEEI09UKAEUXxOr7tWwz0HE3Qt?=
 =?us-ascii?Q?rP7wX5ScbkS7dM5IuoVvqZnVCkgcK8fGlDAQh8Y1tyZqEZueZobkpL8mP1d+?=
 =?us-ascii?Q?1q9ULHadriFlcz0meUqiek8=3D?=
X-OriginatorOrg: expoinsightnetwork.info
X-MS-Exchange-CrossTenant-Network-Message-Id: da229a48-73b0-4b9f-508c-08dd417b9427
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB3741.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:15:18.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63547eb8-b74f-489f-8476-ce2a691e9f4f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4OkHscECYjkcLcb0T5UCabKI+4BFJ/VEgEXQHeopchJcPDVsJlxsI8AFBgxIhgXiuk338qPRckWC6LlnNf6IJuAfyidSgjqgn7qevLP1w/nT06L80UAFWnmgziioZqK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_141539_597411_205EE7A6 
X-CRM114-Status: UNSURE (   3.10  )
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

Hi,

Hope this message finds you well,

Is reaching out to visitors/attendees of AUTOMECHANIKA SHANGHAI 2024 benefi=
cial for you? If so, I can share the pricing and guarantees for the list, a=
s we have compiled complete information, including their direct email addre=
sses and other official details. Below are the event details and the number=
 of contacts on our list.

AUTOMECHANIKA SHANGHAI 2024
02-05 Dec 2024
45871 Visitors/Attendees
Information Includes: Company Name, Contact Name, Job Title, Email Address,=
 Phone Number and Website

Awaiting your response.

Best regards,
Abigail Reyes
Marketing Executive
Business Events Company
United States
If not interested, instead of marking spam, please reply with remove and we=
 make sure you do not receive an email from our company.

