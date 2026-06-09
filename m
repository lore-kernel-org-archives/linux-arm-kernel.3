Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F211CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kcIZI8KvsCwBVtGoQnp3ZbswRXGUDxCvY8sWNVG0prc=; b=xItcejQ2ay1NV3uyDoTQLWKlzL
	+BabshpAdbD2sjwujHituMZUdEI7P5eE5tbZWqW382tScYrtJxroasdnvdwweFWJiRqmYxD5dVgcO
	hg2weyXFf42uUBJ+TUQHcQFCUyU79U9nOE7Hc2ir5Wy0tEu25k9LJBUtNfj0Ar80uH1hVUDl4wT+t
	eWxNluIPLZ9XDNcPEUI61/bcdtu3LUOPezFKxVn1U+Cr3ygXCUh+sIJLSv4krhiP6JuYtWeHlsiXQ
	sPeSJPHMffAsnjjScqEWApb+RopHzgEM3WgXFkgbv7FbgOgn5ZGRiNkqigL81OVLJLfLc/oxRgfd9
	2tihRFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs0V-000000055RH-0YqB;
	Tue, 09 Jun 2026 08:40:23 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs0S-000000055QC-1vC2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGPKCDaO0JZRpUjnrjrSIu8QGHRM59FqPkfdhtTxIfxk99KQSLAYy/0+eE02PVp9114nrxCAP0p5ednOF5PfslZ+Yy/cBzs0S8768Dwf99Zv7bfb4GFkPBhPHQZAJhWvZd/Y18X7HbUvUfnERmfXCoaHcdQwwXz/QKwrRI7Cnb2C1dnaQO6NfXwJ3Q6KfIOOTo4l1ce9zt/GREBtjTaKLwItTii0hFX73yhi9e2jmMBJxN8PEDvmrsT6WiaxI7HCcxhsno9/MnpJaO5xBQpQv5czkQstvBOOs/0cFMqDeF5egIH2p6Q0ecbali58fHxdjw/9Hcl1RJsYzXihEz+jRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcIZI8KvsCwBVtGoQnp3ZbswRXGUDxCvY8sWNVG0prc=;
 b=acNgF1w3Lg1GZiNX8CCFx71Lm/ctp8jBOA2bzzcmwyD231XIJSpMq8Cr+v1FHU7H66p8goWCoTuqoI6jeTxFyM4oCTJVNPt8oDf5WaUfCvgHtK8cldkLG+xT0VG/iKwKzr6fc+jvH1mGgnLJbNyfFu6niGHTye/bTH/2XxAfXKqEAUONk1d7qJzPpLQHmseeFwIvcIYF2qWt64oKE0ywIH3j4Lw6R4/qhz5LAx0uzbMCTuzJYz3E/Mz1pMP/0n7vQjJMadlFDUWcIFzVwtglP2Ws/xoh5OdvW8A4MXrBwc+4grtzF9DU6gRzbf+LK9um6omklZw2qG24VOBzHyr+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcIZI8KvsCwBVtGoQnp3ZbswRXGUDxCvY8sWNVG0prc=;
 b=ifSJqkahrWMH+jEk/XoL1GddmNq5mBSfQ3Kxy7heRig1hJth8sEJx4B92KaifrETdq+MMrG6/7o8hdfFTk5h8WPgC2omeVmp+yLgrvqXKTGDjr7XgTTyPGcMFZiipW5tjUbWldUvzgXfTAnRSFwA+ZSJCvFFlluxwLl27OFU0bkcc4EvtLZ3+1BWyR3WI0ddUgBuhnNQnyet2aEFwAHirReJ50ZJ39xRNpnEzvhOT3gXqXN5Evpb77gwTQ/UUgmn/EQ8dr4iyUJsET4zPm2PHd4btjFRRAZi4c37OoS3GqBY6NChJvjZNnN7Wm5GvZnNJZlPx468VRzG+4x0teL1eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VE1P189MB1150.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:40:11 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.014; Tue, 9 Jun 2026
 08:40:11 +0000
