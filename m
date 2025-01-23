Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3AEC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se3bOvcrvq31KhEuBVuvLUc1Dl5EyKru/hEWO5JfPSg=; b=HumG8OdKVKQFl8NKoz4fLLNn3X
	DcH7TuMaSGyT9f7GjNl2cD8djl8y7TAzJBjzmodk96YqrCc5/ZyjvpGpYE+xCVuel8743WA/2RG4H
	DIebKH7qtwFxZkesn7gKCuBBV2ZPVc+Plz9ssffrQtRR5egwce/0eixAVrsuu3WDOGTIQhLZz8OPv
	AxGKDUZl8U4sddJcyucPpOfvggrEwyGGEOdK9qre1qxsxKUlkDXP0VNrkykzL3a6MdLez1y/fhVL6
	KPTK4I9rj8vhtAC3hi2BmRR7TxIYPIYUHZ9KA7Lhzwfbf7S2Yc6KJ6DIvrtmYuiDCTOTRHot2cAdG
	vAsYT0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatCK-0000000C44J-2pK9;
	Thu, 23 Jan 2025 09:08:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatB0-0000000C3r7-1kmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:07:04 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ydw5q0xrkz1JFR3;
	Thu, 23 Jan 2025 17:05:51 +0800 (CST)
Received: from kwepemd500022.china.huawei.com (unknown [7.221.188.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BAF714010C;
	Thu, 23 Jan 2025 17:06:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 kwepemd500022.china.huawei.com (7.221.188.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jan 2025 17:06:51 +0800
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 23 Jan 2025 10:06:49 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org" <maz@kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "shuah@kernel.org"
	<shuah@kernel.org>, "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "yebin (H)"
	<yebin10@huawei.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"shivamurthy.shastri@linutronix.de" <shivamurthy.shastri@linutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "anna-maria@linutronix.de"
	<anna-maria@linutronix.de>, "yury.norov@gmail.com" <yury.norov@gmail.com>,
	"nipun.gupta@amd.com" <nipun.gupta@amd.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>
Subject: RE: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
Thread-Topic: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
Thread-Index: AQHbY9mJD8uWl8wEh0eGXlblGWaZErMkIJUA
Date: Thu, 23 Jan 2025 09:06:49 +0000
Message-ID: <4946ea266bdc4b1e8796dee1b228bd8f@huawei.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1736550979.git.nicolinc@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_010702_780321_48EDFBCB 
X-CRM114-Status: GOOD (  28.43  )
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

> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Saturday, January 11, 2025 3:32 AM
> To: will@kernel.org; robin.murphy@arm.com; jgg@nvidia.com;
> kevin.tian@intel.com; tglx@linutronix.de; maz@kernel.org;
> alex.williamson@redhat.com
> Cc: joro@8bytes.org; shuah@kernel.org; reinette.chatre@intel.com;
> eric.auger@redhat.com; yebin (H) <yebin10@huawei.com>;
> apatel@ventanamicro.com; shivamurthy.shastri@linutronix.de;
> bhelgaas@google.com; anna-maria@linutronix.de; yury.norov@gmail.com;
> nipun.gupta@amd.com; iommu@lists.linux.dev; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> kvm@vger.kernel.org; linux-kselftest@vger.kernel.org;
> patches@lists.linux.dev; jean-philippe@linaro.org; mdf@kernel.org;
> mshavit@google.com; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; smostafa@google.com;
> ddutile@redhat.com
> Subject: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with
> nested SMMU
>=20
> [ Background ]
> On ARM GIC systems and others, the target address of the MSI is translate=
d
> by the IOMMU. For GIC, the MSI address page is called "ITS" page. When
> the
> IOMMU is disabled, the MSI address is programmed to the physical location
> of the GIC ITS page (e.g. 0x20200000). When the IOMMU is enabled, the ITS
> page is behind the IOMMU, so the MSI address is programmed to an
> allocated
> IO virtual address (a.k.a IOVA), e.g. 0xFFFF0000, which must be mapped to
> the physical ITS page: IOVA (0xFFFF0000) =3D=3D=3D> PA (0x20200000).
> When a 2-stage translation is enabled, IOVA will be still used to program
> the MSI address, though the mappings will be in two stages:
>   IOVA (0xFFFF0000) =3D=3D=3D> IPA (e.g. 0x80900000) =3D=3D=3D> PA (0x202=
00000)
> (IPA stands for Intermediate Physical Address).
>=20
> If the device that generates MSI is attached to an IOMMU_DOMAIN_DMA,
> the
> IOVA is dynamically allocated from the top of the IOVA space. If attached
> to an IOMMU_DOMAIN_UNMANAGED (e.g. a VFIO passthrough device), the
> IOVA is
> fixed to an MSI window reported by the IOMMU driver via
> IOMMU_RESV_SW_MSI,
> which is hardwired to MSI_IOVA_BASE (IOVA=3D=3D0x8000000) for ARM
> IOMMUs.
>=20
> So far, this IOMMU_RESV_SW_MSI works well as kernel is entirely in charge
> of the IOMMU translation (1-stage translation), since the IOVA for the IT=
S
> page is fixed and known by kernel. However, with virtual machine enabling
> a nested IOMMU translation (2-stage), a guest kernel directly controls th=
e
> stage-1 translation with an IOMMU_DOMAIN_DMA, mapping a vITS page (at
> an
> IPA 0x80900000) onto its own IOVA space (e.g. 0xEEEE0000). Then, the host
> kernel can't know that guest-level IOVA to program the MSI address.
>=20
> There have been two approaches to solve this problem:
> 1. Create an identity mapping in the stage-1. VMM could insert a few RMRs
>    (Reserved Memory Regions) in guest's IORT. Then the guest kernel would
>    fetch these RMR entries from the IORT and create an
> IOMMU_RESV_DIRECT
>    region per iommu group for a direct mapping. Eventually, the mappings
>    would look like: IOVA (0x8000000) =3D=3D=3D IPA (0x8000000) =3D=3D=3D>=
 0x20200000
>    This requires an IOMMUFD ioctl for kernel and VMM to agree on the IPA.
> 2. Forward the guest-level MSI IOVA captured by VMM to the host-level GIC
>    driver, to program the correct MSI IOVA. Forward the VMM-defined vITS
>    page location (IPA) to the kernel for the stage-2 mapping. Eventually:
>    IOVA (0xFFFF0000) =3D=3D=3D> IPA (0x80900000) =3D=3D=3D> PA (0x2020000=
0)
>    This requires a VFIO ioctl (for IOVA) and an IOMMUFD ioctl (for IPA).
>=20
> Worth mentioning that when Eric Auger was working on the same topic
> with
> the VFIO iommu uAPI, he had the approach (2) first, and then switched to
> the approach (1), suggested by Jean-Philippe for reduction of complexity.
>=20
> The approach (1) basically feels like the existing VFIO passthrough that
> has a 1-stage mapping for the unmanaged domain, yet only by shifting the
> MSI mapping from stage 1 (guest-has-no-iommu case) to stage 2 (guest-has-
> iommu case). So, it could reuse the existing IOMMU_RESV_SW_MSI piece,
> by
> sharing the same idea of "VMM leaving everything to the kernel".
>=20
> The approach (2) is an ideal solution, yet it requires additional effort
> for kernel to be aware of the 1-stage gIOVA(s) and 2-stage IPAs for vITS
> page(s), which demands VMM to closely cooperate.
>  * It also brings some complicated use cases to the table where the host
>    or/and guest system(s) has/have multiple ITS pages.

I had done some basic sanity tests with this series and the Qemu branches y=
ou
provided on a HiSilicon hardwrae. The basic dev assignment works fine. I wi=
ll=20
rebase my Qemu smuv3-accel branch on top of this and will do some more test=
s.

One confusion I have about the above text is, do we still plan to support t=
he
approach -1( Using RMR in Qemu) or you are just mentioning it here because
it is still possible to make use of that. I think from previous discussions=
 the=20
argument was to adopt a more dedicated MSI pass-through model which I
think is  approach-2 here.  Could you please confirm.

Thanks,
Shameer




