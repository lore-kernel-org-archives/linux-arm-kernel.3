Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0864ACA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=; b=AV5S64ugDdcBjjHtDiIAoMM2Om
	927RnajeUd4aOvAZre7VBNNr9PEvwq2uTazaplSeXaaadEOVHGaplWCjdPhdadjBAGjanx2Jg+g0R
	snkzph+nmF7IJx0QAxtxnPxTgnbSckDnDzxEAxOVdjHUyPPfyPkjacoWY2pgvchgBOYRHwdKrn+07
	2QIG3iuVj+n6sB39lrcorB7aYt6g5tIutPEiBLlVqx+DNz6mTFrXluTVn6G+Nj46ny0GzSScTzZ0g
	czlQscZt8NC7mztzRDCnmE7o3U4HXlFpji9Bxi6ubBkiABtFTX4CyDJ1iGCV9n7dOx/6KM2Bt7Abw
	nCP9fzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oF-00000007C8C-0arj;
	Sat, 30 Aug 2025 00:51:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5Nm-00000006pVM-1xAB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 20:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=; b=Vv6c9FkcbX7RwKGIYrHJJ+zxkz
	ZPOQwp4/YEjyEYR+uCIxIBw/V0E3vSH6omt2zh3Nv5Je+duFdlsED5l9USohFIq+JhM0/685gyReT
	giTJLRPw+R4moBAH/XA/00ZTBpMkdJRriXyT80RvzkIDDs1g1AZCm9o4ziBxC0meQrP1EaLltfcyY
	0B7O82zjEnw6xxeNx8QTPs+L7nTWHRv8xqLHtNCmDfsw9LD7VKNymP8u/GLZeRZUVYrJEUD7LtXtD
	rf9IOXLxjKq7yOKWeyCziwUIViu9jw6IfWov8mL/zAL+CEOY/7G0MASIiZCPX3ts2I1KCQNkeBPXe
	VMuF03bA==;
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5Ne-00000003Ic1-3faz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 20:07:31 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7e870689dedso158800485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756498042; x=1757102842; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=PTSyXmCBHMEj8HLP8M6KaVZB782S5WW7Pd/fCPS6rwieyODHqwhA5HEgPgIGsyk0io
         5al7vF26SSiIxJmWOFq8ocBMmfmUjMj7Q9dSZbLd6dW/I2q3uqPjHzLCknTQDxDbWgmL
         ++6mQXt3RYNue/SU9wZ/+rAVu/IbcpfUMRmkQ5YeolZKzR1TixkWmwfREO7VdNmH5Gyn
         Gxh/WT7PPHG6yWnfI6bLjY9a8/TXsIHtmMgI/JGKZ3e5W+WFmx0XghCfdKwSQEh2ctOv
         kupw1qlET/Cff+6zkYn87w274M6sixoPNoA8By4STvfbjsEopSnOetkNprwsxQ2Kxmu1
         cXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756498042; x=1757102842;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=XskwFWmfRswvxV/n9lmqqtcQt7WvGG2VqbGbGkcMg0v6KEmwmz73soGEOoS2Ylzrom
         lhAN2Evblp1dRi7UAzoAXo2Xj+a0bZaKAM2nh0sxBDXOAzAmwLsC+W+3oTf9R3gcOcq+
         YWfXaFK1p4vmxkOsbk/FxngQDYB+3SB6FTpp25zubPexoOTaj33mwX3y/0DYq9Zt/EBu
         vyxK8EmtGdMgeCxxyRftL/w02CroTcLP0wcLdPcPwWwQDtFS7A0AHBOWrz5e5nbY9NhS
         41142aSbkvi2q8FdbQJddkXDiPspjILKQtaKOGcWIgeOgNNJgXLL6EVJUr6xtEteZaga
         ds4g==
X-Forwarded-Encrypted: i=1; AJvYcCUA0o7HtuTXLIJUSRFoMeeswsu6Z2Lv9vZtOurRVPRfVvFKm3iYFBRmFO+/IUf9CnzNC8MYJsK1E4NCYdBcVUeg@lists.infradead.org
X-Gm-Message-State: AOJu0YxRABwIgSq1tEGx7Ca8vKR0PNWfpzDbbKYG0V2Dv4oaeVoFPAXU
	6BVi9Q6ykyeTunW+PxgS/LRK5BC6lY7FfGiTleBzMe4F1kr/WT91NHUahQP0EMQYTyg=
