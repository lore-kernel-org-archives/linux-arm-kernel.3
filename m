Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C784C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eL4bs8CVlaoVbG2zWUwDRX8wCXxRTxkBkXW/7I5O8Ls=; b=jenqWrds/TVQjFxA7iVb4fmpiE
	rpiieslGuypO3YETRR+7iggotvcptrHPIfWSyfmnyBmwoCuYOXrRE4u51bLubu2NLQ3K31fHQhKCN
	7rTWSohirMfa1wGTvJb1CcZFORXgRVYZfDVB0N+ZOMQN+z73Y0+OzeAH8HNPXqX58cwkvFRtcYAbl
	det3n23ExccXsAbxpT5sMX6TA+TTxkF1s7kJ5bC4fzE8RDkgHOnwG4xIronPpXtIX7z5i3M6aBJlw
	XyhsuoW9X0S4kDvwJn8g20KKnu6dGw2OF/OYHgm65zCxXQ5lVHKnbgxibVn6ytfK8zk+oGHwraToz
	vPeK82HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUoa-000000073C1-2TOM;
	Tue, 14 Jan 2025 00:29:52 +0000
Received: from mail-westus2azlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c002::] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUnL-0000000736l-06th
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 00:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSvq5CF8bgLYxZp/XODGRo1Aq7kQbrV1OSx/3/Vw0cS6gP7sfYfuW3gR5pmR/QGc+Q4rz04INuCWsSREOnlamSO+sRw3sJCwZ3qOxShEUYm06J99q9Sc5HJ8HRfSrvG7Xz6Oju17tVEc5VMJCaLNKevqLbSqS8ZWSbyAHBr60cCfZQKwUSLEPOTCcJXjpOWb53jKiTFXpD3MJ++ixoor1L0EX286Ii4XJBYgaYWcZfsP0r/t4285vPL+/FH8+eqdlW++mw19+K4veLZ6wGXyuqC4/UG1WFxKj9z9CiyvNVhhpddspHrVbGxGfnUXOccD6IHX+zT/PX1l3SeR5j/Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL4bs8CVlaoVbG2zWUwDRX8wCXxRTxkBkXW/7I5O8Ls=;
 b=xITDbhk7Nab7Rmb7+r23X1GJVVnDyOkEq9VKb6eyk9cU2XgrdcslNLoqjdbbC6Kakxb3cl2zKvDmArZv+52OcRAr472ebqGhaFuYbs1lBtquV5qNgOFlUvPWX+KLl7J2c2G9ZVB8IYqjd0ZY6knDB+6sqcWWQQ6YA8y0qhX/pwMaXnx12Sr8jZgrlqDBhXUWNRrR0aVMzMCB5iWveXElT+OK/zWA5X2r072SVjbzXc4vzm727LdwO4PXW1ZpRS3dOMffpCVvH5SlG1Lg1nLNchB8+hiwLye4fqw03KT8S9P2hGrZ6MhwhmgnHS9S+k6Utq6vXiTAIFzg6DiG701ESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL4bs8CVlaoVbG2zWUwDRX8wCXxRTxkBkXW/7I5O8Ls=;
 b=KDzTfh1SIBHQUp6z0yB9tFYva3pR22AyOuHr2G2ncaS0jmbUno4c6bWQHDwd9rNDsLkDCy1pdrVrIJ4dT1/p/rn5eEFgCvh+eL/Aefa34t72zU8KAj64Z7JBeLUETvvaSskSQWNWWWXdawowWZqg/PHv+1Xy2hdSWu9Kot6UjdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 PH0PR01MB7995.prod.exchangelabs.com (2603:10b6:510:28c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11; Tue, 14 Jan 2025 00:28:22 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%7]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 00:28:22 +0000
Date: Mon, 13 Jan 2025 16:28:16 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: catu: Fix number of pages while using 64k
 pages
