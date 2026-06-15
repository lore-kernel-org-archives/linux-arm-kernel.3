Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LyiMGEk2Ju+6Gcj5kKZJO9GEW+S9GWkrnxRuCwFNQo=; b=ALmljd9nZdMtrBmpsj78SCNX2U
	6SzLGt5ErT1+21rwj7lb9hhQt8sPxzp07VCs76j4puOOCbBwaD7V5i8NBY391KXflOZkQ+/BDxZiO
	id8HZjTLQcd8QiMVW0rAQKvW04hKlmPk59zBdi91JoGeb2TTs7X9l2YH4U1/SJZ0gp59XQK1xFahz
	iP+SysGKGjPSrhbnZlJq6kIjthmVg/Z3JMVWPHTGjmS5i0JV2Fx9nhLL9GxR9Lu7dKt8sPMP5Pwoj
	VSvaJX6kthnp6R1QO4cC0qnn0ELZ4BArJEEf9Fyi9Zw+OMGikP3gox3TrrYVLkf5asbEv8VvqY+1u
	cS7WJA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1al-0000000Dl8i-2E1j;
	Mon, 15 Jun 2026 07:18:43 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1ai-0000000Dl7p-15VZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5gGv15WLU3DwFUKgJMmaXpHeckH2NGzmnNAwdSFiB7TORulk2F7DiH32r1/ffFLzXTJ5qXvzXCS3lHVYVsT055sEI4J4rGMcGwMwYARlZKu/3bSojdUM+45L+ptefxH2j2bKXlMkNwbo00cAmAB91nLuxvP0K7USm+aHYzvtlNjhzLyTm9xzfC4iOHaBfjCABnD50yQdE7nNz7aWtJ3/gxtLUlq/6ub52XtjD+BU0pG/QFBOjla0GRPQwUUpuUaP2r8B/PXdOeBys1JBNI8PrFcWLA2ogUGGsNcPlgkYdlXtZ7tAFXiXMI0KJ40/zM489IHiWSa+Bh1DoTb0l9OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LyiMGEk2Ju+6Gcj5kKZJO9GEW+S9GWkrnxRuCwFNQo=;
 b=F0Qt7WQlgHaWMKdZkKbV7mX37z3FoFUKxBpwPL8sIyqeH3yU5IMWHiLMJs4ia6nLEpTJ9aZ5+Wvs6bwGW7faEX3WzAji5FWbk7kAEiZ46oN61xi+lsyB36UBZ/AptC8XZtT+/B1gUacLL4ivrh2SKd5WImjS/2HRPquXU+0bRJc8byjUjIWicVZm3TQeVQlF+WIACwS48eVHdbgBWP/N6x/lg2VdTex7fgyWExwizsBSd2GJP9rQ7U/2wU0vpJv0qFdOnChJXAucsYMD/Pni9BHjdbQ/Kd/xtvIBNteIip/T3y2jnE9OKQ9n8bacR27Z21lsWgLhF9Qfp2FhmXbXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LyiMGEk2Ju+6Gcj5kKZJO9GEW+S9GWkrnxRuCwFNQo=;
 b=HkX+lr/sYX8TK77Sg0meKkZzP7PxCn+0kxqQwgb7BZADio+IUShrkITtHxCYWLwAvwhFtP4diePku+oqFyS4l0dvXNBGzlUKYp/UZL0VLCaekkJ+UEETS4UgysBt4FfxhqTQxlAe5BF0xdkvn/9Qe9HHYrwjwbuOC/hst6GmhKWWdHr8hhqBGgNiF/28+QD47xgNyFbJAn0I4OXPl8Ur4lz2DKdo10eepEVuaAh9M7Kzztrl5u/dOCfsNXjnMk3fDHSeTOLQDcRM0TmZK9XHaf9OW/fShGt37Giz3qHmyAyh9/rar3O/YY4vrdh0huJmVPn9XOGRXH1Yn7SiLbsuAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PRAPR10MB5347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 07:18:32 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:18:31 +0000
