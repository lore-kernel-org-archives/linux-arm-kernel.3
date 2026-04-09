Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0FBF31E24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wvdt51mR/Toqjs2o9UUo5BWq1kaU2F3DsCOGN6U9GmI=; b=0QXeDpzjtEwOtmPmj3e758W3fY
	iS4bZAs+lkjxjK/cTB+RTUwUPnOOaunROU3N7KgYrqD0zCTh+xqlPkcta0n+xdhCUx6pqWBMcNkrH
	iwo1/HZaluDwjoAUJMAeFnxkayYaMOOiKzl7knrB99w2c7qOJ+DqTT9Mx5fLSD80nt3uZWRf5wf7F
	TdgMZaaXW7UEfA2L2l46vucobg11tHOETU282bee7B3dSWzGZb7JmrB9ic01niRNPCwtWcQzfFQjp
	VMqlged9UbEiSoMSC5ZajslDzfpUsjyEW41SJIsefmDqRS/+27I4RQEU967KAy9YUBdcsBsiHMgV4
	Y+r7Htgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArFG-0000000AnLW-2g4B;
	Thu, 09 Apr 2026 15:24:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArFD-0000000AnL4-47N6;
	Thu, 09 Apr 2026 15:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775748272;
	bh=yRJ6u8GyYNSSyoKD5an4lWZMD1f6h28LyhWT410oxrY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Qn0EHVcpR0kF3s1EQhDIZZhJ47WXsX2Ummf6vGbt5BhJvR0hTtKT9sgGOUQkKKYaV
	 CH3YB3qvt4QeRYwI20Ag2IxOKECqqLBMDo8UPx5sz7kwOVwX9VkWc6ifMILxpRcbyf
	 pqF3bUrGHk+TUKBL3ulV3ghGDer3gvyOWSCVNY7dLHQoDi5qaJRnqzvnxo/ztcuRqP
	 GGy89HOHO/vElb7llCrz7ntJ961XWntYt1dK8P55dJuCjM5KTPmcG7T/xeD4D67cez
	 UbgnHOn0YBchfH48sxcu9cPxpZG4DAKrY372928RuXkZq+Dzwr0Lqa2P0/VOJkl6RC
	 Jvbxc85pPyZ4A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 037FC17E12E2;
	Thu,  9 Apr 2026 17:24:30 +0200 (CEST)
Message-ID: <e6f8f62568a385cc6d98856f480bd469882b274a.camel@collabora.com>
Subject: Re: [PATCH 7/7] media: rkvdec: Add multicore IOMMU support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 09 Apr 2026 11:24:29 -0400
In-Reply-To: <040f65ea-2559-4186-b733-3dc59a1ecc0b@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
	 <20260409-rkvdec-multicore-v1-7-62b316abf0f7@collabora.com>
	 <517dc6e9de0e284b3dc22952d9479616e6c8ec62.camel@collabora.com>
	 <040f65ea-2559-4186-b733-3dc59a1ecc0b@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oRdpf3vSzts/F/hutoEG"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_082436_376852_82E0F2E6 
X-CRM114-Status: GOOD (  38.52  )
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


