Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500DBCD5828
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=; b=cyqazaFZ8jDNsFmJ2CyVd+LWzj
	2zM+GS+js6iC3l1EITiWo4Db8/ElFqJxpBtcZlY2hLQr1WUM5hSDZGUoLMaGOsnRpK4V+ruI+r0+D
	OO7rEOWihWZ7y7gSSuH07u46Rnva+jHbkKtPe5w6DEjTsYTw/02y1RsjQXWF6HKLn+F11ETzwqEEn
	WlMLEpcROV0CFVdWcgxhx8iVv5o2YtbTumwyPqGGWK40wTLaBF08wKyXOg1xFD1t6x5RVUbMuSLxv
	vWqGdbqjA7ra2QVlhiBd+2qAbulcNPKFUxTGcKNWSMQxEAIyT+QnD0+mZPpXfzVYVCwjWrXSAM3ud
	Nb+PB8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQo8-0000000Ei6n-1mLE;
	Wed, 07 Jan 2026 10:30:28 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQo2-0000000Ei5m-1vw7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7HiY5fPDwZvjQQMSsV+DvEMu9IMMx6XNH8rpefMI+wzvlfLo/cD3dsH29xIUgXVB9pu5NJnyT7wg+wrLbNhRJH0Uv8tc2exp4FQ9mtN37WDqp5bi1nJPSka/knVa18ULcZCdLQjQQ/cgiO4br1KnBwvlZa92Jjwwv/AkxFRoO2ABv7HqHmYXzh4LYaoA3KowK4n3tbgoH+1b3d9JPTPRlF+geil+tTfHjQVKIh2mO8om5muBUVL2OBZDKtMw31po1LCkrZhstKoG+F6juZnzN6Nmmmm6TkPwV2sSHK4RcJ3nfeytOVcmvDqR+XppbbxxmXSRmuEyL3prRnJqSqfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=JHmZngn5QkQ3Ao4CPLNcEVP27s55FOCWVl1LWfwTrIvyWGFVS3Nvv9XUxdm7NDIgStCchYnTLWXcXsK2NEQ0Ew8Wf65Tp3ln/NtmxFD0+7LW2Z+CLwJq+JIN+Wmo6hr45PUKDs0zL6mQlZx8nLIF3bPI8LYkIXEhTOYINdhbF3pPsW0LpwI0zvljWFWsao+NI1bXwT6WyoXnFDOWP5YUtUsip20attbGgupTgBY52sJBbr5Nf0qlP595CZHVcBC0QutNksmTcj41qR5d4lxnvO+TpxbL0kSsGcFE1Gofg9nkWtBw3+HwTOjWuXuWyzOFHvNh9LXfzQlWVfFslHebug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=B1zcaeWm9mo878ncGDd1GO8dI3NcsaI4WdJij5sHUX0h/SmawAHaP8LUxjatFsgUSfWhXx4Yul7Ucsx9DtSLYXbZjHgK25y9eo0TTdjwjTI2ZaDrQ5IcFn8SjoQcvI9Qwx01OTZLYEHaWhPoWRYpB//+iN7ST2ccr242eZP4WcZA9yxVA8dVn5WMreCP2latRsxI65CVlXIsI6oClS7zj77TwStidqNWAVkxPr79N3mdM4Zp71o8EozP4sUFI8QV2Tsc1gh1fUpLBM5HWthZr3HHioYHWc5xSGJbo4FI4i74jSqQkXsVbgIIrTifE4YulvPqoTzUoPLVuQuBFuJwcQ==
