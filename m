Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED868E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFvBqhSL8tOYVtAu4Y54abXb7e/A845ItJf4IwgBIbA=; b=cw57sItPB5FfiCFybqRNLdlRNe
	i2Tk2nHEUmhEok0T/haGK4VsUgu/Ha2ukaYinkwQLXctGB7R/9JSh85gZ5UrD3pAFvtru8PNlKdd+
	/CHxPRjsLEI0QuvEJGvGfJJZgR383e+w5d1zYV6ZEXNaVsyQF5u+/ZbttlDJ/EeinbYqDJAYvcyJR
	KBPm90tR94uVLI5VcnwQXDEYMCLLk3EqXTzBC2daG9H2HiBPrunXsJEB4UpJAOZc7KbODvCvnDgta
	tG2ITbAvRza1JMjL3El6CL+rmf3ErqIBO4zknQzPwwpRiA548Gepj+4I9bMxcJbM9rd4vmuUxehnw
	myWEQwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIob-0000000GQeU-2Efr;
	Fri, 10 Jan 2025 17:28:57 +0000
Received: from mail-bn8nam11on20602.outbound.protection.outlook.com ([2a01:111:f403:2414::602] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIlH-0000000GPnW-3Vlb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:25:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Idga0pLEM99twxmVv+imQ4Du8V1nBEjeKfFRFSz8LkYMFI0ZWL2gsDgf4tMZpMMAWSGsk8WajEmkmrcHsArtoDK7ZjFSTEa/oKFTEele3ZXVmnimKWPHA5PLqVCs155kgTOlcj9DgfqzSJMR/U2UwdSXSacCpMuOPtsuifOqKljzYiVirOJ91dbfwW1L/nSPOkp2B3ECJpavQkkn1kfHlxnyeTGGV8WenmyEYZqxZ129/DWpG9UXO26xgxSINoYrVp2+CEWHUdr8ZtaJvfzMKlCReMR+7eEkb3qAg/ewgCoZKa2glGWutXagk+ms/4bD+FH0T/4aa+DVYIe8FUlteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFvBqhSL8tOYVtAu4Y54abXb7e/A845ItJf4IwgBIbA=;
 b=UI0g6NTs8sqvu3X5iiwem7Usg/9q/1NZYlQxjDuan4h9rvKAB2OByfrWEwJgHdn6rxIg1exnN7lpuLfS07CAQBCz0NtJ+w7KY9mNhOqkFZpb37HxBJg90BYaR4invrxW0Wwn3poc+/6Y4XtzTn+FmU27q7z76Btg09y5NhVHE4dUzCbYhwDadqScfAMQhZWXc/NVxLwf1dUDPJuX4++a6hgEesJcC7Qy6PukVYaLVVoRSFx/oEcCnZMo4CcOxhfYgppQvQOxJ6Ld547Ls0nQMtZucAyCd6fbUURNFDMw/CjYAvg5D8PIfeQjX6GD9bE0eU+hJJZliVXRJRfCk3qs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFvBqhSL8tOYVtAu4Y54abXb7e/A845ItJf4IwgBIbA=;
 b=sv9GGSR7l+R+7EgfjrA5HGl1TRs+juqfDTAjoY2WyDEwGA7rxqsfx3lQsfUPP45qixp77g6rRhD8WB3zFqQRdSxglNFTYlZ/ycs7FK7pwdIWoC52rFysra/qURLpC4BJqHDJU83CSo6slk/gQVDYka9Navwmk+4coFmIbGEy9aQVePn1HUVWWdNLLi32sOYF0J9tcluNDt+LUJOHLnx728Kh6GE5w37vXjVNGWW+dfBbNJEsSrqiyCs52WErljZOznBNBO0GUGrRpn5ZmHNW4nPrcKyud9N44UXR7IvOwZKyz3PASI1LEN8cNCCR1IY2YotxTGUwTJ3iWGK/ycVtYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Fri, 10 Jan
 2025 17:25:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 17:25:27 +0000
Date: Fri, 10 Jan 2025 13:25:26 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 03/14] iommufd/fault: Move
 iommufd_fault_iopf_handler() to header
