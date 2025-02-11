Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F74DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=; b=jJJMKU7iqaK4xHi3xr4HRUt0DJ
	NpzQVSYIv7BvKivTcXQhOv0y0dtuOaLj0Mjl1NevlRsCE5qrNHQlaFMzrvwgzn8BxzlHDvR+DZCR+
	83G8bqdzPyIShz/AJD7D7JcsRvKJq0f+Aqhp5urWpk5UBtTHmVAvlVcsZcXqbX9BCSkZN9oD5mXyn
	/dUXh2Hs5SZsi31lDL5+UkGX0+7r7WdO/LPQRx59yeg/xVSHG5iApbV/0K5VS8QA3zpEK/evpkLc1
	dw4zR5NlwCgtUwInbEIq2NVV8FVC03D2UL5m19EFpQOjy1CQhhT1E0B9gOjcNRP7vBp+Yjo560EnZ
	R1sZiYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHb-00000004iH8-16o6;
	Tue, 11 Feb 2025 17:42:51 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3j-00000004fx3-2kmB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:32 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3055047f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294910; x=1739899710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
        b=Vf6708KxMBuOYhp4MzlCvuFAAvfmx6Hl1lyakOEneefJf81zUM69HxoQDyEkqrdokY
         hC9upITaqcN5gRM7+mFYyYbqLrmtFoc0A74Xn4gELiTVIOdmi9V0pwEBZT4PrKAMBdUv
         c0E2kRh6bbRf8Q4dH6zlWv7XYjELx+eEQc3CS1yKvkZJgC7CpuOdsupw4bX3XoSlmrDC
         gWqwFlv212qe5JQeLH9HM98XglcaYKoAHiZlfcV3roK1H/b1mVZfqelQ5KzoD+Na2JZA
         kG5KpZphiWHA3Ayd22fdE4cdvVd+veHgMF+D9GsYD9+paqmZ9I+O/pS7SuyYvYjLxYAv
         RtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294910; x=1739899710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
        b=Q16pke0jiAMVLtkKK22FcSCCKTMpDCCb+a2QZdVTRBWCM1L3bE80bIZvvLY4m0XI/X
         Ngjk9ErsPqul0Pran+1yogprgQjOOkpMi4NIRvz7b1S6FvuVOhD0dyt4VEEykLpM3GJv
         lLskB+dcw3LUGUaglXbXEpDobU7q7dPsjzy9Srfl6XPREasLh7pbiB1HMDTdhGLYEQVI
         57S87leyoD+v1U6uoOLHdJZhJB8CzhrwnRQUyvJyFPMtfwa23WbFyli7eEQK9b797sSp
         Wqj1jRlJcqSAA0/7H1LAFharhnii6sjsUlm2B1USGm6BLM2rtbdf3jFgXH5odSjF2tf9
         mIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhX5rBhza2VImw6QsvsRXQtgxpjocjeagDrFxU3k44zZ6fqvfrUi9/+hExyKgBPcwOR5pmlFJjxpWb5/WS4MOo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8rlu8BAzQ/eODIA/zLPdttJAiaZpK/7L0jzADPIUduFeF/NDh
	Ev6bufVkDKexOH0o+Fm/3jrmuXLtBturcJ4mWI0H0mOv/MNIP/AwK8WgSg7WxHE=
X-Gm-Gg: ASbGnctosggcnM67I4aBbvB9/DUr+psnp3/vjNuPX9p+B9HCcsDbVAVN4XozjvTp4Qs
	e5+WpNJKpd72hiAa3sDrlNLmHxqBHbqk8ShEw0GibEeuALCSWGxO+juac8a5g0tW7dlYDSHHFTG
	Oie82DzQ94SybX2U+aAhS8ij+0Cb1f4sp+g3PXl9nRcz6J3bH9PL2/91cqYhwItP3v0MQnKChYl
	5S0GyVfMJxE67mzjMJ0b822LRlgigowni366iUOVhsJRv0K21QrVFs0rf9dqdLiaK3GDU01LQBG
	+ia3+vPviIwEhGDgFQ==
X-Google-Smtp-Source: AGHT+IHqQL8DP1JxgbD5VCseSPJliBuud4+TKe0/7TKQBN2dXAAu4cWiVWufhhODSvakeasxOn/B7w==
X-Received: by 2002:a5d:6c66:0:b0:38a:418e:1177 with SMTP id ffacd0b85a97d-38dc8d9202dmr13638587f8f.11.1739294909768;
        Tue, 11 Feb 2025 09:28:29 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:27:59 +0100
Message-ID: <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JaT81TlS5JMrK8kOZ5IZdpgPZCU4QD/jFNP5Hu5Ari0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2b7ztdhzPOxtPtSHwTFX2Q+o4rv+DEa9t5
 h6A3WVIiOaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hfOYD/99mpDDUk+53d/ZanCMbwJ18FpyC1UiheDU5tolp1TjYQ6xJZCD+FUPxTFT7MftJJcmhYU
 ppgXsxWu0vXkLiqwtls3vqypBiQP+/Br9Qd5XQWkcZy/dc3ZG2zA3FYPdrfq+GhBMRIkGuLuHTL
 o7EuhQ8gx6YcEgqWCA6gSH/AN/YL2kOG6F+B5JEBMrI37awyyaz1Rygwhyl0qItpoUOWJamW9JV
 wIpocIeEtV+MlTG1Kbg1WF84EI6JwAjfM5JOZjn65GDvReg9Ar7nhjkfw9C+PcnPZH0HZyY/RsO
 2nb7YpQYtDrCuTOtHOVSR7fA8CD/QL0C/aSz1PBFOUFaQHD5znSEvuNqIZ9MPROPDFGwWQTygho
 2baf6O6czt8zk+qqtahPDzlgKfvfXO6FmH4Hb1xyCFSAyBR2DoZV+W2xJP1brfagyAH+hw0+twD
 635z1DYFdgPAGxz2iXJxZK24JpVoR9CrB33x3a2TEwdc/KaNUt7ax6Lt2f81O587Z+7O8L6/JP4
 XoAxgdGRTcmsl4S9zAEnByChdEI4wOcGAX/bdK2ZG0vy8N1L3IoKJnpRT+bFUN4v+dlR2ppl9wt
 u0Jd4hipB0voUxKyhN6Eu4LjGycuGC96lmkrjExZld1DdDEdciaO1sLFUKFZ592SZ9dz1emyXb5 8Aak+H6IrmLmDhg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092831_699880_13F538F0 
X-CRM114-Status: GOOD (  13.68  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 52 +++-------------------------------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fdaa9e50ffac17c908 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base, 666u);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
-
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.45.2


