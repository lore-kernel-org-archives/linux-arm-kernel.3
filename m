Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A636C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o35UrjNtq/9PqTqBpZL5KY5EofIPCDLGs72Jh+BPK90=; b=dDD2VBKAHU3NUy+9TzpdX3znk1
	EwhOey6S9MK9sipqmLJPkhrCDSZdYv8PbkvUKvaL12vak9GwJUcJa4HgbHFHoZ+ExIWHNSrWHULEr
	98+Z2VzAIZM7H9R41Kbf65foTyUByPs5DvHIxHufri23K19SpnpEQcs9LuS5n7fdzQwJ0WK8n6QoL
	Hhln4jTgfpqsjYAtNju4aUZ3WTWejO7BMJB9TPSmhE/RgW5ofWL9F5luP08vU4I3G8tFLRZflv0pS
	uY38fSgbbc2Bd2wdVSF3kHbqS7//ecrnKm/gqAv8cRY+Ou8+uTs0dK+DQYLZLpG4oxQITmms/cvIw
	iyDdX5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkB4S-0000000GD0Y-3N2m;
	Thu, 16 Jul 2026 01:39:28 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkB4Q-0000000GCzs-3AZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:39:28 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8e5be46f663so19352256d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 18:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784165965; x=1784770765; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o35UrjNtq/9PqTqBpZL5KY5EofIPCDLGs72Jh+BPK90=;
        b=R+bMKb5de8mO2HhUbuOk05mpiUp+WLnzMU+IrgP0ZcohjIXEO2Eqr52n6NCjs0NE0J
         w9VfLdTtazhbiYt14hggnKfe7PzFt978eCIbMzLaocY1Lzl6Ul9aIEoOXSqdRPaToLyR
         gwRoi/g1c/WO+XXkE1e8dJhmwUCzL9fnat5UGlb7s73COwQ6VBtx/fIe/QsMYzD5LzqC
         a2f9PKIcIpjV3amQzVgK9CB6FL3yLqSlJi45a5AW9jG153KVWnyAuZnGlp06OQiNUvFZ
         MXwLqT0LbsZ3OXReUiK6ezTmtp1i3ySYaLaP9fasigSx1SwmPmYU2IggVsxqfdj3BT/G
         p8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165965; x=1784770765;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o35UrjNtq/9PqTqBpZL5KY5EofIPCDLGs72Jh+BPK90=;
        b=JxH99vuBU6sYTVEwYV6ce5HnetP8Z1S6U/MHl6Ev2B0vuB7hATGDzN0rgVzvz+xLQC
         JBXUKi+V2+I9Dk1S4UNFj/cIzFq93JXDO0SMO+7JfgMKfCIb6mxSb9BMmGRT8Tdkt8X6
         M3Hp4Mj2EXa9BRZ2ZtrNIoSYIAUUbXEE9Mi0UvE1o/8QSlakFv0BFmvzTRoovGdojtX8
         x8IcVS7PcE+gDecCawfoErcvzWJWz0W566FCeAd5pbqkKIoMjwNTpbuVBOcFDj3Mt1vc
         R6f6bkftmzK9wFAp8Aa2cewbUXLqK1AT6NjfHbD5xLzTqGBePu5Ny5iwW19Rs3K9/Eji
         +dPA==
X-Forwarded-Encrypted: i=1; AHgh+Rrd5qC7UYbY3SMoErGkQMaaRYdGYarLpaPmWqtVkXStXTHP/xdc+wWfju8OvjWERb4s4bcw+uiRW816qnTfkjMy@lists.infradead.org
X-Gm-Message-State: AOJu0YyH4Yzii3A3Oy7liaU2jHsw2y0xI/s7OxXIiaTt61FjCZywVdIJ
	htVIou0NpggJz3n9SNPNGucjowRSU7Q3Qd6mOufRUQ/s7sNT9Nb7aum8N301B7eJevNjbeX6hqC
	+1gjJlEYnwQ==
X-Gm-Gg: AfdE7cnimUtBkryER8TXFRC7HMhkHTi+NoSloJd3Ptu0AiDZXuwNNeMa6iiZ2Ij7hkk
	guXglbcI9bHQc66Vs1RTGFAV9zN4+4PfA8tL3Doy+5GLJ5dcJLrIg82rgFGUh+eh9t9StrZjDPn
	fmBzSwZ5yOipv/alhLSVrBxy0NWiYdNT81ZhJlsa6SH85J9MxtnY4SyJcrLBl00coQzeM+ELCYo
	G1/Ialpyh4bjP3jXNR/f0G5GANodLOv/xqDaAy5jsdVwt+2jDa6jO/UXtat3uD6fVS+MMtabCkC
	JexNHwxmvGsxortZZvPBoRKzwGflLcayNIjl0TqvoIlL0Ei0z2riR/LuhJOBsRgP/ds2hf9xKvD
	fkluGbeHJVrkM+rpEhnzXyQMlzJ75mrRM6nwv/N2NrJoAhIArgbz6ysEK5NtYF4wFJe/QntshU1
	kboBljKXo=
X-Received: by 2002:a05:6214:5690:b0:907:44ac:7d12 with SMTP id 6a1803df08f44-90744ac8560mr141790576d6.0.1784165965448;
        Wed, 15 Jul 2026 18:39:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e3083sm211640406d6.6.2026.07.15.18.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:39:24 -0700 (PDT)
Message-ID: <b64967970e0f4603c657e00aae470338596c8912.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: jpeg: retry HW selection after
 successful wait
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Bin Liu <bin.liu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 21:39:23 -0400
In-Reply-To: <20260625003142.99598-1-pengpeng@iscas.ac.cn>
References: <20260625003142.99598-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-ajCJVLhWCnhF+L41nSrD"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_183926_906957_7D55EAA7 
X-CRM114-Status: GOOD (  20.84  )
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


--=-ajCJVLhWCnhF+L41nSrD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 25 juin 2026 =C3=A0 08:31 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> wait_event_interruptible_timeout() returns a positive value when the
> condition becomes true before the timeout expires.
>=20
> mtk_jpegdec_worker() treats every non-zero return value as a failure and
> finishes the mem2mem job with an error.=C2=A0 A normal wakeup that indica=
tes
> that a decode engine is ready can therefore be handled as if all hardware
> remained busy.
>=20
> Only fail immediately on interrupted waits.=C2=A0 Keep the existing retry=
 limit
> for real timeouts, and retry hardware selection after a successful wait.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>goto
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483..391db77a6 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1697,7 +1697,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		ret =3D wait_event_interruptible_timeout(jpeg->hw_wq,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_read(&jpeg->hw_rd=
y) > 0,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_HW_TIMEOUT_MSEC=
);
> -		if (ret !=3D 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
> +		if (ret < 0 || (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME)) {
=20
I agree with the text and the code logic, but I'm wondering why do we use
timeout for decoder, but not for encoder ? Perhaps we should have different
error logs for when we ran out of retry vs when wait_event failed ? I would=
 also
like to see this condition broken down, maybe by moving the goto earlier wi=
th an
explicit check for the timeout ?

Nicolas

> =C2=A0			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> =C2=A0				__func__, __LINE__);
> =C2=A0			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);


--=-ajCJVLhWCnhF+L41nSrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalg2SwAKCRDZQZRRKWBy
9EKgAP90BemGaX2V64ADTSjKHQcOn7AUDJfrFbyKLXYCpE2VhAEA0yEDhiKOxAYO
fc7d+kBmDTTYXNPE9V3FDWD5rRAJeAk=
=PrLI
-----END PGP SIGNATURE-----

--=-ajCJVLhWCnhF+L41nSrD--

