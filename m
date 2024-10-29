Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D98D3A676
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhdK9ezas0S0NFnJggffQ4CRKeGgUUyrmk9Z9lDDPeM=; b=UNPeyf0ueaR6fkLzT/Te/gm6WR
	xcqRjwrh4NkA9+hLV6YLwUG5tQyJnmdFaoX4GmTMBan+d866aB4MXoCE+AadSrPbea0Noz74SM2Zc
	+LnDrJX1/yxX0gRlrEQIy7T8BPH8rmdHKLvqSgwshNVm/rzUB7yYQmKVzUxxI4Zbxi2Gp8K06HEgN
	HzZkU7bGnbcyFNDL2Zx6rOW0I9LbTgludGOVedgbkA84FWpHklgygwu98F2lw5UkNW8/HJRijUfJn
	S1wScGS9uBWAPmEbFeI7oUDgNY36We/1SCagt/2ANWuMZpfmyLUmz5zN4c22Cel0hMibzIE0qrFkH
	0+jXvRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q8p-0000000FIHM-01O7;
	Tue, 29 Oct 2024 17:36:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oeE-0000000F2lr-3hFn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:00:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XdFKP4VLZz6J6cC;
	Tue, 29 Oct 2024 23:58:17 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
	by mail.maildlp.com (Postfix) with ESMTPS id DCE6B140A70;
	Wed, 30 Oct 2024 00:00:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 17:00:39 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 29 Oct 2024 17:00:39 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Oliver Upton <oliver.upton@linux.dev>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, yuzenghui
	<yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
	<jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for
 retrieving migration targets
Thread-Topic: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for
 retrieving migration targets
Thread-Index: AQHbJfsMQIYzvPBXn023xrhJm/PdPbKWjAoAgAdcePA=
Date: Tue, 29 Oct 2024 16:00:39 +0000
Message-ID: <d97cd23a1962460990a642ee8a653d2f@huawei.com>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-2-shameerali.kolothum.thodi@huawei.com>
 <ZxrzhAh3qE9hLV-U@linux.dev>
In-Reply-To: <ZxrzhAh3qE9hLV-U@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090047_231203_23CEDB90 
X-CRM114-Status: GOOD (  32.53  )
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

Hi Oliver,

> -----Original Message-----
> From: Oliver Upton <oliver.upton@linux.dev>
> Sent: Friday, October 25, 2024 2:25 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; maz@kernel.org; catalin.marinas@arm.com;
> will@kernel.org; mark.rutland@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; yuzenghui <yuzenghui@huawei.com>; Wangzhou
> (B) <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for
> retrieving migration targets
>=20
> Hi,
>=20
> On Thu, Oct 24, 2024 at 10:40:10AM +0100, Shameer Kolothum wrote:
> > +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
> > +------------------------------------------------------
> > +
> > +Query total number of migration target CPUs the Guest VM will be
> running during its
> > +lifetime and version information applicable to the data format used fo=
r
> > +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``.
> The maximum number of targets
> > +supported is 64. Also the version number supported currently is 1.0. T=
his
> hypercall
> > +must be handled by the userspace VMM.
> > +
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Presence:           | Optional; KVM/ARM64 Guests only               =
              |
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Calling convention: | HVC64                                         =
              |
> > ++---------------------+----------+------------------------------------=
--------------+
> > +| Function ID:        | (uint32) | 0xC600007D                         =
              |
> > ++---------------------+----------+------------------------------------=
--------------+
> > +| Arguments:          | None                                          =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
> > +| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on erro=
r,
> else       |
> > +|                     |          |    | [0-31] total migration targets=
              |
> > +|                     |          |    | [32-63] version number        =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
>=20
> We can't treat a single register as both a signed quantity *and* a full
> 64 bits of bitfields. Maybe just scrap the version and have this thing
> either return a negative error or positive quantity of implementations.

