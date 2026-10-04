Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61919CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRY4iUwoy0k7A4Q+WlcGtk6KJOn/v2ablV6+SEfz6BM=; b=QHWW4/kLNGiI+8uVyzXlR0esqN
	HlKvG+oifrviLb2JKOkkQOyRG0dU/kn/72M3Tl6ku3EfEvUPgZk1Ewu6TvS9j5OehhYQT72gGOoKc
	jSQbiNWUOt4iJ03I0T8brq2N4AY9e1yvZ8cwV6hybHDtslEsSMu8g1YIzzrhgiP3tE0mwgJ2t3Ukb
	SfWNkgJdA+P/7v0QYxDV2qu11MGPVV8hbZ+TudeHg7ZLm4G3cUu2EO57AIXowk2WBrgnTM0qTPsQ2
	L3Nb7dN63yKc79UK4XRIBOET4dcm1Vww8uT8ywwFs/AXPP94xb5MMMf4otUOuIZACFjySgoruD7rV
	NxOcl9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK0F-0000000Eh6E-3mOf;
	Sun, 04 Oct 2026 11:03:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK0C-0000000Eh58-1YiA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:03:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a16629a040so12520065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791111810; x=1791716610; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRY4iUwoy0k7A4Q+WlcGtk6KJOn/v2ablV6+SEfz6BM=;
        b=thoYrUzbHCPMz9fozHRA4NhSAkaXQO5ga5eB6Wyjy4Ow5hc3cl8eZg/o0C6ETW0scG
         BCuVf6YmkkKWXFNQzl0iUum44G4tKqrPoAXLeDxfm6N89f2RkBwRsJw0qCXpa5tfoT3M
         H3focm3aBPHL/CH5ke6U/UnIWSEFmij+U2OQw4m+aijOZKVIp7GaH7GGj7sPUZpHl8EP
         OOqLkFxpIs/7PPi5tWWWCxKtHkzAfQ/m5IAcFFAOcLFWdV1T/2XU+HUw1C+8mkiGNTRF
         UW0p8Am99STjy9kl/snM+7yfgGOeIeq866ztoA0FoHxKnl5BTtwZvRQEXSV/6xlQJ3Fr
         hHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111810; x=1791716610;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRY4iUwoy0k7A4Q+WlcGtk6KJOn/v2ablV6+SEfz6BM=;
        b=qFMR0z6yG9wE7uB7pAEbVIBMFets+4KkknAu2i2kgHA2eKSIfmPArP4/u+ecJMUgSy
         xN8+PddyDmhmdibuINnVW9YOvQANCjKpY/jJlBpVd93Fsl2ppEZCvamEL1FNqGFkt0V2
         OUoHXZZWAJdWoVGGc14pqb8LBG23/XFv9piSu+qEHQdpPdZu5GVUEcxZM+uwGOiGXp61
         Lp/0++Xrcuvny1cWvmjB+bXIyP5FjuFIkjOaWb5v+R5qX+6E1YXj5vwJ56B+rjqz8GCr
         OMB2oaQeX/8TgD9wM5vU6byr5i4IC2KBDRSeTB2ZXm/ClI1s/fweEpf27Pxmh6Eiibvw
         i3ww==
X-Forwarded-Encrypted: i=1; AKwUvBwzuVZc5farqsy7RbTosCTbQ2LrvCBI6OoiH+F0XdON2httzSriKvJWgdXGFsgVeaeD9gD2BO310YDF8Wv0orZR@lists.infradead.org
X-Gm-Message-State: AFuF++ma+twPZR4vQ22oaZ5Nn3OnlS/kdfmn3vswWf/cOJH29jz2bwPp
	MrFDG/p+QMtcRGHjhJ6Eb7803MWi8V03xrH9iKK3l3h9zpDkU0IwkpykSI0HUsIh2Yk=