In-Reply-To: <b5ee243c-5122-4476-8978-0454b54283d8@arm.com>
Message-ID: <3e8ea68a-b456-14df-eac1-e2932b3dbab0@os.amperecomputing.com>
References: <20250109215348.5483-1-ilkka@os.amperecomputing.com> <7fa2c7c2-0bbf-4d45-bc90-71c4a4a82c0c@arm.com> <6d6128d4-778f-fc9c-651b-53de199d023@os.amperecomputing.com> <b5ee243c-5122-4476-8978-0454b54283d8@arm.com>
Content-Type: multipart/mixed; boundary="1372433909-192168144-1736814501=:2397"
X-ClientProxiedBy: SA0PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:d3::29) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|PH0PR01MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2d5725-6804-43c6-88aa-08dd343259f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MExlOGxGK0pDTzluTnVhOHdycWNIMzZ0RVZ0ZFNRME8vczNFaDlQL2p5aXpJ?=
 =?utf-8?B?OHZnRVlXMEhwdGV6S0hWYWRtUjdXdEgwbUtEQThMR0ZCSGxDbHF5T1pCcW1k?=
 =?utf-8?B?Q2UxTmhQQ1NGVUxKK1FGTmdENEg5ZnN3M0hTN3NHTjhsVGhnaGY3U2JkK1Na?=
 =?utf-8?B?NE4wWUtYT3d4SnhCUlY0L2VMUDJtSjNsSEFYZ1pOS1ljbDdwSE0vSUZiZHZZ?=
 =?utf-8?B?M05PYnBrRVZXcmJDZ1FlV1pTTnllNUp4QVI2Slk5U2xxYmF2bGQzS2dZSmhi?=
 =?utf-8?B?ME4zRGI0UDJGVm55WGs3Y0JlZVMvMVptM0NoVG9PU3FVYnNvWm5sQ3M2WlZ2?=
 =?utf-8?B?WDNhOFlZeDFDd3RpWUdKRHNTOGlDcHVQKzFrSExqaUplODl0TEdEc3Jab2px?=
 =?utf-8?B?VzRMdUdLN2lzR3JITHFoUTZibkZiRlBFR2NaNDJRSTNvSXdTZEliQ1hFdklh?=
 =?utf-8?B?MUJscHhBYUZ5bXBXYmVFT3NZbzhmU3BkTkM1Vm1HcmZHRytmUm9lQWlpL01R?=
 =?utf-8?B?MjAxM3ZqN1A0dE9wVjhOaEpFSUUrZEFoNzhUa2J3UnFGcjJvRmZ4M05ZUERo?=
 =?utf-8?B?WkE2NllZYjFMMzFnb2luVVFwTllFRHMvdkxSL1lNWnIvNE55MjgzaGVvZW9j?=
 =?utf-8?B?ZFZ3cHJPS0dOVXJHSVdXT2x3TkQybGlCL09DSWUzNGZhdEpHM1hUS25lcE1z?=
 =?utf-8?B?V1dwYW42ZzdCZTBRNEd2KzFLZ1R1NjFLVHlybThwMnEzUU5MUlppbTNCTXEw?=
 =?utf-8?B?MDdUL3hrVkFUUlo2V0J6aGdoZ0V5RzMxUXNvUkUxUjgzZkRUb202SUNubXlU?=
 =?utf-8?B?eTlJSWlERGVUcjlLb0tPN1E3OTk2aEdHMld6bzE2Qm5NanZhVFFjSW8yYkl5?=
 =?utf-8?B?UStYZDhUbzFCY1VFRE5jWTMyZlpmaWczRkNnaDJOMDlwdzlQZnk3OWE1ZDlH?=
 =?utf-8?B?M3F0b0xjZnM4L3puUDZMVGxNRFVIUW1Bem1FS0xubHB2U3hoem1tMUhJMk9j?=
 =?utf-8?B?VGV0YTl5L2d1blJFN1ZIazQ1czUxbWI3Wis2M0lPVjY2djFvSDJBQnpMOVFt?=
 =?utf-8?B?Yy9IZElNaE5iK093QW5Xd25oK3MrVHpDZ2t4blI2Sk9ENlg4RWVLWGh5K0pv?=
 =?utf-8?B?T1RialQzQ1doY3BPbWcvUzlSUDdmUzEyckxyUWVWR2tSOWN3WTlyQjJibTFL?=
 =?utf-8?B?TkgrdFpzSTFhM1hrNjhiaWt4c0c4SHNVN2FMVjlyeHZ0Rnh6d0JENjhVQkQ4?=
 =?utf-8?B?eFdXUzNnMkxSSEkvYjlPdUxTdTduWUc3RW12cGRjYlNERi9IZmd6N2RWU1c5?=
 =?utf-8?B?eFcvK0EzaVZCSGI0enkzdk1idi92TklPd1ArRkcvd0VlTkJ4dDU1WkdOM09H?=
 =?utf-8?B?Q1VEYmQ3MUhzUVNjRjVtSzBzZk9ZSUU0MWthNU5iRGZoVXNaVlN4cm4yRndz?=
 =?utf-8?B?RnZYL1IxdUJaUWxhdWo1My9pSUJMVE5SaTI5bzNTOEs2OTBuc3ZrYUx5Mm5x?=
 =?utf-8?B?Vm9rdDlMeVV0TG9mMm5VeXJsOGdoaW83ZHFJUEJwZURXUGdlSnR0aUVOWmE4?=
 =?utf-8?B?NjUrbURvUmZIRUJZOTA4Q29NTVNQTGtBa2Y2NkxkVmFMV0ZKYk02cHc4Y2h1?=
 =?utf-8?B?bnordEJQMlRQaGlreVB0bDNWY1hLL2ZOWHZpZFJOd2Z6SDF3dnZ4UXQ5dFdX?=
 =?utf-8?B?MjlNVEsxeXdqK2lzSExjS1JwV3NtMHR0WnI3WGE2cWtlVXVZNlRmVS9PMXBC?=
 =?utf-8?B?bFNBRDJLb1grYzFLalQxZFZKTUpaOWcxZ3RxZzhVK1VJZkt4Nkc0YUg4ZzVn?=
 =?utf-8?B?a0g2bWR4R2VEbmRDVmN2M3pEeFdKTWlab0hIdkN2YWJjeklKYWJUMHUwbFZL?=
 =?utf-8?B?SlRwcEFrbktQV3dzeDZnREpNRjI1NGg3Y2FHUnhsZVU5YWFsb1VQYXIrM1FD?=
 =?utf-8?Q?HrwdCYOp9G4YcocaHYSoAxddI1HB14mu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhzVTYrQlh1TW5wN2ptUENONGRna3ZPV2hWZTA5L0tmZVpkbmNnZFZvNThN?=
 =?utf-8?B?TU1HMjJuYmVPaVBwenZJdVlXckRaNmIraW9VaitwaXJ6cks2SEFFODVHeHEy?=
 =?utf-8?B?UE90Mk9qK0ZjY1hKSEh2YTljMU5OTVZoVG5YckFFK3dJNld4bjhsNkVvcXRE?=
 =?utf-8?B?UGE1ZXZxeFFjdmlKdDZpalg5RzBKZnJXVDI3Nmphb0lKeG1WS2xzQ1dHUE1H?=
 =?utf-8?B?cGhDekw2VU9YYkVjY1hMWXl5bGFkZW56Ky9LaUtma0YwOWt2L0MxRGFxWWxu?=
 =?utf-8?B?eWN4R000Qit4aTcyWWNsQXQwUjRoblJMNWlFT0MySkJUZmlhZHE3eFNDSjJB?=
 =?utf-8?B?cndXcDFNamUza0dSWkhOcGFLclNhOVlpOS9ZNDVobEk3aGRFOGw5K2dDMkl3?=
 =?utf-8?B?ZUdCbElIQjcxZkI1K2JlcmUzQ0hiWkZZZGN2bDB0V3ZtUDY2THRWMzh5dzlK?=
 =?utf-8?B?NWo4TnhWQWZ1YXBLdWNWNEpQVEUvMG9LbXZkWVptRWJnRGFuaHFwV0hxZzZT?=
 =?utf-8?B?SnliRDdIOHNYc3V3WS9IQXRLOTZvWndEd2xUNlFXZHZrUFFQaWxZUjhNRDVh?=
 =?utf-8?B?cG5RbE9SemY2MkVCVnRqRCs1R01Kakl2NDhObTNmUXI0YTdZTUJxcXc5VkdH?=
 =?utf-8?B?WlpyYU9vZDZRNnliWGdFZGtLNk1mRnc5bXY5Y1N2RzcySkpyOERJSFBlcWtr?=
 =?utf-8?B?OG15dkppbERyU09kZk1QYlB6dGdxb3EyVVVMVjY3QzRSM0lwZ2RJRU9sMjB5?=
 =?utf-8?B?cjFDT3duMmozU0syc1djc0RuS0VpYzNOTTJCTjdwZm1RSWlVVzBhQlBoSnVS?=
 =?utf-8?B?YktjR1htUWJqY2h5T0lUWDBQcDRVb3RQenJqaEdDTHAwb0w4T3htQUFMTHRG?=
 =?utf-8?B?OG9mei9sZ0RSWmsrK1IwUlQ4d0N6bEw3STdram45d0Mzbld0WnFMMGowVnNv?=
 =?utf-8?B?RnhKMEVGa3RXSnpzSkw5SmlWNEwrRWVJeTFZWVg0d2dUTzVTRE4yY1FVdjNk?=
 =?utf-8?B?aDZ5OW5EbFlCV1ZkdmJUUTV3UmtQNEpYa1FhRjJCeFk5bkh3M29FNXpMejYw?=
 =?utf-8?B?eFJKSmtaTlVwa1h6VThuSVZpOS9TYUE2NDJySlJpZGw2YjhGbElRZEhWNTVW?=
 =?utf-8?B?aW96TWlHNXlUWlNzcXlJVVdYQmxwenpWRk9sMk4veEZFQlFiWm5kc1hZV2kv?=
 =?utf-8?B?OGFzZU04N0tjTXpINi9XOG10T1dQaXRHNjFUc1BvRU12VkpUdFp4U3d6ME85?=
 =?utf-8?B?alJKTmxjazdDbDFnNTd2UHppeU1Qd1hwYW5tVjhXdmFxVUtnWW9TdXc5Vlg5?=
 =?utf-8?B?bEhORU95ZzA5STd0eVJTM3h1clB3a1BoRktBRlNvMnB3a1pMUmpPRmNxOTQy?=
 =?utf-8?B?YUJLTjlmY1hlcXdBOVJ2aFQvWDV0SXlVaENTYzU0NkNBejNZdlprbUNTVDdl?=
 =?utf-8?B?WVlnZ2t6enVEU09YbTN4QnQyc2FrUGZKelFOUEVPSWkyQW5FY1k3Y2dDMUx5?=
 =?utf-8?B?MDg3d1dZcHJvUUF2bC9SSmQ4K0lGRlJqazlERnJVYVQ0cGlUNUs4M2k1dUli?=
 =?utf-8?B?NnNUVlBlTDhlSDZkQjJJNXBLN21MWklXdGZkQmxiU1FWZkJzelF1dE9sM3JK?=
 =?utf-8?B?S3BaVTU0cU5VanNaS0lrWXg0UFZIQml0L05qM3NIcFVCSDY4ZzljYklUakNE?=
 =?utf-8?B?bkF1dkg4S2N2Q2ZzbVE5OFc3eWMxWE45SW9ubW9aWHVraFMvV1dkMjV5Ymk1?=
 =?utf-8?B?RlhPbDBsWitEeWZTN2R0SHVqMTU3bE81dkNNcEJiblloNDJvUjBnWGhRUnMx?=
 =?utf-8?B?bXQrVGVCQ080VjNnVXJlejBCa0x1akp1TzJWNUF5d1N0NXpXQTdsNFZzQ2tQ?=
 =?utf-8?B?N2RVMk1ndDZPTG1qeXhTenE5Rzl2eGhmTWNCeFRzek5QcCt3QWQrV3k2b0o1?=
 =?utf-8?B?M0V4clpWNHhINXFoQmxybmpyOWhkb2x5TnU3M3JRbWV0dWt6YUtnWFM4YnRF?=
 =?utf-8?B?OUhHUkM2VGRmRTVLRzI2ME5JdDdYY01vTmVpVzJ3SGM2NDNodEpKdU1JUUxD?=
 =?utf-8?B?SWhHNGdXaytGdHdNdUxtKzM4MnNmdEZ3L1QvVXV6Y0dESnFrMDRDVXlrNUpa?=
 =?utf-8?B?bmxzQnBVeTRVblU2dlZUOVpRRnZrS3A5cHRBMGlQWlpLRVdFMkdSMHd4bUtP?=
 =?utf-8?Q?kMzDHa4wtSNGVQ3FYfHLItw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2d5725-6804-43c6-88aa-08dd343259f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 00:28:22.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eoph/u7vvUof2H+uTYF1nkVsh8POSErlAPVW/CpN1/cS3x9mhuLhk1DUPsc4K+OwGF+qgKkUyIYjO8DnhUG9eWeRAOTmFgljHr/MwNacqIPCNrsmz4yCeRxLFxJrWDjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_162835_078877_1F641A48 
