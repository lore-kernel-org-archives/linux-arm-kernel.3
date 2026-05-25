Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518FACD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBJsUqMsmY6sO8fKyJ76sXPhRp2+pyP3YbMNyyk3aGg=; b=iZZF2J/sxDvYrKBtXaT0MvPsvP
	ioF4039WeAYKkNtoiyXrgLLQty8HBcC583KysyQvjUlePCCtE749Tm21jHo6yMO/eoQxyAMvQkekr
	SpEmpa4yMczvgcKgRnZpGSEwXrV6uUOR7fRBwkC6MwSDib840V68eIpD5wt2IZyE/MCzN4rMPK5fa
	7OKlGQmApXSD0ecb7iqdo+C/CA7WsHSsh/R0Vgp3e6CbeBGPjAQAy3DU86Juce12h8AZ1kCaj93s1
	bchoiV1Y/Vlc1ZVKsc5rIwcfke5gRGJSgM/aIwFaqD/LPggOsKTzfk6UfTqvhQ7u4kTJZorkGj4eR
	J52+vQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc6d-00000000Qys-3AgR;
	Mon, 25 May 2026 20:40:59 +0000
Received: from mail-eastusazon11012062.outbound.protection.outlook.com ([52.101.53.62] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc6b-00000000QyN-2E9g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:40:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhsXx1XV0HC0kZd0jo4U0Aa5zNXMk+u0a6fXaYC5/OtG6eiFBgoZiH3yBkxroFwFO6P78h/HUbYp1I5MnUQMT/5tbJCOZLiZLpqUrORjTBZ7PjujuakKLJqhOWUmTv29X8VAAmNhNIU2j9oeOj2+gJeePf9yVxdOx5MXsNQTfbp2L4vxRG7QwDZsn44hKY2YoN5N0U7pmiqDWkEX+DYikcAEgC42miBQFBFe1JQehjYztLtOJGvXOVV6KOlT3KNSqX89hCYJXbCtIEkXEhTppVFwZdHw+3Rg4TBkk+UWCrSiwQPbuy582VC89lDVCzWOxAN5tYMzUgT+VvA/HGUJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBJsUqMsmY6sO8fKyJ76sXPhRp2+pyP3YbMNyyk3aGg=;
 b=iGT75zsF6TnqKUhAKDjthQ5O9UH5GeCGhXLNZQyPMhO9JE2mJdUy24z6f4eVk4glwjoGvHJxleFZ2lIVVnXi8uevkH1vhnagB+epWSDSHksaVsCaPtvtLoIYDgEfXsAeoQORFiHcRUkuOdu+FOEPCBRopXUoN8mJeGjTBgU3YlKWMcMv/QzcJwpzKyxNTu6fGaZv1BdA0j7GHa55rrcUadyVPA2kIMJMjOyPKAO8NeGkuqtbYZXATfaDhmujRePHOoroArDl0KTZK6CeUEvu2Y53RnqEEt6cM1HvxjxEQQy2FahtThvFiaTNmN8dREgkpffqrVPUqpxLD9I6vEYwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBJsUqMsmY6sO8fKyJ76sXPhRp2+pyP3YbMNyyk3aGg=;
 b=Fk76d8oURu/q7l6x/D/SttgeTShyB1G9K3QY0vInAICuGSj/YhAeU1v/OAQUcOBtHSn+Nxqs4HwcXk2ottEkr4tocN4XqjTd81fyfUGdVKhruu988rXJQ2qX9ygUmzoNt+dhVbgWFU1APvaAFL/l0T6yamGz9Im4MhkMyWuLmwrCVDmcIohvV6JmJzw1DlqLmJcvT/5QdHjdSqje2gD/BC05BeH0q9UglIA0xCYjFOwWvM84Jg/wu3WHuw1LazLvJf61CJn/pYvEElFJyYd+Ny7AjQCT+XsdLPkRmrihbVO14aCDI1Yw2ao3Vhe0Qstg/Bsa33nav/kcyR3zZ8ajhQ==
Received: from CY5PR19CA0103.namprd19.prod.outlook.com (2603:10b6:930:83::17)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 20:40:30 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:930:83:cafe::ac) by CY5PR19CA0103.outlook.office365.com
 (2603:10b6:930:83::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 20:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 20:40:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 13:40:12 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 13:40:12 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 25 May 2026 13:40:11 -0700
Date: Mon, 25 May 2026 13:40:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Joerg Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
	"Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, David Matlack <dmatlack@google.com>, Samiullah Khawaja
	<skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu-v3: Fix ATS state tracking
Message-ID: <ahSzqdoDb8SjIJo9@Asurada-Nvidia>
References: <20260525184347.4059549-1-praan@google.com>
 <20260525184347.4059549-4-praan@google.com>
 <ahSrkOv+4QZWrcJq@Asurada-Nvidia>
 <ahSxWoWd5hFvKE_R@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahSxWoWd5hFvKE_R@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a96079-01a9-416d-e422-08deba9ddc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|22082099003|56012099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: HWAqvtqQKxljJO9TLSeeWnDTstKrSJwyas9lOuHyuCIKt75EqCi+jnCovG9RFeI5qypiLJ4vHwUSqzGPSXnppvmUlMCGF0XnxGLhKLoiMSDJfGfLouKnrqHx4ZhJYaFAPZs6js3A78jpPdXRV4wYAWPGbmLUFvroc+aaCuxxRiOCh+TsmaG6dDalrTWEBqE9zNSmmmLHbw+Rl1dblW37lTHWCaYrLYdrvJwYN0I66Izw3KquQVKPFiXX+OyWgvsi8Ov05HDeVLeXAh1jSp6cQuS/+ZVQV8p5qyofQHiHB3E6+Tp/vOYKeXDcSMnaVtVtF4/2PJFSV0AZh8lpaXNDey52e3YRk7BKcwD0hz7mF2qkdv8UhSNFFHo4ToeZ9v8+0UZyJd2JRwOZ9LHTPO9jGYDdH8DsnrX5v4uP+zRcwZn7BTXXibkyOFzB5Dfou/YBtRWpQRD+LraNNNTMm6DEHMBrSgepD6BgKIANrIWXUDEOaBil5wgLwPTa49f/r3ZAafUOyvYEAP9K4V8RICqwHZdWl9zJDQHMkLnUDAQOMwqXqVtaL44ICJsnzUTsM2RONu2OYqlfd170paO7c/mI6/rLY9TAzMJWIwQB2PakP/ZwogvQhef5dFw1UO+QlAqB1I9lnpeDLTkhi1hQlpe9TMpUO8zYKhCgcZ6qoNpAjShN217uibR9KmFw/VCIxujgofS9J/byEshQw7ENECJDcdWQt2lf5J6CYEImNnzzD0o=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6P3rMGuZAfD7qfEJ/5taIsfNb5TJFFYC6PVwetkSQQydyolPJGINcK0P3mcIkVbrIZETTmpIa2P6lew6Z0C13qlx/2VW+aCQ7YQvo06USkXQp6bH5d8itz57mzDYWMIjfqJ3fl8FUsE87SUyhIErRzVX2FIn73vE0aCUZPB9E+ulN0vzaJKiPiD4KuZbpF7T20SbJ4xOxGFFgMYwqIuXK9o5bpiblBic/Z4J5kTATbULqkZ1nWIZPoXz786DimKiqDddPxsJS54TYJPhYtdYi90cjZA/MwbrkT/T19CunFbNy7lHbNVwy4S3N3m/94yCSLtogE/7O7xTs2hvp1MI45mOIhFmsRQG70txP2uONWdRcoChFetvYwWWOcLX8UnyZ71lCZbn2Nv+bu+wIgziL05PnjZqE5ZwCjss/hJWTxotvAMOWi8SmR2u8vtbx3HY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 20:40:30.4302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a96079-01a9-416d-e422-08deba9ddc8a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_134057_708338_56902277 
X-CRM114-Status: GOOD (  10.27  )
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

On Mon, May 25, 2026 at 08:30:18PM +0000, Pranjal Shrivastava wrote:
> On Mon, May 25, 2026 at 01:05:36PM -0700, Nicolin Chen wrote:
> > On Mon, May 25, 2026 at 06:43:45PM +0000, Pranjal Shrivastava wrote:
> >  - pci_prepare_ats() covers pci_ats_supported().
> 
> the idea was to call prepare only if ATS was
> supported [1] i.e. not penalise non-ATS callers of pci_prepare_ats. But

Yea. I realized that it is slightly different after I replied.

Nicolin