Message-ID: <b7c92302-d675-4610-a815-b353ff365e36@kontron.de>
Date: Mon, 15 Jun 2026 09:18:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX95: EdgeLock Enclave secure storage
To: Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Stefano Babic <sbabic@nabladev.com>, Frank Li <frank.li@nxp.com>
References: <CAOMZO5DgENq8RU6s2CPnKsf53i=7zoBeO38m_BtV=w54hr2hgQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAOMZO5DgENq8RU6s2CPnKsf53i=7zoBeO38m_BtV=w54hr2hgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PRAPR10MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd2499d-e1c5-410a-7dd8-08decaae4e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: RM8uNKoeo9MmN/j+2DrYYYb8arA7LgOqmBCaL9QR81VVIIuz0CXPkbZ7G+QhOxKYWhH8/I21WQ5U0X/Vb/+7wo2C9mzet81uNaqkxNnwmaiAtHDQ+5f6YrsJt/5deaIi80haTPjZRTrBer9bDLndSM7UJ4GzL+PbWkvGh11662G39H48Z1JOQN10J3iPlQ5aPsBNh8fSXGUPNA8ry0FZZQYoccfvmSYR3a1/1b8AANxhdviuygDEtWmYxT/N18deFQyX7PJg73q92Qf3u1WxC96otRKCcNpw3OHh18vvUo12wS080kkvopFnr2jbGMg9bg50HS9r0Z900Dy7hJ2OEnuzP9HpSg6gPH1OqcoJXkEo+yKrWk95gVcZNvL8ok2yKSyGbHbUxPiQOfiEnUtdf/Ts1MQza19MBacjoF/ITX7x9ASHE7iYOTmNxrDH5ST4ifxBxa0H9x8lGn/Bn6wqdM7HYKX1v4oVbUaPH2uevrmnjC2P9Dtp8uApwuZ6gn2Gy9/l8fF1w/812EnGZzmhdUqZmV+vTtmmQqYx0QEvKiZ908R1HcF0aVr5dzmhIb/dMSHpkgm9sF+9Eo7sQEVCafNha/Md271FoPCYAjjZn1SIc0wpFzw9I2ELU5JS70tzMQ3Gz7HDVHB4Vv4kOU0WRqnYK2iRusU+sGEqJypQ16y/zCB0hcThpoBFRlb4eo15
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1YS0g1SzdUOUR2QndkZjlidkVOWElJQmJaZVZ3ZUdHMW9HMnBzV1VKZHg3?=
 =?utf-8?B?WkFTZWJtZFdmMnlLOXh3RGlmL3poYW95YnlyTGFNaUYyNzdKOGpHaFNRenBR?=
 =?utf-8?B?TTFhUVJvVmJackt2Vmc3RkFhcWNoR0pqVHk2aEtWM0lRcU85NzMxd2JuYWUw?=
 =?utf-8?B?aS9ZeVl2V2V1bGZKREE3TC8zemNrT2VXb0FUZERrdDRoUU9QbFVPNExNNy9F?=
 =?utf-8?B?YmVCbzBJU1B6VjF5WHE0QmZwY3JLWHNuS0h2NE9WbU42SCtGdThPOWtXWWFF?=
 =?utf-8?B?RktORTN3ZlRISnY1eVVlVGo0eDJSeGovUmsrVHpkQmd0U3JISkt6VTVYWEhN?=
 =?utf-8?B?a1FXNnJQSTBtVTd2RFA4Z0ZBcnBhZVlCNk51cWV2YU1kT2hVMlJDT0pyVllB?=
 =?utf-8?B?cjcwQmNTMXFEY1VZTFVXdXpodStaRlhhcHhpTG95a2xSZnVoNVpnWXhSa0Rh?=
 =?utf-8?B?SVNhTFBHMlJTR21MQUFvWmtPY0lQK3hCQ1I1N0dUb09nZ0YzUnJCY28wY3Vp?=
 =?utf-8?B?WGZWSUZaaUU1bmtPVlV5M3BENm1iUHp3TzJjbGhnTlVxMFpqcE5nUlVmVFpy?=
 =?utf-8?B?eHVnU0o0QUlsaERQcjg0M2ZLckU1L0MzVW0rWlZyUTVNNklSMkt2d0JRMWsy?=
 =?utf-8?B?alpGck5vSWcxVWpqWDFCUmtDb1RDZjI4aS9UY28rbEJqWCtmSWErRi9vZHI2?=
 =?utf-8?B?Z0JieDBuejBJeVhEOGJmb1RxbU02Y09jTnhJbzZnWnhFZ0NTcjI1Q2FscWln?=
 =?utf-8?B?NytxTitIQXVZYi94NXJKZ2VQZ21PZHlDdU02TmREc1F6QWtIRnpjdEhVemF2?=
 =?utf-8?B?d08ybXVWaWN6ZFlpMEVtdlRxWmQycVEyMkQ0RDZnSUZ6WlV2VWF3R2FWc1lN?=
 =?utf-8?B?N0VlRnRsMlNKTEVvZlZRcHZ1S3FIYm9YRGpuaDNydHQ2dlNVZ1NTSktqK2ky?=
 =?utf-8?B?Yll3elRCeDVER1ZzeGpDaTB5eVFpeFNZY1Q2TFkrZlN3ajBaakJFbmR1SkZw?=
 =?utf-8?B?TVRoVlRFazJDY2FwRXZJQlRkU2dLOExlalZNckVaTnFyTFk4UUNjN3lWZWNJ?=
 =?utf-8?B?dzNNNEJmOEh5eXlZRi94Tkc3UE9uVmk4aFhML3hjaFlibVBQcDlGQXJMcXJN?=
 =?utf-8?B?U3Y3MjlPVkRRSkttVE9RM3JkaUl0RmdraEkxTEUvajFyVjAxSlVUM0NHc09C?=
 =?utf-8?B?SjBhMlhYNGM2Z1VHN1Zac2pTVmdETng3dy9KeW1SL2dwWEUxZnZnbjFmZ0pG?=
 =?utf-8?B?dTBYWjBGNnl6eVFvd0ZMVHh2OWVwc3BBWkpKdjg3RWN1MGhMVzNmeXJWQVFL?=
 =?utf-8?B?K0xDYlJuMTNrZFRxN0EwZzFNYk40a0E4TUNGVTVvTlcrVTZ0V2xCK29OOTRC?=
 =?utf-8?B?NDY1ZnJEQ2thTWlMZnlxK2xQdVdZbWQvNWl6YnczYzl0dm1yTi9tbVZsenBu?=
 =?utf-8?B?LzNSNjg2OUgrZEVocVE1cWg4RjBVeDJsUm9YTUpZN1NQZUIreWh2eENHcXN4?=
 =?utf-8?B?b2Q4cGxMRVIxME83V1lVeEg3NzlwdTdteDZmbnZzMVp6eXVMOUQvUUY0L3F5?=
 =?utf-8?B?SkhGTExaUU9vVHUySWpWRkt2bXhDUDhMaTY5cGMweXNsZjdQVk9iWUVkS1Va?=
 =?utf-8?B?eFRFeEYvVVd0Ulo1U0ZFWkx4UzFjQzJuVEhzOWdvUFhsSk9YMjZFVEY1eTNq?=
 =?utf-8?B?dFhMVmJjN2NTWThpNFNMVmdLTEZKZjVqZlZkMjU4WEo3dHZFcDcvZ2VMb1BG?=
 =?utf-8?B?aHNlYlRLandOS3lDLy9yN1E0TTZDaWN2MjNhUEZlYndRQVM0a1dDN21HSUJw?=
 =?utf-8?B?dzNmTWM5OXRPcmRZbExDNmJRNDNnRmZYRkpwVnVIMGxkMnkxWUl5N2oyNHVC?=
 =?utf-8?B?Uzdmd3FzZ2xZdDBwRnNCdUNqR2prdTFZUVNXRnd3U0sxNDE5UVI2RG1Qb1d5?=
 =?utf-8?B?WW12b2pKcW1JZVVhUXFRSGIxa0VpbGVTVnY2cGNOMllVYkFBOHBTd1ZuQVFT?=
 =?utf-8?B?MCtOSHZwaDJWbFE5VG50NnYxYkp0TWNSWmsrOWtJTi9vWUJBTzhoUGV2amla?=
 =?utf-8?B?SzFqS3NaUDB4ZVJmTVBLZVlPSm42SzVZNFZhd3d5SXR2dGFCMmttdTdLSGJz?=
 =?utf-8?B?Qlk3ZlRvZ1RqOWhFaUxiRjNETllGTFVZYkM0VnVQdzdISnAvL1psd3NBR1Vh?=
 =?utf-8?B?NXBtcWFGa3hBZlJlWXhia0JNRmkrTDkyZCtERmNVS083ZFdmNGhvaDVIampo?=
 =?utf-8?B?THJuVWFMTGw5WGhmVWM5MVkrcHFtYVNjc3l0WlhwN1M0SHR2c1FuQ0RLdUgz?=
 =?utf-8?B?UkF6anFUeXFXSlBkUzB5Z3BNTlBEL0dWUzhaM2xVZU9kd29QbnJaMCttRC9q?=
 =?utf-8?Q?N47gBpgL8uMlpx/E=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd2499d-e1c5-410a-7dd8-08decaae4e23
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 07:18:31.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCc3VOLB73bmgK18Gsqj+Im0eKwIeXIIKrBmBEbpifoZb8ukNyJY3ChUrhf5xQu/y4PcdGGrC4deUVHerZwlsa7tKdrjv30bBgeCoUioV+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001840_620603_9648CEE4 
X-CRM114-Status: GOOD (  18.11  )
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

