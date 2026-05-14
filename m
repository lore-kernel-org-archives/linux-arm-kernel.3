Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C8CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC1nOGbs80jRietb4BuXco4/K7RvTYsO8+yqCn8D98I=; b=ZtY63IspDARh+sV0hMCAZKMOd5
	bazNv5RDa1SJ4+ENutJGstgqzN+ePBdV/Z7tN1jpZiVRp9yUF/qGje+L4HpNF6JgW8P/w//oAMwXR
	Kn7oY2M6LYuLZM4/hKKraNN7XpoiFs0CeDHkiqPBQngT2FSShBOnDo4ndGTk+7QqZHVwtATIeU0SA
	dfVLOsFyikPcVrq4UWiHo2KuLKfpizXHTqqYPghowVB1rI2VmdX+SuYTNVpYLGcLJ7FviVtv+diZx
	2gq3599sla1FTMwh6g83v6E7AOXeO4OEVHVkLIBvumzMiVjviiy5uRaQQ5Uhc2G135z0NOZWLnE+n
	yZRgaVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0O-00000006Dhv-2GY5;
	Thu, 14 May 2026 17:37:52 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0K-00000006Df7-0Vpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKwbGHIXAGToTqCL3qWoq18SbTrgGPvBNNaE2qgANrdycz/W2yoaKr0Y6q4cVrUDjnSxYiPf5wVne9UAniHc8ZIgSHyY7vfkReYagI22l4yAktW4RL4HZSM+6GW2zb2HlWI2hMRtnhKLgx9o2+EeFabO+V7VUhbxkWkhv9fUrJbzEAfwzaWDVwUFqysUqubcy4LksUrsWfBxx6nVc6hwjXLmsOBbGIhHcoiZnAAtB0dR4J69RiExRVYy0v31z5LRra/gnqhKci8xZGqizqwUWvvAD0aHmHzxOkml0y4ZhhbcJyYoQ2yolVnorLZjFyV1p/nIGCE4vFqFjT1EYzPpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC1nOGbs80jRietb4BuXco4/K7RvTYsO8+yqCn8D98I=;
 b=ebUrPh0JEV3JeoSmuNx0ZTx+XKovA6iVvYNwIQXU3ogrswXRQl3VzNETxihcFDQZ+VDcvGtXBKf6E/yZj5JNRv1cGXyq/08a2z8yPO5Tt4BdGuUCEfpMHGYS/Bja3i57B5Rtb/638yUP2YfLn9P4tCQkpzjcbCISAQ0RIM9AS476V0WKSRB5MqM0WXLkEqAn5E+03cUe1K1nEQXost/9OfJGYuxIk0LZMZzex/8vQG4sNVBDR3F/abtn1Yv0wTInG8vSlRAS4aRd2G82l4EcF6Yc1fvdxn+7yKf37zr6SzmVvu6i2n0zdzgyyx/MGiDuzmrEnyR9D+/pNPapgRDV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC1nOGbs80jRietb4BuXco4/K7RvTYsO8+yqCn8D98I=;
 b=gp0h0IXQoZpG5zKsZ2GruOaXAktRzD9OweVUaE+eZlNuzrDtHeSCk42lbrcBUf/uo3vxKEUsw2sNyzYgDPQNDvpKIL3qAh1thNR5+va6kmQDwflHay8CoVpw6m4oQYX0+p00dcHzdF6VGTBKspNypxanevFomVZpwV+wa56XMDLgqQwLhVhNCLsPYUiEgqPoxYmArngTqBsqD/INcqg32L/OAueQBurOXd8dODpLGM4S3qpeBvEAE09JfhSsr2yv8j+SmR2+h5VnQZcmE6fTZbrZLIkSo0tFF6H2x9KVzEbmYpCmZvPhdUHauwZHRNFf5p4sOkHUuvLgvZu08/HlCw==
Received: from PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Thu, 14 May
 2026 17:37:41 +0000
