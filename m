Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53610CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=; b=3J1Nb5MHYsdKTDYT21SBZfr3py
	1qvrYhykjva/8AnAX2i4VKxzJ1+VlpNMuCnCyaU6YNmNEaN+liGNV3YGAkT/mLtARljY8dPtNSfdP
	/MLboiIMdvP+MaC+lzZ7oordeFWiVdrIQ04RSqfo0q7gkAJxuVQNg+u6S2XOD07eMh4IuiBJnW6s2
	yrnmh21w89BdpH6bluMWnRypTMbT+CS35UbVT3qlYrv7o3NGscUug3y+n0SsD40csQTLrEY0X0TUc
	zOHDrshVsnc9uci6jfdrb0im419cxFG6xAtrC5c6H0numThXHh1GPhckhEfKQ97C+ZF1Jla1itIxQ
	pmaQVQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiA2-00000004s0C-0mkp;
	Wed, 20 May 2026 14:44:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi9y-00000004ryg-1Hfy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
	b=M6t2HB607i3+ntgaKl+M2C7S57ol9sTJo9KyWzXQJXm3BOFAMQ9O3xu6W2KrNkCx7kmNk+
	wVsrgUFxwS4nV36G0qL60hBkFkm4aW/uVsrlwNHtQUcVEGeoX3BJARgPYQWlbh/WKVjezN
	QJ6nkFiMMjMyLCkZFudNXZjIbv3Eibg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-ot6OHlS2ORO4eG9ZK1RqbQ-1; Wed, 20 May 2026 10:44:30 -0400
X-MC-Unique: ot6OHlS2ORO4eG9ZK1RqbQ-1
X-Mimecast-MFC-AGG-ID: ot6OHlS2ORO4eG9ZK1RqbQ_1779288269
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4411a36715dso3209234f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288269; x=1779893069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
        b=m4r2kDatz1N7DT3AhIzW9RUb2Nc+jN8LTNYlMQKxrJltZELeOtfirjGFvBw0sqTfgj
         pQwchqFdxsBCTmJ5ZALtMTWWnUomMyLYffG+raT/yORgU/n/gvCx07YElec5u7NCBrxm
         fMOgpJlkuJ4LjBlI23TC72xqbD3oG+HuQnfPIle9/e9ZbkGMygoMpbYDBmpF7HakGzZK
         ZNIZ0zJP7ue5SUmcQxkWtKpXmujEnUjkp5GR6mjQcHx2O6/qZXXAWiW8+qOJnl/HWIJG
         vzMifyQ/Km4Tli7dbcbeIAbNozdU8+uJAsLSZpjh9GG3kbgcSIlJT7zxvT+Z5dafU5AK
         wGAw==
X-Forwarded-Encrypted: i=1; AFNElJ9lX3+KnZUo6k9atPik0vjHXoADKZEMaKq/pYZz5H/0+AceOpOtwlnzyqKHAksRuThJvsg59hkLJTo0wLg4UlLe@lists.infradead.org
X-Gm-Message-State: AOJu0YxEEvEMZq1rZA5sonU+qP5fMVMvFCWUJw0JJCRXveK8hKmLPKgW
	JMiJ+opOye3X6u8Effoxjd52eI3US7Y/HmJRVrgHeso+rPc3qUOvxPHYlkTWbpj2ZVmSjto5hDb
	F7wCQL9qIOaNEhmGnVWXZxlQvem8z/3UOTLsWntU+or9XogpwahctJMKaIS7v7tKAMi5d12f2+N
	ON
X-Gm-Gg: Acq92OFeWBs6AeJTgW1uAcid40GiSS3Aa80RRqoAZIBj4O2zApR7xltgpcEFdEFOs7+
	GJ6n+ROh8oJ4SVlBcXnxhuDUfyjzN4hHb7morgSntdivuIAIYQqgkv8u6goitaBiRN6VJNmmyS5
	vFZUt3p1miCCaH5dFwaUBVFIQm8VaIRpVU30gk+gr5NPAi7XHSZCvxzzrcCwbDFEM+eN9SjA3T5
	9RLuNRBuD5zE/TK7O6tSQTESe2cMyNlipihAcEk4oK6fFH+h+OhBupGkrfxOKv25K6MlBUUJYOS
	LZ0yOdBaskRNRicJ+Nm1A/nqRU2MOE/xozQlSdmS3twRx1zG4YmYofOsFsMuLZpe0xonLKlGW1u
	ntGUlurupTT08TAZCC25ALfUx0q3cxA2RhnLVmUCeal/dRzULqDPqN1XYyw==
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650625f8f.43.1779288269063;
        Wed, 20 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650545f8f.43.1779288268562;
        Wed, 20 May 2026 07:44:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm55752127f8f.36.2026.05.20.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:27 -0700 (PDT)
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
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
Date: Wed, 20 May 2026 16:43:36 +0200
Message-ID: <20260520144424.1633354-1-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ogjed_Dreke78fQJKVJ4jAVfkhW3PxCoKhtavdO8mx4_1779288269
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_074434_416004_60F55EB5 
X-CRM114-Status: GOOD (  11.77  )
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

This series introduces these constants to the <linux/hdmi.h> header and
replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.

This is a version 2 that addresses issues pointed out by Maxime Ripard and
Dmitry Baryshkov.

Changes in v2:
- Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
- Define the constants in <linux/hdmi.h> (Dmitry).

Javier Martinez Canillas (8):
  video/hdmi: Add common TMDS character rate constants
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  6 ++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  6 ++++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/linux/hdmi.h                         |  6 ++++++
 8 files changed, 23 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: 88658ff0e4e7f46dbf8179af1280f2cb295fb0cb
branch: add-common-tmds-rates-v2


