Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459ADC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RHUItF07p7+NHPGH8R4EijRzZ57C3k3mGE69BQS8SI=; b=eRFRITob12VXfWEuWjYoVbBVaF
	lZJ4Ja/fb+u1aiK2AE/S8A71SspuR4P1WQIxZolAzrBNeQtEovs24kCLzOC/deSZjSLzaA97Dqp8q
	/4gP1cvApOK0409wrQT1iLYNVdrw5Mzg22onzOEO7UOBJLFZlESpYrmsXF/b34TjvWWcKuMflmuxm
	tRPrp0Zwj2TJKSYeXoW1gLZF7SwqjO2zS6mC5EmdXRVNqYyH+3zQOSB5XgR5EwEPOXi2p/x/mNcoB
	ztr02qeesb4TPxRC0BZhIDFPVPEelYWLe4yhxfeOWenAWUj+jId/ZH/cfJKBdn9nmsWte3WttIpZl
	W5NG3Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMxV-000000058Ek-3oqh;
	Wed, 26 Feb 2025 19:20:41 +0000
Received: from mail-dm3nam02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2405::60f] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMvH-000000057u5-2bGg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/w7S8pr7YvXLt9ncmDC/fhawryhajHKzuXPugR2hmykLV9fcGYNe/pyIIxBpQyj3MGvZ4c9JHo2ztHVJ4a2VHFKy4gvRSRQ+5Xv+oJedLXnBmZGcaVmU+0AJzJrgAR/WV2rt9IYwW68rlH+1Ao0Fnh77YwfnTjxEon0bQSagYEfax0O4wfxIbWtvX0+4G0qTaKXabPFP9tbUAmkCaJ10fa0D/ZRc7CgSdahIojWfnxBoBAER6TE89BD1AGKhNXSOr2Oz+rGm19ZM23b3tR/FE7EgDItcpJvvUoZSPDu+z71Q6dZvciKw7qyF+XLgD3uudMu4koZ4OZ7Xu7vj1siaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RHUItF07p7+NHPGH8R4EijRzZ57C3k3mGE69BQS8SI=;
 b=h6t1SseMW+hy+cxO7AxS365es8XHuiB0L2CbwXq0GLhVdgQ1hNL2tbOUN3krUkLGGufncjHwrhYh9MtYc48SClB0kEWGEEsnCsKJtyZ5hc43uE/63ky1B0T7BQRJrsJf/vKnwQ9YZ5chEyzSwRJl7QN9Qw3dy+H1SEM35iZXxJeata1ftXu253e47sFG+IbREcVO+gDKvzA86rlQSAfzI1q1NfHIyM2PyvOezxBcpWJQNtkVpkNUJP7/+OJpj3NAPn4mZVQo19IpNBGul/wQyMQVT5IAAqx3eRo204Yx3Qp1fK+L9dKp8BzdUS7L6/deE8ZKR5rTGRRYYRKods2vFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RHUItF07p7+NHPGH8R4EijRzZ57C3k3mGE69BQS8SI=;
 b=sPDNw31uUSEg1qmj3qrqLyLHSERln9lHenCYLjAM+uSoVze7+MCoS2sHKJYgFqkjeye4gq2o6VhbbdR2pd/x2kI7MOoaC+10uLjn/NcxJ2g5wvdR2fzic0CVWUX26JiDzOAPX5bG/yh6Rt9JNq7+SuWypx7TkfvOZxHxq8IiquVev6D81YJFH55vcm1P8M58pgl8k/a978EKZ2G0c6v2FrWJFVUDg+tDTPj6eRacsPI7Dc8/mahcrTNchDJalGCOVIHKPHDE3WGBSarCJ+u/Kj3IFEyF6V6/uTdfDvg9b1OpUpt0d+F8K4DQJzULFWmrBZeNR2EBEM8HXcGzaG4oDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 19:18:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 19:18:19 +0000
Date: Wed, 26 Feb 2025 15:18:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 7/7] iommu: Turn iova_cookie to dma-iommu private
 pointer
Message-ID: <20250226191818.GB39591@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <949e28875e01646feac5c4951b63723579d29b36.1740014950.git.nicolinc@nvidia.com>
 <20250221143959.GA272220@nvidia.com>
 <Z757lz6ucDE6Otix@Asurada-Nvidia>
 <20250226173610.GE28425@nvidia.com>
 <Z79j/DblkTGNRDg+@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z79j/DblkTGNRDg+@Asurada-Nvidia>
