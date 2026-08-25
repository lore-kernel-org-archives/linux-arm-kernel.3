Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888FEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnP3yoFqLam+q74txUte20YTRfVEWgC/MsIo7AxFy1M=; b=cSpd+ZuYTCHNKPGBNH5v3o4h+D
	Luq8+XaKuGtJwbsTxKE3ZOLIfGbVTvLZr2Iyco1i0A8+cTf3KxOkryHpOIc7aDbXT3MKloT8xcKZ5
	vqqg5kXcS84JXRoyqlX7tG/SGhBFC3yVN1jCtd4X6RMeReiqkeDYNTjYqTQKO/gyiS4wX0yv6RiPd
	Nco9M355P3xDbEhNr0od2n1B8MVd7MU7Tl5jjRdn1vu3ZOnlyCk3AWGV2ELjFz6uu521R9StUlKPF
	Rqr0NudZnsfCNkktFg2jJEdf+dltDHyWq0gwTl57+si40T5+yeP049LCWqdwbGjq8Jnw1MTE54+cz
	3AivFA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyj4r-000000009KS-0iMY;
	Tue, 25 Aug 2026 04:48:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyj4o-000000009KK-0UZP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A37B6011F;
	Tue, 25 Aug 2026 04:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ADF1F000E9;
	Tue, 25 Aug 2026 04:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787633276;
	bh=fnP3yoFqLam+q74txUte20YTRfVEWgC/MsIo7AxFy1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DZl7VmH4Ir30bVjC5iewzEv7a7Z7T5Hvw2yna97sfwEIejxOFkt5tysmWCT7c87Og
	 fK5mfv+auM7enlFKM31SEt5BBsp2byAf4mGOyuB5b6HDtMZ0GR6dlHEfqM45hpPOOI
	 dp6d0gXiTYUnRZbj9VqqZlEIO7s6F9QGuUlTgIdz13LYHqrASHXXAsxnztRS8uNf3h
	 GOVt40tpM60e6p/NVoO4TpbkcC9aZKkMeiMqtvG/5tLNFSBOf0pC/G9OSNHNYMzDg3
	 8E9spxVhUzaEtTqRjFQxlvwB4RySSI8or2I9o+sD1CMDGbdEO72GxJJx1go7cgymtb
	 bE3US+z8iImMw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Kameron Carr <kameroncarr@linux.microsoft.com>,
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
	Xu Yilun <yilun.xu@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [RFC PATCH v4 09/11] coco: guest: arm64: Hook TSM accept to
 Realm TDISP RUN transition
In-Reply-To: <f086f940-edaa-4bd5-ba11-e52e61fd6cee@linux.microsoft.com>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
 <20260427082805.931832-10-aneesh.kumar@kernel.org>
 <f086f940-edaa-4bd5-ba11-e52e61fd6cee@linux.microsoft.com>
Date: Tue, 25 Aug 2026 10:17:43 +0530
Message-ID: <yq5aik4yx0uo.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Kameron Carr <kameroncarr@linux.microsoft.com> writes:

> On 4/27/2026 1:28 AM, Aneesh Kumar K.V (Arm) wrote:
=20
...

>=20
>> +	/*
>> +	 * Present the private mmio range in the resource hierarchy.
>> +	 * We don't use this for ioremap, ioremap check the RIPAS value.
>> +	 */
>> +	ret =3D pci_tsm_mmio_setup(pdev, tsm_mmio);
>> +	if (ret) {
>> +		pci_err(pdev, "Protected mmio setup failure\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =3D cca_map_evidence_report_range(pdev, tsm_mmio);
>> +	if (ret) {
>> +		pci_err(pdev, "failed to validate the interface report\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =3D rhi_vdev_set_tdi_state(pdev, RHI_DA_TDI_CONFIG_RUN);
>> +	if (ret) {
>> +		pci_err(pdev, "failed to switch the device (%u) to RUN state\n", ret);
>> +		return ret;
>> +	}
>
> After calling pci_tsm_mmio_setup() we have mappings from insert_resource()
> then failures from later return codes never call mmio_teardown() so
> remove_resource() is never called, only kfree on the tsm_mmio.
>
> Likewise after cca_map_evidence_report_range() the mmio entry memory rang=
es
> have state RIPAS_DEV. Later failures never restore RIPAS_EMPTY.
>
> Could clean up be handled better? Is there a reason these failures don't
> have a rollback path?
>

Thanks for the review. I=E2=80=99ll incorporate these changes in the next
version.

-aneesh

