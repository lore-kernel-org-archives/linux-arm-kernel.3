Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947660A6F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ecz5NaaO;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YRPtBaUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hnLdOwUr1MZindPE8obBcVkpMGOh0NTVkiJevwg5dfM=; b=ecz5NaaOPwFZFK
	GBiqZaih0lYgnnMKAJZlXmne2Gj/5CfLEMdQxTFmzm97S35Mlc+rrIxRuHT1KW5ss9GYD9JKF15y4
	AxA58sF3Qa4oPyIHURvaGXgydV3t23cN2/fLptS4QH5tUXOfCUMo2BDxKeiXnI51/IA8B2seOVGqr
	yDIokjP3KtMVkYTg2OqZDdJEfwe0YV0UQt4sZ+vWFZPdZAPbQ8t0d4EiBa9PK49jZYn4unfqjueD9
	9CepaBFoQO3WbPrvQdBiSy3BNalPV89OwDjSfYD9mLz+zjjpOdV8tF6NJjIXcmEYnIFr3L7r0JIG+
	/+nhzlu0Dchr27sfGujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8zp-00000007pKa-3BYi;
	Wed, 28 Oct 2026 19:07:37 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8zm-00000007pIs-3Uki
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0On+GuOhm0yo3jxtXlNHgloW2JFbaPO6yvkQXEIBpVwTp66rkOaYvRQCDX2Gu1kFR6crdNKhNZgkbiXmYGs0sfTUtCEzsMKKreqhI+fDgEwkhpqAevdmjDPxdE0iZVJUvcBzPZXIdLNQEv0gLZmLbX3Zw0p9Vb6fmijxWTlLZiiMef2UwDdg5JYuNLQtKlVktpWshkeElS2Wz/rC+b+a12zi3dLUIs+wcJziz9XffhJcUJNb6lsjFinkyHgUGXyMs1UIfEAl0agyqIpUvrRxC6SIbXUz2wvMBA9BG4+JrDrkhbv7E5XNepO03RdDFQrZmXrsMxR4Rl70dcOydpuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnLdOwUr1MZindPE8obBcVkpMGOh0NTVkiJevwg5dfM=;
 b=VD19ne0bfMcgp3FUODfe/eaEOKEwvCxZwavK+n8XGbS8SvWU1KqisE2iWZLjnn0TSxT5rR3L3yRJ+C/Vet1gD8zob4pemWbKgXegjycXWvkIqL/P+WsmBZJu8tKd0liVihrsFnpYEFbVT8Mg0tIcgDdsXmwtC7mHcCd1D6dC3nPParlul4lDCk86+aGiW84IMMlswCbxnZSS9N2P2la30p3mOnJGV4oEMKa84mRHuVa4rmz9HfDMoe4I3VU4aTaXId0tAbjZnTTE6OPAkTyw4YDfhPak/7lwJK8z3c+08jJNa6SsmJAvvZv0BxyhpU3KB6PKHzQ0Y+zU3Yu2DUWQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnLdOwUr1MZindPE8obBcVkpMGOh0NTVkiJevwg5dfM=;
 b=YRPtBaUQ9h3IWmdxsdofNIcEE87q/F7QxH1SWIPBk4931kfQiqBq9/15V9l9OeBXBj3fuzF8sHNMHdHmwLcZJyx8pcZGvQArnYOexx0GgsuEmQOWZUV9PWizCL1veCP7QeDiLWmvSR1G2qmfnOEnLq4q7O46SQhf9D5yM/C2QVXz6236Hco0WkW1hHj6vv1saMrr7yLaYZCizDlKOKIdvgY8fV4EfhS7LvjuffYCCUKan6UKmjPaB9E3WZbBuT23S/tK1pq4POgoN5jSHoIVPyy2kaLrSMJkdqe7ZDLYMTRYZ1Tb3kgZVAY0qiz86S5t+2OuOHtFupnB1yi28FtCmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CY3PR12MB9629.namprd12.prod.outlook.com
 (2603:10b6:930:101::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 19:07:24 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 19:07:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 15/16] iommufd: Allow vIOMMUs without a parent HWPT
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>, 
 Alexey Kardashevskiy <aik@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
 Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, 
 Samuel Ortiz <sameo@rivosinc.com>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Steven Price <steven.price@arm.com>, 
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-tegra@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org
In-Reply-To: <20261008055955.4014342-16-aneesh.kumar@kernel.org>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-16-aneesh.kumar@kernel.org>
Date: Wed, 28 Oct 2026 16:07:21 -0300
Message-Id: <179321444126.2412245.13554890009456678773.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT3PR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::17) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d28827-2206-46c3-2279-08df3526b2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|22082099003|6133799003|18002099003|261028144727099003|261026140227099003|56012099006|261022075727099003|4143699003|11063799006|10067099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: rE8qIBCSxVclU9TyZS3cgbYtJdmf8YEdiy+3g0xqdqNSvq5zme2cV6Q9FXXs2uoO0taql9oKyr/51RFXIRsELuCrjYjzukAHnbNEtkLtipNkarpnFrrZRN2qBgGo7VmLjP56HSxwbwq8URy6WUdVcyi0Gk227tWDf0Y1kbLBsMx8isQYQYSKu2t2IycMXJLciI75H0/0LzDj9vmnkwSbUNAnpla032Z2BB2fD08PZ8yQP0CJKXsEF2MsK7H6o+ErY6XAYqJMj9TwWw4zUcSYgsOmsrqaGNS0Y8RiKriZVElqUbQo2hVia1l6loVrdxHKdEWJSgHFe7KcvXtCb+RYPnqYilbuw1DXjhj3IyKZ24LNe/knhVnZ+Qp+9uPGioCvkAYJBsTXZwEOxnQ1nw7sEQn6wLCLCPIXnXT8tZ2ihP10skDSmb1cqGoe4ZzEjYRokTyNEFQaQ9h5y5S/57BsXOKPf/RCwudYmBE39VyHm33BrUlnOJ6f+z6Mcr7hx0fi9MeUGZavY9HoIA4AAM0u1V4lzDq7R+dkQKQDbJmMg8T61AoxFObiWz66TQwJYDsQgq+a0K5diXZFBtXVCGWrMi0Vn8jXJQiFeOBjbicm+wlqAwYfmh3SmhNOdrnqBc/xP5VNRwVrG/6T/LnCtfzdjtkcOmw5ylB3AATnz5cTxSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(22082099003)(6133799003)(18002099003)(261028144727099003)(261026140227099003)(56012099006)(261022075727099003)(4143699003)(11063799006)(10067099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFZLck5TZm91SHlnT3FWOTFFU2pJUjZReWJYM2VmSU82ZGdwTkdRMjFvWjFa?=
 =?utf-8?B?NzdMNkdNajRVdmtrVi84cC9vN3lPbHFLaTYrNDh1bngxanNoRVhZMmdYb0Jp?=
 =?utf-8?B?U09ONnFXMWhqM1h0cStWcEdVTnF5RmdOcm9XZ3VhRlZlalF6ZkhqMy9yWmc3?=
 =?utf-8?B?dVpQZGxNN0twMWt0WkZ6di9vQmdBWis4aWpnYUwrNkFaSGg3bmxSdlcrckxy?=
 =?utf-8?B?emFUeWxUdGdXTG43dElhSnQ1b3FLNnRFd1NqTlZnT25YNk4xb0lOR05ueDF4?=
 =?utf-8?B?Q1NJOUZ5cHowZWlrZW92cXk4NzF3MU5kV2JvUWV2UStYeXZDNHpjU1FUS1pk?=
 =?utf-8?B?ajFUQmVtQnRuZE1XN3Jub080cHIvazVJSWtXTTlsT29mS1hvSnVybzdzb210?=
 =?utf-8?B?MVpsbTVZRlNJcVhweFJGb2k1d0NUeVlWVER0NjBBZmpXSy8vMlJhVzFwVzY2?=
 =?utf-8?B?Q1BjWkowMC9rZ1BTTmNrYi9lY2k1RE9hR1VJN0V4QlZqd0Y0WjB4UWt2THYv?=
 =?utf-8?B?Uko1U2d5VkxjMDROQ05HRnhkd214QWY2Z3V1bnVoTndQWWJmSTE0UVlScFow?=
 =?utf-8?B?YnRZNHRwdmplODRqM1FxVFJaSmJIWVV4czRJTUZ1d3VCbGdTR0hPcW0rYXoy?=
 =?utf-8?B?OGl5UHJBUTJWMy9CRlliWnNmZG5jZmhYcHhFdUs1Zis1Z3JWNmM5OGl4aURo?=
 =?utf-8?B?bmNpazdUTlZyV3ZqM0FBSTBLWVdQWnlvK3ZpMlErVEdJTEhrQVlSRnRMR1Rm?=
 =?utf-8?B?VUpLQVVPTzFGd0VsQ3hFSWtPSmVpamRFbWo0UXJGakJuTUdnK3VqSkFuSlFT?=
 =?utf-8?B?N1kzMXVUeEhmdWxqdG1UQzQ4V0x2OG9pWTBvTG03MEpubFFwMnJueXJpNXM5?=
 =?utf-8?B?TGY3Yno0b2hJU0N0UDdab0hEVk9kaHQ2Zm9FTjVtbFlNTTFydHk3ckJHODUx?=
 =?utf-8?B?MTNobXY0VVRzM3I2WmFia3U4Y1BVUTI0MjE2cmw0bnJQQ3JpZXpQUWxacS9D?=
 =?utf-8?B?VTd5SUhTSXQ4UUxNVnJLWUxFdGpyN2Q1bnJ6a09UdkZaSGtJU0FGVlUyMGF1?=
 =?utf-8?B?OUFHbXZUaWRXNzhiS3hoanpEcUo5Y2VLbytVQjErd21BNWlnTnEvU2c4ekM0?=
 =?utf-8?B?c2JyV2NaQ3diS25naW9FbHkvNzkwbHpaZDRiQ0l1UVdReHB4WHpuRHdSc0Ex?=
 =?utf-8?B?TVRsMFo4TFRXYXFDZytyWFRnTTNpTHU3ekkraVZyc2FaS096cHVoeVAzTXo0?=
 =?utf-8?B?aXFuTFYxWDhnMThPL0hxU1oxR3NGMXh2SGVlWHd2SVN0MVRleGgvRkcvdWxQ?=
 =?utf-8?B?SUJTaldCZEE2Qm9rNHFSLytjalJLV2x4OUNhQjF2S2lzMzY1TmZGb3pzR1lz?=
 =?utf-8?B?QzRNSTNHK1B5QUMxVTVmM2lXd0FCSjNRWHZlZGFaVHllRW13b2J3WEFlbXky?=
 =?utf-8?B?MnFuYkFGWnpIV0dXK2M5UEt6YjRQeFNWMWh3ZmZmTlJETU9CODhVcDV3aStn?=
 =?utf-8?B?azQrNkhXRTRXb2oySTNsNDh5aXBzMlJOSjRjZ0lQZXB1UjVJVlFsei9Fd2pQ?=
 =?utf-8?B?SUl3Qmo3bFV2L2l3SmQ4NnJYWUJiNjZONU5JTFB5L0RrY2xoQ2dGUndnQVYz?=
 =?utf-8?B?V3ljNHVjZUlBSXpnaFdGWitKejdSZDB0WU0wR2tXUHE3RVRwaVprQXg1ekNk?=
 =?utf-8?B?TDZ3eWluaUpRRWk0Tk43OWxrblo4RXdrTElmZUtIU1lOSWx0MnhwNjE3NkVW?=
 =?utf-8?B?aGpsWk44MXgwK2FhQ0dkZTdsS0FsZXpGVTZIK1U0WElVK1N3N2JZNzF6VHQw?=
 =?utf-8?B?dU16Q2xKL200MjhVSFY4MFUxNzFrMWVZOGdxdE5oWWdIUitaejFFdWxVYzE0?=
 =?utf-8?B?ZE1kRjJ5enM0KzRCTzg1bDZWZHNDNE1rN2F6WjhNOVg4Zk1MM2paVTVzUThC?=
 =?utf-8?B?RE1wQ0Y2OTVjNjV5WCtFZklxeTExOEhIeWxQYkJ0ZVYydWpBWmpaL2lTTno0?=
 =?utf-8?B?TG1FYm5rY0s2d2diTG9tNkwxN3ZVTFRrNHhGMHYwcm9zOXliK21IL0ptWXNj?=
 =?utf-8?B?bFV6d1FlWjNFUGZLVGNUSnRWRlpQMFlpSVZ1cDdqSzZQczZuRU9xNGcwcVVk?=
 =?utf-8?B?MDJwZWxuTzZNbldmd2N3cGtxN21LcFlZbkJFWmFQSU9ydjM0aVZ3QloyY0oz?=
 =?utf-8?B?dE0yNG1WeTRWKy81cXJaN1d4M2JtUUlwcEk0MTk4K2I1bmdGLzlJQk96Z1M5?=
 =?utf-8?B?SUl4VmJMK3dkWXJ5SGcxWTRuNGEyK1haMElKTnJUSmErTXRqc1hmeGREbUpF?=
 =?utf-8?Q?8s/sEMxez4UrfPmOBS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d28827-2206-46c3-2279-08df3526b2c6
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 19:07:23.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFO2R2VAf0PYia6BWGt/9RoAtqDAUAbAhiSUtC5IhCfdPFhd56Ssv8hcuTlCnLK6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120734_879209_633FDC19 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> the selected vIOMMU implementation has no use for one. This would force
> implementations such as the following Arm Realm vIOMMU to create an
> unused parent.
> 
> Add IOMMUFD_VIOMMU_NO_HWPT so an implementation can opt out. Require
> hwpt_id to be zero in that case and pass a NULL parent domain to its
> initialization callback. Keep the existing parent validation and
> reference handling for implementations that require a HWPT.
> 
> Reject nested domain and hardware queue allocation for a vIOMMU without
> a parent, and document the two allocation modes in the UAPI.
> 
> Cc: jgg@ziepe.ca
> Cc: kevin.tian@intel.com
> Cc: corbet@lwn.net
> Cc: skhan@linuxfoundation.org
> Cc: rdunlap@infradead.org
> Cc: joro@8bytes.org
> Cc: will@kernel.org
> Cc: robin.murphy@arm.com
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  Documentation/userspace-api/iommufd.rst | 44 +++++++++----------
>  drivers/iommu/iommufd/hw_pagetable.c    | 14 +++++--
>  drivers/iommu/iommufd/viommu.c          | 56 +++++++++++++++----------
>  include/linux/iommufd.h                 | 13 ++++--
>  include/uapi/linux/iommufd.h            |  3 +-
>  5 files changed, 77 insertions(+), 53 deletions(-)
>

I should check it carefully but this looks reasonable

-- 
Jason

