Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B3F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/E9tyt762ldiw0wb4KgaU3fiTZuMkIwb67C9/j27v00=; b=aa8ghsWQOzUY3jDazBbTtWs6a4
	DTq31zD5VUntlxjOStCTcFVB2wpUa9EG66RKSi9QvAIPDUehi34gQCdKFKZ/nmM34Qvcm8Ox2rlW6
	wwmga2iL2hE+Ysdjm4IG96YW/HrZWSYD3twaGknryt88Hf03MRw2A/e11h7nWxwts1071Uk6AMBcm
	NCPhBZMcxTeqnk1ftX30b5tdzDYjifCDltSNiuWD13oMTRk3nTsr6f2LL/5FKPwbFoLWart3mIQ2+
	hi+V7dAYI4NiVlYdkQMiVsd1wySHqKdUrO260rM62sHIogiU5pozdijkP5dT5upNMhPUbxSoHKsyn
	8osuV3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUon-00000003iJh-3mcP;
	Fri, 06 Mar 2026 13:02:13 +0000
Received: from mail-eastusazon11012014.outbound.protection.outlook.com ([52.101.53.14] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUol-00000003iIt-13Q7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvd7kANsCzX1WvU6tlS/iZe8RouVFEsX2nOKfKftgrUqtVr8Qf5F9huBfDICi/c17LATUL51JjwGHRZ1eVw2iW7VtqZdti7x8A72kDyqIEYmFrZYdCyIm98I0cvEEChFCbQpZgCcWQoc5GPRHHvWa2vSAJjjT+FwvbvDN8mePbagNqIHGKuwpViIKIEyBKqrf1rKV10aN+zzLJAUYHUA43EH8GpuvoP+Fjx2Rb0ZdlzvUBL79eQp6c8o9Fgw15UVTLgItTFDvTBDYXwocYHGGU2Dh6FtnXTrTyLgFhSzWfZkbuERz7eAr8NFmnwDlzRTKblelFSBqndeF6jjNml0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E9tyt762ldiw0wb4KgaU3fiTZuMkIwb67C9/j27v00=;
 b=whVoiKaXZAW7geix24WGROO2TuosJwacd94RL2WHIgEsUS2pYG5oTEEaln0gLYI6f1zJOjpBNig3Zt9j3Av62sLpso8Zkj5ZxHwS8BWekeuvq4Rhmx9pX6jYUQFo+EitMg4BzQoHI3ueW39knQh5OBSGGeI6OTgHIG4S1j/FHljYR89zY5/6yhJpRi1/gQzggWo5g0XxSyOIirkN827cP8X5jIAMazwzdgbeywBHUkoRMzbuCe/zUXafVJX50VR6Jh9zqywaNrxtltDPW5bhafEfpn9m/bNQVDbTQ0urJmANzIpHKRw0Y2RX4AqsoGOFE3GZED7A3fuDdGqE8WDCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E9tyt762ldiw0wb4KgaU3fiTZuMkIwb67C9/j27v00=;
 b=dkIWJqbbvGgZE2lDYLptFF9y3MdvDzoYzAbK6wBMCZqaMBzaIVu9WYh92Lpl19PIzvA1E29el2Tk1XYfxyGdLViPFZDTDls1yXjlEb9gFTNdw33AChcnHliWIFdnv5ePX/9RVFfjIFkZWsdGzaM6BSGuwDyb5V+tpVSnxXX+B7LRaCNObzUDeavs48Zxj+6/UJ2X0sCoATd43MdjZ39vjhuZ2k4iVuIarPJv4ptQ3yplsdLgHTCUIBYYfeu9h1TyqMMShgCqUuCiAQKiU9vOm3wS3N2n5bsuxTNtMY1dJEBvFDxLE+1sw2pY91y0WPA+CoJMgPF6+4OgCGWkpPCPlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 13:02:03 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 13:02:03 +0000
Date: Fri, 6 Mar 2026 09:02:02 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260306130202.GG1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
 <20260306013347.GD1651202@nvidia.com>
 <aapgyXadT1TEz29u@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aapgyXadT1TEz29u@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0491.namprd03.prod.outlook.com
 (2603:10b6:408:130::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e12220-cbb4-43b1-27e1-08de7b808fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: L+oAxo5tnIfzVWgtQuQZz55VRVw1Xk3O3HJwbD9VnS/1E2DMaIRAfqgXr8sdLH/Qulq1xL/ORLVqs6uULhxX+MK5VPUvezeyJUQRLPde9uf2RNy+fkE/C1jdm9KjagML6MC4hHHN43vxpeeg63kv04jp9U9Z20a7fYBpiYb1GUliI6SHNyPRu6GZMXJzfXI5EDNJG0lQoIA4fWNscNuRwkBPBs9rE+5MVOFMB1XaFgMYa/e6Fg8faevT+w9xcKR3YkrUt5Vh1P7jwui2HUNKg9QuPfrfMvjMS5jxMTdk0iAWfMZGUQIIMcmD14cwiujjNclrT7NHhJ9xc3k1xjOFtczGgosM0iKVO9hPSV1qWoq8M2Z/Ic5Qr+Y7tqVq77cJPp9ddEuCkgyFn9l/mQREd9cwa6gkuBDkpKPbxesI0AWojVpMgVYMGwcMx0R1ucO8fCIOMFlrgIrKr6HFFGg6d1fh8pHYPASYZgYBfah/AEAY/+UjzsDDvs5RQIru646zAO5gqy/b5QlvVvlORp109XcQ7h5CrgI2J6sPxef6z1LwJx9q54nXEJasXZRpZOLP1X7jujxVNoG2LAKHTn0ptVkwQ5wgbgMY0Ce33JuF0dXnD4n60rfTYHhC0RH28/NJ5Rb/Tsxx3Q8zdw0gIcEYUR7VeKEbjslhRlh/ZHEIzXhzP4JKxuiMEtAwdAvBzG0JLH5mHf1LdCynyiWE2/P/q8mgZFuITrVBmmYNc5Lh49M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L35eQZW1Rscm+0gp1IMd/Ba4xlQmUes5VKVodKOskHdy4vNtsdiM9tZAKcTn?=
 =?us-ascii?Q?VgKjAcNwrYs/G4K9yD8cVFYYOKSF3JdpkJo/PzN2zM6zxVbSSk7/NeEbaTYw?=
 =?us-ascii?Q?pZrMLSA1weYsBux7E954CADSeSeLd3nz/buWqEbaqZ1awWWhWKIDbnChsemi?=
 =?us-ascii?Q?xDuD+OCLkAkD2jHtdiBcdEXZc2NcPhfiosjb8lPNEr7RxOP1CbAE1jBPHkBM?=
 =?us-ascii?Q?hvXHfwfaTt6w97BrUQQ4PDCQJ1FPqZdLNJIpVXcLvuTVN6Zev2eTflHeYhV9?=
 =?us-ascii?Q?jYBzVdtvW8b0JaxkBauh4tnjb4paAohXar+3eKyTUP84nzcENuQcZCpvifLH?=
 =?us-ascii?Q?dlZcET+lE2afwncUUGu9lLaECymNjQahU57aWeJSPJESLJwXlX/9AfDDs5ly?=
 =?us-ascii?Q?COv45QcbAQyl5jiws3CWwA9QKrfC80e0WgNMZkma09kSnqF11ZFGLEM2Nz1B?=
 =?us-ascii?Q?WPoPxRf7UJ5cyMWHTmPeMlfkp3FsHgcQ5AusEJxpbpPB/A86WsxnSUH0deEO?=
 =?us-ascii?Q?/jPModZtYzAlLOkbNuXLuckg7ijxAsKk5H86kZpHUenW6hbwz/oScwzNXBkv?=
 =?us-ascii?Q?GzTZXCTalmE6PWxF6X9GcK7He6QHRV6mrhQ57c9ssKH8OhRXiaDSfFQGkQnz?=
 =?us-ascii?Q?xMQMWPqFL6KT31Qhdcw8LqAVT11Q+vbrrEMaAdGghTPRUzdY5TzYAAFXOAbR?=
 =?us-ascii?Q?9TwK+4vQ1WIikMHfmLy4fwclEb68aZrQkSID/OMeL/ZZeQXH3ukDA+jG3yAL?=
 =?us-ascii?Q?vYt7mLur7vqOTziY1mEbiC/zbfKIHYuA8kIYYrzkBVVHQPz2JCQiVOXcwSWT?=
 =?us-ascii?Q?FJT0wyQrHd9NWnd9ZUTUlx1NyTksB7pIjLLUPLsOKAiyGtGtFSRyoqkNFOzl?=
 =?us-ascii?Q?NlSg0YDWvSAirmWdSrqXtHdjEXdCzUcdVI9z+9T4w0vnKyA4CvWQoxiI+9ZH?=
 =?us-ascii?Q?MWsnL/dshDG8D11X3m6cPmaZDSWZj1ah4t9xi4s/8z6A80x7FEiPSqi18SHD?=
 =?us-ascii?Q?iSft68PsewrhSyyA4XY3XICenFhVNi/fBHJq/ywBYZXziFaaFw0uvE7nEKNP?=
 =?us-ascii?Q?hCIBnP3zjy/7jhDGwVETzqgmJeeOGzoyNBY2PM/WnMCZ25I5Vh3R02iwdJaJ?=
 =?us-ascii?Q?qZrMsTi6XHgVOmHYo6YOjKrJ3yFXhT6edvn6Zz/EtrgPvy8JSaQ7fmujmY9H?=
 =?us-ascii?Q?dAE8ieOV97YINpsKgfpZ4nSsaeyF86R3L5huyBCxr+jHLZweumnqYVT9pMUC?=
 =?us-ascii?Q?nPLnCmgBnSSfvw7xbS59nQCcGhMmPee9uhD2tSkTmJ5s8AovTsAgm7vvPh0M?=
 =?us-ascii?Q?tjL5iV1zHjU25fHhMG/Ggcclw5vcdseUhxGa+h7SYj+Qiy5cwpE/RQQH5gNW?=
 =?us-ascii?Q?acNZKeyu153gsKfp5K6oAKnU0KbUTlfeFZGRrR+TrOtW4LppFHmqzD1v/69T?=
 =?us-ascii?Q?l6rEOuYn5XdbmyLTyqsysCNyeOPgjLaafs02WNcPXYC9A3vo6kkdAASgU+vd?=
 =?us-ascii?Q?bwTK7kFC3FODX27M4/VTAHTFXcpkhVqw9gaTALgNDB+MQP0WcAA/fgBZNa5b?=
 =?us-ascii?Q?zIivFyI1RXd9DicjnHx8sCRZxDgn0YOMWBXkdyaB1W9sA3YQmTjWaYJpDH6N?=
 =?us-ascii?Q?QgJoV2tJJwuyXLXQbSP9CazB03KWyF7FcYjjFb8+L3yIgWfwZYPrg5kiBLIX?=
 =?us-ascii?Q?cBFQ1VR9uJG8xd/YW9lJxxwq6yzs2ITg4t/67nlFSptqtRVaQwBJ124g4QyY?=
 =?us-ascii?Q?lQFxCWYQng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e12220-cbb4-43b1-27e1-08de7b808fa1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:02:03.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B32+ocDNBpvfZqu/Jwys0NixYx9+lUACEkPZxwSPwDD9vRisk8fT9YRIMAgsi0hk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_050211_292549_B0AE39D3 
X-CRM114-Status: GOOD (  20.45  )
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

On Thu, Mar 05, 2026 at 09:06:17PM -0800, Nicolin Chen wrote:
> On Thu, Mar 05, 2026 at 09:33:47PM -0400, Jason Gunthorpe wrote:
> > On Thu, Mar 05, 2026 at 05:29:22PM -0800, Nicolin Chen wrote:
> > 
> > > But arm_smmu_cmdq_issue_cmdlist() doesn't know when to push another
> > > CMD. In my case where ATC_INV irq occurs, the return value from the
> > > arm_smmu_cmdq_poll_until_sync() in the Step 5 is 0, and prods/cons
> > > are also matched. Actually, at this point that NOP ISR has already
> > > finished.
> > 
> > Yes, you'd need a sneaky way to convay the error from the ISR to the
> > cmdlist code that didn't harm performance. Maybe we could come up with
> > something, but if it works replacing the NOP with flush sounds fairly
> > appealing - though can you do a single WORD edit to the STE that will
> > block translated requests? Zero EATS?
> 
> Yea. I can give that a try.

This also really needs to go after the invalidation changes because it
is feasible to also edit the lockless RCU invalidation list from the
ISR and disable the ATC for the failed device too.

> > Also, will the SMMU start spamming with blocked translation events or
> > something that will need suppression too?
> 
> CD.R=0 can suppress fault records, but we would need to override
> that in every CD of the device.

That's too much to do from ISR, but maybe we can do it from a WQ..

Jason