Received: from PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009]) by PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009%4]) with mapi id 15.20.9891.021; Thu, 14 May 2026
 17:37:41 +0000
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Topic: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Index: AQHc4oidjgTu+I+rK0a55/7Ex9LQK7YNQ8qAgACH0QA=
Date: Thu, 14 May 2026 17:37:41 +0000
Message-ID: <27E42CCD-8518-4802-B549-A79B94B5658A@nvidia.com>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260514-generous-undetectable-mastiff-cc43d3@sudeepholla>
In-Reply-To: <20260514-generous-undetectable-mastiff-cc43d3@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.500.181)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7183:EE_|IA0PPFF4B476A86:EE_
x-ms-office365-filtering-correlation-id: b5a5c289-1051-408d-5b1f-08deb1df7fab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|13003099007|38070700021|11063799003|4143699003;
x-microsoft-antispam-message-info: iEFNja//sVrdjofTyh0yanlbailXSygq6Orx3P41disU1DjRHbr8xVdnb1fOiAXr0c/BZYqg+ilQ46w5r+qWyZzeu+wLAk6CzDUBz3d3wy3sJfhVd20pWmf2eufHNqsgl5/bigc+rC0No6/LglUrDPUDPhjUf4+weT/jZlqOcE+j+YwvUM2WJ7PoO2bVjK7RVQVjzG+kD4CGViTjf0Wd5qJbnMfagMOAas1CwzmP208D0MGSh1k5A1EGNwckeaTaCpSeNDaAdeCdyYcr6MaPeJLTXsp8kP65e3aLVfWknrHCs3OvC5zSHtkdXT+Rhvj6+PHhGNgHf4+hLsPtS1pJ9+n0Cfg8+F2vqoPp4G8thBN/VvdDVJlsfle9R/i+UEKGuvlRo6vmjnhZjSNybtt6wAwwetcIkT/06gHLaR7uICAsbspLwRbLUPmy7zRKkPwsE4hwktCb5klPvprxsA/mCutYBE5R9zwBjjJQfNAxmAX/TTga+O7hDFkKtyhfIcTjK/C/FpNmWczaHCMUKuBTyDvtFjp4qzKF6nzNJzApWkO+RQMOhUrckwUyiZRNWtvqYET8rcsWFm0CrmFs1juZL44pAGChdr/8WCDTUNfUXL38BK85Og+cEQeiYY31XZm0H1cJwPO9xuB6QoL0j867r9XNmNZK05BS7GXrP7MPEYKgqTBWrT+0dxXtkDD+1Xfs19/33nri20xSmohLIYEs5wkSMKYN0KnkUZJxRSccAqJbO7BsR4bUgzz0fm3rzi4l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7183.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(13003099007)(38070700021)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWtzeTR4bTBOUWdtd1p0djZFbkFBQnNlOUZRVW1iTE01cVhtbWEyQVBsQmRL?=
 =?utf-8?B?dzcwWU0rcUdwQVNyakc5VG9xWGU1SFZXSHhwaHd4Qi9qUHAxdXlmVitsYjJ2?=
 =?utf-8?B?TjhGTGhHNS9lM1RkQXdUZUc1L0FPVHA5d2NVYU5GZzV6QzhNQU90RTBwZjZj?=
 =?utf-8?B?YWtHbE9NbDNMc1JSY3hYTEhrbm5JcEc3emUrQ3h3UnRWM3FNMjF5T0hvNHBV?=
 =?utf-8?B?R1ZvMStiR0loZ21ZUzhDNHlTcm8rSmxWSlFZM3JDRHRMSWJoNkk5UDNFSEFN?=
 =?utf-8?B?em9tUmIweDBwUFJiczBKSkMraWVtTVY5d0c5S2puOFVRczBiZmFSZVZQVUFN?=
 =?utf-8?B?MTdDTGRXMjMwUGtTdTRwZ3JIcnFrbUR4QmJLbERxWXIvWjFITi94YXJCUldG?=
 =?utf-8?B?MGVqNk9zVzkwOEk5MGpmdEhQZVNSM3BIdzJUTXFRYXJTaFYvL2c2TnVSRFNh?=
 =?utf-8?B?SnpIY0ZpWHRzVWFjVEVpUmR3cmVPdEcrRCtlYjVFekJtaFJOUlRESzlWc1Fr?=
 =?utf-8?B?UTBLeno3YkxsdnJyMDZxdmJQZ2REMXVzUzU1bWpUTWFhTlZVTnF2ZTdiKzNL?=
 =?utf-8?B?UnpJTTVTa3VVUHpIZmp0azNFNnp6d1M0K1hDejJjWm9oTzJ0QjlDaEROZEp0?=
 =?utf-8?B?cmxMR0cwbXBsS1c4NVZkcUozVWRKc0c1a3ZiVENjRVBoNGZyKzhWdkRWbzhO?=
 =?utf-8?B?MklLVmZTUHBVaHVBMFQzN21kTGgvOTFSUldUdk5hRE9ndzg1Z3g5TjRlZm53?=
 =?utf-8?B?ZURtOVBPRTI1WnV4dTEyb0l2bE9XRjhKS1hUQktDSEJaVS8xMVJ3NTlzWTFu?=
 =?utf-8?B?T2F0MW9ZUTcvbGlIWmJMVXJjTXcxVVZnTTgvWmt6YmhpK1BSaVpublpULzBT?=
 =?utf-8?B?N01PdzBsQ2dyNWFaQ1J5SWowSDl3aW5Kc01KZjVtUTd0L2YyL0N0K2JBcXVI?=
 =?utf-8?B?aStYejNISW8rTEJkWUhKblk2emVETGxUTzBZUnpkTzNxSWh1T3FKd3ErRlJh?=
 =?utf-8?B?NSt5c2Z1YUg2bnZ1dnlFNHdEVThBZjFWeXJKVkRZV1ZaWXYySnpQN0tlRnhM?=
 =?utf-8?B?VHZjN3FFZ1FFbll5VGYwcjNXb1FyS1ZFb1hTTmgxT0xEZ2NCVUtrTks4bncz?=
 =?utf-8?B?cC90VEtNQWZucHdiUDAxVGI1VENNR09HbiswbHVVSWdaYVFqUTF2ZnFCVzJX?=
 =?utf-8?B?THFyUzZMS1loTFZTRVhjK1JQcWloRXlyUWRyOUUyNUFxRWFneU9CZWQxZ3pv?=
 =?utf-8?B?Q2JlMFZ4UWpwUEZLOGhpRXU5UkFlY1hQWno0K1JROFhDQmVscVNxTUZlRFNG?=
 =?utf-8?B?VjVWVU9NWXZadFJ1OUhNMjN0Z0tKTW1YOGYxSXNscGpwemJCM2tkb29HbFVa?=
 =?utf-8?B?RnNsTDdveDIrL3FSTG80RG1GYUJZRVJNTE5ZWjEwbHA0clFXRGtDa0NYMjds?=
 =?utf-8?B?bHg4cXU1VnhEM0lLN1VtdFBFbWRmdnllaEVKN2pKWUVKcHR5RG1xLytnWStE?=
 =?utf-8?B?MlAvbUt2NERSL2RSOGRJSmhpT0Vsdkl6bzYyUUVSSTAxMUZYbGgyR2c4Uks1?=
 =?utf-8?B?VGRlRGFETGFuL0todzJISUFTQmVVNHdFRFdGYzVTak5vQkM1dU4rMVkwbGNr?=
 =?utf-8?B?ODN1OTdrbWFlVDRsaWZJNFVWd1hwRTZ6Vms0RlV4QlJwZ0o1L1p2WXMrajRH?=
 =?utf-8?B?U1RqdW4xM1Jtc2pLdTk5UVFxY1NKVzBDYmpnaDVQRGJLRytsTWo5bGRvSTZI?=
 =?utf-8?B?YjBHcWpuS0dudzhaSE1xdjhDd21VdlVwbnZnQVY5ZXVId3paTW4vSjVzdUtl?=
 =?utf-8?B?aXFmYmRhb29GTjNGVFB2NEd6OGxJNk5ObFl0d1IyTnFoZ2lZU1NFbEJ6S1By?=
 =?utf-8?B?Zm1KTVZtRmlzL2h2cGZXUDlCUmpZVTZqNjhISGFDa2VOMGwzZTdPUzJROGhX?=
 =?utf-8?B?V0NtUFRUUDdJcjI1VVBHcWlaRTI3T2ZLSEVYcFlENEVQaWJzMisydlREWEZw?=
 =?utf-8?B?VFFrVGpCS1hZYmNSVTlPWXBXK3hJa1IweUEzVHVVM0JMcUpjcEVPY2h2NWFl?=
 =?utf-8?B?Wk92N09wK0V6N0dmc1c1VmhIeForcFZERTAyNTVTT3ArYVFwK2k0c3RjR1Yr?=
 =?utf-8?B?SlVoeTFZM05jalRmeUNiYytUMlJRZzRVZUNxZEo1UFBFUnJRNDRDMjNsZmQ0?=
 =?utf-8?B?Q2ROTGdtMjYyVGhCUGE1dzhVbzNaUXRsbm9MVmJXQkkzbVdDdDQvTVRwSGtM?=
 =?utf-8?B?ajBuNGVmMFUrK0hpYjFNU3pSK1dYcis4bTFROWRlNXBSR0hWNjhGSEQxVVNs?=
 =?utf-8?B?aXVJYi82WGhVOW92ZGNDTVpqTFZKckJRK0RyU0tNWGxCeC9BQk4zdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C856231B3850A74393AE134B8490EBDB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7183.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a5c289-1051-408d-5b1f-08deb1df7fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 17:37:41.0384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8IRcW5EQ9IsRqt+UepidFnO/SLLpEcebx58TBNb13J2syte5rvf6M4CopeHwD2LNeJtgv20k2gBELxksOkmgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103748_166990_90248A9A 
