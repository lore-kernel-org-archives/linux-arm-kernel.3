Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01ED637B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=; b=bHF/twX7u5NYkOUsORC56m6lRU
	JMEHg+00DtCXuZRg3U8URD0b/5HsL3zwnC4sw4+BKxbryPUhgaubx9oHFbEqgNYj30l6YBaUZLWj4
	svYxvizMOL9/2F/ZggBOc544rzo0QPWN3HbmtRCnIBOxZ18p8omHXJlCBBMA1GLtj7R3pjVyjv2Ij
	nIIVAa4fFcshv6WrYkt8JzpD932zD0eNrEguR3pB31QkuAlaszay43yw5ZIk5GqgPr0RACc8nXDcO
	Rz3WK0djQwzHnfU8XQkeQfBxZzsCp6fXMxXwe/PjVmOi+ofYu26Ap1mHyUVLeSSjXdM6s2a/ql+kT
	58ml/dKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcuG-00000005rRB-10y2;
	Tue, 16 Dec 2025 21:48:32 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcuC-00000005rQN-19od
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:48:30 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8b602811a01so567316785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921707; x=1766526507; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=;
        b=ABGjNzWfusXWota+19s1xXXjIdJR4MXLdaokZV6t9ldvv8TV0Vg2qY8rLQ+GeRao5G
         yh7ARH379Vu8SumgElTYd0Cr45R2xbV6mafof8QfHznG31LCdxLXTywpzT6q2QQxVNK9
         ODmXpe1ZwpeAlosNcmD9r9x19llE0HPw3UAGkXiEhw/AsWsg9ExkqQSnEjYBZdDGAkSm
         fR0lw/z+hfc8TCUU4ASPCsDSa3DcXLyqLRlako0hMGScDKqN3rPa7iszs5i3A9Q6IFX2
         uAj8VJahDL68eBUibzx9UrxDr8AIotFqZnscGCZcK2bTi06QFWZwcs2yVfU6/D4GBGds
         dS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921707; x=1766526507;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=;
        b=SyvppHzP2ZekjlqW9LhNZe4NW6t6mmsbRbNftNjCu5sauIHAA4nWstvivq/qJhojZ0
         EF0SaelTzfK3yNjRSO61gjn/PWtWJG6J5RQoin9wX8ds9kGuJX7YONcNq0EWtP1QP01m
         aiLfMCj2P81DCzQ5pfMKAZlIChduk+4UuJcMQl8PCLfI1Kz+CX+blKaz7xwq+vqO1PJk
         FnbD+QlqPOtnTuI3fMJacDPLu9TXoQWv29Nhu4HvAP6uVnVoc8dGF3oeJk7GeXMuddUK
         Kv8nYFMx83mnMN/gfxjJl9S8DKx/QRskbmLGsQ+FDbk/FmmicbkFjti22oLj+bl+TYaE
         bXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWuaTPOjt+sduXiidB58AEmoTdPU+BXWFgsozYVZB/yrfxzdD2e3RkGNO6k4VWxtXc2pUFAAGp/wdanYIy0qdUM@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6Mv57tpbiRX8ItfH+Ons3nwpYxAbpV8W+839i9Nf4PRO1ccY
	CA/Kw1BZMwa0GaezbFXkPkTQPXo6+oxx6TdvlkyMd3OVOzCzAYdhXVNH7meG4N2YQyI=
X-Gm-Gg: AY/fxX7PbuCng1EcWBd5ueFb9Ks9xt0AdZ1gPoAiPGmQJ9STiWiWUThlIzRPtM+zltE
	qmNviJ4ndo0ZASEUi3rF+T29fpGfl1mnaBp/8cuaE4XYmr0f/07ecp+/128qQ1B0AhEPUz1Coam
	g968qh783udT1ptUjdigIIrccmTaGCNHxREXVzoPu6B8Jke6rCZS0eR0muANXEtJWSnrHatOr3o
	i1l9tfXQWfSKyEyrK7V5TCyl4xfIBU+xR4DQAJIsBSusLt1qy+aiKcweOM4BeLGPR7Fx4qE0vog
	FLzFYXTUsoy6OfgimaiklyjVu0EH0olka7UECq4NFUdwmHklJC4PIl3ShIBg/SYTKEYfzzdU5FI
	Dm47hxDUrIqtvJe+YrO74rJN7e4tXBze9g6/4i1o895LFXMbBi8RFdAzP+gptEvLqhKvQry1KKh
	qx70B7T6FLdJh6bojd
