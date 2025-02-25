Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15962C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWRWRMZEMSQfcLMYtLYdaShOnc/DckJ8Wo2cAw6Q2nQ=; b=Ie4dK8hNwCATksc/WGdExKz4nQ
	5YM6iFNmqVHFt0lPOeY0KcJgNSVyCdPBwYClHWKTN2Y79VpipkY/Zh341ovG0uKwnzOW64O9nZrJk
	WXn6Q9HGaUTKIt3wUdMMp9Fxp14LMwN8ykTKkTjzf8uot5s0zUg/PubDlsSAOCxagUnmCJB5mGh/z
	vgt/yuM/2DliHVTd8dqlrs42TVtJ8nzR2tJvJun13ViX6BFfwPGU4K766pyAoOpd99B3M9y8X/KL/
	IEPfnbZpQuO6Pv2YXtzCRm7YCCWVOwWpxtiPphR6cHStWUkDFN/CjT7MO4s2yMim3BRuAteZ98U3a
	y73Kdeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzM-00000000JCQ-3ISG;
	Tue, 25 Feb 2025 16:40:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw1j-0000000HXkM-3qT2;
	Tue, 25 Feb 2025 14:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494114;
	bh=75CPx/W8hj86reRTn/xz1CjoIDFFQn6l8ybKVRcg3Og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kviw7DnX2ELsWI9A1nNID19qHwdc0ciFFQAwgHraUjm47PUm3QxozPxTJkQdEeI+F
	 iGjxWIe3zFUX7eUpbJmULEkgtRgDOxPB53A6hmHREBSiOoyxTkmL3c10IoMH0mZh5Y
	 85H4Aal9N1yNqVLb7KcNpu8ncEexJt7yAlkT8lfBPcCHOg3OvDFRAUv2At5gWtR1r8
	 irTBYrtPpO+Lx/a0GfRrGSsvGo2iSblOMX6QCPrEJxJkDpfvHcJmJ8KHqYMD/mOis5
	 wOTBy1MxlgjK9Ghhhvbm63dHmtyhgbboIMsu2Pqy95e/p/HE/CORyJuVDqdD0sw9ib
	 IV4XPaDjhx8zA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7147517E0DD7;
	Tue, 25 Feb 2025 15:35:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:49 -0300
Subject: [PATCH v2 3/8] ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as
 non-volatile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-3-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063516_104541_21F37D66 
X-CRM114-Status: GOOD (  13.21  )
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

The DMIC_GAINx_CUR registers contain the current (as in present) gain of
each DMIC. During capture, this gain will ramp up until a target value
is reached, and therefore the register is volatile since it is updated
automatically by hardware.

However, after capture the register's value returns to the value that
was written to it. So reading these registers returns the current gain,
and writing configures the initial gain for every capture.

From an audio configuration perspective, reading the instantaneous gain
is not really useful. Instead, reading back the initial gain that was
configured is the desired behavior. For that reason, consider the
DMIC_GAINx_CUR registers as non-volatile, so the regmap's cache can be
used to retrieve the values, rather than requiring pm runtime resuming
the device.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 73e5c63aeec8783905d656af225c42cd95069049..d36520c6272dd8c8302bc3f59da33f82f273f366 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -2855,10 +2855,6 @@ static bool mt8188_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_DMIC3_SRC_DEBUG_MON0:
 	case AFE_DMIC3_UL_SRC_MON0:
 	case AFE_DMIC3_UL_SRC_MON1:
-	case DMIC_GAIN1_CUR:
-	case DMIC_GAIN2_CUR:
-	case DMIC_GAIN3_CUR:
-	case DMIC_GAIN4_CUR:
 	case ETDM_IN1_MONITOR:
 	case ETDM_IN2_MONITOR:
 	case ETDM_OUT1_MONITOR:

-- 
2.48.1


