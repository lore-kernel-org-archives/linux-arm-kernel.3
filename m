Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD4C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=; b=T5m+p3g+E8zCvGF1FxdgZgJMX2
	YKsXa9JEFnHPqZ5O85hH+sUFtdZCJEazFB7FpIKVacB+JoTjixRiywHshq6RvPrVmC3a4qMef8xf8
	Ws4tijE1pSAFawToihEaqAbxPGRGmQOuxNUnEOovxJ8ur963ZJmD998txdEQiJ67wWngKlSpyDxMQ
	ZDXaz2V0w8/88zcLIC3V/qHvWZxXY8z2uNZ3JJrgarbBmSGYBJT5nYDPEjn4p/8ZoBR5KmiQcYvM2
	VFnbgP6bUSQAJL7KWuoUp6lH4/hvoZGhZmZQWPK+bGaNBFcKidk25r3CL+UPjrfIaYGFTbvi7jLdR
	QVPz9eMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvQ5-00000005hz2-1rHD;
	Fri, 28 Aug 2026 12:10:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvQ1-00000005hxS-2NrQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:10:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so6549665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787919047; x=1788523847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=G2yAP1XiGHCbiG5mDNWZLzPQSZmhvxDdemsSiB5KOPjRwa96lFKoTVLC7hHA2quLm5
         dlQh/J6aV6yOpRQnANxo9nTCncoW0eNmJPOTs5djA7oXmMj8Pjbldb75qT3bTTHhIptG
         I8OuqEgFATzTQHc6Zs5ANatJY6Ml2ZK50VgB9zfPBR6FmIUifXBFjM1G6+QWWqKJh2zN
         Qy2uarLMwDsTuSquXw94Dv8+MbcA9y26qvUVW4o3xT6SVJPOGMkarSrPl3pxPuiUtFrk
         wyn3mRCkQpdmXK+QB0vrugKWnUPSrUYSvuMDyOXTd09AL1ZDih54LwjfmJQYgSlpuhWC
         +nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919047; x=1788523847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=cLC87ZCuyL2vqp74K+uK/DGNICrDYwALOle6pf2JvgELoNM4QUpO4yJzPzB30hHR8u
         bTk9mUSfcQTIi4sOKi+QTBDLmb9E9/6LGdRo/VFRqzAzJgka+pfHqlnwc7BMBRHDItTn
         VuMcUFCxIvzCt8n/ugXUJ/e933udFd7GtdMWURH7vvGVtjLwPkdeItSUDvWnsuyttAR0
         afTWdGf0vvHaR5nI3DnSUlqx1XMqhTyX2DZkjkvOcsYrITtsieUWSo+sZMNLy5Sb6HQP
         EK2+q41+QTbg0E/+RAaLRV0iLH8/q5KFyKPvEhFdtsj1c0wB8lHH+XXUsJ8sMwDQPc8F
         DeDA==
X-Forwarded-Encrypted: i=1; AHgh+RqcjU8jMKBH0GOBUYF2BwyOmB/LSE6z36lRNYab3RPb21c/V4RYDpV+odt902yeBZGg8jTk/biOjs9EdNoUafCc@lists.infradead.org
X-Gm-Message-State: AFuF++mZON5ebD0e5FVxwKpG9sGIZRQEG6Y6J+Lis06om9mkNl2H9E/T
	MlDYNuapgrhHEgq11o/LEWtHhJwZtbuJ8f/vsmn2ZmCMIZ7mKPGLabvlhYgOpxSTGkw=
X-Gm-Gg: AR+sD12v5ZrO808gBAKTYVslfOiKrqRSHGR0K3y+ZBSlHAEYB/qCpDsy7fFCaoe9H8q
	HWWBO0n2bniI6tYHQQukzxiQMbli2i6UKVNyDxhRc5ugpcuiroxD2mv8iwmDR0oMM1czkXcYFuM
	ywUfcl2WUbIOG16nGOd4dSMZDuokq0nHe9kx8h4+8wWaLoVcTjUrC3crPYe3MmwLmdOMoDYCuKD
	EKO7ifzMH92W7+ffKzpVgMup92PKuwWoazLgAwiUTv2qLZq1XLM1jnCngzAfiRmBSiDGgzMIX9i
	REYgrLQTY10zOXc8HIr24/mCe5IapJCSckvsPCmxu6ttu8ycHb+0RUCbLkjU6FGdGt44mh0WnbN
	sK1LpQs1DNbDB+DFpbWo6WbF+SkRnUeLlYDK9lfS3eR/fY5ATk5ykjaboplACM9mtOQp+9Zi3Gk
	VinAiMA01Dx7ZpLTpKp6ozgRlVBlwoO5txiMaKH33HgDbiS9/2zwmUjsu2VbafNUzmgOSKp0zO6
	yWuHLVxwrVnk+odk+9NvqCB3r3lyqV1rBMF/aifTkyZfiYG48u3TaX55kJBEBqGLaOA4z2Szxa9
	MYDK5vtXTSszMI6QHOEEpUqnRvJeg4p9Mu5yEIXXC3MaVw==
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr84183025e9.12.1787919046770;
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
Received: from [192.168.1.100] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm125368175e9.2.2026.08.28.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 28 Aug 2026 14:10:47 +0200
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQrCMBCE4auUfXahjaDRq4gPMZm0q7SV3ViE0
 rsb9fGD4Z+VDCowOjcrKRYxmaeKbtdQHMLUgyVVk2vdofXO81gePKRReHGc5c2KXqxAec7ZUNg
 fTyHHvY8hdVQrT0Wd/R4u17/tdbsjlm+Wtu0D+/pwJoMAAAA=
X-Change-ID: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tommy Chen <tommyyl.chen@mediatek.com>, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_051049_628433_6DFD398D 
X-CRM114-Status: GOOD (  11.70  )
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

According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
0x8d0 is the VID_CSC_COEFF_0 register.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
index 521b35c7e14d..bf3ebf5492d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
@@ -173,7 +173,7 @@
 #define  TPI_AUDIO_LOOKUP_EN		BIT(2)
 
 /* Video downsampling configuration */
-#define VID_DOWNSAMPLE_CONFIG		0x8d0
+#define VID_DOWNSAMPLE_CONFIG		0x8f0
 #define  C444_C422_CONFIG_ENABLE	BIT(0)
 #define  C422_C420_CONFIG_ENABLE	BIT(4)
 #define  C422_C420_CONFIG_BYPASS	BIT(5)

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>