X-CRM114-Status: GOOD (  22.11  )
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

DQoNCj4gT24gTWF5IDE0LCAyMDI2LCBhdCAyOjMx4oCvQU0sIFN1ZGVlcCBIb2xsYSA8c3VkZWVw
LmhvbGxhQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQg
MDg6Mjg6MDBQTSAtMDcwMCwgSmFtaWUgTmd1eWVuIHdyb3RlOg0KPj4gX19mZmFfcGFydGl0aW9u
X2luZm9fZ2V0X3JlZ3MoKSB3YWxrcyB0aGUgcmVzcG9uc2Ugd2l0aCBhIGhhcmRjb2RlZA0KPj4g
MjQtYnl0ZSBzdHJpZGUgKHJlZ3MgKz0gMykgZXZlbiB0aG91Z2ggdGhlIFNQTUMgdGVsbHMgdXMg
dGhlIGFjdHVhbA0KPj4gcGVyLWRlc2NyaXB0b3Igc2l6ZSB2aWEgUEFSVElUSU9OX0lORk9fU1og
aW4geDJbNjM6NDhdLiBUaGUgc2l6ZSBpcw0KPj4gcmVhZCBpbnRvIGJ1Zl9zeiBhbmQgdGhlbiB0
aHJvd24gYXdheS4NCj4+IA0KPj4gVGhhdCB3b3JrcyB3aGlsZSBldmVyeSBTUE1DIHJldHVybnMg
dGhlIEZGLUEgdjEuMSBsYXlvdXQsIGJ1dCBpdCBmYWxscw0KPj4gYXBhcnQgYWdhaW5zdCBhIHYx
LjMgU1BNQyByZXR1cm5pbmcgdGhlIDQ4LWJ5dGUgZGVzY3JpcHRvci4gVGhlIGxvb3ANCj4+IHN0
cmlkZXMgb3ZlciBoYWxmIGEgZGVzY3JpcHRvciBhdCBhIHRpbWUgYW5kIGVuZHMgdXAgcGFyc2lu
ZyBldmVyeQ0KPj4gb3RoZXIgZW50cnkgZnJvbSBhIHNsaWNlIG9mIHR3byBhZGphY2VudCBvbmVz
Lg0KPj4gDQo+PiBUaGUgRkYtQSBzcGVjICh2MS4yLCBzZWN0aW9uIDE4LjUpIHNheXMgdGhhdCB0
aGUgcHJvZHVjZXIgc2hvdWxkDQo+PiByZXBvcnQgdGhlIGRlc2NyaXB0b3Igc2l6ZSwgYW5kIHRo
ZSBjb25zdW1lciBpcyBzdXBwb3NlZCB0byBzdHJpZGUgYnkNCj4+IHRoYXQgc2l6ZSBhbmQgaWdu
b3JlIGFueSB0cmFpbGluZyBmaWVsZHMgaXQgZG9lc24ndCB1bmRlcnN0YW5kLiBUaGUNCj4+IG5v
bi1SRUdTIHBhdGggKF9fZmZhX3BhcnRpdGlvbl9pbmZvX2dldCkgZG9lcyB0aGlzIGFscmVhZHks
IGFuZCB0aGUNCj4+IFJFR1MgcGF0aCBzaG91bGQgbWF0Y2guDQo+PiANCj4+IFVzZSBidWZfc3og
Zm9yIHRoZSBzdHJpZGUsIGFuZCBiYWlsIG91dCB3aXRoIC1FUFJPVE8gaWYgdGhlIFNQTUMNCj4+
IHJlcG9ydHMgc29tZXRoaW5nIHdlIGNhbid0IHNhZmVseSB3YWxrLg0KPj4gDQo+PiBGaXhlczog
N2JjMGY1ODljODFkICgiZmlybXdhcmU6IGFybV9mZmE6IEZpeCBiaWctZW5kaWFuIHN1cHBvcnQg
aW4gX19mZmFfcGFydGl0aW9uX2luZm9fcmVnc19nZXQoKSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW1pZSBOZ3V5ZW4gPGphbWllbkBudmlkaWEuY29tPg0KPj4gLS0tDQo+PiBkcml2ZXJzL2Zpcm13
YXJlL2FybV9mZmEvZHJpdmVyLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+PiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvYXJtX2ZmYS9kcml2ZXIuYyBiL2Ry
aXZlcnMvZmlybXdhcmUvYXJtX2ZmYS9kcml2ZXIuYw0KPj4gaW5kZXggYzcyZWU0NzU2NTg1Li5i
NzEyZThhMDNkYWIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2FybV9mZmEvZHJp
dmVyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvYXJtX2ZmYS9kcml2ZXIuYw0KPj4gQEAg
LTMyMSw2ICszMjEsMjIgQEAgX19mZmFfcGFydGl0aW9uX2luZm9fZ2V0KHUzMiB1dWlkMCwgdTMy
IHV1aWQxLCB1MzIgdXVpZDIsIHUzMiB1dWlkMywNCj4+ICNkZWZpbmUgUEFSVF9JTkZPX0lEKHgp
CQkoKHUxNikoRklFTERfR0VUKFBBUlRfSU5GT19JRF9NQVNLLCAoeCkpKSkNCj4+ICNkZWZpbmUg
UEFSVF9JTkZPX0VYRUNfQ1hUKHgpCSgodTE2KShGSUVMRF9HRVQoUEFSVF9JTkZPX0VYRUNfQ1hU
X01BU0ssICh4KSkpKQ0KPj4gI2RlZmluZSBQQVJUX0lORk9fUFJPUEVSVElFUyh4KQkoKHUzMiko
RklFTERfR0VUKFBBUlRfSU5GT19QUk9QU19NQVNLLCAoeCkpKSkNCj4+ICsNCj4+ICsvKg0KPj4g
KyAqIEZGLUEgdjEuMiBzZWN0aW9uIDEzLjkgVGFibGUgMTMuNDA6IHJlZ2lzdGVycyB4My4ueDE3
IGNhcnJ5IHRoZSBwYXJ0aXRpb24NCj4+ICsgKiBkZXNjcmlwdG9ycywgaS5lLiAxNSB1NjQgb2Yg
cGF5bG9hZCBwZXIgRkZBX1BBUlRJVElPTl9JTkZPX0dFVF9SRUdTIGNhbGwuDQo+PiArICovDQo+
PiArI2RlZmluZSBGRkFfUEFSVF9JTkZPX1JFR1NfUEFZTE9BRF9VNjQJMTUNCj4+ICsNCj4+ICsv
Kg0KPj4gKyAqIEZGLUEgdjEuMSBwYXJ0aXRpb24gaW5mb3JtYXRpb24gZGVzY3JpcHRvciAoRkYt
QSB2MS4yIHNlY3Rpb24gNi4yLjENCj4+ICsgKiBUYWJsZSA2LjEpOiBpZCAoMikgKyBleGVjX2N0
eHQgKDIpICsgcHJvcGVydGllcyAoNCkgKyBVVUlEICgxNikgPSAyNA0KPj4gKyAqIGJ5dGVzLiBU
aGlzIGlzIHRoZSBtaW5pbXVtIHNpemUgdGhlIFNQTUMgbXVzdCByZXBvcnQ7IHRoZSBrZXJuZWwg
cmVhZHMNCj4+ICsgKiBleGFjdGx5IHRoZXNlIGZpZWxkcyBhbmQgaWdub3JlcyBhbnkgdHJhaWxp
bmcgb25lcyBwZXIgdGhlIGZvcndhcmQtDQo+PiArICogY29tcGF0aWJpbGl0eSBydWxlcyBpbiBG
Ri1BIHYxLjIgc2VjdGlvbiAxOC41Lg0KPj4gKyAqLw0KPiANCj4gSSBjYW4ndCBzZWUgYW55IHN1
Y2ggZGV0YWlscyBpcyB0aGUgYWJvdmUgbWVudGlvbiB2ZXJzaW9uIGFuZCBzZWN0aW9uLg0KPiBD
YW4geW91IGNvbmZpcm0geW91IGFyZSBsb29raW5nIGF0IFsxXSA/DQoNClllcywgSSBhbSBsb29r
aW5nIGF0IFsxXS4gIFRoZSBzaXplIGZpZWxkIGFuZCB0aGUgcnVsZSBhcmUgaW4gdHdvDQpkaWZm
ZXJlbnQgcGxhY2VzOg0KDQogICAgICAtIFNlY3Rpb24gMTMuOSBUYWJsZSAxMy40MCwgcGFnZSAx
ODg6DQogICAgICAgICAgeDIgQml0c1s2Mzo0OF0gPSAiU2l6ZSBpbiBieXRlcyBvZiBlYWNoIHBh
cnRpdGlvbiBpbmZvcm1hdGlvbg0KICAgICAgICAgIGVudHJ5IGRlc2NyaXB0b3IuIg0KICAgICAg
ICAocmVhZCBpbnRvIGJ1Zl9zeiB0b2RheSBhbmQgZGlzY2FyZGVkKQ0KDQogICAgICAtIFNlY3Rp
b24gMTguNSBwYWdlIDI2NCBydWxlIDQ6DQogICAgICAgICAgIkEgY29uc3VtZXIgb2YgdGhpcyBk
YXRhIHN0cnVjdHVyZSB1c2VzIHRoZSBzaXplIGNvcnJlc3BvbmRpbmcNCiAgICAgICAgICAgdG8g
dGhlIEZyYW1ld29yayB2ZXJzaW9uIGl0IGltcGxlbWVudHMgdG8gY29uc3VtZSBvbmx5IGZpZWxk
cw0KICAgICAgICAgICBkZWZpbmVkIGluIGl0cyB2ZXJzaW9uLiBBZGRpdGlvbmFsIGZpZWxkcyBp
biB0aGUgcHJvZHVjZXIncw0KICAgICAgICAgICB2ZXJzaW9uIG9mIHRoaXMgZGF0YSBzdHJ1Y3R1
cmUgYXJlIHNhZmVseSBpZ25vcmVkIGVuYWJsaW5nDQogICAgICAgICAgIGZvcndhcmQgY29tcGF0
aWJpbGl0eS4iDQoNCiAgSWYgeW91IGFncmVlLCBJJ2xsIHJlYmFzZSBhZ2FpbnN0IGxpbnV4LW5l
eHQgYW5kIHNlbmQgYSB2Mi4NCg0KICBbMV06IGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9j
dW1lbnRhdGlvbi9kZW4wMDc3L2oNCg0KPiAtLSANCj4gUmVnYXJkcywNCj4gU3VkZWVwDQo+IA0K
PiBbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwNzcvag0K
DQo=

