Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F08C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=; b=0j6srVkaM2hEjt52EpvhNKLRLa
	2MNA9vJJU8pP6Sxep88RzUZFusGFa0UpRARMotN73QGW0hHpgbF+Lekf+YmKT+IUDxJJR9hA5SHrM
	mMtGmtdcY8N0/Vobeh+RK9b0gQ4IVcGhJGtRxhmaQklDjIJa8CFGqV0eRBKEcNbdb+PArn4Qe8wBP
	1HiW1FOIPNc+xg25bO1MfzpLtDGmL0DNhGAFp8xJyRZlIEysEdlqgKvLF78XQoABZyMZLTxqh5djt
	hAnZVqepiJwFcT0TyGwue2d4su9aHYxb5fllBE8Oqv/OzySQ2YHOKHf4bgTUZu9ndfWPczXojVr90
	+sDQYzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7TD-00000007pI4-09lx;
	Mon, 02 Jun 2025 15:53:03 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Ee-00000007mij-0Uo3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:38:01 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a4323fe8caso29938421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748878678; x=1749483478; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
        b=aX0JS/0NtJOzW0yjmpZIFIfdW9q10WWFp037TDMkpZ8W65bEpF/1HdS+wea94Y7tvk
         kkmHsaSP3FAFJ8BTmmspKhDWGwrVnrMoETCVSDCpLXE6x5e7Emul0kq4NhVor1q1e1Jy
         ldVv507BW0mXdK548acDsE2TqlnFQy1TbgyYrmismQd/ooz2AraBF7MZZoJ6gz1IdEG5
         chBICLEXjUo2roxxHlubst2/C/9MZE6q9i1UHG5Jm8gAl5JR37Ce0aZ8GtydlrzJaycb
         Rnhzs9LLLVDKcFegb5Nl8QexspU+Axl7k+zNOIWFZzvPWnKrxh49gPYKBwGKQOVKNBVh
         Q6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878678; x=1749483478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
        b=uZmL/pcQ1C4Lb0xjh+NqndsquThDAyhdnpgPNweW9PPcUdcWtArWlaui47lsfy7VoB
         LyMZYE/m55bJtQSVQhEJLM2zo5Fmc+raWdgGDhxDpR2f5QhBVh22CTQQbrDDnusnWN8M
         S1K12Sv69MvVfYNgc1EJZgcO2BFRgSni//K+FQcyt6W69rHbku6DwZREUqDF0/Rmbycj
         uoshqHeYXHBF24wI3vY/47TZGO9P0jCOHpWsgmAjzGTNDaW8nvv8DQyUgmVAxkgGS3km
         fQRFHqym7/044qoemKbyTCGuo4DC5J5ROiPl93sGJOzPDbbq1j+SU9fAVmk484OKVfF1
         eE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5FAwCYYIS9WiFS4h635rWYpkTfY0/ftyVhoe6VmF12nAMsaImrINwtU0/iUfh65/62iuCmOSCafsgtkir03jN@lists.infradead.org
X-Gm-Message-State: AOJu0YxMN0BDTWPy0kx68Xafx0vgnfEu5CZfLM90WryLMpEqoBqo+WPK
	Xty4SN44JNZ2EhFGLiJgrGi0ROe4WQEJovb16wcMkCE86+oi6uXiBr0ijWWo5Pi7C1U=
X-Gm-Gg: ASbGncuWv54+UgliJkRdO9wQn/Vi3scM0v8zdypsP45k3LUOjkdJvbPluTcr/b+zrv3
	XlozG+fvs7EYeDZNxsRUAv6ySLFOlF6tJy9F7eBHPElhaUQESe3/lTPzrdgQ1fEkbiLJl/wRGWt
	FNwuWsY2dIeNbDSSKikJw+qMjps95syjhyCE1fW9nb6poEuvq0ECvejRqqalKEYZGJob42uyC5e
	NMxYCFwsa5jGGT83P9p2WmY5/Sb6E1X8sB4QzqDxNA6QE6Ql+zM2iOCsSIFqyBPwvzF8JaNhNaU
	CqOfAHgeWCJwtdy5dT+OxC21FgeffP03xSA5SoSk2n7MrE457scLWUBs
X-Google-Smtp-Source: AGHT+IFAxvbyts/4W1PU88jgJRJyPWsVyM/w1Qedjlhc5oIe8j+5+JXf7JzKMu2VMp0D7TLMJ22XCQ==
X-Received: by 2002:a05:622a:5598:b0:4a4:3d27:77a0 with SMTP id d75a77b69052e-4a4a5ec583fmr144502391cf.2.1748878677932;
        Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772fb1sm56762721cf.8.2025.06.02.08.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Message-ID: <01ee4dbe14917dff1e0d256dde6724f81a23ba4b.camel@ndufresne.ca>
Subject: Re: [PATCH v6 17/20] media: platform: mtk-mdp3: Use
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
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier
 Chang	 <xavier.chang@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>,  Sirius Wang <sirius.wang@mediatek.com>, Fei
 Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Mon, 02 Jun 2025 11:37:56 -0400
In-Reply-To: <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_083800_386763_BF154AA5 
X-CRM114-Status: GOOD (  18.81  )
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

Hi,

Le lundi 02 juin 2025 =C3=A0 01:31 +0800, Jason-JH Lin a =C3=A9crit=C2=A0:
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
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> cmdq.c
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

Did I miss something or this reverts the change made in 15/20 ? I'm also
unsure if its correct to ask for backports of this with Fixes tag. Isn't th=
is
for MT8196, a new board ?

Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.c
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
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.h
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

