Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE8C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYT7EtSv9BqbcUQvIOu78bsWya5TUJfPGIbtE81SxG0=; b=jlHqB3GbFFfYegpI/WRNTPw051
	jungDpoy5Zq8hbpFP6xW00MYa4xtNU5/AdKkoM3WbR8dDxWxwABL97bGLBpfHeGQlc1Jk/BFCbzo9
	S5xqSqF03LzIjXiP7E51o/Aber6OUdwkFA4+VjNcpdbLmee+QJQgSOnyNUCIgzFYRojeWrQnlSnXy
	YQfADHTX/1P02GcAPtLJQeqe1mnGQ/JvAUqFV716H9vib2dhRw+AGjlCpVWNWacU9ik/FSma+Lm3z
	wit9QVBzDF0Wx0dflwXZ0CR+/mevSxMiKVDkdGSrwA7qItMJ8qlqU305XSg/ePTdeU59BQWAxoTDb
	l+MOFiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7C5-00000001DFG-29dQ;
	Thu, 20 Feb 2025 14:06:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77n-00000001C7x-243i;
	Thu, 20 Feb 2025 14:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PYT7EtSv9BqbcUQvIOu78bsWya5TUJfPGIbtE81SxG0=; b=qCsSPvNT8ehq+KTCIdUqhiaS+m
	2mzM2jJQn9zGQ+58kSsy0MCUHlvBq6BMCFT6wXQJvxdYzRlH7eekU37Ohv0XZG6OmUUcfS53AmQQC
	bXYZHM6tgW3ja2WYrZ2woR1eFHpNOOEzH0WajMLLLQZ2NRFjF+ZhbaJKgjbuvE/ugLVOfCq51vsu7
	hARtt6wYBQM9vFgbNJ51J8zjF6JLzvPrGuIhz5OWeSGwBcoygmpKy1ESujmK4CQy2mlhYfj4F6jCD
	NVu8OnJoCJztz7YN4AHW0uOlVqp3Ivhm6oM8sNG+DffFLHcwj3eSk3bRguRtBbCIxoPEKHtHB0xvR
	tuYYbYhg==;
Received: from tor.source.kernel.org ([172.105.4.254])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77k-00000002S5x-0cOX;
	Thu, 20 Feb 2025 14:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA16661456;
	Thu, 20 Feb 2025 14:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F60EC4CEE8;
	Thu, 20 Feb 2025 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740060114;
	bh=b4AZKnm/4CW7chhpu6yQW9p0aspr3R6qCEzhfg2YT2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q+KTDZMhrGHww4kznoyoJFRb3olr8UODUOwgc0KY/L9KBdW9BoIXyszGXXv4Ynh6Z
	 cO0HdO06VC3E/UqF/Jg8NUdTCasfU7SOTlMugQ16kiTF2vZGHhv7tudwRpKchBJDcY
	 8VcxRDg9kr3ykokUeRV1/TPRR3+pN/SwC5fjv62+HwG3C4tb3DfGpdAHVb+l3BvvIW
	 uo3aq8fCpm2E2YrplY+KvwQMHgVPbrsIVesZTtmr2Ku21/tlm46VDSYvvXMCK1jhVv
	 XBzNMX4ScWWBxkf1CsgRWByYXYhUwiB7AuXrTU5hTSZIWGsL4ttlO1axyFx0nIeMiz
	 Hr+pDlJKgKBOA==
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2210d92292eso26334825ad.1;
        Thu, 20 Feb 2025 06:01:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5tybX73e0o3DJt/GviB17Lf/AP7KfRUIKU4BndKxqfsRt8+9NGUqwgn9njjTiwZm/D4RHRNTBfCr+TVIn8DU=@lists.infradead.org, AJvYcCWT4DZraPpKyDQ7bGelRW+7U9CIjNlT9/XjJniWomOZpAX8s71ZBhW8lTKz4gbiyjSfbswOpkhUBCh8gbPFIPx8@lists.infradead.org
X-Gm-Message-State: AOJu0YynPWiUIfjx/88jBPXt3K7Pr3Sywf9Ust+BmvZ+3J3YxIn26lok
	IUm5p3bDwPXSoFdzeNlDoZkG3Jee8KTQ2SkxeEjvVSwKaR80WM79lrYVoI9RWBdzqn0D86whxyz
	c8uK9J4RaY51dLVlA6iox0KToEg==
X-Google-Smtp-Source: AGHT+IFapzn+NKHW52s4K7DIT+hFK+iRpE1/gZU7kl7MdKEYaDixn7SWx5ZWS9wyFmn3w4NhHQTiw5+aDFJOtqZJANg=
X-Received: by 2002:a17:902:f689:b0:220:bd01:6507 with SMTP id
 d9443c01a7336-22170988a48mr119225175ad.25.1740060113565; Thu, 20 Feb 2025
 06:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-28-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-28-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:02:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8xmwncZUdjpfFNZdTc-xVm2tqE7yxFTOHK8=ihPfXL9g@mail.gmail.com>
X-Gm-Features: AWEUYZlmnVy895-w6W37aRIYiIz5B_4hc6yNRSLEcLY9PIsmLv3U1pSvn8yAnCY
Message-ID: <CAAOTY_8xmwncZUdjpfFNZdTc-xVm2tqE7yxFTOHK8=ihPfXL9g@mail.gmail.com>
Subject: Re: [PATCH v7 27/43] drm/mediatek: mtk_hdmi: Remove unused members of
 struct mtk_hdmi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_140156_612073_78DE6CCB 
X-CRM114-Status: GOOD (  14.63  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The hdmi_colorspace csp member of struct mtk_hdmi is initialized
> once but then it's never used at all.
> Remove said member and the only assignment to it as a cleanup.
>
> Also remove the ibias, ibias_up, min_clock, max_clock, min_hdisplay
> and max_vdisplay members, as those were really completely unused.
>
> This commit brings no functional changes.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index eb3b1009c305..6e4900f99b51 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -162,16 +162,9 @@ struct mtk_hdmi {
>         struct clk *clk[MTK_HDMI_CLK_COUNT];
>         struct drm_display_mode mode;
>         bool dvi_mode;
> -       u32 min_clock;
> -       u32 max_clock;
> -       u32 max_hdisplay;
> -       u32 max_vdisplay;
> -       u32 ibias;
> -       u32 ibias_up;
>         struct regmap *sys_regmap;
>         unsigned int sys_offset;
>         struct regmap *regs;
> -       enum hdmi_colorspace csp;
>         struct platform_device *audio_pdev;
>         struct hdmi_audio_param aud_param;
>         bool audio_enable;
> @@ -1036,7 +1029,6 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hd=
mi)
>  {
>         struct hdmi_audio_param *aud_param =3D &hdmi->aud_param;
>
> -       hdmi->csp =3D HDMI_COLORSPACE_RGB;
>         aud_param->aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
>         aud_param->aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
>         aud_param->aud_input_type =3D HDMI_AUD_INPUT_I2S;
> --
> 2.48.1
>

