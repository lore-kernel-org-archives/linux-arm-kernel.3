Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ED1CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C5D0hmt38z97aoszrn9iHJRSDqU3BaVU9XKgS9u4no=; b=0nkA2VLZTlBMvdz8JHQkePfLbU
	JP454pxNlv07FhLBZA0H/wq9Ael8vWMHNsYtMOe2dwcI8kU3iK2dBY7XlYtsPr91MoHA6gDc/vDhD
	ceKlJ9AL3f/nSPksAFFbgBOqPIm4a/2YkuezCnhnIVKLHrhdxo110pHgbf/srj5yzxWvTWOm3thZq
	h/k1+iiIKmYCHAVs+ecpblZ5TSMDt3Pfow+IBEmTJHEU1Gs+irLQV8zWrnd68bgRrBcN/Kkau7sQd
	jXHsoSQcUaoERZ40h8LB0pjCOrap4jqbz2Kw+xyBFXs5WDrXFeqnhLyy4Wx3Nhg82y6l5Hrx6C2ki
	sEaZ2wMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuE8-00000002SYp-1QvR;
	Tue, 26 May 2026 16:01:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuE6-00000002SYc-1oRR;
	Tue, 26 May 2026 16:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6C5D0hmt38z97aoszrn9iHJRSDqU3BaVU9XKgS9u4no=; b=niqOSOQxRwCAiRH54Xh98gxNbp
	dUiTYp7iwvhk/nJlscB3/RLvbCXPDWEketsoTJUFOZPmLVtP5HlU61uXAIAPo6QDKPLLMxDrEbQxl
	aE2bkeSfvnFWRshiJ1b0b5zndpuDxEcV7Mby/agbfmVHAvsuBWHT/Q8H1+uvpjUH+gv2TqL1sL49T
	4cBygdN+bDpvBgh+SJ1TuAhVYAMJsaGFmDYhIU9KwuJjnB64x2SX+VGMl/OmXdVGX6OgXYngcCb6w
	d1j2CHH5AHiAfWI+lFQ7xvTZhd7QVpVbdvjP4ClbeCGANMolpVzYrjuiqEhtAAc/Hmd6ok4LiGasH
	eahl8TpQ==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuE1-0000000Bm8I-3E3q;
	Tue, 26 May 2026 16:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779811310; x=1811347310;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8JMIRFSF2j+FOMriy+dVER00kNP8uN3S4uu0smtyzU0=;
  b=N8YIS1QaMMH+N84xdhAYCk9ndZYkdXMOg8IUDpArJKl+zLeHxNB2doE6
   9VB8s0P24cUROGXz13Pq0hAHacA4G+7eSWxyYhg4MFrM+EFdcaId1tye2
   d7Nv5yKH0MN6ccYrAWJGLkPm+APp8M7MZ90awME+eJGE0PQMyBKwWAlVp
   M8aEUk0Yx28FwVfxE8P4nWwmSigJStFjktwxYEnc5qDxEGpML1ha8GYrS
   AI0Dm8YszICHCh0lhDCxX1DJS5LpORTcrkxQLCjk02IrAs9ZD/r8WJsQv
   pPoiCWPu4ndffFYkcugXcAJJltes9KQ2oRGZOiZXf/615Ej3hWrSxsC/g
   A==;