X-Gm-Gg: ASbGncusaEzelp6eWFMkmfnjoCsKIpjnKR43u27DDctIEx/X672umix6SU9Tk9+e/dY
	Wd72O+v/b85fQKRhblLRGHLSm2IyvJ/tBzxFcu6mLfMqNMxhzpFH6Fv5kIvBQw2j61MZo3Ksjs1
	Ar2d9WpEK2fuIy7kpoNvTxJE9FOt0F6amjyhEp3EvDqEYKGviLvBdlrfLiOZcR/g9ouoZFPCgwq
	S+7xZeVdr9MHZUbIk6omo95fjWnKTUWBRFCIvwn3t9BN11keC0P+LapDHhuzaFcsvwmWB1/GtsY
	jt57c5HQKsbdmAsn2ZLUfO1VWA5u9YlH0UUvSnYcyFzfz9/tt+tIeyv0bMcR2JOJ4cQKIzfcJC8
	h2DQY5NVuKQzg2zDfAYwryDkqdV1BnNFAUkx5Eg==
X-Google-Smtp-Source: AGHT+IE8DhCsJH0EvyAuK4Vz9280U37BMOETV4y3Nv5wsQvwvjEYFAHtOUrIGVOTCD1Tn4oDmElK+g==
X-Received: by 2002:a05:620a:a119:b0:7e7:faaa:e7c9 with SMTP id af79cd13be357-7ea10f7492bmr3210665085a.12.1756498042375;
        Fri, 29 Aug 2025 13:07:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc15c83bbasm232495085a.60.2025.08.29.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 13:07:21 -0700 (PDT)
Message-ID: <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 29 Aug 2025 16:07:19 -0400
In-Reply-To: <20250725080712.1705-1-ming.qian@oss.nxp.com>
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-lmqDXEuDoXQ5YOWLo31s"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_210729_717843_0CBB3891 
X-CRM114-Status: GOOD (  23.65  )
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


--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 25 juillet 2025 =C3=A0 16:07 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For Simple and Main Profiles of VC-1 format stream, the amphion vpu
> requires driver to discard the sequence header, but insert a custom
> sequence start code at the beginning.
> The first buffer after a seek always contains only the sequence header.
> But vpu_vb_is_codecconfig() always return false as there is currently no
> flag indicating that the buffer contains only sequence header data and
> not frame data.
> So driver needs to drop the first buffer after seek, otherwise the driver
> will treat the sequence header as a frame, which will cause the image to
> be corrupted after the vpu decodes.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index ba688566dffd..a4c423600d70 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struc=
t malone_scode_t *scode)
> =C2=A0	int size =3D 0;
> =C2=A0	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
> =C2=A0
> -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))

Please remove vpu_vb_is_codecconfig() entirely, it always returns false, so=
 its
miss-leading.

> -		scode->need_data =3D 0;
> +	scode->need_data =3D 0;
> =C2=A0	if (scode->inst->total_input_count)
> =C2=A0		return 0;
> -	scode->need_data =3D 0;

I only remember testing this once quickly on Exynos 4 and I had no clue wha=
t
Annex G vs J was and most likley the MFC firmware was detecting it. Checkin=
g
quickly, I'm not sure GStreamer actually support both, despite the v4l2 wra=
pper
pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the other =
used
in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.

Have you tested this with FFMPEG ? It only maps annex G.

In general, I don't mind the the change if this is correct userspace behavi=
or.
If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStreame=
r
code back in the days was design in a way that it should not matter if the
header is split or not. This limitation came with lower latency decoder lat=
er,
but none had VC1.

Please test both userspace, and lets see if this solution is acceptable. ff=
mpeg
have ffplay and you can seek with your keyboard arrows.

Nicolas

> =C2=A0
> =C2=A0	ret =3D vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIM=
PLE, sizeof(rcv_seqhdr));
> =C2=A0	if (ret < 0)

--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLIIdwAKCRDZQZRRKWBy
9AwxAQCJh1T0bFehpk0F+AD8I2rT9QoDpnwtdP+Y3WjH20xOpgD+PqJE3+yMnDsA
UjNnQYnMYU2r4Puchu4W9nu8fZiitQQ=
=rWlj
-----END PGP SIGNATURE-----

--=-lmqDXEuDoXQ5YOWLo31s--

