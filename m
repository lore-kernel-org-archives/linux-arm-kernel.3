Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCC8CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aVDwHrxGFuNY1rBlhB0rlGAAc2KJ50mMfxHrdnVpszk=; b=tjxVKvpxYdae7guUo8/L63OvhX
	MJ860/ta2JZ6uY5P/1pBJLBk4ftShiiWp+XDxteeoFqIOwKhYPD0zC8kXag8BrTd8XtfpstuBBuh1
	Vh5Abgq6lXi4BtIhUCbbRwhETigw+lRH2ogN54MaQD+Yu7JKJ2wmqR2UFbZ4RFbfFMK5XsAn5sPPS
	VsxN4HzowvF9EUJ6Nf4R1nn9bxXx17s+bEM/5Z/zra8RYnaukknsAW4QICAPHNded0NgGJu974lob
	tmbxYbTJWWZUbKeY5vD1kRoW1MN9kN2vR3bppcoZacBZxJ/rDw4K6E1O6oNq/0CDsKWEZyC9vbnU5
	v5OBhPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGagK-0000000ChcQ-3WI9;
	Tue, 13 Oct 2026 11:28:33 +0000
Received: from mail-gw01.astralinux.ru ([37.230.196.243])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGagF-0000000Chb9-0pLG;
	Tue, 13 Oct 2026 11:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1791890891;
	bh=dEHHHrPNOOAJJTJA9eGfVi5bhR+iD92nK9o8n40N0oU=;
	h=From:To:Cc:Subject:Date:From;
	b=OwQlillw+u190RBOJivvOFNF6tQDwA9T0ewjmsMgSbUU6yedlsYnJxpH44ueiMzRg
	 FCpZsBkvIawd7MrdE3A5wHzD9TCzJZ4XGIumBEH1KMD2lqv9/xJMC9mnCNfw8VFckh
	 mUciXDxqVSeOKrrTyTb+E0wHpwLzopo32yW/VlfHsVAB5k6QMTbCkXLPvT08ik2PW7
	 O4B4fL/yDHyUPM1QvdrenRuxFBO3QG1G3IZMypYfxGY2lUy/0Hp5DXgiUCxm6ROa2/
	 Y91ZvavA8n/xwM++2fjbL7iYzTqOLPFjGaWb89V4Nr7Xs14zAt0zdLqQd/4zgPjkqo
	 +p2jqKeN/mRkg==
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id A483D24AD4;
	Tue, 13 Oct 2026 14:28:11 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Tue, 13 Oct 2026 14:28:09 +0300 (MSK)
Received: from DESKTOP-D46TNHI (unknown [10.198.27.112])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4j3sVc5mWXz18X5;
	Tue, 13 Oct 2026 14:26:48 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	HyeongJun An <sammiee5311@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10/5.15] ASoC: meson: aiu: Validate written enum values
Date: Tue, 13 Oct 2026 14:26:23 +0300
Message-ID: <20261013112625.1126-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2026/10/13 10:37:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 127 0.3.127 0884f7b061fa529b810563f359267cd65d2ec05c, {Tracking_one_susp_tld}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;127.0.0.199:7.1.2;patch.msgid.link:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 206631 [Oct 13 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.27
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/10/13 04:56:00 #28679670
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2026/10/13 10:37:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_042827_769055_B11BD19E 
X-CRM114-Status: GOOD (  10.06  )
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

From: HyeongJun An <sammiee5311@gmail.com>

commit d65adf85477247be04ac86886f8edfaa047b5d4a upstream.

The AIU HDMI and internal codec mux put callbacks use the written enum
value with snd_soc_enum_item_to_val() before checking whether the value is
valid for the enumeration.

Reject out-of-range values before converting the enum item, matching the
validation already done by the G12A HDMI and internal codec mux controls.

Fixes: b82b734c0e9a ("ASoC: meson: aiu: add hdmi codec control support")
Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Link: https://patch.msgid.link/20260609124317.38046-3-sammiee5311@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
Backport fix for CVE-2026-74294
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 442c215936d9..4620a87edaea 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -38,6 +38,9 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DIN_LRCLK_SRC,
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index c966fc60dc73..21a37511b6f9 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -30,6 +30,9 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DATA_SEL,
-- 
2.47.3

