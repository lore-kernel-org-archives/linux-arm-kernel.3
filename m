Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4490CD637D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=; b=nlP39InXOEQuBKh1UPcI4RsxwB
	0sYYtb0g48xGTZY8Ay7yZIHjblCUbKyWF3rOT+YPSLtm2/i87o8IpQ1IIVoVXJ/NGSsRlXhNTQPcD
	AlP0XasrZD/WMzXpSumOd4iCMy5+JAQBDhyvk/gDh7kZB5bwxay6/xT4DBDePSxLoBjY3TkR/XCKn
	wo/+rAHdVw0Ka+au4KqCv8/dCVYYx4FbKcZWV30h/IqNTe4OCONHmsmmwm58F4lslGwkBZZpOLkFi
	cjhLdx52IGneuEVoCckI6b8b5OT1P67SqR402E/mXN4wMTFshA+07i1f1LwlxOOsNptqojJJTK0r1
	w/KZ2OlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcpV-00000005r8M-0quM;
	Tue, 16 Dec 2025 21:43:37 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcpS-00000005r7g-0Wxp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:43:35 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b2627269d5so517560485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921413; x=1766526213; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=UeazhK3Sb5enjNWsggSPYBdHimyRjD9fj8NjBOwx1tTbdumGJ9nOqdRgA6Iu3AXDCo
         uEl/LlZkv3z1I19KxJt1RaRmHaMGhC7DfYiqU4NQTSknVlEh93cD7IJYvOgbqYJN+P4a
         vLar8AMy1/7IyyIWHIceAmSv0YEgbjNUnrqDaxLoKvZct5SCKQGcehn0LJICsavBlXdU
         ZEyEZKOWD5aG4agk4K1hcgPl5jpyHPKVdLIwIsShw+/j+WkD2bdAeuUrbWtSkLJRIvLy
         XVrfE+WRUFNtOfdHpcoQYxr6zQfHrZF7XMtEkin0ax58esl8KJnrDjPI+vpREKEs2Ztx
         nokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921413; x=1766526213;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=kqLLIMo+KvHS8B3vomc/q+Jtep/AegfCcdDz+qvY0dGl45bcDTDzFTSTF0WoXE88HM
         TOX7nTCNk6bFun+BpeTtA6qjYYQSWhX7Yujokvj+G43Z+QJrXvMtY8TlJV7kSXIE6D3L
         8/LmNz07LUnlkxGcuDkRkcjXzhTwnRSTbVMRUimFR/51fICUDdgF+cQ5Fn73w0/1NXtT
         Gft8WmRkNPax6OCzdz6e/AFvIEA+9rWUaDOxl+XwRZdE6aU76c9PamT6AXaHHTYhjMqv
         lZOoVP0Zl8oUjCpuRtPSjfscGid5xto772qR1xdrUL5D6liv/s2c/xPF8uAlgWadDZv4
         fGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUjOnF+KMpLEfaKtmTJiVBPeSZY8ZKYF4bkxVqPdXfTug/KIqHpE511Frc09mRDcQYKQNAD8IUje6j60OQzZZ3Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyrNcqEizwnGFnPSUyQvOP8AbSgxz21h0//MNXve4zb9ms7uJjM
	Y5b1X86lYpYI4cphcFIVfZKrN/wfMxx1/hiqfeMJHB9njeLN6eDpw8SkVrHWh3SjMf0=
X-Gm-Gg: AY/fxX7Wsy1iB0nx67VdiRqGmGkEwdxdt+CpmWjCSRRoUwRjbZnupdL0FVKn68vO3cG
	/waaRjRpHnWl8bIQNCwdz8m1xp3Dv8gD4HJbh2cswrFLJ9KcNhPgeqsDqXR4ZEStbCB2EhyXXYr
	VTbd0xKvSQmeKGksjLL+TaVRZyIULvvjUsQbg19AdY0qivDMfTkmYJuQngaAvD67B2hghO3cn/1
	Rhy1oM6/BSH6VZt0Hoyx/zrFBD6CNYzhVe55dEqzuOEAPOYVcjP1vj1TeONXD1SsnhHcVK46tpW
	i/0Bwld2xUQ98eUzeMTvsvxsAdgPNNS40WZkfDEjwy40a49N3x1cv9SzHuIWcxIGr1sNUy9WMsB
	FHXVL92GXWm0tpOcUbb5YvY8KTGbkStex+oGJyo0DHC3AlUHiWR+UBiCJO6WRyhIjVcx/api9kw
	5hNFzHViMBVELFoJ2X
X-Google-Smtp-Source: AGHT+IHCVAnsdhFi8VkMSKLmu7Ku3KLARd8TeNT/vK47QyRUaJG+LTfRi/IKTHyD/KvPom88nmKrrw==
X-Received: by 2002:a05:620a:4112:b0:89f:2d97:98fd with SMTP id af79cd13be357-8bb399dc444mr2151909585a.2.1765921412932;
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86a2dsm265456785a.15.2025.12.16.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Message-ID: <a8376a71b87cc8944bf05be3bc45dc2e4fe2764e.camel@ndufresne.ca>
Subject: Re: [PATCH v11 08/12] media: mediatek: jpeg: fix remove buffer
 operation for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:43:31 -0500
In-Reply-To: <20251202094800.6140-9-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-9-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Si22i6HkJzRfHSqHC37A"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134334_201277_402C8814 
X-CRM114-Status: GOOD (  14.38  )
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


--=-Si22i6HkJzRfHSqHC37A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move remove buffer code to spinlock protect area for multi-core

Perhaps:

Move calls to v4l2_m2m_src/dst_buf_remove() outside of the spinlock protect=
ed
scope.

And perhaps extend in why this is needed. Deadlock, bad lock ordering?

>=20
> Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow"=
)
>=20

No blank.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 10 ++++-----=
-
> =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 9233bbfe2d97..da1ca494ed4b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1665,9 +1665,6 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> @@ -1685,6 +1682,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> @@ -1767,9 +1766,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		goto dec_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> =C2=A0	if (mtk_jpeg_set_dec_dst(ctx,
> =C2=A0				 &jpeg_src_buf->dec_param,
> @@ -1794,6 +1790,8 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				jpeg_src_buf->bs_size,
> =C2=A0				&bs,
> =C2=A0				&fb);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

--=-Si22i6HkJzRfHSqHC37A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHSgwAKCRDZQZRRKWBy
9JcnAP9X9/KPI6GsErRhlqFgw3okba30C65KuHLjIZqWoee34gD/fbQFW9sQBK3S
ex/e1Ql3MM0wQLFqMGzHvi8lUaErCgA=
=L24+
-----END PGP SIGNATURE-----

--=-Si22i6HkJzRfHSqHC37A--

