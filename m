Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF6BD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdB60+eboYB8mcQkNMp1+tLftnngs0TeTeQCleurBBU=; b=BFYtsSXVj+Sn/tTuQnbq1fvgoh
	0lPFX+Z5AV8aqCg8mzmLgprRyseuqhRpqVAWIj8PikkM4XmwWDWhHNBWGCXJ13PEUdwW7f0/fYTRq
	9bTdrdFbow5V+x/33lkMIpuB+buAzyRpEptoQNEYHkycJPUjrDSVYxefUH1/5rPZHzwyd93IQnk5u
	TCfFVkGptKfEwrTa5FkagNBkEePZnEJLAxwC9elGSt6CVBQ0paQKqnOsaMciEI9lfZMrFqI6oc2nI
	/QmGYNZZHmFtoloJn2+V+H8I8jp/rRUcA5M8o2ul/aV0dJ3fQ0b/rCKVQ/LaRye5L1V6TfGJhNPyg
	UW7EGLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4qD-0000000EnJA-3RFF;
	Tue, 09 Dec 2025 21:01:49 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4qB-0000000EnIR-2dU8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:01:48 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso20881385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 13:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765314106; x=1765918906; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdB60+eboYB8mcQkNMp1+tLftnngs0TeTeQCleurBBU=;
        b=CkohW440rgbOx2IT1+V4rCpo0tJqFJC3FT1iTGDup1m9uYKNannJywOE4QjKyx5Xvn
         WJpFyPWzCSIasGWzRy0GTX/1yHqIl2Kt6vq6SRnkMZDzCegQs9YI3ZP+uXcp8msIYZzj
         WbGkszmu2rrvWIodUyCJOYpCUGg5GxyJiWrJPP2P0N3kUqkwUKJ/dzfaNcjxqor7KLHN
         XrNjrvFVkWkEbrEE7PusIRUi2sF4mFE8R/5NDINnEntavDIJCTksn+S+dhlGW5+UFZUf
         o7ksHICBlapUrVMVAHpsV4gINj+BeVeJvIPrrOABSZPTXkCbE5aNfZeXykE66tAn5t/V
         zP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765314106; x=1765918906;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdB60+eboYB8mcQkNMp1+tLftnngs0TeTeQCleurBBU=;
        b=N8qygwpU0xaXGGMm4oIgMx2CteSG3lUc4WdBAhvzsxM7vZ1nOSxvUEpBmoOP6+gv8z
         gYpL8m8Ngrrp7VfrjmfT9fEYcZ0l04dIDff/HE9IT9/z2QBiOLXtwDGnjokQyE2EXYK9
         PA+VeGcdv5jXmIsPPRcOA8yMAe5OTLQ6WKqaaBDYfCaDUsus+MbOCOPPtnrPdu5T+KDT
         8+N2M7oxmmhuqPfVBxpvHamqSTdyri9Q7H8FwQ9X/IyYIgkB9cOg80TK4KggZCGOq4gV
         BHaq9lelh/OZp8eiIDFEI9zUS9sZWllb6xBlVOqYppQ501XbBMNYn9QqH7BImDmFD6MC
         WsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp5gxI0J2f3A3oOesyUaHe8lDRKt87fOVL+VlFEmQIIEWODrwh76GLebcpHvGl9/98wWMx0ayMMwR0Vdxacnhw@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTPHlaGzUGQMsanBZSEmCy03+ErTUi9QZKb6TfcFdE+2dAT1B
	Gv/7/KPV++3FrCKZk89+wRR63SS/EwXwQLwf0v5+JA8G8YngzIgUiJu8Ts6bl8re5BQ=
