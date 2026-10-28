Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E293606AB38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1i6RE9o;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IDPEBLeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FqBQkBZiJc3aZ5EVHjBRh5eH41HNN+IF0XQW9DpJTrI=; b=C1i6RE9o17ElJD
	DhheK1BxjC4XwzEA11xsUwsuxdTedIwMOy7/7UQNW6J3mZCI/bEpAsS6yIhU8mLHmWEQxVTrWyB8d
	8B3ilnr3O1FTf5GyOf67rb6etNOpFgOxunUH8oarYq+nqahxMUV6ZAkD3/L7nJg7tCdeKBCruUzBM
	aAWmHW9d8/tC1Vc6KoFOfeJIoOJGl3xCkuNIIbDvxQnu1V5A7I5M7ryV59nT+rAj/Pv0RPpVfUQPg
	TwPZaTOqBJ6owpv/SRetz69aGsCWrr4t5pwutEJ43V6ax3tq6goKXo1cWIbzLAzgKuhN+5NNC1sX0
	BlWlyQGxJmuEvvgZKjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8zp-00000007pKf-3iD0;
	Wed, 28 Oct 2026 19:07:37 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8zn-00000007pIv-1uTY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhorE+zAQN/HbaEijQ5sYY3F1WcY0ft3hGrW+/UUfaEDYEVLLwIZnH7gu2SsmVCN/DG3+bnXpcWRC9mY7ZKfS1i70IrXLzG2vi827OTailoPLPpp9thGFuCUx8rVSOhHrcpFFEiLhpwIvQ1hQSaKvjNoAy7ouLhnaizsfvKvz2M8nR5tVHt8LZ6PibXfx8GFHZyBK7iflRZ0D2D7oZaZgN82mj1j16JO9oDCPC3u/6MAdVDGjt3aTibXhqH/H6h1GBUVAIv+9eUuIR0l3w/6gChmFvkZmYps0penrjjhNzF/cv5V2oiZ/xJzSUx+cLB44AqWOlQOVRHjt+6Y6/CUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqBQkBZiJc3aZ5EVHjBRh5eH41HNN+IF0XQW9DpJTrI=;
 b=ZOhExJlUAJnZzxXYhrw4X2EWs6s5kG1VcCZ2yIelcd5rAcX2dAwfAvPC1KBdRm6aZrx8g4QgUvypiAcoxF5oyMuvuGaoNKoEvJnZARJIZzFeJD9s2vH4o9yPH8O7k3pWyY1A5uBUASSwpysuYffmH/b7wF92kOTSOoiAyhGtvkqVGOTmD4pWmYjE5BlJCUtV2A9sM2JEqu5fxuYMtJoT+OWtmUyNShe91paqL6NUrU5SaFFVgUhxh9If+XTdTq4YvNEMpkpPFG3qDl73Ropq/DFnwzJLPE2atkftfZjwQMqQqvcEYj8JIpusSW2tf5Qd7j8cRNa9rFsDtungIh9wMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqBQkBZiJc3aZ5EVHjBRh5eH41HNN+IF0XQW9DpJTrI=;
 b=IDPEBLeYAmwmfdNE+4ze7PjVpXyFcOaChNnzjVV2KjjhYVLyg+QNUdCL8uftMSdEfJSs7w1ESt97cX1e6SodLy77SduQ3shKPu8U/YFQOaanNPS7KUCn5OORzQrC5wFVf/8d9/tFqw4VYT8L8syIi/QPu73xkMyJWSQnBjgPKBWGtR3hs0W/TVVrzOAhjRu5u3mSVTWPvSdIxd55KAEIXKQ1tqd2XODSijH2WiIwCtShAx2xpxp90tG37rvpiyP8rsHVj8UolDcqAntdoAqADNIXV27jFYAQb6TSnKAUewzUoLLGObyRpuO2vy5i58soz9qANSBSuyNFzyzNsig0gA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SA0PR12MB4365.namprd12.prod.outlook.com
 (2603:10b6:806:96::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 19:07:30 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 19:07:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 13/16] iommufd/viommu: Select vIOMMU operations
 before allocation
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
 linux-tegra@vger.kernel.org