X-ClientProxiedBy: BN0PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:143::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH2PR12MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6af546-08d7-4b01-315b-08dd569a5445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n0Ub3r5/aXl10n/RYGlRJsbohMMNuXHOF+4Z6y0o6M5NXi2WA4i+P3onJ3SQ?=
 =?us-ascii?Q?eRKhREGOeWRA7okCf2g9l8NsOoGSKptlnP0eywk4RTENqiLGCS61bwb8z6Si?=
 =?us-ascii?Q?4tlIPF8OCUa/M2wtS/OareybifrzljW9zfTcSaN7cB+XSWIc6fou4Ir7/UsT?=
 =?us-ascii?Q?Eis5bxHfHxWVvfi4zk/l5xO0pHKOCiz0/lpceYGpCYnGqrVDRMWkpyyOz+nR?=
 =?us-ascii?Q?Hjspuqvf89dSHFmR4X31Fd+5nN0tLD0XwHyNDqcqjQiy/IrrG4qDdLCQoK/2?=
 =?us-ascii?Q?CKrnNbySNb3ZXiQq4O6qZ2SvPUbpPE/fYM35itpu/W76whyeelSb/mNA/TGa?=
 =?us-ascii?Q?2hW7VJlLtvwKzpu58Sa9YFDw4/POX7yyTMMH8gAchms8ztvXYUNRfEtyM7jR?=
 =?us-ascii?Q?ItYSm3Oh2ThZ8Vnzriu29Xlrz7xSgMeL5AVohE1d09MhnMdm5mcSJ0CPmQF9?=
 =?us-ascii?Q?8gzy++SvHzj/sRnntAip9YRQiC+4unpAy1sti/iYCifQU7IpNh37SZP8n6aP?=
 =?us-ascii?Q?qVglNMdrIHdo1IlXsdVY9bS0RGXYtlvfRohFjV8aXbNgmu/bbRdwBY8Y68D0?=
 =?us-ascii?Q?C+1eoCZanzl4wxOSaNxtWZiNMyvE9we0d96CcPsJg4oQSTGXY6fCEKoUaZ0B?=
 =?us-ascii?Q?QGVUThOTodrk4KmKbm8HGPxUB59XVQu/AjRoJ/yj3dZrFR+suNA6PXpWkNLi?=
 =?us-ascii?Q?OfrrIoq1Owk7o+r6s6MLrmGKefTFDl8QSrpospehcto8+aqGZQG6yomAQnEZ?=
 =?us-ascii?Q?r8mUN192ffQiXkd0twX7esNzWqheNzHCWLJNIGBZvTkEGKi9SDOirRSWCJPV?=
 =?us-ascii?Q?FXgRakGmp6GnSOzIWlRwaelJbleoBdbodQXsl8UMLaco19qHvI7qINOE/2G8?=
 =?us-ascii?Q?WfqB4CpfgycISSKCt5eCvvUbpSlzj2wWAQfEh/YIdjUvg8pVmM82668REpTD?=
 =?us-ascii?Q?rVIhx4jjevGfiptd8ircyLOWzFACWsABcAIuT4kg/eRmNGXVkqC9GXQb9/f+?=
 =?us-ascii?Q?LBWu3Lhv1/ViAq6bQSI9BRNzHGBzSUGy3SsDoYyH0x4cgF0QwqtCzkcFJ4Br?=
 =?us-ascii?Q?UqUlcq2ZR3/Ov16ucOZ+/hsu52Z0l9x7GY1xcj+qRZ7PxX8ca2hUVGzjQCPB?=
 =?us-ascii?Q?YccWQ99AJeBeAXo4klhEmyFkH3egqm5w1J8gAnzg0Vv18+3ewhNVda7JHrUa?=
 =?us-ascii?Q?t5WyxINFLHtqi7QDSTt5iZZbIER1J2ObpPE3hbw6NWB0zOI8+4/FZXLYm/BH?=
 =?us-ascii?Q?Ws2fWQWapAQJajs19+UFdrevdW/Ff125QcYw6Xsv7G14TAcu1ydZYCACdP9F?=
 =?us-ascii?Q?pQZidInzLacBwMJdyAgiD6WLSlzhX2gPNmpJAMYLVQ4PTBIBxCvg3mYlV67q?=
 =?us-ascii?Q?8jaiZIylvuadmxKR86pkfygN2Wsg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgcHaeai42QUU0lFoK00gyY5aSsFfbwox/JarisQxpaFMWiVfYmG55Tr3YGR?=
 =?us-ascii?Q?3Eaieg9/S6KTv6uddKnZcE4p1upJzk549zX/gkceM/W8YfCTodlBJH5YKpev?=
 =?us-ascii?Q?l3DH+Dnd8/GsnkaonVXAajjCbIcUPWkMO6A7yDXbnwnVuW0kzLsG3a0r/luZ?=
 =?us-ascii?Q?SprQuXnBSEFXT+76HAS70ru2faHdWKu5RI/atr4N/7WpJ4A3Ku4DS2WyS4uI?=
 =?us-ascii?Q?4T5QBFk25oj+KNsz0ulynEU7gWA7qTrhWRtdS6CdgJAKqump70vu/oxFUSgs?=
 =?us-ascii?Q?GrRwN+juFVii1yhZZ7GW6W6jiAnqYEv0e8eIcUi10BPHtfUNlUviyD+HooVH?=
 =?us-ascii?Q?noiGFvmMR2mSp1CldMz3taq+kRKwyNiBISWZsNlSiigbaYzI9xWPk2THw0ai?=
 =?us-ascii?Q?w9zOF3c1phJTcaKwIAg7nsG/xAJug7c/9VcsDK+vZCeJgK1ADNHitoUMyNL4?=
 =?us-ascii?Q?JPzvd3qc8+1u3vTsqo752Xncn6ivrEQtkrGm35pqPtXkqlm1Zrjd5Vih8WfS?=
 =?us-ascii?Q?6zFtAA7bjg2NmdvfICT17QgG4BJgcZaVoUxK/BeB9UaRKkSOPjTCwREzfCjj?=
 =?us-ascii?Q?piBiKNbDgAaEbstjbJSJ4R4ufQkMUWPdy7C1qWpgk1Wm5Wcbkkdeuyyfcoy9?=
 =?us-ascii?Q?mt3oZEG4oZzt1fA8BkXs67gn+qVS5A7R83+1jRGovDFBgKQD5yozuCbJKhT8?=
 =?us-ascii?Q?hqnBYFL7fbvggQglmiUjhiKPxkAAeFxkHWNjMjpuq1v/3gbewoyl4+382n5S?=
 =?us-ascii?Q?aW+3iv0iMdM9EQrdIJkEMmQHyPZbNoVzAoW6txbars2UZBnHc8UA6iOaCXjO?=
 =?us-ascii?Q?2LdwGV8ShT/BJ3nJzXuFBkHslrwnth89R2LL0OD8sBDRjT+AnYpXiyuUCOZr?=
 =?us-ascii?Q?LhJPMOlAEMXPVbipzxUGfYGL3S8SqZY4P09jF6Q4q5F4wQcpM5TS+NrtSLO1?=
 =?us-ascii?Q?ae2KqMr0uX9z2i/qWysLpHXnJMhYCvBO0XxsuM2dT8HwqFCT9daMCddQwE8b?=
 =?us-ascii?Q?Gh9GfsjN9Yo88oztgHqy7+LdJosx6tn59hMfSq4wLPP8bt1v1tOYSPs86obr?=
 =?us-ascii?Q?m/9P9W89K1draFFsUfLcgfmit/e8OM9mdB4HN7/CCRHnPUjuH8UHVxCj3fHd?=
 =?us-ascii?Q?5SjZRsE9sjMv5gm4tERbLJE5oiNMyz9OuK6US6jeQCMh/hRdIBUtYJR7WDe6?=
 =?us-ascii?Q?83DSBjTrX771KzpaqOa5ZrfEMIghzkv4vmOrUs/TjJgsiM7jij0Fdq4rUzRU?=
 =?us-ascii?Q?ZLQ+PDpFGFjTBF5/xFQhs90o528oBs9T7g3mo5jfbOAplWXLVU2M2IzDIVcn?=
 =?us-ascii?Q?rZ8aOjcWxrQydbR+yMTt6inc5N+YcT7DaQIpStuzU0Hb5ocThdwP7eHEfqym?=
 =?us-ascii?Q?3YB1qECoEDXj/r70X0SPRVJRGQm/8RWG1o/Yo4yXbUVPo4AHIxP4Pbp18ork?=
 =?us-ascii?Q?CcKJIx1i+vOIEsQQu9WOHYPWJnHhqlIu0pr9dSTFLxWK1n5quUgi8giqi6zW?=
 =?us-ascii?Q?V2SJh4gISmMIYqKGwA+Wbir+YhFRSuZD8u/vQt+r53hFDWb+o7An7u+7Yzjz?=
 =?us-ascii?Q?/aSVFXOA/sRFahJoLdU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6af546-08d7-4b01-315b-08dd569a5445
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:18:19.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVKoGzLp7kDa5FJLOmS6t/Oxh/ZcuftRupciK4itiSkKP8zfsvPxqIXxBi8FS3gM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_111823_675682_025B4A9C 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, Feb 26, 2025 at 10:57:00AM -0800, Nicolin Chen wrote:
> OK, I see. But we are also changing the behavior for the
> !CONFIG_IOMMU_DMA configuration, in which case all other iommu
> functions seem to return -ENODEV. And I assume we would need a
> justification for such a change?
> 
> Perhaps, this can be explicit, just to keep the consistency:
> 	/* NOP if IOMMU driver reports SW_MSI reserved regions */
> 	return IS_ENABLED(CONFIG_IOMMU_DMA) ? 0 : -ENODEV;

Hurm, I donno, if we don't have a IRQ driver that supports it then it
doesn't matter that IOMMU_DMA is off either because there is nothing
that would call into IOMMU_DMA in the first place.

Success still seems like the right answer on such a weirdo kconfig.

Jason

