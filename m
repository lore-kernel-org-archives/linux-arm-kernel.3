Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9537C54FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LiVMpJfAM/9gEWoxOqPDuhOLf0BttWfT8E+MGFXDrI=; b=UhAZ36LHUF+JWMDgxkhpx2Z/Ym
	gqonrhOZeZD9qwWTKXzPV/+3B/K9mM2ewdhU2BWaaFymPwHObFv2//XJSsiCho+2WsBpw4saiKqTy
	50EPG8g1xuweN7RGfaceVuP/ZtvFde4AKIhc6ONZ+Y8CZMlA4fP/gVFauR+al34raFG2ib/wq76d+
	F2qfaHbTZKFvNhBJWARxflXH9Ez73O3mFiCO5cIYGbBA4ghZVS4uAFrj/yz8dlrU5Cs52oR5mrFO0
	otvVOzC4LM6Wxq7WuuHPKGF3yVh/yFi4EBIjkgA5I7RPjA/YReOJFVSC1pb0qWDtnDKq0wLsOXuse
	UH5NxZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQus-0000000Ebyk-0Wwx;
	Fri, 20 Feb 2026 13:51:34 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQuq-0000000Ebwg-0lwF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn8AlByYz2I49gRCx/UGA18TD7zp9RYt7PJxkDwbhRx8LkAPECEA/HsAF88mYJpE7u2Pc0VIsI7m/c0oheHO1b5zaePshlpnum0MwvbxWzFkuMArAzo0CVLnUsAM9S98NXH9h2hDALCd9NPH0gvmAsKN0Kf4I8UKsUMVSeKA+8kyDvipf97HgBO2OOCprEO5qk+G4JrXpKq7jU2ghFEKem4Uovl7eF0mhSL2KIUMfBCn/C76d2X+Do4v+sknIebNs74wy4fuixFZC4sVetCpjcm34NTpAjJVfdMHudaF4QNJ2TmjJ/z9BFXuvm5LQfpcjq9wOgF+46g/3/skxTWVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LiVMpJfAM/9gEWoxOqPDuhOLf0BttWfT8E+MGFXDrI=;
 b=yKzKxm6zEkqVmukiZa/WqmWgiZYe7240vehNjeY8jqpeYMAr7EHcPxf8UG5yNtYYmKUJbtLEzyavz/KcQxYSHtrdUC+PK14EntlevUAlWPpozotf2Y8z7UyUro8naLWsY6EyWVSYos3Wje3GjvG21fGmNT36qUgzqFhuYICFYNJHF5h6pGwDr/lNqr6QH8lCQR9m0d7g+jhhA0fWMTq0Tv8dmt/pumCRAY8OF4oNhbZZKWhK+tgkZxJZUQ8hXs2piRKLuwAb8vy6JS/5vt+HdB0wQkeZAp2IB+yi2zDhxv8vC7pVhmbkVMM78GLpYPGE6JfTxWGcUvSvISpYz8A1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LiVMpJfAM/9gEWoxOqPDuhOLf0BttWfT8E+MGFXDrI=;
 b=GrDudmLzvHt21BRpjnDSyqAchp55Oca/hWYs9UASN4Tw9/iEPOI4g3u+JUDb2/aClra6U30G7jIotBJ+3VweQYoPYGuZ+2Zn77+8CAqQSCaOiblBpVqTDcUgtxalbYmNGdNVbk3DsjUT76mqbBEDiY217erxZ18C0ZzrfBxCXAD8NL8cuKoo9+WhKZJ7SAAqOqB+qJdp4DXENiIwIRsQ8wclr1eLmmFs3KfhDcCnY70D8fePh5d6+I3QZ8fdmlp/kxLqpG+C/AA7+gj2Gw2Y8usBqF+rsNLF/4ig9Mhbyr4tPMgcg9Gig3WLuLILqBXSaLjx7AzPRUN+kEodNpdDFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 13:51:25 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 13:51:25 +0000
Date: Fri, 20 Feb 2026 09:51:24 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, dan.j.williams@intel.com,
	"Tian, Kevin" <kevin.tian@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260220135124.GA1894399@nvidia.com>