X-Google-Smtp-Source: AGHT+IHdEJIMgvS0DRjgbW6ZMgMhCqitz/LqAFtaEW3RYwujlfQ/y6zantPM4DsdizBaPXHFdKDO1w==
X-Received: by 2002:a05:620a:4706:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8bb3a36becemr2153978085a.54.1765921706918;
        Tue, 16 Dec 2025 13:48:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b53dbasm269780185a.34.2025.12.16.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:48:26 -0800 (PST)
Message-ID: <086b940b975a9c0f9cb5d5cf2fabe21ddb188821.camel@ndufresne.ca>
Subject: Re: [PATCH v11 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:48:21 -0500
In-Reply-To: <20251202094800.6140-13-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-13-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Xovv49x8gJE8muHL9N/J"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134828_372989_D167D93D 
X-CRM114-Status: GOOD (  23.52  )
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


--=-Xovv49x8gJE8muHL9N/J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:48 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add a configuration to set jpeg dec & enc smmu sid
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 37 +=
++++++++++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 | 15 +=
+++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 23 +++++++++++=
+
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 23 +++++++++++=
+
> =C2=A04 files changed, 98 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 10a588b92e76..625dfa8468e1 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> =C2=A0#include <media/v4l2-event.h>
> @@ -1613,6 +1614,20 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jp=
eg_dev *jpeg)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static void mtk_jpeg_enc_set_smmu_sid(struct mtk_jpegenc_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_dev *mjpeg =3D jpeg->master_dev;
> +
> +	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
> +		return;
> +
> +	regmap_update_bits(jpeg->smmu_regmap, JPEG_ENC_SMMU_SID,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_MASK <<
> +			=C2=A0=C2=A0 JPG_REG_ENC_GUSER_ID_SHIFT,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_ENC_SID <<
> +			=C2=A0=C2=A0 JPG_REG_ENC_GUSER_ID_SHIFT);
> +}
> +
> =C2=A0static void mtk_jpegenc_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
> @@ -1674,6 +1689,9 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> +
> +	mtk_jpeg_enc_set_smmu_sid(comp_jpeg[hw_id]);
> +
> =C2=A0	mtk_jpeg_set_enc_dst(ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 comp_jpeg[hw_id]->reg_base,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &dst_buf->vb2_buf);
> @@ -1701,6 +1719,20 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0}
> =C2=A0
> +static void mtk_jpeg_dec_set_smmu_sid(struct mtk_jpegdec_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_dev *mjpeg =3D jpeg->master_dev;
> +
> +	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
> +		return;
> +
> +	regmap_update_bits(jpeg->smmu_regmap, JPEG_DEC_SMMU_SID,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_MASK <<
> +			=C2=A0=C2=A0 JPG_REG_DEC_GUSER_ID_SHIFT,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_DEC_SID <<
> +			=C2=A0=C2=A0 JPG_REG_DEC_GUSER_ID_SHIFT);
> +}

Can you deduplicate that function. Just make one, and pass the SID as param=
eter.

