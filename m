Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452DEFB806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsvboxnFR3FEThRy/qiw2YT21kkbYSZ0od0nFotkGDo=; b=yLcfKXxymm2TWQvjPpcwlEgEMH
	0SoFDZf0SHtlFEZkAoSAhMJsAzSpF7RSB5MY9QQSnL95U0uwuR91R424Cw8UzoiYNRKJEv0g8sCfI
	QdoDClL/VuRnuuQggL7i6t2vVLs0OmekQGSyZw64HEl52n0XFjzfhRwM2TZXyvpFzvw643o3MvbjB
	6XNuWQQn61+EJWdaggQ+/wQuuM06jmeX3ZJ+CowNDi16r5/UT3cvSmv9b2s3zUxhumPS/7ill4KfT
	CxyiU1Ch1Ws5y4A9d+WEvcBOjOw7BxxXFfRFwgGVejHI1rYDBZu9FZ3TBfxSyGmOcVuCk2gtOKJNi
	oeJdQ+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vum0o-00000001XOv-07GO;
	Tue, 24 Feb 2026 06:35:14 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vum0l-00000001XOO-2BbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 06:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwqKzUe11/Z58dPUBTlu34v5OSgx6CLJyHTo2F1Ic9ZJIXTKhec5c8yTs6c+y+s1YEfftmZMFqimLiaJUviBogVdIh3iFC5yUfa0SZ919HvBvFcJHpa+WRNYmkDtSSUIY3431U40rpXkXMcmA0NMCbQH1y2TbsQVbZXX74Aj9uYQbpOLtyfNOXecg5vYbiTgvj9dSMd9MqrXu/6tVFJHmTIr6IOZXpObkjGj1tBpLJwQmNzAJal8wUtcXTlaLdg6uHt3arxJomElYrJ1BQ1YJXUl12WTr9+Cd7bZyjYVEO+PpZoeIpsIvzhJTYIsr2oYyEh0QVArWtZX6H9YcmDqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsvboxnFR3FEThRy/qiw2YT21kkbYSZ0od0nFotkGDo=;
 b=uMB4+wiLuGgm/HypAyOtB+/bef0hItgKXTG3EHgqb3dqLZgDEvaf+0uX7cbqNZeQ1naC7bZN4svSfiuyAt+XmrmOz7Kh4gXX+VVCwJr/zxeY6mqsbTzEYLIeSQz3x36ntC2OYchQrSJ6yvOWMlEbhupwOfwqHPZCLrZbtO/RFPuYSn+ooNi9M+fXnXi9yFkvSPFjOV71vhWAq8FyZwYOcXkv/ZWbKW2hvxThPOGfoYgPVmgBnKI9TOwNe/LJfqNE6/4ehCiEmN2kxV00KJb7cY0lMbu0x+rwcCYWdAtoLj7A13RekWUpwJRnt4p+4ry+mDPYUwxxBXNluCCbd8Ynrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsvboxnFR3FEThRy/qiw2YT21kkbYSZ0od0nFotkGDo=;
 b=pn1AbjyfMrUQ9nAbzPOLSHa4LULp2l9ei03uoo5GAod7NwObVq1dY7z/rkmYTebYfijOU29C7ntKMTsM95wq02jdFHSGuaTtU/UVgUzyAreK2Ca1/ou8jX5PosYdxaFcN9Q5KnuKJTS0JFhfgAbyCBudim86AytwjZu6Y6cEZeqycc76Pg4u/9plrBLYXlbtK9YTdnxrwWx4Ob5B3vsyc2d42hZ3C+iIDbUAcq4cT0Wsn1XBeFnmyshVWKOJ1IUsZxTaIeaZvXv3+rjUnO6fNdvXgC1KhoCN/NPqHTjiPdwxxhuzjyRF6+StLtnItML0F0GXzw1XbBkYMeMgCMobPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 06:35:03 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 06:35:02 +0000
Date: Tue, 24 Feb 2026 17:34:58 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm: rmap: add a ZONE_DEVICE folio warning in
 folio_referenced()
