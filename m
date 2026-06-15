Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDA4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJAMcsXbQ5jLlRv6m7LlcFvxZJca/ceaoDodoBDS/Yg=; b=VsAJ0eDgURdyIntep2vRvtcoOX
	5pwI9ZCcDHY3TSmC+FSmAB8FcP3X56E9twx7psCgNHV0rpCVEOGXmZ2cwvVVsVz5l7KuJf6vGwMPw
	qgJWRxfTzHAzJJIllK9S9SiOlLQE5nXRPkb/fkbmmVPvcA6NBPlnkNYTnz7rPdbGZ9XP/38RykJ4K
	NNRwxppwUnKuPBL05e2ntlCZpsCeyv3L2+aOpRmqeJI3UVZ/qWz/FmNXL0R3dj/0hKmVmg/l3GQh+
	lm6sbReylnib4aPKT2/Jxn4tYE+wxljfUuKPbLqez3A8vKi5fj6F/YETvRRD8D9kP2rjbZRf9tZKv
	iD4RpJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19O-0000000Di2h-07Hf;
	Mon, 15 Jun 2026 06:50:26 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19G-0000000Dhzv-44Pv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:20 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304e83724bfso4118398eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506218; x=1782111018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJAMcsXbQ5jLlRv6m7LlcFvxZJca/ceaoDodoBDS/Yg=;
        b=F3SuEzhDKpzEuvKgMPhg3E2hBaOq1nuvV9NLsvWQGB63kpPAoFx8R2LpiTIWn9u8cp
         BQu0Egz75sVJcp8dEOrzefcjbYR9wrdzJyt1rhI0BxTyihyanWN4hxTUKLzw6hO2QuoA
         OZ+0P6p6KDT7VdSYcgxDBTX0Zv8T6fnfgPoCMTL7M2gRWULp98DYmMp50Dq1yRiePkAO
         EZOKu/dcD8jLMSJg//exBeNQ9eF765vNfvErjzPyG37/V31CPaGK/71nUM88dBGwqvjx
         yETbRPXJgVVGLTWqqvuKZAvdShZgpVPw+uLESXbwjDDQUZ0DUZHc1AP6+awXQXBifwAQ
         u7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506218; x=1782111018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJAMcsXbQ5jLlRv6m7LlcFvxZJca/ceaoDodoBDS/Yg=;
        b=YKzwaahk4rD+d+boZHtgLRIUJzmtzkycv9Sht//2XOe3Esu8eTY+fV+luUeXjtof3g
         H6nJSFzbremsIbLAGlXcu0HtMzLfBt13PPDPatAVCHImkWv4eZL9XYouZnANSfPkkUYg
         d4+zHx0PrR83YvbKVnA/t1f4gF9nBSw2v+wk3uMI1JOuQtWkwI1eeeMVlSDOvhMQ7JZu
         8kq1MXfYC0uiDIvnCuFkaqntA4MTHkuhxlKt9L9u6T5Dqfwv/Hg0e3BB5CvivLE5RDbe
         jwDMkRZz1HAm5Z6wIU4OXJvS46UmPu0xKfCu9jlN/sk394ns7ukPNIG8VXPsRtu1IkR2
         RhBg==
X-Forwarded-Encrypted: i=1; AFNElJ8jYx7rZ7Zw+73v/I4xtoibVllctlWfMzRvCb/Cz5XcKxzaHs1TFsG5tsc2pwUy4zbFlR3DBtKj8ojg0fz1E+vz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh5mPsDtagRNGHqbGe2dGLFF/8Rbh98//XYhMJvfmE7Ka+yOs7
	cGz5jJUs3z+WDO69Arr+P4slw6aDK8ZZMKI54gBFHIaOMASuKqsjR/hr
X-Gm-Gg: Acq92OHyRCo8ICGpEJ3hxaj9DM6FnWJDjq2oPTmlE2bZSmJKlqCvQo0VEgB2912rNJ/
	B83WGs484YsYTkfn4DAsC2ZJXGeBuPqN1NAsTeoXiYjopddj2anaYzSHk1MoNCoLa0TY8z0/55/
	huUf4FWRU/vSCEOr5XZ8r5ZWeok3xJzeOmEg2n4iLgnj/mC3ojT1h+r/pXT+PGrX932b0UzH1SM
	GZTBYfeqKo5WPSOOi687h6fcDSyveeJVOQBrCbwF/bm9jUPjwOxdBsq8SM1AD8w+WQP/9ao7atO
	c5vGvE3h4cGaN0IV/MHkQRNJqUKkNpBpkmfnEGXnY9YaJruVSIV0D3vLFzcn9A/882HE23yWR5H
	HQOuwXrScB0k/440QR0N8R5/yck1THGBUdp9Qpswh1tgPYhCPtRdYS/PHWhB4TOrrZa2RE+6cUf
	WWiM6tTxPmii3PWqZ3oteG+h1YkZzvNrkuOXrQpx9MLho/St5l7qCbHfXvLfUS7mcHTDiJ+KBfW
	J3v2QTQKZOx
X-Received: by 2002:a05:7300:4348:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-30820098f00mr7010291eec.29.1781506217988;
        Sun, 14 Jun 2026 23:50:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:17 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 2/6] drm/verisilicon: add register-level macros for DC8000
Date: Mon, 15 Jun 2026 14:49:59 +0800
Message-ID: <20260615065003.76661-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235019_594727_582B9784 
X-CRM114-Status: GOOD (  11.17  )
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

Add register-level constants needed by the forthcoming DC8000 (DCUltraLite)
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..67d4b00f294e 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0


