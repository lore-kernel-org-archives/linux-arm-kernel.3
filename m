Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13855D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=; b=rMRLqQuBtNr+vv3r3XC8UXl6kc
	HmAvcvbwqzTCxXwsHm2Jv+aF+L/RUe7q+qXSTjKAaHDf0GOTxlT/xyxybJnC8lnPNES4zavo+d1Ov
	TS0y757Bw9bFdYMv5tHCZI9bIJAJo+GBJ+Uq38ZpNJ2JGMwykGNJtKZ20ApQrM4Y5FaGU1S9U2R+s
	dPN+0yF2MisMC6vd8e1cz2pcjd1ExlOez41atl7ugxwvyJmX0v0oVofNQAP6tq2J4P10qnBCyEFoz
	ETrgMEbqy4+pFqkTcZx4DjKuG+I+0qFtddu/GrLQi62YImcf8dMKSwAVIm/PuZY0hbksjK1zcjcWV
	e8T+ARrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jle-00000009nSc-10Aq;
	Mon, 28 Oct 2024 07:02:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jk2-00000009nF8-3nNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:00:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so5213108e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730098841; x=1730703641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
        b=WE8X3f+WklR0C5Hb+Uh7q1vNKmOLJGm81GuNBDU5g+zl7qwYJ6+QOsBA5V7DQaOAZi
         YQPaC63Ofjl6tuLwHkVP/2Qtapy3AcCUzp8q3QXizYfsU+PVtaKowCf0NEuXG5qH/Z2D
         pgnK6SNHGKMSGVsf5dX4tkO3SYF1MsckTybtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730098841; x=1730703641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
        b=QsfA611qIjn9AA18HMDNgYSf1/yPgrDE7Z7UU512MU1aXVKdLZYiNIksjJP482nF+s
         aVG+czlcsESJ2nw3Kmgte6D7Pyg1EtV6Dum8XQsReE02W8bShXU5qHjP4mHUEC3JSLHj
         2cuMaDgpbNl38R8N7y4ggr3qXsz5fV3kUKd8a2lRO1I7/UabfX10FrYjCaZxOikXWxwJ
         1gqNEypTVO+dskTTqF/ajBlco/sVLrBsa3KwGK9NNfqHMlH4UZSB590F31w6iEizODBg
         uFJkRJ2CRTsBc9MV4OG4FpIGqVcKblJLC+0n97CVUMGrUE8Gibq+LNokYETH9yZQlgxa
         sOZA==
X-Forwarded-Encrypted: i=1; AJvYcCXQHxLquPD7vJJU3jZVE61U1o7Esaybjh6+YnPp/K6H6Hvo7gVziXhgX8ukhCdMobiGm3XTVYFVgYyDv9MUXKwN@lists.infradead.org
X-Gm-Message-State: AOJu0YxL7lD02LIqF/wtsfmsgSglPd0O1iD3HOXtuMezMbrtxV1+pgPa
	QojvrFin6OIlKIHlO7HIlGPvattBDejnjSudlpZoCBZghFSsPIq7GkLe220OTorE9JKCvFz6/Mc
	MzgZjq1QukTSpaJhnCB+VhrHd8uTzEqzZdhYz
X-Google-Smtp-Source: AGHT+IG0bSkKwUt4vIe/DSFsd27a0aZcM775T78oioXCX/0ert+iimxun6TtbNvBDPU5UOHkKZf2rc0Rt4hi62j6fcI=
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id
 2adb3069b0e04-53b3490fabamr2408370e87.31.1730098840615; Mon, 28 Oct 2024
 00:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com> <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:29 +0800
Message-ID: <CAGXv+5Ge_qcXaSBQ9d8QZOWe3x_9-6r9LhDGvAbUHNKYMwevUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_000042_982056_C55D73A8 
X-CRM114-Status: GOOD (  10.37  )
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

On Sat, Oct 12, 2024 at 3:22=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Early exits (goto, break, return) from for_each_child_of_node() required
> an explicit call to of_node_put(), which was not introduced with the
> break if cnt =3D=3D MAX_CRTC.
>
> Add the missing of_node_put() before the break.
>
> Cc: stable@vger.kernel.org
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

