Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A409CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qveqGFW5pGyJ7y2OX1FRu6tdbioQt3jxiHxeuavlPwY=; b=S6zyn1WevGsitHiz/fAhyyu+0N
	JEAOuL1usm+3X7NegnyNVeBVcozZtLz1mRkizCyISCGoyMiRgDAe4lmULnm/A0dxBwI2QbQbzbUMN
	1CT31tQcSoLSCcW80CXZupm+OdwMMZdgUPzprYDqhIn5raG2futl1TzpicRsReIDRrBSeeciIEte5
	tIouJDSnctR0sg8y1qpVwbSSPk+Ma0HRcTjwXlez9W47q2BBqqVEpYWx9tjc59VUIa9C6TYJ1ZuR2
	1wi0B0l7OrYLXVwS1U5eyfv4qeJts2lbd3D3r4gFsmO60sDh/sPKEKO8IzJgi4D7Tk1dYl4zEsHyR
	qsmVgnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKhw-0000000Cad4-2wOI;
	Tue, 02 Jun 2026 08:42:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKht-0000000CacF-1Gm1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:42:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 956F140536;
	Tue,  2 Jun 2026 08:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492221F00898;
	Tue,  2 Jun 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389760;
	bh=qveqGFW5pGyJ7y2OX1FRu6tdbioQt3jxiHxeuavlPwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XwnoCysDcNG1KCQFwSSgBb4aFrAh4/cT4FyFsLCPS/5U4WIWHkJLlonJuxj4XRIzC
	 ymgRDIVnrW/1n4NB9VsUnH6mu/tWhAzGrg17dtau2NXTRYgVJA8TOPUntLJ/kBqEro
	 WhvVFrNT0kSfFvWTIxO7iuilwiKKBYvK3amo9Nw52YN6uIbOauhrRIu5i8ZHIHIQ0X
	 6R0zJr1An5Nr2rcUTQUrWKe8b7K8D3sUzPeAvZbBD5N3KzjOSmafD2dGJdRUHxmV70
	 yaRbho9EgZ+pU8kuXPPzEoUnOCpATshhvGA83kNM2OlZSbozDdexmtbexB4oHz6Y62
	 8/v66+QZgjeIQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Dan Williams (nvidia)" <djbw@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 01/14] coco: host: arm64: Add host TSM callback
 and IDE stream allocation support
In-Reply-To: <6a17d6f1d6371_2b1fb710057@djbw-dev.notmuch>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
 <20260427065121.916615-2-aneesh.kumar@kernel.org>
 <6a17d6f1d6371_2b1fb710057@djbw-dev.notmuch>
Date: Tue, 02 Jun 2026 14:12:31 +0530
Message-ID: <yq5aa4tds58o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_014241_396571_5E581337 
X-CRM114-Status: GOOD (  38.13  )
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

"Dan Williams (nvidia)" <djbw@kernel.org> writes:

> Aneesh Kumar K.V (Arm) wrote:
>> Register the TSM callback when the DA feature is supported by KVM.
>>=20
>> This driver handles IDE stream setup for both the root port and PCIe
>> endpoints. Root port IDE stream enablement itself is managed by RMM.
>>=20
>> In addition, the driver registers pci_tsm_ops with the TSM subsystem.
>
> Do you want to call out that this is an infrastructure / scaffolding
> patch that only handles the PCI-TSM skeleton. The CCA meat comes later,
> in particular IDE key management. Tell a bit more of the story=20
>
> Otherwise, mostly looks good.
>

Sure, I=E2=80=99ll update the commit message.

