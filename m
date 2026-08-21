Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC816C5DF98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/WVbHT7CumqdhOUL4qpcpypQhFjLykuQbTk+sO82jQ=; b=WLBay1z1zydPbz7C+fXo6anNK8
	00QsPGbV7Jfe3UPfZVsO3BfV9r+IaVUNbjX/iLxVyNT5JUcCovA38XjOuMZtsNre0lCHt31pnTCmh
	UBtLn8vTKEjn2Wn3Vfm+Mo8+Gm6y0qdMihxg0k8KKXONHXV9jJFOzNeN4Ok5t+bS725AdcZ+w2KhA
	ekUxItvECe+rPQfO+wXmwPyaaYHqO+xw/CSBtgeUQqtaSiB/vw9tN7nQYuIjaCvXLJgvVLJxQcZYu
	M/V3S4Tq446m5+nIdIWbYaI/dIciKh2EwVUCG+Rn4cdkPwnIirQc7sw+rQTb+hvq9ndqGJngENgD9
	QXcXI39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYTB-0000000E8qr-1OIL;
	Fri, 21 Aug 2026 23:16:17 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSf-0000000E8Px-2Wym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:15:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNPgfHA/BotcxHykumrCsJJX+zI/lnY77vhkVdwWKun9KG0RoIKRKjU/s9idjPwoEU7iR7mKyW04xkpI2Wj/GLxdwutQpEHKWp3glpB036GQEl2dFMlMLF7xkcYedbbEsu6H8rr0+KPx4Cq+5e34YZz1arLpcjz0VnqcXoPi7oaDd9/FGwb78vOlQ1uV/S0F44GZ1FQaEZv++Az7WyAtDojTpzQ15CnCUz2WB4Q29+6Qctm+kxOtgBn9xXnXATse5tS2AoPbW4bUQjPBAqpE8jSkoH4Xc6ztTPjmJispDUImjeBiRw/xvGXZhvX0NQrQJPvNc3/zz4dComim4kfX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/WVbHT7CumqdhOUL4qpcpypQhFjLykuQbTk+sO82jQ=;
 b=swRz8AlT6XR+kgL2eXksQhTtOgSCkMoQd26R/7PiTphdZn/HiBdFQrX9zJaxEYae8In1bLnqu+gbV6i+6/ThcmtbPGeEWmEIIJ4X9WhZcNwKwCHPnEmxwTX+oE+KoRVwcJbgwnT7Z6loFq5tecvl92qBuvlHpKxKWEPsz+RrJrIqhPvpGsvQC0LzqAJDaZTQbIX6zuZ1fIf5dQ4PwObu8PA2JfAVse0JZVOrKB9oMZ0VdTWaUskBkXgu2akvlQDyinp5j+G9VR7XAfMBMlODMFYLDY9IjKp5fpzOTCHZ/OhsLHtsnNG5VeuesF8Rt2wa9i/mXICHZ2V6zw5nnuT+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/WVbHT7CumqdhOUL4qpcpypQhFjLykuQbTk+sO82jQ=;
 b=HD2OeeyIeiVeXXHmsWhmmVbFGNIrIy/c49D9vHISUfF69a8Lgn/4Z1kaD8GQSXOC1w1EPkIsLSTCI/ix8IpSMfx6LSdY65XGPNUScU0PmLT6ECmV6chslRrCIjdlIfJXC/inluVgUodDlTzNliWD3Y8V4i3t948E9i6AFrX5unlNKhAmV/Jp21SquNeuOERTw2h2aLRswZAj5+jqrq6cC5UD+T0i6EhVq8Utr93kn1dYrBoDmLglsEZlib8KULWWb6J1i/EGgqJ7uZwVRQSexpV1o7De5/RbZ9cpih3qGYFcShOxgzolgDQleZNYz0XllDQ08EJV8k884TLvnd3s0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 23:15:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 23:15:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 06/12] iommu/arm-smmu-v3-kexec: Add a CD table parse
 helper
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
 praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, jamien@nvidia.com
