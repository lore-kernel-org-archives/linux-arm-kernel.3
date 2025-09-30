Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9D1CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRQkAQnSgpfmgfN0B3dbu8FfZWGDAy7m5bmxAx5vycE=; b=j6N+kJGwIL9koPbjtCGaisqMR8
	Ccj0vLBUdSl7n0DCSFKMd4dhI3ycqjhiXN2TwqoByq//TpSeoBTzHaIIpeBOqlxi3mEAH93lFGmFH
	hSfuXbKEhkQYoU0Tls59KcuTkBbVWIyij7J3TMrfSKLkFUIUOAxegqie2G+SxFL0TN7FoYRgBncWT
	Qr38HkWS8fUc2tRQMvibXg8F1FekDscnSzHE4NTvA3KyaAKRgQOVqm/T7DCSyl0ETskVB/qnnzha0
	6aP8AdobGdNuY97WxaeJgR1zKC71vawD1DNQkpPiNz8TMWInVz80xAI2SixwlU5zXgBGzdqnJx1ZD
	jHWBt9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QT4-00000003yDL-1Klj;
	Tue, 30 Sep 2025 02:51:54 +0000
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QT0-00000003yBL-3jYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1759200711; x=1790736711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zRQkAQnSgpfmgfN0B3dbu8FfZWGDAy7m5bmxAx5vycE=;
  b=ejMjOYGpB+osZxRuF6+ybebz2yVT9L4R7Nmyf8yAJAsTI5kv4dGW+pm3
   Gb4s0aGb+XvBgKMg2WYTQuP+Mlsa/gEfi2H34XlaryqP+jzdlAJTGS6+e
   cwNOawcIQ2np2g4JmbqIxNSSoM9Rik/FDTrJnA0tcrIGMZJSIhCFWHA9j
   CaLYF53JYGgzxZagORw0NbAqwPF5aa4edAnl2w5RdtvMzmpvhLIZb6VE7
   FTwyGRv+bIul8JFy5gKJL39Ru+OOOowdtgjPUJV8MUabYTqjkib01zu6c
   kPSHjc4OkB0Me3w1M6biFO+kW37mcKBev6Gxb4tt6fC8iBkxzpqy4I7FE
   A==;
X-CSE-ConnectionGUID: zXjX1hCZTxWVok/ZiQKRMQ==
X-CSE-MsgGUID: Tq+Gxo/6RQ2C04Wiv8U9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="169276850"
X-IronPort-AV: E=Sophos;i="6.18,303,1751209200"; 
   d="scan'208";a="169276850"
