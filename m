Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594DED7495A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJWMssJ/Q+/91OnGV38k9jXgxPwQ5XSXZB4E1kzlKg4=; b=YKNAaTYyWNq0jXSqcUtFHbK5FY
	vXuQ1KUucjSXYXARa5IViuAaEHLhWMwMUbJ3s33lot7zyNo0TgheoR8R87wjNiiQE1QmyNhTnmnRv
	JRDVNIRVE1w20D/RWSdAZUQMD2E2O+YR5sLJFu0x0SP+wHRk365fMl1sEbAZ34VWF+C9hQwtjFA0d
	2aTpHwdoMP37k/jOl6X6olyDOvRhuxeepM7ay8InfbX7BPVJY+zOq7Ci7QtFfNYvVJSWZTldYGk4Y
	V9qJuhmlujiZIWKH6FMSEgfDLDbmxUesJVvT9sLQCi8I+gCLm2jjGJgYT0y9GkN4MRB+glMsPOr/Y
	7h0wX6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zzL-0000000Ge17-2dLA;
	Wed, 30 Oct 2024 04:07:19 +0000
Received: from mail-dm6nam10on20605.outbound.protection.outlook.com ([2a01:111:f403:2413::605] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zxh-0000000Gdp3-0YcN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZogCzycnlsFWVPZr3SIh9s8HRVrvOTFbc+ug8o8u7AATk+9bhsUjDZYhcJenGfkJq7vS1R/LE7hHeM/ffVgeqC0L70QsrVpnQEpGc4gRSxeRSZqvTvQ2ZOo2rCR+8x0+QArR2/jlrnnD1vBz4dy3OpkBDzo5De9mG9qnCwbfx8lBOqJshmKowDOg1GGc4oSOVa45C39L3XKdN/MfhF+utPKFHP91+LLRFNRpHUO458TD0thPLm/siFv9cPBA8oBdEez95UE8W/pyxLWq4fwBhUjvhpUFY1hiBhjRKoikxE1uZ9Z32XWS/lNx8wHBZU+quPDA7vzh2bDHa6D2k8UwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJWMssJ/Q+/91OnGV38k9jXgxPwQ5XSXZB4E1kzlKg4=;
 b=KCcR7yzyfCy9xWmHL2XqaruSEiU/YNoHDA/J6Acuot/goRjkuCT7swpTPfJkM/d2zH0OSzL6wPgOWnzhH3dR6AW5JLd+OxAQ6Rjpwz85Y0m+SMeyFZ724K3QXSz5VwPiFWt6wropV57BDxztF6DNyxyEEDt3cZDaWbzLdAhuhwKj71c8nWsH+4sB51NN3hHGSTy9ZPqegO0gXvr6vwFuivxuxpTZWzt8FgQu/ELkb6gfz5aPQRhPBKZRKRHmu7lDGDpmfwQVorJnoJndovpFPLKqh/4+x81MasMFKO/WSYje9LTNtAMfP2xoajFY/a9Bpym6MllfRPpOq11sAw73vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJWMssJ/Q+/91OnGV38k9jXgxPwQ5XSXZB4E1kzlKg4=;
 b=BmoWAwBnG5w3V9oqMUmjgQUBiE5bOjKzU1zpUaET/idEld1ZzvONWLwQrC1IGp24EDWLossrVT8qRR7YiJm4QsANHys/o27yeOjIzBSf7WAeusyACyJr9W3pEEmLT8xiIVhSJxpudBy/s2fHWe1BVmaCCVCtFdJQ9XL65/vXwLQ2DAbsbCHJVnv2PFRweMeOGlTBsDdkEfZoRPueiRovvcgC9vJwCpJy1LmluCn/PFZQ0lfwBa7i8hgi/SScK7nRGF8fj7cRphQ53OsDLVE1ult6Sy0BCB+aALXFbx0EwcX81zOnikcIfC4r01TyE33eru2EhJ8kUI/KYzqEqGbVeA==
Received: from CH2PR05CA0051.namprd05.prod.outlook.com (2603:10b6:610:38::28)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 04:05:26 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::85) by CH2PR05CA0051.outlook.office365.com
 (2603:10b6:610:38::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.14 via Frontend
 Transport; Wed, 30 Oct 2024 04:05:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 04:05:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 21:05:17 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Oct 2024 21:05:17 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Oct 2024 21:05:16 -0700
Date: Tue, 29 Oct 2024 21:05:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <will@kernel.org>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <aik@amd.com>,
	<zhangfei.gao@linaro.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 03/13] iommufd: Add iommufd_verify_unfinalized_object