Ok. I had  a look at PV_TIME_ST/ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID
and got that idea. Separate registers make sense though.

Do we really need to skip the version number? The idea was to use that as a
future proof for data format in case we realize that MIDR/REVIDR is not goo=
d
enough for errata later.

>=20
> > +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
> > +-------------------------------------------------------
> > +
> > +Request migration target CPU information for the Guest VM. The
> information must be
> > +provided as per the format described by the version info in
> > +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``.
> At present, we only support
> > +the below format which corresponds to version 1.0. This hypercall will
> always be
> > +preceded by
> ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID`` and
> may be
> > +invoked multiple times to retrieve the total number of target CPUs
> information
> > +advertised. This hypercall must be handled by the userspace VMM.
> > +
> > +A typical userspace usage scenario will be like below:
> > +
> > +1. Receives
> ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
> > +
> > +   * Returns total number of migration targets and version number
> > +   * Reset current target index to zero
> > +2. Receives
> ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
> > +
> > +   * Returns MIDR/REVIDR info in return register fields. Can return up=
 to
> 4
> > +   * Update current target index based on returned target info
> > +   * If there are remaining register fields, return zero to indicate t=
he end
> > +   * Repeat step 2 until current target index =3D=3D total number of m=
igration
> targets
>=20
> Hmm... I'd rather we make the guest supply the target index of the
> implementation it wants to discover. Otherwise, the VMM implementation
> of this hypercall interface is *stateful* and needs to remember to
> migrate that...

Ok. I had the same feedback from Jonathan in an internal discussion as well
and on re-reading Marc's comments on v1, he also had the same suggestion
that I missed. Will change that.
=20
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Presence:           | Optional; KVM/ARM64 Guests only               =
              |
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Calling convention: | HVC64                                         =
              |
> > ++---------------------+----------+------------------------------------=
--------------+
> > +| Function ID:        | (uint32) | 0xC600007E                         =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
> > +| Arguments:          | None                                          =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
> > +| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on erro=
r,
> else       |
> > +|                     |          |    | [0-31] MIDR, [31-63] REVIDR, e=
lse           |
> > +|                     |          |    | [0-63] Zero to mark end.      =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
>=20
> Same deal here, x0 needs to always be treated as a signed quantity.
>=20
> How about -1 on error, 0 on success?
>=20
> Then, in the remaining registers:
>=20
> > +|                     | (uint64) | R1 | [0-31] MIDR, [32-63] REVIDR, e=
lse           |
> > +|                     |          |    | [0-63] Zero to mark end.      =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
>=20
> Both MIDR_EL1 and REVIDR_EL1 are 64 bit registers in AArch64. So we need
> to transfer a full 64 bits, even if the top half is _presently_ RES0 in
> MIDR_EL1.

Ok.

>=20
> > +|                     | (uint64) | R2 | [0-31] MIDR, [32-63] REVIDR, e=
lse           |
> > +|                     |          |    | [0-63] Zero to mark end.      =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
> > +|                     | (uint64) | R3 | [0-31] MIDR, [32-63] REVIDR, e=
lse           |
> > +|                     |          |    | [0-63] Zero to mark end.      =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
>=20
> I think it's fine to have this hypercall return a single MIDR/REVIDR
> pair at a time. This is not a performance sensitive interface and will
> only be called a few times at boot.
>=20
> Actually -- what if we crammed everything into a single hypercall?
>=20
> DISCOVER_IMPLEMENTATION_FUNC_ID
>=20
>  - Arguments:
>    - arg0: selected implementation index
>=20
>  - Return value:
>    - r0: -1 on error, otherwise the maximum possible implementation index
>    - r1: MIDR_EL1 of the selected implementation
>    - r2: REVIDR_EL1 of the selected implementation
>=20
> We're guaranteed at least one CPU implementation of course, so the guest
> can just start w/ index 0 and iterate from there.

Ok. I will rework based on these and will sent out something soon.

Thanks,
Shameer

