Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7088DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zjiz7ZnbyxVfBfvfi0uSyQjszdJNoTxi1eUy+vx48jY=; b=Co8jd9c+JYv+XSjnZBUoTVo9kW
	JZk5Wk/azDeDk7uCfZ0aTJYMxWWVGxrZ80d//ODHSBwQ2k9eZBuLeGok2XHi2/PJi7XeYPMAX0Glr
	HlYrS7ivKG4MQAOJRGkG76Uz0Qzs9MlpY7kP2OSE7gRXHC3Nih0yr13ZYNntGR4ACExlIYadt2vyp
	TVLVlda4vi+s50SFhbChNaaNRgP/W+xIMP3n9r/c9rMnbEI1wRSNlMZZNd7YdIoGH1p2yP8ltly/x
	MaFOnjCVSyj5vtonk363D+yPrTHjtGLYXd6sjvBXX8wSaYeQGZbDSKGYMptY5pmrfvsw58+Y100xf
	oUR3vXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIZ-00000009b3n-02pv;
	Sun, 05 Jul 2026 19:14:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIT-00000009avB-17Pa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b7612475so20273935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278871; x=1783883671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zjiz7ZnbyxVfBfvfi0uSyQjszdJNoTxi1eUy+vx48jY=;
        b=UmGEP8y6Nbl92j+ZoVyQanvhXBnequ8rul7XGhdjcpFCnaITdeOAmUeTaLXFq//V3r
         DqRIoRuf8mwLsURkRNLs2EhjyrD8FjgrHyX+eqqa4jh1n8HZX1pTX/NRPZeJm2sR/wV9
         yS3Frj2zLwcAWeZzEPgFqouf474PnFrIzLpbR1CIi3LzxfT/lhkBhwflEfi734E45t7K
         tpSPaGa5MUj9XMb59zFr+qjFJArRsp7xeHKmhY1xa/2aBXlH02e0PNpsM15tFamcB5av
         1MQ0JfclVpYMJQxuj4l7uUT//fdnN9OpHoMZEOvQmWoBiIiCYzTdY8ZaP0TwrxJ02JOG
         +m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278871; x=1783883671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zjiz7ZnbyxVfBfvfi0uSyQjszdJNoTxi1eUy+vx48jY=;
        b=Mb4iDhM44oYJdnxHN7exv7F4jCrVfw36mBp5Y0uBtEluLhyse41DHoou7BdT62fpCY
         RgI54jgq5pNpbqTUCLpKyvrAo9ycYziL/EuY20GndXoibqlecEdjUA944nOcSP9fEjCy
         ODM1eZ7tq0qhxlfC1QtO326ZfbDg7iA9ozLOR0q+34OusTz3nlAOvoJ+kYBbC2Bg4n/u
         p500dTC3TNKXtBaqm2oLEemUkOrNwYA13b5pwn8ZjOz7y1EaR+le/6xrwl+lx77PAU5r
         8rEnE/PULZtnQi7df0DDiNSU73K0IpJLB6N2Kph+YS/n65z6JeD/k39UwRMaXF7pa+ii
         ORiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrflHs1WcUtdZtuUqn5IEHE2gO1gOw5YsAkgYpxzosEoQkWJyCXlHJXlhA77R+XqVI22tgXUfQsGbJIVdfbQnOV@lists.infradead.org
X-Gm-Message-State: AOJu0YxaAMvdXp+aMHac7R0+B2vDJ0G82JIwEgaYclvsp7Y55PFy+6Kg
	RWhq9hZ2uLILaHz9zgqNad9Q54y3Pe4V+5GPK9PTKcu84+LOtL3R1Yw=
