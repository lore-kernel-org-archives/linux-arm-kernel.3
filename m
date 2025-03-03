Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2014AC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+tcNGEhQOnpEDMIcSl/nrIJvRxlWcNhIkRhXAkv+8s=; b=YOnQMIpusuyGsw844fG1q1arwC
	OBdIKdeguj5/ztRodlm3qNXtmqjyt/f1lVJ5G1Cyd4ZwX0U15FJkq+Oxa50ttQQZsUt0ZlVTMiBbY
	veUeYQOzvv2B3HXlkpS3U7g1KpxyusElME64V1IXLfJZg/2AanVhhRBCzivesPnS25N7KhfHpuCmd
	Q+FlgoNF1BZh5vGtZCxKIrqtaS+ekpGQVOE0JwhDAXK4/11LVIq4MZXYc2jz7fSOqAM5dja7rgldw
	BjueFkCL3pgftqQbBUx0xeuo6XXTdhQRRlraQBtqAXtREleAHOq4CtS1VQcY5sN1+a5r6frSTHjp+
	MWdvX3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5NG-00000000pTn-2Z98;
	Mon, 03 Mar 2025 12:58:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Lg-00000000p8q-1j9d;
	Mon, 03 Mar 2025 12:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19FAC5C596A;
	Mon,  3 Mar 2025 12:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B1C4CEEB;
	Mon,  3 Mar 2025 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741006602;
	bh=UX3HfbY9NrbOd9tpd2P7hFNQCeHdeWclU4P4j4yWbwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FV9xelpTeEOVh2F9LLHt7cZEamR97RqTHhg+X8WoBEYkAdzKYDoMPFGtFf8M90C3D
	 TKgWlwqQHfV9WGMud0bBw2UL2qbO5ucIGnrIH98qUmbbmVpcNd09anXw7cMKWrYT9C
	 xgsT0eOnRDvogmt97w/5hTiDGDBb4QDrgD0AcjuZD2W2vQV8Zt5itjsBOfSVnOEkDz
	 u1V0SEBZvaUbFO0watcpspU5ainokC0giq5omDV1ZcV20THn1iLL/F1LeXjaAyJt+M
	 8VCklBlAsyFYjeFHSOAowTLy2dqy+W20cxyVfJkhIw1AKmlvdPpprIuf32RtQgeEJB
	 MXlpfnsRQml6A==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2232aead377so83581775ad.0;
        Mon, 03 Mar 2025 04:56:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe79OO8t2S/ShqbLKlUc4aFKKnYWCYWuVAx2D7+EPDC1Zoaa91WpCShywPZgQ1dBSiOihsLNm1CQnKeRXpnOU=@lists.infradead.org, AJvYcCWMBzupurcr6jlfCbrEaUS5WkGyBakcdNG1vbiYFdQRfuKQW6DEmwSVY2OJLG3m1+CUFUh+Xvalrj1BTsNEMdDe@lists.infradead.org
X-Gm-Message-State: AOJu0YwJDKIOYyIAWF1iQnAeGwjj9bThDfmwuRsmct7oJtfcBlEAx4hl
	77o9fGpfPrVKmbsL4r78BdiebcSza3kq9+8VkwU1wkAnS4JjGXdt//5Y1bHaklOkwQ2PC0NJabo
	ykJ7g4HbdvkH0kwHL87o05gMqXQ==
X-Google-Smtp-Source: AGHT+IGSSgSzh55HSnQ1lVjwMdzp28MHDOUOnEh8kdGeJHmMnwiYf8Q6NzYRnemJliLplJUfJXLVhNNZXMjP1z0RvT8=
X-Received: by 2002:a17:90b:3511:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2febabd9c82mr19809852a91.28.1741006602131; Mon, 03 Mar 2025
 04:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 20:57:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8cGVEYV2v6oAHHnVqfjk3jp_a1QtaYJRqDf1Hg4vY0UA@mail.gmail.com>
X-Gm-Features: AQ5f1Jred4c1pw-7JgOxVG6xQG08SC8yxuC59gWdugp16YcFov8bdecIzf41xyo
Message-ID: <CAAOTY_8cGVEYV2v6oAHHnVqfjk3jp_a1QtaYJRqDf1Hg4vY0UA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix config_updating flag never false when
 no mbox channel
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_045644_570400_A1F98AEE 
X-CRM114-Status: GOOD (  15.64  )
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

Hi, Jason:

Jason-JH Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> When CONFIG_MTK_CMDQ is enabled, if the display is controlled by the CPU
> while other hardware is controlled by the GCE, the display will encounter
> a mbox request channel failure.
> However, it will still enter the CONFIG_MTK_CMDQ statement, causing the
> config_updating flag to never be set to false. As a result, no page flip
> event is sent back to user space, and the screen does not update.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: da03801ad08f ("drm/mediatek: Move mtk_crtc_finish_page_flip() to d=
dp_cmdq_cb()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 5674f5707cca..cfc4867296b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -620,13 +620,14 @@ static void mtk_crtc_update_config(struct mtk_crtc =
*mtk_crtc, bool needs_vblank)
>
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> +               goto update_config_out;
>         }
> -#else
> +#endif
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         mtk_crtc->config_updating =3D false;
>         spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> -#endif
>
> +update_config_out:
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
>
> --
> 2.43.0
>

