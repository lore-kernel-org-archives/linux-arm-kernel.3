Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B570EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX2q1cSZU9p27mS0nG1Y54H6NoorccgptJI5La//45A=; b=Rk00ff1u+dJopbM6KA9/GyKIsO
	ViJxPbnA0p6HE05cXKkdRlsr453rVAYPuCfDr+UCIvPAFeGrdN89bhBLjwAVdn+J82EXIBQAVQpdB
	OdfZMT8d9Yg7K2jGJ+z1ZQbptZ6DUb2UMtOMpFrGVGpbkc+mmI1nvjXV1CXZG3FPNYRIPkMh7JmUK
	1SOLvbcBmFFjdpzQoEE5Taf9okAJaSmAGUpuLFuTPq4wxp6DiyKo/48MqtU+uR8NlWP+QVx0xPj7v
	dvJ020421mkhdI62tXiTDEt+QyoWtPTJhg8/1J0zfSZoxL/bmHzDPq4q3MxhARSGcct6MEUEbZdnd
	dPhSnKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aVw-0000000AfeK-3pmi;
	Wed, 23 Apr 2025 13:51:48 +0000
Received: from mail-mw2nam10on2061c.outbound.protection.outlook.com ([2a01:111:f403:2412::61c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YoV-0000000AQ20-0omX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 12:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+zhgJvsyfkgud1qQ3Jb6k4dbQZkseEgjIlc86LTvYGdmCksiQNKjT/KJEwegWEORZHmugL9iQ3gNfLRPRlPp0GzXfqIPpy/7k4vgzljFWau1HqD19n8Pu8Ef3xuYGRFAJu/wnm7Umwpa3mFlo/Psh0iFGliK5yBvYddAx6GItT4KmdrrsHqv7Rtkh2hb1fX06e5az0F36ROmV63lx34FH+hshjtMfBORBmGB3hu2E+g0+S9bA4ZRAYUAbQE2xRtKLg4GBa0X7yEHza4JIzh+hKflrBPpHC88hPmSt0+Su1722MARauGjIq+Hpx1bHgMrHHY+9rivgAjnxayCxu9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX2q1cSZU9p27mS0nG1Y54H6NoorccgptJI5La//45A=;
 b=ZXltZoXzkRkf6Lh+yCLfgRKiDTKzYu3p1T/7YI3/KPSOYSjEHHUGF4N/xiWgs0oY4lkVOhrYIjBJhZWzhtng2SgnrZzGBPpS9s26NToWlUiEI7yAY8phL3rGVrV/j1jaTSnVxz6+Di7QHqToSRXDBA4EDbhSl2QiPeG8XufAK4WqFf3bPNaIwvdqHAYQBcyXT91FbJVLHW7+VuJEgC+dYDmvWFxviMpA5hU8aOFzvZ0oM4im9rx2OUgO1dB4jgJPHqdVvea33imyucIQKQrod6ez5LVOU5/JNszv0uHkgfuyMLvTOezKBXEurcId7MqreLdXcOgMNiF7Y4SR2hnYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX2q1cSZU9p27mS0nG1Y54H6NoorccgptJI5La//45A=;
 b=NZsWcmdiaWEw2HTVUVnovynWmaZycWlFhdVmHjD/2sHqerk/IHQxv/LhrbGtusjw1lQMzwwWf99XLZuMbViHbqH0PGTcRuKqNiIXK73LVWPuVdn8xtnrgovNPEJlOd7D2oWwm9UTBT1gQH9LaYoWRZSuIu7eIbvkPXnjjFVtRYmnvb9SC4LG6YNjvICpXWcmXL+IfbgL88xTbdyDoR2/VhBzubcjBJ2jPZ52hDoZqTkA///Ia02x0BXzxwEJrOLtauUzQR5s4WmM8llL75qKQ0stOOGws6y2dFaMqEzv3dpsUGnKjf3IKDJcODBIMgRxLPu7/64sdOQA+huY0XEoEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:02:45 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8632.030; Wed, 23 Apr 2025
 12:02:45 +0000
Date: Wed, 23 Apr 2025 09:02:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Ankit Agrawal <ankita@nvidia.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <20250423120243.GD1648741@nvidia.com>
References: <20250407161540.GG1557073@nvidia.com>
 <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
 <20250422135452.GL823903@nvidia.com>
 <aAfI2GR1__-1KQHn@arm.com>
 <20250422170324.GB1645809@nvidia.com>
 <aAgJ8g8Gbb06quSM@linux.dev>
 <20250422233556.GB1648741@nvidia.com>
 <aAjEsIwhYQpkphrW@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAjEsIwhYQpkphrW@arm.com>
X-ClientProxiedBy: BL1PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:208:2be::8) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 06abc883-a00c-4970-3f7e-08dd825ec1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?do1eOxMj1JFCtGmD0C1P/rpoKFgiZ0PpiabKG541oxiZ9ueo+q+wscUQaC6X?=
 =?us-ascii?Q?QRkfKLe1sXotHIw05Y6Wrf9yNt8Tm7aOtmIHlZ5ocY1LlTFXjb0sVU0oQaXF?=
 =?us-ascii?Q?OOM0/9WILZMda7AMAPjTAxQnyAY74LoK6wYlWX502Hnp1bS3ARS3kDtFY/on?=
 =?us-ascii?Q?g7HIJKLLZSLBhtNy2H/ZAlXX0gam8B/mC6m/BMK6ENpgV9b778BCNuhVFxtD?=
 =?us-ascii?Q?Ee+oyR7F0DXaYbipPlvNHicXZxiULGjIGl5tuhuvarsShslG6HAh+R2Elycn?=
 =?us-ascii?Q?JHpKqCG/X9ofYwxTNxvJcaUI4Dw5iHDPITZfqENVDF/F8bO8sVeTsJxnm3MK?=
 =?us-ascii?Q?3S13o4yZxCRWb2qcji3s19EPZAHHcENUPUqNUu5h76UbTL40CHVQv9cVYWBB?=
 =?us-ascii?Q?qVRuXmCsW9CSpLld4UBE0HUP2oI0IdqrklWxKwav+e1eIGPBwQiL6AW69rXG?=
 =?us-ascii?Q?yYTFX9UZRSZGW7WJkVYhF9TdInKspiiktpRkyH7HGR7uRcNMRZFBsvbe5Ljm?=
 =?us-ascii?Q?G1VNMGYwtDpAJEflXBsHPG9CAdctWLhdnhbeYM/7Z2HorTv17ZYwW5HQLqam?=
 =?us-ascii?Q?Nqtcs4j7ECvWErfkkDGS4h1LnjqXQm/DfNtP+pVNkvfHFuJ+1sBScEUiTOsI?=
 =?us-ascii?Q?RqIam6t2QAcd9B6B0PCKzch30IloSOcCAwWkt+d1qY9AQpJ62RcHFchF343A?=
 =?us-ascii?Q?OA4fvroYYFni5JSC5/WMmcj6QW5cWyWQbabPd0QrmybMtD5HanDHJeZoBPqt?=
 =?us-ascii?Q?A8T/VYKG7bETtOwwbAOfzo+iW3MR3yrjjNTTb+hqjo2EpBiSKvYB4tbXiZw4?=
 =?us-ascii?Q?QjgAg48gqncIIAwklHb6qo4JabHSZYAwVkpI4yiI1OnGzEdSNDz7YVejw1Ui?=
 =?us-ascii?Q?dzl4GgZ42XAgOtnZvX+Pg3etUy98ufkm0THX8eVa5/tD02F6F21a82yf68fR?=
 =?us-ascii?Q?YFwnH7lx+JDKErpUftcS1i5oLaeYVqrIIl9TIPrhxfX/AQ0GL3ylKK2PW9Si?=
 =?us-ascii?Q?9nCJ02n+739o9LRrsm2Vt2G6wLlBIzYiJ1ePsmZhQLuk/7PgAtp2SqiK6bNe?=
 =?us-ascii?Q?ilnCkWVSJ0JS7k0KY/5eKUm3XkNVnv2TGtgp8c57c356NpytFYRZ6g8uiGgM?=
 =?us-ascii?Q?hhLO0AViZAQfxj2zmUjOP1oHEcWRvpe6a2H79XZ85X20sDp0YjSYYUVOSSuV?=
 =?us-ascii?Q?d6TxAuG39WCjkl61nmJKbygv25o+e9jBAjP7FyXwrTGr6N2u+Sg9bm2f8Gr0?=
 =?us-ascii?Q?D6hcsXUr68fKxH3/Q8h+ekrMJhWzDyU0TPTs/bAo9BLQchsQMjBMegrNrqvQ?=
 =?us-ascii?Q?xPFLuVtP+ioTIgnJ8OFEFZLrG2XSa6eMbYswG+VYmzsFzsNP2YkwRWUv2bOS?=
 =?us-ascii?Q?TIG9gh4sHn0mKoL+6goCZws+p0u+2qs667ulRSO7IDfyd45iM0V97wGCtiaL?=
 =?us-ascii?Q?bu4yrRlZvuo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVODyUS1jU/YYVbKFtPuay9UQ444CUa41Jb1ngRPs3CApDIrXXjiqwxwmPO6?=
 =?us-ascii?Q?+qTJHMKIQLhF2P/PpvxcQEBHdhHpCjzOU+iOFduybX7xDWkdcusmuY04sn7Z?=
 =?us-ascii?Q?UdW4auE/kGGonGPkiJTxSQzKs6QWWGBapa3fSHdaQOTMIDSoa3i3xSlshZ+V?=
 =?us-ascii?Q?R2VRnHNFM2QZv8bXY01g9uNL92VX+TRq2syKD/TYdXzFiM/TnQ+/MrbBooDl?=
 =?us-ascii?Q?5g01iPm5O6wBxuHp96BCH5Pdbymwoe7BdQArXS0T6QvjT3iNC9jjESDInJ2D?=
 =?us-ascii?Q?d7U8BIC++2qJKRdf3yx0q+9+z/THWRuDpQJRhwMSMNiZFrJrclsiCbjvXszj?=
 =?us-ascii?Q?0hLbORsSwEILjgSn3v8PCK/g/BGa3CqMHSJuCrDs0lZRNBBBvxlg5cf2KkTo?=
 =?us-ascii?Q?eFQH1FVDZR6IKzVl8S/Ltyef+LKcA8YFlc/WRIJVdRg5bjxSyFpIr/I1pvdo?=
 =?us-ascii?Q?gbPOp2L2fRWqCVSga3jkAW1cA2O9/wCqsNHRR3AdnBzxPKuOROHnvszlyLH6?=
 =?us-ascii?Q?Wk7qO4Lj7d2Qz1Bk1KlkCgc3ArK6RodIC82ezxhb39gMW9sexd3ck9GSwFk+?=
 =?us-ascii?Q?XioSzLgBnJGO2Pto6asn2Ys/0QZoG2JcM2co29XlyhMJmSC3xZT9vaBqBwh3?=
 =?us-ascii?Q?xCL+Aq83BRD1X6C3KGvYlqIN2JLpLrgB4V/Abd3t1XjPVQYk5SB+AfFlkr3F?=
 =?us-ascii?Q?YjGbz6YVSSIprSW0zdiD3sWw5mL9NiHHm+C2J6IvVNmUGiv+fTQxpMGbAlb6?=
 =?us-ascii?Q?gJxOz6C116/u2BSUUrBfraPbN9MX4HAy7urYm7udxtyiHR/62nZC0WJxsqcr?=
 =?us-ascii?Q?5hUubA4e3mksbPAj7RTuv8wi/8MG1gSMmB6CQYY25ig/I9ncHDCRq2nS9n84?=
 =?us-ascii?Q?a+u2iYxwyGdrr6+VTureEvptm+KLprWGLQVX3FzS3TSAdBrP+c/w5cvKrms+?=
 =?us-ascii?Q?x4zdwm6WeTyF6ka5VWLXk0Mg3x3Etgbd2HDa04TDMjP/CSchFGKOGhbSTiKa?=
 =?us-ascii?Q?vznOIR4Ge0pWoo4jxPdU+E8M9K3v0qo4ujf1Jf++EVTHtoJmvGUwmH5vPEZm?=
 =?us-ascii?Q?8IF10fFezLGHgcK3UgUKZY34YTuzDeyaRAiZ4rXBR9Cab1/Y6ZCp0KKKCerv?=
 =?us-ascii?Q?zmvRzFFknzyFgwY7131ZSW7XUcArLE3VbTpTWewmZ46kUp65WQrZtujP6cWT?=
 =?us-ascii?Q?MlUr/rbUMAQYUkVrHgHj+keQQuL3RZmo7Y1rm0yCyGKFOGX2lan+8xUxU+Ge?=
 =?us-ascii?Q?Hf1+KcA3vbKPhvlWwg9o63da4CvjyQCjIOPth3Q1CZ3X/5eJg4LmWmGIrsr2?=
 =?us-ascii?Q?uZJxW4CQBFMe3JoMjfKaH7L/55n/wEqn6ezV4qQ5Tfrk0/JydEa2fpst9ID7?=
 =?us-ascii?Q?R3Ew443yj7bFyQJaN307WU1rz48nC42H6dBmgR7dZdjNMeFvYQ4wf5jsE0m6?=
 =?us-ascii?Q?VLiOYBSDhIEa+dcs8wsERBRLUQbY7jzrQNcAV4OrwWz7Gbfi3uZDHvNcYhjC?=
 =?us-ascii?Q?SATI4SiK8tz8BRh+8DfTtCKJ0y4s9LFi6snDfU/MBk5n92nQG3PPtfYhGkna?=
 =?us-ascii?Q?BZYMYSvUX0EW197YXxATfuDl+O6y/gRM0jXTOSLX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06abc883-a00c-4970-3f7e-08dd825ec1cd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:02:44.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHazwHdsXG3d9vUpL+UxCKwSaqYGIpAcjOEMG9fa1tinxcYYa/vspC79EQH3V9nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_050251_240234_8E4E210D 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, Apr 23, 2025 at 11:45:04AM +0100, Catalin Marinas wrote:
> On Tue, Apr 22, 2025 at 08:35:56PM -0300, Jason Gunthorpe wrote:
> > On Tue, Apr 22, 2025 at 02:28:18PM -0700, Oliver Upton wrote:
> > > Wait, so userspace simultaneously doesn't know the cacheability at host
> > > stage-1 but *does* for stage-2? 
> > 
> > No, it doesn't know either. The point is the VMM doesn't care about
> > any of this. It just wants to connect KVM to VFIO and have the kernel
> > internally negotiate the details of how that works.
> > 
> > There is zero value in the VMM being aware that KVM/VFIO is using
> > cachable or non-cachable mappings because it will never touch this
> > memory anyhow, and arguably it would be happier if it wasn't even in a
> > VMA in the first place.
> 
> I think this was discussed at some point in the past - what about
> ignoring the VMA altogether and using an fd-based approach? Keep the
> current VFIO+vma ABI non-cacheable and introduce a new one for cacheable
> I/O mappings, e.g. KVM_MEM_IOFD. Is there a way for VFIO to communicate
> the attributes to KVM on the type of mapping in the absence of a VMA
> (e.g. via the inode)? If not:

I hope to see that someday. The CC people are working in that
direction, but we are still far from getting enough agreement from all
the stakeholders on how that will work.

> Stage 2 could default to non-cacheable and we can add a
> KVM_MEMORY_ATTRIBUTE_IO_WB as an option to

I don't think we should ever allow KVM to create a non-cachable
mapping of an otherwise cachable object??

Jason