>
> Minor comments below...
>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm64/include/asm/rmi_smc.h         |   2 +
>>  drivers/firmware/smccc/rmm.c             |  12 ++
>>  drivers/firmware/smccc/rmm.h             |   8 +
>>  drivers/firmware/smccc/smccc.c           |   1 +
>>  drivers/virt/coco/Kconfig                |   2 +
>>  drivers/virt/coco/Makefile               |   1 +
>>  drivers/virt/coco/arm-cca-host/Kconfig   |  19 ++
>>  drivers/virt/coco/arm-cca-host/Makefile  |   5 +
>>  drivers/virt/coco/arm-cca-host/arm-cca.c | 225 +++++++++++++++++++++++
>>  drivers/virt/coco/arm-cca-host/rmi-da.h  |  46 +++++
>>  10 files changed, 321 insertions(+)
>>  create mode 100644 drivers/virt/coco/arm-cca-host/Kconfig
>>  create mode 100644 drivers/virt/coco/arm-cca-host/Makefile
>>  create mode 100644 drivers/virt/coco/arm-cca-host/arm-cca.c
>>  create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.h
>>=20
>> diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/r=
mi_smc.h
>> index fa23818e1b4c..109d6cc6ef37 100644
>> --- a/arch/arm64/include/asm/rmi_smc.h
>> +++ b/arch/arm64/include/asm/rmi_smc.h
> [..]
>> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
>> index 2a6187df3285..7444cc3a588c 100644
>> --- a/drivers/firmware/smccc/rmm.c
>> +++ b/drivers/firmware/smccc/rmm.c
> [..]
>> diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
>> index a47a650d4f51..37d0d95a099e 100644
>> --- a/drivers/firmware/smccc/rmm.h
>> +++ b/drivers/firmware/smccc/rmm.h
> [..]
>> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smc=
cc.c
>> index fc9b44b7c687..2bf2d59e686d 100644
>> --- a/drivers/firmware/smccc/smccc.c
>> +++ b/drivers/firmware/smccc/smccc.c
>> @@ -97,6 +97,7 @@ static int __init smccc_devices_init(void)
>>  		 * the required SMCCC function IDs at a supported revision.
>>  		 */
>>  		register_rsi_device(pdev);
>> +		register_rmi_device(pdev);
>>  	}
>
> Would splitting the above three hunks make this series stand on its own
> relative to the base CCA series? I assume likely not as soon as we get
> to patch2.
>
> Otherwise, just curious what your intended merge strategy is for this,
> tsm.git or arm.git, and what help this needs?
>
> [..]
> snip code that looks good.
>

Yes, I=E2=80=99ll split this into a separate patch.

