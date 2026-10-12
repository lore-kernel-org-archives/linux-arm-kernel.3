Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6DACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivPw5fMlHTxOKMrpHokezTc061nssFOtjEgmYvbr8sQ=; b=ypUpZWmKlC0O3EE82btbQQsef8
	L3t/Ytfy88kP2dq0Z5Cqm4Pf6BQk8Q5GfjuO0JyO+S9dNHugVOkHgDBa6LHGsHbzRupmevOaOFy+i
	MjI43kT4FRzV9FnFJ2WUQTAmCbG7pq7wZLX4rDjGL9aMu8UtPEm1lrsQFbOGuYPYxgc9juIufuyuM
	avwVblG+PlI9n7yarY00UCi+tIS0nu4HaKt58aztXffJQqECj874m8xniLLGb92fHx7sZB94Rrfez
	7z6KfJavVlSyUVm904aQlkO0uW91ZYZi0R1MQjAs3KDUBrAvTmBaY0LOJqVvXZqTf6428fBs3LutH
	+7nVnkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGELU-0000000AMTM-2HsV;
	Mon, 12 Oct 2026 11:37:32 +0000
Received: from mail-francecentralazon11013050.outbound.protection.outlook.com ([40.107.162.50] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGELS-0000000AMSm-0aZg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd5c1NF+TJEiAUJhPb/IG8waVXjJvnLQjQm9pzWX41WqttRZfF+vNvlMMqtjgunGDTb6RLV9WddSfJAuD9q35JA3cUPsLbaTAFOw6IXzL0O9FA1rmASp7CUhk6osWLDx1VzR3Rxr40oZWJYmZV7um4J78S6lY5BJCV67Jskxyf+wV6SrPMeNPGTYkKEgK5KHPvv67hS6mh4nhS8tWMt6+gDIfqW31lkS1LzUmFqoRgOy4ILg4UCqq9IK9A0GjOGEuSLAH7pZTwe9HlnGMLucBNkH1tzXHokn9JjF6PNpAYj6rchp+a65cOZTrKXW6DA4svHofL62tAumjGgQBGa6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivPw5fMlHTxOKMrpHokezTc061nssFOtjEgmYvbr8sQ=;
 b=tizqUFJb94ueYyJfr2uVypfn7UZsRFu8OISASRW6mcwSgz3xETtS2tthMCKDcdX9wCvbRXjhpmiqGtju2P4CuwoZgfFrNnempPiEzncgUswSXGozDPlMQpoqBm2GZhUBJvk8HkOODkZMF41L7XaT6qvaIt9m4CbbOJYCBdylXhqDKtrv4JhQC1Bv9Sg4JnKwdHRciqofD+etkKHLoHv2a6T2dXMkyfJqaz3yUdI4f7ikP3oqyEiImB5Z9to7VmfG2i8ZlfFuq2/ZAISwnzEfFuct6sUJCfhrE64R87cTYtxf/Af8GF9vQ+zQCENciLI5WpM0Z/w+l3x9zJHGMSI28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivPw5fMlHTxOKMrpHokezTc061nssFOtjEgmYvbr8sQ=;
 b=A8u8aQrJbCxnc5MMkrTYt0bcyjPX1ETNDJSD+y5CrTY7TZ/IwmLg73ibeFEZE9teXNvIG5V/ntw2KVYMImgdFqv6bT7xF26vwuoICwtfj58InAP3A3GR7yujzISHl0QJEnMfHZkVO1UMe9Z3Oq44vTA4l7XTfU7qaym9MxeIRhuY4fs8MSCSR/LKx5P/MB8hGYg14EWvRr6Ye47YIoNrzcSm8jkoQQacr2UtOQhfrcPOKB3UcqD+wcyMmQViau1NOa+bHmrC1ASjAwcpy+exCpLtviSpXGFUFZZ6ejOO3Pl69cqRwYmjig0vMY5KVRHw9M+auCCYu42GYBppbqDc4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:37:22 +0000
Received: from PA4PR04MB7885.eurprd04.prod.outlook.com
 ([fe80::6e41:b858:46f8:c5c7]) by PA4PR04MB7885.eurprd04.prod.outlook.com
 ([fe80::6e41:b858:46f8:c5c7%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:37:22 +0000
Date: Mon, 12 Oct 2026 19:41:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <aszHhGylycuDIY35@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
 <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89>
 <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7885:EE_|PAXPR04MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: 72eb330c-eb97-4899-36dc-08df28552ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: x/jKt/s19qzT1KiPZixQ5OB9ddwNAQvRJ8AU67BqzGeXB37f+3hp6CkUWDllOTnQkLp7Zl9mhPcEFGgEfR161ZnQlKO+Mv/HhTXXd0PJi3EX/vG3iGBO3EKyqMDJhMdiy+LWwFVf00X37v96eGEw3ztUIGVaKeIjXFdI9dzZ5Uz+wKSXQFWsoi/1w4ucAFo+zRle5hv7JLqwShYED0PwjkO1nhHzQwZgqQ/9Fx1PbURYBuNhhwOYlu7WcNuypj3iJnYTz7/xqvBU0Ojn2Q+S+oTnzSNsOwPg7wvW6uRg6UfDvDiwrZ6a6F8LXhT+bx7CsXzU2L4V1x2kYPHx5c7efOxDqKeQCpfULcL52lu58eIi7wkB0Lasd8E/c75YPyMj4344tIaQEfgOrg6dm4n+COHD7NX9lMixlf2flrH7kP+5sLEQb2tnFoQp8DuPhvEOLPLTaWI1mpDz2mMDNK2BDc7OXvoRaL1qTukQPfK50giED3fQFeaADOffgyyEaU2QBicr+/Ai70vXoqjl8ZsnMUhl1pNKSOzG3ITqzXQIPR3/SPCOeej1k+e1pBq1miFx7CDQ73xTd/TdRmBd4Wgb4lZP4oooncOXb0qqv0hi9c3R4+WRnF7Bh4HBde2OXnvJMCpmUPizseX8QS1K0caOVP7LCdg3tCFAOMJvxvkuPnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7885.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dndvMHdYUnA0MHVUWVF2VStvZFo2OFFyS1VqMjNtWWRPUkllTFRYeEFSSmoz?=
 =?utf-8?B?ZjQvUStSeXA5RG5RdVhkLzJRVGNmQTVVWmJkbUtXRStQMjNkQTI4NUZOYWhs?=
 =?utf-8?B?V3VvbFE3TktOaTJEU2ZhK2NSN3JtTVN0ellLczV1OUVybGtPbTd6dmFoZ0hX?=
 =?utf-8?B?SGhrV29NT0tOcHJNSmY5T0xDQVpzWHRsMW5wM3R1ODM5dTByN3lsSjFkMTd6?=
 =?utf-8?B?TEEzcTBDZzFyL21hRG9qZ05yUnBwMnlVaHlPVXJKbG14bDNEQWNubXNTSTJ4?=
 =?utf-8?B?V2NxM01McURnYmZzWEhnNkhTV2J2SkxNWnlpVy9PdWFab1M2VU5BUkF0QlFY?=
 =?utf-8?B?aHN6TWt2bWNvVGxOZ0FENmpEZmZyVStxYUtnSWJUeCtkSzJXR1YwTzBJMkl4?=
 =?utf-8?B?Nkd4WWFFVWtxbmVLVGQxc0dzQWdoTEx4VnpJRFlkSU9zRDRBSWFzbUJMZndz?=
 =?utf-8?B?R3c4aWVHNlZCK0I3MWR0dHAxSExQUzRObTFPam90dlp0WjB6bytvV0dmZ08r?=
 =?utf-8?B?N2VqRzJNMHk5eU5uRjdFWXdpVVc2ZVpHejFCWC9DLzcwN3FZZEFWQUxudjhj?=
 =?utf-8?B?QlN3UWNxeGprcmtmbXpyUDNnZmRJdG1XSnlLMHZ2d2ZxclRHODY5Sk95Ukdr?=
 =?utf-8?B?bnlmQUMrR0tmSFdMVnFrMk5BbWJXQk14M1l3MDhENEpRUG1wWnFMTElaM3l1?=
 =?utf-8?B?OVhJdUhETFNnMllUSmFtQVplMkNZa3Q3SFpnKzJGUjQwT3BtaCtMdjQ0Unlo?=
 =?utf-8?B?SnJSdGlJZlViL0pGQkQ5ZHZWcW91a29JVkdsbzVrZW5ueHVtNW0vT2kxalJW?=
 =?utf-8?B?NVh6ekJWKys4c1psMWtPa0laSFEzZlYrTzN3eEV1Wk9UNnVKQ05idHRpZ1Ja?=
 =?utf-8?B?TFFFV0dwVVhSTzVYQlh4STdhbnRGNm1ZZ1FuZWQ2UVRjdWgyeEtTclpQUEFs?=
 =?utf-8?B?WFowZ3pxd2d6c2dGVEpNUHU0akg4QnNpcWk5RGlyVUZxNlFLa0JXTTgxNGJK?=
 =?utf-8?B?QnJSazNXMlEzaFdkR0Qra3hqMFA2d3NyLzM1bVhQejE5NlVlV1ZFbDUyYmVM?=
 =?utf-8?B?Y1QwRjRBOFZMQW42c3pjelVrWmxrclNldG1mbU9EaHU2emVmSzlhVWl3aHRM?=
 =?utf-8?B?d0hlLzBmaG9kK1hNVTJFUCtCSEZibFhpZCtXUnlTVXpWVWpKYTdBdnEvZFFl?=
 =?utf-8?B?VXdTT2l4L0F5dVJPd2dTVFdwbU96dzhNSWh0SENiNDBjSUF2VmtrNnZSUEJl?=
 =?utf-8?B?c0ZnRGVRdWt6SnRiNi8xZmNjVkYxT0NRWnZwanpiYm9OS0tLM3J6YkJBNHFn?=
 =?utf-8?B?Nk1mWGVDcHRiZzN3L0RJVWNvWHdPdXRSRGkxN0JTMHlPSVRQTkNqNFJ1cW9p?=
 =?utf-8?B?clhacll4YUJnYWt4SjQvdXo2Y1NzcVRaWnRwUjlRTXdVQ2w4ZFE3WFlIUm5r?=
 =?utf-8?B?N1JJRGwza1l0cXZxS0ZzSWZRdUg1ci9PLzBrYkdHa0x6OTkveC9TNW9DRWZO?=
 =?utf-8?B?MEVwSTMzMU0waWo5S0dOU053eXl0NXJ4RlJNZUNHVjB1TFd0L3JJMzJFeitr?=
 =?utf-8?B?eTRtZFNhZXpTMkI5QnhENitSd0ZNMFExTnlLeUxIVGtMSUlPNHg1WVZ6TFB2?=
 =?utf-8?B?T0VFbGZiNlJ5ZDFrbHNEMzRrSHNESnA2aFZrWkFwRVVNWlhsY2Q4NFd3dzVL?=
 =?utf-8?B?UWkrck84ajgwRDE5UmhuMFlJV0diS3oxaUdPNW9CTGFkNlp2dTNkTlRMcEk4?=
 =?utf-8?B?K3ZvekxKeDZZdUI3Y045ZG1JaTljUzBQd2crNUxrVXNqenMwS0gxWDR4SlNY?=
 =?utf-8?B?cGszVE8rV0FtbFZ6QnZMWEljdTVRZzhqMGJhNnROTUZWTTc3WEJBYTFrZU9q?=
 =?utf-8?B?QkQ4a0FCaXIySVVSNFhSclBJNzdRV1ZwaVQxcTJWbGRiSEM0dEZLRjR5bDAy?=
 =?utf-8?B?RFdML2tJVjd4dTdPL2NMSmN4OWgyQUNLcGRidy9XMmpWMFpwMCs1M3RrQVpx?=
 =?utf-8?B?NHFoWFMxR3dmQUd4d1hMU2tPUWlEaEE3ODBuSW5YTjJlZ0s1QldMUGQ4K2My?=
 =?utf-8?B?VmNUN0VFUTNNNHlOMmlpMm5Fdy9wT05zR2Q5Tmt0elpwbStZVjVhay90UXBU?=
 =?utf-8?B?Sno2VEQwSFk1aWJFTEY4bUZ1ZU95UlpTM09wbiszbjBlRWczYmZ5Mm4xd3E5?=
 =?utf-8?B?c09BczYwSjIwYUVDNy9wNkd6SzVkM0p3czBqSkNKK2ZhdWVpYnlORGNSc3Ji?=
 =?utf-8?B?M0VNUGEyVUM0R1lRZCt1cUcxK0N2bGljL2VvNlVnTVp3V2NxRDcvSmtoWDVq?=
 =?utf-8?B?MzVIbnlpbUxLaW1FN3M2OW8ya2F5TXJEWWNZRzlLOWR3NXZxQUdKcWtXaVdI?=
 =?utf-8?Q?h4PxmU6PeBfSkoPwX/0czU6/yJ3H4x7MCQnAy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72eb330c-eb97-4899-36dc-08df28552ded
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:37:22.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKQ4WxhnXGnEM+2ojlF+3ctSdZKMCZ32PT5bBAfoWPVCdA1mxdL9h9dmRaWZohUqDPdcKWYLacl4GjZvsbBuduB649dQ2oDDAECf2r2hqrumX0EwCx3fjqjeBx/c3Sj7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_043730_218168_DD6633E5 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Oct 12, 2026 at 01:30:04PM +0300, Andy Shevchenko wrote:
>On Mon, Oct 12, 2026 at 12:46 PM Peng Fan <peng.fan@oss.nxp.com> wrote:
>> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
>> >On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>> >>
>> >> gpio_set_wake_irq() can be called concurrently for different pins on
>> >> the same port, so use atomic bitops when modifying wakeup_pads.
>> >
>> >The code doesn't modify any reader part of this member. So, the above
>> >paragraph is incorrect, right? Otherwise it needs to be clarified how
>> >assign_bit() does change anything.
>>
>> I will replace with below:
>>
>> gpio_set_wake_irq() can be called concurrently for different pins on
>> the same port. The IRQ core serializes per irq descriptor, but
>> different pins have different descriptors, so concurrent calls for
>> pins on the same port run without mutual exclusion. The plain |= and
>> &= on wakeup_pads are non-atomic read-modify-write operations that
>> can lose updates when two CPUs modify different bits simultaneously.
>> Replace them with assign_bit() to make the modifications atomic.
>
>Right, but the code does change only the writer side. There is no
>reader side that was changed. So this patch does *not* add any
>atomicity. You also need to check if the reader side already uses
>test_bit() or something like that. Otherwise it makes no sense.

The writer-vs-writer race is the concern: two concurrent
gpio_set_wake_irq() calls for different pins on the same port both do
a non-atomic read-modify-write on the same wakeup_pads word. The old
|= and &= compile to separate load/modify/store instructions that can
interleave, losing one CPU's update.

assign_bit() uses an atomic RMW instruction, so concurrent writers to
different bits in the same word are safe.

The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
runs in noirq context where no concurrent writer can execute, so
reader atomicity is not needed.

Regards,
Peng