Message-ID: <p4ir7f5fut5ih6satedb6vrk6zwokujr2iecccfcbgthlkdsdk@hhgpbymchzvk>
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <e91eaa86a6fbb0682b4e308082048c688a57c035.1771897150.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e91eaa86a6fbb0682b4e308082048c688a57c035.1771897150.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: SY5PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 34880f58-2c48-40f0-6e89-08de736ed73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhVHqsw+5mPKsKxptz8aoAdwtvSMiRRfTJFOcnQ5gjCDc6qDNCcnTAC0uiKn?=
 =?us-ascii?Q?yIzeYw9w/b5TBDA/We9aujg99cBuX/5SbxvvIwDzANIV0OWVtmsPE/WtRVbh?=
 =?us-ascii?Q?RKTEFYCUpOBsx3dbB3JzTOomqgltokAuq3XOwf67qTaNjKGPYk7b01NBzmoH?=
 =?us-ascii?Q?kr+0Xgjv82FEIYf3axH8MzKBHhT3gvOc8ETHGcajTrx9CFRYByRoeZq70ePZ?=
 =?us-ascii?Q?bjmPwcblbSUzHYjQs1ZD+8GZ7etH0gV/wFXwxmDDgQEmHp01didskV4NIXRE?=
 =?us-ascii?Q?URQi8095q/6AKqNwy6QEblApo8KdS142PGVnjsJ3Ojo4ghBGVaXq74/i84ft?=
 =?us-ascii?Q?CmbcZBsq0G+DOBoyvre7r2/I13rLr58phgjMVGVSF0qibVn6OP4irUtY/IYU?=
 =?us-ascii?Q?vZ+2d8e7n4lVYYcz+WwWNBUTAs5zYZd5bOeuDGVzno/xRUYM6mLb4rC+B8O6?=
 =?us-ascii?Q?OsBeMccYAa5iVHVtMShBomboskCSPp5qdBqV3SGozo57mLaJCjlQgv8EDOv2?=
 =?us-ascii?Q?DlvS0rXDSNzSNOwEfQ+SiTv1tY3INLr9UfAZ+etOqcAl6rgWKz4IWz/kCx08?=
 =?us-ascii?Q?kz6k09MLVJAxzd4dUkZV+IJRoo7uUEU7o871VHcS2oUQFo+yHKVW+vdwVsec?=
 =?us-ascii?Q?18mDNufKtES1qkezlLeuwHGFEyDkwr2QGd+v5o3VR9oGbHzq0A5qIGI6dggt?=
 =?us-ascii?Q?l2gc24AJuCeZVtwYaYd3vSTQeXa2bhus6uKHPCCa7x1tIH0g1azOMGGv198u?=
 =?us-ascii?Q?XlXtYR3a83gfcpblRCkRCjDXHZoiZD1Dpemur3+in6EY5hrYmiFJjU35JnbP?=
 =?us-ascii?Q?Viu2u3rWGdFgJQV9h/iaS4UftCePNsbOED3/FzEpU+7/16JsDEFQzAvQoNQj?=
 =?us-ascii?Q?ieueItspal4dikLtfom9fRyr2lqaISY/REGhcDDRZfRdM1fXAlI2Ik5roTcB?=
 =?us-ascii?Q?XYYrDanIUzbJPk0ZWVXekk2z5eY16ifDmbYhPdYuGVZi+/5kBKh14yd+gNXe?=
 =?us-ascii?Q?A8zBg8mzL5Pv/f4Emxi2MW4RWgUxxwji3AXMBqs2zZQ3mSOwiWecFxOfz/jm?=
 =?us-ascii?Q?yXHLYfr78YcyrGq6k4qdv8Ji70il/grBGRTg5WmppJ8nEFF1s8bvR7XzDFKl?=
 =?us-ascii?Q?Z6sW+M2uWYkMCxIEnxg3+d6exHme411zpLDpLGc7/gcRGuGS52Qx4lZAcg2w?=
 =?us-ascii?Q?x1obBRClDblg48UlAE1eX3qhzsZ2wocT5gskBY/Tkp97srXvCDDOiXjl68M4?=
 =?us-ascii?Q?gizN5in8byyMbG2BfzTrL6XXDKFZEke23TAhyZQcdJYt+SujbYLLSxrFXQs9?=
 =?us-ascii?Q?9Fmvd2hxySq0IX8YKcs+SF7xq8DyyfIMJJGFIid6J09S2R5zSjswB5fbu9Tq?=
 =?us-ascii?Q?ulhv2gCmxfg7lZTYAiWayt13hFA/903M8qC+yMcQhpmsyNcUm09x3OVRU9b3?=
 =?us-ascii?Q?46VbI9ywzcv5NaZS6/1T08rdij5pCtQSu6hq6PMmMNAo3H2Lxl7D0RuqCciC?=
 =?us-ascii?Q?uAqLuZEdiNELpAsC9HyFf14Pmk3SBzeNvJpLcUgqQFE2GYm+ySyal06ug3Lq?=
 =?us-ascii?Q?HJmm1v9HWElFwxAjCPhQO+2j5dSZIRmeKjg5n3QWBN8Wz0AuHjMQrrEslS9Z?=
 =?us-ascii?Q?TLfT/3oq8Uqo28H/CV7Amko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V6d1oiPKovPaK9nOongNnubKp2FGiT8ZMdLkhQCWbm4LxXW3L7qWi5itCOWg?=
 =?us-ascii?Q?xjdovo1NYfgNu18wcJ9DOazjie7N/kIA/WmqkcFmB+nX4EaYCQytMwXrtRPI?=
 =?us-ascii?Q?IC0IP/n2OxJR9a3BgTfUkLVCyeZk5fegOtKDvkAjhLh3DRCRsnf7KyqFUk/x?=
 =?us-ascii?Q?MnpDDf0E8X8gi2VGYefd/JrXCuhtAbwofOvGVX7UaHD+vmQLoU+i0Vzty/E7?=
 =?us-ascii?Q?kT1nbB6gMuful/SwMqVf2PGFvKEdJ7TLOz9T2mRwrnUP5/0jZps+SWlgqqa6?=
 =?us-ascii?Q?qqJ6GPn4iuvPT+cJcn4Jx1uxWzf1tg3RrsoKiz3yugmoQr9UZsEptvtS8PaO?=
 =?us-ascii?Q?l7fHB3mL8sMSEQU5JSg7cjlMS2Fjw5IedGgaPU7pZ3X4cNq3+SMMQN5FFUcN?=
 =?us-ascii?Q?WpZHPm5IrVIONNdK+8qYVuFya8r4OsF308gxgV3+e1dNeZQ30QKQndUvIUMh?=
 =?us-ascii?Q?08Mbronbkuz7qQZKHxAnUz0vHsmsbuVw+b83TU16J2bxPb/1NPoRsK6+8nCD?=
 =?us-ascii?Q?yj2EGOz6sP07OgktRp1rqjSUkXKZsDh6qXHtK28pcBm2O1MuxpQZ0Hnoag0C?=
 =?us-ascii?Q?8MKGZRyMg9n3lru4JzZdsHiVLzph8Qj/GJdRrrp3US2PVNagCE23qCFcaBB3?=
 =?us-ascii?Q?GtUaARZXHQqusR7otTQIL4ZDTIqE9oECxK4Z6etPAywRGD0u6XJrvFuzHGjM?=
 =?us-ascii?Q?qkOU54suNPOQ3GTxqouHJew4Hrk/9LNmt4aIN0CeijJYhGbTHDYvEj2MZN6x?=
 =?us-ascii?Q?eoN7zntTYeSC7HjgO268fgCWOtV5EBGdKwIHa7gR4gI6JIYVkChAvpXJOsxX?=
 =?us-ascii?Q?A2CoB+CHQey4TmghnyvKufYnbW82Y+f8KZVWqJRf90j90rT4UYHJgHptA97u?=
 =?us-ascii?Q?ypxMmmmqwmHM+aamRUKpiNL1pfLEfF6JMo/Br6GLV1OvS8DDK50Of7d/wdFS?=
 =?us-ascii?Q?Vd2KX30dlpgUs9+uGSzkYgxsQseIGQ+yg1mJ/0j+KUn4rHbOjcro30QE0Pzg?=
 =?us-ascii?Q?W/St9mh8+m6SCFNNguII/tNe9X802fGKCSxaEeSVn0vhfsFeGVyUIeTyxv9p?=
 =?us-ascii?Q?CGiYyPSDZbxyHadwTet+sqQAYsCK8XZLSqaFya+dyqu0Kp9aJNwVVh5m0TKu?=
 =?us-ascii?Q?jufBAJdYRg3Bv8JM8/+SL0dp9jLt2OqbLk+2PN5lxt8VxZLJdtMCzowXHbQ/?=
 =?us-ascii?Q?OlX4iTQpm2Qn3DCGeZUvbjkLtAI3WZxQ8Mg/2nCT8EqzKbgfIDOGPtYZfugj?=
 =?us-ascii?Q?Im96gVW70mNO1i1FkEgztzJw5dj9d5bLE6t7Gn0OaEUuomlAXVCrmWxLGWPM?=
 =?us-ascii?Q?ZDY9fEElfdUZaC8rw9UeYQxw3ONvIZ63dpH5zLem/Msbe61zYr/EsnatjBM8?=
 =?us-ascii?Q?dElaDoTJGisLIgHIlyMm4X/FQ1t5eIgAWxo28InIR/gn5nZS7/XenqWvI4pT?=
 =?us-ascii?Q?goTfMYa9+xot1pkOXiPl6jah9q5WqaRHzNIwj44uOqikf2fQYPu+uQgDPVO7?=
 =?us-ascii?Q?Y3byX274eC/QosaGJpDfAXrQIzJp+qo3frE065cIV5TOWREmHpCTjeyd2c+Q?=
 =?us-ascii?Q?slDlpO9rL2nzLKrhpJsMvqMeJR5B4iprt++gxqoHyTZ50yYuuLuLc4B/RKzv?=
 =?us-ascii?Q?VX5fU5lsOPPpfYt2q4OP30we7rOQzzo6ndtSpULfjGCSPRv1arZVRN7AT2fC?=
 =?us-ascii?Q?5wYVmsssba7YAQydqw6CZqErkdO2DW3HEZg0koRpOZatRpkyIxGNXX6YGKoQ?=
 =?us-ascii?Q?JOkfmCR2rQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34880f58-2c48-40f0-6e89-08de736ed73e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 06:35:02.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omZN2w4uZ75p74XqlW160TMRx51ojigBhEGDhd+5H/gBgD6gXWLm9G1o1Mn/9UNj6w0yaGsr61UFzwwb3q5KBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_223511_585503_F7C2FB2E 
X-CRM114-Status: GOOD (  14.29  )
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

On 2026-02-24 at 12:56 +1100, Baolin Wang <baolin.wang@linux.alibaba.com> wrote...
> The folio_referenced() is used to test whether a folio was referenced during
> reclaim. Moreover, ZONE_DEVICE folios are controlled by their device driver,
> have a lifetime tied to that driver, and are never placed on the LRU list.
> That means we should never try to reclaim ZONE_DEVICE folios, so add a warning
> to catch this unexpected behavior in folio_referenced() to avoid confusion,
> as discussed in the previous thread[1].

Agree with this so one you've handled Rik's comment feel free to add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> [1] https://lore.kernel.org/all/16fb7985-ec0f-4b56-91e7-404c5114f899@kernel.org/
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/rmap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index bff8f222004e..be785dfc9336 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1065,6 +1065,7 @@ int folio_referenced(struct folio *folio, int is_locked,
>  		.invalid_vma = invalid_folio_referenced_vma,
>  	};
>  
> +	VM_WARN_ON_FOLIO(folio_is_zone_device(folio), folio);
>  	*vm_flags = 0;
>  	if (!pra.mapcount)
>  		return 0;
> -- 
> 2.47.3
> 
> 

