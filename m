Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB86EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2YBZTCRYvPOQxiRc/wVZYr3C32+UIwgidP+l4Ee0Qk=; b=c6l9Rg5rQeUL3mcURhFM8ucGLm
	vvAXVJFublceZyaPnIQzoj8SvtzPLrs+q2Yu2tXkIxiuAMVyxjfFFlZ1IdusBg2ovUQYx3qW08HYH
	0nkpEX0VwueTExMdcb8fhfUHV5qsuEVaaR/cbD4jWiKP/re8HFwu/cYTLLf/cdiLuWrUtj9m+j+57
	QnxbMa9gC1T6JIZzTZDFyF2gdJixhErVy4adrWP5WnaIgPpuhSKg8Fc1EZ3dUOWz7GigGXBFPVUA/
	SQTbtvtrmP0MtfkhpbIqFgqC8o6isuFHPXCm1khLoJd3q6dPT0KEwMuwXNP7hGQ2lVdzDckTqdE77
	ci4vqrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tplXf-00000007anE-3KBK;
	Wed, 05 Mar 2025 09:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkSk-00000007PoE-3iVR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N2YBZTCRYvPOQxiRc/wVZYr3C32+UIwgidP+l4Ee0Qk=; b=F0gjD24AqiXiU3EqcxCo+vNwC+
	AGWkXaSs0dBXwYQsyZ1oXFwt1ZWLMjpmw4G7AQDtjkKg7/wDT5dfcj7Ps3bDwlpeBuEyu72Jx30Fx
	szUOAyD3u3Qh6Xk19etvsl2YjsljIxHX7h2b20ROnVUzaDDnFXSdxVTYzprEplZY/H6bvCK5cSIiH
	nplzen4ZdrmtthG5dmgogqhxI+GhQH/qHotQOby8eirlmDttfuaZw4bbd7Jnh9LzIZzPCOBudZSGr
	U77NEbRaxMCGdlAHk/hpUC6fjo59zQxqbIOiIvpfcHzERj2M44GzMQk3MTmH9jWmsf9SHbIozR6Um
	N4QSAJag==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkSg-00000000QVc-204K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:50:44 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z75mV2Phgz6K9RV;
	Wed,  5 Mar 2025 16:48:10 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3AECE14011D;
	Wed,  5 Mar 2025 16:50:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 09:50:17 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 5 Mar 2025 09:50:17 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>
CC: "joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Thread-Topic: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Thread-Index: AQHbjYw6xgWAQwMkG0OYeMfm+TEXTLNkOtMw
Date: Wed, 5 Mar 2025 08:50:17 +0000
Message-ID: <a95b39a55c324907a7001d3a2cdf076b@huawei.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
In-Reply-To: <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_085042_723994_EBD169D9 
X-CRM114-Status: GOOD (  17.72  )
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

Hi Nicolin,

Thanks for sending out this series. This might as well help me to rework my=
 pinned KVM
VMID series here,
https://lore.kernel.org/linux-iommu/20240208151837.35068-1-shameerali.kolot=
hum.thodi@huawei.com/


> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, March 5, 2025 5:04 AM
> To: will@kernel.org; robin.murphy@arm.com; jgg@nvidia.com
> Cc: joro@8bytes.org; linux-arm-kernel@lists.infradead.org;
> iommu@lists.linux.dev; linux-kernel@vger.kernel.org; Shameerali Kolothum
> Thodi <shameerali.kolothum.thodi@huawei.com>
> Subject: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
> arm_smmu_make_s2_domain_ste()
>=20
> An stage-2 STE requires a vmid that has been so far allocated per domain,
> so arm_smmu_make_s2_domain_ste() has been extracting the vmid from
> the S2
> domain.
>=20
> To share an S2 parent domain across vSMMUs in the same VM, a vmid will
> be
> no longer allocated for nor stored in the S2 domain, but per vSMMU, which
> means the arm_smmu_make_s2_domain_ste() can get a vmid either from
> an S2
> domain (non nesting parent) or a vSMMU.
>=20
> Allow to pass in vmid explicitly to arm_smmu_make_s2_domain_ste(),
> giving
> its callers a chance to pick the vmid between a domain or a vSMMU.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 2 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c    | 3 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 6 +++---
>  4 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index bd9d7c85576a..e08c4ede4b2d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -887,7 +887,7 @@ struct arm_smmu_entry_writer_ops {
>  void arm_smmu_make_abort_ste(struct arm_smmu_ste *target);
>  void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
>  				 struct arm_smmu_master *master,
> -				 struct arm_smmu_domain *smmu_domain,
> +				 struct arm_smmu_domain *smmu_domain,
> u16 vmid,
>  				 bool ats_enabled);

Now that vmid is an input, do we need some kind of validation here as
at least vmid =3D 0 is reserved I guess for bypass STEs.

Thanks,
Shameer


