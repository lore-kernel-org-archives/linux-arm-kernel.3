Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12AAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIHVOBN5xdaHQHhyDuI5dpDYGssxcKf4kTWeKFuhkjs=; b=2QpfXZuy4GrFlTlmeBLZa86HHR
	ZJMsw+J8thDQonsvTNLxjD+j3X5E+lXzEN+UpGnnB4ywhvX7rzCWMW4b6PoJwkWqn0EK85S2zqkrT
	BR0jkd61KYG2iC+JVFMlA8HzlaLeRNGdpMJZVBmqisU1jWu/KBJlLWpXtW42T3JdtYYxMMMnemYzn
	g6YmTCzae0wtuixcuZuOb74QTLFLaMPElmRLOCCNdtsHxKJZFWw4FuErx8aqm38i9DMdWqEbMkwCu
	8NlWPdjRhxO/2Kb38uH+DPOfLuHSzTCPKn7RT6y+1vduKIPmhU7tyVbYbUozY/JofshTut7xyy7cd
	dSqcxyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2vQ-0000000D8Q2-3l9T;
	Thu, 23 Jan 2025 19:31:36 +0000
Received: from mail-mw2nam10on20631.outbound.protection.outlook.com ([2a01:111:f403:2412::631] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2u8-0000000D8Iv-3lEk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEzm3kQC11YViktksFK4yCQsElsbiEgbntA9ax2lkC+NX8HuE9pVOM0UF1Bcw8niCXauwbLELIWMMl56zo22C019mvLsVarbFUGNlXQSh0w9ZGA0K6euWAuFi1U9XeS4ICD5hs26PCqKDJi4gL2EIKey9hdlYnmkrGwtVdm5cppOxBLzpAuuxgF7unfO3kSxtjSPuk4NMIb897K8vxAUTGQwFp7HbHI74tjfFZ1Lw1MmvvKfle9HM3LaabnG6ZSfs6QKcKlXK+AJY+sxyQIrj8j6W5TY/2Z9Bw6RmF+ZrjiF57P2tN0EdBzYotg7/n5mzTNklA3+wXga1baPA5X8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIHVOBN5xdaHQHhyDuI5dpDYGssxcKf4kTWeKFuhkjs=;
 b=CBRzAFTY5vVE6TNVyi7FdNiIekdxRZaGy2ljeQrEoVJp3+zAQUS7+QM6ENQW0qOwguy15Hng3Jq4pBGuqP3rXHLLeIh8NM8DmYrdCOFsAax3bJhDAWc6iSByXUFrp+UgCOtF3so19ZSD+sP7O6bn+/pZ5aXrCuTKG87ykmX2n0yegqBpls/HkPBfym4HMLtpEWrMpol+Fsm3y70UtYVhNk2D/F3tBAuLmWJxBD2v4Zo9piLdQRlpVqETsnBqVlXNbKOOKAa3nVVQniU343mcCbfPZ56u/Fz0hHzPBGfLjTL4Ueylvl0zGz1G3VrP6XMDIRHq4MNr45cpWbJ7rLZMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIHVOBN5xdaHQHhyDuI5dpDYGssxcKf4kTWeKFuhkjs=;
 b=mXrnefq+PxV9Ik52Kso7H6e45Y8Mo+AeVRsBlX6WogBi2az6Lt8NxgwD3SttqJVuGG6ZNETuJK9LtbRlWOqMXb3/jfoEHIFdKDfHZEBGGvxMbQkO1ugfTVAzHK8RWJRze6KURnxaQ5syRftKR6ScbXXHmvGxjJDg7O9s/+z3D/ibMZs6jFrBN83cGLrByB96UUYXhRmiGgE4CJGY2oAEME/eUrNH7pozPDDRl67SvUu1dnK3+qk4scS7ZrXbGOqLcjHxq1eA4KjgndSMifJJ/OWk5X0leEbV8PajSOanqURKLHWP3fjvNQF/zlDXEFpRsnszTrkR2luVhR/cdXO+bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 19:30:07 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Thu, 23 Jan 2025
 19:30:07 +0000
Date: Thu, 23 Jan 2025 15:30:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
	tglx@linutronix.de, maz@kernel.org, alex.williamson@redhat.com,
	joro@8bytes.org, shuah@kernel.org, reinette.chatre@intel.com,
	eric.auger@redhat.com, yebin10@huawei.com, apatel@ventanamicro.com,
	shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
	anna-maria@linutronix.de, yury.norov@gmail.com, nipun.gupta@amd.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	ddutile@redhat.com
Subject: Re: [PATCH RFCv2 07/13] iommufd: Implement sw_msi support natively
Message-ID: <20250123193006.GA1056867@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <f70451cf4274bc5955824efe9f98ec7dfdd10927.1736550979.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70451cf4274bc5955824efe9f98ec7dfdd10927.1736550979.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN8PR12CA0009.namprd12.prod.outlook.com
 (2603:10b6:408:60::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bf1bc7-bdab-4632-40fd-08dd3be45819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GgNlHvf60S941ZDMSlI0A/WlqzR44+DUyfZ8Ko/KA92fU3ILT1KvBft44Z7u?=
 =?us-ascii?Q?8fTSVBfB7lNTZACKB6zg9hjPUXKLmR2H4kSv0lK0v2PNaoAxjwQwgRnkJvnJ?=
 =?us-ascii?Q?Qx/BpMZ9ExlUIuGfUaMroFvsbLwkZIux2X9Mb7mPzYjzfy0pYpbx8lyeer5O?=
 =?us-ascii?Q?K7+6LIdOhB2uVUWQRE8BkxMZX3BwFRpVGF7/dK8fh+gDzCiQLq+FRqHX0Uoj?=
 =?us-ascii?Q?d4z3S33mRhqt3BnL5YJZo+XSQAg7ZYAR3tJbCex3mf1jsMG4wdKIXxkB3b3r?=
 =?us-ascii?Q?a6FpuAma2TmIULiunzcMtad4mXZBkEAfkbjkrTENhu2oZ2O2IOePT6u/gtkx?=
 =?us-ascii?Q?S1WD9YtJ0NoO6YA5If5VIpEqesfzwaujYkoXAKAJ2/cTAVwE95Vj2Uhx3llE?=
 =?us-ascii?Q?ss3dO+M26jmh7Ou6wAC5ATZR+iUpFXbsE1Zb5Dtgj7Wx8ddiFBFcRZ6B5dpy?=
 =?us-ascii?Q?zVBc3PbD/CD9jqx6i2cE9ITkd7u4ZH3kE2rAYyD5AeTrtJunOgEOFopsyi7A?=
 =?us-ascii?Q?Lv40u55a8SWHgxinK8XYCBAUuMSet8qY+/hrE457UiBLZMjC85P0OPb+eZ0A?=
 =?us-ascii?Q?2t3D6MXJPKB59UZK5tw3On+8j3hB1OiTl3GbgseVPAy4xO0NWBwXlZqKX6uz?=
 =?us-ascii?Q?io1qOSPH8MHZJUfxYS14mOSBuyueVjxR0rNHFGsXtv8qGsueHLDX5l8+cftu?=
 =?us-ascii?Q?noP4OSyE0XzPK2dm/t0Zkw5f8jSSCA7LWTVZtHrBj/u4Oj9L1FGWhJQCh8s6?=
 =?us-ascii?Q?ajOX9dndAZIg/P742tYV6MaGpEeu4SSLeg2CDAEAaZ6pjuBxEfZdJ3Opkfoy?=
 =?us-ascii?Q?VHc2bCY79UjSJpyqBWGc5DmCz8gKoHYEMxxI+HVN7JjVWq5UN8cJqzqKN5bj?=
 =?us-ascii?Q?ecBf7Q+ZOcrs7/zb4qPQZ8+AbnP/27h4zm3acFkHtqAVmHZ5WqqPVKHUKMco?=
 =?us-ascii?Q?rJeNrHwuro4to9VS+6UoUAVq3xo6d8PAYj38oeNh3PSeEVvxLP+DXMgeH7AQ?=
 =?us-ascii?Q?zY8GvNpk/qdCLYseRPp64uXcZxeVz5IF4UZGg2wNwnaDl6iQ/x7o5lJzvKBP?=
 =?us-ascii?Q?ROnAoJBU1xJGAgV4KCkTzRBuOyapxgqLNr7fcIsZMMaaJdNWpLUfYCgIpBeS?=
 =?us-ascii?Q?ycsyqZYXnX+/P8Ac9aqor6ETp7l8MJqSgVYLFuooU95L/X0k2bf0vUl6dfod?=
 =?us-ascii?Q?h4VNgl0O4UCaKnHq7xDJrxYzf8TbHnTDBEmteu3IgtLMd9YajbcAkcTath+u?=
 =?us-ascii?Q?1JCoUaJ33gLEBf/4TT6Zp25689PbVNn2g+HGmLvmn3M6+O++Jm/4DDEUXzs7?=
 =?us-ascii?Q?rZamOrkWdoNX/YEdAtAYP7p+ng7WOKz/jABjLeyjc3c827oE7IUYNg1aF4q2?=
 =?us-ascii?Q?2phm1YTsHOLnefSJhgh+1Yv2s3vH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+F+hvsN+0b6NhFvFP9DZLTIIJqeEjy5lVZzCZcfNqWYVM0FiVbx4Xl2ouN9d?=
 =?us-ascii?Q?XgXf8/irmVUNBgWq9sF552Sie7vUnMx4/rUOZvNmrjMrxTdbEwQdWswDDarQ?=
 =?us-ascii?Q?RLXBsMxs9xRGKdcWKBStV2wQvcqNF2CO0BCTNu6xbUlRBHEja3jh0mxzME5Z?=
 =?us-ascii?Q?cYjrf3GB/3RvKeBEywvImG8FXS2QfnxDK9Tg/402Haj2ilzpN1BX6vD5h9iO?=
 =?us-ascii?Q?XbjN3rt8B5d6HofUyLSzjEuOZx7ibnzj4G6DbV4CxMKt2Eij6NqBPpnWxBGS?=
 =?us-ascii?Q?LydoC4exx1FCYdmUYzVg47D08CHw2XfnvUOg5GZb69urQsFYzr3Aijc9oegA?=
 =?us-ascii?Q?KG+DekE0BJ4aTvn/kFMm4tRLrANpmelWAnYMZZnHGViwawVNhhCVCu2+Btsk?=
 =?us-ascii?Q?tfKJi9qR+JRpnzSEMRGuqxgHaLX1yqAbXJRH/PXQHCa1bAnYc2hM3dgG4OzQ?=
 =?us-ascii?Q?znhaI5u8guZ2ly7uuzpr5DtClSU+4TSxLKyhasuJlIvPImNMftotHfid8nVV?=
 =?us-ascii?Q?y15znyB77IucQ/Ok7XTkuyJOso/Q+79xVfAyP83oqx5Wb0rukNiQ1Tq7UaWR?=
 =?us-ascii?Q?T2In5FLdCNFG/iszEY0iLOnksVssFahmd9v7eg/nbqepImlKi+hfB/wsP4jq?=
 =?us-ascii?Q?murvrbJtUrarQE9Dmzcd8c+CtSmbtxapoChl2eNkO0OV47vhFtNy6xVIS1TN?=
 =?us-ascii?Q?DMB29gpvcDywhTtiLGVy+PBpFGlDSboi6AHiv6AeRFHCX1Dfi1UEdHA670Qz?=
 =?us-ascii?Q?VwA++4vnilVZAlvmJFE46eT6xbJizO3zCyRQEmu8DJUqmqoCJM0Mb+a5LJTb?=
 =?us-ascii?Q?jrtBXOYaZzU1i49Uy+koSfA5k2VVbZiaFWj2sZQlvgWRv3rV+nV4oT3zcweX?=
 =?us-ascii?Q?9NAkAbAZ6C/wk/WImdF55CEQY+DUVSJafUSivZKS7tE5sNrohn94jjxh2uL1?=
 =?us-ascii?Q?yM868+V+AmsxwHnKc7j0+hSjdDvfQKOBgPKP3QElJAlYJNth22fHRrIHoQEZ?=
 =?us-ascii?Q?AQil+KpkihW4J67i5NYH1UfqVPjSaZoke9xHTFADashoRrRd3AdaHzEdXPCx?=
 =?us-ascii?Q?TY6cJnsrNMoOq8RvhBTC2ZQXjn9TAPMsRv2FXyJGivUrj1u5GZMrZbsCQcpH?=
 =?us-ascii?Q?MZ67Ah0zYAF5fCh/YQuhv9tCfOcBLyv2Ohezy94j5kdQVfpa9UsyWrl8hvUP?=
 =?us-ascii?Q?X/dpEmLDFSEEF/19sd/AeqrfUdLLmX3sd+MvwfopiHw7RPMZEX8I7un8RglN?=
 =?us-ascii?Q?j/v+T2olqmKaR5HD/bsbb2rDJuE4/+iY/txVAFdsG44CX6zEeeVPfdvTrzBB?=
 =?us-ascii?Q?ljUoBs5a6Q4amwXb2W+M0MIDbcLWNSwInRkNaK8PpsePCKdp7EXVgvKeisec?=
 =?us-ascii?Q?ORqsKv+IzZU0eJMjfGBxZDNFKmT4MAzB93XrR6I/KTdfcmB378Pf5nVVWmET?=
 =?us-ascii?Q?ofl33Bc0k0IbO5FLlkc24a5zgr0wtMd9AyVNyLzcz0ImXbSrvklbz289rKAd?=
 =?us-ascii?Q?hKyvaWiqCRAjM8fPY9AFD7bgBDbLSI3JyPioQyJY+5/jON5RROFjeWGuRQlj?=
 =?us-ascii?Q?7mO0ShfL8BAWq3ufPTbqeH1tAqeBVAiiEgJFBgzT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bf1bc7-bdab-4632-40fd-08dd3be45819
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:30:07.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEVQ006ttKebdWLsJqPLee5vqcucRRK82FXiF3Fuc9OdrqiiEx+Ic7E7LV0mMDGL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_113016_960614_5352549C 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, Jan 10, 2025 at 07:32:23PM -0800, Nicolin Chen wrote:

> +/*
> + * FIXME: when a domain is removed any ids that are not in the union of
> + * all still attached devices should be removed.
> + */

I've been thinking about this, maybe we can just delete the comment.

It is thinking about is the case where you attach a domain to device
A, then B, then detach B. If there are multiple ITS pages then B's
page will remain accessible to A.

However, A had access to B's page already and it was perfectly fine,
so why do we need to revoke it?

The logic is fine to keep track of this, so I think we can just let it
be. ITS pages populate in a lazy way, but are permanent once
populated.

Jason

