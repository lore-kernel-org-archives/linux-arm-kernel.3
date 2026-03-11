Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78214FD88FF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7n1LMSeIcc4uGsTkQPWcoKQCUkeaP4HA1YxrVOESZrE=; b=3o6WV8fyBEO+YNrXoHvGsEbqfk
	iUNKEC6IYH6Ymw6nx2OL6DOuGyc7eWP8Jt5jQykgx7508vzomaHNvnxiJuPcT187UDSyFWl6jWKwh
	J8W+7Ma57jV0dvgftBRohZ+/CW3wmqmwyOn1bKvjQvkZDMhKT8M5X9DdUuDXe1VH4Sd5RFwAEH+eD
	v+Jz9oPKIsGIM5G+foFFFkKCeKDNcEIifc65LlY9F7gCWsR8Cwqz+NZpjx1FEj8/RjqPoo9pM7kVa
	PjET1RRofaFFRjLvTUIzp2Ys5MArCmqp1W2SNoGmYoWUqX54p+2YWZy8ueCpnTHe7TICnCUVb5AJi
	oheyNZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FYb-0000000BEJD-2vSS;
	Wed, 11 Mar 2026 09:08:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FYa-0000000BEJ6-0ibh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7n1LMSeIcc4uGsTkQPWcoKQCUkeaP4HA1YxrVOESZrE=; b=Jp4efb2zB0APsVid7oOu1GI38L
	ZNxO7Vla568bnVS2hZFX+M1r/oR6qIDtBk0VxtTZPgOMDjvFf/pNKFOsc8TxuGT3FKswAPisdor16
	qcvVjmvBwSUcaZXbJloZ0sNRTPPIy3CGtvWmG2eHthfwk1NwtsfrsNKvpq/rwrdEAeXdKLIjOUt4x
	OQj5DSVIXUb4SBuTkpZ7a6YMxXuUi04kYo3IZ7j7b8eIlgedTOQnAK1eJkvjhHuqDu0FDEv1uNQaS
	En/aKiOSjhqwYgUtrwgBNDhtFbb5fqCJNt8V3VqkzgIy2ZAu7MriTSADe8ydgceCTsS3extaJzp2S
	lZnrsSDQ==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FYT-0000000GVV6-20Is
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220117; x=1804756117;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X8G2cGcufmvCldP86k11lPeazo69fzV9LYUW6LqibuY=;
  b=YEGUNqkxIIr6ahIGgbmEQD3FV/RGzSTTH8EliufW6eq+QXyalM4rx9W7
   8HQgawLxRbcGUysNAwSHCFwFQYTM80XvVg09R+ngfgUoOfbvWIjDItwBd
   YamGbYFZX+LdNIzudiJeq5kh9Aab9jykOZ5ru7Z8s1N9NVbCcIhpLUlKW
   mrYqLpRUeEcGKe8xDF/kWgLRHF/GGoc/KWANDWMeZs+edGZw621HFPAtT
   3Hla0JootrrQxvpV7/8zYApyvIzMufLjtae4Zo406QzlDopERy3brNuS3
   ZPr1aet9UIBtV9tkywxnjjtfQRVmSrF8lwWuI7qNK9/2avXIMbflDScpY
   w==;
X-CSE-ConnectionGUID: BZP+BV62SRmvMEICopZjLQ==
X-CSE-MsgGUID: uu75mCqWTwWzXXyPup/bUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74402107"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74402107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:08:28 -0700
X-CSE-ConnectionGUID: 3/gZCL1vR0G4aWYx4VzDAg==
X-CSE-MsgGUID: ztU+VjsWQpOpcIP5eC6qEg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:08:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:08:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:08:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMtPM+h6d4UAhVohtGHCCi0ydoKZ7gp/Or4/JEE3Q+KXqq8k0IP//kTVaOhsb2HGZeB9Dlj0Pw4X7xND5jZQNCsOTIZJsW0qWM2GRYIqcyWMXCV0Oxk3LhCet0mjB8nfz14rRbK7O1jZck/ruaS+h4eLCkeKmBoZe6VRvV6Ec+kvXb6As6ZkxtelCBS2gZkqEi6oV5Ngwfmk+soZl02uovlJoJuU6bH52w1vXcGJt8JhhIg6v1sYLr0r9U1ZKIP+X8FJ44Mylwl/wkuBf5WUtzYDBXd7e8VVdWi8lyoZ0n5XL7izQczjFb1xPQUzR5wYTvUbZdtfavZ6PoTxOeGElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n1LMSeIcc4uGsTkQPWcoKQCUkeaP4HA1YxrVOESZrE=;
 b=k1YtgkXDRPBIwHAHkdE6xemlnsOyq5QfRfoR3dH5x+ZSa59hRl4wkYzvrDUf8WA8MQuPqxGi0x7L3mc6D/AkslOLo090iyhmQtbfyCp5bj6g0r+WUECNwuGloUQymop6dPXeCOHGJBSXX8qcjXobZSQ4uL4B16I6G7RKLVc65l8eD9okXJft0LE0c6USOJSVnhPo9lsSYV17/pXFaDTtxBEXllxsTgzXj9OiKLMRa+nmABIj1owbB9Lj43Isbn504AboSi1Uq/pGyQi1hC+toOPI46G4/Q5kXNBlq3BYrCrxwouIDjLluB21y0I7sA0q0VCGg1wQtO+/Z47cJBgszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 09:08:19 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:08:19 +0000