Message-ID: <20250110172526.GE396083@nvidia.com>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <6e4f3917e2bcf871b958c0d9f69dd3a182ee8ce7.1736237481.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4f3917e2bcf871b958c0d9f69dd3a182ee8ce7.1736237481.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0727.namprd03.prod.outlook.com
 (2603:10b6:408:110::12) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: c9617997-8962-465e-402e-08dd319bc65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qQ8TPeBl40ZyKZ4pCdCoXflBGb5idRqvdHFAH/glwiLrAAPWR03BsEHYJyTz?=
 =?us-ascii?Q?bSHMnmj8/OSX5wX3mUE4azv2dYfMWA2vmYvhCVbLct5g/i6o1bXOV06+wlcH?=
 =?us-ascii?Q?7IwN8q/Kly51BRyxkvRzeJ+z6D0aDx0QyrWMguxJN3OdDgzDPV9KB7AodiZs?=
 =?us-ascii?Q?wp6wgwrQP6n9K7csg6dzLqe7YMrwJifjXcYsWPBXsTMC3O9+Fv0u3i/buJI3?=
 =?us-ascii?Q?qKlNGyFcr4LYZJcIiELMhEx5oPJCuNq8S6iu5hqEPnKA5EaVPwRRnEOUe32S?=
 =?us-ascii?Q?5srn6ZDd3Jm04FokcFf4dzhr5dSI8VX7TA8AF2imgmwWX9EXvoXFFi3OU1Ic?=
 =?us-ascii?Q?NfRxuA2mIAfgqbk1JzGZ9nlau39hgbUSm1GhPTwlXz3llK6xA/Ibda+FIJaP?=
 =?us-ascii?Q?bTReAOfuIxMGvnyR/kewWLRCYuyZtT8QbuhKEkz4pUxcoQQBYD1N8xoRm0u5?=
 =?us-ascii?Q?FbpuQ/mosGBsFSxVBW5HV+CnPFCBwoxZwNT9j7t8DwH7njcW0ndWT2AbHh4G?=
 =?us-ascii?Q?cr/JnwTbuOS4WGSTwWLXCEdc1cftxApsHl/YrE5NG2ABOahkNRIz5/VyghYL?=
 =?us-ascii?Q?q4f2+XbpYhAWTMTmbElNMJZJL7J+Al5y9Foc6WOiwGwF3+Is91ugTRBJXOqX?=
 =?us-ascii?Q?7zMYacXUhiyXsm4gcd6lEj27GbwLQ8xjWrDnfa1fCTBn1L6H/Qak3BFAkMzK?=
 =?us-ascii?Q?96FHZwN1BY3jxMLRQEPNbR/4/K5XaXxfbjB973VOP/XyfveQwrbkL8aMK6kJ?=
 =?us-ascii?Q?kvmGACcltW0fw6TM21cBJDUdmfYpZg3R44HHcGEtj0sW1yWd4qFJpkCDnlpS?=
 =?us-ascii?Q?DTvkfFGBqgdZuvedF4G7rc6zVJr9+/sdUHI7WMGNlWMuEeLT7WDwCju+cJvD?=
 =?us-ascii?Q?LsI7ZVqL5efpb1YjcdDpgvvDDjUDrannbb7oton/pat0x/+3zgEa36CP1ds0?=
 =?us-ascii?Q?04hiYJTSgaG8JrJhGZ8CxYvkjJzkf5DVwhwuP+Ngbd53igCe4R2PcPl0GkDV?=
 =?us-ascii?Q?Na8AZwul7y7kwYHyn+Mex5aC/+BTybDymFf6ksBQFeRl0vzai1HEbwNHOpaP?=
 =?us-ascii?Q?gK7dpP4aInUGcHJeopI2RYxGFXFBCYlKa1umYcLk17sKJH8uRP5RGASpaxS+?=
 =?us-ascii?Q?ifLSL0cLl+hvB5Ryig3reZynC3LJyLf7EhpDybxlEySXbiouXnlX7ZaYhyL8?=
 =?us-ascii?Q?GvkVoHU6tMzhwYIcFFdaeZVSBTPpYgm3GGEFT0fSWZPR1R7BaBl4N2/kBu7g?=
 =?us-ascii?Q?ICxNXOC4Sh4mYm+KBSHmQa/n2Q/u1lSDr3X0GiYt7KGZCQMcpR8J3UcX7aH3?=
 =?us-ascii?Q?/L6x4VOeqZfzuOy+JilITC63izJhXzz9ZiIcnhKJipdUeTo6nV9WO43Ig/Gg?=
 =?us-ascii?Q?dejAFI3G9blo1p4F+QiQM0kHdEhb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pEmS5nLUwmHvmxsKk/thv08tUZb78LyJLD1XqQVeEbfWxWp87tLvpfabXvF?=
 =?us-ascii?Q?5KjUiA2XQn3eLL9UdeUsB753fANTe9lQUb4ON6j2cPCZioSZugx9MuoG2E63?=
 =?us-ascii?Q?NJ/seDY/Rp+83k/6lsWWNKpB7gEN0JB9qw2n57lMSeCWIQIB/UH6qAaLaTri?=
 =?us-ascii?Q?y9mogJ7E2wOrRdoyGVdvMPIzbEv/ryIzBpVBEUg7Tf/K+Va3mZeG3RbpQYnn?=
 =?us-ascii?Q?+b3eSNDB7JjRqy2I1RGRqMtrfm4CTZAxDtuui0tWEGN5y2RaF9jH0MByznBD?=
 =?us-ascii?Q?2BKuCQQGrljRcv7OxsD8rAUpPwgfexMlIUtC/gBwDPQnAqjJxkSDZXvx6D+a?=
 =?us-ascii?Q?kSSHKkNL0/ZsRflsftW9tupLElEvOjqThjUT3nNq14S9A3TNtw1M00fR/LTt?=
 =?us-ascii?Q?abXQRtKOWMfCCZqEfHTcTTLTgL1U019czlSei9jq/wWOd0NL77l0mqN2gO+W?=
 =?us-ascii?Q?N5mNDMOdF4Xu1mbQ8qhCWN96SxqMdLcKgsxXMR/tVZm1yX+2YvbDQ1EB1cdF?=
 =?us-ascii?Q?dYnYhmfdJG1Aefm0v0VXgukZSyIbkBfdCvGIPWM+R/7O0hPY36HEOHmX/OHY?=
 =?us-ascii?Q?Iq6Yu1K4tozW7sUaKh1GhcgmTvOs28AjwfFqgex5d+ND1/F4tRArLrEpnhX0?=
 =?us-ascii?Q?uGECus0XdQOrMvddO43de7QAC3yWt+lzxna245kgP13JctXlwSK4E8xOiyrM?=
 =?us-ascii?Q?i61gviQ8ZshdIPKAhjx4hvrzEM92TolVpP9yxA6KgTnj0RU92ijrDYowpV6T?=
 =?us-ascii?Q?E9Yhhv/ZtHUFpOQZ5i9xcUIuWM/gmUsj+/rUGnQBFoV75oF1usd0ZpNf455m?=
 =?us-ascii?Q?PRb0kAEZLq5ZSi67Fpn1fjlITI5ahkXXL8QINYW5SKlz57RjVthZNlvYZSwU?=
 =?us-ascii?Q?n314ckhfAdabWjrXRwNdVteEFuyG5ua94LtI073p8O40kmlCFyDr/ZwOXT8v?=
 =?us-ascii?Q?zLhqN2HoMmnm8kyAtI48CqsWIhOLQc5dv9429XjLjxnCrvaq33rG/vqmJcO3?=
 =?us-ascii?Q?CH6y8vz1hUXpMWJs9B+HQK7UCUaICL3rZvXHH8k0iMWdPUcw/g3BP/LHZJhD?=
 =?us-ascii?Q?aiOEWk0nf6AdcuqHvjs13WAjCXoWfF4uiMBGUKa9v+j83NNQbzQYw1bNTrFT?=
 =?us-ascii?Q?p3rrY8FBnOdQkmAavZB7cx2+qpVktpF9RS0Rww+rGUzkTJUyV+AazROqxCTP?=
 =?us-ascii?Q?hPmD76C+V449XlxuPhsvhIzau35Olhb+r19cVsnVBADgkuDqVx01w5dHJgdl?=
 =?us-ascii?Q?UMgu5Ue0xqMup8vCTD6lRz7LZbdY4QGbQhnscyJaVcnRwfiFbyaX0tKXvdEF?=
 =?us-ascii?Q?mX4NVR/Gn8IxI6+rc/0g2m1Uiw+wYVz3YgnB6SUHWwxvTUat2VNcKVdoNSaF?=
 =?us-ascii?Q?tReRRU3nGXh/qdpZnvLyrFmWg9mVOFea4e6NK5+6sYQlrIVAbLfA4yq3jYWS?=
 =?us-ascii?Q?Ydw3vYlSGfzALBXSVQnkrXPtvJV8ULCaycYsf8WSM+Dj/Y5kFNu4KqtRluZh?=
 =?us-ascii?Q?sTTf92YILfzouC9m/YrsxbyLpIrRagmT25JMyw1aK+Cpg0k3Vn7pUbjYjnkI?=
 =?us-ascii?Q?EF1UB1oIssEpMZXWuklhK6YJstPuKu4hXk+tBEL/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9617997-8962-465e-402e-08dd319bc65f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 17:25:27.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z14PtW2gIX3SK46Hyxz29MWkUGO5XC31En5MCu0fYUmTJM/ENyi+OUbT92F9CIU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_092531_869986_8C724E72 
X-CRM114-Status: GOOD (  11.50  )
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

On Tue, Jan 07, 2025 at 09:10:06AM -0800, Nicolin Chen wrote:
> The new vEVENTQ object will need a similar function for drivers to report
> the vIOMMU related events. Split the common part out to a smaller helper,
> and place it in the header so that CONFIG_IOMMUFD_DRIVER_CORE can include
> that in the driver.c file for drivers to use.
> 
> Then keep iommufd_fault_iopf_handler() in the header too, since it's quite
> simple after all.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 20 +++++++++++++++++++-
>  drivers/iommu/iommufd/fault.c           | 17 -----------------
>  2 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