X-CSE-ConnectionGUID: oFW1/SqEQs6mlzL+SMh9Kw==
X-CSE-MsgGUID: cHor6MbDQTqGNOqFDODxnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106086671"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="106086671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:01:38 -0700
X-CSE-ConnectionGUID: b0t/+H+GT7WZzD88WwDYFw==
X-CSE-MsgGUID: b9Yj1mHGQHSpvovcvawDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239353342"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:01:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 09:01:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 09:01:35 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 09:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq0Vt6GXj9z+InBZGIDV0kGr+bzeThbBhnjKUUrIKwFaRB0KcXE1O4KglnqEzHCRdLERdzBj3wi7qCw7KAftcpkqWdLZvqZ5vq1OxzuUOKhMECL2S9a686aeDgIYmr93L1K8lNeiwQrmFZM6EUR1mSxpozf836Tf9qfa8ncHlDeS99Krptp8tX68L8O3ebReIJMR7u0cJs2e8DKQW8aZUsWtdchm0v3SudONVH4gZpWhPyRRrr3ExweMDqXEZ0UzGLALl6yssw93XsYtmGZftl/FCxmIkVdvaH4aKIXCLi77DjP/++UDqMCX84hu+WzzdxqYU1adRUzcSJ27X8/CmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C5D0hmt38z97aoszrn9iHJRSDqU3BaVU9XKgS9u4no=;
 b=ktmkmNs+okCjDBVkeW8IQj2mCuL3uYjsGRWkliviHE08J0FUJy+YUC9dfXyYEdl+nV/qj+H4RrGFW9XL5RopsmVX1okStkK+eJaRb6HX2nUf16Jh7iWZQSYicgdRlNTZKwBF6H+xtf1hWGzv99TaUKi5DnEOzCfn4/eRQRHdI+sJpBNFh6ArwfAOC/cxJ8lznh8Z+uLj0849K0OTTBN5W5Xa4OGVuKGBBbQ7N7ta5ak7hX1iknX+fTu92Hggs3Kh1IMbU6gZu3dfJnbFjr2NF8cb4EHGvIekkRPk+EKgT5dA9I+hskh1jc3xm/VBgs4MjrnERT9XYU5AK7ZDQ1Iawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CH8PR11MB9483.namprd11.prod.outlook.com (2603:10b6:610:2b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Tue, 26 May
 2026 16:01:32 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 16:01:32 +0000
Message-ID: <7473204e-2ccd-44d8-b703-5a5dbcb29b61@intel.com>
Date: Tue, 26 May 2026 18:01:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2] net: airoha: Add TCP LRO support
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<netdev@vger.kernel.org>, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260526-airoha-eth-lro-v2-1-24e2a9e7a397@kernel.org>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20260526-airoha-eth-lro-v2-1-24e2a9e7a397@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0017.eurprd05.prod.outlook.com
 (2603:10a6:803:1::30) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CH8PR11MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: f49cc760-e853-475c-b4b2-08debb400e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|11063799006|18002099003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info: 8A4f+i6bITQvKpmK3oyoBQsEDQ4jXTPRysEquX5bJfZ2o6/ItUKMJH5xJEbC10yHJMLBIBXksoAb0Ek7+8QSPZ7WCwNusEqvxdDfYw15cBwYJYRE7tLgumYC6NaSuOOzbe5t+VsauUBscFERSkQD8zjmi8LLE1nltiLDg7lOspCuidfKoKdcORm207YbcUawFFpcjqC/C1RjTde77DS9063eW4LdD/KKSEvPTXnvJOiFgMRNAHRtxflV0dwJeNwaZwaGyi79kFNPNfIFIh1NJYSFGcv2VVBUL4/caMf6W3Qiw+27srl6VzXwDUggI+t3za4qNWVB5As6olWWQSKdNVd2CzEz6TP5XzbGvuv7X1X6ron2AlA8WlOnAwewbvzdZhmZfJFGkSJeg1jVBNtn4nCn2bmTY7oAxj00a6DQT/WucR6ihhUqkWt463j/sA9ybIAk8aFUuO7IdmF51NHL95Le0aPyYoDFh6zM1GwSKT3M5F9+2S4PZ+rOWqGWMZp25Q/Kf7/JcVpTFni4bO8irUEmy+dof5A7KUiX8+sMmD+kDwJ8rtskQ+2R9fIc5m7wEHrGjFbO+PdoHkfxkyZEM8QYX6mCMXAJMpl0HCnOAyDrqzVqK66eCdNWsfPXjvTTyTPQb1Vxfuodnn7qhjTYzSuN8Vw1BsK900DLaihZ2K5y0b2HcppcQOuabPzhjA14
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(11063799006)(18002099003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdNbFgwZzhlQkdTZU9xdDQzVEtZRGQxcUhxMGVKa0JVL05oN2ZiVWE3R3NV?=
 =?utf-8?B?dlFDRWhESlNpcTFWYXpYbVE4eVdzNElsNVZoek1DNm9CYmFWZy9KOVV6dzRo?=
 =?utf-8?B?ZTZScWdGVEdubjNjODhOWTYwaEVSaExMcXhOWHlDZFZJdi9xWHh6aUNjRkJG?=
 =?utf-8?B?YjZqcWZ0MEdBSUNubitkUFppVzkrNFFCQzlIQ3ZDUTJzMm1WOVJMUUcreUZu?=
 =?utf-8?B?dGpZdXZ5alJKRnZWSFIvREhkNUZxQ3lFTWNwRHpLYW1qWllzZ3FhNjI1enZu?=
 =?utf-8?B?bWJocEZsLzNOQmgrM09PQ1JVT2dEbHpNY3RDNFRvVGtDYU5GN2EwR205eElx?=
 =?utf-8?B?MDI2N3E0T0VUWURkT215TGJXYmVOR2ZjdFRvdVk3RDl2MjNZbnppWFBmaFlB?=
 =?utf-8?B?RDFYb05UdHYyZjBacVA5RDRiSld3anE0NzVLT0VQakpVamZJWkkwMEVYUUNK?=
 =?utf-8?B?aXdiMnBGV3pMM2U1WlBLK3kvZXJ6UDFwYXFxQ2V2YWdJdG1ZZm9obHR5QU5Z?=
 =?utf-8?B?N2kyS2JCbStkbjJPbGV4QjNHTlgwQ3pIOHErcVVCTjlPazBlR3gzbUlIbWZZ?=
 =?utf-8?B?czlPWGNuejByVlFyM2F3UUVoWHhaNVZ2RlMzQzl2Vkp4c3cvS3I4VHhkN0da?=
 =?utf-8?B?d0xUVnV1dW55NFNmb0JHOHJaMmIvTmRwZEdQMnhubU5QZVEvNlhQSHBtNjhQ?=
 =?utf-8?B?VFZFU2dUOGd4OWtPTkNEMGxuZDBMeEN0bVpSNVlsWkZGTGM4Qi90Q1p5bmhY?=
 =?utf-8?B?OFpJS1VJQjhMMmVkUHc2T3ZnZTIxYmx0VHo5b1dnaWhad2hjZ0pwaWNuc1Bl?=
 =?utf-8?B?cWMvZjRvQ0JlN3J5VWFBVzJCNGkzSXZvdEcxckwvMDZVVDZkeVZzWEFlZlBU?=
 =?utf-8?B?MUM2MFVtcmVQcWF6ZEdLeEw3WFludGNoK0d1NjJlZ1k3NmtiZm1PQnAyZHNq?=
 =?utf-8?B?NFNuQVRMSkttLzhtalJ6Q1ZETGtTdkl3V1E5LzJlZEQvMTFjTUVrMk0zaWR6?=
 =?utf-8?B?V3ZDVE9LY1JaNWg0Z3lQaG9GQTZxNWY3dGJueUdLWExMUCtKWTZkOFN5dWRP?=
 =?utf-8?B?TFRGK3lYd0ZGc0E0d3NIcGtFVWFoUXloZGV1R0hHN3dPV1lVdlRNVkxkMytv?=
 =?utf-8?B?WTFidkZwMElraFZDR1NhNlNISk5RWUh5Y085dUhoZ09pUk1wU2t3c0theE1m?=
 =?utf-8?B?eENEQ01qTkFzaVZtUWk3dGtzRjZ4NTNXSFhqSXJXQkFhOENBSHZDU2RaTWpr?=
 =?utf-8?B?MXJ2bG9XaVhSZmFZaTVDOE1Ka3lsWEtLby9pOUlXZzJVY1ErL0tKZFdrMXVq?=
 =?utf-8?B?aDJ5cTExcEk2eUVlcXQ0eVVabHNVQXBIOE43N3ZBbVNidDhlRWhLWmYyYXJx?=
 =?utf-8?B?RzJ0MVRWaFRHbHVjb0NPNWZaQnFBVUhpU0hsdVF1Qi95b1N5a2dyV01aYU82?=
 =?utf-8?B?M0VGNUlGYTJ4ZExyUEhRT3U0bTQ0UEJGVnJFMzhIaGNWNzc2T1ZuZFNDQll0?=
 =?utf-8?B?VE1Ta2lVZkxMVEtFcEo3TVpmeFBiTFJxTk05MG0ybE5Gd0pzL2xCSkxIa1pU?=
 =?utf-8?B?emI2L25OV0dRZndFZFgrbDJZRTN0MzJCODhjTGdETE9NVGg5ZjNuekY2aTQ2?=
 =?utf-8?B?Mk1HVnk2UXNkRWo2ZTFpcjQ5eklaei83T090VGxBbXp0dFNYZ2Y1aW4rVjJw?=
 =?utf-8?B?cEpwaFlPM2k0Unl6YlpmSXRxNVNGVlNZRWZoa09JZ011bEEvbEZaVHdSVWFr?=
 =?utf-8?B?cVZ4eW5rV3hDMUs2Z29jakhWdS8raW8vazlKUXE2bmhkWjVrdE1SVXRqNjJu?=
 =?utf-8?B?aXViTDlOd2lobEc0Wk1JYUYrZG0xN2VNckVra3EvZHRJbnp6N0VRS2ZmTUVB?=
 =?utf-8?B?M3FvbmZuclhRcGsveWtIU1VGNllQWUludEo0Z0FhbStMWGdaSGpiNG5GVVFV?=
 =?utf-8?B?QUl6eWZMU0xybCtTbHRxS2VidG1kOXZ2am5lbGR3QmRPK2FBNHlsMmo3aVBh?=
 =?utf-8?B?UEQ2VTJhR3Z1QlRtelpyYm92Q29hS3BJN0N4KytKRXIvaHVWSEpNaEpjbjkw?=
 =?utf-8?B?QmtDc05NZFZYaDkzSmxVcEpsV2VTT3N6aEhrdmpZUDNRazY3cXBWcVFEZFRT?=
 =?utf-8?B?L3FpNWM5cEE3ck1QWGcxU0RjQlZuM3pSZXAvYWpXUWVSMGx5L0I0TE9jOFdN?=
 =?utf-8?B?cmx0NlF3NXF1aUhtVW1ZZ2Rla2twMFE2c043Z0ZyMVM0VktqTGlNSmZsMW9y?=
 =?utf-8?B?Wm1FWXUxMzkzdS9RRlNkMlZ5MGRLS2dEcFdkMXRndllnQlY2YzhLR1JsUnFz?=
 =?utf-8?B?azh4c3JCUG9XUko4ZjFkbVlsTTlwOURiQnkrbFd6TlNHZ2llV0pHOWpaR0hn?=
 =?utf-8?Q?3KOuCeQZj3i8w3j8=3D?=
X-Exchange-RoutingPolicyChecked: kNjJiXN7MbnsYucv8uevRPGJfG0J5uvuPVCsEYw6MPScrdmS+0c5BoaA6SzjhU91ETT0zNoK8nX1UFUQOjjyJ5iTfzf/uM4VpMs1OF1YEoyeY51rBqQ9oANs1XAVbLmxl6bxUOs1U8cp6POTk4x4oRmn5jLQq6ToHwoNfHrgY0irxfW58QFxHUxiM3JgCTmhisWJ7TYV/9AoZrpVPQleScKmAMMRI5E+Gr4beBL49IGJ/J2gaEyTxTa0r3cI07YC2Et+7c2/YHTBL8d8hvl+Zq01PQnMw0leg2j2p/LMkmCaid53N/KMR8Hq4SbIuAE8twjvpEYO5NsdMxsdtOiozA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f49cc760-e853-475c-b4b2-08debb400e2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:01:32.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk327mY6iryQOtlfZWDgNJ/Rb4kFVfdO+AofjrKBsGgMM7i3T7RWdzMCuz8qGtsMEzfFJKUTIJ8Act1JG8MUzm3Km0ch2oI+Wcv5TKZ2HjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9483
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_170151_629143_D94EFA7C 
X-CRM114-Status: GOOD (  17.69  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 26 May 2026 08:58:05 +0200

> Add hardware TCP Large Receive Offload (LRO) support to the airoha_eth
> driver, leveraging the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues
> mapped to RX queues 24–31. LRO hw offloading does not support
> Scatter-Gather (SG) so it is required to increase the page_pool allocation
> order to 2 for RX queues 24–31 (LRO queues).
> 
> Performance comparison between GRO and hw LRO has been carried out using
> a 10Gbps NIC:
> 
> GRO: ~2.7 Gbps
> LRO: ~8.1 Gbps
> 
> Please note with respect to the previous implementation, page_pool
> allocation order has been reduced from 5 to 2.
> 
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

[...]

> @@ -587,6 +630,85 @@ static int airoha_qdma_get_gdm_port(struct airoha_eth *eth,
>  	return port >= ARRAY_SIZE(eth->ports) ? -EINVAL : port;
>  }
>  
> +static int airoha_qdma_lro_rx_process(struct airoha_queue *q,
> +				      struct airoha_qdma_desc *desc)
> +{
> +	u32 desc_ctrl = le32_to_cpu(READ_ONCE(desc->ctrl));
> +	u32 msg1 = le32_to_cpu(READ_ONCE(desc->msg1));
> +	u32 msg2 = le32_to_cpu(READ_ONCE(desc->msg2));
> +	u32 msg3 = le32_to_cpu(READ_ONCE(desc->msg3));

Why are these READ_ONCE()s needed? Does desc come from the HW (sorry I
didn't follow the whole code flow) or...?

> +	struct sk_buff *skb = q->skb;
> +	u32 len, th_off, tcp_ack_seq;
> +	u16 tcp_win, l2_len;
> +	struct tcphdr *th;
> +	bool ipv4, ipv6;
> +
> +	if (FIELD_GET(QDMA_ETH_RXMSG_AGG_COUNT_MASK, msg2) <= 1)
> +		return 0;
> +
> +	ipv4 = FIELD_GET(QDMA_ETH_RXMSG_IP4_MASK, msg1);
> +	ipv6 = FIELD_GET(QDMA_ETH_RXMSG_IP6_MASK, msg1);
> +	if (!ipv4 && !ipv6)
> +		return -EOPNOTSUPP;
> +
> +	l2_len = FIELD_GET(QDMA_ETH_RXMSG_L2_LEN_MASK, msg2);
> +	len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
> +	if (ipv4) {
> +		struct iphdr *iph;
> +
> +		if (!pskb_may_pull(skb, l2_len + sizeof(*iph)))
> +			return -EINVAL;
> +
> +		iph = (struct iphdr *)(skb->data + l2_len);
> +		if (iph->protocol != IPPROTO_TCP)
> +			return -EOPNOTSUPP;
> +
> +		iph->tot_len = cpu_to_be16(len - l2_len);
> +		iph->check = 0;
> +		iph->check = ip_fast_csum((void *)iph, iph->ihl);
> +		th_off = l2_len + (iph->ihl << 2);
> +	} else {
> +		struct ipv6hdr *ip6h;
> +
> +		if (!pskb_may_pull(skb, l2_len + sizeof(*ip6h)))
> +			return -EINVAL;
> +
> +		ip6h = (struct ipv6hdr *)(skb->data + l2_len);
> +		if (ip6h->nexthdr != NEXTHDR_TCP)
> +			return -EOPNOTSUPP;
> +
> +		ip6h->payload_len = cpu_to_be16(len - l2_len - sizeof(*ip6h));
> +		th_off = l2_len + sizeof(*ip6h);
> +	}
> +
> +	tcp_win = FIELD_GET(QDMA_ETH_RXMSG_TCP_WIN_MASK, msg3);
> +	tcp_ack_seq = le32_to_cpu(READ_ONCE(desc->data));
> +
> +	if (!pskb_may_pull(skb, th_off + sizeof(*th)))
> +		return -EINVAL;
> +
> +	th = (struct tcphdr *)(skb->data + th_off);
> +	th->ack_seq = cpu_to_be32(tcp_ack_seq);
> +	th->window = cpu_to_be16(tcp_win);
> +
> +	/* Check tcp timestamp option */
> +	if (th->doff == (sizeof(*th) + TCPOLEN_TSTAMP_ALIGNED) / 4) {
> +		__be32 *topt = (__be32 *)(th + 1);

Make sure you checked the code with sparse (sometimes it's needed to
mark casts as __force, not this one tho)

> +
> +		if (*topt == cpu_to_be32((TCPOPT_NOP << 24) |

Shouldn't this be `((u32)TCPOPT_NOP) << 24` to avoid sign issues?

> +					 (TCPOPT_NOP << 16) |
> +					 (TCPOPT_TIMESTAMP << 8) |
> +					 TCPOLEN_TIMESTAMP)) {
> +			__le32 tcp_ts_reply = READ_ONCE(desc->tcp_ts_reply);
> +
> +			put_unaligned_be32(le32_to_cpu(tcp_ts_reply),
> +					   topt + 2);
> +		}
> +	}
> +
> +	return 0;
> +}
Thanks,
Olek