Message-ID: <cd166dca-91bd-405a-af35-254c097bc0fe@intel.com>
Date: Wed, 11 Mar 2026 11:08:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mmc: sdhci-pltfm: remove duplicate DTS property
 parsing
To: <ziniu.wang_1@nxp.com>, <ulf.hansson@linaro.org>, <haibo.chen@nxp.com>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <imx@lists.linux.dev>, <linux-mmc@vger.kernel.org>,
	<s32@nxp.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260303105006.989339-1-ziniu.wang_1@nxp.com>
 <20260303105006.989339-5-ziniu.wang_1@nxp.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260303105006.989339-5-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 78561529-0e44-4e20-4476-08de7f4dbd1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4+3+QI9vjixJzyr0UH2HDm49vm0xNgyIdDLzYXQJkgEecuTzeNpSo1butNM/RoltxTNZ8riDfUHsY8FUFlfPersCXiYVgtVkF2st2RecbAceQX0K+NLQufykYc6RmpKO6U2vKnBQUupieEmuFLYmRacNPrwb9cGIm2Q43RUP/wn3gWN6V3M2L2wmt/jwJXaGiFGJQ6pRPvAg30boIL9T68uENFLG1IuLec9/o0I9hLBFZW7PKxeZ9kn3BAJBoKIjq7bYKB2vlUX0oj4yXSvKV/AP38/nhAkpZV7jM6/gBarIRWApr2YjpTLOWszm9eOASDuvUxK1tnDdWIN2dFU2barcHr8D4rBufdIkqz5sgdSPo7BkRlgHCS/GjGEG2gZ5dzrLGl3d/r9J14GyNOAKPBdQeju7fTMx3VPDoiIDWG7OGl4ZRFyTRIufMNMdXJoJ5320QOjM04r1naDq9+5LPfFuFJsw4p3OSAQlpyJGl3CVOD5s4KwYA2kZ6uNsnJ0w9GhxTdniew+71UChcvcnxjDg4B3ryZxGXyDbtzOaYkEwk6e4OKF1fKnduTz1URpyad+NZDwXHKFYh6UdBQKHge5ssVbQf0BbTNEPaOSL8fkIgVbkwaSyxeYd2eiZPTxiVQD8RNWno5/1K2GOENuo4VBhfFaeK3UqZCosy4zchDPF7HlyQvur6PgatgCRKa6+e7B1sQ8FFMcuNkkvtFaj79GQgSPxjsCyZ9U6xDDsLzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlsZ0NhdUJXblJhUnhSQzhuWWp1VVhNbHBodDVEODV0YzJQd1RMeFhOYWpy?=
 =?utf-8?B?b014RGgrS3RXTEpwTUd5QmwzbGVoNUNhSVp1Szh6TDFLMStpZDBXOTVMMmVn?=
 =?utf-8?B?TVNmNC9wVDBubVZOOU1ESERrYmRHWnIrUk5hY1dDRGZlVU1nV0NJanordHcv?=
 =?utf-8?B?cHdCOGVpRUM5WWVvcmp6RHpVWitpdzVEWEhIUUNBaWxnNnQxb2liaUJTL3Zo?=
 =?utf-8?B?YVRmTWJpdzl4YVhzanQ2OGVZaHVLcytBaEZKNUpRMWJHelRkVTBZYlZFWWRW?=
 =?utf-8?B?NHZQcDdDYnJvOEVtU2Jtam5jTW1lMTU2d3JuVHVmQ3IvRzFQdWh1ZFlhc0ZZ?=
 =?utf-8?B?Tmp0TU1HeUFwR21jWUVWTkVnUENyQTNtSzhvT296R3hIZXJwMkMwRXFtaVRx?=
 =?utf-8?B?clBlVUxveUMwUzNZZFdtV3hneWI1c3NNdis0ZDFxZmRBb2dYeitUemxiamZH?=
 =?utf-8?B?cHVudUJDZEN4aEw1UUx6a2ZxRGxpT3JHN21uQ0dMMjhHSmpSREFLb05GRVJ0?=
 =?utf-8?B?bXNEMVZOaktaVXhoam1hN0N6MUsvZkY2ZHo1Rmh6b1NlTzF4VEtVbmlKU3c5?=
 =?utf-8?B?V3VUZ3VwN3kvSW13RDZ3UU1nVEtETEVlTm95b0RMaXMzZmRLWVRyaUFML0xn?=
 =?utf-8?B?M3ltZ09NRjg4NnRDMHZ4Y1BQVi9FZUtpMGliSytjQWVnUlk5Y3pIOWcyUEZ1?=
 =?utf-8?B?QVBjVEtJc2JMV2F6ZUc3NjViaHFPKzNSOWgybVN0aDhwaUNCV3c1bTFPc1FE?=
 =?utf-8?B?YkRLU2w4cDJEVTVuSnNhaGpaazBWdUVCV3VQVzMrMjN0S3lNcjdqRXJUVWgy?=
 =?utf-8?B?ZHdTN3JUa01TS2o4ZWEzYUk3WTlkbEZRbnpIc2FZdkt2UFRMbWt5NXNad2dE?=
 =?utf-8?B?aUFCR2FzRlhhOE5YdlVIZzIza0QwVEJoa28zRXdveEVxdkdhTndXTCtjYmJ1?=
 =?utf-8?B?YnkydzJXeHJsU25CVjdrLzJuWXZ1L1VYQzlBMmVMNWc1Z0xoa0h1NmpZaTdk?=
 =?utf-8?B?ajFjMVEzVU9VV0grNy9FVUJlaWQyRGJLdWRLTGJSUDFQVEdOa1pPR1kzWWN2?=
 =?utf-8?B?TXB3cU1nQmxVNS9DdlYra0NZbWdWdGVjektyNnZIeFhiV3NUR2Vpc3VsazNv?=
 =?utf-8?B?dGh4MnhLSTU1Z2lLNnNJVFhxNlpKRUU1WGhXc2NxQ2hUQWJHMDVzTGpjZG9i?=
 =?utf-8?B?ODRXQVU1K1VjTzRKb3MyRktMcFFUaHJ3ZFlLbEJBRzNaZHlRMkw3T1dxblpv?=
 =?utf-8?B?LzdKVGpVSHRJS3dyUkNDcm55NXhjR21CbFRQYVUwM2ZSYVpqbjhqUzl1R1hE?=
 =?utf-8?B?M044RzFtZDgxRm5oNWJYWTB6ZTRhalpyWklLTkV4blJhTHZkYi9kSndLYkxh?=
 =?utf-8?B?bHBLRlBTVjBqQ1g2bzdNKy94bExKQVhpMm1DdGtZVGJPVTFEeHIyVjNDMVUy?=
 =?utf-8?B?blErMmVKUEpsL1JIcFdZeUhjaEdoWmE0cU5oN1E1WGVHVG5WQXJsdk44YU40?=
 =?utf-8?B?WndUOFBrK2lVUjBocDV2aVpRTUlUM0VycXBDQUJnYWVjcHRsTTZ3MmcyU21R?=
 =?utf-8?B?blJWK2U0RUw0RWlSclE3SEdvckFyTFNFVldqQ2lrTGZaNERNM0pRRE84SEhQ?=
 =?utf-8?B?OVFOM0FWcFNOREMvNEZrTTB0S0I5RjFTNnZ3R3lQbEUwM2xOaE92OGFoM3pP?=
 =?utf-8?B?TkVtVmpJdG1Rdll6M0pBNkNBNHpqSTBFOTdSdXJoU2w1Y1lZRVFLS3l4L3Nz?=
 =?utf-8?B?cGd1VVpiRS9IdkVIRko1NzZmNVFaS013dmh0VHF1ZzdjazdJLzg3QmNSbFF5?=
 =?utf-8?B?MmprNFFiVFNUZXkxM0JCZ05GZXNwN2Z1czFGeVdXZThhb1ovRUp4UGI3WVdx?=
 =?utf-8?B?NktXVVp3WnBKQXV5dEY2eDRhd3l1ZTJTaGZVaE9jVlBzY3FqeHlHaGl2MGM0?=
 =?utf-8?B?V1dGcFpwTDQ0bU9yM2crVVpMSTg4WUIwZTVMVTVqL3ZXUVZsQndNTDNNUlQv?=
 =?utf-8?B?UWNDdzhlOEo4Ni9pSllNWGNrVzBBN3ZDNzdTN1FiS29MYmpkWHdQM1RiR2Zh?=
 =?utf-8?B?dUUyY3Rld0t2SllXRVFUREJzYUluaGxtN244UDl0WW50Vy80aDhQSGhyU3A0?=
 =?utf-8?B?UFozQmNOd2JzM1ZrbWxrU2VWeVFpOWtQRjlhNjJvS1AwaTFYRVYyUnR1UWs1?=
 =?utf-8?B?c2U1L0hNZ1dzTzgwNjBreENCelpWbjZxVEFIYXVKMnlENEl5NDNUQkZwVHRE?=
 =?utf-8?B?S1NNaytSM3dDVVJVdWpOS0hTRlpmOE55SEI5UHo4WTNpbzFOaDJlakpTR2Nl?=
 =?utf-8?B?RU04OGJudjZ4alhQK3RBYUhFUEVEQXBoZ05tMDhuMGxtVlBLQ2ZZL0J3cFpi?=
 =?utf-8?Q?MVS91rwbN09ukWYQ=3D?=