X-Gm-Gg: AfdE7clOf5fbsNyweG0MgRh6jAraodWTB6bMhn2lTXKjU7g/NA13Q+VnDrIFA0IHi61
	4apqpvZOflEGcAdwF8s45JfN+hliOTaH7A5ibmJEeA3eBTzT7jzeoAGlZ7sPV2azRsq5uO98MXJ
	RfAfXRBS6EqBosLN7jWdMcBEebVpKbhVxN6wND0FnnwuNijoR9tqOUwjUmcQt71oRAsrQSgTpn9
	W0CWo6V9B/VGk33v7Kcu3AS96pzbw6IYCtRizXnOxnoC9N/QLgX/4GJmZPJQJy8/5ku5t4APo2H
	UcFYN6cu7/y1d9zEalQDfdrCFX9l8zYWMiCfbEVuQKN1ytMMywJSIVYABtNnsaI1HxNlWMnyqW8
	kQlGvucze+ltBPa9G0E3bTHvWRCUpO8eHXBrjz4jU0fjShkGzIQZzOZTfZ4B3EpVb1ZX/zTqQnQ
	/e69hSgJ6utn5HXb9LA6uWUlA54SJEow==
X-Received: by 2002:a05:6000:2c05:b0:47d:df96:c9f4 with SMTP id ffacd0b85a97d-47ddf96cc37mr2857980f8f.10.1783278871226;
        Sun, 05 Jul 2026 12:14:31 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:30 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:43 +0200
Subject: [PATCH RFC 09/13] temp: add LPAC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-9-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3442;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=gKbn7DxHBfW8SLIM+L0EECSMebRwKa2NPKVJkQ/QPPw=;
 b=kVEoEECsDH8lgKuRlOjhb0NLej7gAlbXc+I8b7Z8Y6BmwMTjsJI23i+SxwgE0fdda9uz24tEH
 NoA9v8TbOQcCAGwLTW9/mUY/YNUbybJ8jacr99G3tWrk2UifXc4ttFe
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121433_338424_60DE5985 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416

should we merged and we should sync to mesa instead

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..bb49f6a61a9a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -276,6 +276,11 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
 		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
 	</bitset>
+	<reg32 offset="0x0B09" name="CP_LPAC_PROTECT_CNTL">
+		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
+		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
+		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
+	</reg32>
 
 	<reg32 offset="0x084f" name="CP_PROTECT_CNTL" type="a6xx_cp_protect_cntl" variants="A6XX-A7XX"/>
 	<bitset name="a8xx_cp_protect_cntl" inline="yes">
@@ -333,6 +338,11 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0845" name="CP_CRASH_DUMP_STATUS" variants="A8XX-"/>
 	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0b00" name="CP_LPAC_RB_BASE" variants="A7XX-"/>
+	<reg32 offset="0x0b02" name="CP_LPAC_RB_CNTL" variants="A7XX-"/>
+	<reg64 offset="0x0b04" name="CP_LPAC_RB_RPTR_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b06" name="CP_LPAC_RB_RPTR" variants="A7XX-"/>
+	<reg32 offset="0x0b07" name="CP_LPAC_RB_WPTR" variants="A7XX-"/>
 	<reg32 offset="0x090a" name="CP_DRAW_STATE_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090b" name="CP_DRAW_STATE_DATA" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090c" name="CP_ROQ_DBG_ADDR" variants="A6XX-A7XX"/>
@@ -521,6 +531,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX"/>
 	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX"/>
 
+	<reg32 offset="0x0b30" name="CP_LPAC_CHICKEN_DBG" variants="A7XX-"/>
 	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX"/>
 	<reg32 offset="0x0b34" name="CP_LPAC_PROG_FIFO_SIZE" variants="A7XX"/>
 	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX"/>
@@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0x0E08" name="UCHE_TRAP_BASE" variants="A8XX-"/>
 	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN" variants="A6XX-A7XX"/>
 	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0E12" name="UCHE_DEBUG_CNTL_1" usage="cmd"/>
 	<reg32 offset="0x0e17" name="UCHE_CACHE_WAYS" variants="A6XX-A7XX" usage="init"/>
 	<reg32 offset="0x0e04" name="UCHE_CACHE_WAYS" variants="A8XX-"/>
 	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
@@ -4406,6 +4418,8 @@ by a particular renderpass/blit.
 
 	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2" stride="1" length="6" variants="A7XX-"/>
 
+	<reg32 offset="0xaf84" name="SP_LPAC_CHICKEN_BITS_2" variants="A7XX-" usage="cmd"/>
+
 	<!--
 	The downstream kernel calls the debug cluster of registers
 	"a6xx_sp_ps_tp_cluster" but this actually specifies the border

-- 
2.54.0