X-Gm-Gg: ASbGncsvZjT/pxhORwsHCXbPXqXkeBi5EPXw7Pcla08mLGKCZ+1AGzW/eUbOWfjiBXV
	ILNrAKylZ07e8M0kVDsqIhwgVSE6NMgXjUrU4CRgsC2V0WzETW8f5+6SFKlZ5XF3ZBGOfmU6v+r
	tVBNw6yjK8g8aP/Ywq83uCf5vPeVDiMLeVQUW25oFluKp+2yWwW5DGqQJUaafrLZCejX6XQdMjx
	eWuYor/kATGlzeovNdAyY+NQeH4opE7+P3h8qcosXa6A1L/uUHtqrYj8Uh46ii2MzJp5f8AAM/t
	1mfm9o1ir15Hj0eBnLwR9n8OCQ+AithG+3v/4hNeSr6jYyUWKtsOSD23At3whtO2sRCWLFNL5Fn
	m5FYySYUyLqJ7JD6vHTKODP8YlewckS5EI0bIvHgJ8qIigP2e+2NKkKQ8EaberMwtzAsZw4KJ9n
	MJ8ngoqiNZlrsRhrkd
X-Google-Smtp-Source: AGHT+IE70E6Yg8SvO7c4cluG29AN/MEVghrbdBWJ2DadPgU4cJuuz1Fy4vVBOHbqQWY07mt5r6xw3Q==
X-Received: by 2002:a05:620a:31a6:b0:891:8c16:283b with SMTP id af79cd13be357-8b9ccd08e72mr386130085a.9.1765314106344;
        Tue, 09 Dec 2025 13:01:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252b61f1sm1375838185a.17.2025.12.09.13.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:01:45 -0800 (PST)
Message-ID: <ae08e53e055a238cde639dc9d9c7263fa296af5f.camel@ndufresne.ca>
Subject: Re: [PATCH v7 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
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
Date: Tue, 09 Dec 2025 16:01:44 -0500
In-Reply-To: <20250827114006.3310175-18-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-18-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Pkgq2xxV7UQeyr3akCzT"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_130147_684004_9A34A68E 
X-CRM114-Status: GOOD (  20.77  )
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


--=-Pkgq2xxV7UQeyr3akCzT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 27 ao=C3=BBt 2025 =C3=A0 19:37 +0800, Jason-JH Lin a =C3=A9crit=
=C2=A0:
> With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
> can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.
>=20
> Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
> each mbox client.
>=20
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq=
_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 --
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 -
> =C2=A03 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 7575ec376367..c35fe0e3a4d5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -638,7 +638,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE);

That effectively revert another patch that is pending, and remove the use o=
f the
new cmdq_pkt_jump_rel_temp(). I don't follow what is doing on here, I think=
 some
context must be lost.

Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 8de2c8e4d333..2f8147481bd6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -293,8 +293,6 @@ static int mdp_probe(struct platform_device *pdev)
> =C2=A0			ret =3D PTR_ERR(mdp->cmdq_clt[i]);
> =C2=A0			goto err_mbox_destroy;
> =C2=A0		}
> -
> -		mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
> =C2=A0	}
> =C2=A0
> =C2=A0	init_waitqueue_head(&mdp->callback_wq);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 05cade1d098e..430251f63754 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -126,7 +126,6 @@ struct mdp_dev {
> =C2=A0	u32					id_count;
> =C2=A0	struct ida				mdp_ida;
> =C2=A0	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
> -	u8					cmdq_shift_pa[MDP_PP_MAX];
> =C2=A0	wait_queue_head_t			callback_wq;
> =C2=A0
> =C2=A0	struct v4l2_device			v4l2_dev;

--=-Pkgq2xxV7UQeyr3akCzT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiOOAAKCRDZQZRRKWBy
9OdCAP9jVzg+QpGog3Qs+E1aiutQSW6I8TrxlaZxB+Nqe/V4dQEAvcTe47Q5IdHE
la5jsdG9ICyO0vG59Lcb7msMNvmnEg4=
=ZEQI
-----END PGP SIGNATURE-----

--=-Pkgq2xxV7UQeyr3akCzT--

