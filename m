Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27C4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=; b=1M/CUxoeJxPPo3g61QjLsNprsY
	6Qj1kaE42CbicMI7Lyeohb584XxBqkQrligjtMIaRRq28Enu7AbblWnpSDQv13Yvx0GvMwuNlg4nS
	qXIWTfE/ir2XnDy38qG9laBImUy6Xm6JNSDGaABw1U5O2nn+QkShiCDswOJW3aJRlRVFv7oCVbbVa
	nhLtM0OqGb/GrNtRn6UXX5RUBeL8q+8FomfZhitYANRKRJiYDyLnmscMPim0n9bihQsBfYZrrTsdw
	/MHNc157jPCHtc4mHklKDiK/pCUg2UMuJYzCbEqSNnPu6BJFCQe8sx7KqvAtnsDrbL/CjlMFaPRQX
	SNu7AXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgwb-0000000CvQA-3xO8;
	Fri, 03 Jan 2025 12:38:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgvN-0000000CvFJ-3AQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 12:37:11 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30167f4c1deso119241061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 04:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735907827; x=1736512627; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
        b=fdjFU3TfAwawLXxFYYzXOkIJ4FwOpnd1cm/kpcaljU7vYNh7M/o2bol3uRfh0MLiWq
         khSGDt/f0KwV3o8qA1OFjF83H17KIL/dHhf/bde067I6hYrvsC6oF7k/LSm/2IRgz5oz
         9HW+awCI7ac441J7C6rkTJFN0yatcBrpzV52Va5hICYGZYiLG/4aBR1G4NopmIXNhElk
         5RB5dqy18939bNJiYQk7dC6+G+bY2ORdU5euJsaoDZv+8ciB7ALa3rmXtioAeEnvSNws
         2r40zk+YTip0UktMo3Uu98ekdsaZb5ZWbC1YHFChOdUU948dRCfbjgcElvs5BSxvo+NR
         Kijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907827; x=1736512627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
        b=PxZdZ0+IPykLuNiH6tkI8dT7fy7ADVwXo4Opp9eKd2rDS0tL0P2e7he5R8PMnoJFNH
         FjJ8DMpFRZZP6IadkMkIxsOkWgJOxz4t/jxkJJsXJSqvm7QaJkAIZPfQwtygTNxTxNQ6
         aywlvCgFB+WfVWPF+0ThDo/05F+7f83N/LngzzRN1vQSDAhoK5txOJryhnSX82Sy4A9A
         1qUpVKQWbxEOJ64ix7syqqC58uDvqKLiXYVQVMu/g+6BthBPb1zTBhyrWW8+DSis8oaJ
         AY2WrI0gR8HAvKkjyBV0nhoOzEZgzhNmoASv3447XxHKWzJRo0L+YqSEix092OtnxEBH
         phgw==
X-Forwarded-Encrypted: i=1; AJvYcCXJYOAA9X4AYgnkcd7Fx4aDK7cULy7uMcAwSbTjNFrgftD7++KEfY79Z+5l+yp5qBbXiAVS7wWRR4M5gzDDy6tX@lists.infradead.org
X-Gm-Message-State: AOJu0YwpJBPMo63fNynkkFqaT+SVQ4BnnpaSPPteFOIYULre3DVBbdtP
	z2uX+y2IPR2WnlR6iHdKjlnr3LJ4tP8pOWlLpsP7BpwZn7KP31kw0QHHCy/gckg=
X-Gm-Gg: ASbGncvNtxWLfcSV04S3+fllVzYoelMkf1/fAf8hPSPJn68ootA1+TB9Mgq71c12vxb
	1h3A/IbP0ZmLF8ACpriAToMKXTP2Ze0SVi2jmx4XHbkgLWA50ldjsT4URsbv/udqCQPwTVmqL9v
	M57JWb5tP8M3b8HBM2lxruMHoajD0AMI/cI6uuXnFKmRm2+GaB8X/4UWd1+2fyA9lXhao1XOKDP
	czu/FepZWoSiRI6FpDSIBhUDrMoROTkqRcbhLl4nCKaGwWTVecMqf9Iu+0TbxrTT4oDcG7dZGs/
	I5Gaw7q1G8joZqIKK2wopjOAKNHld67O259x
X-Google-Smtp-Source: AGHT+IHkmAApyLZ21XYWu+WDHiH0q3Z12bKU9S9jrrq+R629xN6ISaSia7sHBryhTxvay+8ug/2ilQ==
X-Received: by 2002:a2e:743:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30468627b2fmr117244791fa.35.1735907827089;
        Fri, 03 Jan 2025 04:37:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e47sm45659141fa.111.2025.01.03.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:37:05 -0800 (PST)
Date: Fri, 3 Jan 2025 14:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org, 
	heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com, 
	jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
	mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org, 
	rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com, tiwai@suse.com, 
	tzimmermann@suse.de
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Message-ID: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_043709_784793_4A04BAB1 
X-CRM114-Status: GOOD (  15.88  )
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

On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> On Tue, Dec 31, 2024 at 3:34 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> [...]
> > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > > seems that there is only a single driver which uses the .prepare
> > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > > implement .hw_params instead.
> >
> > Yes. However .hw_params don't have access to the infoframe contents, so
> > I had to settle on implementing .prepare.
> While debugging I noticed something unrelated to my problem:
> hdmi_codec_spdif_dai_ops does not implement .prepare().
> FYI just in case someone wants to use your patches and feed the
> hdmi-codec with SPDIF instead of I2S.

Could you please send submit a patch to the hdmi-codec driver?

-- 
With best wishes
Dmitry