X-CRM114-Status: GOOD (  14.18  )
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

--1372433909-192168144-1736814501=:2397
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Mon, 13 Jan 2025, Suzuki K Poulose wrote:
> On 10/01/2025 21:32, Ilkka Koskinen wrote:
>> 
>> Hi Suzuko,
>> 
>> On Fri, 10 Jan 2025, Suzuki K Poulose wrote:
>>> On 09/01/2025 21:53, Ilkka Koskinen wrote:
>>>> Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
>>>> This happens due to a bug in calculating the number of table pages, which
>>>> returns zero. Fix the issue by rounding up.
>>>> 
>>>> $ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k 
>>>> --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
>>>> failed to mmap with 12 (Cannot allocate memory)
>>>> 
>>> 
>>> Needs a Fixes tag.
>>> 
>>> Fixes : 8ed536b1e283 ("coresight: catu: Add support for scatter gather 
>>> tables")
>> 
>> That's a good point
>> 
>>> 
>>>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-catu.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/ 
>>>> hwtracing/coresight/coresight-catu.c
>>>> index 275cc0d9f505..3378bb77e6b4 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>>>> @@ -269,7 +269,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
>>>>        * Each table can address upto 1MB and we can have
>>>>        * CATU_PAGES_PER_SYSPAGE tables in a system page.
>>>>        */
>>>> -    nr_tpages = DIV_ROUND_UP(size, SZ_1M) / CATU_PAGES_PER_SYSPAGE;
>>>> +    nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
>>>>       catu_table = tmc_alloc_sg_table(catu_dev, node, nr_tpages,
>>>>                       size >> PAGE_SHIFT, pages);
>>>>       if (IS_ERR(catu_table))
>>> 
>>> Looks good to me, I will queue this later for v6.15.
>>> 
>>> Suzuki
>> 
>> Sounds great. Just to confirm, are you ok to add the fixes line or would 
>> you prefer me to submit v2 with it?
>
> No, not required. I have picked this up for v6.15, and will push it out
> once v6.14-rc is out.

Perfect, thanks!

--Ilkka

--1372433909-192168144-1736814501=:2397--

