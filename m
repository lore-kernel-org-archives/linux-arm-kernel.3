Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A175106ACEA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCtI9wvw/a9jaE9q1NqP3Ni3LpudwRhxQ2c+MyF7604=; b=wFdQxJQs9NsID5DvB0g1O+YKx6
	nn98dgJUXvIFPcYa/mJKc6OWjd9WbqrWWjRz/H8ZAewEv1YZoeEea7lgsld/Db5axUPpON77ZsS2s
	hk6+vylCHJzs6algHmf+XyydUgy8Hm896a2JK0yvvQjkqWkrFArx72Pe3IrH7jdnjsjD6Pv9RnPhZ
	LPu4FsFeVu8DrOtRfhQICu+iNqnTFjcYmO09iJKdLMDA0bceTYIP/z1YEYW+rGIluaKoVcXN6d+fU
	LrQO57dM5nTpFNP68J726+SCHAO1LC+pSdjs4A6ddgLKvA21xk1UqoovZXEkBcBMeAnhptzQRoUCV
	Z1fGGbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nBJ-0000000FOZ8-3iD3;
	Thu, 12 Mar 2026 21:02:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nBI-0000000FOYk-0f7N
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 21:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jCtI9wvw/a9jaE9q1NqP3Ni3LpudwRhxQ2c+MyF7604=; b=bx6Oa+nYV+PkLRAuiKzvLfWJGf
	r5qd7oTyZYCZkojDjM4nFnLLKfskpKvI+Dg+6rPCVkxvuic6ng+XmOk2t1k/N/hW+vWFAR8nDq/QU
	hYbK6r6/vioa2EW/TvzmW1wPQAqwJIPH2XEXOLpZvdp8DE+yAeZNW3pxuWHdvoaGeWfUM5vQPcrVV
	ck71athHBORBmNyrOJIZvWh6KodcYCjIMoiKRJTutAxYsvxUXfk2/QPyqth0UcQ4QMPuXG0vC0viN
	q2r4T5RF80PuHATBxIaRZdtBe/KKanE2ncyCUd4RnNIGe1M4K0fEJCYGa0SHDpDP0WIbpkisxuT0f
	40gyWANg==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nB2-000000024Od-2tFQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 21:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773349360; x=1804885360;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ulZrdZRNLIV7lo2zyZWVAw5MlgFjhdwlcEJNKKw3gxI=;
  b=Jw5d7A3F4U3z/lpU1Ongp7t+a1+S/mQi/mEe29Vr7Rf8c4CLz6QVXaqn
   7XGpMPztq51jx/G+liOGY49hOLKPmQfMbhaQ3RysJCJD7gh2sikkoXMLy
   uMzMgCfmx5myQeATsx+HMhpgVZq4s3Rg9ROzjw5f9HEI1lYmugKM5I0A1
   J7kEJlaooDVbfw8Y9Q507RM7wedzv1e/CFAf3p/l2RhchQbGTAc7Nbg7p
   5n+8p9z+5vr+27e5rSQIKu2qB3RFijaQz9io5l/laI5D3xrQZxwfNd9Xj
   TdaV4nwNKTMl4qKU9fSgiL5z4p+lYoEjwpGnmOOhdJYc/F2D/MmEb44mo
   Q==;
