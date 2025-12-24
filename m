Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ADDE776FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=; b=a8UHJI2WFFveyyGlT0n1g6oHSH
	87UNGDIEgEVavYd9VC6tgjBbAu7emSG7MAH94ejXJtjYK6LMoaZZHeYqoodpG+LzU5R+eKV5jREbU
	LGjUAYmjzMnFqSAizdfeumy/8zsqaGa9RYV/mvmHDFg7AbBLzGtDK3xsa/jMdze2/v5Xtl7ApQFxz
	6mw/LjfSeUfGtajxdc7+ILfoh1e/+ZiTBf0ZthmKLSyjbKSL4b8CUDEEoha5kYwNnluXD38MjDkAh
	3ie+T6Tav0XsuyAC/jga57sIVoyZOgoUz9OokuEwKwQ2dntvSlOQkD/Dh1OCMIvNKsiyn17IoplJg
	LZRafsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUOz-0000000HLps-07mr;
	Wed, 24 Dec 2025 19:20:05 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUOv-0000000HLpM-1Sqi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:20:03 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-88a3d2f3299so72500176d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604000; x=1767208800; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=Py1bths248QYl9BN73EhLAumSjyKe/tUzLWl8hmU0RBdjLF5I6k3K7PsJ98uwldykc
         9NSWhwYTkF6enEDbwa0pYIZh5695TJBC+KyI8TJOcMWZ53KKeHUhwFGk14nDAtJRBRvW
         ptcypq4XurHpVGiBBCQe6npAXn18GrLRFhZo/ajYSDfmr2OBI61FZbC2LFuAAwejUswY
         5rY9XcYojlGEaAy0PEAfRYTeUCHst3fmzQmt0LkSgmeuHSroSPLKNNQ6WnQ2igYACCvT
         AptfHN/Q1mqUmUr1FCizGueyHh/ZxlvbwKfqcAuyohgHETIcJLYxQ3GvzEuCKq99pPcS
         MRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604000; x=1767208800;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=KccWpQ8gpRUOfe7wBmMXncD1wWKQyinY/+OhNNScN9VncDKQtvxPpNSqFqevM5OWNS
         HbFQZdonpkpc94NTmXquKzOjft2m6UCr1LKQC0xKBeYx1chHEZWSCaUQYY7uOosvg0/x
         ErkX7Pe5T8S+lVeF9ulSsAHRua1UoHglg/NYm6YXATToKKUZBMU1ChL/96fu1Qvkvqij
         QFKQYFb2iouR6lFd88XmBIcakEL/57SGpO69kjP7bNycWV9nAkRJ5UqHJxDhQmuRqIGw
         UpmhBv6CUN890diP4o4KddMOSyxX511V320wSyQquIUj5uEjSi3tATadMMBSBOBhJfH/
         oroA==
X-Forwarded-Encrypted: i=1; AJvYcCUWFmRkoTHyvtpk/bb89Nhb/lpS80pwcrxafVdOaQD54i5bHyH3+V5mkEecNVqPYwDiPjnmv3pND9O1cghdrsxB@lists.infradead.org
X-Gm-Message-State: AOJu0YzrSiDisylHkWuaEo/doTRt1XFdPfMDvfTQ2hmx7P3qUTVZpss+
	v1s9263VXZxMQUKxcPgv8no15Pef8iZPEGySHCRxiMnIJ3iPlU85fTB7HJChsx4Oyks=
X-Gm-Gg: AY/fxX4Ehbw5loKqFMifgTOdmEfgqTRwDVqxv9zdPvPKMW711YVNAEuwT9j0A3tgbt3
	jaktfu2+lAws1+DE7VR0Vrl4jTHLLQzItvRnIcfCHKYcsmLm984ufUvVcOpsn2+N2PZQG7tx8ke
	hs8JFbWQQHwiH/2EWrfFO1iJ3os2Oa/ZU3yaJXcuPo1Nq22itPCefYOzrnKbcKVc27r/Tj1oxRl
	RPZJK5r49YaDTjkxhcyzTg7GYwMulA+v0fN9tr3v/2I+Ti0veF3YNNJVM7Hf3Sa84LYFxkxXOvy
	P87zE3HB1yn1W1zQmlfdyWxiEcbibyGDUKUxFJ/fDMaQOJwfhw8+xrpaI+tz+lP1cJw4lgTtkUF
	tR8Xr+kPXcsFJiMDhAhGAw7PoeV5GZPDwXavQCas+qkX/CWfmoyzCBtzUOqLng+t9aFZQGohzb0
	yBvmZzqsBFbxe3SgZvWNYTi8BEym8=
X-Google-Smtp-Source: AGHT+IEeDZpPPu6YZwcQ8tx4vjP/alqKLZ2iCL81HE8OxCMqXyviVYCPm8KNV8TIbtaCK6+e47FNYg==
X-Received: by 2002:a05:6214:20a2:b0:880:5279:98eb with SMTP id 6a1803df08f44-88d86290d80mr291887636d6.44.1766604000085;
        Wed, 24 Dec 2025 11:20:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm131729676d6.47.2025.12.24.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:19:59 -0800 (PST)
Message-ID: <5500fa4f4ee321a451360a84cf5834781c1a9615.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/3] media: amphion: Clear last_buffer_dequeued flag
 for DEC_CMD_START
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:19:58 -0500
In-Reply-To: <20251217030227.1546-3-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-3-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-TbnDfBH7kuP5a4j2UK4h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_112001_396661_FF6FFB65 
X-CRM114-Status: GOOD (  13.31  )
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


--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The V4L2_DEC_CMD_START command may be used to handle the dynamic source
> change, which will triggers an implicit decoder drain.
> The last_buffer_dequeued flag is set in the implicit decoder drain,
> so driver need to clear it to continue the following decoding flow.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index c0d2aabb9e0e..f25dbcebdccf 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -724,6 +724,7 @@ static int vdec_decoder_cmd(struct file *file, void *=
fh, struct v4l2_decoder_cmd
> =C2=A0	switch (cmd->cmd) {
> =C2=A0	case V4L2_DEC_CMD_START:
> =C2=A0		vdec_cmd_start(inst);
> +		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
> =C2=A0		break;
> =C2=A0	case V4L2_DEC_CMD_STOP:
> =C2=A0		vdec_cmd_stop(inst);

--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw83gAKCRDZQZRRKWBy
9N4GAPsEStp+V8u3PcY6TUQYOCoH/OAkqDJ6OoG31fahIVD4IQEA+Bl3uh5sZQhc
KDFtxNYkj8x7KW7YxzN9h3vDdlSs3AM=
=bMEn
-----END PGP SIGNATURE-----

--=-TbnDfBH7kuP5a4j2UK4h--

