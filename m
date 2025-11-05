Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6F5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fyfi61jM2svcV8LogP79yM0QO8FIFwLxqSWXYdFojMQ=; b=hMkCP8p7JfBEQRejtV392VDRpC
	JLA+ThtAi1gRCuITgLyhSeIAQMaM9jfqn6rOhk0VGJG7rTHqndSHpYT7HLC4388BUrkARHoIhPH62
	SWmrzX/4gRj1ECAEOEt23mNS0ER9kPJzrOQmChEK1/rJnIWfL/RVJCbhh242ETpRFxiBOTBqbXR53
	O5eFN8LXwFzs33BEkuCcQsI2VycshZc6ObLBOIm7ezxzYyG4W7iGs/Z405lB5baLMGSYz3RraI/7A
	Gwr45111NF892KyuTc/UEWuYb3kZ/+IA7MVSk26SBEX7STzAd8jGkoKLO3UpOZ+YO6+wYAhDpjVFc
	5oYrMdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSoE-0000000CsYx-2CpW;
	Wed, 05 Nov 2025 01:59:38 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSoC-0000000CsYY-1Rtq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Fy
	fi61jM2svcV8LogP79yM0QO8FIFwLxqSWXYdFojMQ=; b=RG6996gE6cIYRcld1j
	Oc5N692OgZ+R+H88ndUGCw78Cc9u2FPYq35WJ4lZ+UPNq5p5vijJxcWH80PV+JLW
	8s0kk8Sq/EZauahf76L7iq3XZ3P3hhUNwsAwpRi6ZRga6i3V8yjhnmZzDBYS3FLh
	RETk8mkdwanxzFCoPV+axH8dg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDn7w9xrwppK5sjCw--.36001S2;
	Wed, 05 Nov 2025 09:59:14 +0800 (CST)
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
Subject: [PATCH] ALSA: hda/conexant: Fix pop noise on conexant codec
Date: Wed,  5 Nov 2025 09:59:11 +0800
Message-Id: <20251105015911.26309-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDn7w9xrwppK5sjCw--.36001S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4fXFWxZryxKw15Wr1xXwb_yoW5tryDpr
	15Ga43GrZ3JF1I9r4fJr4fA3WrKFykWFsxJw1Sy3W3Jw43Kry7Wa1jqFyI9F1xJrW7Kry2
	vF42vFWUKrW5JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0D7xUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvxPkNGkKr3MNewAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_175936_806398_A0FFBECE 
X-CRM114-Status: GOOD (  12.36  )
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
 sound/hda/codecs/conexant.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..641cb738901d 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,8 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	struct delayed_work change_pinctl_work;
 };
 
 
@@ -216,6 +218,63 @@ static void cx_remove(struct hda_codec *codec)
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
@@ -1178,6 +1237,10 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
 		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&spec->change_pinctl_work, change_pinctl_worker);
+	spec->conexant_codec = codec;
+
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
 
@@ -1187,6 +1250,7 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_mute_unmute_speaker);
 		break;
 	}
 
-- 
2.25.1