X-CSE-ConnectionGUID: 8wDQEghwQfyWtBLycq0hGg==
X-CSE-MsgGUID: E3PedYsMToOA0bl/yMFKRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85808418"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85808418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 14:02:32 -0700
X-CSE-ConnectionGUID: nWchwA81TguiN5kaGVsk0Q==
X-CSE-MsgGUID: Xex4RYJ4TdWYnno4SvcfkQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 14:02:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 14:02:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 14:02:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 14:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aliZ6uHsVTbtiz07ShsMl4oeqcmfW1qo+Mh4h8TLxQIVkB1qWU3pKe4vd3Uog1K9nj4z4z0hvXrJZU2dsp8vSIjBDdoBb+CXhkJdbKc9xg8BKwv+qYg6mEUTzkAcfkLSZAUXK7MkKxD5VgJRGj3y3Ly9rO86pUbXGdyAW4xuluxXm4vJHSFNIMNpPWtwy3q25klRfi71NisZmpofQbY6EPYqMANKv6+/X1iOrs8lWMY3hdIO/l3omADNt93u2wvKBM1osCC5QOsKrwjJ0FgbzUyBmhOUi7k0D25SwVYjUsWODCOVF2g1+t2Ze4VDyW9TYJTZnK1IE2jB2TCheW/4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCtI9wvw/a9jaE9q1NqP3Ni3LpudwRhxQ2c+MyF7604=;
 b=XCN1D1CLpaLyKGMQVD1ZvMVvWv54uPoJMksM9ps0w7TdybVrbwaGF20dy5WhkaaVI+PKyCki+F9BK2duoJgqul9IC8O7ol41lO2gwbj4wQiidgdQvNrDMTnKY5aM/KdezduOBpbk9ORdFNEJuWraaqR2vfDE8cyO8622SPWK9lMu/K2ol0NajKoq/GWWC+CwETWhT7W9WnqHl8q5JZIT6HgxnKtby/lbcirhhfGTW0pm/aqUGbxeD5aOnxsYR11qNW10o0+RHzQHocL3kRy1ksUGBSe5oM2NtShI7eiBipGJQym+IbCeScJqGxB9UTJ+xJc/RqKl9F6UK32v1a81mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Thu, 12 Mar
 2026 21:02:26 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 21:02:26 +0000
