Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN4YUnZ1SenWEibq13R4WEDnne4vVooO2kWOpCIET0M=; b=eeoxb+ZqyXvn2KgSI5N5RhYd2O
	ZC/9VRpgjEQdGocItEzvzp4IMldp7M+NPwCC6BnDZgl3ZhhRquQmKhLpgzitCXk8SH4pT5+gk8gpC
	8gvY3xFz03IlaEaQ4uotdJ12dIcMY+jdycZ0uumY+cwfedLkIYMEpAMr2hwdhH1jDjZVhc3QfvLDl
	MvVdM/3p4O+vf62JTNOWU9BgMFOAc62iw4uNN9fDdyc7z6M/yePxGlB/lPRlP365qD4QGIVS+v9M5
	+2oIV+Zs3GaaIWFbSWSGcvyBZucexcvR4F2cHaMjDDzUq+mPn4TwTxmv2Vb6yntJC40AvRYHu/iNg
	TpCzpq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1me-0000000D1En-1YOq;
	Thu, 23 Jan 2025 18:18:28 +0000
Received: from mail-bn1nam02on20623.outbound.protection.outlook.com ([2a01:111:f403:2407::623] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1lL-0000000D13o-34CJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 18:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiN1g3OqQ/c9MrAGiZlmSwtKCCbHNkJkYpRUHloIkdxHZOF9DVTtt8Z9POwtVS99w71i8d/w3/rIycFoyAmOeOapzBV3DtV8gF3Bbs7z2OHCjNRdrM/bGjshB33IIf1WMNm/yoaRzobNsflGa/L7/BtEZNjB02y+j5iiUYXvfeSmyipNUNOG1eTGlezJFsoPaFCEPv9ZylxCTCXNW4lbQxAcgi5CfdW3c8KMQ4aFVSUpv617LplAi7maKjTnMSZhRHmzHMCuHsNKF869ketBqJpvKhEr4GVScBxAz98KzgYE477CNb7PmCh/d59jbv/fnsmA+iD00rUrQq7JsZ3TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN4YUnZ1SenWEibq13R4WEDnne4vVooO2kWOpCIET0M=;
 b=C5ES794oyCPvWUVt3xSC20lAQB/z7PPk/wbEtOjPsg3/+1c4sbN2C6Bl8oDTMpGsDRLgRoCOsAgtxWp2vI9WIUBHUPvQQOY8a3w+gUixWA8m5QMFMmAlaXXfz4wbf5zJ7PjmBInqpo1XCv0fwxnrr8sztDQnKT/IPiqa+4VCxCN2/O0SOkKqf/IuMDDcDKLlxHH7R6msOQ2raIhis7MZlBJHTmsP9TPBbc9M9GLhdzslSzzWJUNYcRxRQwLCRinju7jjukb1mopYJMtonEW5VPdfUSN/c63HLPgroFCNU2BiCinvg+/m7j61CtXnyE0fPsTNmUmDua2WH8qXDvqP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN4YUnZ1SenWEibq13R4WEDnne4vVooO2kWOpCIET0M=;
 b=Xyf83TVyFiD3Z/t+avuZRJMQxVXmUae+ajs5xcisISIp7WbEmYn9r5sN/kJH0At94NE2CKRP6UJ6eKhn99GzVnSTMk0iaNOSxnwVWhqIL84zIYD7AOPJlzeCu6bAEIFWWA/v860fbieK0NFVBMPTtDZ+dm8OeodPFVhgxJEHFa/t3Q5p+BEEjKeAdbiC3ClQz3FLYUsl6Mf7F/x2/s9g4CjmC/OnKYGq4gusREadb5cpEfM5+VK5paQFm211mPUuYDWm5ZNAk0UusPgSaWsFaydraOkZaIADQw6pdaMZr8Svi774aiaRT4S9ltvvZ6CIuj/S0tcgHk7lOj1GGGHXZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 18:16:59 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Thu, 23 Jan 2025
 18:16:59 +0000
Date: Thu, 23 Jan 2025 14:16:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, kevin.tian@intel.com, tglx@linutronix.de,
	maz@kernel.org, alex.williamson@redhat.com, joro@8bytes.org,
	shuah@kernel.org, reinette.chatre@intel.com, yebin10@huawei.com,
	apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
	bhelgaas@google.com, anna-maria@linutronix.de, yury.norov@gmail.com,
	nipun.gupta@amd.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com
Subject: Re: [PATCH RFCv2 03/13] iommu: Make iommu_dma_prepare_msi() into a
 generic operation
Message-ID: <20250123181657.GT5556@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <9914f9e6b32d49f74ace2200fd50583def9f15f6.1736550979.git.nicolinc@nvidia.com>
 <787fd89b-fbc0-4fd5-a1af-63dfddf13435@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787fd89b-fbc0-4fd5-a1af-63dfddf13435@redhat.com>
X-ClientProxiedBy: BN9PR03CA0949.namprd03.prod.outlook.com
 (2603:10b6:408:108::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ba8c5c-cef9-4016-3d16-08dd3bda2057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GsfskSP4Q/8emIr2kx9E8OfrlsDoX3yPWLJkoiNJSA2aqmsOPMPJQlQQgIGn?=
 =?us-ascii?Q?Jj2gWUEkHQMw+He/4n0fXh1Rl8j+iu5dRRjnMRwfE2jl9m1//4qQmXDDc5bi?=
 =?us-ascii?Q?mfl5Hb+F7ysIpWlysKczYAweQ0ib0CtjE5PfcDS+uJVgA6czATB3GW7YnrDB?=
 =?us-ascii?Q?4bPCyKeCXlaq4TgPHwS87U0hSuxpC0WPSBuylYJhg2pMNoQ+DJwVEBq20bjP?=
 =?us-ascii?Q?4sapzOWn/00T+bu/jMw/LC0oS0FCB3NUuFAeq/P0hP8Og17gCCIm0C401lwa?=
 =?us-ascii?Q?2zD/KaoScziB7vIwhuzyvzYbrE246SdXJN1JQLJjM34QQhomJJeEz38FttIJ?=
 =?us-ascii?Q?bnbKr1zNcsM1zLFub6rF5W/1RExxPSf03c9JHa6zI2jyKqgICfj1lj1rum8s?=
 =?us-ascii?Q?CcGx6G1wXw7fmYkqzez+wHOm6xu7vC/hG57+DRSYNBggd9zqHcwCEbe3WfRv?=
 =?us-ascii?Q?8oQmRzmPUA+nlKXQa9DH3goaOKN3QP0gBi2HTjnzeoo4JSAE8qZxv1dZkRtg?=
 =?us-ascii?Q?SV5iIN7laZmaBEeZmPGft0KSDiY5y7mChAZ2zJ372ScLK2sRip2sRjrSO3A8?=
 =?us-ascii?Q?XQPkiCLNMcMjCVBXEkbm0HxOlxph46p8nBUVqbOy2N1UDNLR8vxgY1dNxMP/?=
 =?us-ascii?Q?F6wwQneTfgewRvBCyM7gWvmm+lGAgV1SwJ7S2QlxlSfb89TfZ5RqHmmyU1i9?=
 =?us-ascii?Q?XArMaE3LiLQhgzP0JQ/u4TI6dRMH/e6k61awYVQ6RClatcT/Ntd0t8rQZpZz?=
 =?us-ascii?Q?gt20DxqjesjALghoeypnEPcnCWYSRZyuhIVpdGehFbDz/rDP6SFnIwo4TpHr?=
 =?us-ascii?Q?8ISQPXWCHGd6Rke3z/yAblmFSBVch0Y+jXDBFeC+e4wc4tYWKw7RHoYYCVR4?=
 =?us-ascii?Q?mZ1RSZyd1q32Z6u7FFUFEJrjqeD+G2A5HaB1KMweWCkxF7KdSnorfNBly4hd?=
 =?us-ascii?Q?YG/UcpC6p2xU8R8zXMAIwGOJ+LzooBFPG4tBcMdjH3aw4FMtG2H6n+hYSJIF?=
 =?us-ascii?Q?upqKZ9fu5tTaNyuty0t8cuuSmQ1D7i+FZdSOp6NKkhxUUv0oXkkqomkrSnmt?=
 =?us-ascii?Q?r+0U7UtgBoEcrj+nshskRil5U8oW6NsE7V6OHtTmifD54ST2dSA4k6/cXIES?=
 =?us-ascii?Q?RxAT25WqKERw/sLqYqnMnah1GptbAroyLkZi89lErZBpWH0IEUvuwmDwQXP/?=
 =?us-ascii?Q?iPz4GyFNloCMZfihEOEDxtNKf6GMdInM/buzqDPC4nQxPDSFuGvVIml6ObGG?=
 =?us-ascii?Q?YnzvCuvANEyzTKEEGHC0I2Eq2JzyIDBWv13jGTMY4tfnG6aSC5nvVwN8BwV4?=
 =?us-ascii?Q?AS/56FvVh1+kiAhRmpkChOqCv1xc6ZxklCL4KTG98tukgKAljqCodI6F2n8m?=
 =?us-ascii?Q?O5F3/65khuM31Q9xqX5GurE/Ynf2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4jzwTVtJcZO7xl8rfX+/VvYgcE9Yr+i+Q8c24GM8GVdPaoFO747Ow572I2rl?=
 =?us-ascii?Q?8C7vGEl4d6rFN88svw13cD2ALgSCEttFueRHMVLM8CIJzEnvgnSGqZYf58UB?=
 =?us-ascii?Q?orfcGCL+tSTzZJ0aFpGxujR1K/l9WBYTBgWcS6UfAgV813bieLJlJYfkPljJ?=
 =?us-ascii?Q?nL+loiq9nTpYlDsb9fkfJ4tGKZtYeJeY36izC6Ko2mptok3Jl6uFt0rWZV5s?=
 =?us-ascii?Q?vN3QWbJPz80JTzHtuokRlKVvgqyInYeWBp/zQ00kevnBFkB1qAMrKaRRF7+5?=
 =?us-ascii?Q?HBfSuOZTnLNI4GKp2GPgD+7IAOlU+JceNosw1VxxdftjoT6MvoqbW1t98jNp?=
 =?us-ascii?Q?XDY/OKnNqxrtZG9f1nqLZ1rpFUd1cRiUybQTrFPtS3v93BgTLaK5pyePvlaO?=
 =?us-ascii?Q?R2JiV1xgpsZQMaN3gKY0z9XHitb6vB4yeCyfRmW2YgoyV0fdBPLYvTWFfWSL?=
 =?us-ascii?Q?N5tvwgwwt7a/EdenDAu/26w2WnH+5k4oZPqdUhL6FU2Cv7/B748jz0NxjyTF?=
 =?us-ascii?Q?wzMH+jQogoJeT2/aOK57frAhQir9KSf3/BIAKRMp5u02WcSXcCcnV/iAvgzQ?=
 =?us-ascii?Q?3qR88OVbtdVu8fTroQd+h2212elTmFCINMxix6m3hnWmPdsACevd0G8WP7X4?=
 =?us-ascii?Q?MvGA3egL9WVxvfdyJWUKXJ6THbDr3q8cpTUoPz0WEbue3yT+GbSNjAY4jgbC?=
 =?us-ascii?Q?WQlW5sTR/QSqGFHZDKcRwnMZSEsfgjZaS6hWWtJm9nZ1N5PAXyecsouq0G2H?=
 =?us-ascii?Q?KNZy/axpIltyp51DqvdNiK8Wt4gCQWgRlFZ2Ne6qG8gKgZKIR+A0Uli/RvYw?=
 =?us-ascii?Q?PO2xu/Tnr3olvQOldaszJTUluyaOYtR6olPs4FrDmD+4QqsYbb70ek5Jovbv?=
 =?us-ascii?Q?19aEtBYWeRwu0uC7c/ZdWetgvK8idvQNPICECo0t5/5a8Am0utHg/9fBw35O?=
 =?us-ascii?Q?/de/sn0GOxjOdJ4sZzJD50tM+fDf6ljjS1qJo7q0FbIfyyspjHbexPxwK0/S?=
 =?us-ascii?Q?igxSfHlj8zNwm+xCswi5HTbYT13tPB+bmTvJeE8cUNRUY5+AQntaOsYFYMnE?=
 =?us-ascii?Q?Dabd0V33oJHM8wWl7WT1xaSJTayK2G4TPLkWkcv0ZDDThgGDHFhjjOYPUWGB?=
 =?us-ascii?Q?Yjoo1SSJ0hV1sCj8cJ5Fs7ks0gKH8eVYf18GWNpiE2QmnBvCt1BsJClCnk4R?=
 =?us-ascii?Q?dPX1ikA/a1MKrIO3BDg94p2kJTLPsREuPYbZ9gc0FqqCKuPSu5z+Tg0265C9?=
 =?us-ascii?Q?UMiBZcWiii+fOJRGKajQEKv9t7ZjDGXRzE9Q3IaMKMJfycgxCoVV0eTqFCl7?=
 =?us-ascii?Q?JMVXeveR89i9J5Gk04iIkUXYMeRLv1UlclnGj30nTrGFgomD8xQaH5o4RRhn?=
 =?us-ascii?Q?i2HqWNdc5kRCHy3waQksi6w3FQBBtiuppBeDFuLKEUvKlrEhcPMINPOjY9F8?=
 =?us-ascii?Q?zx6Mn0jAx1O88h6j/spy0XqZnwgo8k052P3J1FNSVZxDnHCJyl1UiZN0w18C?=
 =?us-ascii?Q?qqJ7FxXhC7B2GaM67d3R8wrtNY7CPCjAg4VSCt23uctP+V6GqxjgXZSvWA2T?=
 =?us-ascii?Q?YXVmrUOYwBWSTHN5jXSs0ofvQRsu0Hyh7nCghZnd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ba8c5c-cef9-4016-3d16-08dd3bda2057
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 18:16:58.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvOYz3YkGx0t3xce9oAFW5AwcEiRoF4UU1wrOW6Ldms3c8QlvIMOBAKYoqCL+OLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_101707_786251_0DB8648B 
X-CRM114-Status: GOOD (  25.82  )
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

On Thu, Jan 23, 2025 at 06:10:47PM +0100, Eric Auger wrote:
> Hi,
> 
> 
> On 1/11/25 4:32 AM, Nicolin Chen wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> >
> > SW_MSI supports IOMMU to translate an MSI message before the MSI message
> > is delivered to the interrupt controller. On such systems the iommu_domain
> > must have a translation for the MSI message for interrupts to work.
> >
> > The IRQ subsystem will call into IOMMU to request that a physical page be
> > setup to receive MSI message, and the IOMMU then sets an IOVA that maps to
> > that physical page. Ultimately the IOVA is programmed into the device via
> > the msi_msg.
> >
> > Generalize this to allow the iommu_domain owner to provide its own
> > implementation of this mapping. Add a function pointer to struct
> > iommu_domain to allow the domain owner to provide an implementation.
> >
> > Have dma-iommu supply its implementation for IOMMU_DOMAIN_DMA types during
> > the iommu_get_dma_cookie() path. For IOMMU_DOMAIN_UNMANAGED types used by
> > VFIO (and iommufd for now), have the same iommu_dma_sw_msi set as well in
> > the iommu_get_msi_cookie() path.
> >
> > Hold the group mutex while in iommu_dma_prepare_msi() to ensure the domain
> > doesn't change or become freed while running. Races with IRQ operations
> > from VFIO and domain changes from iommufd are possible here.
> this was my question in previous comments

Ah, well there is the answer :)

> > Rreplace the msi_prepare_lock with a lockdep assertion for the group mutex
> Replace
> > as documentation. For the dma_iommu.c each iommu_domain unique to a
> is?
> > group.

Yes

Replace the msi_prepare_lock with a lockdep assertion for the group mutex
as documentation. For the dmau_iommu.c each iommu_domain is unique to a
group.

> > @@ -443,6 +449,9 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
> >  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> >  	struct iommu_dma_msi_page *msi, *tmp;
> >  
> > +	if (domain->sw_msi != iommu_dma_sw_msi)
> > +		return;
> > +
> I don't get the above check.

It is because of this:

void iommu_domain_free(struct iommu_domain *domain)
{
	if (domain->type == IOMMU_DOMAIN_SVA)
		mmdrop(domain->mm);
	iommu_put_dma_cookie(domain);

iommufd may be using domain->sw_msi so iommu_put_dma_cookie() needs to
be a NOP. Also, later we move cookie into a union so it is not
reliably NULL anymore.

> The comment says this is also called for a
> cookie prepared with iommu_get_dma_cookie(). Don't you need to do some
> cleanup for this latter?

That seems seems OK, only two places set domain->iova_cookie:

int iommu_get_dma_cookie(struct iommu_domain *domain)
{
	domain->iova_cookie = cookie_alloc(IOMMU_DMA_IOVA_COOKIE);
	iommu_domain_set_sw_msi(domain, iommu_dma_sw_msi);

and

int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
{
	domain->iova_cookie = cookie;
	iommu_domain_set_sw_msi(domain, iommu_dma_sw_msi);

So (domain->sw_msi == iommu_dma_sw_msi) in iommu_put_dma_cookie() for
both cases..

Jason

