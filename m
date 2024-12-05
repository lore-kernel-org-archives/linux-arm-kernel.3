Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDE1E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=; b=dl8C1gqDap8wALz8B4XIbw+TbU
	+eDMohybQrpo4yhy4lxbRR6Tp0cX0Tbu0PAuMVn4uWHxt/SanvrPGU2nUNGa/NcuOp14g4Q5Us5O6
	115yz13YZOLTkPMtlAoQjlVLKoY3RFArdJzSTe7oKsUasfNjGokw+W06JNITgvjPCQdjm50nGjcxt
	0qm93eoKUhtCL0dAUtdZ/uz3K1ZMeThSzc3RRWh7BaPyBRnMjrUV+HBWP4zCXGm0C56n7DpqVLmbz
	j6TrQDVY0Y/xr0WdX5RvIK3HQzJwiuFwKa+5lrsOmHpYLdP5AKxu5CqE09GDl8mVbr+EMKvq70DYM
	5oVMGrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHGH-0000000HBMN-3rEq;
	Thu, 05 Dec 2024 19:11:41 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHFH-0000000HBGZ-0WA4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:10:40 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e27bad7a4so692922e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733425837; x=1734030637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
        b=NxG1qjOC5/ij3iRQWBzaijRZPKycWkLdLuQ3sexg/avKnr2ukS5frDEc7fxqDNMzTe
         qt9hlZNkeEAUsbt0ekQnlOLYCoXsUyQoaIUxLVxG2GGQemcx47AUNxupsKdz6ea+L9Y+
         2Vm7CwdPfxGnKQ1Q9OHBVsPpv8LssEkUySqsS0VLwScRZBtDM2Y3Rc0IzcQTnrEZ2WB8
         nHbMyOgPBgfPcPDNZQP3kOF5IuyOb5OrC4wHEqW7toZD+bU6wofPZ8gtguwL4pq87+Tu
         lfchcA/RHGqQBN+7RTkxF8u9mFBaZwRe7M79qOpjKWUV7gGw9dgH8uAOTcBQ+nfoMbzQ
         AkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733425837; x=1734030637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
        b=v8O5iS0tk3vF9HNdPhDQxAq1ma4x7BXWCSf6zitaP/IO8Sxakfuhcm5x2/Pi/qWcG+
         J9Uf4wDF0NAPPjt99t4MK24LVABFGnLXNW0uMpNchbzXzKyl+i/q2XLyhJ9cMnYo12Rz
         QafFv0LX9hdAVIoRl1aREwKxhZdiw3f3Q2DW2Fy3I73TxsTdvthriD6VxknCrIHHLmXG
         KhjtiPTTba/xeuYI38hY98IcjmHQ5IIQABI/rWRRZBTQxsZNnjytB//DlA3D/iYuWOHv
         Jllq1vgMpimb/AP4NO+6uvOKlaSss5upq7gXVHHnLhN5Y2Jjki6q5qgFDhiuXv8NZ1uS
         F4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUInTEPY7jOj2iSzXL6n5a/CfbMcJGXNd4T8XWruYbt+BjEYF7Fm+RUhUlSWq7CpiQi6gtgLsUrKyI3pJJZnLGf@lists.infradead.org
X-Gm-Message-State: AOJu0YxoBK/QyGVwNCaVsCierC4NRBWL3QbfnEY+RoSocXB4jJGuawdJ
	CoRpOE5iyFG/ggzNwXMUM54UmMEox5gHbxkEACorATLyCb8Z5LKU/ZaEITils+E=
X-Gm-Gg: ASbGncutI2402MQBoyq2rwgk035yrzEUnUSRxWrpzhZlRDNb8mgYzy400uSCI+iYd+e
	o6hTC+V0z/XgnGBWwhsMWgqZVxq2oTt9slYV3WHtfW4PyTzSZaWzNCSII2c97Y65ir1Xeq+XcXO
	ebZTylz9Q/1zkzo8y1eQPO6uXM2vI0xMDjvUD+JcfeXiVbvzjfeWd83kDHAuFsF3ttFEcfRVI4l
	SO/X605iQqmha9NKT8j4JetYYrMbhlj9MHL0rDWYhLMGNwua3uxFP0tb6ta/PrdNNYh2r0EiuOF
	x68ln45Fgd0ZQ5hLcg==
X-Google-Smtp-Source: AGHT+IHUNLqaLQBuYan1ZGoMqkshI2yl9UY4KpKLMA9S8dD5jZebO/X3lWSvz99JLzTn4lGzisOwhw==
X-Received: by 2002:a05:6512:3c99:b0:53d:ab21:4e17 with SMTP id 2adb3069b0e04-53e2c2f0135mr21836e87.55.1733425836767;
        Thu, 05 Dec 2024 11:10:36 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm314252e87.52.2024.12.05.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 00/10] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
Date: Thu,  5 Dec 2024 21:10:31 +0200
Message-ID: <173342582161.2533869.11795486713615996638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_111039_166887_99C5C02C 
X-CRM114-Status: GOOD (  11.56  )
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

On Sat, 30 Nov 2024 03:52:25 +0200, Dmitry Baryshkov wrote:
> Several HDMI drivers have common code pice in the .mode_valid function
> that validates RGB / 8bpc rate using the TMDS char rate callbacks.
> 
> Move this code piece to the common helper and remove the need to perform
> this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
> skip the check in favour of performing it in drm_bridge_connector.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: handle empty modes in find_preferred_mode()
        commit: d3314efd6ebf335a3682b1d6b1b81cdab3d8254a
[02/10] drm/tests: hdmi: rename connector creation function
        commit: 67d31cd02c8dfb3d006dba62a854e6758cf7a0e4
[03/10] drm/tests: hdmi: return meaningful value from set_connector_edid()
        commit: a8403be6eea91e4f5d8ad5dbc463dd08339eaece
[04/10] drm/display: hdmi: add generic mode_valid helper
        commit: 47368ab437fdd1b5118644659a97a6e5dab45248
[05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
        commit: ae048fc4f96d716a2ef326bd6e894694057c078c
[06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
        commit: d4581ae8695863b21f9b739dddce8159f3068ca3
[07/10] drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
        commit: 54d7b7f9d637a53ba19d117eb9b01619bb1704ed
[08/10] drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
        commit: efda6551aa866b80dcb5a94158d805c560fc4f1c
[09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
        commit: 2d7202c6f38d14260a3998a2aa249a53415a24f5
[10/10] drm/sun4i: use drm_atomic_helper_connector_hdmi_check()
        commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b

Best regards,
-- 
With best wishes
Dmitry


