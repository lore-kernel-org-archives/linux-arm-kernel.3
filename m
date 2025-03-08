Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4795C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=; b=jopDGDDtQ7vcRierdN+DAVoGYK
	OGy9SdV2C8f5tWqjhd0bZuAShHAzdNrJ86w/zvS9t/2mIHpaCEuHYHjUvD0waHdnFXOQCQpgvEhdE
	QyP7oGlm5TvvW9dogaPXvasZYmPS6BAIkLgFEk3+M7mBbUUoKMFufe5Ba2qyV49eW13DcWQ3AqgX8
	CIh/kxJ/Z+KO/tDSOJul6WsqWOIJ0FPRgLgAOsTr2tkVFxvxXEltaYxORwC8VlsxSzX4iMB5RDs1Z
	yuYuS3/FvQYRMCmWJx/LnCEMIwUGkhdy1shW3/2oaKXGjGwO092GxskGENX+Et53iqpZ4cD4NTVJ5
	CK33rD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzWI-0000000H4wQ-0wsF;
	Sat, 08 Mar 2025 19:07:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1c-0000000H0VZ-07B1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so4797259a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458951; x=1742063751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=bDvpu9segH/26vg7siFPmMuRC8u/xTWO+PuU6zOL+iLMET+pfDT41JsuelxnaMr6Am
         uCk89W15TPl2xMplTy6IXj8Wti29N3El8N0260laZivv95xPd++kyCVoRYwVAuTPxx49
         6xOovc59DeVJ2q76oyuiNOaKYKTr6IKGocghCH7N+rPF531m2G9CrN7+xYFVcplnO+t1
         AsGJ8KONIrCie0HzdFcWW5HBCgR4bxHfN/CUyRQKzkLnifltJob+gAspfCJ7q7GsgJ7c
         gEN/kYYD+UM3/FmHLRLyItDvhk36D0GP8RRBgswktq8er0l/fKLfxYTlm8ds1A6JlpDK
         3g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458951; x=1742063751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=dGJoWfQE0cmGXiK7nOgJvQGtIrGMaddPM9HTl5SZw0of9mwxx2+IWqZsFnuQmG1Rpm
         I+612vYgVA2dItB7bftnAOuW9xktvjfI3H3rkfceQ/r3IHeeEt7UrzrrySmvppidBCR4
         Tn4GK+Y+ji84N7Ae7kIEcwowx/Z1LucbRMMGcaasiyVRAWHd2gQjnaDGOGfoQD3yqCaf
         SX3y5C5Yoh8dE+b6gYmqwjx8MqTA5BXnjY6TcrGFHUnVpbTSUX4HSJD5tOUCGo5zPL0c
         07hEeKkqC96uRBBtPCLP0kh5411adiFCgkgMEdGy2dqkmP0/O0y4YrrSGg1qg9udHQNW
         Gang==
X-Forwarded-Encrypted: i=1; AJvYcCVaXjfPaIjMrKNcp4L037Sp5Bx5MsQ4zYRTUi/gP2ANt3NQNSi8/SHXD1tO/xvIcXm5ogwFU3qDnTDGyAJvRtGZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzUFihQdrnk6K1RMVsaSE4+OZTxNGPouKtKzkZfAAo/owQSikTu
	zCsA5mnOrPza5qqrntbdcaxfml7M0sBMaGdtDUIWzp62tcdMgVCO
X-Gm-Gg: ASbGncv5ZtDhhxXMG3abNkiOmsmWpvJgpdjLlyrQWlWzPCkP0qsAVhyeraC3/CqokEo
	e1L2tbFqoAAtpT/TtgnDK6ENyFS9WT+sZWQSeNlx/c74u/u3bxDPxKGvehnLEwx4XhcUyZXFjNE
	l3kiEqL91skvvf4vP+PazW58SNoHqjt/ueFUUzW0CGkPSsMGzAa/B5pYfIi2IJwBx6P74agBleG
	W7spT2oZb5QCZ0AfzaMK5AUQMxMhslA2GDgO7s+KIXSId3vKoVPhIbMz02R6EVObKxRGCCrY/3i
	zZytRR/GkENzLlzTB5v11zdi7+QDBP5NnyUB1UHDxGl7egxOoXlJkjFCDQ==
X-Google-Smtp-Source: AGHT+IE7HcMcv8UGE2u8zJcS8GFDxgYSucRdRKjubTzY1De4Hv/qmaFr8IpaN1Nvc57DsiT+CQcqYA==
X-Received: by 2002:a17:907:94d4:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac252ba291fmr945250566b.40.1741458950505;
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 19/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sat,  8 Mar 2025 20:33:48 +0200
Message-ID: <20250308183410.3013996-20-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103552_072590_60619206 
X-CRM114-Status: GOOD (  11.63  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 4c4542d041cd..1680d99b1f36 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -87,6 +87,10 @@ properties:
       - required:
           - port@7
 
+patternProperties:
+  port[0-3]-poc-supply:
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.48.1


