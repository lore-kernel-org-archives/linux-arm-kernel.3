Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417EEC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=; b=jgrXcb893+shKgfjtCGTT8I+LF
	2IlPMGdBXVbHI9veupiIQ2Bomynql3oaijh6TAxc09zHr/lHdFeP1mNdnGFlziVwCWFqEFzU6UwSn
	VRRB5fEFuiSRBU/NPtjnHqRnw22HebgDmAqgpxhLk+e/pOerUXpI524OiIjM40GB/FY0ilRV3w/ds
	hSukaILJih1rM9vHWTfvgNfQY3bAOEbtN97ltZf5ivX+PNdmdttIS8zU+KL1mYQCBJB15+5lHh/MP
	dSmjShiTKcpkItNXvJ7ZtMN6w2pbaVQpK/7VgE2+P5uyvGDQeEMIwbaKh8NeKd2BLQdLtx7M12EkF
	MiSt52oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8f-00000008Zjk-1mup;
	Tue, 08 Sep 2026 09:29:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8d-00000008ZhP-1Ssb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:29:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so4552556a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859750; x=1789464550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=sAeAXRXDropgjsmWjJWsNA2kAGxfEwmkQApxEGnosT9BYjaoHsYQqa8PqQ44b4TDal
         GfIiHxhk9fXPk1Q08wa9Avg1GsyULaM+GP43HhEvh6HPMNipqlZUrEUftm4XOJ/u6SfJ
         Fzf+xy54Rnfv6lwGFNbD/Tbv9vbdtK6WhfPsMzERG6eoCT5B/Yat45ibM89KeC0kODR4
         8U0FLH4HiRhzDGjLuUiOZ0wbLPdsZTJQlMTysZLJ8Kl0DJ9vIzando63Avwnz3ZOMVVP
         MIn6noXr4gfAIM4rdrBBICnUtrNgXFVhAPvWnCpAFCHCxEg4bDdp0sTGghRH8CCLa4X4
         VjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859750; x=1789464550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=ZLdIrjNeXEJHbVS9b9wDeL+K0nkV4Pt7/fkDVeckxi/e+EdgRNVqrvF/NXnx9Qoh8w
         wgQ+ShDskyHC8ShjePU3xu5s+Gukckq374wSIdRNvWL06hDZlooVLz+xsYL4lpW5qWwq
         lfoQ1J4i+ayqIGLZf+3bZkGiBi5KQ3Yi+yRieEwDqkjSURFaLFeSRIFF2FK6J0/5z90t
         KTscnE9hG2baI+pBtc+yd7ssu5XAupavAY8S9zHciSObSZwcyBlyFWe0zwpxFDvgBr/l
         Wq8qtsNm5UCfmT9Xyr9vprM57lgE3m59O7sFewhMFErxKr0N8Tynr+APPzSxONaK92kw
         oXog==
X-Forwarded-Encrypted: i=1; AKwUvBxFgDrG8KFLmb+it4/tB1CUjDEZ/s2ru0JoVjQRZrHVlSlXJnHlv/yYMv30pEPNVPr/4gA+cGzCU8oADQxHFhw6@lists.infradead.org
X-Gm-Message-State: AFuF++kdz77TpH6+d7DxC2OYwyyiPyGWZK3LD+SKUBTIhYUuJ32il4vK
	PxUzg6tC+iOH+0CnOtD5D48Bgecbe/nuue9HWyWAX8foGDcRgR2q0v2E
X-Gm-Gg: AYBFou1cSQ3dKZViS62OfRJU1KHipicRuBuRms5x2Yhs2wKi6SQFBu9nbcU6gy51Ck+
	JlI75JJYRTChJ/Zn4rOec1zFP6EDlk5hoW5+CBz81pyQS4iP3Bl8iD2bKjbXq9XSWg+gi+bHWr+
	O6uBbfz1Io+54nwueHycgzXAYWAMSR03pkQSS89kLsygk5Dijy4PLiXxgcLxdUhugPYf/nx+zQY
	qsPaBwUIuRr8TBLAhV/5riguGHcK2UktRheJLWNK1gON1s7boqdrdprGEjR2gse8M+ZpHWbwHtS
	ZDBEfg+v3Hf/zPq6YxrK42+x1wUcsj2TCo/FSFtQk4aVXk0QgGL2dXy5vuC9/Jeih0238tMDv8T
	zE5JqkPyJg7j0MLqv+sTb7O0bxmj4ZzPuBpUwPrhlqw4+h8ZWjOZWKgW25AcT4HHIY6soMTXVQW
	ahmSCObxqzCl3T/jPBVGpHL0aC2SfjVx1dwBIOuL9Km/zbKxMlicIyFVE8mdab0p/gn3IFCeYjP
	5qB7Wge6g7acrIf9avoIsYZuRXqTZHV42ld5WirPqsgxR/sIlR/
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr43975973a91.20.1788859750448;
        Tue, 08 Sep 2026 02:29:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:09 -0700 (PDT)
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
Subject: [PATCH v6 6/6] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Tue,  8 Sep 2026 17:28:40 +0800
Message-ID: <20260908092840.225220-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022911_390019_E7D0F94E 
X-CRM114-Status: GOOD (  13.51  )
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

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603c..295d246eb4b40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0


