Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3EECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfVMaxWhzAfXEBlq2sUdrZMFVA1/k7cw4GZZBgxfaRA=; b=dimFcVq4oOXMQsA30SNfOBpHT8
	aUVlZrs2Qd6azWftPziwERuizStnjnOHYtbJWaik8f7dysFdXLFFJW4zZs7sbuZUYrApSe2hAFGEk
	e6GXnLmocXPnFGM8qR9X2/bHGLmOPbY4WXHzRYXDGakN3i9sF2Nnt3qSKGBdjkMVs5GO3RXD29Q/A
	db9tVvyfGGNedxBtSYV3IlohMT5BeldVhqvvpoXwx4xVqN3f1llBqOpQ2ageJUFLk3trsQ6cOmyb6
	MSfx9YYiPpwjwUH6QCYD0qhn+v+A0U8KQYUX1Rt6Tl3efmS/c+v8Zdcc40Bs2o39TqOUqLLnRccvK
	XfaSfGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUU6d-0000000Debv-1iRK;
	Tue, 02 Jun 2026 18:44:51 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUU6b-0000000DebF-0fEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzC/kpq20wNbDqiVx1frzBP2PQtBuprjqB40/9yc2EnJQtqSvtfBye+T9v+teeFyqhKhWeCJGvzId2w8m/wvc6BjT50zuJLWohAEX4Qb+NnaG37TZpyZN5GGH0b846t4MJyOLmIwvYoFAX2fQe5BvvVgnwUmDve+Hwv3tjyDq4bMNDUEBwGwRBnmDE7tNmQhl2pRPC35Rq9LiUh+GDXndRv5GrDUP55WISq6G0Nm/3QESbx7AHIoquq7TmpVlJCFD4TWzcBb+MVK4KczPt+HYhrwdN/mOAH+ok07gmIEUkiuwB3HhnozZPkxYbvag7XTGWHJ0PKRAjbeIdwDR6XaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfVMaxWhzAfXEBlq2sUdrZMFVA1/k7cw4GZZBgxfaRA=;
 b=rg/NPKu8x6ziPvusX5sjcA7/m92yR5HYHdrZrtcjaOBh3Q7uuloIzRUCimnwT1gxoymwDwuI9fjUZ4ETjHlyTbnFBebEWb20a+QRedp090VQtwO8QB6Sdr0AtBeRhwqAjWqt9M31QEW8kTN3BqVOP9xmgKxEXxgphMGARerV9D0KCSnO3XIAyb6NtehqtLQUd5Mp5qQZgygayRWOXyvNOZnV4qYg+FeykIRex+qEq/nh8tHQSujtyzA90P6qrmnN32t3RCZqYNU7K1uEJUoKhmBOBH8BvLrawf9c9YUAnh+EHtgTQ6zlash0sJiWHLVy/MYlUx/vF+INSgAkdkXWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfVMaxWhzAfXEBlq2sUdrZMFVA1/k7cw4GZZBgxfaRA=;
 b=AAXmWjQaxguWilL/NfLNZdpz66bD5fcqunlDJWwXg6gNQNcMFuSDZuvToZOVCxZSM29uMBa0G0NoQlv0X9Q6N9LQcchLUykenOisabIr02IcxFS6h5oVqyfU3x7Loalzhqvm/xHNxvbCRa5Ed/hq0eyTH7IC39orZrIhbUchfWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 BY1PR01MB8683.prod.exchangelabs.com (2603:10b6:a03:5a9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Tue, 2 Jun 2026 18:44:42 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 18:44:42 +0000
Message-ID: <fdbc6d16-88af-4c6b-9e21-e01294c270b3@amperemail.onmicrosoft.com>
Date: Tue, 2 Jun 2026 14:44:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Huisong Li <lihuisong@huawei.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|BY1PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 217b8982-d36f-4f42-3217-08dec0d70224
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|10070799003|1800799024|376014|55112099003|22082099003|6133799003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: 25vC8gSZeus0bDPHMAXnuiWBZYSs5O9tTyIRTs0zqIgOi7fLzg5eb8zt+ZqCa+k1RId2irBaZ1AbtKl8cDx/5h2iTWJPkrrr4bFpdEaSw7O8oVYw21OCjTfFKzVX7Q8eOVBys8c1Pk00v0mmKFFTaFXAbJuv+zhJn/Rkg9Rx2LwGxVY649OES8Oui3wb1PGAL1+yKzGyYbB1FmJLd4Fa7kj8YiuOnLRRRUF2p73LJ1nOTX9wRbhI4AqjZ/I8lR5U6C/giqxylnHep1ss0WNyYKpj6C2g8UX/vYvQ72MyKZnKLUDXwE8pLAKHO/ZULE1WpoN8g4Cm5JQv5hHAzQ0Z8aFBoZyv7ss0FSi0M3c6hxXvCKvlS1O9qxpFnT1f7sH6IcX1RcP27OVv3JqwmdkkHmIGptQVvWLN2a1BWINt6j7siwY5Oe6tGR6XOWD8uscOW/OhleJr3Oihc9unr/jHG6wO0pPgypKBOV53/VZSb3qMrADCXqbrUhGrUiii6axnREens/jRx5QC6G7l4O04CrdALXSrbBF3DG/Lx9OhnkDQ3LgZpV0rvaN2aSSLMUGz9nwzQ+cU4QH0yf9q0mld57nTNbHW93iJnonpoa0i/d4bQmakXVPDX/cJZ8ArET1JUQ4mQvYKHmpbjZAmikM1X8OLgZbzYgeasoHTeP6aUmLf/j9viEe6OCDW6CH0b5hO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(10070799003)(1800799024)(376014)(55112099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdVMHZTNUJMTmFucVRPRWJQanhJTDdUaGsrZktVazNlN2VSbkxVUVNQMnhV?=
 =?utf-8?B?TkhKZkpONHhQM1V4US9YTERzOVd5UllHTFN0UmR3cXJNODN3bjVmcU9wNVM3?=
 =?utf-8?B?VkpJdjRKcEdLSm81TWxnTjZTRG1TdWNUKytzQkczcXBJWjI5eUlPR0JEdVFR?=
 =?utf-8?B?bm5GdjhmR0lhblhJcHdtNktmN3JENWFTWEt0WjN0Y21GelYvK2ZpTitjUmRM?=
 =?utf-8?B?OTAyUGRBNnEwWUVYVlhoZ1lYbGNrVUd5OTJjZXd5VEdBVVNtcnh4Y0p6ZnMv?=
 =?utf-8?B?SGM4VGwzRXZSaHlDYmZUMVc0OERYTlpRNjNNd3I1a2RtbUo4ZWNYSlVtWEpy?=
 =?utf-8?B?RmthUWRtMHl1NE9TQkk4OG5CMXNsTzVqV1JBNFJwWFRveHRqWDhzY0JFVERC?=
 =?utf-8?B?ZFBKNDVOeDE1Z1Z6QUxxREcwTVZGbWpHakFBK3d1eld3S1BYRzY0ZEhuZ0sv?=
 =?utf-8?B?Tnl6VWwrS0Z4TVA4S0haN1FYUFlJTEZ4blZCSDltdWJoNUw0SHd5ZVpjN2s4?=
 =?utf-8?B?Skhrd1MwdjIxaDlJTlY3Rjd1bzNUNHI3VGxVSkp3Q1RoZ0xXa0lBbE01QnJ0?=
 =?utf-8?B?VHhNck51bm9uazBmNjVWNWQweUR5a0w5R05CMVQxNHV1RHQrZkFOam9POTJR?=
 =?utf-8?B?Tmw1aUl4TmwwSjBJT3FoTUhuWnFnVEU0Tk5kQ2NJdDR6ZGRsVkIrU1YwbmlP?=
 =?utf-8?B?REQycjhDcTJWMWdpeTRjWFNEMVE0ZE5CekJVUmJBQWJTSGRnVjJVd1ZqeTFC?=
 =?utf-8?B?RTIyak4yVU9VUWRTT1VVVTVUeC9aR2dCYVkyM0poalk2RjRaZzFBSURYRVFl?=
 =?utf-8?B?ejRUR1VJTkYyNUxkeEdvYVlieU45c2xwN0hucjlGMU9tNGZQWlcxNmo2ZG9T?=
 =?utf-8?B?blI4eW5QOFVvRTVmZkVjcUFzd3NRVWZoNU5zV2ZXU2krNXdzWlEvZ1lFUjNX?=
 =?utf-8?B?VE5DRlFJcVFmUU0wQU9wYlhwR05YcFdYb0c5OWVxamg4YUVDcWZrSHp3a2M0?=
 =?utf-8?B?L0pWdzllM0FKUXI3djcwRmJCT3dwVWZTdlUrbmZUWERDeEk3Yzg2R1NyYTln?=
 =?utf-8?B?b25ucDNZWS96eFhEWVhpK3VjUzJBbXdTcWxIOTV5azZrOTl6SlFGSjd3am80?=
 =?utf-8?B?ZDRlSTNqYzMyeXVlTnowWWJZRk5tdnpLRE1IWGJUbUFxRDFNUGpQUmFpMEtW?=
 =?utf-8?B?SnVPQTZCOVIxci9WWm5jczNxNlBhNjhPaVgvenU1dGErUnUxZTRHellhK2pY?=
 =?utf-8?B?bFpWS1VSU1h1VFhySitLQStmNmNtQXZhVzBqM3dGZkJNZC9OMjk1QzlEN2Z1?=
 =?utf-8?B?eG1ETlMwVS9oUVNHQkJJRkFrczlMZ0llV0lFQzZRQXBwajZDaEZ2enBydytq?=
 =?utf-8?B?dDI4MVJrKy9sYlR5a1dkaGwyQldiVzVLTHMwcVM2MkJUQVBWVFBsSy9lU0R4?=
 =?utf-8?B?djQ0QWxEMWZDRGpkSkpSYndhSTZBTFZNb1Faa0twTTIzMjZTcnFvSERkNkNq?=
 =?utf-8?B?VlhHbE9HdGtVWGladVR1aGQyWVNLRHdyZG5QcGR5enRjQW8yMzVQWDRTNFI2?=
 =?utf-8?B?YVdxMFhUQUZCMVFNcjRhS0EyY0d3TG5UZFhKbmdKQVJyckI1R096RUdxUlRX?=
 =?utf-8?B?czZPbk1iTm13YzAwcklreTJuc2F6RFpDTFgvdjFkVGttTk1kNy9lN1ZqZTYy?=
 =?utf-8?B?N1pFM1ZvQzA0bTBMMjljalNqWFZpdFlsc3drOUpoNVRaRnpZSWs2SjM3a0R4?=
 =?utf-8?B?eG1sNFU2bkZtTzg3M2xzdk9rTjNaQXN4bmpTWTN5Q2pSQVg1eitqVXhtaEx6?=
 =?utf-8?B?NWxYdTRvY01QanIvNWh6dWdEeDZZNFY2OENqMzNyZzlHL0hRbjk4Yk1ENlE2?=
 =?utf-8?B?TE5oWHdmZ0lzOFBqR2FzVUlDd1g1NzNpcy8xUE1XaFpsMzBJWGVEUEFiTmMw?=
 =?utf-8?B?R1dRc21EZk1NQXV2NGxvTXB1Zktrak9qelRUSXBGUGRmd3YwZHdPNEdpWHZE?=
 =?utf-8?B?WlFRdlB1UVYvbVBhM0lUYVFZUi9Ma3lXQmlCcFB4azI1SnAvMFBPbkJ1Yy81?=
 =?utf-8?B?SG55Y0JvYXpXNkVUdGN0OUlGd01CZW9DOEtlSkZjL2daMUtrbEh0WEt0aEFD?=
 =?utf-8?B?OVd2ZkYyTEFuVTMvUlprRnhJdGl5eWxiQ3FjVTNpK21VNzhMOEJPMUwvQWhQ?=
 =?utf-8?B?VlhVa0hZT1R4WUNkdHJRZFdIY25ENXlXWmdMYTZUeGM0dHhBRDB4R3VUQmND?=
 =?utf-8?B?M0FlVVdpZXdsL0FrZXNxT1JVT0hBcE9rbktlKzBWUDJlSnh3Q2lFL2IyS01V?=
 =?utf-8?B?WlNxV0xuRnpPMVY0N1BKU3pVUlQ4TE92ZmM3dGJtVmowNDE2ME82Mjh5aUZ3?=
 =?utf-8?Q?b1du+SblF+UXD8sHWW/xRDcsVCAB+FCclc9VYD4POtac6?=
X-MS-Exchange-AntiSpam-MessageData-1: RovAOotpXvLNk0+RSc2DxvooH6xg/RUeJJTvirZyaTQxH/pGd6xVXgHR
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b8982-d36f-4f42-3217-08dec0d70224
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:44:42.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgEwOdv8kboJnuZ0xJfM0mEa1TmY222sy+g1WYVRaXr6K9VZKoCHyP7v5O6LAl8hWoNeQkxXm6YVwbFNU+PGNpDdQJ2GR/kloaXGTOAXZy+ylf6I8RO2sG8c2LeSuS1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_114449_203819_BF9F4D5A 
X-CRM114-Status: GOOD (  26.40  )
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

I am geting ready to resubmit this patch along with a series of other 
PCC based changes that show how it is necessary

for MCTP-PCC.

On 5/19/26 09:23, Sudeep Holla wrote:
> On Mon, May 18, 2026 at 03:30:06PM -0400, Adam Young wrote:
>> The tx_done callback function has a return code (rc) parameter
>> that the tx_done callback can use to determine how to handle an error.
>> However the IRQ handler was not setting that value if there is an error.
>>
>> The following clients are affected:
>>
>> drivers/acpi/cppc_acpi.c
>> drivers/i2c/busses/i2c-xgene-slimpro.c
>> drivers/hwmon/xgene-hwmon.c
>> drivers/soc/hisilicon/kunpeng_hccs.c
>> drivers/devfreq/hisi_uncore_freq.c
>>
>> All of these only use the error code to report, so they
>> are expecting an error code to come thorugh, but they
>> do not modify behavior based on this code.
>>
>> In the case of an error code in the IRQ, the handler was returning
>> IRQ_NONE which is not correct:  the IRQ handler was matched
>> to the IRQ.  This mean that multiple error codes returned from
>> a PCC triggered interrupt would end up disabling the device.
>>
>> In addition, if the error code IRQ was coming from a Type4 Device that was
>> expecting an IRQ response, that device would then be hung.
>>
>> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
>> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
>>
>> ---
>> ---
>>   drivers/mailbox/pcc.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>> index 636879ae1db7..16b9ce087b9e 100644
>> --- a/drivers/mailbox/pcc.c
>> +++ b/drivers/mailbox/pcc.c
>> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   {
>>   	struct pcc_chan_info *pchan;
>>   	struct mbox_chan *chan = p;
>> +	int rc;
>>   
>>   	pchan = chan->con_priv;
>>   
>> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	if (!pcc_mbox_cmd_complete_check(pchan))
>>   		return IRQ_NONE;
>>   
>> -	if (pcc_mbox_error_check_and_clear(pchan))
>> -		return IRQ_NONE;
>> +	rc = pcc_mbox_error_check_and_clear(pchan);
> I think we may have to skip the check inside pcc_mbox_error_check_and_clear()
> for Type 4 channel as the spec expects OSPM to ignore it. It is a separate
> fix, just noting that here.

I will submit this as a pre-req patch.


>
>>   
>>   	/*
>>   	 * Clear this flag after updating interrupt ack register and just
>> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	 * required to avoid any possible race in updatation of this flag.
>>   	 */
>>   	pchan->chan_in_use = false;
>> -	mbox_chan_received_data(chan, NULL);
>> -	mbox_chan_txdone(chan, 0);
>> +	if (!rc)
>> +		mbox_chan_received_data(chan, NULL);
> Not sure if making this conditional is good as some platforms may expect
> it to move the state machine, I am not sure 100% just thinking aloud here.

That is currently not the case.  Right now, and error code 
short-circuits and further execution of the IRC handler.  I think that 
those drivers would need to be changes to have a tx_done callback instead.


>

