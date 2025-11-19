Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D4CF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M7XLp2eIjfByT8SPnlgh7fwfD6c69I13Q5MqiJNl2mA=; b=nfDDerMIi38vahBVYi+pVTbBVC
	D4V/yTUlYtONzHSFpA31/6DAfl4NM2tdkgEFjNtWK9xSUNuuZ2TkoNrRCVmqZv7Dq1TO1/K7LT5Va
	Gx4+DWcoa/cMTaxsSBE0dX8W4gUzOlqwsBd/1FaTSTxWKz0siUwQQLcrNDQLCNMecFa+lKX+48R3z
	5kj0DGzwnFUsxSE6s+GgXLqJzfLSgIJTp3WBBRpcLZcXFbN+8R1NcyIEMViom8KXMa/EEiK/VNEE9
	m16wYEZib1pJQLzRIPwjJpm5ILhvic7/tMqIj1MSxdtBc+E4J4O6ZalwX+vr5wVkFD4dTjXVgo3rz
	cWONeqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYh-00000002h3n-1tQK;
	Wed, 19 Nov 2025 07:24:55 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYe-00000002h2H-0qeJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=M7
	XLp2eIjfByT8SPnlgh7fwfD6c69I13Q5MqiJNl2mA=; b=YvAwswcmkavbPVtdB/
	lXcIVth1EClDlBMowqpWFrqnAOdTArSmN5Ze62v9G1AW2aX+DRQcp9sIdHiULhX6
	tWIm2Wm49dGjiJljt6yFFb0IyVTSNDHQnXk+fgoACSaGd5pljIBn1V/WSjczP8yj
	TTOzd52sJ7e9aeQhBpEw7Oyw0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHl66icB1pGZ3VBA--.257S2;
	Wed, 19 Nov 2025 15:24:20 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/conexant: Implement resume function
Date: Wed, 19 Nov 2025 15:24:16 +0800
Message-Id: <20251119072416.120937-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHl66icB1pGZ3VBA--.257S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47Gr4kGF4DWF1rurWruFg_yoWkJFg_Gw
	n29rW0yFyDGFsrCr4DJw1Fy34I9rW8uFyjgryktFy2k3s5Gw4Fyr4YvF1Y9rWDWr97AFy5
	ZFnIq347CryUujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbSksJUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwTmNmkdcKQCuQAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232452_622970_555A2945 
X-CRM114-Status: UNSURE (   9.32  )
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

During S3 sleep state, if headphones are unplugged, we need to re-report
their status during the wake phase to ensure proper headphone presence
detection after system resume.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..146ff65ccc30 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -264,6 +264,13 @@ static int cx_suspend(struct hda_codec *codec)
 	return 0;
 }
 
+static int cx_resume(struct hda_codec *codec)
+{
+	cx_init(codec);
+	snd_hda_jack_report_sync(codec);
+	return 0;
+}
+
 /*
  * pin fix-up
  */
@@ -1277,6 +1284,7 @@ static const struct hda_codec_ops cx_codec_ops = {
 	.init = cx_init,
 	.unsol_event = snd_hda_jack_unsol_event,
 	.suspend = cx_suspend,
+	.resume = cx_resume,
 	.check_power_status = snd_hda_gen_check_power_status,
 	.stream_pm = snd_hda_gen_stream_pm,
 };
-- 
2.25.1