References: <20260203143348.GA3931454@nvidia.com>
 <aYI0LUdXqrjmRcMo@Asurada-Nvidia>
 <20260203175540.GC3931454@nvidia.com>
 <aZZDo3BeuBKh9q24@nvidia.com>
 <20260219143737.GG723117@nvidia.com>
 <aZc//6kvH3Eqfwfe@nvidia.com>
 <20260219174139.GI723117@nvidia.com>
 <aZfoqETxb31jp/Pk@nvidia.com>
 <20260220125044.GK723117@nvidia.com>
 <6a842339-3f0a-48db-830a-326add917519@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a842339-3f0a-48db-830a-326add917519@arm.com>
X-ClientProxiedBy: MN2PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:208:238::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bade779-014e-4e60-f025-08de7087239b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?slPMFCVOZkNPR6Y4z7xgG1j85gS0L7zEPL2u+iP7BNMHWRM9IR3Ae/B8saYz?=
 =?us-ascii?Q?IlA2cnnBwqNWvpzURYQmz9ROH+IeViHkoxt4KVOk/6KJjA6N2NQGN/oZHNsy?=
 =?us-ascii?Q?SWwCKyWY0WwZDvODSg08jHzCnIEqvppV0qEir/q7YmDhww4eNu2IH3MpG1wU?=
 =?us-ascii?Q?XGOvGurKNMPW1yMlkdxXTf7BNgVyx8YmHyh4zMoMX+2TtzDHNwNWR9Pgzlgq?=
 =?us-ascii?Q?eVwkwFDyt0O8owzwYOvmtN1pVRCgD87vDK9cu2A+hAri3SRjcnxyI6Jba0cz?=
 =?us-ascii?Q?TCPD3aAVgGDWOXB1OONwSqWLYkKBtrdETcgcg1OXpp474owBMQhCVm0n66pC?=
 =?us-ascii?Q?Vyp8cxcO1zlvmbPXJWdG5iTVSDOgAFE5prZUo1erqYi22twlNeHDZw9nIhHk?=
 =?us-ascii?Q?vFjT4XFO6VMmSw/1sdI/76ILwjOqy5dZ+6nwhNW4/+cCll5FGainAaS6xgUd?=
 =?us-ascii?Q?uEsHFC3L6SofmYiO93VNABSkpXUBUKeQv5LjY5pC8FXaTk0rGr+XAmHlRd7W?=
 =?us-ascii?Q?HxqZP1jbQJYOwBKMWZUUUUGKbyorbMFDfvnKKfpmOlKulsnAOWU8NKi6a7fa?=
 =?us-ascii?Q?uD7OZXxolHUb1voxnyOfUfiVT+Ub82GRVmJOHUn0m0rzPCvvVXB5ZtyihEnp?=
 =?us-ascii?Q?x/CLjFfB/K1x+TH7nlA75730H/Xdq80s0DHYDYg359O1Ny2js6/3fNEZAUwN?=
 =?us-ascii?Q?gXSiKzsLUb9p2/VfcA//L+Sl9WKt0q1vyNrkclZ8/RPQ16NcShIskGP2xYtX?=
 =?us-ascii?Q?WmVOC/VfwKU01M7l8pAxeBZvCp3fyVuUIYjfXUyZwEC0vp5wC91iwSR8qhMc?=
 =?us-ascii?Q?pGGPAUSj5r84/RpZk8QxQHpY3+vY5lc5T3iV8WKxRqc7KQIJ34ZAvQoVZsnx?=
 =?us-ascii?Q?Jm0ZfIc4xXqhgqKhwnddvTwidF5qGz3XyHMk07Uqr8B7Gal08cn5URS+aH1b?=
 =?us-ascii?Q?C5gcN/CmcT01bRTe5vocmr2RAN7wptO43v7iTGyAY+iLniLU2YSJXvf+pZSW?=
 =?us-ascii?Q?XcPpcfTyUgkQbwX+JVArOO8VLgnc+V2PxxqWTR1O6mY0jDwO232ZFo0C8nVD?=
 =?us-ascii?Q?42YUH30IER/Nhs9GDKhmxx2XnqlUG9TJ6qxepgHEkcY8kGV3tey0wQdxG8Yj?=
 =?us-ascii?Q?GfCdtsv0HYJSP5Ld9KrnVLKVZ5t0fnepfsZ2n8V7O3MNJaiHQ4aJYEgGlkBm?=
 =?us-ascii?Q?4vxuDprbsfcgZARqh/gGqENaKGlV9OWy6vG9HoLo+Zu1QpMMKICsSMfjRnKi?=
 =?us-ascii?Q?6jhWrxfhSiWV4CkWOalVJSqxfzT8icHVzm01GaFJvgVGsoVB5kqpQ6C3apjV?=
 =?us-ascii?Q?665DwQ/KxNgFQuM/+PkjMCg4JjyZ2gyzCIYV8JNEQRrPCfF2RU+tI1uumrIR?=
 =?us-ascii?Q?MhVhLFIry0EP5d9YX9F9ZS7uohbv648UOHphG3PE7FTQ8l1oYxrq2tDHl79b?=
 =?us-ascii?Q?DcBKLARKvnxCPXKtrtxQLdlOldqu/RWYRugunDtC8wyHQJ3E1i0LFh7Ylysa?=
 =?us-ascii?Q?GmZvBMCx+We/QcM8J5CMd0b9O1GTlT384suzrDHeaaLKuyc0GoOaXKKSwIQU?=
 =?us-ascii?Q?LYn9hUpydhCe8POn1gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eRxUoidr2/N3xwsQxym4Vc743KXSWbaBHkKzbeB4IrOWfmf2rR/gnyolA4eI?=
 =?us-ascii?Q?5CKDlLCPPDIIjmhgZw4GtgPgS5bOcQxB20yyxjWEl0taTs5wbSJDk2A9IUIJ?=
 =?us-ascii?Q?T8zQPvqBVEpvallTd0ofGUxAkKftfdugbHi0XPeoNUUWkIU3Q8vbaL73yEQF?=
 =?us-ascii?Q?PEYTD9/dFISAojUaqcE4Y4AmI37Rz9T+tAIwOFM0VwL0GYol428AqUdsKDP6?=
 =?us-ascii?Q?Tm0kBOzhALwqWjr77Du3BdZBYizqLEo50JYMGWMmrqzeyJVkIXb/RMKhQqyG?=
 =?us-ascii?Q?l3vzhGvBE+sr8dmadODzkzhGqJBjvmXbqx4KB8AqysimHW/5CgFjfIv+kbg8?=
 =?us-ascii?Q?orgRFXEBx3l/5eXnjDkk9itupo4hBplyPJrsCTxw95lgvGumLYdrNTIDQOzq?=
 =?us-ascii?Q?9smSQ5C9nV8QubuWLW53RZ5HJjXxm5ehcg0bvaE85Dc7tFru/YBPs+pXk7Ol?=
 =?us-ascii?Q?xUJjStwwVNEeLrTYSXBXigPl+zW5oc+D68yvCvi0wMyhZ0JnPepF+Nf5wZlp?=
 =?us-ascii?Q?YJRfAFPZ1qrnyubGWXDsNGmfYc/YHtZCTzorhWC1nBn/zbcnaxk3H3trN0D1?=
 =?us-ascii?Q?N1QLIEdwG7bQZq+Npa9GhgkB9QxJM/9Ud9sqBooMIOV495/Gp9jNYSTrqj1T?=
 =?us-ascii?Q?LmiF7Ggw2WSek3O01L3btpdyUNCjyVvS3isf6MN5UrWyqO6QbA3cCSfGTGqL?=
 =?us-ascii?Q?azks9I5TAp8HD0peBs1Ga0LFdX/M0X5RlQ46pvFVAz41e497ouaJTasKgryF?=
 =?us-ascii?Q?HGOBl4kHteLgKs6Nqpy31DOG/pX09uSmiMvA7bUvYH7IWiRkH06emZaFOKNN?=
 =?us-ascii?Q?++bt4p2tV5j+02SKIAamxOJQFw/yI0UsbMsxIKs7mxr6F3iefjVoe478kQON?=
 =?us-ascii?Q?JcRIdWO27KVNTVHlvODuzblI1/l9imFJdUCcQlE+ooCZw0rnzqP46JH8IcMr?=
 =?us-ascii?Q?J5V2G+Qt5QTcifY9KXiZsjJr8YmkHc7fjMVxFZEzdK7RuHLFlocPAr7SvuJw?=
 =?us-ascii?Q?U9ijMRXUuCrJmPEZNJNOg2WkUMR+yA8TXwh5wVeGJrlP8z2oluuN/Usw/qf0?=
 =?us-ascii?Q?A1sylEm7xtYz7obp0Sye5fbvF1yTuUfajZxb/2aebSGC2XUWGmAmSxZGuifk?=
 =?us-ascii?Q?mFgu4s57dhuKLmIilC1fdJL6ILR0SbtPTP/E4tl5Zt4ZNL6nPPasYdP/4T3D?=
 =?us-ascii?Q?ND0r461RIYt1speAj91idiHC/acLFbFBZ27gCzwVHYkUsKFxH/6p9cN6Vtaj?=
 =?us-ascii?Q?DR0A8JVQ+uFXznMdNhKHlJN9TRAVDQRDROdbUDT2cTyIY/YD0UKR8UyEA4aY?=
 =?us-ascii?Q?zCBn5hMf6/fPnM5Z55sz7Aco0MiTaBmEx94NsBwalygYaP03gjYh8+HjYBSm?=
 =?us-ascii?Q?0BqMTZkxL8ZaoXZPn0oDigwfQX03ifL7H9Pecn+jWVyhT+Bi/flSYsmTMjRF?=
 =?us-ascii?Q?vh0MjeFWS0wsmq9z1mKj7V3o9cCCryhwK16CLPzH289e4brZYXQjazajz6Co?=
 =?us-ascii?Q?G3po+3F1maQh1taRwttTFthaSrYuwvvFOi3eNiXUm04NOZwIq2Lt/B7HNcR7?=
 =?us-ascii?Q?kS8cMgIt3oG/NNopn1eLErAY0l+05ZFFOXnMedbABs5NmtEuv66sRKXNWQa2?=
 =?us-ascii?Q?IVSJJVG7OKYK+nyF3wpIeeOyz556pyKT2xajPRp2fNQ+x424Bk0TFALu4lOp?=
 =?us-ascii?Q?Ja6GFas7Z+mVulHZlkIstT1guRbOTRIIShHNgNTUJTJHEuZzqO1oLSjlhIJx?=
 =?us-ascii?Q?Ueiu7kQPPQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bade779-014e-4e60-f025-08de7087239b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:51:25.5786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIEW4wMzyEFyb9sXfD83HDEp+lJVTUtP+xeQN7REhkcLYO8FRe7vT7UujTqSTWHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_055132_237700_63B91DA7 