X-Exchange-RoutingPolicyChecked: Q6QSvxpDQriKNJhMogO+pQL4lXn8/cG1N4SWFF5Nsk27u7fMCvR4WXgDZxSxF9V9R/WfhSpG1IrlVptIE4gmSeIweuOEQHAKa1NmgyJp8jXdOQBJotIdbCyec/iC8rtnjW+m9VIjUX0l+0YCP0DbWE28xAZOhIQutLo767+LOuq1yM8mTSpgFDaiVuz9SSbEJy9amkoQrOzIpXJrsKgDmw13SdJBGxAIosLTP/G+kzknoCm1R8SYy/JbXASlpKMg2ExM1HnnSFVhBjc+TOgfjE78sQ2eFfB53GistnVYS9uW1OxtenMy35Nbrsal+oQHOWN72bE/H8jeQc6b+ZDm7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78561529-0e44-4e20-4476-08de7f4dbd1d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:08:19.7720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxhjpQZ6GjaE+oepUmGt589xhqAYT+kH7Dc7GmDryIhs7WdfGhP+teM3ZAX+bKGJUuyD62JsEDAdVp5v+iIFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090837_964497_8D9DBC4D 
X-CRM114-Status: GOOD (  13.96  )
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

On 03/03/2026 12:50, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> The "keep-power-in-suspend", "wakeup-source" and "enable-sdio-wakeup"
> properties are already parsed in mmc_of_parse(). All sdhci drivers that
> call sdhci_get_property() also call mmc_of_parse(). The only exception
> is sdhci-of-hlwd, which does not call mmc_of_parse(), but its devicetree
> does not use these properties anyway.
> 
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-pltfm.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index d4fb60c1ef69..933fafe0a0ef 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -95,13 +95,6 @@ void sdhci_get_property(struct platform_device *pdev)
>  	sdhci_get_compatibility(pdev);
>  
>  	device_property_read_u32(dev, "clock-frequency", &pltfm_host->clock);
> -
> -	if (device_property_present(dev, "keep-power-in-suspend"))
> -		host->mmc->pm_caps |= MMC_PM_KEEP_POWER;
> -
> -	if (device_property_read_bool(dev, "wakeup-source") ||
> -	    device_property_read_bool(dev, "enable-sdio-wakeup")) /* legacy */
> -		host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
>  }
>  EXPORT_SYMBOL_GPL(sdhci_get_property);
>  


