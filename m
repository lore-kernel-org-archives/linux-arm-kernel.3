Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 06:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYu3E1Wz2O5zCAYzZrEPhFrgZa3pYEty+cPyoF2sKi8=; b=qlFFJK4myHo6IxqXW+xOxhJfZ4
	YXz8M5c1imFxNGJ/6z32Z56fYJkMGV8c3pOaV0QlPgIWfs3ZoESqyG1CXvNOt0dJWKMxa/E5jEjPb
	pNk7huy3F5U/yJBUpu9o/MlzrMq77+g6gDejyuJ134iEVxTjaVI3KmKajUmv0FCQJFYFW/J9uP15m
	TXHu1ZGfcNfb46VSXwToDO/0X3vLE7z+W7AddjVg0IXTgcKV08MK+aATuy3jX3UEDQC4Rc5KaQ6q5
	z8FiSb24KEFvxooWjlVWNfzhsCn5bK/McIw+hiFb9hessB6zAZkD/7xdoCI5nR+mRabB1unWqv6Pu
	R2IC0luQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1b6-0000000GE8G-1Dt2;
	Thu, 04 Jun 2026 06:30:32 +0000
Received: from mail-westus3azon11012023.outbound.protection.outlook.com ([40.107.209.23] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1b3-0000000GE7i-01Fa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 06:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8oKW97P/7VKrFdRZ54/ZV8wsDdsIip2GI2ig5StZ3Ewp9G3fG7EXu2i1sl1Tb1l2W7YbNNwOp/j123pfCtjy6W3DOhVpi8abJIaiNYi/6N6R5ADjhtNtzd8WVreXSYCMLPylwrTXGPp+yTjbrUg3ftWvXegsTNKwdz52l/r+HEzqz4kBmMzt9mao9NrkJw2u0q3Kzw4uMtJbfUPjo9FO1v9hf1Jd5Ib0153tLHdThnF2v8Rghr53AcFUjOapikxxPP2aqnnq/7AiGT6wxmRPracAwZbN8RD62gTTYkE0oLpcO/qneM58jWsRKdEbcbmJXnbStYBl4muQUgDSfPk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYu3E1Wz2O5zCAYzZrEPhFrgZa3pYEty+cPyoF2sKi8=;
 b=OPjIwpAxW0xWqjFi05J/5qQVk402pli8Ry/kBCSjaUoxOD49he7IwVh2yJqJduCgrEpsLibpEnwl4g/dkVwQ0Qpz44JEdWfWKWwV8GBrc6ZtJ07Y2S+LzEeNOy5SKLELZJl8aqiZahnCdI0LTxyKM+Wq2M3+ziuv6NUQ+wif4OHgUvVN2nIUckOGnhhWXhhOiB0uBTQDvipS8XJuRqR+KwuMTErHB/B0Zv/S+1YcdF1IqD8w0xI2kDb3VKnaktNr7p3xSk2CgjJDjyt4dMa+x5zgnEQwepRvO95uijd1OqvUkU2kkBKXk22K/rUhojqD+oPXHOA8GifYec3mYcaEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYu3E1Wz2O5zCAYzZrEPhFrgZa3pYEty+cPyoF2sKi8=;
 b=1yYXlPCRRn+nrQhP1btrfedxWdVdCtXoQpIjq/TO9L7j5tNsXm0KFaEpvQL3F5cLWzxclRjwcXvf0ch+QL6bHv9+nfCP5sTS9xSbIZUIH3+b5JiCqIeoQ1qYv4ge3JUfGGG/JQKui0Efi11FzaHEwh7kSlA6lkcVAn9dsqmbuIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:30:22 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:30:22 +0000
Message-ID: <e331f8d0-11e7-40c1-b4f5-76a591e93bd9@amd.com>
Date: Thu, 4 Jun 2026 08:30:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: xilinx_hwicap: replace in_be32/out_be32 with
 ioread32be/iowrite32be
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 chleroy@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20260602035717.623208-1-rosenp@gmail.com>
 <878fd338-b4d0-4e46-987c-5a0ee52989dc@amd.com>
 <CAKxU2N_U=Wk4f9ankopVBMRGH+YdTn8FOuyoDs4Of04o63bTHg@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAKxU2N_U=Wk4f9ankopVBMRGH+YdTn8FOuyoDs4Of04o63bTHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: ac23642c-7791-458d-8844-08dec202c14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: j/kLOL97/1GOxuz7M0XfUw+Pw8F4xorZyW4l/QzbP3aL5eMp44Alh22WG12RLb/orDGbshhXnHAblP2uN3E7HGj2QmLwFOKPwU8vbd27hVdODp0cbZBF74CAd9WBIodRVdc0GPlBEp0Nz+ncnL4vDxO9+M6EOBqtH8TsHYBn0hwPNHYqGTu36XLtj6noUYPt0xKFWb2d1IMJgcFD9TgMsrr75rgPB6F8Apddm5MEp1/NTKHMRRKu2kjU8uaYAscMYvsgcORGI029l212lmfRu+/2zfV5lKxCrtwpimtr/ednAAvSygiLcOuYfKuhMWCheelZFO16HovhvpbbG8ttIAa/4gXDk1YYrIAGxwgcNWQANjrhE2T7Ak7SV82nLFC/09Nn4Lek+RXxjDwVyU7Jqz6kbRjA5edUBEfjxTIKsp47Yd33vV9zn0SWG537hFkX5Rz1tfKD/aocbnGyJ9AonFHbhXtu/QbPxuk6poxZa6sP4aBsexwUQyrR2uTAPVJeo+wMC+2mdu+fIANf1iPTU4F17NMpeAkHYFrdrQDrVK/ul6CQZLoBsvgMKkdXjZzhC1PMnUK0HwHhUYeLj7Hl0vwXrlvJ9k9apjD2ivXxMA4hLXA3gY1Af5HzwW28rLb+xDITZ3IJhA5OF2LZa0YKHHbr53Ge0OXIilEQMlq+3K5KmKpdtzlSvme6jxFlKkgK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5NRFVTTXVGRU9FQ20rRFRqVFlVWnA4ajRUTGFha3k4NW1yM0gzN01wYmw1?=
 =?utf-8?B?WDNlOGtsUjB2akpqSXYzNytRT3NRSFBxaUU4VFAzL2dIR1BXNXZZVGwwdG9O?=
 =?utf-8?B?NXE1aGFSNlAxcnljZUdya1c1YWpwcS9jT1ViaW45TGZZall4TjFpNVZVc2Fl?=
 =?utf-8?B?OGZ4MmM0amJLdCsvbnVZcHErT3RoTTBZZmIvSmp1Qm45ZDc4ODI5WUVVTlpa?=
 =?utf-8?B?eGpKdHl2Q1A5bkh5NmhnL2h6ZkNOL0dYOWwwNDNVYkNndVJuVFRKZWFJTUpG?=
 =?utf-8?B?ZlBvWjJwb3RnTjJRbmhlTVB3QmJmRTBmT25WRjNvY1FFKzFpb1hwL005dVBt?=
 =?utf-8?B?cXF2ZW52djJLODBnTjRkQTVEb2ZqVHE4NXcxS1dxYkozQzM5VkdVV0VlMlJV?=
 =?utf-8?B?OG9EalI1MTV5dGgwWnY5VUwzeDBtbU0vcDQ5QU1Qc01GTW9XVXBTZ2FkeG9G?=
 =?utf-8?B?THNxQjZtQzJVVDV4ZHJiY1puUmtMeU5XMVhaSXE4TUpadkROQnFHOXdXYm8r?=
 =?utf-8?B?WnN6dHZlcStLZkI0V3RpZW45Y1ROR25TRk8xdzlKOXlJT3VwalkzM2UxcHpF?=
 =?utf-8?B?U1pvYnVwKzBsUHBLcmljVHBXRkhWT0ErUTJITWcrK3A3Q3BkMWZqMFN1VlJQ?=
 =?utf-8?B?Z2pGM3dpT1RXUlVyRmx5KzhiMllobmhhdytLMzVINXFqazVIRElVVUp4TWtn?=
 =?utf-8?B?VlhIMFZXWHVxeHR2NXFScGZpa3EyU3oveUN2QllRaFdZKzBhYXhUL1pXS2Ny?=
 =?utf-8?B?bHd1S0JoamFsRGtaZWV2akhvSE1RT3BzUjdNMWNwcnBKMFFDVzZTZ1l5VTQx?=
 =?utf-8?B?ZHE1a2ZLQ1ZPK0pxTkNuNHdpMUpqMXYwaUYrb2dZaUlJcXJUbVE3cUZyK3Ft?=
 =?utf-8?B?a0FESkhVTWtsa3VlRDNHaG5hRHhjWlVUb1FleEhmMVpTajNmaWR0bkZaRmUw?=
 =?utf-8?B?UFR2NmtwZWU5SVRKUkNBWS9zTTJkL3p4ajdIaVRCaTc4YnNHVmlaNWFvOFps?=
 =?utf-8?B?QVp1YmxVU1g0T04yOTNVbVZUM1JSM0NvY0JKdjFOVnZKTmlkdm5TeFBLOXBk?=
 =?utf-8?B?emUrUTJ1VnNCVlZyckpST1lqcS9lZ3pDSDN5VE5KMzhGaEdueXkxaU5TTDdV?=
 =?utf-8?B?ekV3L0RLK2llRHFsOXl1YXU3VFZzcGhyNWVaakg2dmRjSUF1ZkhtYVZnME53?=
 =?utf-8?B?ZFh2b2xjQkkwVG1vN1RQblNwalZwNUJxUGh0eFBRcnZLekdDdjVXTHZCOVRw?=
 =?utf-8?B?NjFiZ3AxRUdrb1piODVOR25mZlROMjJxeWdSYmRIcHJLL0tHbHZrVHE4SmFX?=
 =?utf-8?B?UmNYSy9ZYXpWK29xeUpBL1JZaEJseHB5Q1BPaHlBN2hicjZaaDdIcHhjVWg3?=
 =?utf-8?B?M2tLdEx4WTNKRGZ2VmhuTGQ1Vzg0UHlsK25xWkZzK20wWHdMQW9qTmhIVkhT?=
 =?utf-8?B?Zk1VeE9IckoxWDIwRUJZQnQ4M0ZYTE8vRVFHWktkeDdiWkZ3MGJuTVBBeGlm?=
 =?utf-8?B?WHVIN0orWURnMXFpQzQwc052dHFnZWFRMi9hck1oNFhXSWNCcTR0bExOeEhW?=
 =?utf-8?B?RUl1THg2NGFZUUJ6K3RNbzBTR3hETzU0TlRwRmY5K04xVW00bjZzUThJRGx1?=
 =?utf-8?B?MWYyZFhJTWE3SC95Y3BzYkE0UTc5YUdvdk0zVUJUajY1QzZFbkpISnRlZ0pV?=
 =?utf-8?B?VVZ1dmhkY09TY1ZLbjUrQ3UxVFNpK0xKbkFOVEM2RDlXUDZNYXF2RklyZmp5?=
 =?utf-8?B?UXZHTExUTldWcVRJUDh2L2Q4NDRVaHY2RTMvTnMrNm5mRG5uS0UyQjgrdUsr?=
 =?utf-8?B?akJEVGFXNXRUcDVCS2w1eWJQRkJ4SHdDNlZnM1Vlcmh3QWRiZE9WQzQxeTFy?=
 =?utf-8?B?N1hnMFluTncrM3hnVG1DNVZhZnNvVjNIc1RyVE9qcmYrZFpVZ0MvRG1ybkgz?=
 =?utf-8?B?RkgrWEZUZFlsUzhaYURrY09xWHMvS1hVbVIzT1lBVnJTSHdlREdxTmNpUDEv?=
 =?utf-8?B?bWNMK0pTaEtaV05oWGtyNkR5L3FxMHNpaU56dTlkNEFHemM0L0MzNXV3NG9p?=
 =?utf-8?B?TnV2WkhPWW5jZllVbmx5WkJxUGlacWFCSTZpcmJtWTNmM2NRN29EQlMzUWY0?=
 =?utf-8?B?MmVkOG8va1h5WFMvYzJWZWNVV3BHemh5aDg1Umh0aS9tM2UzZUlKclpUQU1u?=
 =?utf-8?B?Tms5TkJpYk9HU3VJOEZMTGhRdHY3eWdXN0V2VER4RFBabUtsZHE0V0U0aXQ5?=
 =?utf-8?B?K1IyR0lnajVGYkFGT0w0eFBlTld1WnVXRVRPaUg2ZHJLM2Z5K2pjT1poL2py?=
 =?utf-8?B?V1RURndXd0JSd2RETzlmQmo1WkttRGNaOHV6eXVZakhIZVhEb2NjQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac23642c-7791-458d-8844-08dec202c14a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:30:22.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Jj4MoCScAJ6+EjFklqT7Kqv9qGjZhr3t9j49YGIA9mtYSTKRoeJ0tSdICjOjtKA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_233029_077370_C5932CE8 
X-CRM114-Status: GOOD (  13.27  )
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



On 6/3/26 21:52, Rosen Penev wrote:
> On Mon, Jun 1, 2026 at 11:22 PM Michal Simek <michal.simek@amd.com> wrote:
>>
>>
>>
>> On 6/2/26 05:57, Rosen Penev wrote:
>>> Mechanical conversion of the ppc4xx-specific accessors to the generic
>>> portable helpers.
>>>
>>> As a result, COMPILE_TEST is added for extra compile coverage.
>>>
>>> Assisted-by: opencode:big-pickle
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>    drivers/char/Kconfig                     |  2 +-
>>>    drivers/char/xilinx_hwicap/buffer_icap.c | 16 +++++------
>>>    drivers/char/xilinx_hwicap/fifo_icap.c   | 34 +++++++++++-------------
>>>    3 files changed, 24 insertions(+), 28 deletions(-)
>>
>> I don't really mind about this because I think that we can also remove the whole
>> driver.
> I looked into this. The problem here is that there are actual users
> 
> arch/microblaze/boot/dts/system.dts
> 
> and
> 
> arch/mips/boot/dts/xilfpga/nexys4ddr.dts


I can't see users of it.

on v7.1-rc1
$ git grep opb-hwicap
Documentation/devicetree/bindings/xilinx.txt:126: 
"xlnx,opb-hwicap-1.00.b".
drivers/char/xilinx_hwicap/xilinx_hwicap.c:733: { .compatible = 
"xlnx,opb-hwicap-1.00.b", .data = &buffer_icap_config},
$ git grep xps-hwicap
Documentation/devicetree/bindings/xilinx.txt:125:               - compatible : 
should contain "xlnx,xps-hwicap-1.00.a" or
drivers/char/xilinx_hwicap/xilinx_hwicap.c:734: { .compatible = 
"xlnx,xps-hwicap-1.00.a", .data = &fifo_icap_config},

Thanks,
Michal

