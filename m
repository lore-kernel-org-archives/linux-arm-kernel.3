Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9148DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbFR2GU7XLS4De+9y2hmacp6mw5O2m0EXVjuaBjMMnc=; b=hxahUgHf0z/E7EhvUgf6geIZWZ
	2wskfcCPpsrcWxcH8ehOyLy0e3xw16HSA4buStg3EDPjYJpsQ5ffEaSK6IXNOeW2SITYSEbvtZxXK
	IXnxtu4lWQGEPTdhuCmjcnFpR+51MZ73fDKzlgYCxdds24nNcy+KTtzdnVLaC+QpnaliJEK6yl8Cp
	dQaPV5bE9g0X2PBB8rjn+qXNr8lJts0MnpY2A1CrpF8FzinfqE9aj8G+FoVLPhpMuwc3nTDvcKVpW
	gEbo3v1jvWgwgtBGtXl0ztMEUnYsCHg52uZ7QejUYfZZXjQWT4OQR7LlhS3fT/GrnMxhNNFcFEkso
	lohX3zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqaGD-0000000FuEP-0cjH;
	Sun, 02 Aug 2026 17:46:05 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqaGA-0000000FuDt-1Nio
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 17:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHk0bVhnA065w7pm220KiDei25/4fRTc9wg5A/QJC0rqGRENlXQ7EE+tnKFr1kvtwUq8OC0hgLroxCc5Ur3RfPbjTLU/goFn/Elo88rBxo461nBFJ2DCVSIUYGAC5BoQxijGSpq0uPEQLP9gxPJ9SAflZO30Rw1zQytj8+2YziUHe15rUT3EpPFRdjy+kdzqbahX8aTPbLqe2UX9ctyM46ijhj2q5RbZihymEggNXCXFVBCPjAPrsXfsS23kxBTapQxOX62sx+BH3uM1Oo4CoWbXQ9QwSLgvAdJ0mkqfI9PYtUAI8qB5BrFOJm+I44oKrNp+21c2UU/y4dgGbnm0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbFR2GU7XLS4De+9y2hmacp6mw5O2m0EXVjuaBjMMnc=;
 b=svlFgqxmlMcdPapWHRhtBJ0ZsIPGcA0zAIPsTtzEnMt2qOxTwfPGKyWe1QN3t8O8RJHSOaXbf5CCdA4D3bxBb9EMVClPDBOaTV38O+vFBH1dSNrYPqwDRhiEL6ohnO9rRBJyUls1oUhjj4sEA7rw/iepJPfGJwfzTjw0jlPx5dHZkZRlakY/t8k4upriRx5d7+jarGHNVyiACg7KQF6U9QpGURAtrz+8YjuN1aitKXiKUWKGdnzz5h3z9u+QCBWO1umabx0xBfzPkkY9ZsGwetquMooCo/erXIc1jOh4J0ImWZg0sJstfMTZkQWWkj8ydwHIQjJ8xaTck6oDt+jILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbFR2GU7XLS4De+9y2hmacp6mw5O2m0EXVjuaBjMMnc=;
 b=B98KqNL+dt5ndyHxZfoZBzcPh1lrQHaGXviWkS6CGETBg3IUE/T+qig3g8ENrvsoX87Jdx4K5BK0GOzBAb9fH2x8OntOLITSpSrK1QZGIVsJSBfjcfdxW9m6gT4jHEVzLVDq/ofsEW7IUVwC8huN9fUhqI080RSyVoDgHqcIGd547pf5evnJnVAIz5L93zKVuMH9RJk0kZiraHzkSoBMN1/zs2h4h8D+Qyd8zhf5TddcSsmyIbKBRpUn/fUItftC61usD1RLEmAENm0r+rWnvgambPgF+2Cde0Mv00ANKQynt0bAngLGJLIEkfOPScB4sWwcAGmDihgN9JjwKd134w==