X-Gm-Gg: AYBFou0WK/5xnz6T5M/1ijwbxh65lDEj5Ao5hlj1g6iPvgCPX/wL1agidEXaz7lgSlE
	Jo3GpxbvWmedeGfUu+V33q9G3cc3cjkNJnsIneb1SycR+5o9L+xOM0DCWKgjpzX1nuPKrn7leDS
	+w+jtupoqvWMoZfHN0BYzFbtAP0u/3RYVz/aLgmFOW+Pc/cgiFtg60llHsm+9xW9dtsUH2BUAbU
	GKDUIY4owYUrF0kMbc3mOoe+oDV1xq1u0siYAWYWr7j9+8HHPgzqxapAraLX2UhrsNy96Jyj9p1
	CLLP1CYGmiChVyKD0dSh8cyB/yduFns/tqjJCCIwbHmLcN+2VzPhSYRRCJr19DOGpQe/+RIS7li
	bv9NsMa96pA387ZUdT+Zkhh8WkEN7PB8V1oC0G5JGTvRVXTC1u5UAp8W1MCqFDpDD1PMhLA50/N
	SybKNpNc0UiCt6eLN6v+bhSzubPSgEaaNbJ8BhpWyaZiLEVXx43kDUeHor4L5a1bp14b+XrJsqk
	qUYJqBt/OWSCORAAasUhhiSTwUTmUoPp4FqlognlDANA27+8TaUO4m6rQvnl7TrBpvzTcPVmbs+
	vwQZIcTI07RgP+a6rpX0/FIJgOBgj+42dXi98JA3
X-Received: by 2002:a05:600c:3509:b0:4a1:69c0:a1f7 with SMTP id 5b1f17b1804b1-4a169c0a338mr59304215e9.34.1791111809834;
        Sun, 04 Oct 2026 04:03:29 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm283591575e9.13.2026.10.04.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:03:29 -0700 (PDT)
Message-ID: <5c6b215401bd705f2023102e9d8b779ee4ae8c4a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Radu Rendec <radu@rendec.net>, "GUO Ren (XuanTie)" <guoren@kernel.org>, 
 Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel	 <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen	 <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>
Date: Sun, 04 Oct 2026 07:03:27 -0400
In-Reply-To: <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
		 <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
	 <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TPZS9VL83/bL5Rbeq0pg"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_040333_310278_4F520D04 
X-CRM114-Status: GOOD (  25.63  )
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


--=-TPZS9VL83/bL5Rbeq0pg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 21:21 -0400, Radu Rendec a =C3=A9crit=C2=
=A0:
> On Fri, 2026-09-11 at 03:27 +0000, GUO Ren (XuanTie) wrote:
> > The last enumerator of this driver's firmware IPI id list is a bound
> > for the VPU mailbox protocol, not a generic host IPI limit. Follow the
> > existing naming in this header: IPI_VPU_INIT already carries a VPU
> > prefix, so the terminator should match.
> >=20
> > The same convention is used by the SCP IPI enum, which ends with a
> > prefixed SCP_IPI_MAX rather than a bare IPI_MAX.
> >=20
> > Rename IPI_MAX to IPI_VPU_MAX and update the descriptor table bounds
> > and range checks. No functional change.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20260908222349.GA2324870@ax16=
2
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>

Applied, ty.

