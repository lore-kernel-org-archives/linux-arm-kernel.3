Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiTQQWbU4B9jgXX8d2+E5sDmH3E61F31BLko8FFniD4=; b=D3Benzis+4K/BAR9oqEQ4omhNu
	ZkGBvkbxR1tbDKNsFFV5JdcgA6bfgDE0EXza5zvhtxy9oWDi5FaVJ/xbsZoXIAPiBRzSQvnHZ5lpB
	04bNZi8PUbkmFjyIICWj225bgso6KV3SH/WTzOI1m3i2+8SteCkS8q6pCFjQ8qmNR69/OOapzcvzA
	J39sCvY7DeTWddiK51oNMdK1zWcDgcz/2+cYKIx5Fm5l22Q518MD1gRHlfAgWB1lHARD7PCrWJ3aL
	v853iTYPwvDg8x3vIJvV4lhLDoAMGhQu5tXbeC5Pb8fiPGYKoDQwdAAPZP8/fIrKb0O9L89esfzzp
	Hpe+umdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI2m-0000000CLb2-2eWv;
	Tue, 02 Jun 2026 05:52:04 +0000
Received: from mail-southcentralusazon11011039.outbound.protection.outlook.com ([40.93.194.39] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI2k-0000000CLai-2vFQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIZdKO3TpBgtvnRC9bseKde067fQKGzyFypgyiPRF9ssWJrhUaAm+tU4TsQrVr006SH997iCfuy4Cj06A2WaMr3BdS4fnajFWGCj6vdhTETGNBst9Jyv7mr1Ocx+RWdTIT9UeZmSqDVGZPka/gEzx7btoEoygUlk9D5kwuJ5VXgvNefDyWei5yIJbHNwiFRKCL41WWqKHP+FPEYv3Nl+exScOoZEvX3q+MAfhGThNOJM8BF5hNswzP4JW4x+QANUsVc5A533nDuyagCUX6gKy2i0XOpfjk4oF2rHPB7srO21rE6LYOHTQZGGK2WtMNZkQL8hdSy8R5ffwlXCKplz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiTQQWbU4B9jgXX8d2+E5sDmH3E61F31BLko8FFniD4=;
 b=ksH1tvhyb8/Y8ndn1d+PRN1YWI8bngn0BS3jTcLG5oKUb5QqkuZ8dhu+mF2eULYtioz5doDIqgWZno/cmxXeNI/YTJRSuk+eowCZD5PCPcJ+dll1Ol6fqrL61An8wHAmqVkmw+YEgtGhyMyQvam2MVLw33ekNkeKIzo9BvSlXPKgVZKCSOf7x2h7WiDzNyNxg24rTfLK1+AcDpC8J+6JHSThfBSEwp4FxnT5flr9eGvO1m//LpqL1e5lsSjH6zHzE1TJNrwx2rEyU1+yOh/XALFpGsJruQXh3EONnSket7dF5YWarJB091wIpFpsZnSjF32IVB8Qw4bmgHYa4xqbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiTQQWbU4B9jgXX8d2+E5sDmH3E61F31BLko8FFniD4=;
 b=butW9jhYLCRp7EZf6OF7lEhYXpTd5hpY+9hy+l3KUzz90pkZjErzdPJcwnEIxFATultcpgTY3RCXwGyqzypEWXKHRqw/xj9N2fqjOvDPBedZ0aOGbiAZV5qjylzG76EapuOEXK+W1IPSBeB4msg5VbEzHMpM7cqN+klsqSQdY+UbSPbmZFc7MNxCXhYUcDRQ2w3vadv9scIGr87cwgToc5mlyN0ZX6/BYJx0tGzP2dmn2dECWcZxjeF5Wk9p7A0I86MtzA0hkRkU2iUL8tA9mKlBdD4ehUSzL4i1LdTj9BV1KECM+4/2xVFyKMxyW+7dN37wpPMpxWCDTiGmx5T0UA==
Received: from DS7PR03CA0236.namprd03.prod.outlook.com (2603:10b6:5:3ba::31)
 by SA1PR12MB8858.namprd12.prod.outlook.com (2603:10b6:806:385::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 05:51:51 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::72) by DS7PR03CA0236.outlook.office365.com
 (2603:10b6:5:3ba::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 05:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 05:51:51 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 22:51:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 1 Jun 2026 22:51:35 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 22:51:35 -0700
Date: Mon, 1 Jun 2026 22:51:34 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ah5vZl3zcC6YPeZ5@Asurada-Nvidia>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <ah4isiGhSScKMotO@Asurada-Nvidia>
 <ah5VOE5vuEPwr4oQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ah5VOE5vuEPwr4oQ@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA1PR12MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a60d7ae-c282-4d18-f349-08dec06b0b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mk2p/mmRj6JIw1Loo9G369QyYTLh45vQD8SpG5F1VPpVO8MeEuReS/QViQlZq/hpH/7Bs6FdCdXqT7wtd7UP72ajI3N+oS0B9W8hLr2df0zX/hOoYmqrtM1248TGb15xk9KWhSZWzDoabEJbBG5IaS5ZHm8erp3hBZHQWcWSoTGmYOsT79LLwJUmIqhBYk2idg8ra8d/XaMHkSIwRD2POdX+//nFXWFsX6bxf3L/E0YegtVBPDQJ+VbyRhLZ5ZBR0bAQ0d+NMED4KManLEcXHcQNjMwwhE+246WPnsV5CvjoBmxY6V2WIPNuDA6qdBho2Gnv/AUDG0OkN61dwjVSARAU/VYZf8lnckqZVlmZikC+XHQ49xWsS+DEVcO8jw/YvnLEGKvrv5vwKmH20yIqsFdJRHyrUTrshSNGUPhbWZ0nny+yhjR2ogTbbwHxtrGVfTijwP6l/9hQvciZ76UlqSYUqnf8upIqLpQXtXhyqR+uOca+4Zs78LaKJRPeGq420jCHEbWUEvpSU5Fbi/BtcND08ndT2wC8gBnZI84Bt3wGEsIRjm2KrwVyx/UEyNxi4U8Nt0EspmPiMHvIRWdlG8shsYa3NuMT6zO14fSN6CX5KskXmb3uxQ9fEw3LX0QOwX/VjRI6u6yNThRMTq2jpwfEFMrg2WWuenJG+97v4I9VCp464ZLtjn8UvNa4BTxjhz0C8ttfq2a+uaRD/t5JcNxd+3louzZZssRHqaYFT5A=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QrSY9XX9twaeA764VT7zpM7OzwMjncnfP2jixA+WayPN2H0GwrXHIV8xflrQ44Ud8sKqZiCkFSwXiBNrtQRn/3bJWbEX7VozCgrxS9Zn2BBcgq7B93MXgWPx3gdxozVUwqRmFJiGWJuc/CHLSEKYXfiVqw7AJN3b/nx7O0xYZWij0zmvlBjDoDuYv6f3/aPlKksvRQbDLm75ppbsvZT7g8TvExxD0AteHPypcO2twboOFQRUcs+NO+6aoQhR7Dt3hn0EYo60Glc+ERXYUU6C0V0BL4nmeHXR9LFPLitvvXKsTONOYqaE6DTZ7DFXFCEdOz982xiOiUSu1WtGDEpp/+FRxDTUQ0v+k8Xe0l7joG19UGcmte5lWyOEq9uFmXq8r7E3km+0lbnXhqQ69igjGtHJgbJYSxRs3Wld0wTFwc9+F+ZwG/nQoHEZovUlW4hy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:51:51.0608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a60d7ae-c282-4d18-f349-08dec06b0b03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_225202_738678_AA8DCC6C 
X-CRM114-Status: GOOD (  16.04  )
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

On Tue, Jun 02, 2026 at 03:59:52AM +0000, Pranjal Shrivastava wrote:
> On Mon, Jun 01, 2026 at 05:24:18PM -0700, Nicolin Chen wrote:
> > On Mon, Jun 01, 2026 at 09:59:08PM +0000, Pranjal Shrivastava wrote:
> > > -static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
> > > +static inline bool arm_smmu_cmdq_can_elide(struct arm_smmu_device *smmu)
> > >  {
> > >  	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
> > >  }
> > 
> > Can it be named perfectly at the beginning?
> 
> Ack.
> 
> > 
> > And again, should it check Q_STOP in vcmdq?
> 
> I don't think so.. the primary CMDQ's STOP_FLAG should act as a proxy for
> the SMMU's global power state. Since all queues (primary and secondary)
> are gated synchronously during suspend after SMMUEN=0, and ungated before
> SMMUEN=1 (i.e.before the caching can begin). Checking the primary queue 
> should suffice..

Should leave a note inline to elaborate why we only check primary
cmdq only.

[...]
> We can also decide to drop the can_elide checks from invs_array and
> atc_inv_master altogether, leaving gerror & page_response the only
> remaining call-sites, both of which don't use secondary queues.

That's not true.. In the host mode, any command will be issued to
vcmdq. IOW, primary queue might not be used at all.

Nicolin

