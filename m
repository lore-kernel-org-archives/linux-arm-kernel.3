Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B1FC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhiyKOQUZMlQzrQQDm/bzM5HL7BaCBczElCwHaYcmtE=; b=wgst0jSqzoBCJ2OQogyglBAEA2
	EM3MqddezMldgpjbcXPv5mNsjEDt/NYVGjHdpFYG1Mh5+D5aBg4mpNB2lbQP2mYC4TLW/+ecyL+4t
	Lx8xTT67A1HoU52Ye+6MJCGoKZTOVgo8gPOSpAJCaexUvq2vNYcB1ZdD6Gk35oiVswoKqwTpjDsQV
	oMUldG44H7MuLBcjNDI+3+RBLtTlJ1AryIIUW5NbXMP+zn6hW4v24uv0E8LthBzBTM5N2CLXQKfVT
	dkj8SA4yo+Ddd7oappKlIC2Bo70AxbnL2NPDE2hPiMjZ0E46XXTyaCeIvdDNvIhkHYe0N9ihWLfW3
	dgF1a3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmPZ-0000000522h-1g5s;
	Tue, 28 Jan 2025 14:17:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmO5-000000051lL-3uIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 14:16:23 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yj6j83rtsz6M4HX;
	Tue, 28 Jan 2025 22:14:04 +0800 (CST)
Received: from frapeml100005.china.huawei.com (unknown [7.182.85.132])
	by mail.maildlp.com (Postfix) with ESMTPS id 92C641402DB;
	Tue, 28 Jan 2025 22:16:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100005.china.huawei.com (7.182.85.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 Jan 2025 15:16:08 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 28 Jan 2025 15:16:08 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Oliver Upton <oliver.upton@linux.dev>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "sebott@redhat.com"
	<sebott@redhat.com>, yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)"
	<wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Anthony Jebson
	<anthony.jebson@huawei.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for
 retrieving target implementations
Thread-Topic: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for
 retrieving target implementations
Thread-Index: AQHbbnPvQIqQDHYICESJXD2PsLgGhrMq02oAgAFFeFA=
Date: Tue, 28 Jan 2025 14:16:08 +0000
Message-ID: <c10e377aa58c408599e06007052cff7a@huawei.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
 <Z5fBrFVIs0jOiR9W@linux.dev>
In-Reply-To: <Z5fBrFVIs0jOiR9W@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_061622_264167_58A0B675 
X-CRM114-Status: GOOD (  23.10  )
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
> From: Oliver Upton <oliver.upton@linux.dev>
> Sent: Monday, January 27, 2025 5:26 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; maz@kernel.org; catalin.marinas@arm.com;
> will@kernel.org; mark.rutland@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; sebott@redhat.com; yuzenghui
> <yuzenghui@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for
> retrieving target implementations
>=20
> On Fri, Jan 24, 2025 at 03:17:30PM +0000, Shameer Kolothum wrote:
> > If the Guest requires migration to multiple targets, these hypercalls
> > will provide a way to retrieve the target CPU implementations from
> > the user space VMM.
> >
> > Subsequent patch will use this to enable the associated errata.
> >
> > Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> > Suggested-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  Documentation/virt/kvm/arm/hypercalls.rst | 59
> +++++++++++++++++++++++
> >  include/linux/arm-smccc.h                 | 15 ++++++
> >  2 files changed, 74 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/arm/hypercalls.rst
> b/Documentation/virt/kvm/arm/hypercalls.rst
> > index af7bc2c2e0cb..718725cbf6c7 100644
> > --- a/Documentation/virt/kvm/arm/hypercalls.rst
> > +++ b/Documentation/virt/kvm/arm/hypercalls.rst
> > @@ -142,3 +142,62 @@ region is equal to the memory protection granule
> advertised by
> >  |                     |          |    +-------------------------------=
--------------+
> >  |                     |          |    | ``INVALID_PARAMETER (-3)``    =
              |
> >  +---------------------+----------+----+-------------------------------=
--------------+
> > +
> > +``ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID``
> > +-------------------------------------------------------
> > +Request the target CPU implementation version information and the
> number of target
> > +implementations for the Guest VM.
> > +
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Presence:           | Optional;  KVM/ARM64 Guests only              =
              |
> > ++---------------------+-----------------------------------------------=
--------------+
> > +| Calling convention: | HVC64                                         =
              |
> > ++---------------------+----------+------------------------------------=
--------------+
> > +| Function ID:        | (uint32) | 0xC6000040                         =
              |
> > ++---------------------+----------+------------------------------------=
--------------+
> > +| Arguments:          | None                                          =
              |
> > ++---------------------+----------+----+-------------------------------=
--------------+
> > +| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``               =
              |
> > +|                     |          |    +-------------------------------=
--------------+
> > +|                     |          |    | ``NOT_SUPPORTED (-1)``        =
              |
> > +|                     +----------+----+-------------------------------=
--------------+
> > +|                     | (uint64) | R1 | Bit[63] Must be zero          =
              |
> > +|                     |          |    +-------------------------------=
--------------+
>=20
> Why? R0 is sufficient to determine if the hypercall was successful, and
> this is already defined as an unsigned quantity to the guest.

Hmm..I was trying to imitate(badly ofcourse) the SMCCC_VERSION where
bit 31 must be zero but again in that case it is Int32 so it makes sense th=
ere.

>=20
> > +|                     |          |    | Bits [62:32] Major version    =
              |
> > +|                     |          |    +-------------------------------=
--------------+
> > +|                     |          |    | Bits [31:0] Minor version     =
              |
> > +|                     +----------+----+-------------------------------=
--------------+
>=20
> Do we really need a full u64 of version information? If you collapse
> this down to a u32 it'd align with the versioning scheme for PSCI /
> SMCCC.
=20
Ok. How about this,

Bits [63:32]  Reserved/] Must be zero
Bits [31:16]  Major Rev (Should we leave the bit 31 to zero here to match
                      SMCCC_VERSION?)
Bits [15:0]    Minor Rev

Thanks,
Shameer


