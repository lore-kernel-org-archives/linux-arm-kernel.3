Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 03:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsqQmWamYIYco22fUSPqUsEq0HJ6AU5htrVCYU+nqmE=; b=enpB2hzwQe15fZZoFLWZfSRb1T
	BwFNgJfX+ceGgah5I8foBck00BsNSp/yR5/ZYZfqOtdXZv+84baHYrIorp78U0kRZyJw57vP5ksxL
	flWPJFxAYU676UxqVdcxEqsvft0if645zwyXxakK6J46bO8xLBD5XQ33deOLjBsRbwBt+qJYuv/fV
	WM/9U6kdjX2p1BcVjZXHCirS3fOQbhIaNxagvgHV2xTGNk13OMsDnDnvP02UZbKqN3o9YqpcePXPl
	q+FWQl3P2bIiB98gFdYidVRTiHTl4ip3MMo1Y1LgBQlLXI7tyWnXUYWq3e7LhlxLJpUPRvwxBiVJT
	naRMpGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilZ5-00000009XSb-19CN;
	Mon, 04 Aug 2025 03:08:43 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilWV-00000009XE4-1Eqq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 03:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ys
	qQmWamYIYco22fUSPqUsEq0HJ6AU5htrVCYU+nqmE=; b=V7JUQ43v2It6MWY9oK
	7cPQOitHNMn/Bmbm0xRNn4pPkgBgAR6rxWPWE0HaaOPt4jJZjCKFcKKV2WEmd0XS
	Tl2Talb1JlOkjlM+0Mer0VDVSWCrVV1xEEs5gsMgVFRU4SlZE7GDRuFT8HdljgSh
	Xst/KdJA+5ZnV0dJJ2vYmHjLs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBHOs5_I5BoPnvzJQ--.25158S2;
	Mon, 04 Aug 2025 11:05:39 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Accelerate the front MIC charging and discharging of the 897 codec
Date: Mon,  4 Aug 2025 11:05:17 +0800
Message-Id: <20250804030518.424229-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHOs5_I5BoPnvzJQ--.25158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF13Xry8XFW8uw1DWry8Xwb_yoW8JFWfpr
	WrCFy3XFs3Xr4jyw48tr4fua4kGa45ZrW3C3yYk3W7XrsxuryktFyrG342v3W7KFWYkr1j
	qr1Fy34kJ3y5Kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZ6pQUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibgSfT2iQGr-xBwAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_200603_760260_16F07200 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

The front MIC capacitance of the Inspur board is too large, resulting in a longer charging and discharging time required,
which in turn prevents recording for 5 seconds before startup.
Therefore, software is used to increase the delay by 2 seconds to avoid this issue.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 877137cb09ac..88675eae9447 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1001,6 +1001,14 @@ static int alc_resume(struct hda_codec *codec)
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
 	codec->patch_ops.init(codec);
+
+	if (codec->core.subsystem_id == 0x10ec1304) {
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x04);
+		msleep(50);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x44);
+		msleep(2000);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREF80);
+	}
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 	return 0;
-- 
2.25.1


