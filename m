Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDAC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlxhZTcybyNtPRIMzFM8i89G6HvYvhD9073mPHkmSyU=; b=Rt5EdzKFAehksHfb1iRR7k91gR
	uKYx/LJb8SjA3/2P4riMX3Jj5B5QsJqpQsYUiB0uj/G6EexaFo1IC74cQYvmPGhrNHDCiAiVxMCo9
	21eX7WIXenp3SiKjyWuGQKShpTSjAOLSXHOfIBIoLlAg9gwpBFgMS68NdM4Jpo+WS5dJnstPfGsHr
	KrYUdedFDxcmIwQU71GdC9hym+NkxMzHDaWkXZj7+fJeKQLYrXUNbntcTAas2i36FPn8L2rK8e2e4
	t0jU98AnV6hMu7hq1QFi4otV+9XyyFi9k9dJ+B6mZ/ace1ynIkyykWlcFjD9gp0deI41q2EBrEo2J
	6DZqfO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7gq-00000001MB5-39Zb;
	Thu, 20 Feb 2025 14:38:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7UQ-00000001IU2-21dA;
	Thu, 20 Feb 2025 14:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32A535C5E4D;
	Thu, 20 Feb 2025 14:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB9EC4CEEB;
	Thu, 20 Feb 2025 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061520;
	bh=iJw0LuLV1NQL5MljcDvcrTafJWx8F0Mgu90Nuo9CPBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fgYP5nVX6K3cEeC6Xtpa2YYOrXt4jQeXL8JCyvGMF/Wq9c/Dl1/rzYfnGKwkDKuVR
	 gHb6C+na0d68Og2C7gXIj0iZJM/3qULNH6hQDAa+vTSZk+GFYMOa3A6fCw2mvk5u6/
	 5uVn7cN2Q4sF+6TSewFuRa6c15BcwOzD6G3+xxYO1TO42azPYmzrGDuN94WZ9MN13A
	 /zC+sCSTBD90yJpZAjlY+scHgCW6bQaqC1h6OSdy3vVf4GhwPcG90FifloOqbqG+JM
	 Q3kcjg4+GG8Qe7hehQ2kR6/y1OqdCXRiFqVcwDx9tuwEGi1ReteqysuVMEMzKcrt/F
	 TSz8OW1ul2wig==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fce3b01efcso269570a91.3;
        Thu, 20 Feb 2025 06:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVoPDWVTUNHulNoPg7jywsLaucEExqyvmKpFo3CgrUP5rk4CWx9KiNeq39ks4+pdN+XLnCoeOc+w4ZnS2GyLpX@lists.infradead.org, AJvYcCWfYEmISA81ysScTkkYJXgPJfWXSG22KNSB5VigwjTcnrbQWHqoTKlvA1JvUDRMGrRjWE0AIEGN2Jo0DcAunuE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCMYUkGBbXWPMN8iizxONI2ahfPw9OVXZhjHAxaVzZaZXZO4H+
	u0dLO1nTO9ZhktkzKXCAzFRBA98nOyNmD5DpV7WOs9+LD+vjTErISw2WcokQJLg2XQexteRXIqs
	h7A4tbb3VoVp3d9YYTRoh96L5Gw==
X-Google-Smtp-Source: AGHT+IG6zBpHgkEKWKPXjExGKcMJ3P8RA+4Pl+cW3k6VsvdLJSFhWdQ6SLc1qU7bLx4Pas4JfqVSRji56XJkJ5sp9FQ=
X-Received: by 2002:a17:90b:510b:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2fcb56e68dfmr15217411a91.0.1740061520261; Thu, 20 Feb 2025
 06:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-33-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-33-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:26:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-54w+_nZtoKiOjw0z3+BxoygKR0zUvUevW4ZijrBWA4Q@mail.gmail.com>
X-Gm-Features: AWEUYZm7oGrflVbB-goWTArAWPiYKFdjfVm86uPsqne31Recqtf46FuqDQvfcSk
Message-ID: <CAAOTY_-54w+_nZtoKiOjw0z3+BxoygKR0zUvUevW4ZijrBWA4Q@mail.gmail.com>
Subject: Re: [PATCH v7 32/43] drm/mediatek: mtk_hdmi: Remove driver bound to
 HDMI print
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
X-CRM114-CacheID: sfid-20250220_062522_634997_9ABA51C3 
X-CRM114-Status: GOOD (  13.38  )
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
> Remove the "driver bound to HDMI" print to avoid useless spam in
> the kernel log, as registered and bound drivers can be debugged
> through debugfs.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 2e98a8ed6cbe..50f9ab48cbf9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1632,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct de=
vice *dev)
>         if (ret)
>                 return ret;
>
> -       DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
>         return 0;
>  }
>
> --
> 2.48.1
>

