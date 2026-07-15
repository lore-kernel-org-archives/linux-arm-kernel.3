Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC988C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1Z/xLKs4TOg0eAYHeHh/2ehT7l+aSr/5Oh1a8Te1l4=; b=SqXzlu/AdDZ5gZXsQ2Zx05xbtg
	oSYpI8FvyCaSj9Xx2z5vA+eiZ04sB/FC9i9LbdHCzWtXfoQ5DLOVgvPhVW/QnnbP4HRkoKmVGmYRw
	P//SkEvl1U51+6Y445xA/0ldyEGozYZBCxvSCRIGnIz0lNWxG/+t1w2i1svpCIRoj7lZDFyTD8u0w
	SJNI6g4RYgO1n9/OYqXQ1lGM4S/DuZZbluqsYxBaX/GFysUxjVw9qwVFQxfyrQhSiSb8tNZiC0oPK
	vC1ALBSL+JO4L/sTuVsxLN7QL3jUhUDKuVMX45VTK0eEnxmOX8pqVK4bqsf7WNKBFgqmOgtEiau0O
	ZloU7+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpOF-0000000DcqJ-0pfM;
	Wed, 15 Jul 2026 02:30:28 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpOB-0000000Dcpl-248f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 02:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaGPr8N2wcZmJ4rlKJDt8Plzm3HPjhiRzKHExo+yYlKaYYwK8D82oUBqihEF18G0ShKvE3VbbS0eduuUBfnZ5ql+5tHaIdollkNkSm9IJdAwlxIuKhI0NGdI2kArzXW8zAkeBAWtSmHwjfnP4udz8GOg5yETeWJUsZAq9UNWZ0T8hyPPmaFayZcMf7qs1agNH+FQJJq1q6fOH5KmadklQtUJNIMy5sLetfYQdkE+1rVKkevnsEbpLMKzKINtgGwwmdODoiYAM84KPPiiI9PLD2by3VESl2KEOKTDQF2DEDZmb3bWlMiBzxo23sljY80IuN3faWdPBNejOw9WE/hRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Z/xLKs4TOg0eAYHeHh/2ehT7l+aSr/5Oh1a8Te1l4=;
 b=EJTBDabg4ciEUGrBiR35XWiExiAEwzefOJo3WHVw5OnhsKPq2U0WgDS0D8kGJagC012y3AfbCvgkEMMWjcCky38rLgNbdL+ZatzPre5qc8T7Dc8+UFdK9HC2DPL6GRCBJk8fTD0vSwwCobkSUbMFOv3P8eaIOXzJImIhJ7ExVa0VdDG7RmKZAOGUuypLTBOxPosIGlpV3eVVuEhHURyQuFFnEQFsAY0U28zbI7waV/pojMTTOBasY3LaO2G+UNS+XbVMjq5N7OK8xmcyQ0Tyj4V6vaIeI/KMLaib291kEZVXryLzg0tQ8Bs58ipFPFdMGuSTjStWTO9rJ4Y0KzIaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1Z/xLKs4TOg0eAYHeHh/2ehT7l+aSr/5Oh1a8Te1l4=;
 b=cLiR0lubxqZc9pa/l964xqPDzICWh0f3czhQmUu+fROwb538KoWqP6EBMyOH3jVBUn+HPRQm1Nf4tuz3dfZBv/BUh5LCAbgNGoALetF465NsNCjC2URlfk/uHHGgSMeaqS2fP0KAT7l4lEMdXKv8Mzgo3wLnEMyq35FE4EdBsn3wPhAlfDbC0LvAeC4iW59Zcl9ltoAisPG3vPA5vZI4wbz3yn7UhYIJ7IjKrp03h2BtDCjet85joKfkPQcJWbUx+ZNqLqWeKTt2ivjqwU0MzB99nrIcQiUPXp577n2RW88htvpQgdv4yZLB3cmtnQ+Atw6JpjyQ9PikemHTDTEjVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB5938.apcprd06.prod.outlook.com (2603:1096:101:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 02:30:15 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:30:15 +0000
Message-ID: <2e62df2c-698e-4f22-9498-bed0388b6bc6@vivo.com>
Date: Wed, 15 Jul 2026 10:30:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] counter: Remove redundant dev_err()/dev_err_probe()
To: David Lechner <david@lechnology.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 "open list:COUNTER SUBSYSTEM" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:TI ENHANCED CAPTURE (eCAP) DRIVER" <linux-omap@vger.kernel.org>
References: <20260713131005.306069-1-panchuang@vivo.com>
 <1e330026-cd09-48d5-9478-4cff59f521e0@lechnology.com>