>
>> diff --git a/drivers/virt/coco/arm-cca-host/Makefile b/drivers/virt/coco=
/arm-cca-host/Makefile
>> new file mode 100644
>> index 000000000000..c236827f002c
>> --- /dev/null
>> +++ b/drivers/virt/coco/arm-cca-host/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +obj-$(CONFIG_ARM_CCA_HOST) +=3D arm-cca-host.o
>> +
>> +arm-cca-host-y	+=3D  arm-cca.o
>> diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coc=
o/arm-cca-host/arm-cca.c
>> new file mode 100644
>> index 000000000000..67f7e80106e8
>> --- /dev/null
>> +++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
>> @@ -0,0 +1,225 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 ARM Ltd.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/pci-tsm.h>
>> +#include <linux/pci-ide.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/tsm.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/cleanup.h>
>> +
>> +#include "rmi-da.h"
>> +
>> +/* Total number of stream id supported at root port level */
>> +#define MAX_STREAM_ID	256
>> +
>> +static struct pci_tsm *cca_tsm_pci_probe(struct tsm_dev *tsm_dev, struc=
t pci_dev *pdev)
>> +{
>> +	int ret;
>> +
>> +	if (!is_pci_tsm_pf0(pdev)) {
>> +		struct cca_host_fn_dsc *fn_dsc __free(kfree) =3D
>> +			kzalloc(sizeof(*fn_dsc), GFP_KERNEL);
>
> kzalloc_obj(*fn_dsc)
>
>> +
>> +		if (!fn_dsc)
>> +			return NULL;
>> +
>> +		ret =3D pci_tsm_link_constructor(pdev, &fn_dsc->pci, tsm_dev);
>> +		if (ret)
>> +			return NULL;
>> +
>> +		return &no_free_ptr(fn_dsc)->pci;
>> +	}
>> +
>> +	if (!pdev->ide_cap)
>> +		return NULL;
>
> Bailing early?
>
> Maybe the RMM knows something about this device not needing IDE? I have
> a similar question in patch2 around trusted sources for whether a device
> is internal or not.
>

Yes. This get updated later in
https://lore.kernel.org/all/20260427065121.916615-14-aneesh.kumar@kernel.org

>
>> +
>> +	struct cca_host_pf0_ep_dsc *pf0_ep_dsc __free(kfree) =3D
>> +		kzalloc(sizeof(*pf0_ep_dsc), GFP_KERNEL);
>> +	if (!pf0_ep_dsc)
>> +		return NULL;
>> +
>> +	ret =3D pci_tsm_pf0_constructor(pdev, &pf0_ep_dsc->pci, tsm_dev);
>> +	if (ret)
>> +		return NULL;
>> +
>> +	pci_dbg(pdev, "tsm enabled\n");
>> +	return &no_free_ptr(pf0_ep_dsc)->pci.base_tsm;
>> +}
>> +
>> +static void cca_tsm_pci_remove(struct pci_tsm *tsm)
>> +{
>> +	struct pci_dev *pdev =3D tsm->pdev;
>> +
>> +	if (is_pci_tsm_pf0(pdev)) {
>> +		struct cca_host_pf0_ep_dsc *pf0_ep_dsc =3D to_cca_pf0_ep_dsc(pdev);
>> +
>> +		pci_tsm_pf0_destructor(&pf0_ep_dsc->pci);
>> +		kfree(pf0_ep_dsc);
>> +	} else {
>> +		kfree(to_cca_fn_dsc(pdev));
>> +	}
>> +}
>> +
>> +/* For now global for simplicity. Protected by pci_tsm_rwsem */
>> +static DECLARE_BITMAP(cca_stream_ids, MAX_STREAM_ID);
>> +static int alloc_stream_id(struct pci_host_bridge *hb)
>> +{
>> +	int stream_id;
>> +
>> +redo_alloc:
>> +	stream_id =3D find_first_zero_bit(cca_stream_ids, MAX_STREAM_ID);
>> +	if (stream_id =3D=3D MAX_STREAM_ID)
>> +		return stream_id;
>> +
>> +	if (ida_exists(&hb->ide_stream_ids_ida, stream_id)) {
>> +		/* mark the stream allocated in the global bitmap. */
>> +		set_bit(stream_id, cca_stream_ids);
>> +		goto redo_alloc;
>> +	}
>> +	return stream_id;
>
> Is 256 total an RMM limit, and/or does it require globally unique
> stream-ids? If not you could do what SEV-TIO does and just set stream-id
> =3D=3D stream-index.
>

Yes, I=E2=80=99ll switch to that.

>
>> +}
>> +
>> +static inline bool cca_pdev_need_sel_ide_streams(struct pci_dev *pdev)
>> +{
>> +	return pci_pcie_type(pdev) =3D=3D PCI_EXP_TYPE_ENDPOINT;
>> +}
>> +
>> +static int cca_tsm_connect(struct pci_dev *pdev)
>> +{
>> +	struct pci_dev *rp =3D pcie_find_root_port(pdev);
>> +	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
>> +	struct pci_ide *ide;
>> +	int ret, stream_id =3D 0;
>> +
>> +	/* Only function 0 supports connect in host */
>> +	if (WARN_ON(!is_pci_tsm_pf0(pdev)))
>> +		return -EIO;
>> +
>> +	pf0_ep_dsc =3D to_cca_pf0_ep_dsc(pdev);
>> +	if (cca_pdev_need_sel_ide_streams(pdev)) {
>> +		/* Allocate stream id */
>> +		stream_id =3D alloc_stream_id(pci_find_host_bridge(pdev->bus));
>> +		if (stream_id =3D=3D MAX_STREAM_ID)
>> +			return -EBUSY;
>> +		set_bit(stream_id, cca_stream_ids);
>> +
>> +		ide =3D pci_ide_stream_alloc(pdev);
>> +		if (!ide) {
>> +			ret =3D -ENOMEM;
>> +			goto err_stream_alloc;
>> +		}
>> +
>> +		pf0_ep_dsc->sel_stream =3D ide;
>> +		ide->stream_id =3D stream_id;
>> +		ret =3D pci_ide_stream_register(ide);
>> +		if (ret)
>> +			goto err_stream;
>> +		/*
>> +		 * Configure IDE capability for target device
>> +		 *
>> +		 * Some test devices work only with DEFAULT_STREAM enabled.
>> +		 * For simplicity, enable DEFAULT_STREAM for all devices. A
>> +		 * future decent solution may be to have a quirk table to
>> +		 * specify which devices need DEFAULT_STREAM.
>> +		 */
>> +		ide->partner[PCI_IDE_EP].default_stream =3D 1;
>> +		pci_ide_stream_setup(pdev, ide);
>> +		pci_ide_stream_setup(rp, ide);
>> +
>> +		ret =3D tsm_ide_stream_register(ide);
>> +		if (ret)
>> +			goto err_tsm;
>> +
>> +		/*
>> +		 * Once ide is setup, enable the stream at the endpoint
>> +		 * Root port will be done by RMM
>> +		 */
>> +		pci_ide_stream_enable(pdev, ide);
>
> The end point of these patches follows the spec recommendation of
> delaying enable until after key programming.
>
>> +	}
>> +	return 0;
>
> Should this be making security claims to userspace without taking any
> action for non-endpoint devices that happen to be passed in?
>
> Thinking about a bisection case this should either fail here, print a
> message that is removed in the final enabling patch, or do the
> __maybe_unused arrangement to land all the CCA bits first and then do
> this hookup. Up to you.

Will do the latter. ie, I=E2=80=99ll call tsm_register() only in the final
patch.

-aneesh

