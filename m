Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B68CF259E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xTZUfdXiXDB7PJUy11HvFsp18IC0StlAD3bOi0um3Ok=; b=I3uyymk9oU0n1wDIufdTKFF1Vn
	sJvO4tH9cto3kuBFSuYmXMBKF5I6pty4B27fv9yC04hmjIhEAYgL6MpvkzFK4r6n6WVf55LBcW+/C
	fjBM0vRm73YF2N2wZUuMThYstG7nYmiga5HU1XBkwqzmNpyKSq9UV1DpxoGok0WdRnYDl/iFftBtR
	/k8rGzm94t158soaUd78OtCHSpQ/E9MU4L5RbolkHLCaEOAtj51nwgMshuQFf5sxylPbAX/TM8Fol
	kpdKnzaVFp7CY74AWZqgcqv4B3IBocph5yxg8uMYbI1/nqbJQHkh9Lszvk+RX20Shiwrt/iIHOdWG
	56oEuw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdxH-00000002p90-3j4E;
	Wed, 19 Nov 2025 08:54:23 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdxE-00000002p81-44Mc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xT
	ZUfdXiXDB7PJUy11HvFsp18IC0StlAD3bOi0um3Ok=; b=PxjAUinlp5n/581X00
	+zMeGZwd6VqqvriZ7UKrBsaK3ANxAwal/ylQObWKZDvKpQV9uttnnWrTyGXjjCtS
	EgYTHpr6n4KtD/bD59ERJMpaPrNxDsc5au8Amo4InSem8NG6m7jdAdZo9GLvRhYt
	SJ928i5Zkrr52x4Ks0Pk2caPw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXbmybhR1pNONgBA--.31S2;
	Wed, 19 Nov 2025 16:53:49 +0800 (CST)
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
Subject: [PATCH V2] ALSA: hda/conexant: Implement resume function
Date: Wed, 19 Nov 2025 16:53:45 +0800
Message-Id: <20251119085345.141850-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXbmybhR1pNONgBA--.31S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1kAry7WFy7Jr4xZw4UXFb_yoW8Gr4xpr
	1vka4rG3Z7ta1IyF4xKw4Yg3Z8CayrCFW3J3y5K34ayan0gr1vg3WSqry7Xa48KrZ0kF1a
	qFy2v3yDAFW5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBxRgUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwB0qeWkdhZ1T2gAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_005421_394385_A3650EED 
X-CRM114-Status: UNSURE (   9.53  )
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

v1->v2:
Problem: No audio output device after S3.
Cause: The audio driver misses re-initialization upon resume,
resulting in stale jack status (remaining in the pre-sleep state),
which prevents the system from finding the correct output device.

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