Message-ID: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
Date: Tue, 9 Jun 2026 10:40:08 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
To: Peter Chen <peter.chen@cixtech.com>, Fugang Duan
 <fugang.duan@cixtech.com>, Guomin Chen <Guomin.Chen@cixtech.com>,
 Hans Zhang <hans.zhang@cixtech.com>, Gary Yang <gary.yang@cixtech.com>,
 Joakim Zhang <joakim.zhang@cixtech.com>, Jerry Zhu <jerry.zhu@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yunseong Kim <ysk@kzalloc.com>, Yunseong Kim <yunseong.kim@ericsson.com>
Subject: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::24) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VE1P189MB1150:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bab84c-349c-4367-1337-08dec602b801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|18002099003|3023799007|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: vzCyYWuGmKSnJvAlf3BXYOuR/YKg5Vy0X9l3XxHPSXPPGQV3KbUruQeWIK6Ey3RZiUwCpjLuRxg7vKmCVoZ29yCyLqs0nJ04568JwAbp8VgHcCwY8LHj5Iy8y2Ug+AURvYBa0O52S66OFJwTSmskjjHj7jAPZ6ys42kg49zyzr7s/0TfKiUcHlRrv4dFZ0FWSUpdpMmBqQzVVTVVDEAXMdfRrmASMZQXmi+IV3weZT5OjLuWGq8cHUbJUYqKmeV8OlMT7Q/iiryiqqH3TmItPv3381QCls8XtwhPvDFopp1w5zFxkPol+FCLKAE3h/NPw0cE8RGZQaTgX9p/nQZ5dc7y/N7yJ6Za1k3sxSv6Rr8vKy4FSwkfDofZAY8rSfJGnmRDgIwMyi0OGZ0megoPJxtOwO9w/HbsORNj3jZYVEi68ge9u3CoQ9b4L7Mq3E5uXQo62j1R//6YhHBddnssSU9vEesChmiSDi6sZketfRQcrnovfGCwtbLwGO07zi0wdhEe3gCwb0kGRWhhSOHHqoIBxo4NIpIfblQ7E5lfamQy9loTTxICh7l0Mn+LmeCCeL/WSdGa4xpu7Bpt4yOKr6BWeEb2eTOJg+9KPKX6rbFwv2L9uGWTudyoc97FXJ57zOfwb3gvLWJjilTwbMYMvmSkcc/LrKJse+UCwVV2uLFIPbZtO+4KRr8jI0gC7ERR+dUgc5RYj5dUF5O3J2UYWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(18002099003)(3023799007)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpjWkJoaXB2Mkd6WkpzL2JPYkhSWC81SXNuRFFRKy9IQ2R2VVA3b09hMjIx?=
 =?utf-8?B?bUlPcFBVVDcxMXRRZDRMK0haVlh2d29Xczd2MEJjYmdPOENFUVJaa3NydTdi?=
 =?utf-8?B?YzlpY1NRZ0pYL0J4RnlUUFVIUlNIWW9HVm9PRDJ0YTJ6VUhwMVVHbllHa2dL?=
 =?utf-8?B?Nm1pUE5LWHh6bGNXcUZ2alVFa2RodHdSd0N4KytMMWhVenk2ZHRiNzRpWVpk?=
 =?utf-8?B?UjlnR1JxbGVQZURUQ0lxTmRLUkxyeTM1N210bkx3L041TEcxZjlsTi9xaERD?=
 =?utf-8?B?cjBnVzBuclFEcDRNU1diSzJQMThxQ3I0dmhHaHNXSVJRTkdOcVRIL1ZSeVVF?=
 =?utf-8?B?WmI1cDQrNERlNm03TWZEWVA2R3k5ZG5mWDh3THZhd1VWWnFnOFN4L1R6bEhE?=
 =?utf-8?B?bGU3Nks4NzZkLzBGSndrdTg3YXFFNjdxSWNvWm8xNTdHeEJlbm5sSy9DblJq?=
 =?utf-8?B?RFpleFJBemRSSElZSFcvQ09UTUh1YWRpdnNPZjFlcTB1Ukhnd3I2dU5YcWxV?=
 =?utf-8?B?RWVkY3NlUUJFbWFySjFCNEdqRE1NYS84QU1kOGcrOXdZcVdYZ2dIUHBSaFpQ?=
 =?utf-8?B?OVY5T3JIQ01PVVR0aTVOendsUG1WV3A1Q1lNU21jcmF5VkY2elhvZExCYzVW?=
 =?utf-8?B?Y1pYSVJ4NjZoanJUQ0hlWEtNTkhvakxwWFhXM0xtUmRMN1NVRThLTWsybVQr?=
 =?utf-8?B?VUNqS0ZEV2JwbW9GOGFVWEo4V00xSHdpbDFtRG1nTndXOG56YmZZb0FNUUov?=
 =?utf-8?B?emR4cy9ob2VJRGNGV2RNeHpmYlFEWitYbDIyQ3hkcFlFZllNUktuYWZ0K3BX?=
 =?utf-8?B?LzJ2UjcwdjN4dnRoZHMzWkhhK3FNZ3g1WllIYzczeldDeE52UWRxL3grZVlV?=
 =?utf-8?B?NnJ2bnczSmJYNkZucWNPSjJ5SUJFSE0waGsrc1dNMmdKNlRDUm9OYWdQb3FJ?=
 =?utf-8?B?S2FqTFJmeWdaajlEV3dSR0tSOGJleUwzNmQ5TG1PVXRhSU03MXdxNnhhOERm?=
 =?utf-8?B?MitnV1BzTmxnay9DNkljanUvZlpIeFlUbi9rTmhiRXlmbEkxajl1L2xvQUVC?=
 =?utf-8?B?NzFtb1RQb1JycFY0bXBPWkF2V3lKbE55WTlzZHlWRmZ0eEhWZEdlN2tRMDNS?=
 =?utf-8?B?SWRYcDZOQ0Z0NnZmbEV4UFhoTjlHR0pxdXhCdHBYYTBCcjZNUjEzTFFyc2ZI?=
 =?utf-8?B?b3lCNWFuMVBWMTNIZS84TmErN3lBdE5QdzhhRGVZbHlyVHJIYVM1aklGRHhO?=
 =?utf-8?B?ZVpBSDNTSFRjZHQwK3ZVYjJNTk13M25mSGV2Z0haTURpQVYwNWpxVEtVNWQr?=
 =?utf-8?B?elJoWFJYWlBzY0NqSnBCeDRzTG9WZlZvaWJNZXVUdU05QmJkUERmSXR4K1Yv?=
 =?utf-8?B?akZTTmVpWk9qRDMvNDdFaTM1dVBJN1VyeTNNWjkxVEI1QzV4cWd5MjVDWVpD?=
 =?utf-8?B?YXNZZ2dPT2VJa1UrVDl5RlVNdlVoWm1lWWlKZjRoaFk2bmFaSTdyQk1OS0ZS?=
 =?utf-8?B?NUVwMXBxTFpwd3lCTmU0aUhJMHd2QVhKaGFOVVlDNzlVWlVYNktnUVhqVHVY?=
 =?utf-8?B?SndML2lTeWQzUDcyWmxJY1dHZWFQeFhjQnJ5VXdWQlR6WjBVdHlxcUNLOWoy?=
 =?utf-8?B?TXRvNEdqeEFZSVZrak00ZGNEY0VYL3djUXROWFpTVUx0aXIvRXBvMmRkQ21C?=
 =?utf-8?B?UDB5SGY2NDB6dXpOZm1ZWGFLNm1Wc2l5Vy8zdHVoalREUkh1YkgvbWFKNTZq?=
 =?utf-8?B?UTN6UG1lMld1NDlEQXhmY3VEeVlxeUxHRmtIT3A2SFpWakpYdVFoT0JDaXd6?=
 =?utf-8?B?N1JnSEdoMzdTdUR0QlRYWjlBdHo5TkhhS0FSc25ES0d2Y2l2d25PSDY3a0Fa?=
 =?utf-8?B?QUExVzd4YkpaVFV2QndNei9XbFo2NDROZHpvRyswNEt1RWR2ZXRpZEJSRjNx?=
 =?utf-8?B?KzJqMlkxM2RwZmgzYWNpU0JnRWsxK1hlMmU4MXJzeEdBUW5WNzBPaFd2V3Vq?=
 =?utf-8?B?aDNqbnJwaEVyTWdaM1VrUEZ5V3IxUXNDQ0NCdEV4bFNZQVY4OU4veDVUajZB?=
 =?utf-8?B?a1hGNXNqbHNGM0hReGNaZ0VDUEVBNnF6T0VhNCs1aHArUTg2cUJtY1FEekhS?=
 =?utf-8?B?NTArVXRDM1BJUVZXYVZxbnBVNDYwSlQvNXNsNExlMmVPclV6Q240emZSdXRi?=
 =?utf-8?B?MElQQXdiV29uUlg0VlJkVlpDQnZWN1pBa01DMjVtSlV3eDZ4Z0xhZ3dqUTky?=
 =?utf-8?B?bjJqVytraTM0Vk5QbzRmVS9sbnNjVXhDckxVU3VYL2VZV2ZmSytSYUZjRFda?=
 =?utf-8?B?SXl3U3RmdGFrTm40SStFMnRKMTRFVVlDbnRtdlFEdUxHckg1em04UT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bab84c-349c-4367-1337-08dec602b801
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:40:11.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkoZNaPMvcxDwW5rvB3r7n9sXjot3dsc1THCo5cztEIR7VENeQYuadT0bFR6tAuxLQsNr6BgmMebtwgTouZ9Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_014020_520488_E789E6EA 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi CIX team,