In-Reply-To: <20261008055955.4014342-14-aneesh.kumar@kernel.org>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-14-aneesh.kumar@kernel.org>
Date: Wed, 28 Oct 2026 16:07:21 -0300
Message-Id: <179321444125.2412245.13201160469751061592.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT3PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::26) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2d5bfc-d3f6-4839-93ec-08df3526b2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|261028144727099003|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261022105027099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Go9Odh75RZew6lZHFfJ9GbSImHzAr66HhvhtoFZl5B5+sAHnEhflDrhSN02agIx214DILWw+iNzEOp+xCGy5ie5HHcvpGP107cugoeAyMxFeyHwoEeHX7ifNxbbqQ4jhWZuyerbxjIDQTghEP0vlS2gtq9uo0ZLg37/NlQNV/vQqnNdc80VL/CSmJXW4DPAhAD1QcdKIwla64dIoiQWd78QBuRLuU2W982fZ+ufg0pcgOUw4JZZEhgIIHv9QEV+SrjafNO+Djebz5+ypB/iWu6N8OuYWIbvhNY0tc6RRbF5/HGaxI/ODwKRjnYXRlQX3k31hICcpWmjvZrd/HBAXFjslWIUkjuiuMSwlmtCXHdetF8pL7TUAu0T/lsutvpjl3UQ6CKTmtbzsP1A5F7ppW+cn/pHLlNOmkvynKVBd+Ra/OkzrtLF/9N7PAHJ66nwgV9FsmIzuRKTk1kfx9hsHUHQRhS5qVKJiwkoezP5fLkogpkYvArlxe/rdNjaB7zXvs6NVy3M+rfwFtR5bdUqHVyLLelMNFsFR0JSCVWZy/GtvYaZB2eFqhPQ+Q6kG9PDHgZcrl3gWWLfHxflA2v1UGvhsATgxLiUpHze0ixz3PnfimuAsMIUX5Zc6tlsjipdTGLqOtklBVQWKRSAPsUiDk45YLNa81HWGGgffX2tFnoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(261028144727099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTUyS3dYV3NaUlBONndYYWwvZmovSWxJc3RRYVdVN1VLSUNZVmFOMWtacmYv?=
 =?utf-8?B?dkJ6OUdCQWV0OHdUWlM0MkxuUEM0U29Lem1BekFrUThTRDBDb2x1MEZPNVZ2?=
 =?utf-8?B?cTR1Uk8rSFVxeDQxbzUrTndnZW95aDVqeGoyMVFtRkU0V3N0RXpvYTB4QXVJ?=
 =?utf-8?B?THZ2V1Z3TTJULzlwSmZJZVh3Q1EvY1A2eUo0Rmx3Tk94MW1jMW13ZnZ0VmRP?=
 =?utf-8?B?dzFlY000dEJ6R3AvbUd2dmhTeDlUblQ0TUtjZ3dLZUtPZnVPYmFSNjdaZkpG?=
 =?utf-8?B?NGVwb3Z1dHZldVFUeFZMcmt6Nlc1aWhlSEp0OEpCclpiOXc4enVzQkdSRkNE?=
 =?utf-8?B?eHVkMTRMelpKYlNxTkFicHNKMU1VbTZMREF6V3FLN2tnOUliZTZOYWdaUzhO?=
 =?utf-8?B?L1JrbzNMOFRDWmJLNks0M285UnpRK1lucXpPVzlHSFBEUG9NMEtuTjd6b1Uy?=
 =?utf-8?B?N2h6VVZzZHlHK0FCWEFRdTBtSldzSm94aEhwaW1CVGxmRVhrS1FHZWZ4ZE1T?=
 =?utf-8?B?YkE1cjJRV3VUdHNLRHcycHRPNE8xTXV6REIzbWx1VlB3RENIUVprZ0RMSlBo?=
 =?utf-8?B?K2NuYzJMaGFSNVJrdy80RjdmSXorMWRWUkF2WXZYK0Y3MGdrYmNDOElhUmJ5?=
 =?utf-8?B?SWY2bklWdzJOQnZ2RnVHVEhFcE1JWVdPMFZOK0xEcXR4VHVKSkdtd0c1R2V3?=
 =?utf-8?B?NldkRmwwci9XUEdXaTR3d1ZjUExZK04rOFREU0RxNW5heG1PTkE5QnA1RlBX?=
 =?utf-8?B?eno3QXNhanlab21ETWtydFNKaTVWc2l0UXdSOHd3amxnVi9oRjYzYWN0SHhZ?=
 =?utf-8?B?czIxVEJNSkhEeWJjaGNsUysvYVZKT0hFeE5KNVl6RGQzWFZoQ0JlbXVTZ09C?=
 =?utf-8?B?Y0MzR21uZVdKNmZBbkErRVd6Qy9pMWZJa3U0TENkUmN5UTgzV3NPUytSNEJm?=
 =?utf-8?B?SW1yR3B1ZjdzaFpicFF5M09MaVBmc25SaC9JUGdPc3l2ZFdJK2RXa1RmUFNS?=
 =?utf-8?B?SDU5ZXBZN2RtTjJiaWlhUUtDVk1NRE5IbFdVcFNjREJ6R3ozU2ZZOWNiNlc4?=
 =?utf-8?B?akdnNEJvYWlpUnRTMEd0bENyU1Q4NDFpTk44b2lMTjNyZGllVXBCOHhhS2Ro?=
 =?utf-8?B?ZnJQOTdVTHlPREFNVlFPV0EyckhETk8yYTlFZ2dtYjUwTE1XTEp3LzFxcEhM?=
 =?utf-8?B?TVJ1UmZRdnZYZmhtYTlwOFpiQWtPeFMzMkhNWVVtUHc1UFQ4N2s2K2NYdFFD?=
 =?utf-8?B?eDFxRHc5TVpDVzBlOXRmd0JzVXkwdVJrd0E0Q1VtaVFMMmtENzNSY1c4OERJ?=
 =?utf-8?B?QVVySHlRWVhmWHJUcE0xZ21LVWRCN0hDUVFqSlBaMTFPdWtPb091RXlmU3JT?=
 =?utf-8?B?MTJ4UVdXTE1MSnFUMzdvVW5tVmNxR3ZhZXBUb3FLNkU4QU9pRGV6RXRTNUh4?=
 =?utf-8?B?cjdHWE1JdFZObU52bHdZa0N0WUVIcGl5L3djV0JLM3NzbTlESmNjOC9MVU9M?=
 =?utf-8?B?WjcxYmhqb0ErV1U2QlR2UlEvaHpDWmFTOHQ5bjNXM1dMaHZWTHZwR2daZzZn?=
 =?utf-8?B?eGlLM05qUUoxNHhFdHpQN0NDajJuOSthcnk0Z3c5NjNwNllGS1dIR1ZIbm81?=
 =?utf-8?B?RGFmcVVhR2V4NFgyRGtMOGdNd0l5TjQvS0U5OW5lMWpMdnAwQmRENG0vU09J?=
 =?utf-8?B?R0ExY0N5Yjl0SDVZemZsMWpGbVRGdU1mTndXOUdPeXBNR2NMZzhUN3JWWi8v?=
 =?utf-8?B?alowK0JNV2huUWFGTnRrTkVkbkFIZjVaQzdmalFDbG8xb2JZbG00TG03TmQv?=
 =?utf-8?B?UkVhOUxYMmNtWmZGM0FjR3BDd2kyLzlTNjhNaHl5QWNwUzZTallNdS9jbWVF?=
 =?utf-8?B?KzRUOXNNWVYrQytDdjNrUHdFaWFOUnJPc2lUZW9HL0duVUI3b1l1MEFTb3pH?=
 =?utf-8?B?RW9uY1NJbFhqWlBCeXFZUmNyZGFTSTlCblcvMFdkbWNwYWdlWlNzN3VCKzJ1?=
 =?utf-8?B?aTNCcFpiZTJkQVMyZldZaFN4ejFYNGdIWWp1Y0I4M3dmcG9HTzNEVDVpTFMx?=
 =?utf-8?B?K0ZYL21Sekh2UStyckdOWTA3ZE5sZVo3emRyTjNFcThQSVQxUWlYMHZDaC9D?=
 =?utf-8?B?UFpHcUxVYWdIcVplYno5QmJvZTlITEEyTjVlNFRUWGlTSFhNUkpZZmhPcDlS?=
 =?utf-8?B?Tm5FWkxrOG84OW9mWlBZM1dXa1J3YWNBbXIzOGtJVE8xMVkrQ3hUZFlFYzE1?=
 =?utf-8?B?MndXN3QvVk51Q1NCRTFFc3VaRWJJSzk3TEk4Sk9PNlAvWFROdFVEbVdWY2xv?=
 =?utf-8?Q?hwZchVS8hfSgutpG4p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2d5bfc-d3f6-4839-93ec-08df3526b2f4
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 19:07:23.9096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtiuzqUD5TuTLxsf2f187PoDslDdfxtBWyI4JQgmxwKPawNgVhu51bYHedzeryLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120735_518699_8FE2EDCB 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 62 lines skipped ... ]
> --- a/drivers/iommu/amd/iommufd.c
> +++ b/drivers/iommu/amd/iommufd.c
> @@ -32,13 +32,21 @@ void *amd_iommufd_hw_info(struct device *dev, u32 *length, enum iommu_hw_info_ty
>  	return hwinfo;
>  }
>  
> -size_t amd_iommufd_get_viommu_size(struct device *dev, enum iommu_viommu_type viommu_type)
> +static size_t amd_iommufd_get_viommu_size(struct device *dev,
> +		enum iommu_viommu_type viommu_type)
>  {
>  	return VIOMMU_STRUCT_SIZE(struct amd_iommu_viommu, core);
>  }
>  
> -int amd_iommufd_viommu_init(struct iommufd_viommu *viommu, struct iommu_domain *parent,
> -			    const struct iommu_user_data *user_data)
> +const struct iommufd_viommu_ops *
> +amd_iommufd_get_viommu_ops(struct device *dev, enum iommu_viommu_type viommu_type)
> +{
> +	return &amd_viommu_ops;
> +}

This needs to fail not retain the broken behavior if this is getting
touched..

The rest looks OK and makes sense to me

-- 
Jason

