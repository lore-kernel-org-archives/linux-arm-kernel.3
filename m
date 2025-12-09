Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48504D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=; b=qVXTy6kmTGv8GfHECuCjUerkZ3
	QvYzeIulvPRLkriGB+Lq+PFeuvzldGxXB5FFdoYLAorTR+WcbdKIm9XNoeNqpkMWg2tu3I5csuTAj
	HSdShpAhoZURaK4CEsgVRYW2o/Ok/9azY2gNyOutpgVUjwkA4byDppwSkiMUCYc1wOAwjCPpv4meI
	T72Q7dPT0ZVjg5ht3KEKfdHLDtZbGp+qRUPpGF6qrHwNplBjRwcEIk4Cp8QEFOfEip6mfO1H7pn3+
	6EXg1RJ5OiQfG2qO1vBszYtxROBPfo6BY46gbVuaBxj+xOtRYCXjPw17Niu3+cfVu03JglCDLA6PT
	roOPt2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4c9-0000000EkAE-1koP;
	Tue, 09 Dec 2025 20:47:17 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4c5-0000000Ek94-2LB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:47:15 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ed66b5abf7so2174441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313232; x=1765918032; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=EgaUsGvfTqTyfb4MQ88Ki0tl8bYQFAYvqIR8Clh+G/aAmVkOb9fSyZhsbpygzvhs13
         oNb0NBfkvWRHnVYtK/oWW76NXsJh2f3M1kH6ZOWMurhdQ7dQdocR9zvz3KaQsnecHD6s
         6cAx5MAui9Rqd1m4HV+sqBbCj3sGuv+TqZmCrnO5Z2WH5lYhFoF/D1CY0rY60jvvU+AT
         n+phX8U2GPAaYupVb+6akhVIFW4FRthuP+C29b2qhEtpf6WQ+ub6nW3Bk/gaVPOzxI+j
         X/nAfHjK595j3no5o3Nprtxu1gqgSSkZgyasFVTDLN/AQCH86UkxqsjiJPLXbWPzNM5J
         lIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313232; x=1765918032;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=EVO8cTQw0g+cOvn/pWS+IQJTBfcMQlN8eNyZDOkuvqdCMYhHXxidZD2vmsLwHXX52a
         mxAEvwnx/pOWtWpoTzyzRzEhIn008XhMDbdIFa79R/tN9v5POts6Ds6pco38OlUbz/wx
         IQJP7ZuwRiqtxa6f0yRdFfzEbQ2890Yv3xRSBpMVID+qdN1Cz25cvxDHhO0zN78Vxt4W
         rdX4/5/HZF1C8GLhqUggLWzP2sASjBih+YjtdhkoUK4IGlmYfMDn6UUzeOMs98KXOTql
         8zS+CJwGLmZjJ1fE/SnhKVVjiAc3NzOMk/5Pp9GsjSYc9Zm25mPthBMCS05htmCnMBWJ
         2hfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRNk98Z88b9ntpeZqNlHzbDSXjlFxQ7eWTfT02htcMyIWEDTtrSwGFS5+vAJMyapdUEnqCfWGNVUHqBzPjvTXi@lists.infradead.org
X-Gm-Message-State: AOJu0YycT5mP5c2wBhtnuFEB8p46uL82y5gCGw8MSJJUGJjsmQaE5z2A
	CJKdeKpBOIqMk1GvAJsOwJPhpUSRcGnbYwE7T+j/L060MBPwZ9WOlDRaU27HrNa/XTY=
X-Gm-Gg: ASbGncuFk+dJv/krfEHxnD2nvbPyHCok8/9bLD+zp4irKhev3w3hXLIa7SmwX3JwlCf
	T8dMjOfLDT05ZJmyB2D0nQwO9mbQkf1oAqIoyJsxtlL7zzDTb83q4gYinnybuYFtq/h9kVYpmr8
	hC+fjy5qUdlLQTzVmpcHLzbfcdOjWsWkKO8j+PsGBxru4J6ySPAxbKk+YOmAinZg1DapHmIPq2m
	fCcTgSLgb/5ogrlQg6rKqHopFhRfAUJNzHY14Jek8IL8wp+eczBhHK9Veh61rt1My+YCqT71D3m
	4wAQLlu0rnBNsD1Cyo7Tho1sw9sx6G/mclRwy2F8G87s5BGysRxZksVpr7m3CinA31zsVKM6n9U
	wQdmdkP4+ImMixXa3nstgiyWwYMFNKb3M4RE1rXwEV9o4BuQcY4Ij81wuxTUO8FidR6u22VP1YB
	VXeJ1AkIXcvM/yPmTJ
X-Google-Smtp-Source: AGHT+IEoy3WsJss4eewDF1IObVZFsEEO8RMc62bsDTegGuaNornhGcbzFkR2E0lJrV1isVMQC9W0cQ==
X-Received: by 2002:ac8:7d86:0:b0:4ed:b570:569 with SMTP id d75a77b69052e-4f1b17f042fmr1022671cf.27.1765313232127;
        Tue, 09 Dec 2025 12:47:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d2b3a4sm108009241cf.25.2025.12.09.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:47:11 -0800 (PST)
Message-ID: <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar	 <jassisinghbrar@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang	 <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao	 <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, 	Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Tue, 09 Dec 2025 15:47:10 -0500
In-Reply-To: <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
	 <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-MnGLK1uGO3sHzXuy/5rZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_124713_631326_DB1469DC 
X-CRM114-Status: GOOD (  20.07  )
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


--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le samedi 01 novembre 2025 =C3=A0 00:02 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
>=20
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index d0b0b072f953..5fc9263ccb78 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]=
);
> +	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);

I cannot take that right now in the media tree, as it won't build. Can the =
SoC
maintainer help me know if I just leave that on hold, or perhaps you'd like=
 to
take it ? (or its in next, and I just have to wait for next udpate?)

I also doubt patch 4/5 is make much of a difference without the soc changes=
 ?

regards,
Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;

--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiKzgAKCRDZQZRRKWBy
9HnQAQCvZCLQCXpFlsUfn7DWx1kuIT+I+byuKT/dhCrJ0Qly3gEAh9feswFfhKgL
He/DKiOx62zT1aAhbBCmngiS+Tir/wg=
=/OPV
-----END PGP SIGNATURE-----

--=-MnGLK1uGO3sHzXuy/5rZ--

