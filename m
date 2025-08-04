Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 03:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uajuGA4O8ZmH1OAMXAjwo6x5Mp+YdmlXiyesPEcWhs=; b=no9aDekshUNhC12QXTQAgFYdBi
	aeEVeAk7Hb0bqui7wKlzZgenzgNhk3kvhpKaXwJJP5My3G9oHVNsBkve5nKkcB6Fo2z+K5Ax7Pre2
	9p9qUEzEbneJCaG5VzhZnCeUbEwIVQlrEY/yck/ph7aLqty0UnuB3USM+5X2f7nyGs0CVQukYz//x
	pOnAWdzeGxoTSrAolske0molr30cNJqGr4czOPD06EnvPgwh2kg2sWXQQ/L0dOev+BOXmlU+7GSXe
	ASlgF4rbfY9L17FQLIYzbIMxB8XkohziWpenpaPRzyXq49litSz53Amq3oT32wBC5+lfW02Hm/tXz
	BfKU62bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilbc-00000009Xep-06nm;
	Mon, 04 Aug 2025 03:11:20 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilWd-00000009XEX-1C8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 03:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5u
	ajuGA4O8ZmH1OAMXAjwo6x5Mp+YdmlXiyesPEcWhs=; b=DL2H5VV+94vSCReGJz
	AJEnHd0lalLN2Dn7kWqFuFOYXCUJSL8FY8k0u8uAVJLeefhgmvjJMXlhCUQcfCje
	rbmex0irmeYWK25KNYORDtXQh33+PAQVpEEq1oFsvWOZTF9j4X80Tv60BcPcQ8j4
	tiWZKlTCPLUVtHJ4ymWCVEjV0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBHOs5_I5BoPnvzJQ--.25158S3;
	Mon, 04 Aug 2025 11:05:44 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Fix ALC662 codec pop noise on recording
Date: Mon,  4 Aug 2025 11:05:18 +0800
Message-Id: <20250804030518.424229-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250804030518.424229-1-wangdich9700@163.com>
References: <20250804030518.424229-1-wangdich9700@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHOs5_I5BoPnvzJQ--.25158S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryfJr1kWry5AF15CFyfZwb_yoW8XrWrpr
	WfCFyfWF47Jryjyw18tw47u3W8Ga48ZrW3C3yYkw1xJrsY93s3KF1fA3srZFW2kFZ0gFWj
	vr1rta4kXrWYkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfeOJUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibgSfT2iQGr-xBwABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_200611_636946_3F078CD4 
X-CRM114-Status: GOOD (  10.38  )
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

From: wangdicheng <wangdicheng@kylinos.cn>

Pop noise originates from unstable mic_vref during power_save transitions.
Remediation: Disable VREF at resume, delay 1000ms before re-enabling to guarantee circuit stabilization pre-capture.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 88675eae9447..665e291dea75 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -997,16 +997,21 @@ static int alc_suspend(struct hda_codec *codec)
 static int alc_resume(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
+	int vref_delay = 0;
 
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
 	codec->patch_ops.init(codec);
 
-	if (codec->core.subsystem_id == 0x10ec1304) {
+	if (codec->core.subsystem_id == 0x10ec1304)
+		vref_delay = 2000;
+	else if (codec->core.subsystem_id == 0x1b505809)
+		vref_delay = 1000;
+	if (vref_delay > 0) {
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x04);
 		msleep(50);
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x44);
-		msleep(2000);
+		msleep(vref_delay);
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREF80);
 	}
 	snd_hda_regmap_sync(codec);
-- 
2.25.1