Message-ID: <ZyGwemWwixBA+VIh@Asurada-Nvidia>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <e99946ea0128370349373c94339d465397946137.1729897352.git.nicolinc@nvidia.com>
 <20241029144907.GB209124@nvidia.com>
 <ZyEKvcpgUsS1nCEg@Asurada-Nvidia>
 <20241029185558.GZ6956@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029185558.GZ6956@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc2ede6-c6fc-4393-121a-08dcf89815f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3d3l6xe8v/8ksQgJ5J2EMOUVAoeeJxNQ902m+7ukIvPxJPf56zL0oBx9gyuf?=
 =?us-ascii?Q?Vp+eUVWBOGwHGzcWt/qcYGdJRxZ1+LBS7Q9tqgsn1NHDayxnLRDNfTA1QQic?=
 =?us-ascii?Q?fBzl05G4a318Js/COMNX7tCht/evk70IoXk/AgvRwqvU0p+Bs9l6C9NqV6oR?=
 =?us-ascii?Q?O8VAchGWwVDADxHkiV7ZlkmFnxJTAdj/fsI9NeR26wfNojxduZVE1wipIiXH?=
 =?us-ascii?Q?Jap2a8jUQob/awXxT8ZpGsf+UWIEvcuuQXSjinnIqNzL6QRWo75ThBVuCu5j?=
 =?us-ascii?Q?E1FPlkBilzl1YWemfaKV/IgBxmNd+SeflRgDUIOsxiSBShh86K6c/mwe+bT3?=
 =?us-ascii?Q?cVuipU3qDvunSo1zQi/E+YMki2SYqEKlRTGjH8LodQRnjweGhVJh/RHYKyxr?=
 =?us-ascii?Q?avwPRcpLoY870li30fSM0IypUEJRRnTuReHUALITy4201frPTiFV3p8L+GvY?=
 =?us-ascii?Q?jjMdyyN1p6BlxltMTm1Ht5DmAgDXOZm9hOsR+XHmu8j00+iQPKdr+IUqcmeQ?=
 =?us-ascii?Q?ibr0C1fL7sRAKsJPkkBBrx3Xv3PMvIn3WxJKvRsJUyILWEzJMoIXKFWv+EAf?=
 =?us-ascii?Q?27552FcLWw3o+717hsux3q4RwcMuPb3CHKq4y47co49GttKH9iLE0kl9BA2k?=
 =?us-ascii?Q?+G/2ZqMZctCsS7lwA2k/JiSNrdUucypDKk7OymKAH7EUzTxT1rBSQVbuUB88?=
 =?us-ascii?Q?6B4Id6Mpt1OYAvUEotQ5LodWHp1iL9oXBg47TU2oZ2DTqP+0bbUtEVRPIGtV?=
 =?us-ascii?Q?ruPqn69d5OdhqTKgqnNo2V/lyaTOYUeQAATruSbMIh8SLifgAMoe0pfes8BM?=
 =?us-ascii?Q?AsiV2jr4wozc1rCe4T4I/eYSbs8jAw7xU9DALvZQlXO6gHMVAG6mMx4Hfiro?=
 =?us-ascii?Q?YbcSfw9yyAUvpu6bPSxCqXebmLhWUXwpCsQkufSdKWgTKlxvBbKncoztOAYA?=
 =?us-ascii?Q?UxZV1aFPI2SgwA6Uv4fupH35rSJSUseL/Prz9j9SlqPGR488728vlx2QKNTm?=
 =?us-ascii?Q?xTzA9NNcZJsEulkRsgA3xSdSb/9fHl3bcKzrPxgaSE9dfE4N1+ViAsJdHZ9N?=
 =?us-ascii?Q?nsCUEleWg+tiODbi1Hm7IbgW8qL4RR3kKZ1R4ziDqV8NFiNZ4UvyUUMhpvm/?=
 =?us-ascii?Q?DmakgD6x3mGNFTxI+pTnjZuz2eDqtBhlGgLrcDtUKk41Hk8G1Vy8nMjPRuQW?=
 =?us-ascii?Q?7HWB3/4wRKp3nLyr6g4/ryWjhyBySgi/+HjwAXENzgxrF+XkKALdFphNe25J?=
 =?us-ascii?Q?qcfOCakD+oNRi6tb+JXcnAm2jR3mNy7zTq70jkqFCu5cJfHnfSZHLxd/1j1t?=
 =?us-ascii?Q?bXidIRlNz2Rc5B8FGcnfgtnmomfXs1BgkpPe5saIlS8tY0oGtWRw7ikuzoCb?=
 =?us-ascii?Q?OE7JFJ1axHXgqZLRn3GPG2bIiew78pb3J4uo2SPq5zSWNe2VjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 04:05:26.5879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc2ede6-c6fc-4393-121a-08dcf89815f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_210537_216040_D0D66D1E 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, Oct 29, 2024 at 03:55:58PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 29, 2024 at 09:18:05AM -0700, Nicolin Chen wrote:
> > I think we'd need the same change in iommufd_object_abort() too.
> 
> Makes sense

I found xa_cmpxchg() does xas_result to its returning value, which
turns XA_ZERO_ENTRY into NULL failing our intended verifications.

So, I replaced that further with xas_store:
-----------------------------------------------------------------
@@ -41,20 +41,26 @@ static struct miscdevice vfio_misc_dev;
 void iommufd_object_finalize(struct iommufd_ctx *ictx,
                             struct iommufd_object *obj)
 {
+       XA_STATE(xas, &ictx->objects, obj->id);
        void *old;

-       old = xa_store(&ictx->objects, obj->id, obj, GFP_KERNEL);
-       /* obj->id was returned from xa_alloc() so the xa_store() cannot fail */
-       WARN_ON(old);
+       xa_lock(&ictx->objects);
+       old = xas_store(&xas, obj);
+       xa_unlock(&ictx->objects);
+       /* obj->id was returned from xa_alloc() so the xas_store() cannot fail */
+       WARN_ON(old != XA_ZERO_ENTRY);
 }

 /* Undo _iommufd_object_alloc() if iommufd_object_finalize() was not called */
 void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj)
 {
+       XA_STATE(xas, &ictx->objects, obj->id);
        void *old;

-       old = xa_erase(&ictx->objects, obj->id);
-       WARN_ON(old);
+       xa_lock(&ictx->objects);
+       old = xas_store(&xas, NULL);
+       xa_unlock(&ictx->objects);
+       WARN_ON(old != XA_ZERO_ENTRY);
        kfree(obj);
 }
-----------------------------------------------------------------

Thanks
Nicolin

