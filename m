Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1498FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=; b=P4p5ELCmjwZwLmEqcBQk8OfJvm
	3ljoBPmmE259CEPd8NKrzfrBUuJy7wPIXeufmnTpAaFaeLup98NFoyK9kaYtMjAIu18nhhbYiTPIb
	kTzEjTkNuZ4dsR35gB/5felgwtxMqdiFSpaBs+kcua+GncQ8oH01hrjQj62yojo/w0qw9b2JD3j4N
	lVnz8wKKsNGczI3sh/yAwPYdUyPsKYY1gPp5DbxSNwMyMu6X26JENnpdoF/OjoANpH8NQmCzh6H/P
	UHOyZPBJos4WeGDX+0/9YdFoV5kzQTTcucHgbID19Kjj08CMKjUPDw7dY0UpcdI+JZsKXlJPOrFcm
	W/mX44uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYnb-000000099nF-44Ko;
	Wed, 08 Jan 2025 16:20:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYim-000000098HG-1F7C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352951; x=1736957751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=nNlYxoIVQNCrRrgsrvehBNERiOZqTLamwfXlsvwl35Y/HKksmw29IbCVUzwMA2o7zD
         vR1eIoPIsF/K+wlATRn5vwDk+c6Q++uvpChW0HCm86HXYwbaIWAQcV648ZB3rNiJ3btP
         Qx7axd5zN5jtDgImWEFlfscOW+VOAu9dj7cdvZ1sxCmrSXbqEUcsD/hvmC5/3Jiy8bdi
         4OtiW2ebPgrXf8NwkhoxaUoWtvU/pEYzG10ogdUkwzLG7SMM2QsgRJ1boUhgdNe6QnzY
         ZlXPGv6b7SzkK7QArnslGXFFnhahTM7ifmZY56qOLJ+lvjyRnXiE7x6JxDzhn6f8w8dv
         pEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352951; x=1736957751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=c+cDF34nAq+k+UUZrd1N+7qDrpxqZcZ7GttCVxTqyqROQ/Ag5qeqdKXze1GaAIzhu4
         VwwvRWwbui/Iy9R11JABBeOSzyY1sbifI8/b1wfchbxRvUpUI3IWJa/FDqAZzHCzLu4e
         OJFlvU6D8JJMZsZ9CYA0Ln86wZcqZTQF3V0HtILC5c84N3KRKisAAhkAbXAzC5HWK+1V
         sEEwtX5nAAXQmfvxMgUwrEIvLAGnoMD1+c8dqOBEodU4+Xp66i8RdiXTVWUaB5LbhVq4
         zxMuFJNE3rgIZ7TtTkYC86F+8KIDwWK8WFn2teThsTqP+K5B8S9U6ibZCR8xUmugYfAB
         M89Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0+E2c2UkEbCtnM7L1qjW7+X5cIcCrFUlpDt07Ah/onEoNSUmoVcifml1JQfAzS8dhjQqRXBZvsF/mMnopsdUK@lists.infradead.org
X-Gm-Message-State: AOJu0YxrplPm5cgHz4NfveGMGhCHYcblR4qXJNcjmQykIQnPx361qEzL
	KghKi6fch99XEiwOTSvBcGfV2PuQXyNeFiGsafNIjx9FOi2B91kTwPZgIfyadH8=
X-Gm-Gg: ASbGncsFp5MLEQ4kybRvGKvsDYIdJ/qdjc5YlXdm1x0Wwsbu8Z1O7hx3GHfSWbV29hI
	sY9FgjibragpD3UmnF9cKLcheZcOiZVMrL1D8HxSMSjo0eSpRIV45MvvoqJefus5oMsKHgip0Y6
	2k94ZATxfczGVYporpaXZxS6aN8yIAp2tYBxvFdGSLmNjEZpQ3NPpkFrjGiyyaAfN4wkkKGLZt4
	EyJIYPmtiGs9F5TQt0IS/JFBS2tUSX9q49DWobCrRZbxezAyGR0fYggEx1q
X-Google-Smtp-Source: AGHT+IEzYCyDPtmZet9IESJnJcczVG0Tz2UFufCK02FKKCMdlBUnSYYfqsvJZPILRHP2VNY2oh9nIA==
X-Received: by 2002:a05:600c:3b91:b0:434:a802:e9b2 with SMTP id 5b1f17b1804b1-436e2696d2amr29002085e9.4.1736352950886;
        Wed, 08 Jan 2025 08:15:50 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:50 -0800 (PST)
From: amergnat@baylibre.com
Date: Wed, 08 Jan 2025 17:15:45 +0100
Subject: [PATCH v5 3/7] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-3-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wfidoNqLEIpqSK6RG2PAlzWtAyJfTIKDPdldVFKf2ag=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSye5kt3J6GYi+bZ8GcSkKlLUWKEFFC6cY1vbKW
 7FFURcmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURdA4D/
 9fiHHB6Wig9ZucEqwujLgch53Y1WqqZBYFfo6+SJTqGQsJJxWsrL06N+Xh2s0Eih4DivhcJD3H3w5E
 vhNiI6SW4lRDX6kTOTkriOjx+f5tsRIBynsVgNOz5fC/roAhy7ImU0A62IX++/X21xaHz9ap56xPDn
 eZgWAgqHrQQlfWbUkOU0C+nl/x7y4a8FPt5WR4zoL5YS+BbNIYycp6+zDrDIbd6DGzGwY6jwY6muVW
 +9OGsqqZ5JPf/dTVMdmzckiZBEwNQ+h6vTaWAgecDiVrYwo9/WwNKKkwUXxFyytLulD7OsT/hrVCGk
 fsAymQJIqWOvIb0W4zQq9hsyQ0AFHW8Ysftb5WoP1ZUbSjRj9MKd7TFqt9m7KNCIyJK5JHkwPvX5gV
 aOOP7KpQmGphVNvHCZyFbqCMZIU+n5wplNAIhO9hVJs65K5ZCWm6vgVASULRYPfiBPUznGAUaKH/t0
 Cri9iX59+4+6nwmIu4pht4zfuyzuwclMd6LPPKx7J+KXJ3hn07Hl1Ov8656J6xqeoF/eNbQTI4gaX1
 Hj3jlTXUX0K9HOeHj8S3RrB/0BBBewC2bx1dmfa8nZErOgUxLsTnuh7y72F5rbVCmrPcZv3vsFsbJ2
 ySpGwkBYjXPGRZZV2QY37k73SRPyon4NdLo/fiuBV9NcOy34ce0V4vezotuw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081552_355664_F5A973F8 
X-CRM114-Status: GOOD (  11.81  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0829ceb9967c..5471ef744cc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1