Message-ID: <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
Date: Thu, 12 Mar 2026 14:01:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260304040334.765860-9-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d46ae7-7e2c-40d2-5a39-08de807aaa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 5RCWxZrzBwS74sjLO566zbkZD5VFXZDhv95YklnXMvNjAGuDJoDVdAxagjMulkw0c1+gwLGxkzFhl/gPeejA/z7yy27B8TxsDWz3zqX2kwM51KTGe7SPO1Py9h+qn+7mUeLnvFqHD+0GLjCOM+8t4RjbTytGrgfWdoVc+r30bomfiLsrmpwvMxJMlUr7AiggkXtx6bw+KefCFeVxeokHM3sgHBRGacPdG+KuBGYGH2O/gCjcS78yuMDAOXf8Dtu087qvSa9Iv7vEDscgKaqQ0ta7oiwvCBwsEv4AvghlHFoCBIAbKB4bBgSbRZjfLflFryylmCm058B1qHemypzqcuUfTO8vwG4A/WIoSjiwmcUbBiAIi0GYDs2Pfcx0tpRUBRyrby1pfeGIc/y1P8ruXYDIq3/S96/R+vy7BM/0FH60VZ8JZ7xbwsOvp4HoiZyFRF1O6YCvo4Smyf6vnj5wUgPxwAO0Tm0hawSvInZbPdlRrvGdMvJg4jLt6GCNh1C8RFAW51FUxDEa1VOVTyS+/+gKWvYqOG7DKRGzBeureNqDQ0Dx1h2m2zjeOFXx1jo4QqQ4H73Qh7ShDfQIUBNjuzIy0tgZjJUOgBipD7WFvN9ir2B83Ghay4E92dgQxjU6sSuMMCtQQptUADPPfWKMdXY9l7RH25Zh0hlB4M5OHbytThymN8xExoV9fgUDCtUkOZ5Pbl+kb7FBKr0Fe3yqheOVDZ8MF5fbu59p8SEtP4tvYHOKoWhEMMdhk9DsfbHv3lJg/F14BQVQ0jARehg2Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWlycGk0aXplZHpKSWJTRXJJMWtUWGxJcVkyMXJCYi9VVEpnNnJyaVZJTkJD?=
 =?utf-8?B?M2JhYmNvYk4rN01BQ25ZU0h4YjJOTXFLN2xMbmkyZDZQajNQOUJQUUJYbUVa?=
 =?utf-8?B?UFhBcWh5WHlnZkE0V0dDWExRZ0tWUmRFVkVwTS96U0xSTDI2ck13WkRBTGNG?=
 =?utf-8?B?b0VtYzc3VlBlRFlXalQ3VG9CQ1lRWHBYalhzeWVHSUpLR0Q4QisyYktLWXBW?=
 =?utf-8?B?SFZGNnkzZ0hxUnpsd0wxVG16REJYSXFlTVR5UUVmSkFSMnBRZm5DcStUSkhH?=
 =?utf-8?B?eXpHZlIxWUgxRXIxMG9GZEd3Y0VxWDFrdzRzczhJT1NBZTRyY2dqMS96Mk9C?=
 =?utf-8?B?VlppNmVSaEt3anIyRlg1Mjd5YVMrVlFQMk1rNHU1emJ3RjA4dnlkdUNiVmdZ?=
 =?utf-8?B?WmJDOTVoa0xGUGZUc2x4MVVkL1QxbVdWUGdlWktCS1Y4cnQwZzhXVlUzanBE?=
 =?utf-8?B?QytHckpMZEV4Rm5Sblc0dEVTMjAzczMxdGVQcEFJMzU2YWZma1RSNDZ0ZXkv?=
 =?utf-8?B?UnZndWdXcGp5ZkJVVlBINENkcStSQ0VkNmkwWVRqbDAxc0ZPS3lEOEtvMUc0?=
 =?utf-8?B?czZXUDlyVG44dW82R1ZPWE03SzVJdzVmV3FLNXY2MDR3L3U3b1drL1IyU3Zl?=
 =?utf-8?B?VjZ5cjZPbnZuMDE1bWV5RDZCWXRCR2laYWZadjVvWURSZmd0M3NzVXg5d1pF?=
 =?utf-8?B?Mk9qVVlEUTl0THZzWTZHdU5yTmFyamtya1ErcFVWdWVuUmk4VURCR0RLb0hB?=
 =?utf-8?B?Sm8xU2FSb3phYmIzcnlzZmRSNlhTZVFuUDhHTmN4K3IvSHBtKzZraUZieUlt?=
 =?utf-8?B?Z3lJWE9GQnpjclQvekdLNmhoYVFsbjJ4MWMya1NETFZoTU9YUUw1a1BzNWRC?=
 =?utf-8?B?bXNyby9LMGtNRnhCdEFXaTlicEF2dTQwZ3lrOE5GM1FxTjNqOGZvckdYMU5v?=
 =?utf-8?B?OHRuV1oxU3UzMTNJbVpBZWlpcWdKc0JnN3ZKdkx4ZnptQTA0OWx6VmNDZ2gy?=
 =?utf-8?B?bGE5WFhxb0krVm1KN1ljakFsSG96RTJZS1lMZzNmUDU3Ylc4VVR1QzF3WExv?=
 =?utf-8?B?cnprU0plKzVoYmVWRlJmU0N1N3Q4UWdCamcvVU45aFYwbG5ybHFaV0NhVFd4?=
 =?utf-8?B?NlhWc1ZyRlZmMDRmUDJyMklRbVpYMXQrZEgxcjJTZ09PdnV3VTErWllaVkV3?=
 =?utf-8?B?enhIVVBUSVR3YVoyaXZ2aEs2VTBtZDFyMGFQU0NqQmJQbkc0eDdSV2tEbzFz?=
 =?utf-8?B?SE84L0VGUFNLdFpQaVlHQ3dJWjlHT3JrM1JXYlE1aUZINDFqeURKZWRlZUJF?=
 =?utf-8?B?amRFNzRlQy95V085a1B2dmh3UjNnVDVlSldQbXNFQzRkeHJBYmxrbUxadTA1?=
 =?utf-8?B?ZTB6QWQ4TGFNUWY5RVVia1NQaGpJWE5hd1o5NE9nYS9pdzFaYzlKVklrZXBX?=
 =?utf-8?B?aldoT05VeDd5WUV3R3NlYU5FY29HM2hlZGtDUkpBRlZHVDFCaWZRZXFuM2R5?=
 =?utf-8?B?MVpEYWVYcDEwY3JBbGIzVjBjQ0ZXM0hlRUJqRjRRNFdSNjEvditBR3N0Rm1h?=
 =?utf-8?B?TGF5UHRrNVFTMDlsZ3FDVjNnOTV1Qi9TSHVnbG9uaW1WMmhuL3FuWjIrcENm?=
 =?utf-8?B?WktwTmdmZkdiamhCV2xJbGtkNjB5ZU02RFN2am02VzRPSFNndEVXY2YzNjRD?=
 =?utf-8?B?d1B2TmJTdmpNREFDUEZDZ3l5eFdoekV0NHhaUDNHYzZ3dW8yaGprL2xiRzdC?=
 =?utf-8?B?ZjhoU3BwaFlJSFI2a1J3VFNscUFPTTN6a1FsV1h4MldjWXBINEtGTkJEMmEw?=
 =?utf-8?B?RkpaR05KZURxR21HbkhBT00wLzMyaksrUTdOQmRXcjdKUnlZR09yZmpIaCth?=
 =?utf-8?B?dFJ0TkdGT2hPWXc4VTg4SitmQXJKN1MveXVoQmh4djdya2hORW9EdlFNNDBZ?=
 =?utf-8?B?RGFtazlFb3N1aER1UitmVWNVMjNXUmd6ZzdDYUZlVGRZUTFTbXArdkV2cEZr?=
 =?utf-8?B?bDBUTFg3czRNMHhSSzFnZEZsa1RKUWxjZEw4TVlURjhzaWRnZUdpNGMwcWpZ?=
 =?utf-8?B?U0ZkY3N4WXdPUUZ5WU9zeUtXaVRUR2RGUFYzcktqNEJUNFNKait2b3ovMmZJ?=
 =?utf-8?B?TXZoalplZEJYK0VZcjUwUldFa0E0VFRJWGE5dUgwS3lsN0ZJVnRoR1FuMzE5?=
 =?utf-8?B?cWhOU3o4ZmZFUXNPSVpoMzY4ZklYUFB6NTJhNGdJditpWkxIZGtCMHpKWDZY?=
 =?utf-8?B?VlV5U1NEMnBQb2Njc0ZkbGt3WjMzakFadGlXOGNIZzcxbzdpYUtZY1dWYk1i?=
 =?utf-8?B?akVER3NpdEJHOWEzM0pkZGMzaVQyS1loU3F3bnFTZDhiY3lGMEdCeWZ0ZzU5?=
 =?utf-8?Q?j2JnDbuOm3baRz88=3D?=