On 13.06.26 15:58, Fabio Estevam wrote:
> Hi Pankaj,
> 
> First of all, thank you for your work on upstreaming the
> EdgeLock Enclave (ELE) support. It is great to finally see the
> ELE framework landing upstream after a long development effort.
> 
> I am currently evaluating the state of i.MX95 secure-boot and
> storage-security support based on current linux-next, with the
> goal of understanding what can already be achieved using
> upstream software and what pieces are still under development.
> 
> From my review, it appears that the following infrastructure is
> already available upstream:
> 
> - ELE/V2X mailbox support for i.MX95.
> - OCOTP/ELE nvmem support for fuse access.

There is no upstream support for OCOTP access via ELE. The
imx-ocotp-ele.c driver (despite its name) does not currently use the ELE
but the FSB to access the fuses (and is therefore limited to read-only
access).

I have some local WIP to add ELE support for the OCOTP driver. I think I
can post it soonish.

> - Secure-enclave bindings documenting the i.MX95 ELE HSM.
> 
> However, I could not find upstream support for several
> capabilities that would be useful for secure storage
> deployments on i.MX95, including:
> 
> - An ELE-backed trusted-key provider for the Linux trusted key
> framework.
> - Integration allowing Linux to use ELE as a key-sealing/
> unsealing backend.
> - i.MX95-specific crypto acceleration exposed through the Linux
> crypto API for dm-crypt use cases.
> 
> Are you aware of any ongoing upstream or planned development
> activities in these areas, particularly for i.MX95?
> 
> Any information about the upstream roadmap, ongoing
> development, or expected direction for these features would be
> greatly appreciated.
> 
> Thanks again for your work and for any insights you can share.
> 
> Regards,
> 
> Fabio Estevam