In-Reply-To: <dc0d53df95a890ce95399a0e799160da41fa1551.1784663184.git.nicolinc@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <dc0d53df95a890ce95399a0e799160da41fa1551.1784663184.git.nicolinc@nvidia.com>
Date: Fri, 21 Aug 2026 20:15:26 -0300
Message-Id: <178735412601.18212.7804157455965213867.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT3PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb79dce-f5dc-4b9f-bc36-08deffda198f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: ZnfQ3jWLrVxiQ36GiduRIurtYvGN2yjgDxu7lqstf7gwErCzMoUvX0dL81fW99i5pMXCq7BZlie6MrIj3BzMXTeFYTVny6rFOj7YOlVw5lxEjX5CFUCjMpadpiPWRUIzGSJOs5xClYlBJZAnIugW9oK63PCkiGLJrf1OqV2ZnhhDz0gLNzWP+6mApH+I3ZVEHHlDMpSoxLMCvpsJhiREaKFX5x9oe0k5gOvYFOKdqGZ/uOceqogBS8Vp3fkw01nZjuzkPU7Z/Wpp7Q3nvcFgfuAfD8ZflLMZJtBZ0gP62xMa6P7kTiC3L8lbzLCkgWopXSJFHkaA3OWtdl21xzcKf7sgXApFfhKg/8spbzQ7ULoWpPh5QQs8nYGDnp1YAinXf3oP92Ei4XvI4FsJN3z0uVC9FwVwWiHNc6xZmBtc/pC37OmQTj334Q2ncDFic88nQuM8nMFSCcCZ/JD0K2hfEc/hlqeH4XfzAVwt6lnO1QaycPIPqYoDvT9M3E/vavPmLyGjfBVDDD9EQ+lw2u8Uaj+gV8CMSDIMkSP+BenAS3xk9iBmv9r9wYnhbya4fvddkIUhL5IZnQw3aITTTlRXa8ld7Q1tQL3XJWTT0a1E/tiS1stiIdbOhgcYKPH+Y9eFbOfc6Alxrfp5rlX5aaItbQwXMhLHa8a0fpVpDG7/EKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3crSkZGKzdVM1FZQjM0UnQ4Y3IwL05uL0x5Znc4R3oyM25kZEFCUEFQRUtW?=
 =?utf-8?B?Y2RDR21SNlhmNUt0eEJZMGFheFFUMU16N1MyVmZTbUs0MCsrdXpscGowR0gr?=
 =?utf-8?B?WTJ5eEp3VW9BT0U1SVY3NlZpcmVYUjJCa0RnaHU0N1VuNlBwZjRPT1ZQQ3Iz?=
 =?utf-8?B?dVVoQ1hiZnJabU52TFEwVzdXZG90UjFicXdVSE1WNXpPVmF2VmxZVEkycEtj?=
 =?utf-8?B?NE5ZbWdjZ3FDK3AvUm1lTTJvbVcyRXN6Wmg4Z0dTWFZjNENXUFRNSEd3NU9U?=
 =?utf-8?B?OHg0dE85VXB2YjlGZSt3U0s2Uk9IRjBQWkk5dHBNMG5xYmJySUpMTmwwekJ1?=
 =?utf-8?B?WFNLem95Y040cDRqc1M1djNyQmYrd2k3bUxQSFcrRkFuaUV2TXhOaTlBMS9M?=
 =?utf-8?B?RHZwQVd1OVA3eWozdUVuYi9YYTBvaE5kZGhRQ2U4MkpzUjdyai8xYXNEekY0?=
 =?utf-8?B?WCtJYzNpQ25raW95a0RvdlJLWHVDTDVxaGdZcUFvSjZjWFJsS1EzY0FRMGhJ?=
 =?utf-8?B?VzlNbGlQUGtPaG5rYXlTTUpaMFdmZk16MG9kL1pYVHdMaUtwa2RrR2FybUJ2?=
 =?utf-8?B?STR6SktsZFRlVE9CcEJxYnVhdkJwZU9xZHptd0pIL1BMY1hWSDU3S0Ziejhq?=
 =?utf-8?B?OG1Ga015YWdoZUpGdmw2Vkw1blRzOUdjZ2l4L2JiaHUrVzlaRjc3QWM1cEJT?=
 =?utf-8?B?YVVsWmlrcXNhQW0wRHJhT013TVE1YmtrbUxhRE9Fc21DLzk1QW1RSmFoVWtS?=
 =?utf-8?B?Q3lqSUxWNXc5bm5MNzNpVE5jT0x4ZUdRRjdickJ5VW9aa0tmZktndG5EK3lT?=
 =?utf-8?B?Ykx2L00zajIyTWY3cHdOQmd3SGtrODZBdnl0MlJWNjZ3Rk41L3RDTXY4aFJX?=
 =?utf-8?B?WEZyaHBxOGQyVGpsU2VQMUpQOXJxdUlCN3Z2MjlwcHpaVzA2Wno0bHNiWldJ?=
 =?utf-8?B?eHNwUUZlOG96UWFtc2FqRzdBWDVUK01GOHVkOVFYRHFSZU9WTVFvTG5FOHdZ?=
 =?utf-8?B?VWdEUlcyLzlmMG1tWGdKNFU3QnZzNHViTDZHdnFzSjNoVnJqeW40eWtNTVdN?=
 =?utf-8?B?eDJtODZJVDl0NWdzaWZjUHE4ZmFTQWRBUUptRGU4eFpycE1rRFFGY1NLdDZ3?=
 =?utf-8?B?OENLTnQ3MUtFTDYrQlR2STFOWDNCSmpXaFBiRFlTRjlKRzFVODNZeitpUElI?=
 =?utf-8?B?elN6YWxiakRLaDFQNzFHUi9PaDRvenRCWTNvUVkvZkNYRU9mcjRmTUNweTBv?=
 =?utf-8?B?Yy9nRXVsbzI5SHEwb1I1QnJtWFA2RFJ1REFDTGU5TUdYMEJ6L2hRWUkrTmN1?=
 =?utf-8?B?ZHNRTWZQelZPVjJ2VEEvR3N0TFVIRUVuTmlTeDEyeFNTdEllRGZWa2F5ZUh2?=
 =?utf-8?B?dWI1dk55MktObnZsU245aEwyQ2JCRlhBT2NmK3I1MC9VOGtYdFJJbTJGWXRx?=
 =?utf-8?B?eE9KYjRUUHo4WFlMZkg1VGkvSDFIa3R0S3ZyZ0NWT2xFTTRINEtwMGlYQkdj?=
 =?utf-8?B?ekZRdWpYNEdsZVhrYUNmSFFFMDhtbUY5TnN6cUFhNThoY21TSnJacm45RnlS?=
 =?utf-8?B?ZlZycElGWEZTZm9EbDJ4V292bEkwSUduZHFFc2pqd1RDZmEwRGZRUU05RFBH?=
 =?utf-8?B?bldPbS9lZHhhM1RjTk5FcWUyQndrMEtGNTZiTW1HNTVSdDYzaHh6MCsyOVdt?=
 =?utf-8?B?MG1qcnZrS1djOTl5a0hPanV3MFZKSjVxbFVwQldWMFlmSHNTN1k4aTNORThR?=
 =?utf-8?B?RGdSVTk5VWx0YkJONE9VVWZONndKYyt6UWl2cUh4UG02dzdDUFMrZ1pscVNG?=
 =?utf-8?B?UWFTNHhSZW91a1dQMGpPQnVZWXFSSk5yS2ZEVUZFR3Q2RnZVTDhEeUoyM2tK?=
 =?utf-8?B?SjduNU5DQU1RcGxhL1oxZ0p0SEVJaC9XaHNPcktlOHRBM0F0S2dpZExyUWFq?=
 =?utf-8?B?V0NzcWtvTnZlcDF4d1F5Mk5mYnJGNFIwaWJrS2lzM3dmQm03NVlVeXUxaFRN?=
 =?utf-8?B?ZERiQXNvVitWakNGb0xRZ1RGajFpbWkweWVSdDVOaW93MWlKbENiVFJ3bFRH?=
 =?utf-8?B?ZWpjbkZrWVBiOGk3aVZFc1hIUnYrWmhuNDZVd1RsOVpQZ1ZVTmMxaDc2dTRE?=
 =?utf-8?B?QzZmQ1B4ZjYrSmlSWUR0V2NkY2F2dFFvQmpIaisyMGRnalA2bERtUTRPNWo1?=
 =?utf-8?B?ZGVGUWV4SjJuZnVZOEZQYmNFSmlQLy9mWlptWGNMeGkzanRqdWhOc0lRTVl6?=
 =?utf-8?B?VEw5T09KaktPTXdjMzlJYloyNE9qdTJDZnovUmJsZy8yc0xUSTFtSUZ0RTBr?=
 =?utf-8?Q?jNnZJabuZbhUuQ/3e/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb79dce-f5dc-4b9f-bc36-08deffda198f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 23:15:33.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhzT75C9kjpMVYDyRbdIdEqZ9OcZ+8HkcfGulpFe5n8TKxJdJmTr4FF12XPyzP2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_161545_681547_CC1F17DA 
X-CRM114-Status: UNSURE (   6.54  )
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

On Tue, 21 Jul 2026 12:48:15 -0700, Nicolin Chen <nicolinc@nvidia.com> wrote:
> An S1 STE points to a CD table that both of the kexec flavors decode: the
> kdump adoption scans the CD table to reserve all the in-use ASIDs, and the
> live-update restoration claims the CD table via the KHO restore API.
> 
> Add another read-only helper to the arm-smmu-v3-kexec.c:
>  - arm_smmu_kexec_check_ste_cdtab()
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