I'm working on vock (https://github.com/yskzalloc/vock), a tool that maps
userspace programs to the exact kernel code they exercise using hardware
trace. On arm64, this relies on CoreSight ETM (--mode hw, for non-kcov
enabled kernel) to collect kernel coverage without requiring CONFIG_KCOV.
Without firmware enabling TRBE or exposing TMC/ETR, I cannot verify or test
the arm64 CoreSight code path on the Orion O6 at all.

I've been testing on a CIX Orion O6 board running Debian sid latest generic kernel
and found that CoreSight trace is not functional due to firmware-level restrictions.

Test environment running Debian sid arm64 kernel:

  Board:    CIX Orion O6
  Kernel:   Debian arm64 generic (7.1+unreleased-arm64, CONFIG_CORESIGHT=m)
  CPU:      Cortex-A520 (0xd81) + Cortex-A720 (0xd80), 12 cores
  Firmware: UEFI/ACPI (no device tree)

What works:

  - coresight_etm4x module loads successfully
  - cs_etm PMU appears at /sys/bus/event_source/devices/cs_etm (type=12)
  - nr_addr_filters = 8

  $ lsmod | grep coresight
  coresight_etm4x       118784  0
  coresight             110592  1 coresight_etm4x

  $ ls /sys/bus/event_source/devices/cs_etm/type
  12