Received: from mail-japaneastazon11011068.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([52.101.125.68])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 11:51:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOWBp0PUSf2jD1bpdmqcMpQG8RkXY17D7s0N94hoZ5mPdG+rL0ie4TTQKDgRSI1et0+A+YJZuMh/uAggC0dZxnTaPkruTh4EaKL1ycw3FEgJ8/AZrshUvxj58Y+3c+/EZtr4hWLSIaBo4EDiljkrPji+AyFEkpFjPXYt6NVT31fZSOSIZ8VAwe4tExrzJM7T4JtYZiLVV9nPmcEzSmhe7O7ruqih5mkNFPmZNW3E4LRilTmNfsBlUQKUqjgjs+jGEmmU1NY6W+zGPRZm/4qigfHhYqSvMZcMy1nHyoBgtXHhJbdbP3A2/JqDbrBfMHqotYXJYIC4Yi/Lhh6jAtZaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRQkAQnSgpfmgfN0B3dbu8FfZWGDAy7m5bmxAx5vycE=;
 b=i9yaU4vSu3GAKui8zzizaUYtivXd7qjX1cgcsSkO78FZBMJ7kqMyP/kvMeAp1slfp5wpHfKE00180lmKhVtArKNlI6QTwcp72lh3mToxZmdYyh6p86I7N7KVvVg/LYpP0NclSzIAZTSyHnIzZzMINF9OfrgSIMBqGcpRh6IHvLn4kH+jP0E/jfYMIc7+0EHnWhFUi+rU3aJM75ZrdHAmudcOI5l7BVkh+JF6NBF20XejEsnkZYfsBT7mULit11XUZCoBTl3ephF9ZPWJt0NWiDWoL757FDxq090jsMwLPkLt4N9igfuwtPWsUUIPK7MKD3hoXlPEGeq9txbfP90ReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRQkAQnSgpfmgfN0B3dbu8FfZWGDAy7m5bmxAx5vycE=;
 b=rM60Sdj5/d+b1gEQudYWSpeORRjbPo7fM/tXA6l66TF42Nwia5g+lSYNOd8W/MGXBZTojLmldpDNYG5PVNDiBuabsxxFaoCw8eMSpFHQG0xEhSYF9JOoiJ9sn3LCfvQMW6qN2LOLzknFeJZ32squWpvneQ4oGaKIBz4ex65wgahnHCtWBZkjdC2V5W+oZ+k4iJXXTMxWatRl+OIK5GFqExopaXfOOmEOXZWUKaL9cSI4B4jLti4K9+SzdwB39LSVhT1Se6u1gH3rLAEBK+GkEbrezwA8r0i4qJ0NAWnYROuUTqJ2B1b80HLo/xd/vZ2z689dwiCzuzxiAl4GvE7TsA==
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OSCPR01MB13519.jpnprd01.prod.outlook.com (2603:1096:604:32e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:51:34 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 02:51:34 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
CC: D Scott Phillips OS <scott@os.amperecomputing.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"lcherian@marvell.com" <lcherian@marvell.com>, "bobo.shaobowang@huawei.com"
	<bobo.shaobowang@huawei.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, "peternewman@google.com" <peternewman@google.com>,
	"dfustini@baylibre.com" <dfustini@baylibre.com>, "amitsinght@marvell.com"
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Dave Martin
	<dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, Rohit Mathew
	<rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
	<guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Rohit
 Mathew <Rohit.Mathew@arm.com>
Subject: RE: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
Thread-Topic: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
Thread-Index: AQHcIpPEqyLBgsVICUymIMwyozSg2LSrJL0g
Date: Tue, 30 Sep 2025 02:51:34 +0000
Message-ID: <OSZPR01MB8798CC570B0B9483109C58CE8B1AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-16-james.morse@arm.com>
In-Reply-To: <20250910204309.20751-16-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=32fd4da4-6a70-41c8-88bf-0778d2c13ea7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-09-30T02:50:14Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OSCPR01MB13519:EE_
x-ms-office365-filtering-correlation-id: fdc9e458-3800-4754-55e5-08ddffcc4468
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|1580799027|38070700021;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?Vm1BUkNBWE41dHZXU0xRS3VlTTZDK3VtOU1aWFhIdHZGTmJZdDNkdk5i?=
 =?iso-2022-jp?B?RU8ydm5hM3BYRDgwRnJXUzc0Ri9WK0xCR0I4UGRRa0c1MmZtQStrbFQz?=
 =?iso-2022-jp?B?TklzdFVKYXR5eXA4bWdlT2ErSk84OGVPbk10VXpkeXMvdkJFOC8va3pM?=
 =?iso-2022-jp?B?MzFORjk3TFZ5bk5TYlNHZWlaUGh0R2lKbVIrUmVXY0ZiY1JNenFHOFkz?=
 =?iso-2022-jp?B?VzBuMkNkR3FSR3FtU0tBYytEd1JmcDhITHA0VWQzMHZ1S3kyemEwTFV2?=
 =?iso-2022-jp?B?dkM1T05FWS9UUlgzWHB2UmRVOWE1Ty9ZY3VHOWo3K1NLSklvbVAwTVFE?=
 =?iso-2022-jp?B?NEhTZlp4d0lLNEc4UVArMFNPdE1uL0ZrcEw4eEovSEZ3ZUZhZ3lRd0dI?=
 =?iso-2022-jp?B?TE1EWVZiSnpFZW1NNGtLa3VkNFZxQWR6ejVNTkhQZ2RSNzI0Z0ZKemMr?=
 =?iso-2022-jp?B?M3llcHJnUmhjVk9EUkZjVFVLRUZPN2svajF3NlVJbTcxYUZzU0x3cXAr?=
 =?iso-2022-jp?B?eitMUTF1VFZGcmpTRFdkZGdiRDZUT3dUNXhQSG1HWnllUWJWRjRJMVBK?=
 =?iso-2022-jp?B?dHl1ODNxK3ZTZ0I0MEMzTDZ5Zm1tRkhIQWs3ZWlmcjBRNFZ5MHdsQ2xV?=
 =?iso-2022-jp?B?MXpwZzE2c1phRnd1aHhqRjAza3hhUkZia09mSlVXdGExU2xUWXpWekc3?=
 =?iso-2022-jp?B?ZnNac0VLZVNYZSs0bjVZUkJadjROZzNmQkZDb2RNRE1DRy9HVUZQWDdJ?=
 =?iso-2022-jp?B?M1RFeWFSczB3NVhqUGJSVEp4b01VdXVmL281NWgxK0g0Y1NXYmZITEpm?=
 =?iso-2022-jp?B?NkozdUdxVVpEQlBMNzNZT3JqM1RrTmVCYk9rdHB5MmtCUnlFdHVmWHVw?=
 =?iso-2022-jp?B?WUxrQThrU011VSsxZU1SMGtmMTJvQ2pjY2Nvajg5d2lwYzZaQ0xLR3Vj?=
 =?iso-2022-jp?B?YlVkTEI1RTRuSWZJOE1QV2NnKzU3VTk4eno3ckRPMFVnL05Nb1hxbEFX?=
 =?iso-2022-jp?B?NUx4cXJQRDY1RXo0T0JTbGpsWDhKTC85NDdyR0pvOVhnMmdRb2FMSE1Z?=
 =?iso-2022-jp?B?ZmczZ01ZMUtNeUFXajVNc1hHdjBsSWlldndjbDhiakdjbFgvb3BwZS9p?=
 =?iso-2022-jp?B?bnV2MVJ1TW11L3MzV01yd2NLSW9sOXBxL25YNGREbzVqc3Z5YUloVkRX?=
 =?iso-2022-jp?B?UDBHZXJ2RzBZYnMraEkvdXg4VUkzZDNYcUgvbmh6SVU4ajRMRGgzcGxZ?=
 =?iso-2022-jp?B?UXFiYzNmakZ1enhKNENBaXkyZlE1cld6bndlNWZ4UWpTOVJzK21PU2tt?=
 =?iso-2022-jp?B?MUlyNk91MS9VMDJkVVlHMUpaaDFlbzMxSGo5Ujk4MnduS2RRcFNRQzZx?=
 =?iso-2022-jp?B?Z0xPRzdIcXp5enlqbHMxelRLS2ozaFBJSE1rNWRwTy9YSy81b1o2SFFZ?=
 =?iso-2022-jp?B?SWpZUXBJRG0wdlVkOVoxcWZHTmVTclNZQTBtWXZVY1YwMnBuWkFQMzVE?=
 =?iso-2022-jp?B?V2ZXNlJveWwzUGJzT1NkUzZLN21tUDJJdWVyYWtCT0J2VU5ua25jejB3?=
 =?iso-2022-jp?B?Tjd4emdPWko3VHdlbk1yNzZFSGZsUTBrWGp0UlJhM1l0alBiNE5iT1NR?=
 =?iso-2022-jp?B?OWRhSExnWWtBU2tpSFlVS0VtOGYzOVZ1bTJZZDJDQW1xRG5QbkFEUU1Y?=
 =?iso-2022-jp?B?RnJsK0Zjak9sZElxY0lHcXJWUHpvTEo1THVvRFNVTG02THpvWi9abXg0?=
 =?iso-2022-jp?B?SkRZM051Q3pqMm15ZmMzM1FyN1RuQTFUY2laWU1HdHhwYTZPMTFQbWhM?=
 =?iso-2022-jp?B?alMxemVZaUtoeEV2VldxZTNHTzI4WUZ4VWpGVmFpVWkzTXQxVjVnR3lI?=
 =?iso-2022-jp?B?T2x1akxacXVKa28vVmlHbzN0SERsOWdhcXZLbHhBSUVPMDJ0V08zOUM2?=
 =?iso-2022-jp?B?VVJublRiZExQZHhES2J0eVV5ZTNkSzhOWi9NYTE0a1JoSjZFeVpab2sx?=
 =?iso-2022-jp?B?RGZMdWZyaURDaG4vZXc1RkYxei9IYVNzSTVLbHZXU1pacXRtL3p1UUJz?=
 =?iso-2022-jp?B?dEV4cnFTVkRTUmgzVGFIZEVwcWd6OXhPWkh4K0pHQjk5Z0tGeXpnMGZt?=
 =?iso-2022-jp?B?blREMG1SUVBFTlY0SE90ZkJ1Rlg1bnNsNzdHeWVqajI3azUyVG42bG9T?=
 =?iso-2022-jp?B?Q1VJN29aRFdaZThaWWVRQjhpTmd3M0xFZ2ludEdLYlE5c2RYeVFMK1Zm?=
 =?iso-2022-jp?B?TWU4Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?L3BXMmZiLzVIcVhPUXFERlRCVHM0MFhmRkJnMmhRV1o2eGtXaW1GUWw1?=
 =?iso-2022-jp?B?UGpHZWtmOHdNZU1Va1F3SW4vTDBJTTB3MWJqYTQxUklYVjZjU2hnK0xF?=
 =?iso-2022-jp?B?UkZTTEh6OGEySmo3MlJudWJ3ZUREaUx3cUNGZERwcXljb0txZUFWZTAw?=
 =?iso-2022-jp?B?QndBak1HNFZoenVUMTUvcEhrSHVoaFBnME1hQkNibmcxU3BhTlBYSEpl?=
 =?iso-2022-jp?B?QXFvV2tLbVdKQW1WMUZFZ214QUZvMk9INU45N1ZRMzAyMDg1cFY4ang3?=
 =?iso-2022-jp?B?TXJLUS9sTXpQRk80WW16VGZYTWtBMTJVNTFvdDROcWFPRFQ1dnRoZ25T?=
 =?iso-2022-jp?B?b05PbzNrZUtWQjV2THREQ0JlVHY0bUsyTFRaTDdYZ2NYYk03aWhLU2Vx?=
 =?iso-2022-jp?B?d29EeTVmc1AwSVd2a0pUeExQMXNvR3NJckhIWFBPREhxc2VlNUJOU0NS?=
 =?iso-2022-jp?B?d2pmcHJkVWs2TUMvMi9Tbkc5dkprc1djLys5RnpJdHhkdmJLWVNBcHVw?=
 =?iso-2022-jp?B?bEJRblJzV2E1ZmxLK2NGMUNXK3BPL2xBZkgxa1FwTC9vbWNROVowUUNw?=
 =?iso-2022-jp?B?Y0I1NmcyWU0vUkkwM042NXhBakpKbGVMZmMrK3NUWW9mb2xUbDVGTGl3?=
 =?iso-2022-jp?B?RnpPOHcyL0RPaUwxcVBKb0V5NWFxWXVlallGcWFoU2pLSmNBZ3c3THR6?=
 =?iso-2022-jp?B?TU5pdEpYOE8xd3hyMXpkejRuMTJEZEh0cUFKSGFNdzl3NXBKZ0tNMFdt?=
 =?iso-2022-jp?B?MTZGR0tTZHMxakpQcDBpRFIvd013UWYxRFhkY1Rtc2tIajdBaThsbmJK?=
 =?iso-2022-jp?B?b29Xd2NQVW9Dd2tVNHJwTURMTGRtcFptZUxKV25LbWp5c2UvQzk1VXE1?=
 =?iso-2022-jp?B?ZmdpNzA1N2RicmJ0NzZ4Y0duV1JBeEtQMEFMZ3A2VHlCSld6eWlkT0oz?=
 =?iso-2022-jp?B?VzA4c0xrV3RMc05RUkMxcUhKamNBcFpyak84bFluRHlCdlhZT2Qza0VZ?=
 =?iso-2022-jp?B?Wk9TODRodnBXYXJZU21PRkpocktQTUdJdW90THVMMEMrWGxtcjNHcERV?=
 =?iso-2022-jp?B?SG0wTTFkYnQ3ZlovWTQzT0JOazFiRFV5SVpac2xzdk0vMG1wQ0R1OEFP?=
 =?iso-2022-jp?B?RXpMZCs1Qm1uc0Q3RW5mczZ6VC9YS2RLZXdrSXNNRnQ3ck1Mb29IZ2M1?=
 =?iso-2022-jp?B?WUdkeUVyR2tleWZOOUJIVm54eTlnTVArZnFacmdraG5rMndjYTlyZHNP?=
 =?iso-2022-jp?B?R3RrcGNUeVcxKzByc2dMQVVUbmVzYVFLcFBvdXJxUHBBdDBrdTI0dUxz?=
 =?iso-2022-jp?B?WnlKSjZVYmkvRHR2emloZUw2R0hkYzNXS1BUU01KSDgxNmsycVllSVFk?=
 =?iso-2022-jp?B?QXNDYzV3eVovbGhiM2dLOTM4Z2kxbG01SGR5WmVKN0pIQlVPbDBUSXds?=
 =?iso-2022-jp?B?OXI5YVZvQTlOeFBXM21URlBwRkxEWkdJbmpaQk5La2JwbUp0UjBKZGps?=
 =?iso-2022-jp?B?dndVRVVkb2R3L21FaEFBd0RYckQxRzFPbi9mSnBtMElkTENJaEkwUkJr?=
 =?iso-2022-jp?B?K1JnUVlnSUVsc2x3WWQrQ2piK01RYXhnTVJ3Wkw0QTNoQ0dxMTdzSXRH?=
 =?iso-2022-jp?B?ZGttNHB4UisvQWczK0tOZ1JxWVkvWkEzUE1WdnFzRHVvNUR1MDRtcDNZ?=
 =?iso-2022-jp?B?c09UTHEwNTNGWVV4STVMZlBVbGFLYU5MajFQRnZuNTJJc2krSnY1bjZ5?=
 =?iso-2022-jp?B?Wk03bkpXTUQyNHhnSGluYURobThyZVBYU3cwcCtGQnJZcFNQK3VjaFRG?=
 =?iso-2022-jp?B?OWNnS2VtdnlLUUdlRXkwVGU5OHdwcUtvNEdQaW9KYTFDVytHWUEzZElu?=
 =?iso-2022-jp?B?VTRkbnk5cGZVSFE3a0NGenBrL05pVGxvVTZ4MHJTSjM1TmJTTjVOa1NM?=
 =?iso-2022-jp?B?b3hoN2dJUGhRL2xDVzB2azBCUllCSFgzbUk5TjZyL0RVcGU0eXp6cXht?=
 =?iso-2022-jp?B?dVZOOUt1dW83dFFWeFhBR3hwTUttTXZXc1NhL0MvYVZqQ1FLbGlCY05T?=
 =?iso-2022-jp?B?bXNBcmZBL25lVEFvQlR4QlFYbG9HQU5OL2NWY0NZOGtOQkp0ZXJzUXc1?=
 =?iso-2022-jp?B?L3JRMGlDNDAyaDNGYnJ4eXEvNE9MZyttblV5dEVuSHNzVnplR0Q3VkZN?=
 =?iso-2022-jp?B?c0hpdTlDc2FHMkx0T2hnUW1PT2NCOWdpZ3lqRmNqWjlSckVJVVFiMFRE?=
 =?iso-2022-jp?B?UlF6VEV2TllYRlhQVkFWQWNES1dQckwyUE5ObFBibk9jemNNTlliZzhT?=
 =?iso-2022-jp?B?M1YzK2V1Qmh5cS9hdjg4TllHUFZYTThSS2c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iVOtv8wE0M8bJFMKQSxRnwK0MgU63XTYSvbAclxKTeyUKVz+0aXYi2Z+/QHaxj0vJ9kf1/xTm8gTjHgkk03YkV+rh8pKSPfH7MQVYrNhd4sqaeP+yw6TwgSHqx3chSFJw0BNOgyTXwQYu5Mt4LKjGanclX7LJ8Y49ErvA6BVdkTYNuqpND1GrbuBBzPZ8xWmsLE5Mzp6etHumMiLW1FlxIJoE6FGCZS0KLt677bKiGiD+Zj38LxuLSlO2I7mVjFZmLZerxhRxeeTdIW8C8CbOAlBvtBuj/dliHUxjcX+flLV3kAPhaiK/6SMuJGXraW9zVgsiN/uB7d7yfDE3bt7O2sU0Wg42lqxL1rHF76O7mQAhuf7V/m05ZuddHcCCpv7bL12zBzs5558e8lSRbKSUz0hzBuY7bVTWYBPpoG5eH59oxEn4FZdtOOMgY9AAqICY/zAIOjokd5Nr8YZ785V2sVvNMk8FjSEGAah2afHiXOdxjLS1fjr9dQNewNp5cgKYsEjrxy7HtSpGG5Y4dvK1zTEZ8gODamTPEQ40QE4Ccgs1MGnzQTduifY9St/hk3312WjJqBJ/63oWSgmY4n8BQ2dXm6e6qRJL8Ry796+gimqtlANgiHGsF8Rm0CdV+Kv
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc9e458-3800-4754-55e5-08ddffcc4468
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 02:51:34.2227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPh5FxxlvjcTFCAFRsF6aIO3d+vrHbsHePJYAX0ythPlcKLgQKuMoxIGNgwvEW8YmNAlBC+fFaDFsccqmBi42Od471sSuYJ+4+8V2Z21DdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_195151_688946_0FE073F4 
X-CRM114-Status: UNSURE (   5.68  )
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

Hello James,

There is a space in "cpu hp" in the title.

Best reagrards,
Shaopeng TAN


