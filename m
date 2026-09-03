Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AAFC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS5+rJblKYEfHvwn3uJ9BzAl/oWa4dPgbHxuamJmb0s=; b=E225gXALYMDemAf+6pj6xT9fns
	kmD7gJ7qhbQdAbvD122wBdrC6uwshd0ZKTFLiBGnoQOpbm7dh/gCU86quWUHKBNgdxm2NnQRSAASZ
	jkuxMlbnrZL5+hzf8kQyzw6M8V/9HuMcNkSHANufh3VS4+J4LUiXhBXKa+IAmKOBGFFZSGKQbbsEm
	lj9cN13mTApdG22DB1Q3xwRXjap6J0XMqO9PpKQDtiNZ/4HUTVYgc5myEnoa/78jkg5523C0bOzv9
	4KcUKAKZNnL21T2JuoLTtoR17F/qTLd6vjxIAtRZ4P3vuX1JSO7gq9bkoart0XHm+vzZWG63hTHYQ
	c17LRhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27SQ-0000000HObw-3Axv;
	Thu, 03 Sep 2026 13:26:22 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27SO-0000000HOag-30LL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:26:21 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-930c0f9c1b1so254614885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788441979; x=1789046779; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FS5+rJblKYEfHvwn3uJ9BzAl/oWa4dPgbHxuamJmb0s=;
        b=LfdAZinMoQWvTNM8WZ8HLWtUTUWs1W3AxS6vgR7IF20ZlAmehzb8+2t2BagB7F6Yrl
         juJGADHD7yNLSRpQ8e8l4K6RGq5pW1i3hfxRKox1yp3TIhkmk+/L+xjH/qoqfVscp4nu
         g5OvoQXakJHAMO7H5+30yU0g2UUjwqx5M8YH2WzrIu1WT89cv9r+uLobZNx8JwZe7oee
         IF3yH8XzVabY4J9p6JWgrrocPlYpZ7uRCEV69Y98wbNrnIpvFjJcj+JLqlqXvK6uhQHF
         BulPKSVlGWE+Ez70wqfgozN7CmIz6msiITnilfqRWIWjyOaYCRT+kniPns7x0exa/gqJ
         FBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441979; x=1789046779;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FS5+rJblKYEfHvwn3uJ9BzAl/oWa4dPgbHxuamJmb0s=;
        b=sAhy96WnCUxBenIuuuq8nLECPshfN6gHcDVKRhwVWyhEDHTUa/qjFGRrEMZW+xYHw8
         yhdKgUdOiJiKpL8A3OG1D0hGnWgJtheRF3iSVXy+Q0HM0ifdFaPOD4IZV4fN43Fw+xSP
         tsbcvzEJHy1vt8XMPSAOCCptuegKi5WHoBDCTVO+nbjL4AMsq7lefYL8IbgSrzjsJsd4
         aFfSxAn3Ar5EzDtU1dbW3pNlcTHOQ+ZvHm8GqLMPi65E0XG1EesEJ1wSWhV1nkS+q674
         fuCbKHvC7JH1hkQ0mWEc10oQXQ135xdta1BeohPwl9isJr4IFis5ihk0YTgJQsnARSHN
         hNGA==
X-Forwarded-Encrypted: i=1; AKwUvBzeHoY1bKdbrHREVSYGKsOUP2Rj3jshbYttcbPnQuUcYkeGrfIbk33eBaHA3attflHcgXikf5giCohRiG9qoM+k@lists.infradead.org
X-Gm-Message-State: AFuF++l0SNYg8sCIojZT697nwIRL7rtNsw1LP2XCrGb5GvR36gezghuw
	GMTKYQxQrkXZCMk792Mb2WUpn87s8JlURLoKl3SGuthhG2aNZUOj9puUT8gPhvo4S6U=
X-Gm-Gg: AYBFou0B9mrX/5DhEZz/au+qTJQKJ/qMfMwED4zNw0rZyhr/jdEFPYioAopG68HN55U
	HjXjDgclo5G8PurD4Ap8VUYn7rECd/F4I3LrBq8TMLiGD4BKyrgNy2WwxozoWjFA8WIDZbcwBEC
	vpZxqsAo5gSbzhJ2vfmmjLrhVXVzlgSsAEVP/5lMO4D0ED9vKIvPcW3K6lcLWcrKS/Ka02Q+seK
	l2ppUHCb9PLh9MoNUPeHMmHJSRaLi4Zn+DCGMA4NWLhIMW2H9qwOlC3vYRYQHbIUNfMarlct/q7
	OaLMic72llF7D1VCyMYDm8ELSzCgRGinfFlfUTk1juH0QVDh5c8hCrQMZJgPPtpSd9VssR0BRNW
	p426n+vs7VLe8iiQHFNf/rr5E4cXAgYqH54C0+9ha5HHik63+4JgspkXC3amNOZNU6irr6VlR+7
	yQzNBWhwwSQocg/+jDDUciUis7wPhoj+VsyDWUAmz/Acb2fKviEX4J9lhohR3VWEfj
X-Received: by 2002:a05:620a:4387:b0:937:2e9f:70a8 with SMTP id af79cd13be357-9396e48bd68mr677603885a.39.1788441976610;
        Thu, 03 Sep 2026 06:26:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::c41? ([2606:6d00:15:e221::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1539f0sm486856785a.10.2026.09.03.06.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:26:15 -0700 (PDT)
Message-ID: <e7aef28efd9860e80b8be8865dd04268ee2fd786.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: jpeg: Avoid context access after job
 finish
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kazuki Hanai <hnkz.64@gmail.com>, Bin Liu <bin.liu@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>,  Tomasz Figa <tfiga@chromium.org>, Xia Jiang
 <xia.jiang@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Thu, 03 Sep 2026 09:26:13 -0400
In-Reply-To: <20260902112230.452176-1-hnkz.64@gmail.com>
References: <20260902112230.452176-1-hnkz.64@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-9FOa56BBGzqoLxtHjz2i"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_062620_771092_480E4A13 
X-CRM114-Status: GOOD (  17.63  )
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


--=-9FOa56BBGzqoLxtHjz2i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 02 septembre 2026 =C3=A0 20:22 +0900, Kazuki Hanai a =C3=A9crit=
=C2=A0:
> v4l2_m2m_job_finish() publishes job completion and wakes waiters
> before it returns. A concurrent file release can therefore finish
> v4l2_m2m_ctx_release() and free the context while the single-core IRQ
> handler continues with its tail.
>=20
> Both handlers only need the device for the matching runtime PM put.
> Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
> completion has been published. This preserves the get/put pairing and
> removes the post-completion context access.
>=20
> Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
> Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flo=
w")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..9010e7b1108fa 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpe=
g_dev *jpeg)
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> -	pm_runtime_put(ctx->jpeg->dev);
> +	pm_runtime_put(jpeg->dev);
>  	return IRQ_HANDLED;
>  }
> =20
> @@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *=
priv)
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> -	pm_runtime_put(ctx->jpeg->dev);
> +	pm_runtime_put(jpeg->dev);
>  	return IRQ_HANDLED;
>  }
> =20

--=-9FOa56BBGzqoLxtHjz2i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapl1dQAKCRDZQZRRKWBy
9DhIAP9oMCJ3+qbEiROH2krc0Am+crQeWpa/pbhLHgt1o6oPXAD/WXV6nBJA6ZC+
UGQHbSlMl2Vy9ERh3f8kD3KvuG+zCwE=
=FjHo
-----END PGP SIGNATURE-----

--=-9FOa56BBGzqoLxtHjz2i--

