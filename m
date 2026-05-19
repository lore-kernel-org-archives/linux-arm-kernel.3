Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B1DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=; b=jcB1kC98pf6dcgkmxwMswoUNa7
	tpW0BgRDTCXsuJC4hX42zWgTSPpUNQ6ZSaD6oWbQtJPQs9yfvE8F6MpMzXBF02TwKcTUTc0D8k2xs
	A7hjavlKGzaCFHzJIzZgHhqy1wTn1jxkgS6/zmE0hpyLWFhUTU7iXwHDoJjBcUDsbGv2M6PC3PGXc
	zlXOvwBXdaUVyR977xfn2jeYNWgEIr8HPOhtMwyYbwRlut21OrLF6gAO7nUsLkMxNXeeEd9OUgvO4
	iREbO2HkBFYdZHqCMIbLYCMMO0EaGJoII7rOWXdG3ffiDpfJHY98ydrtA/elZ9zhwmuDKKSx4k8Cs
	yfOO1BsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLko-00000001tcA-0Ccp;
	Tue, 19 May 2026 14:49:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLkl-00000001tay-181D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
	b=gKyyfhMhw1GTX3gaCVRcGwH9waVBhhGgRNxWi17IF73R1fnnBKfm/BPGfUKuP8NKYSRYec
	kQ6Oy4nY9HlsTTWLfmnP/tSPB2SlioaUo2gbRfwPpMR8Xly11xxgEqS3edh/I3ZMDJeTpe
	1XbvNSRqul5MT7eolfrKmzrMSaBn0xM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-bgqc7MzNN9-9CktfE1HQBA-1; Tue, 19 May 2026 10:47:24 -0400
X-MC-Unique: bgqc7MzNN9-9CktfE1HQBA-1
X-Mimecast-MFC-AGG-ID: bgqc7MzNN9-9CktfE1HQBA_1779202043
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48a589c7879so30830065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202043; x=1779806843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
        b=HGRfImaae0rtdvg75R0v09Fm9edMDdE1RmVRZY4dfTfJE83vBhf3y17tShbBZ56V4c
         3qSmyYpuYdxRJIvl5NLHUqWV92wfzkSReRixY9XXYvOEg0N29a6U51R1VaW3E9JCEDVK
         gNwfaPD9Mh1rO9AWeAr9qWmBAjSOfu0nb6qgm/Ds0oECctIe/j5OvLUev5F9Az8rNQeC
         m0w02Z4RIgOcmTOHrC3y2Qwul+xbMo+evvbrjwdUEd/cqLONXU7c1jWRj1kaK+WeAOuZ
         wmbNFfM5ApVzrSiWYooyd7luhBqnWzZ07poSQqg5fWH8Iiesjdmsf+d0a+hUfu8llU3H
         oeFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8znUmO+lkmwb6af8CGes19KY5yzn1WLX01MLJ1dOLm9iiPG6ZQMXv11IGrxPzZRNEOtG9Ky+KjUoM8OK3npmoE@lists.infradead.org
X-Gm-Message-State: AOJu0YzDNAr2fFPvE7kKMM3vNfla8J6mHEE76kLMjNo2m4HQGGE6Oogy
	emytjG4zVBWnuGYcUS7SMCCA4bt7lFyUcY9d896RGKt/k04qUCIg2g8ACFyOS+MbuSOlrWjTSIW
	nVXnscW7dNUqU9iz22+dV8AtWKw6GozJVKKJXOG+1SE+aOmk4EMX2ld953al38V83maKReR/JDp
	En
X-Gm-Gg: Acq92OHosyCe/fZGiyEuYD2PrS2ZSDJuDgNEtmx8tgB1byq6xStw0mvydjxsllkcUuj
	yspRQwFIHxH2ZjSbwQ0xZB/NqATyLGY4vwnC6Sn8635FreDl3n1KKz10vKB3zSieMCOi9ArMlnb
	Xcxjzfh24m4vGC3G62/oWVtZjyhRld7x96TUS/vvX+QCFUSnVxMltXCnIjVZlmF7VBQlzbWaTFo
	sHHNigYLcptItxucONhYLt+3Esd+llt05ojh3sRcgl7kLg3c2YVKIdDCStgdRVsx8umGBB1mLTu
	++yYgHBab4X7pEPcjnQ2CpV61cZf1s3XQLSx/oahB8tQVLxe8dg90YPVdgJP1ed0iFL/Ht1s+JQ
	oMgD/MMOQ551MXzv0tduuWEMdjYLfboAgPUG3DR7zYJtnaZVNEBepv0tNWA==
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260381875e9.10.1779202043358;
        Tue, 19 May 2026 07:47:23 -0700 (PDT)
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260381215e9.10.1779202042898;
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm298800115e9.10.2026.05.19.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Stone <daniels@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] drm/display: hdmi: Add common TMDS character rate constants
Date: Tue, 19 May 2026 16:46:56 +0200
Message-ID: <20260519144712.1418302-1-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jybchn8fnPLm9Uo5wcew-GGgGsNm24wYBpmkKKNVgn8_1779202043
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074903_376705_63E0CD98 
X-CRM114-Status: GOOD (  11.71  )
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

Several DRM drivers define their own local macros or use magic numbers for
the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
instead these common rate constants could be included to a shared header.

This series introduces these constants to the <drm/display/drm_hdmi_helper.h>
header and replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.


Javier Martinez Canillas (8):
  drm/display: hdmi: Add common TMDS character rate constants
  drm/bridge: dw-hdmi: Use the common TMDS char rate constant
  drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
  drm/bridge: inno-hdmi: Use the common TMDS char rate constant
  drm/sti: hdmi: Use the common TMDS char rate constants
  drm/sun4i: hdmi: Use the common TMDS char rate constant
  drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
  drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY

 drivers/gpu/drm/bridge/inno-hdmi.c           |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c |  6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    | 10 ++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  9 +++++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  9 +++++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  5 +++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/drm/display/drm_hdmi_helper.h        |  6 ++++++
 8 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: fa81649af168a4d6d5260ed0fa9bbb5f6db3f11c
branch: add-common-tmds-rates