From: PanChuang <panchuang@vivo.com>
In-Reply-To: <1e330026-cd09-48d5-9478-4cff59f521e0@lechnology.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0049.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::13) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bc56af-d51a-4568-af2f-08dee21900e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: +4lPnIhhrHdHBwqiDFacUcOwMDf2qrsomVmi8q2w0d8ueTBtTGBczaYO/HVeP5igSIV9+QH0RInpg1xGrDTL87P1dDrKPrOhJKF/VnvW//VxM9FD5R117OZbGZxHiShxJKo8j2727Po8o9/VFw4eCpEghNkQ+g5ItZeHsmVm7f5SiQLl5kpre5ROtifqyuzTlLk+UAAqmHn93/uzCRlHlHnH642k1KbFWsWuXQJ/6X2KNVKQHANBn/nZQ8ZxUvYkdGWd6FTL7ckqp+HMzoEge1P0b/wHHipziM/7DVHtqwB8DpiG1BmKcDxRIHOkKb5tkqJjeginLwVFXXr0ka+x/O6w6fdwYcmMc8jYOYCA8M/BKDHPxjtp3nbnh2f85yIiscaji1lFqb/YYJJle0rPg/p2EKqd580eLieFq4wz2hnfbIMs0z5yAN0L5L2bOQ/pDnAJgPKXefUA7URqrafJ2aRgMJZdyUM8j2C5eAWEjOKKjLpHP8fHGsND3WKyY0ehJCrhFujOLqFETT91WCbFHbpqz1atQ+3y/nPMGQhk4JCGrMSYh5VAdHxczwEIK5fadLwRriG1JlsHp/xgosa5+J5MNQrF5zBx7KMYG0Tf4P2KrTv0igXSzj/AhAArXyY8GISy2E8pc8eLOxzGhqIW38zXPxM4Vytj+9MY8KaIRX1v7oqutGxkWN1mfwQuDw9L0sWKOFYK63RMK/hs4mOhLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNjV3JzZ3VZUmw2a1VDYVJJd2tHNVdCVTJ5MG9mNVdnNW51aFRFSnZLVzJI?=
 =?utf-8?B?bHdxQzVZTGxmYXNBdVpDY0VLVVh2NXQyb2RkOHNQT0gvSU81Mm9tckRMVkk0?=
 =?utf-8?B?aE9DdWlTczU0bVBDYXMrdXBSby9kQ2F1UE5sTkxtMm5YVTE5MVpYV1JuS3pJ?=
 =?utf-8?B?RDJyZk53VkxiL0tGOFpsZmxTTmozUWJMOUVKaXBRbTNQWnBqQ05BcVF2UE1H?=
 =?utf-8?B?OTRCekxKVWZQTVhKSTdCRlpsYjVnTTUyQ2JoblA5QWQ1bXpSMjRvTjRaelVW?=
 =?utf-8?B?aytMT3VZQmdlUTFQRW55TXExamJ3bkQzUy9ZWXVoVXI3QXZibDJtTXFLS21z?=
 =?utf-8?B?RTh4c2lCK3FZQXB5bW1oM0dBUk8zWXhOYzRKZExEeXcwdVBhOUxkOG5GKy9u?=
 =?utf-8?B?SE14VGxzb1ErWjNKUmVNY3BFNzlPQkNnZUttSi8xUFNqMmY1ZnBvTE1OQlVP?=
 =?utf-8?B?cHBXYUVsNUpCQjdFMU1CWko1MVlhamJKY25VWlBZZktQTTI4NHI0c29GdmNq?=
 =?utf-8?B?Q2MrS2UrRk9yZWJ2V205dXJGMzNod1VzSzNtSXdaUXpCQUZTZzlSckZISzVW?=
 =?utf-8?B?TW5NcHZDUFFQSEl6T0t4dzJpL3IyVTNBOTZOV0dhRXVrY2FaUm9VbGhPdzdZ?=
 =?utf-8?B?TnJneGhyN2lRcDQ3RVNXWWNuU09YTWpvWU56MFBORkh6ekYwaThRUjY2K3JG?=
 =?utf-8?B?WlpkeXdYUitZVHVIZEpVaEFJQml6VHUvUlFPd3R5ZHhjd0RSN1JNbkpFS3lO?=
 =?utf-8?B?VHNZYUV5N3B5c0IwelB3bWxqUVY5VFRQODg4ZWNCc244VG15Um1GZVN0MWht?=
 =?utf-8?B?VHArOGcrUE1DQmF1S01kdDNWa2U5K2d3VlVUbExQUTRWdnV5TkRJVkVHcVJm?=
 =?utf-8?B?enowanJPbDhFU2E4NG1tc0RhNEQ4Q0RLc3hPRERpaExtNHlrQklDYXVKWTVJ?=
 =?utf-8?B?bmVnbkk5VkpXTEJENVhYejZ1dUFDWHFGakVlNUxCRHlWRUNkclprNjhBZ2Y0?=
 =?utf-8?B?K25ucHlIMXJObGhzZ2RjT3dqdWNPd2g3b0xvTjh6V1ovNG9nU2IxNzJOTjli?=
 =?utf-8?B?Ry83b0QwYnc0QitHZVdmVytrWXhWWDV4MmlKaVVaNmVkRDBPa1FOOWlJZ0xU?=
 =?utf-8?B?K3ZkOWJWcUk0SXcraTRveWRhZ1RsbFBnSDMrRUxmR1VMaUVjTkU3QjhmcVN1?=
 =?utf-8?B?Y0JFdTRkejJPRjBESHFEbHZ5RFlLcUxLUnJjNGVDQWFqZ21jU0dkVVpVUnlh?=
 =?utf-8?B?V05YckpkVTVJZCtXVnV5ZVRDR3E1YTJmYUoxWDRQNUtaeWhHbllCNkxVNXpt?=
 =?utf-8?B?OXlxc25GcVp4eHZ2cEtRTmEya3Y4c0VEN0tVbHZmSEQvQnltQURORGhEbDJX?=
 =?utf-8?B?NEhYemUzcS91dDhGVzRtNlVuWTRiVHVFaDJPTXo2cU1SRW1Rc1FmZU5tN1Nx?=
 =?utf-8?B?ZXduZnUyVmIyWGdJN2VWT0NKaWpsbVhRMCtEY1NFYlRJblc0dDZiZUJmSFda?=
 =?utf-8?B?MGpJR1I5T3I2S0FCajZFZ1NtSFlCK09SWHRIMWpvY21wV2RYcDFXcTROMHhw?=
 =?utf-8?B?MnU1Y3JBUWNtbmNzZTBtYmpjS0REVEZHL1lIRGFhcGx6NFd6aEN3U1NTZ2dQ?=
 =?utf-8?B?MllFS1dYcDlhWDlFZGFydThJa3E5YksvVkVwZWxEQnd3T25MZk1VQzhZalJW?=
 =?utf-8?B?ZjBabDk5V2RHNStCU0lDK2hzTEZGK1d0dHVkb29vUXF2Nzd0RWJ5VW53ZjlT?=
 =?utf-8?B?MjhrTmZVb0JURUFRMUxubVluSEVwbTYyTk1FUHQzd04xMnBHdXdYcmk4MFUv?=
 =?utf-8?B?RVMyWkJCWmg5T004bzRFVUJCOGI5SXQvbnFoMDNSMUplM3h2bDdZcFdrMzVj?=
 =?utf-8?B?YnFpWkF3YjdQcjViekVDNGI0V1ZjMENYYnRrdC8yWjgzcnFDYUJQeUtocDlO?=
 =?utf-8?B?SlBXcEtuOVRLdjNuWnNRaXhjZmZUbjRGT3l3U0dCWHdoTFFHY0poMVBtbGhs?=
 =?utf-8?B?NGNvR0g0aTQ2Y09WNHNVd0tjUXRqSHJZaWFaaFNQaFJkYjRkVHBHZ1dpdTNH?=
 =?utf-8?B?S25OenhlZjEyMDRkVnhDaTVhWTFZd2FDZ2JTK1R4azVTcTk1SS9pajc5OHQw?=
 =?utf-8?B?U0lsdXFkZ3lWWERNOHloRXFNMVgvVHpXTlF2UnRQMm5Da3hMOGRhd0tJZFpJ?=
 =?utf-8?B?bUpWeFJGZ0VLV3kwL3pvSHVEMWZQeW1MS3JhZVhtMVYxY2RPVk82cERKWjg2?=
 =?utf-8?B?VEN5UExUbkRBLzJhWVlNY0cxRkw3Sk5HL3M5TUQ3QzVGbVYwaG5ZR25kQUkx?=
 =?utf-8?Q?hPjJOHy6XYNVKqI7/u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bc56af-d51a-4568-af2f-08dee21900e3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:30:15.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SraU05XgwHw62Hk9KasjpzxRQWmd1uJXvuYS64NCCsgdLPGoGnwrilORCu4iOC72lTAfBmBOsgsVFwpIurhTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_193023_546690_88AC779B 
X-CRM114-Status: UNSURE (   7.05  )
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


On 2026/7/13 22:20, David Lechner wrote:
> On 7/13/26 8:10 AM, Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
>> automatically log detailed error messages on failure. Remove the
>> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> ---
> Seems OK, but probably be should be split into one patch per driver.

Got it, I will separate them by driver.

Best regards,

PanChuang


