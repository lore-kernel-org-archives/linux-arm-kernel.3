Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B04CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqV83Z6jyR2ex1aXweIWz+uIiWlYmXUgywvYFJHDbYY=; b=I6f4+rRyHe+wTziVIzuws5R2pk
	7kZh5ATRAPU81d6/lp8xuBStwtQiNmmi+PlTr6VtmE5RnsEttCA8IHiz8egCBXhiHac9qR2UQimFo
	3KHOL+FWnScSYCf+/OoqSlaWC8dd9apgHioED03DoJWCa9HL+Dn8yIRa6C3Se90hmcJM68x83o8qs
	5Z4Y/5mh8THEFmcfXQEFS4ni3STiUWUbjoKJe7oSyC4M3yIXDYJb2j/XmKC4cThJHybwRNUPSHR1w
	HohjF90AlLgojdfk299eykwjHRB+FUEZgk9PTRyTMRcg+dxSVGuMveLYIfLPPAjHA69yJ/vWsiERy
	KYK41jpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGq0g-0000000EmbI-3OZB;
	Thu, 06 Nov 2025 02:46:04 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGq0d-0000000EmaO-3gQN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vq
	V83Z6jyR2ex1aXweIWz+uIiWlYmXUgywvYFJHDbYY=; b=a4Ov3bDl94yfakajqC
	oYekMkiBJqaKNELmZVCDjIaReVaP5l4DoJ9YRE9GUx5VgtX750SCpQO4ZpR2f50s
	wizN4UCAM3AeLImggFmwsvKd+gnYLOguNIxwgyHOp0HdOZqkP15TGTMKL2V3RqPB
	+CrxRlFjZU8SPgw8WWt8zjqbI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnb2vHCwxpGdHxBw--.24507S2;
	Thu, 06 Nov 2025 10:45:28 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] [PATCH v3] ALSA: hda/conexant: Fix pop noise on CX11880/SN6140 codecs
Date: Thu,  6 Nov 2025 10:45:21 +0800
Message-Id: <20251106024521.71812-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnb2vHCwxpGdHxBw--.24507S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1fZw43Kr48uF4kCw1UGFg_yoWrCFW8pr
	15Ka43K393JF1Ivr4fJr48Z3WFgF95WFsrJ343t3W3JwsxKry7Wa1jgryxKF1rJryqgFW2
	vF42vryUKr45AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piw0ePUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibgD9T2kMCCtr9wAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_184600_289215_A6F8B84D 
X-CRM114-Status: GOOD (  14.65  )
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

Pop noise mitigation: When headphones are unplugged during playback, mute
speaker DAC (0x17) immediately and restore after 20ms delay to avoid
audible popping. This fix is specifically for CX11880 (0x14f11f86) and
SN6140 (0x14f11f87) codecs based on testing verification.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
V2 -> V3:
- Fixed container_of usage by storing codec pointer in spec structure
- Added cancellation of delayed work when headphone is re-plugged
- Limited the fix to specific device IDs (0x14f11f86, 0x14f11f87) based on testing
- Added proper cleanup in remove function

 sound/hda/codecs/conexant.c | 73 +++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..f2f447ab749e 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,10 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	/* Pop noise mitigation */
+	struct hda_codec *codec;
+	struct delayed_work pop_mitigation_work;
 };
 
 
@@ -212,10 +216,74 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 
 static void cx_remove(struct hda_codec *codec)
 {
+	struct conexant_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->pop_mitigation_work);
 	cx_auto_shutdown(codec);
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
+		codec_dbg(codec, "mute_speaker, set 0x%x PinCtrl to 0.\n", nid);
+	} else {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
+		codec_dbg(codec, "unmute_speaker, set 0x%x PinCtrl to 0x40.\n", nid);
+	}
+}
+
+static void pop_mitigation_worker(struct work_struct *work)
+{
+	struct conexant_spec *spec = container_of(work, struct conexant_spec,
+			pop_mitigation_work.work);
+	struct hda_codec *codec = spec->codec;
+
+	mute_unmute_speaker(codec, 0x17, false);
+}
+
+static void cx_auto_pop_mitigation(struct hda_codec *codec,
+		struct hda_jack_callback *event)
+{
+	struct conexant_spec *spec = codec->spec;
+	int phone_present;
+
+	phone_present = snd_hda_codec_read(codec, 0x16, 0, 0xf09, 0x0);
+	if (!(phone_present & 0x80000000)) {
+		/* Headphone unplugged, mute speaker immediately */
+		mute_unmute_speaker(codec, 0x17, true);
+		/* Schedule unmute after 20ms delay */
+		schedule_delayed_work(&spec->pop_mitigation_work, msecs_to_jiffies(20));
+	} else {
+		/* Headphone plugged in, cancel any pending unmute */
+		cancel_delayed_work_sync(&spec->pop_mitigation_work);
+	}
+}
+
 static void cx_process_headset_plugin(struct hda_codec *codec)
 {
 	unsigned int val;
@@ -1178,6 +1246,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
 		return -ENOMEM;
+
+	spec->codec = codec;
+	INIT_DELAYED_WORK(&spec->pop_mitigation_work, pop_mitigation_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
 
@@ -1187,6 +1258,8 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		/* Enable pop noise mitigation for both codecs */
+		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_pop_mitigation);
 		break;
 	}
 
-- 
2.25.1


