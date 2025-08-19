Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5524ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXR2SIVmzRbhWkmgj79yu4WBPuxOGQNxUcObjKJ7UfA=; b=tyV1RoMHIfExH8iI2EWq3Qbj+O
	IJaphXd2VziQokY3EzvOCaqkTbN6BuPakcpZEe3zzurndaJCmZFnMTJbWhQseekljaHJXMeFtaYD6
	GHzCGDLSwBSe9aw3I4oeHA13wNOCD7FL9NSOBQREsNJPv/MXIORevuh17TJbNQ/7XDVRkHiZSawVy
	+Mh8OfPPoAXboDTU6cNvEJRAjFn5+cR8gK7YSe9MXM4Y9KBQkRQ7a3iZAgBLG/ylR1efGPWBNX4EB
	hKvJwapLRfT3glgg7f3JCXcZTxE0QH2tcSEb7pupREWCUB6DHBk/fPsTt57MMEa0KoeXNYB/AMJ5/
	CsqwKVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFTc-00000009UI8-0fis;
	Tue, 19 Aug 2025 06:05:44 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFQ8-00000009Tq1-3GLk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:02:10 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-50f8b94c6adso1188579137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755583327; x=1756188127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXR2SIVmzRbhWkmgj79yu4WBPuxOGQNxUcObjKJ7UfA=;
        b=YFD30nVeVtReJ2J3LTMPsTNdvTqNJMG5VJDI78+MU7o/SMe+ShNL62CLnYkcG8TvtB
         Dz+6UDWn/tOP6n2TxAwBEFvvSGsqGuz0mNp/ihuDqiOo7ctusFfTqFRaej29ud+MZz6/
         Aphrx5+wN9BRDIg1towLf6Qgf/nCQsrr66IqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583327; x=1756188127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXR2SIVmzRbhWkmgj79yu4WBPuxOGQNxUcObjKJ7UfA=;
        b=frvDIiFsKk0uRR6ltjEJ/y+jEifsTWu5SnOCufokfQdBGADc8DUM+SNFrcy5jPqfsB
         ZtA7vBaES7IumCtmFK6X3VpeP5zBd7t+DbexyLNAgeEUIsrWu8j46vMjaPU3cp4oRNYe
         DYHm1/iMnWe4gik8RYWyTjdXWvNkdE5T70k0l+6xKF8OvO91axQuABwOyNiuekLTlHs0
         SrJ6rrcdecidrdXKfFTn47sk1cvRXtY1D+YzvzmslSJIX98JwdSMuoNHGFfn7XdmFGzW
         Z2dVvJN60qwffHecKxzygfeXkw3hiisBmpjk8zLasJHAjyels3ZJv6k6uPTWDbaSxcye
         tAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFyxx/DWwaKKfpUmJTbmQ1vmjwGoYbkj58oLyc9Sri5YT9b5hfzH4CPKecDsNkdMKS1AwzfPQHxFWfay+O0vMz@lists.infradead.org
X-Gm-Message-State: AOJu0YwvTpQ2gTw/9YNeM9UtmzZJpBk4xWv7xvUY12icoYxRjiEmouNS
	cTp7d/FSvkeopbF5G9y0xbaC0A3pwu95OcurAIllSo2yXPW5pLQD45H7hgHdp/CdRJi7kH1Ilzg
	0ts4=
X-Gm-Gg: ASbGncuQ6qYEus8hfU0z3hG16jz95mkb2bA13B5/DSQuctjEzdN/T+4447yiDbBSSvu
	p9SqY663BHJS3N5Mwu48i2bnaqMsQgE0+t18h8g0R+/OlpB1zpYRB+WkZeYpQZL/aEgXudqXO5P
	c8vefQuRSebZxRlLbBXpgFuhik1dym9VbS/q0xGcb46fZissIh8Eu1AhPvO7q0FMkf0VtxZ4+BZ
	eQRy1LwCQVeOdJkjre6HUHQmiwuJVy1OS7n7lboJoOVWEwBG6qnHVCo1l/WvT9giy/ONusr5Ez+
	1pu3uik+f3qQxJPmL4XEgfDclpa2T74YicIB3GGLtommkGliSX2cFnsCrJtAzIRhjl1npNuAqgO
	4bjk3lrHi5vplMjj7kCzA47nFfAJzv5S4YhiEOxto1wCXhcdGRguewa/1ia5/E53q1QFk