X-CRM114-Status: GOOD (  15.91  )
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

On Fri, Feb 20, 2026 at 01:22:49PM +0000, Robin Murphy wrote:

> But is that an issue? Until the device has a driver, surely it shouldn't be
> expected to send interrupts at all, much less depend on them being received
> and understood by Linux? The MSI cookie is only populated once a driver
> actually requests some MSI vectors (since it doesn't know what ITS
> address(es) may or may not need mapping), so an empty DMA domain is still no
> better than a true blocking domain in this regard anyway.

Oh, the issue is the driver_managed_dma flag.

In this mode we do bind a driver but the iommu callbacks at driver
bind are not called anymore because that flag says the driver itself
will call them later.

Things like PCI port driver that never issue DMA at all will set the
flag and never make any calls, while still expecting interrupts to
work.

This is why the other option is to rework this somewhat so these
drivers still make call in to the iommu and can get an interrupt
setup.

All of this is only for multi-device groups where we want to ignore
some bad grouping with VFIO on old HW without sufficient ACS. Thinking
about it some more I suspect this entire concept has been broken from
day 1 in VFIO on ARM. If the iommu_group has two members, port driver
and a VFIO device then:

 The port driver will start first, install the ITS page in the DMA
 domain, VFIO will start second an switch the domain to BLOCKED, then
 to PAGING, and the ITS mapping used by the port driver will be lost.

And nobody will notice this has happened because the interrupts in the
port driver are only used for RAS IIRC so the net effect is your
system doesn't print AERs anymore.

Jason