> > ---
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h |=C2=A0 4 ++--
> > =C2=A02 files changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.c
> > index 8d8319f0cd22..b3e9f8c4ab7a 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> > @@ -211,7 +211,7 @@ struct mtk_vpu {
> > =C2=A0	struct vpu_regs reg;
> > =C2=A0	struct vpu_run run;
> > =C2=A0	struct vpu_wdt wdt;
> > -	struct vpu_ipi_desc ipi_desc[IPI_MAX];
> > +	struct vpu_ipi_desc ipi_desc[IPI_VPU_MAX];
> > =C2=A0	struct share_obj __iomem *recv_buf;
> > =C2=A0	struct share_obj __iomem *send_buf;
> > =C2=A0	struct device *dev;
> > @@ -221,7 +221,7 @@ struct mtk_vpu {
> > =C2=A0	struct mutex vpu_mutex; /* for protecting vpu data data structur=
e */
> > =C2=A0	u32 wdt_refcnt;
> > =C2=A0	wait_queue_head_t ack_wq;
> > -	bool ipi_id_ack[IPI_MAX];
> > +	bool ipi_id_ack[IPI_VPU_MAX];
> > =C2=A0};
> > =C2=A0
> > =C2=A0static inline void vpu_cfg_writel(struct mtk_vpu *vpu, u32 val, u=
32 offset)
> > @@ -296,7 +296,7 @@ int vpu_ipi_register(struct platform_device *pdev,
> > =C2=A0		return -EPROBE_DEFER;
> > =C2=A0	}
> > =C2=A0
> > -	if (id < IPI_MAX && handler) {
> > +	if (id < IPI_VPU_MAX && handler) {
> > =C2=A0		ipi_desc =3D vpu->ipi_desc;
> > =C2=A0		ipi_desc[id].name =3D name;
> > =C2=A0		ipi_desc[id].handler =3D handler;
> > @@ -319,7 +319,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > =C2=A0	unsigned long timeout;
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > -	if (id <=3D IPI_VPU_INIT || id >=3D IPI_MAX ||
> > +	if (id <=3D IPI_VPU_INIT || id >=3D IPI_VPU_MAX ||
> > =C2=A0	=C2=A0=C2=A0=C2=A0 len > sizeof(send_obj->share_buf) || !buf) {
> > =C2=A0		dev_err(vpu->dev, "failed to send ipi message\n");
> > =C2=A0		return -EINVAL;
> > @@ -748,7 +748,7 @@ static void vpu_ipi_handler(struct mtk_vpu *vpu)
> > =C2=A0	s32 id =3D readl(&rcv_obj->id);
> > =C2=A0
> > =C2=A0	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
> > -	if (id < IPI_MAX && ipi_desc[id].handler) {
> > +	if (id < IPI_VPU_MAX && ipi_desc[id].handler) {
> > =C2=A0		ipi_desc[id].handler(data, readl(&rcv_obj->len),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 ipi_desc[id].priv);
> > =C2=A0		if (id > IPI_VPU_INIT) {
> > @@ -934,7 +934,7 @@ static int mtk_vpu_probe(struct platform_device *pd=
ev)
> > =C2=A0#ifdef CONFIG_DEBUG_FS
> > =C2=A0	debugfs_remove(vpu_debugfs);
> > =C2=A0#endif
> > -	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_MAX);
> > +	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_VPU_MAX);
> > =C2=A0vpu_mutex_destroy:
> > =C2=A0	mutex_destroy(&vpu->vpu_mutex);
> > =C2=A0disable_vpu_clk:
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.h
> > index 3951547e9ec5..44ab631ec904 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > @@ -49,7 +49,7 @@ typedef void (*ipi_handler_t) (void *data,
> > =C2=A0 *			 handle VP8 video encoder job,, and vice versa.
> > =C2=A0 * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
> > =C2=A0 *			 handle MDP (Media Data Path) job, and vice versa.
> > - * @IPI_MAX:		 The maximum IPI number
> > + * @IPI_VPU_MAX:	 The maximum VPU IPI number
> > =C2=A0 */
> > =C2=A0
> > =C2=A0enum ipi_id {
> > @@ -60,7 +60,7 @@ enum ipi_id {
> > =C2=A0	IPI_VENC_H264,
> > =C2=A0	IPI_VENC_VP8,
> > =C2=A0	IPI_MDP,
> > -	IPI_MAX,
> > +	IPI_VPU_MAX,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
>=20
> Reviewed-by: Radu Rendec <radu@rendec.net>

--=-TPZS9VL83/bL5Rbeq0pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasIyfwAKCRDZQZRRKWBy
9FPtAQDkOJhhuAzPdjhptdi8Ylku8gIEE5VszzwnAapD1IuDBQEAglHv3kKr78aE
qCuExFYbYHz3OhJLH8ntRzJdldPqtQk=
=d6+8
-----END PGP SIGNATURE-----

--=-TPZS9VL83/bL5Rbeq0pg--

