Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD070CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/p2mNp4gNAgGCW3IMGenGM2K7t6SvD8ichbCMBxhLHs=; b=XZ9DDxdI7QOFk6Gp7GlVOGw7hU
	C67r3jhyOLkAepAUrbTvL6ccD+MnU7rOneOsDzwW9HzW8XDVm0U8Gdzoi8ygcqp8Zccho8IoFKmMD
	SANXs9CZQPG//uMNrFaK747IGpYJ1cPX2Ad5e62+en5yqzWQlQ1lCDi9Loe4L9Zj9EJh5A2NTQLAL
	sVCKspak+XvLsj6eZMkccWsq/i34Q4/w5a4kYrUdmS+kr42DESZu27x4ngJFPXTTPmHSE5O6i6+XH
	8cEn8bXBT4LSWB7cRBIu1g4M+cytpWxRF551n9jFHTJTVsbRS0Njvtu9npeH0132ukkSz9uRH8xsL
	pObkMsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTDm-0000000Cu3c-3T2m;
	Wed, 05 Nov 2025 02:26:02 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTDj-0000000Cu3A-1Os7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/p
	2mNp4gNAgGCW3IMGenGM2K7t6SvD8ichbCMBxhLHs=; b=DgtSb4ROT+7ZTf/2Kw
	jBA/cNT0xndd6kmGtsY/9Y6GoESOOBLBIVJev0UhoQs26x93eJg7bIpJzu2PC/4L
	YaxB9paFN3809Q93RC9j4ucM85eVXagvt9rvLfrysoHBjoKhqlvvRsb10u4Bt0SW
	nTLyDpVrNcK/neROxwzkH2UIw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDH3_GYtQppMrN8BQ--.117S2;
	Wed, 05 Nov 2025 10:25:31 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Fix pop noise on conexant codec
Date: Wed,  5 Nov 2025 10:25:26 +0800
Message-Id: <20251105022527.69770-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDH3_GYtQppMrN8BQ--.117S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr18KF45Gr1xAF4kGFykXwb_yoW5tFyUpr
	15Ga43GrZ3JF1I9r4fJr4fA3WYkFykWFsxJ34ft3W3Jw43Kry7Wa1jqFyI9F1fJrW7Kry2
	vF42vrWUKrW5JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0JPtUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBtwv2kKtZvLrgAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_182559_763640_7AE49614 
X-CRM114-Status: GOOD (  12.37  )
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

From: wangdicheng <wangdich9700@163.com>

Pop noise mitigation: When headphones are unplugged during playback,mute
speaker DAC(0x17)immediately and restore after 20ms delay to avoid
audible popping.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..2c16d1930a75 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,9 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	struct hda_codec *conexant_codec;
+	struct delayed_work change_pinctl_work;
 };
 
 
@@ -216,6 +219,63 @@ static void cx_remove(struct hda_codec *codec)
 	snd_hda_gen_remove(codec);
 }
 
+static void mute_unmute_speaker(struct hda_codec *codec, hda_nid_t nid, bool mute)
+{
+	unsigned int conn_sel, dac, conn_list, gain_left, gain_right;
+
+	conn_sel = snd_hda_codec_read(codec, nid, 0, 0xf01, 0x0);
+	conn_list = snd_hda_codec_read(codec, nid, 0, 0xf02, 0x0);
+
+	dac = ((conn_list >> (conn_sel * 8)) & 0xff);
+	if (dac == 0)
+		return;
+
+	gain_left = snd_hda_codec_read(codec, dac, 0, 0xba0, 0x0);
+	gain_right = snd_hda_codec_read(codec, dac, 0, 0xb80, 0x0);
+
+	if (mute) {
+		gain_left |= 0x80;
+		gain_right |= 0x80;
+	} else {
+		gain_left &= (~(0x80));
+		gain_right &= (~(0x80));
+	}
+
+	snd_hda_codec_write(codec, dac, 0, 0x3a0, gain_left);
+	snd_hda_codec_write(codec, dac, 0, 0x390, gain_right);
+
+	if (mute) {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0);
+		codec_dbg(codec, "mute_speaker, set 0x%x  PinCtrl to 0.\n", nid);
+	} else {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
+		codec_dbg(codec, "unmute_speaker, set 0x%x  PinCtrl to 0x40.\n", nid);
+	}
+}
+
+static void change_pinctl_worker(struct work_struct *work)
+{
+	struct hda_codec *codec;
+	struct conexant_spec *spec;
+
+	spec = container_of(work, struct conexant_spec, change_pinctl_work.work);
+	codec = spec->conexant_codec;
+
+	return mute_unmute_speaker(codec, 0x17, false);
+}
+
+static void cx_auto_mute_unmute_speaker(struct hda_codec *codec, struct hda_jack_callback *event)
+{
+	struct conexant_spec *spec = codec->spec;
+	int phone_present;
+
+	phone_present = snd_hda_codec_read(codec, 0x16, 0, 0xf09, 0x0);
+	if (!(phone_present & 0x80000000)) {
+		mute_unmute_speaker(codec, 0x17, true);
+		schedule_delayed_work(&spec->change_pinctl_work, 20);
+	}
+}
+
 static void cx_process_headset_plugin(struct hda_codec *codec)
 {
 	unsigned int val;
@@ -1178,6 +1238,10 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
 		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&spec->change_pinctl_work, change_pinctl_worker);
+	spec->conexant_codec = codec;
+
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
 
@@ -1187,6 +1251,7 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_mute_unmute_speaker);
 		break;
 	}
 
-- 
2.25.1


