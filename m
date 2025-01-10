Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D435E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATDsjAK0uKMKhFaAu8bbQjJc2CPGx/RtQGrifkWV5pE=; b=NclkBIQpUHlQGPFN52Rr4o7495
	udXPphqqRDJL6e7b9T5P7MULnmlsMOUIvwLhZ9TGW4/noOHZUpHLmkV6tV2OLnJEri7CyzEoIoaRl
	yA4YMZRSrjXBEZZQ4YuV4Jb7lLXLNdwfIBEVwStrP+eyxTzIPFdkNR8GYX9zKSmRIGgklqs298/gv
	gJrwWH7HyQSpG2nlTWEKUuFjuf8vn7zxJnzhWZkT1lsiXUDVrQGKWdcObYfBtMBVhATCw+XNUc5hJ
	vyYcE/jqOfqaoUmm9ehXUXTdT9y7sDwZG+oTACcwRP/cTWmM8QGHAZyHiqh6S4toOfn0RGeiYeAJI
	b7pq7/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9k0-0000000EQte-15Bo;
	Fri, 10 Jan 2025 07:47:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9hc-0000000EQ9k-3oCy;
	Fri, 10 Jan 2025 07:45:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso13281525e9.0;
        Thu, 09 Jan 2025 23:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736495107; x=1737099907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATDsjAK0uKMKhFaAu8bbQjJc2CPGx/RtQGrifkWV5pE=;
        b=i06yVC2OJQiP0u7MpGyfycAXBV2EPgONQ/CPypieXlSa8/jbRnrt4DWK0HV+JkNhZE
         ZnN2g0lOZLJDXU3RrhvlGrSbQaMvzYXpB9l0dVCt3hyw/Vr2ibkng4ttPzl5rlJxXX1x
         vkBMNJ6fBl0hSP4fPlirlcSDYqRBVbPSKqtMSxyNWKGob/EHKlyEOSGTYimDkLepJzBE
         YXG4s/qobZBPBQ+OxcDjKP5HV9cCTC0156HWGtZTsLt1MBXIw7lDICxYVvQN54qXCx8p
         WwcW2LQ0yV7m3WuadS1So54w8MqQouuHKvl1OZXTfYLwNhQDODzeB83pudyMeauhOZLE
         IOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736495107; x=1737099907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATDsjAK0uKMKhFaAu8bbQjJc2CPGx/RtQGrifkWV5pE=;
        b=r1vDWBRi+O1n3pyJyo8/iQk8w+p1G0WMj+LGc+tV9Zjtkptt5IhHf69sxkG1PdWZHa
         6R0yeXaCQGzrcV7Bgl7I9TS1ecMbipjO5HkLRKrIlrN6sb3VXjGjG3OXNETxpV91NWsg
         v+I+HOcGWiPk9xGr/s6x3Ppamu2mg8bW/zVNXOG3u40oezh2s1AeZNs6mcDKyusv9SH0
         QsbGFxb+NVZqMDZ0nR5tLxx/Hg3AjCfPTYz/eCxflcT7SMFsc3hJIJlsAxGVEQKhv1R/
         XmWL39KAxi/wcLNzzkgANiEpSNwoVykFpuFjOaHCv5pYWFP858Qr6kgOZzieEf3LCdJw
         el9g==
X-Forwarded-Encrypted: i=1; AJvYcCUaYli+8JMgUBkdv3+BHibNxriGQfTIwvvuWZGlVE4Vug5mYcNgci41j49Puc1XLYPZC/TPmrVEiyJJVeYVtF52iA==@lists.infradead.org, AJvYcCW5Hu+3hBafY7hBArRfu/KEVpiXo1Sz8GmzIQ0xFGaE9eqDgZUxqjcW1BcxW1yHvm4vRfTSOAOIE+nTFyzf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs9uGckzR2G7GvRq4sNzQDrwN8G6BoHFD3LJ5ctladtSsd+BH3
	FmDVx8Mq9HYofN2lW0MWFfrqgG/9ER7iFOCulbiTNsUaIC+goLZV
X-Gm-Gg: ASbGnctNrXgtAcn9DSx/ZJUHRPiBlQKA8uRbfAdXbm07x2pfbgGkbXzD86MTRlXJcq5
	01vh/P5oRQt1nsVDIQlqEa7ldFFWDNxEavUZTbsg10ua+PhyAsWk8Kgv/QcsP7ZdzHKYcMVXkBQ
	4M+nAO6UZRm2YJmreKUsJX7eqVtPXcEi8o17Y07qEKFBkCHqnV/gLnNJGk8Zi9vKMkxtqRdD2XB
	yTuk6ZuLqX9yh9ZLWaTJ5MdvIp909YEJCOMrJZT0y7hEqEno05VZ6Nfy3RO3g==
X-Google-Smtp-Source: AGHT+IGb+vzb8Pe/v6kmaLVgm8KOUcAV6AU7z/JagMZlqc8SrieF7wsh7dlW2Vj7FxtpiiwFRDJhZQ==
X-Received: by 2002:a05:600c:3c85:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-436e267821emr85597015e9.4.1736495106968;
        Thu, 09 Jan 2025 23:45:06 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 23:45:06 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
Date: Fri, 10 Jan 2025 07:44:57 +0000
Message-Id: <20250110074458.3624094-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_234508_945774_AE789819 
X-CRM114-Status: GOOD (  11.67  )
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

This reverts commit bfbc68e4d8695497f858a45a142665e22a512ea3.

The patch does permit the offending YUV420 @ 59.94 phy_freq and
vclk_freq mode to match in calculations. It also results in all
fractional rates being unavailable for use. This was unintended
and requires the patch to be reverted.

Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..2a82119eb58e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
+				 FREQ_1000_1001(params[i].phy_freq/10)*10);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1


