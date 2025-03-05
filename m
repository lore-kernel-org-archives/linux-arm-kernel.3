Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7040FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvglWhkHr7rJF85+NC7SMwO2zTb/k3wTP1xZMH3AMEU=; b=QMOvH/7HONu93MBe6Jt0fPJ0Tg
	Nz0boMeaiBa96cIn+lbjmQK9NyOmEK6zje4yeCiOsI/Js05stAcyOH7C1wBiYAgpFrkc8jRHWXUA1
	d52s1s3NhB2BgQOPq9IvArXSU15YEj5gKUlfU05mQrDxjTbsmhDPicKfpKES2fyRPmkigR08Qt6d7
	WFvAXIIf3YvcHl4twx0j1VqJwruo+UH+sSIoYF41tdAA2cfaq0P4lNsufH7hag6RMJcf8T6Sbhyr0
	vtisutEy0NecyWv7tJbyUe1JwoWEZGXP6rxjrE+RgHBk1utsN+9MCb8DJguK615dGun0a1X1WC1bw
	UQkVq5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkkJ-00000007SzK-1EcB;
	Wed, 05 Mar 2025 09:08:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkdi-00000007RXT-3W8o
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 09:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HvglWhkHr7rJF85+NC7SMwO2zTb/k3wTP1xZMH3AMEU=; b=Zck25UCpsRB4kfqnPPOzCL+5CV
	u/owmbQYQ6OqW3lvzTmubYmIpdtb/FEIJPLyFy1Rxx7fOA1/XctlM5guXe+3s2gZR6J398nrg0K9e
	yKr2UPrq4Wifny22r4QeCstxtFUTG1nqLA5X6y20bbzlDhCkMOhtfwDcFa38m8fWLu/KnC6lYU44m
	reMF+1YgkP5f4NXzP9xCOvNxQGW+sWVOeGS1gbRVCyrI0TSyUaTiO70mBscwXbn6IK17zFRa2t+Db
	fKD3DiGO59dMzvKgUDg/LWyUtMXroDXZp0bnNuJuLivwArCBkdVKngFoh2Pof+AGUunvwvi1ckRu1
	gzLYYFZA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkdf-000000059CW-3wNT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:02:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z761V0THHz6K9SH;
	Wed,  5 Mar 2025 16:59:26 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
	by mail.maildlp.com (Postfix) with ESMTPS id F119A140A08;
	Wed,  5 Mar 2025 17:01:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 10:01:40 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 5 Mar 2025 10:01:40 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>
CC: "joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 4/4] iommu/arm-smmu-v3-iommufd: Allow a shared
 s2_parent to allocate vSMMU
Thread-Topic: [PATCH v1 4/4] iommu/arm-smmu-v3-iommufd: Allow a shared
 s2_parent to allocate vSMMU
Thread-Index: AQHbjYw+IgurA9LM5k6RyZlCF36C1bNkPq7A
Date: Wed, 5 Mar 2025 09:01:40 +0000
Message-ID: <1b51a7f7bfc0419b8941cf7ee0601b70@huawei.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <564eda8dee4bbf4c6e1d1dd9ed6bd40cc1a2df26.1741150594.git.nicolinc@nvidia.com>
In-Reply-To: <564eda8dee4bbf4c6e1d1dd9ed6bd40cc1a2df26.1741150594.git.nicolinc@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_090204_001188_EA53A95A 
X-CRM114-Status: GOOD (  12.87  )
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



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, March 5, 2025 5:04 AM
> To: will@kernel.org; robin.murphy@arm.com; jgg@nvidia.com
> Cc: joro@8bytes.org; linux-arm-kernel@lists.infradead.org;
> iommu@lists.linux.dev; linux-kernel@vger.kernel.org; Shameerali Kolothum
> Thodi <shameerali.kolothum.thodi@huawei.com>
> Subject: [PATCH v1 4/4] iommu/arm-smmu-v3-iommufd: Allow a shared
> s2_parent to allocate vSMMU
>=20
> Now, vmids are stored in vSMMU objects. So all vSMMUs assigned to the
> same
> VM can share a s2_parent domain. This means a vIOMMU allocation per
> device
> behind one SMMU can be given with a s2_parent domain that's allocated
> per
> another device behind another SMMU, i.e. s2_parent->smmu !=3D master-
> >smmu.
>=20
> Remove the validation line to allow this use case.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 2c5a9d0abed5..9bfa5fa5bafa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -378,9 +378,6 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct
> device *dev,
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
>  		return ERR_PTR(-EOPNOTSUPP);
>=20
> -	if (s2_parent->smmu !=3D master->smmu)
> -		return ERR_PTR(-EINVAL);
> -

Not sure we can just relax this like this. What if the two physical SMMUs a=
re different in
functionality/features? Do we need some kind of sanity check here?

Thanks,
Shameer