X-Google-Smtp-Source: AGHT+IE7ZZKx0p+yQ+oEgPnZdUMStIr+MtS+IuQ6bSQq3eXB8mCbft1jml/V3UlmDARIALUGQaEPzQ==
X-Received: by 2002:a05:6102:290c:b0:4e9:b0d4:1133 with SMTP id ada2fe7eead31-51923a28363mr318534137.20.1755583327172;
        Mon, 18 Aug 2025 23:02:07 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51713f939edsm1285083137.15.2025.08.18.23.02.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:02:06 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f8ac28305so1352580137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXw5QqBln1X5cuF1uQN3K5tU8AtmVWibfR2hIvgWwkKb9ivG3vFOAxHAfnkTYuvaNdyXKA+fCyh6H+Hb9yba37K@lists.infradead.org
X-Received: by 2002:a05:6102:3f0c:b0:519:534a:6c5e with SMTP id
 ada2fe7eead31-519534a7300mr195467137.33.1755583325362; Mon, 18 Aug 2025
 23:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250818084242.1045095-1-payne.lin@mediatek.com>
In-Reply-To: <20250818084242.1045095-1-payne.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 19 Aug 2025 14:01:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1njekmPyq5653Ybi8+7i2_+Dx978aJOQNUTuRBs0ef0sfw@mail.gmail.com>
X-Gm-Features: Ac12FXydKLVgTfkAYyLB7X6R_EuK2D-Oxvhl2cOx65LzvRizoLO1BDAMlYJ--fU
Message-ID: <CAC=S1njekmPyq5653Ybi8+7i2_+Dx978aJOQNUTuRBs0ef0sfw@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: mediatek: correct clk setting AUX_RX_UI_CNT_THR_AUX_FOR_26M
To: "payne.lin" <payne.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, 
	Bincai Liu <bincai.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_230208_811267_2761B531 
X-CRM114-Status: GOOD (  20.71  )
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

On Mon, Aug 18, 2025 at 9:37=E2=80=AFPM payne.lin <payne.lin@mediatek.com> =
wrote:
>

Start the patch title with "drm/mediatek: ".

> From: Bincai Liu <bincai.liu@mediatek.com>
>
> Updated the definition of AUX_RX_UI_CNT_THR_AUX_FOR_26M from 13 to 14.
> No other code or logic changes were made; only the macro value was modifi=
ed.
> This change affects the timing configuration for AUX RX at 26MHz.
> The formula is xtal_clk / 2 + 1.

The datasheet says "It should be set to the ratio of the half cycle
XTAL clock to the 1MHz clock.", which doesn't align with your formula,
so please explain (1) why this is needed and (2) whether it's tested
on any MT8195 or MT8188 based devices, in the commit message.

Also, you'll need a "Fixes:" tag[1] if this fixes a bug.

Regards,
Fei

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#describe-your-changes


>
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> Signed-off-by: Payne Lin <payne.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 8ad7a9cc259e..f8c7b3c0935f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -301,7 +301,7 @@
>  #define AUX_TIMEOUT_THR_AUX_TX_P0_VAL                  0x1595
>  #define MTK_DP_AUX_P0_3614                     0x3614
>  #define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK               GENMASK(6, 0)
> -#define AUX_RX_UI_CNT_THR_AUX_FOR_26M                  13
> +#define AUX_RX_UI_CNT_THR_AUX_FOR_26M                  14
>  #define MTK_DP_AUX_P0_3618                     0x3618
>  #define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK                        BIT(9)
>  #define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK       GENMASK(3, 0)
> --
> 2.45.2
>
>