Received: from MN0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::6)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sun, 2 Aug
 2026 17:45:53 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::95) by MN0P221CA0003.outlook.office365.com
 (2603:10b6:208:52a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Sun, 2
 Aug 2026 17:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sun, 2 Aug 2026 17:45:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 2 Aug
 2026 10:45:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Aug
 2026 10:45:38 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Aug 2026 10:45:36 -0700
Date: Sun, 2 Aug 2026 10:45:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, <joro@8bytes.org>,
	<akpm@linux-foundation.org>, <robin.murphy@arm.com>, <cychu@google.com>,
	<hhchung@google.com>, <amitamishra@google.com>, <marscheng@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>,
	<eleanor15x@gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with
 sort()
Message-ID: <am+CPy4+gcGPtR3G@nvidia.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
 <20260730181216.2709088-2-visitorckw@gmail.com>
 <am8MpGR14HAg58Gd@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <am8MpGR14HAg58Gd@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e629ba8-20ae-44f9-11e7-08def0bde65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WAuP2PNdcnx5mct8AqWmtki4hMdo0L8qog6a108D01nmJ2winqAGH4y07qbPE5jy38jJ6cRhTStRL38Vhw62Dky0Qhyh/ZaZMTDpvm/Bdd8JSqtkwPqZmfcEnpXYh5ZWbIdjp/swTrqnUWTe1rDWlkNupKFEuLSLMka8m3VTjq9DWauliQxggpjBSAMcb/6ZT420bOChsQ1HcHAlrZuQQ6EhqxMYsA93G8NW4I1qw+Fpda4HHTwADodC4i9i4R34kJ6MpIE1c3rHvLXtRd/YJK+Xc96xzQr11ZQjJ1rFg+E5XDoiCVeDXr6hL8qhG+4UKpWwUlsoY/TDDLfRSprV4W3Y9HlnfK10/M4434JQW/07ge0D2KX2sFE6008HRksAc1cX1v3iCB2fv41Jsg3miFEt/PFCmUTSj05NzoWVl7iU/wWkZnjlOLdepiz7KQ0ufUcmobjB50boX+Difi0eS0IWGelfALbhQZtxIMM2vzncueokg5ldUW5WBOtwLPh4ThyC5sisk0KeTzR0tYOKzJx50hZ8qR8aDMLRH57Y/ZyCypQvZMezJWPCRoUzkkHjvhsPT7ybhY4OkOnYf7rl0s46DavsrupKq9T/eDLnp9D4f85ma6VherWvrAFRKKBkRGQ+H5oKIS7ALfCb8eKk+dOsopOsQnAfsn769Z+4qlkRSRwQxCM/QRGalqG9emPbADK8VZi8r6UWY2tV9KfvHw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ll3ch/1+4mwr0kiLrZyhBDdSfZWAxBCszfQXKJRlqwKdGGsMZ3tcv1Ba31aXlEcrKf1tSBp2ELReNk7UxxYoMG9aHWecKtx8VJbclAMaY3yU6s3grDaUcUUJrMb/G4/Lpprjai1vRIyMd5VRqihIxCUJ1Bp9CBtk7f9UBgG3Fb55LhE/wsik050scEr74AjXzZVEpvrZDEaQ/vsESV2w/Hd+Sryw2KFpbU3mpy2YEKOUCNlULLpQb3gK878UZGUo+MTa9LwS0cdNoYig63QJBpf69fxG4UzrDW1C5EhDTZTjDYYm9zKPZOMzNUbktI3MOCXYx4RYr+RWaQgtijnk07j/s8eiRxDLaC97wlZnV7doDacihqrZO1ykkesi4pUOGqBIpTCDbSEUFcb387iYwXWt4Q6OU/05xByu1HtJGWJqBA47rWSDSYRCM/GdR5E4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2026 17:45:53.5589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e629ba8-20ae-44f9-11e7-08def0bde65d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_104602_368949_2297201D 
X-CRM114-Status: GOOD (  11.41  )
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

On Sun, Aug 02, 2026 at 10:23:48AM +0100, Will Deacon wrote:
> On Thu, Jul 30, 2026 at 06:12:15PM +0000, Kuan-Wei Chiu wrote:
> > @@ -4047,9 +4047,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
> >  	}
> >  
> >  	/* Put the ids into order for sorted to_merge/to_unref arrays */
> > -	sort_nonatomic(master->streams, master->num_streams,
> > -		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> > -		       NULL);
> > +	sort(master->streams, master->num_streams,
> > +	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> > +	     NULL);
> 
> Makes sense to me. Nicolin, did you choose the nonatomic version
> specifically?

It's probably rare to have a large multi-stream array, so I think
sort() would be fine.

Nicolin

