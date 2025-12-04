Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A6FD1D897
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KYGfBN+nCy0pAcA3/B5SDzEFCArofpxLptqTZxIwqY=; b=az4GQKyR1nK+ktJNVXYTZffvPm
	ghbGoHI3ntT5iLw9KDcCF9ybiTiuPhLVSlh1ZDmpPi+yHCBkv9Bgn82H8EiaproAAE8oPiYwh8ORo
	CUMDPPgmqCSsdMRZk8d22er/Fz9YE29tO4BiIqbFpqjciYI8o2SNVDm8pEKYtb0vX9+rSLXs2TQ1H
	RN74qMfJZ8X5sFyZbbsonNL/PSqUD4Eo+0jZN2OUGc3sWerotf+2q2j13AI6+bRcNchMxA35ZriLh
	sqdJrFGvwXrvzH918THHsGg0bK36n5CvUJ7xdXQer0wDOtVSJ1cA7QU2p+NQV05GZsEct2CW0SpBd
	5HAw8Gnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4WI-00000007fxe-03J7;
	Thu, 04 Dec 2025 08:16:58 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4WF-00000007fx6-2BF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:16:56 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46WOl34023498;
	Thu, 4 Dec 2025 00:16:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4KYGfBN+nCy0pAcA3/B5SDzEFCArofpxLptqTZxIwqY=; b=
	T3v/avYD/ooVZkUy9hXJOLb5HKEP3aaazOHavzQRdl/PNEbBvIBsBUkgw1bRWpvi
	0795Kg3HctzGLUlB2Ty41ICO+RoHu1FIVXY97T/B/fgtDM8elJxO+XJC/9MMiCRs
	ZbkwK2AVcNTbQkV4teXFl6ppwcEdn3a0fzmEU6qFW3wl6OBTX4SNv9CMHEeVGhEn
	OHoEh98xh/JG8lDQCTNJk3nEmxlZbYd4kYbrMdEGVvV+MvgIXxyUcOknDT8P8Ob+
	QwGEMYIX217FVidcSk8Lr4DQJ0BpH8QrcUCGhOWFd9XRt5/M8n9uYiR+p09vu8n0
	aPKkgC6yi69hhrWxHZzGtg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mwwaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 00:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx+nGaN+WCLakmKB+JAsxR3TBNr3vzF4Zn0LrzbEeOs9O1pOs9ljjs8bmYrQVALFPqnyD9PtWY0z/uphzqv0dZ7jEhmwYPQxVxzbf1UoS5twITPxeVLY4GG1fnS231Wfa17fYgo1tJO1y4MndoLaBgBgP+D5jskTxyzMA7EsgF2zdFqDyWvAFDYMIyfo3ubBj1RZxZdcnWjBIs7XSNr9ZT6LSjINfupix7vWXKhOzAyeBSAuH5x4X86Dy6Np2Ewk1rRvqU1Yt6mv2oaNFkYSa4vNoIUhHi/Cbk7b/nPU2swfkOEoH0jwzUVdCSIks0vKPjWl4fWfhDGaPPqHHjJsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KYGfBN+nCy0pAcA3/B5SDzEFCArofpxLptqTZxIwqY=;
 b=D22Tvxlri6R4exV517PYNYEM5BLlgscyRSiJdfyIZm6eg7Olx6KSZpNaJdS+QTEHGDH1uSnMdNVKxETnSbC0WflfTr2l6KawJp9XInUyWPvOMuyo2SNOH068Koaybwo82193Rm9cziw+FSF++gNtClxHISqqWjFQlzCVRp2SEaU1I6XoSnk0UBYlCGh6ZgW3VOq4+VuLt0T49J4aujOLHnkP/PPucvo3CmG5TudD9B1+esaM8GHzUFtCrwRJ0SSCJtiJZ8ueMUuxV20LcLY0fRqGEYH7e8X4oEu7GpLfwoxwQbb4HO8EEwUyjSnWWM4sUVRsQwPECD+pPiuqhRmTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 DS4PPFE90FA9325.namprd11.prod.outlook.com (2603:10b6:f:fc02::5c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 08:16:37 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 08:16:36 +0000
Message-ID: <4050b918-2ff8-4625-b1b6-8bb43e82c906@windriver.com>
Date: Thu, 4 Dec 2025 16:16:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, ying.huang@linux.alibaba.com, ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
 <8248c3fa-5c17-419c-ad8d-7abda988f0aa@arm.com>
Content-Language: en-US
From: "Chang, Jianpeng (CN)" <Jianpeng.Chang.CN@windriver.com>
In-Reply-To: <8248c3fa-5c17-419c-ad8d-7abda988f0aa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To DS0PR11MB7736.namprd11.prod.outlook.com
 (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|DS4PPFE90FA9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd9dba9-d8e4-4997-1b76-08de330d719a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdScStBNzJsd25VZXYrUGtoZWxlT1M2KzNvTzNaa0VIOW9RNEVJSjdieXVT?=
 =?utf-8?B?VTdraGhJMjIxZStlbGpVejZFQS9MbVlEdytNQmRVam5IbWNPSFlyOHNCeEd2?=
 =?utf-8?B?RUJtcFhVVk5FZ29rQ05xSjNCYWEzZFRZN1hOVDNlcktNZytZYmxXOVdLUUQr?=
 =?utf-8?B?ODVRSlAyeE4ra2tGbkFuaWtNRDN4VUN3NVI3bVFPcG16U05KeThqTS9wcGZn?=
 =?utf-8?B?UXREeWNXb0MrcFJBZStNVHBrbjFEWThpK0FtZUVWblpMcEg3WjM0Z2N4VWc0?=
 =?utf-8?B?dm93SmU0eDlBYmZ6TG1sai80Mkp4YjdRazFxcHlsMk9SNmtBcTJyNDVEdldR?=
 =?utf-8?B?elg3dUhYMTR3UndzeFNvMXphcFdCeTBQRHJCaXpPaTk3UFFmVVJXTDBCdFZy?=
 =?utf-8?B?Rm0wYkZmL2ZCdTFyVEZrL3N6QVoxSXJQVFpTcWVnUUV0a0FIR05vT0hIS1R1?=
 =?utf-8?B?SVpGZ0pwZ2FWT1RFejJSY0Z1M1kvb043OUNHb29aN2NGVm1WeTRJQ2g3UHND?=
 =?utf-8?B?R1dXdnppdE1vbVRPaG1hWEJHTU9oVUVoaXVJVFk0bFR6aU1hRVZIYURBVjRS?=
 =?utf-8?B?Rk52UnhiOVpQekh3NWkzbWd2bUV6VmpKWWNzWkt0S2hNKzdmN1FwaU4ybnBM?=
 =?utf-8?B?cTdNbC9sc1lIQ1U1ZU4wZ0NiSldGWXQrNkJUTk1DL2lYY1ltZFhlZ0p0WnRk?=
 =?utf-8?B?aGplSGR5eGxGTit4VDdBL0NoYU9FM01OSENMbFAxeHc2MndoTHVKV1JiNVlJ?=
 =?utf-8?B?SGt1SW81d0E1d3dnODE1ZTk1Vm9GNS9pZzc4UytKSXNQU2lJSlNVMVdwdHM3?=
 =?utf-8?B?VytXY2RvWEpOR1VYNkh3RVNUeld5N2hoVXRPemZIbGpuOHNGZ29oL29SdDZS?=
 =?utf-8?B?MGhmYmFxV01WQUVUSG52THdOZFUvNkNBWXowYkFTbUFZNTFtK3FNeEIxc3Fp?=
 =?utf-8?B?ajNqZHVLSG8zZFhtdWhQVE4rWFc1cFZXdDNqS2FFOWNlK2M0ZGoxcXErcEto?=
 =?utf-8?B?a1d1OHpMTW5rMFE1bVZETERLL1pIL05UL0FGSFc4QjhKdnpBQy95S0pLZG9Y?=
 =?utf-8?B?ZVI3Vm8yU2lZc1EyR2pBMExGWHVPckVRUElqcml1Vm9uMDFRekl0MjZ6UDYx?=
 =?utf-8?B?NUtGb1pESWZtU2hkVGJPZkFqcmxjTjlyMjlHSlIrTmRhNWloaENZUHJuK1pN?=
 =?utf-8?B?R1dzTnRHWWNCM0JzeW5pakNSeHJuVEtzTUgxQm8zM0N6U1MvSjVmMEpVbzRi?=
 =?utf-8?B?ZkdjVEZhbXJ3OFI0eHZUMjRyVm4yd3oxQUUrV0dTclRZRUxIMHJRV3JUSWNH?=
 =?utf-8?B?OGdVMGhxTCtZZFF3c2RCaWxQNk9aMVFpakw3VFRoWDRDTHNYRExuV0dvRmVY?=
 =?utf-8?B?NnpMK1lVdjBIdmcvSDBJQ3JQb3dFR3VrcGhzVUZiR0IwY0FWS2Z1aGtycWZU?=
 =?utf-8?B?a1MxS3RCYzZkOTVDQnRKSWxxZXQ0SXBTbnBNaUMvcFU3Tm1hc2hlbjNQZGJi?=
 =?utf-8?B?WlRMOXJ4Z1hrSUxWWi9DTm5EZmhHM1VvRmRDdmhRcU9IREkyRFIzbElTRHVP?=
 =?utf-8?B?a1RISEszMFNMRkxDTUpjajdXYjFHcDVSaE1RSTJQY0pjRFpYdTNLd3E1eHVt?=
 =?utf-8?B?VVJsSWM3YmkrUE84T09oNTNMUWc2MEpsM3ZBQ2RRbDEyRWVVeFY0TTNETWw2?=
 =?utf-8?B?R2hEWFJrY2k0WitiaG5VUXhWTjNyMDNWdmE4SWRZS29OYXpuUjg2MDUvRWpz?=
 =?utf-8?B?dk5raFpXRXprUHNNUXlJSFcyTW42R00wTHcxd09FK0t3a1VrUXlCM1dIMFFv?=
 =?utf-8?B?L0ZlSWh0QUV2Lzc3YUZSNVdrOS9MT21EemxmQjkxdmRWQWlNckpSNWFWYXpD?=
 =?utf-8?B?U2xqeFdBRitIb2w3SFk4My9GaExaMGhPUE1GcllRL3FaZ3RYVnMzUXY5WTBK?=
 =?utf-8?B?RVR3cWtDUEZFZUtjTUtTRUwvTEJyTFZFcHJQaklzR1hjaXFXOEVuamVJYitH?=
 =?utf-8?B?SU01YjFMN3hXOGc0RkczcC9CWTVGSHhLVkhGQXdBVnFSOVZQYXc1SDJvdlBR?=
 =?utf-8?B?WjdwK01ycDdkYTBDMUhPUmxSeitraVp4UG5Idz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGJhelRlU0k3VVEwMEw1ZnZOdFYvb0xMWDZtc3MyOVJEUlIySjFSbEV6WWNj?=
 =?utf-8?B?SWJmMTgva2JFeVNkSW9ta1N2NU5XdzhYM3Q1Y2RYUDhCRU9WR0dic1J5TXdK?=
 =?utf-8?B?NXJHOWpOM0VtajFmRzJVdm9WdnJOVi90NC9XZmFoVGNmQ3lhSFhnYUMyNlNG?=
 =?utf-8?B?Q2EybjZ0b1VDK3VYMUM1cEk4TEhvVUFjb1ZxYjg5VEtldzlPdHRzV1VFd2R1?=
 =?utf-8?B?QVBnajhaVEFaS0kvUERPU1hHZzBmZmwwRHNNQ3R4NVRzbGJKenRxZEMrOHp3?=
 =?utf-8?B?RWplR0IyS2xpM3FtZGpsWmhFZzZ0RVZ1eHZJOU4yM0twejlLdCtRdUdoU0FF?=
 =?utf-8?B?d3lDY0J6a25nRkFnN0lla1VEYzkvcnJRT00vUDZYOFU5K3k0Zm41TEk3VC9M?=
 =?utf-8?B?Vm9aWVprUlRYbFFHOVZiQSs3VFp0bXEzdlYwTFVNTjhIMUxkbEp6Tm5QUUEw?=
 =?utf-8?B?YnZtOFdoK2k1VnZ2VzhIN3RBVXc4RThGNmNUNzVHMk1wVzA0VytldnBLbHRP?=
 =?utf-8?B?SURsZHlYZlM1UElRWG9adDZsRzcyNE9jOGNDVUN0QlR3RVFuczRQTm5tdXV6?=
 =?utf-8?B?Z1RBRmxVRVoxTnljYUdFYkRnUlQ1OW9rZG1pYllIZFZINGJQQmx6c2k5aS9w?=
 =?utf-8?B?VHpJWU5jc0VTZHpNOVlUb0pMaFp4blhHbThNUkhoRkVxcFY1TzFSSlpURkho?=
 =?utf-8?B?clJCZnphMGkzdlZtd1JVZDkrTjZ6QjBSekl4NXhYSWlWR2s5eUQ1OEt2S0xu?=
 =?utf-8?B?NktkN0JCTWsxbTllT1R3bjFjQVlXbHJZNEZGRGp5Tk1YcHB2aU9RK1JaUnhu?=
 =?utf-8?B?V2dBWlBjcnpsMko1ZTQzbEJ2Q3d5WHVYbE8zZXpxaWdCb0NPYk9pTmlpVFRJ?=
 =?utf-8?B?OUI3Uy94UlJtVnZ5YU9yYlhtUklaZnc3VHprZVRLRE9FWk1HdE1pYWRSeCty?=
 =?utf-8?B?dld4RXYvSmhrS3M2Ti9CWmhNdEh0UW95WUdPTXl0Nzl4Qy90VlNZeGtJSFZp?=
 =?utf-8?B?dERKTytyWGEyR1R5bHdQK2FIZ1FVY2xoR2lHUGsyb1FoZWQ3a2hFR2hGalNh?=
 =?utf-8?B?NGFpMTFxcnJmWDlTK2xzL1NBOFRjMElPWWsvcTN6cEFHNGRPSEZHR0xEZFps?=
 =?utf-8?B?V2VSKzRkVkpDbzRkT2tVQnhFK0RLRVptdzcxbE04Uml6MGxLbWFoQzZQTVM4?=
 =?utf-8?B?ZUxHMy9zd2hlMm9GN0NzeFNlcHhVOEUrRlhwSmI0dmJ3Y3hZWHUvZkJtNlZV?=
 =?utf-8?B?MmZib1loYUEydGRRaEdhWnI0V0crek1CY2o3VWFuTEI3bk0zUnRUemtHa0Nn?=
 =?utf-8?B?K3VHV1ZENWpVLzkvNkhYUmZ4RjNQckxsVFlnRUNwWTEydFVGakRpSzdjRTk2?=
 =?utf-8?B?ZGl2ckxaVC9WRlBlb2ZBeEJlWlFwU2xJWFNZVHJnaUsxaGo0eTdSYTUwb0NW?=
 =?utf-8?B?b0xJck1KWEFyd3YrVS8zY1ZQMjE0dzhoN0VLRGFRR2wycHlhWnJJUGZwWGpl?=
 =?utf-8?B?anF4VVl6YUc3RXVLNHJIdC85YjdKNFFkVWdXUW44Q243Yi91Um1uaDJnVVRH?=
 =?utf-8?B?ekcyYVh5UlpoYkdPNW8vMzJVd0xyZlNyVkhMQ3BTNXQyMUc2bUh4UDhLQVpK?=
 =?utf-8?B?b0x1UFZNUDM0eXY3bDlTeXdXTFNMajBPQnp3ZmJ0OEMrS01qamloMFNkV0R2?=
 =?utf-8?B?UnJyTTRLaXp1RWdGVjQ2WUd2VlFSSWJKbmtaRFhZcjM2SzBKbThaT1htMWVN?=
 =?utf-8?B?amJ6V3l3OExBMGM2M29hWWdFdlJrZ05oQytUZjQ0eWRCNVZrZ3FGZ0ZsZWdB?=
 =?utf-8?B?TXZVTDlTMnlpeUEvZmNOSFJ1NGlkL09TYUJFb3Rhb0lIbjFYYTZmUW5rWVZi?=
 =?utf-8?B?L29wajlJRzBzaERSYnczVG5PdkNaTHhRcW40cThsZUppQ0VzTkpNcjlRa1Mr?=
 =?utf-8?B?aTI2Q3dDZExjNGtxVHRhUk5OT205V09HMUxMcndHTnJLa3NkUlZNR3pRdFVL?=
 =?utf-8?B?Z0hhbUJoTExFTmZBWjRNa2RaZHIwam1FWDJ3MHBpSTBXcFdQTFFMdVFpZ3Yv?=
 =?utf-8?B?clB4a1M4RTBBcEtGRHpkZUVvWXFuc1lldld1YmxEdzRLWnlBRVMyb0s3eGxD?=
 =?utf-8?B?amdwb0NLTTY0Y2JDbHducHhkeDlOQWlnbTFBRE1IY1MySGk0VEorUWhYblUv?=
 =?utf-8?Q?RT/Td+Wjn7kHZw0DGk3bsyM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd9dba9-d8e4-4997-1b76-08de330d719a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 08:16:36.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9ulguw3287r+bWWEyDlNXgybVqxrBpNScNd0BnI3BvnbA4xU64b3zbguWQqVy5sIJ7cEc7bNIeNMDbnteUbStklaSO+Ez8huqjAn9KU9dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE90FA9325
X-Proofpoint-ORIG-GUID: xkU8mhb9dgNvDRuSKm6cagNWSN-zM5UI
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69314367 cx=c_pps
 a=SAua1AGvvEPKktuR1BOyGQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=SRrdq9N9AAAA:8
 a=is8BzlB-PNdUrDiXX4QA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xkU8mhb9dgNvDRuSKm6cagNWSN-zM5UI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2NiBTYWx0ZWRfX5JNfmzRCXwPH
 TiSfStTOCiQxB1Vj1CUlrClkGledaF0BVE0v1JDa19xf0HAmRurdVPWMRwbzLz5P5UGF+Smhw4r
 L5G2MBEICYJ5nJgpDBsy35pdUQ9UDkwlq96rXCZjlGJsNLlWHLjnJTwDK4u5ko5DemUd7vNaLZo
 DAfjXi4EmjP/vGVlwJIXqdkq4RBeFPl4W3ezmE/jyjNOkCZbBO1VUld6EfqfFdDGYNW+r6bvL49
 C4XglZg3HJNKf/ppzUbRwT8on/qMyXabZyyfBbx4LwYl4TyQjSumCKvFADecy3UAW//ni+Tz5i5
 an06u7A+cmnOuYv/fqZaxGFKPOW4Rfw6GB/DHfOnuTTQVgA7GBtCrThgKIe5pR48pk0C/yS6NB5
 ZkA/K/8B0PYUmC5hpSaRYJZskQcq/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_001655_606582_13F50857 
X-CRM114-Status: GOOD (  24.68  )
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



On 12/4/2025 4:07 PM, Anshuman Khandual wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On 04/12/25 11:57 AM, Jianpeng Chang wrote:
>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>> prevents unnecessary dirty page marking in normal memory management paths,
>> it breaks kexec on some platforms like NXP LS1043.
> 
> Why is this problem only applicable for NXP LS1043 ? OR is that the only
> platform you have observed the issue ? although that is problematic else
> where as well.

Not only 1043. I found it on the NXP LS1043, and I have both NXP LS1043 
and LS1046 boards available. They both have this issue.

> 
>>
>> The issue occurs in the kexec code path:
>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>     writable copy of the linear mapping
>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>     are writable for the new kernel image copying
>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>> 4. When kexec tries to copy the new kernel image through the linear
>>     mapping, it fails on read-only pages, causing the system to hang
>>     after "Bye!"
>>
>> The same issue affects hibernation which uses the same trans_pgd code path.
>>
>> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
>> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
>> hibernation, making all pages in the temporary mapping writable regardless
>> of their dirty state. This preserves the original commit's optimization
>> for normal memory management while fixing the kexec/hibernation regression.
>>
>> Using pte_mkdirty() causes redundant bit operations when the page is
>> already writable (redundant PTE_RDONLY clearing), but this is acceptable
>> since it's not a hot path and only affects kexec/hibernation scenarios.
>>
>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
>> ---
>> v3:
>>    - Add the description about pte_mkdirty in commit message
>>    - Note that the redundant bit operations in commit message
>>    - Fix the comments following the suggestions
>> v2: https://lore.kernel.org/all/20251202022707.2720933-1-jianpeng.chang.cn@windriver.com/
>>    - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>>    - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
>> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
>>
>>   arch/arm64/mm/trans_pgd.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>> index 18543b603c77..766883780d2a 100644
>> --- a/arch/arm64/mm/trans_pgd.c
>> +++ b/arch/arm64/mm/trans_pgd.c
>> @@ -40,8 +40,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 * Resume will overwrite areas that may be marked
>>                 * read only (code, rodata). Clear the RDONLY bit from
>>                 * the temporary mappings we use during restore.
>> +              *
>> +              * For both kexec and hibernation, writable accesses are required
>> +              * for all pages in the linear map to copy over new kernel image.
>> +              * Hence mark these pages dirty first via pte_mkdirty() to ensure
>> +              * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>> +              * required write access for the pages.
>>                 */
>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>> +             __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>>        } else if (!pte_none(pte)) {
>>                /*
>>                 * debug_pagealloc will removed the PTE_VALID bit if
>> @@ -57,7 +63,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 */
>>                BUG_ON(!pfn_valid(pte_pfn(pte)));
>>
>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>> +             /*
>> +              * For both kexec and hibernation, writable accesses are required
>> +              * for all pages in the linear map to copy over new kernel image.
>> +              * Hence mark these pages dirty first via pte_mkdirty() to ensure
>> +              * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>> +              * required write access for the pages.
>> +              */
>> +             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>>        }
>>   }
>>
> 