Received: from BN9PR03CA0203.namprd03.prod.outlook.com (2603:10b6:408:f9::28)
 by CYYPR22MB4313.namprd22.prod.outlook.com (2603:10b6:930:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 10:30:16 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::6c) by BN9PR03CA0203.outlook.office365.com
 (2603:10b6:408:f9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 10:30:16 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1ADA3E57C8;
	Wed,  7 Jan 2026 12:30:13 +0200 (EET)
Message-ID: <9f77a920-0ddb-4918-bba1-816b37727d52@gehealthcare.com>
Date: Wed, 7 Jan 2026 12:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <aVz3Q34/nchMuqVX@shlinux89>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <aVz3Q34/nchMuqVX@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CYYPR22MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5fe646-aa08-48d9-b739-08de4dd7bfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVdac3JZaUlmN1UwSzJQZXVMY1BGWk5FRURaTUUwZEV4ZGNrQVlXcVV3WXFI?=
 =?utf-8?B?WDJkV1A3Z05Ec09CeXJxdkxsWjgvK3hLQ3ZuNkhTdlNsNzIza2VqVjNBWUx4?=
 =?utf-8?B?ajlhcEZoNis2R1oydzE4ZlZuZ29LNW9GV2RSWXN0VDQ2SDZ3dGxsOGc4V3VG?=
 =?utf-8?B?UVhKNEJxMkJydngzSzUyN0xOZGF2RDVrUGNITkpkM0d2Q1BhZW54QmhidHdx?=
 =?utf-8?B?UXZ5b1hXNzU3S2ZPcWN2eTcxeWdQYTFLVnBHdE1MT1pKbU5BaHFCMnFqZm91?=
 =?utf-8?B?UUI5U3hyWXpHeGhMUm1CVW9PZGhIUFpZTk5SdTJqNXhFSEpWUElqUkZkeFk0?=
 =?utf-8?B?MDhTK1JKaDNpKzNmWW1oZGxFSzM5ZVdGWko4di9QL2Qxa0dtcTV1RWJCazlx?=
 =?utf-8?B?Lzg2Mmg1eC9KcE5qamhHWWllT0xuUkNqaXAvcnlPejJOS2FMU0RWNXZHL2Fx?=
 =?utf-8?B?MitVdlB0TWgyRnlQWVJjNFRVU2I1ZjRXVzc4b3Y1enZucDFjb1hsNjZid0hS?=
 =?utf-8?B?SG01aWFubnp1YlJKSXZaTkovZFFyTWdBT0FaOHlNZUl3bDB5UmMyTUF4WEx1?=
 =?utf-8?B?VzBzb3dpYXJHOHplVUxYSVExc0tWMzR1TFZ6ZWtPUlg1SHllS0x3OFdmQXpj?=
 =?utf-8?B?dDlKRURoeGhLbVpFcGlHVi9iOVgvZkhHOS9hNDJ1bDlSZTduYXJCbjhsUkJh?=
 =?utf-8?B?ZXZETDc1SnJBb1lnbDJuR1BKdDJCVTBRUnUzbm1Ya05ESFVJS2cwWldqd2cr?=
 =?utf-8?B?WmJtSUlZRWdmMGpXZ2tNNUdaL1NNYy9CMklZR3FIMUhuR1FnN0FRT0g5d2pt?=
 =?utf-8?B?SE42MjMvZHpxWnE2RHlGVnVOdkU5TmZXVTVVV0V3VExRdXcwS0VLa1FrTFVP?=
 =?utf-8?B?ZEtETGM5Vmk0YmROVi9CTGZuTkpvOXBEaTh3QTNycTVjSVRrUnJLL0Z3VVBX?=
 =?utf-8?B?ZlNEWkFRbXZjZVlTL2hCTGFtRGZIL1k1SWtzNWlHK0Q0M045dE5QRDhxT21W?=
 =?utf-8?B?SjVmT3ZVaWxjQjF1Z2lUR3pvN2xKcVFQYWpGRVVDM1NVYmdWODdONTJaV25Z?=
 =?utf-8?B?MnhBbmZlQWZ3UlRoekFzbElOMzloSmFYMEdxSDZnZ3Buc3V5bUt4NFpLVStX?=
 =?utf-8?B?dlFKR1FJTGl0MHk3L3pMMmNtYWNLZEdxSWtjbHMwNEV2Qm5XTkUzWFZCbkhZ?=
 =?utf-8?B?RmIyZ2FmNHp3cWVMNSs5NkRDcnRLd28ra1lUVk1NWEoreHUySDdvSGNBdnAy?=
 =?utf-8?B?eGtBZXBYZUxpM0M5ZFU3emx2WWw4Y0xTbU5sSFp3NGJQQTRVNTdhMmU4bS83?=
 =?utf-8?B?WENPOXRzRkdPbjlYRFBocGhpd1hMUzhCeEU1NFNBay9TVHg3TzN1d0lRUDFR?=
 =?utf-8?B?c2M0Nk4xb3o1a2orL3h1OFdNZXlobDZiRVMzTUZVSitMRDlSL1RobXRSUmlI?=
 =?utf-8?B?M0RGWHRxem5BbWFSblFJQk9YeTNXazczRmhrSnFsR0pNL3FMTWNaTzFTS3hF?=
 =?utf-8?B?RndQaDhiTWlhdkx2REVaMVAxamMwQUp1K2Z0SEkzdW1pWEhqZG9ZcDkyU3JU?=
 =?utf-8?B?M3ZoR1kyK25IUmMwY25Xc2dMY0IxaHYyL1JpZDNjZ1lSV1dFVzVkYXNuNWY1?=
 =?utf-8?B?aURiMUdWeW51QmRPMFBMeHMrZHNoRE82Y1BEZnplVW5kMTBXU3JYUFhQZ2hD?=
 =?utf-8?B?RG5sQXJld01zWUp4SGVWNGdUdnFWbk4vZ3R1b3Q2WjI0dDBjM1hyNzh1Tllv?=
 =?utf-8?B?ZzFpeWhYS1llWVcyWEo4NmhLaEZYTXJ5ck5pV2JXVUNZOGRiUzIycURZRTlX?=
 =?utf-8?B?NWRUcFZrcThpdkNsVTkyRklKQjJqSG5NTkJ2N3VSbHhzaTlzbGRjeFFUSjBv?=
 =?utf-8?B?eEhzazVJVmdSUnJpcllWWmY3RmR3RFpPUDh3M0JQRVhTREZxWHBwZmNHU3hG?=
 =?utf-8?B?d1N1dnlzRDdmZ29tK21yMEZRUDZOcUs1K1E2dTBSS3hGZmFZekp6Q0hyMXUz?=
 =?utf-8?B?d3JiY3ZvbThzVDhLK3crR2Viek12aFZBZnhmVU1Ea3llbDZEMTEvT3lLVm50?=
 =?utf-8?B?dTlnN0lFa3Zsektrd2FYVWxyQjJJaXkrSFhoQmxRSnltK253YkNHekhTZW8y?=
 =?utf-8?Q?NXWo=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:30:16.1755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5fe646-aa08-48d9-b739-08de4dd7bfbe
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_023026_192738_D61A4D58 
X-CRM114-Status: GOOD (  15.98  )
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


On 1/6/26 13:51, Peng Fan wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> Hi Nandor,
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> >From the cover letter, I see that system should reset if runs into
> low power mode. So your system are not allowed to run into low power mode.
>
> If my understanding is correct, DT property should not be used.
> You may need to use sysfs or module_parameter for your case.

Thanks Peng.

Yes, you're correct, our system should not run in low power mode.

My implementation is based on the fact that the driver provides already a Device Tree configuration for the WAIT low power mode.
To maintainconsistency, the patch simply extends support to configure the watchdog during STOP and DOZE power modes.

One important consideration is that the watchdog must be fully configured during boot to catch any potential issues early.
Since this is a hardware property of the watchdog, we considered that device tree is a good place for this configuration.

Regards,
Nandor