> +
> =C2=A0static void mtk_jpegdec_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D container_of(work, struct mtk_jpeg_ct=
x,
> @@ -1784,6 +1816,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> +
> +	mtk_jpeg_dec_set_smmu_sid(comp_jpeg[hw_id]);
> +
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> =C2=A0				jpeg->variant->support_34bit,
> =C2=A0				&jpeg_src_buf->dec_param,
> @@ -1943,6 +1978,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvd=
ata =3D {
> =C2=A0	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> =C2=A0	.multi_core =3D true,
> =C2=A0	.jpeg_worker =3D mtk_jpegenc_worker,
> +	.support_smmu =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata =3D {
> @@ -1969,6 +2005,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegde=
c_drvdata =3D {
> =C2=A0	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> =C2=A0	.multi_core =3D true,
> =C2=A0	.jpeg_worker =3D mtk_jpegdec_worker,
> +	.support_smmu =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id mtk_jpeg_match[] =3D {
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 33f7fbc4ca5e..6e8304680393 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-fh.h>
> @@ -34,6 +35,14 @@
> =C2=A0
> =C2=A0#define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
> =C2=A0
> +#define JPEG_DEC_SMMU_SID				0
> +#define JPEG_ENC_SMMU_SID				0
> +#define JPG_REG_GUSER_ID_MASK			0x7
> +#define JPG_REG_GUSER_ID_DEC_SID		0x4
> +#define JPG_REG_GUSER_ID_ENC_SID		0x5
> +#define JPG_REG_DEC_GUSER_ID_SHIFT		8
> +#define JPG_REG_ENC_GUSER_ID_SHIFT		4
> +
> =C2=A0#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
> =C2=A0
> =C2=A0/**
> @@ -65,6 +74,7 @@ enum mtk_jpeg_ctx_state {
> =C2=A0 * @multi_core:		mark jpeg hw is multi_core or not
> =C2=A0 * @jpeg_worker:		jpeg dec or enc worker
> =C2=A0 * @support_34bit:	flag to check support for 34-bit DMA address
> + * @support_smmu:	flag to check if support smmu
> =C2=A0 */
> =C2=A0struct mtk_jpeg_variant {
> =C2=A0	struct clk_bulk_data *clks;
> @@ -82,6 +92,7 @@ struct mtk_jpeg_variant {
> =C2=A0	bool multi_core;
> =C2=A0	void (*jpeg_worker)(struct work_struct *work);
> =C2=A0	bool support_34bit;
> +	bool support_smmu;
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> @@ -150,6 +161,7 @@ struct mtk_jpegdec_clk {
> =C2=A0 * @hw_param:		jpeg encode hw parameters
> =C2=A0 * @hw_state:		record hw state
> =C2=A0 * @hw_lock:		spinlock protecting the hw device resource
> + * @smmu_regmap:	SMMU registers mapping
> =C2=A0 */
> =C2=A0struct mtk_jpegenc_comp_dev {
> =C2=A0	struct device *dev;
> @@ -163,6 +175,7 @@ struct mtk_jpegenc_comp_dev {
> =C2=A0	enum mtk_jpeg_hw_state hw_state;
> =C2=A0	/* spinlock protecting the hw device resource */
> =C2=A0	spinlock_t hw_lock;
> +	struct regmap *smmu_regmap;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -177,6 +190,7 @@ struct mtk_jpegenc_comp_dev {
> =C2=A0 * @hw_param:			jpeg decode hw parameters
> =C2=A0 * @hw_state:			record hw state
> =C2=A0 * @hw_lock:			spinlock protecting hw
> + * @smmu_regmap:		SMMU registers mapping
> =C2=A0 */
> =C2=A0struct mtk_jpegdec_comp_dev {
> =C2=A0	struct device *dev;
> @@ -190,6 +204,7 @@ struct mtk_jpegdec_comp_dev {
> =C2=A0	enum mtk_jpeg_hw_state hw_state;
> =C2=A0	/* spinlock protecting the hw device resource */
> =C2=A0	spinlock_t hw_lock;
> +	struct regmap *smmu_regmap;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index e453a1634f33..da753a636eaa 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -624,6 +624,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegde=
c_comp_dev *dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "mmap smmu_base failed(%ld)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(dev->smmu_regmap));
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_jpegdec_clk *jpegdec_clk;
> @@ -677,6 +696,10 @@ static int mtk_jpegdec_hw_probe(struct platform_devi=
ce *pdev)
> =C2=A0	dev->master_dev =3D master_dev;
> =C2=A0	master_dev->max_hw_count++;
> =C2=A0
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> =C2=A0	ret =3D devm_clk_bulk_get(dev->dev,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b30c728c3712..8a61d5537315 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -348,6 +348,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegen=
c_comp_dev *dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "mmap smmu_base failed(%ld)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(dev->smmu_regmap));
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_jpegenc_clk *jpegenc_clk;
> @@ -399,6 +418,10 @@ static int mtk_jpegenc_hw_probe(struct platform_devi=
ce *pdev)
> =C2=A0	dev->master_dev =3D master_dev;
> =C2=A0	master_dev->max_hw_count++;
> =C2=A0
> +	ret =3D mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> =C2=A0	ret =3D devm_clk_bulk_get(dev->dev,

With that minor fix:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Xovv49x8gJE8muHL9N/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHTpQAKCRDZQZRRKWBy
9BrbAP99YUdKLq0ZTZ3LnNml14X2eI0WB2yaXY/4/Dql7WGScgD/eJvjzZU2CNdB
mz06ZtidYyGgY8poqEVMEGR6DDIztwo=
=3TFy
-----END PGP SIGNATURE-----

--=-Xovv49x8gJE8muHL9N/J--

