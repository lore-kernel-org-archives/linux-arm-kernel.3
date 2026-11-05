Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F87606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=anRUtSMi;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bTzsEVYT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sDFnvWXoTLa7Xv+J+Wo7o9EMgLKRLzK4PjIEz6OwDp8=; b=anRUtSMi8ktOLA1puZeR/kCwOT
	WwAEybOUW62cx1nLVDSvuDRoShwasXggDodRptHeR6DcmUWYhA4w/1vNEKrYcGwplTBVJYRfpLRfG
	dg2wjTCh/bNvNG7OYPsYJ6tgYj/+Fa2ZSpVmZH7n4JNQcYvBK6M4aA+xvNXyoSiQvTzK66CqSx+WV
	VTat2WDCRYbwBaN5HXUR7dp86k4nUy6/uQX5yXquZmYmL/jpUp3UXcN8I+uts/ZhWRq+0GUOFtYd7
	WUVD1lumhDJ2Wv+5o23dJly+xsS8AySCnBKLbvW7o8XjXpPnrk5LBCdcgcZifQ0uFzsus2ynxdqX9
	5irWL1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7Ix-0000000Ateq-15DY;
	Thu, 05 Nov 2026 23:55:39 +0000
Received: from mail-centralusazon11011033.outbound.protection.outlook.com ([52.101.62.33] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7It-0000000AteS-1ccm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:55:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waHuH6kgLty3XWnG04fw7gX++nc+mGsj4xRHADE+ex01Y1TE9cS2SOH18S/h09y8eZ2Ly/gnFZvuIBwV+Tc27WUWFqtq6YnaqV4fLWhABghCS92M0NZqeuUeZy2LhTxpjV1Aia0Mv73n7bbIoEzr0+QpVGBb3tGkDqH/QdojT9gcecGEkfHLCXzVXkujGRJ53BzciWfjSKP93TUj+phrss0LvaJ7f7WdU4IuY1k0irtiMytOCdwbjo6NhxI72Zy6bb6MIvmi1l++omMLhDpD34FPxdwxq9V4T8xWW2VhUuMJKTzYcdUSn7Sr0foivqAC58ZnCLL58wEod3dx6wgadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDFnvWXoTLa7Xv+J+Wo7o9EMgLKRLzK4PjIEz6OwDp8=;
 b=MQo2X9MKk1i0j84T4aLKo6+oaaIB5l8QOwAXlPFoqImgBUJcsBTsWBI6YyYAX+cCupq22ivmrHa9sWjNWX+g9O5e1fGJCJ1EndqdUdMnHbk/XszhzXXrnzJ7rg9VXNOCQQyNip/7iXjOsDAuRcQSuUtgpyaUCsWv0zd0RR2I6mc5xbuWkAfwHN60gHcM57yxHRhmo7q2BmEg/jqlHTW20CmwMnb0eK3n/ESGWPUGd3Fpgk8cX9d+uwR3FAd0NmKwtLQGZd967HOkMu4+sirIPmji+lbnRtWAQbazhnQsAROba5YFB4xdC7dIJoLV8JQ1FQkf+oj0sc5MKATm51pBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDFnvWXoTLa7Xv+J+Wo7o9EMgLKRLzK4PjIEz6OwDp8=;
 b=bTzsEVYTrXuzFDa248wCQBq5NC54mZ9wyl2QiXLPtukj0cLfHfIEkMNqHUp+rE9gCjbZirOUXCdZZ3mhzJUqx0RdYElQoYPAuamMM/GEMUFhMdNnRE823ivC7Trn7SxVzenWoFm/kmtz6yPDsdtVn3yrE5oudh6yV6fCz5vB2Qeos9EACYnP27JlU8g27GyxGkdw+4prNCc9BmSPB7koJKBct0fs6bTeKPAr/U9AWibWpWcyKH7cDU1O3ILuLp8IIqC3g08xKMB6nkM+tnaES6p6XjRKopFqtxs9M+FnGR7icDcuUWi7aDUhGZpUH82wfjJYyLduRJBOj/1xdVr6TA==
Received: from CH0PR03CA0422.namprd03.prod.outlook.com (2603:10b6:610:10e::19)
 by SACPR12MB275847.namprd12.prod.outlook.com (2603:10b6:806:549::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:54:30 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::ad) by CH0PR03CA0422.outlook.office365.com
 (2603:10b6:610:10e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 23:54:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 23:54:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 15:54:18 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:54:18 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 15:54:14 -0800
Date: Thu, 5 Nov 2026 15:54:12 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <au0XJPD81XkBgpyF@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-15-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SACPR12MB275847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1388204c-89a7-4123-8bb0-08df3b9821dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|11063799006|4143699003|56012099006|261102123227099003|261021121427099003|261026121527099003|261021135927099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: bXaOEGvFBm5oaRz85gfsYGQshxqbmqDfSobRKK+G4/UQfuonc+IqllFgJBisOLj3W3z0f3GKD1oZXvo2E7iDcAXMFUrvhg20SznvzVMSVB2uYj/F37F5zIQr7vX5wKHJgVfVQDewQl1lLXeV8+oQ/egi7zIJM1hFX1t/GcyFLQutMu0p8250U5vzRHBLdP6S2zIxsBwQC3+sJk5J6ZHtqh6z1fma0qDgAaagn9ww56yrrZPuCyXWjSB4ea8eXlDwSn/pj+OmAzPyoAmoCOZN4mGsj4wLJirLJ5enom/rZryZxu3/xUihrXCrH+0CR/4RSILo1lQM3tREl3ysFrwPiqX1DAvWrrkOfMSf9Vagr+EHAu3om6iaPgkpbyIH8DyjOkTrx9pKsu9KyXxO7oV+6CVnL/B4qsj6Z3UgJ/koCAzZIasV0WMlW4ujEEqPs2poCtuKxJcSD3kaKSDMaaiBFigPksXyaFlYEKtP6mMO49O/WIDgb9M6B9a2SPe0/uE8xOpkYaK4gGDi1/kDIn/lXuspXbhgsKqB34FI6JMV0Oa4GEMjeR9ZyFgUaIPKhUGo/fVYueYyTb6lHE/0EWx4JdIySLt7CT0wXJuFZ5nogqlN2v+u71WYzgUnxiJ69sj2r3yyAqwrTlTyT61DNGqeC7UPEEtkrRY+FEL4lZyZExhg6CaXDVetwC7q9k4oWWvxLpKdzfuYBpC3hN0o+hd8yw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261102123227099003)(261021121427099003)(261026121527099003)(261021135927099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Nusorx8oNSwZhRq6x7omkLmH4DDLHNbC5xlMRh+hE/Q2VTz7YOdtPjmq8nQ/K16DWJFLIMzb+BUT+grXZm21yJ89wAZB3PpXwVMbYpeeFtOFe7dF+WEVJbnbTqzQeA1tmM6emIdN/aurInwa6LwIlQlwIUOFHF7OhBFsM565VHqoFntPKvLvByCZ8dZJ+SSFaOnc3557BD/itZ7oTBWF5jxzjsEhq3N4NXGUYaos0jM+M4rVaECd5bZ0AI22VSI+BLjMqzaswAngkYX0MhxEwByoIEaCVwS//PJxtC5U1Z/3J68kUHVUcX3Ha12MSYiAzJkMlxoj9Cb2uocBqEzLIQtoJve4NZQOD426G3Ck5yvh38bWtPdjb/egPoF8T+MJxQzBO1rklaY05WXGE1buMWaR0LvVCGVK4YNR7b7h0Y9E60GdICA1qYZ4d7UGbadx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:54:29.7926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1388204c-89a7-4123-8bb0-08df3b9821dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR12MB275847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_155535_453896_F168C1FA 
X-CRM114-Status: GOOD (  18.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 08:08:45PM +0000, Mostafa Saleh wrote:
> At boot, allocate a command queue per SMMU which is used as a shadow
> by the hypervisor.
> 
> The command queue size is 64K which is more than enough, as the
> hypervisor would consume all the entries per a command queue prod
> write, which means it can handle up to 4096 at a time.
> 
> Then, the host command queue needs to be pinned in a shared state, so
> it can't be donated to VMs, and avoid tricking the hypervisor into
> accessing them. This is done each time the command queue is enabled,
> and undone each time the command queue is disabled.
> The hypervisor won't access the host command queue when it is disabled
> from the host.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

With some nits:

> @@ -23,6 +25,15 @@ static size_t kvm_arm_smmu_cur;
>  static void __init kvm_arm_smmu_array_free(void)
>  {
>  	int order;
> +	int i;
> +
> +	for (i = 0 ; i < kvm_arm_smmu_cur ; ++i) {

s/ ;/;/g

> @@ -158,6 +268,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  		break;
>  	/* Passthrough the register access for bisectability, handled later */
>  	case ARM_SMMU_CMDQ_BASE:
> +		if (is_write) {
> +			/* Not allowed by the architecture */
> +			if (is_cmdq_enabled(smmu))
> +				break;

Sashiko reported the same WARN_ON issue. You might want to confirm.

> @@ -170,9 +288,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  			break;
>  
>  		if (is_write) {
> +			bool last_cmdq_en = is_cmdq_enabled(smmu);

Maybe cmdq_was_enabled (local) and cmdq_is_enabled (helper)

Nicolin