--=-oRdpf3vSzts/F/hutoEG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 10:49 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 4/9/26 10:19, Nicolas Dufresne wrote:
> > Le jeudi 09 avril 2026 =C3=A0 09:50 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> > > As each core has its own IOMMU core, buffers must be mapped in each
> > > core's IOMMU so that any run() call can use any core without having t=
o
> > > remap everything.
> > >=20
> > > To do that, we use rockchip iommu domain's iommu devices list.
> > > With that, one IOMMU domain can be mapped on multiple devices, meanin=
g
> > > that each call to iommu_map() will flush the new mapping on all devic=
es
> > > in the list.
> > >=20
> > > The IOMMU domain that will have all devices in its list is the first
> > > core's default domain.
> > >=20
> > > Another domain cannot be used because VB2 allocates buffers through t=
he
> > > DMA engine, which uses iommu_get_dma_domain() to find the domain to m=
ap
> > > buffers through.
> > >=20
> > > The IOMMU restore function can still work as before, but needs to be =
more
> > > explicit in what domain to attach the device to.
> > > That is because detaching the empty domain will reattach the core's d=
efault
> > > domain, which is wrong (except for the first "main" core).
> > >=20
> > > The RCB temporary buffers are allocated in a dedicated SRAM, each
> > > core has its own SRAM, so the mapping for each core's SRAM is added i=
n the
> > > global domain.
> > >=20
> > > Everything else is mapped through the first core's default domain, ma=
king
> > > the driver write the mappings on both IOMMU cores.
> > Just raising an issue with the patch ordering here. I'm worried in a gi=
t bisect,
> > the driver will be broken until we apply this last patch. Can we make s=
ure that
> > the driver bisects ? (or tell me if I'm wrong)
> No, you're right. That's also why I mentioned it in the cover letter.=20
> This commit is also not too big, so I'll merge the last 3 commits and=20
> adapt the commit message to keep the information from the 3 (the commit=
=20
> messages are why I wanted to keep them separate, but there is no good=20
> way to keep them that way)


Unless we can implement everything, but only turn the multicore switch on i=
n a
final patch ? Basically removing the code that enable other cores at the en=
d.
But I don't want more code just to justify this, the break nice is nice for
review fwiw, but if squashing is the way, let it be.

Nicolas

>=20
> Detlev.
> >=20
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > > =C2=A0=C2=A0.../media/platform/rockchip/rkvdec/rkvdec-rcb.c=C2=A0=C2=
=A0=C2=A0 | 21 ++++++-------
> > > =C2=A0=C2=A0.../media/platform/rockchip/rkvdec/rkvdec-rcb.h=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++--
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=
=A0=C2=A0 | 35 +++++++++++++++++-----
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0=C2=A04 files changed, 44 insertions(+), 20 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/dr=
ivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> > > index 190fb7438e8c..977e37cf209b 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> > > @@ -57,7 +57,7 @@ bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx=
 *ctx)
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -void rkvdec_free_rcb(struct rkvdec_core *core)
> > > +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *=
core)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct rkvdec_rcb_config *cfg =3D core->rcb_config;
> > > =C2=A0=C2=A0	unsigned long virt_addr;
> > > @@ -76,12 +76,12 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
> > > =C2=A0=C2=A0		case RKVDEC_ALLOC_SRAM:
> > > =C2=A0=C2=A0			virt_addr =3D (unsigned long)cfg->rcb_bufs[i].cpu;
> > > =C2=A0=20
> > > -			if (core->iommu_domain)
> > > -				iommu_unmap(core->iommu_domain, virt_addr, rcb_size);
> > > +			if (rkvdec->iommu_global_domain)
> > > +				iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size);
> > > =C2=A0=C2=A0			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
> > > =C2=A0=C2=A0			break;
> > > =C2=A0=C2=A0		case RKVDEC_ALLOC_DMA:
> > > -			dma_free_coherent(core->dev,
> > > +			dma_free_coherent(rkvdec->main_core->dev,
> > > =C2=A0=C2=A0					=C2=A0 rcb_size,
> > > =C2=A0=C2=A0					=C2=A0 cfg->rcb_bufs[i].cpu,
> > > =C2=A0=C2=A0					=C2=A0 cfg->rcb_bufs[i].dma);
> > > @@ -97,7 +97,8 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
> > > =C2=A0=C2=A0	core->rcb_config =3D NULL;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 hei=
ght,
> > > +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_cor=
e *core,
> > > +			u32 width, u32 height,
> > > =C2=A0=C2=A0			const struct rcb_size_info *size_info,
> > > =C2=A0=C2=A0			size_t rcb_count)
> > > =C2=A0=C2=A0{
> > > @@ -132,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core,=
 u32 width, u32 height,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		/* Try allocating an SRAM buffer */
> > > =C2=A0=C2=A0		if (core->sram_pool) {
> > > -			if (core->iommu_domain)
> > > +			if (rkvdec->iommu_global_domain)
> > > =C2=A0=C2=A0				rcb_size =3D ALIGN(rcb_size, SZ_4K);
> > > =C2=A0=20
> > > =C2=A0=C2=A0			cpu =3D gen_pool_dma_zalloc_align(core->sram_pool,
> > > @@ -142,11 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_core *cor=
e, u32 width, u32 height,
> > > =C2=A0=C2=A0		}
> > > =C2=A0=20
> > > =C2=A0=C2=A0		/* If an IOMMU is used, map the SRAM address through it=
 */
> > > -		if (cpu && core->iommu_domain) {
> > > +		if (cpu && rkvdec->iommu_global_domain) {
> > > =C2=A0=C2=A0			unsigned long virt_addr =3D (unsigned long)cpu;
> > > =C2=A0=C2=A0			phys_addr_t phys_addr =3D dma;
> > > =C2=A0=20
> > > -			ret =3D iommu_map(core->iommu_domain, virt_addr, phys_addr,
> > > +			ret =3D iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_ad=
dr,
> > > =C2=A0=C2=A0					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
> > > =C2=A0=C2=A0			if (ret) {
> > > =C2=A0=C2=A0				gen_pool_free(core->sram_pool,
> > > @@ -166,7 +167,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core,=
 u32 width, u32 height,
> > > =C2=A0=C2=A0ram_fallback:
> > > =C2=A0=C2=A0		/* Fallback to RAM */
> > > =C2=A0=C2=A0		if (!cpu) {
> > > -			cpu =3D dma_alloc_coherent(core->dev,
> > > +			cpu =3D dma_alloc_coherent(rkvdec->main_core->dev,
> > > =C2=A0=C2=A0						 rcb_size,
> > > =C2=A0=C2=A0						 &dma,
> > > =C2=A0=C2=A0						 GFP_KERNEL);
> > > @@ -189,7 +190,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core,=
 u32 width, u32 height,
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0=20
> > > =C2=A0=C2=A0err_alloc:
> > > -	rkvdec_free_rcb(core);
> > > +	rkvdec_free_rcb(rkvdec, core);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/dr=
ivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> > > index a12af9b7dc2b..d1149afe7fda 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> > > @@ -8,6 +8,7 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include <linux/types.h>
> > > =C2=A0=20
> > > +struct rkvdec_dev;
> > > =C2=A0=C2=A0struct rkvdec_ctx;
> > > =C2=A0=C2=A0struct rkvdec_core;
> > > =C2=A0=20
> > > @@ -21,11 +22,12 @@ struct rcb_size_info {
> > > =C2=A0=C2=A0	enum rcb_axis axis;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 hei=
ght,
> > > +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_cor=
e *core,
> > > +			u32 width, u32 height,
> > > =C2=A0=C2=A0			const struct rcb_size_info *size_info,
> > > =C2=A0=C2=A0			size_t rcb_count);
> > > =C2=A0=C2=A0dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx=
, int id);
> > > =C2=A0=C2=A0size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id=
);
> > > =C2=A0=C2=A0int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
> > > =C2=A0=C2=A0bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)=
;
> > > -void rkvdec_free_rcb(struct rkvdec_core *core);
> > > +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *=
core);
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec.c
> > > index c2818f1575ef..2930e9b64906 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -1204,9 +1204,9 @@ static void rkvdec_device_run(void *priv)
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (!rkvdec_rcb_buf_validate_size(ctx)) {
> > > -		rkvdec_free_rcb(ctx->core);
> > > +		rkvdec_free_rcb(ctx->dev, ctx->core);
> > > =C2=A0=20
> > > -		ret =3D rkvdec_allocate_rcb(ctx->core,
> > > +		ret =3D rkvdec_allocate_rcb(ctx->dev, ctx->core,
> > > =C2=A0=C2=A0					=C2=A0 ctx->decoded_fmt.fmt.pix_mp.width,
> > > =C2=A0=C2=A0					=C2=A0 ctx->decoded_fmt.fmt.pix_mp.height,
> > > =C2=A0=C2=A0					=C2=A0 ctx->dev->variant->rcb_sizes,
> > > @@ -1486,6 +1486,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_d=
ev *rkvdec)
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void rkvdec_iommu_restore(struct rkvdec_core *core=
)
> > > =C2=A0=C2=A0{
> > > +	int ret;
> > > =C2=A0=C2=A0	if (core->empty_domain) {
> > > =C2=A0=C2=A0		/*
> > > =C2=A0=C2=A0		 * To rewrite mapping into the attached IOMMU core, att=
ach a new empty domain that
> > > @@ -1494,8 +1495,14 @@ static void rkvdec_iommu_restore(struct rkvdec=
_core *core)
> > > =C2=A0=C2=A0		 * This is safely done in this interrupt handler to mak=
e sure no memory get mapped
> > > =C2=A0=C2=A0		 * through the IOMMU while the empty domain is attached=
.
> > > =C2=A0=C2=A0		 */
> > > -		iommu_attach_device(core->empty_domain, core->dev);
> > > +		iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core=
->dev);
> > > +		ret =3D iommu_attach_device(core->empty_domain, core->dev);
> > > +		if (ret)
> > > +			dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
> > > =C2=A0=C2=A0		iommu_detach_device(core->empty_domain, core->dev);
> > > +		ret =3D iommu_attach_device(core->curr_ctx->dev->iommu_global_doma=
in, core->dev);
> > > +		if (ret)
> > > +			dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -1858,6 +1865,8 @@ static int rkvdec_probe(struct platform_device =
*pdev)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	core =3D &rkvdec->cores[rkvdec->core_count++];
> > > =C2=A0=20
> > > +	core->id =3D rkvdec->core_count - 1;
> > > +
> > > =C2=A0=C2=A0	platform_set_drvdata(pdev, rkvdec);
> > > =C2=A0=C2=A0	core->dev =3D &pdev->dev;
> > > =C2=A0=C2=A0	INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_=
func);
> > > @@ -1883,12 +1892,24 @@ static int rkvdec_probe(struct platform_devic=
e *pdev)
> > > =C2=A0=C2=A0			return PTR_ERR(core->link);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	core->iommu_domain =3D iommu_get_domain_for_dev(&pdev->dev);
> > > -	if (core->iommu_domain) {
> > > +	if (iommu_get_domain_for_dev(&pdev->dev)) {
> > > =C2=A0=C2=A0		core->empty_domain =3D iommu_paging_domain_alloc(core->=
dev);
> > > =C2=A0=20
> > > -		if (!core->empty_domain)
> > > +		if (IS_ERR(core->empty_domain))
> > > =C2=A0=C2=A0			dev_warn(core->dev, "cannot alloc new empty domain\n")=
;
> > > +
> > > +		if (!rkvdec->iommu_global_domain) {
> > > +			rkvdec->iommu_global_domain =3D iommu_get_domain_for_dev(core->de=
v);
> > > +
> > > +			if (IS_ERR(rkvdec->iommu_global_domain)) {
> > > +				rkvdec->iommu_global_domain =3D NULL;
> > > +				dev_warn_once(core->dev, "cannot alloc new global domain\n");
> > > +			}
> > > +		}
> > > +
> > > +		ret =3D iommu_attach_device(rkvdec->iommu_global_domain, core->dev=
);
> > > +		if (ret)
> > > +			dev_warn(core->dev, "cannot attach global domain to core %d\n", c=
ore->id);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(3=
2));
> > > @@ -1961,7 +1982,7 @@ static void rkvdec_remove(struct platform_devic=
e *pdev)
> > > =C2=A0=C2=A0		if (rkvdec->cores[i].empty_domain)
> > > =C2=A0=C2=A0			iommu_domain_free(rkvdec->cores[i].empty_domain);
> > > =C2=A0=20
> > > -		rkvdec_free_rcb(&rkvdec->cores[i]);
> > > +		rkvdec_free_rcb(rkvdec, &rkvdec->cores[i]);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec.h
> > > index 4f042a367dc0..ccd766b220c7 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> > > @@ -135,7 +135,6 @@ struct rkvdec_core {
> > > =C2=A0=C2=A0	void __iomem *link;
> > > =C2=A0=C2=A0	struct delayed_work watchdog_work;
> > > =C2=A0=C2=A0	struct gen_pool *sram_pool;
> > > -	struct iommu_domain *iommu_domain;
> > > =C2=A0=C2=A0	struct iommu_domain *empty_domain;
> > > =C2=A0=C2=A0	struct rkvdec_rcb_config *rcb_config;
> > > =C2=A0=C2=A0	struct rkvdec_ctx *curr_ctx;
> > > @@ -155,6 +154,7 @@ struct rkvdec_dev {
> > > =C2=A0=C2=A0	unsigned int available_core_count;
> > > =C2=A0=C2=A0	spinlock_t cores_lock; /* serializes core list access */
> > > =C2=A0=C2=A0	struct rkvdec_core *main_core;
> > > +	struct iommu_domain *iommu_global_domain;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0struct rkvdec_ctx {

--=-oRdpf3vSzts/F/hutoEG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadfErQAKCRDZQZRRKWBy
9Pn/AP9pfr2vN+orSi7oPIBk4oXz2hHxU/tyhhj0mADYVEsFdAD/ehYDStpNd56v
9rN/y/2K/yzi6YC3Sl9puEs8mjZO7Ak=
=ukm5
-----END PGP SIGNATURE-----

--=-oRdpf3vSzts/F/hutoEG--

