Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB11CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=; b=xalEBFQviAwF6yErTzXfVoB7K8
	T86tuqNqrQyQJqT354YI9+fe1BEBvU2BSErjI5v5h2anS3oHk87RScAKOxtmvVLACgqK15kArX8de
	dmuflJgBpyAbUvvPIo9PWhgrESg90HV473qH9MLggb23BopapYSdbwl0lu0+FgoCHqyh8ifiNgK09
	yghs7aCvuGO3bkJnfPYSuUI8Z2qoMrVYs0pn+Gs+sxzKSY2Uo9T73FsWtbbRQr2aKdVYb4HwAYmP4
	6kOxJwW2tlZOOQs8TcW9xjRPJJJRb64qfIyMPrDsiDWVMN+NRywj+Z9bPfbJIYgxcmD+l11ilgjcY
	UQLh6Gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHMI-00000001VtC-1ZR7;
	Mon, 28 Sep 2026 19:49:54 +0000
Received: from mail-qk2-x03.google.com ([2607:f8b0:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHME-00000001Vs8-38ts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:49:52 +0000
Received: by mail-qk2-x03.google.com with SMTP id af79cd13be357-93c3dfd105eso206877385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624989; x=1791229789; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=HEgzefgczHQX2d/juwbLwT+kU5uGJT7XEoPQmsvGa70ZQ29eG00lYugOyi6jvnqQv2
         qkzM+UxSeUaepbPWm/Uc3+vqpzJoUa5LPKM2KMAEbNxml0GSZuOUTxacmKsCankULTdB
         tKf+eaaz4Fk50oX03af9DSyqV93RYViEqIDKLDbQ+6YtjSh28wfXGQj8/IjeMPZUGgh0
         XGR9553UMA7SdiScYcCJm6Fqm3QSfUmdzF/2t77n+qMSv+d2fWpXp7IhVSVtUA/y0EXE
         q7LxhsuXNnV/g1Rfsxv6zwLHXJ1zk7f+eLNBLUxrHQlp1K9Q6yds+Q1lFxYWbaF9XRQD
         upSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624989; x=1791229789;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=B9pa9TSH4UV+L0O85VxbjFhAS/+59mBYWQvtxloRXYxdwwEIqdn5HXyG5gKLrfrN/N
         jtCay7xLh5iqjnendSjBAl9yG0CQeu0VsVL40H/uLbIqhczWteN6lNsp8ZKsNueIJMjT
         GR4WKsMIiTRS7TeB5AU3xftACN69ri73dzK2QI4YSW3jd+3091u2d90fUf9QGtJcs6Lc
         jcXUtD8GTqILRwpl5LW2qw9xLxQOFr8WIryUh58V0q9Pl77rnQwuXc4LqZFj+Va/0Rg2
         Lkpatrs/juyu76cG8kA2cFyExs90Ed+6U4HIjSFTnxpf2pJnSvNVlMEsj0SVvfedSKPZ
         4Yrw==
X-Forwarded-Encrypted: i=1; AKwUvBznPAE3IY7VA7Ztx/XGxuEKcTu2T6Nq6T70LCDhPMLl3TNlzcX5JfyNDAlEj7de5WVHw+9BhHaGc73B6DWUqx7S@lists.infradead.org
X-Gm-Message-State: AFuF++mwuNtrGH1ajtQuL9uqdlUCA1jM1mX4tdBq3DG4LraH9bGjBdYD
	lhH1j++hspMkxdIxJg+U6WlMPnaBsfZBebdIGqrD6qsnQw6tcJzHMibi5VWxtdoTBoo=
X-Gm-Gg: AYBFou2H31B/c82TWPeK+8Qezj5sGZBcilqNLt5ao9vwPC6Q4JXdGiP2xTGCs3QC6EF
	x1C0BsvzUYl/pm5C8t9Mgb4DNNoC/LV7BTDKafJO1fHm9V65bV/tlyBOyqWPH2tEIDlUZjfII9V
	oZmH0f/VhDXDaoHY//MUiWEHiuVLPC41G9y5OiWD94MG40h4DGOOKj3mhI8+9dHZM0YQ4C7Pc5B
	cRxSTyWBtfIDGobh7gzhAo6/vBxMuxV1LXR0RcPsMN3xMAZN3a+oz8Da+188sivvgmBuJKqhE42
	H5PMBUoIgTTHm6YZdm28PsxHZ7uuxmfkSBYqrN6IdZDJd4m3HbwHZRy4UHmNPOxkAKwo72NnNOi
	g4tAVBuTED7fyrjgtD8SyqmjdzOU8axXgaEG3R4K74RRWX0ZAzZdscEQT4l0UbbCpn/5g2TBkYH
	gjN0wlIoT1+zPFdLXyZuopx5PBKHjTe2swSIbWxRlcvmxO/ELXWlVUiaLYctxDC4g2wlVvyIsgz
	FqYb2ge3nQzJ3d+pQHPygmv
X-Received: by 2002:a05:620a:2628:b0:93b:beb3:5898 with SMTP id af79cd13be357-93c43ce7bfcmr2220308485a.49.1790624989158;
        Mon, 28 Sep 2026 12:49:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813dca59sm227347285a.22.2026.09.28.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:49:48 -0700 (PDT)
Message-ID: <b4666dae3ded36f157d77f839f692a19a3ad9d06.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of in-use
 frames in codec_vp9_rm_noshow_frame()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Doruk Tan Ozturk <doruk@0sec.ai>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Kevin Hilman	
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:49:46 -0400
In-Reply-To: <20260627063905.79363-1-doruk@0sec.ai>
References: <20260627063905.79363-1-doruk@0sec.ai>
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
	protocol="application/pgp-signature"; boundary="=-ZDhsxysEA1cWoT9Xmzeg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124950_802183_2158C7C6 
X-CRM114-Status: GOOD (  25.74  )
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


--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 27 juin 2026 =C3=A0 08:39 +0200, Doruk Tan Ozturk a =C3=A9crit=C2=
=A0:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding frames that are still in use. When the
> previously decoded frame was a non-show (alt-ref) frame and the current
> frame is a non-show inter frame, the freed object is the one
> vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
> dereferences the stale pointer (use_prev_frame_mvs and
> codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
> is still an active reference (codec_vp9_is_ref()) or the current frame
> has the same in-use-then-free shape and additionally desyncs the
> reference bookkeeping in codec_vp9_sync_ref().
>=20
> The sibling cleanup codec_vp9_show_frame() already guards exactly these
> cases before freeing:
>=20
> 	if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame)
> 		continue;
>=20
> rm_noshow_frame() simply omits the same check. Add it, also skipping
> cur_frame, so both cleanup paths agree on which frames are safe to free.
>=20
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
>=20
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
>=20
> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

I can't really do anything about this patch without an actual Tested-by. Pe=
rhaps
try and ping someone with the hardware to let this patch progress, meanwhil=
e
I'll pass.

This is also a staging driver that is likely to be removed in few cycles
considering it not being maintain and there is several competing drivers be=
ing
developed.

Nicolas

> ---
> v2: Per Dan Carpenter's review, also skip active reference frames
>     (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
>     exactly =E2=80=94 freeing an in-use altref/reference frame here also =
caused a
>     codec_vp9_sync_ref() desync, not just the prev_frame UAF.
>=20
>  drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/stagi=
ng/media/meson/vdec/codec_vp9.c
> index 8e80ecf84193..dad75950933c 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct co=
dec_vp9 *vp9)
>  	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
>  }
> =20
> +static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *fr=
ame);
> +
>  static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  {
>  	struct codec_vp9 *vp9 =3D sess->priv;
> @@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvde=
c_session *sess)
>  		if (tmp->show)
>  			continue;
> =20
> +		/*
> +		 * Mirror codec_vp9_show_frame(): never free an active
> +		 * reference frame, the previously decoded frame, or the
> +		 * current frame here. prev_frame is still dereferenced by the
> +		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
> +		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
> +		 * either is a use-after-free of an in-use frame.
> +		 */
> +		if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame ||
> +		    tmp =3D=3D vp9->cur_frame)
> +			continue;
> +
>  		pr_debug("rm noshow: %u\n", tmp->index);
>  		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
>  		list_del(&tmp->list);

--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrE2gAKCRDZQZRRKWBy
9BjOAQCcJJZ7xjpltnqzUdi6P6d2itMrbhl41cjmeE/c74heSQD/fIwpHsmavr36
/iKd8Y6urOm/Xeb/2/lPx2ob8TKg3gQ=
=dr9M
-----END PGP SIGNATURE-----

--=-ZDhsxysEA1cWoT9Xmzeg--