What fails:

  1. No CoreSight bus devices are registered:

     $ ls /sys/bus/coresight/devices/
     (empty)

  2. perf AUX mmap fails (no trace sink available):

     $ perf record -e cs_etm// -- ls
     intel_pt: aux mmap: Cannot allocate memory

  3. TRBE module loads but registers no devices (firmware blocks access):

     $ sudo modprobe coresight-trbe
     $ ls /sys/bus/coresight/devices/
     (empty)

  4. dmesg shows only configuration manager, no ETM/TRBE device probes:

     [ 4479.881313] cs_system_cfg: CoreSight Configuration manager initialised

  5. DSDT has no CoreSight ACPI devices (no ARMHC500/ARMHC501/ARMHC97C HIDs)

Root cause:

  The Cortex-A520 and Cortex-A720 cores support both ETM and TRBE in
  hardware, but the firmware (TF-A/EL3) does not enable OS-level access:

  - TRBE: MDCR_EL3.NSTBE is likely not set, preventing non-secure
    trace buffer access
  - TMC/ETR: No MMIO-mapped trace sinks are described in the ACPI DSDT
  - Self-hosted trace: MDCR_EL3.NSTB / CPTR_EL3.TTA may not be configured


Can you check enabling CoreSight trace support in the Orion O6 firmware by either:

  (1) (Preferred) Enable TRBE access from non-secure EL1/EL2:
     - Set MDCR_EL3.NSTBE = 1 in TF-A
     - This allows the per-CPU Trace Buffer Extension to work as a sink
       without any additional MMIO hardware

  (2) Or expose the full CoreSight topology in ACPI:
     - Add ARMHC97C (TMC-ETR) device with MMIO base address
     - Add ARMHC502 (funnel) devices if applicable
     - Reference: ARM DEN0067 (CoreSight Architecture ACPI bindings)

(1) is simpler and doesn't require ACPI table changes, it's a single register
bit in the secure firmware.


Thank you!

Best regards

