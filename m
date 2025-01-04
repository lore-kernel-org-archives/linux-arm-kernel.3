Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A0E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=; b=L6PsB7EKAlsQYankLAZ8e5KwqD
	Lkb+79t2fBnJNENOIpVTXYk3VAXbBDqlvbU/iN5HinMVStqjtZ/bzkumCFmD5Nf2OOKQPf5qHtvYK
	Rnt0fz1uZL+JeCeywcwi6nYr6/RvRRrUhs4BI6SHC949JiIu9eUUPpJviYcTKlomH3Uxza+YtD4wK
	4LkPfJyJ5CQbVWFPZLARdDP15H6ssOhqbIhE+UEHaYcNhOw550AphSPyQqlBxv15MjmET0/OO41/g
	DuZNUSOuQxuATPHr69gBtm1z2YDgcKr1xqh28otuYWJu/KbWpfDUJ/lOAkqLrd0vfCdK6Aa3xN7m7
	yniZR0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTxye-0000000Eb8t-0LZO;
	Sat, 04 Jan 2025 06:49:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTxxS-0000000Eb0S-3LFq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 06:48:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5401be44b58so13727975e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735973304; x=1736578104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
        b=UcjPTG4u8FM+0LTrWr+mujnS/cyXuXLFGWNDbe/jFz2ZXH1DX00XGjawpIixC79A5y
         MAq5wMtB52VlnvERExM1fcHFqA323uaYG5miPLP99uSJMEPjCkZHSu/mPnvEZhlWIfAx
         z24k1I6jd7Cnm5/m6lc/ra9w0Ca6ksy5Jzkjsm/lhCW6aMiUhtkYlap+dOtV49bTAGDJ
         yLaJS5fMn7u+Mtio3P0/Rae7xLsGUqsNwpGHJ4njEjS4M5V1/q96XGvuyeEPDY9P3v9f
         adxhZ6nU+8sQjH0tIL2M0mosSlpPPu/S8swfPvBCfW/jHJzQ5UZNi59yNYVmWmutLbfo
         Q4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735973304; x=1736578104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
        b=LbfwWFNJ3tt7JZxJyFc9tdozpvVaVuQw3hAqaMeKswRpvLTa8zQI7bsDMYt357bsK2
         lMmdrL0iic63cBLfeXbY92uz81VBEHmzOPsMoL1YG881HFJ0vjjhssFdJLfpOZKKu7kF
         grijJni9ua0mapXWe9OtRc1dw2WtU8/+8DPqCQ9DhKOv/45c+b7btFPBGG6zhin52vpv
         u+zPZH+82wdcFuOuRzfSaPIpqgTskkSWo8lyWw0HyMiXO3p/tzTwoClV5iyDO+hv9hAE
         Ub5W4WXE3/+8VG4egu19XLi+ngpzNvL9Q2lzBOh/f0Xmw3rp/KqjuOjxwlqVasfZeOjp
         x0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWs0hV/+dCDDa556UrAkAGAO7M2EkA7UvnfuozqVRztdRNfmMwjRS6cu6OfLm2r80390JwKmzPMg4GQOv3A88+e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ot/J+OpGguZ90cCnxKRpLe6vjO79LttZWGgyE8JAlXdKJMPG
	qW+SPntMmeAXwetyrOpjJdu4TfaWI63ic+UyBdnuha74jecwnG8GO2fhPnYDwWs=
X-Gm-Gg: ASbGncsyYb4eXQ3fQ7lwJZfseEJMJK4h/Gau+gqkiJ2jGzf2lA6KjWdez1oINmJOQEp
	z4kMs5C+GbHrhtXPpw3Y4qDzVXyc44MZaQHQkDDI7OgEzyezunwiiqvFEDJawRFQ6uWkBlTudGA
	XSXcPXVCG1VxlVjPgkPESYpUTFvUdee+J6kgI/Pso3hfWPPFTdwQ2Xph4+T3/+pRmkKSuy44WVI
	9uj+NaJEdiZ4gdiLJ8J8LHTmQN7ihfWKGAFVMfaNYT5siN0UDxkLftLFqWnvy1Pdni6r7LtIyVg
	WHJ6BJtjuQa+XC6N4kknYVtQ
X-Google-Smtp-Source: AGHT+IH3b8Wrusc5F4Hb8fKgaj49rA+Ki+WtT2vpjNm4L2ymezTReLIBxE1xf5KxHdrS/65tedN1lQ==
X-Received: by 2002:a05:6512:1114:b0:540:2fbb:22cb with SMTP id 2adb3069b0e04-54229533aeemr14027670e87.13.1735973304217;
        Fri, 03 Jan 2025 22:48:24 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223825f3csm4213238e87.226.2025.01.03.22.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:48:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Date: Sat,  4 Jan 2025 08:48:19 +0200
Message-ID: <173597328997.875472.12782462213120017264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_224826_846221_AF27D25E 
X-CRM114-Status: GOOD (  13.53  )
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

On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] ASoC: hdmi-codec: pass data to get_dai_id too
        commit: 6af45d7df1099ccac634b36f8cdfa32fbca8c1d1
[02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
        commit: bb1d67bf82fbd2c550fa637e0b8a966ee81a293b
[03/10] drm/connector: implement generic HDMI audio helpers
        commit: baf616647fe6f857a0cf2187197de31e9bb17a71
[04/10] drm/bridge: connector: add support for HDMI codec framework
        commit: 0beba3f9d366c6df10e5b080fc99c45ac17248ed
[05/10] drm/bridge: lt9611: switch to using the DRM HDMI codec framework
        commit: c054aa1bf529a2fa13546b25231d16bb0fd87ca2
[06/10] drm/display/hdmi: implement hotplug functions
        commit: ab716b74dc9dd4903b9006f473137e1aa624af56
[07/10] drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
        commit: 4b5a79d7f4d5c34120c6f2e8836bc8ad3a43594c
[08/10] drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
        commit: 9640f1437a88d8c617ff5523f1f9dc8c3ff29121
[09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
        commit: b4fa0800760c20fe34318a1079687526fc323572
[10/10] drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()
        commit: 2ea9ec5d2c207a41d523f8804053cee00fe50763

Best regards,
-- 
With best wishes
Dmitry