X-Exchange-RoutingPolicyChecked: iz3isE1o39PtayuEjdeEM0b2W2Y0zGQDDJhybGIzn8J9Ab6OZhhOcHy/ul2jZbpP+p7z8wFfUgIlzeQTnTzW1QuMSBQWD+NVe7oTJoeay5PeB0prglKvNsVhYEtTT1oTUqjhBJaPZYL8obEpD6RviAWTa/aCh5q+lXv03M8Jrrdt1Mh60tTHf/oIAjhS3Zssm0L+p3TCmE9W465MM02TbUdmN+Ej+zvrAJX/p/B88WiEGDZCpHj/KWv7wWt2v0i4qbLUiNJYoSQIjSe6tJ/EnhWypOQFOBonMVijX4fgOZ6L4MLR7QF1+kfdo4sSDVtJiapxFpR8/ALDTUBbLEOVLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d46ae7-7e2c-40d2-5a39-08de807aaa56
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 21:02:26.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wodk1Vn2sEcBasM8sOxwQRK3B9aRncXgC69egvo/wgWLTmDwSUHTBt3R+gBej2zLuqA1dvj7h59V06Tqsx4GCTX7M5XoT79XkZJamYFUkPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_210241_191260_58618A81 
X-CRM114-Status: UNSURE (   8.01  )
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

Hi Yifan,

On 3/3/26 8:03 PM, Yifan Wu wrote:
> This commit adds the support to check and test this feature on HiSilicon
> platform.
> 
> Specifically, this is because on HiSilicon platform, the mbm_total_bytes
> counter for MBM/MBA is located in the MB_MON, which is distinct from other
> monitoring paths.

Which baseline exposes MB_MON in resctrl?

Reinette


