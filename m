Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gbTl8SVcFIrhh7H7q4afRNJrfLQj4XvQ6GtKsnG8hHA=; b=xHJP0e2XIfUjGix/buwdacINNL
	zO4BVhGZ656MvwNu4GFqRBxFuArKM2CbTZcD9HCmcoYhm3d51Po0e05/MXSoKO5S7TPRPv9pZi09h
	0noH6WfwdyT0OB30rCSjSpfhQX0smYtzZaClDYXQ5ZmMG23mgZ10/3LCheRxrThXTACqoTaLdWuaG
	5Je1ZRJSmJpNTQCMLv5fs01PCro6NAw5OQRjVC6U9ZNFjSki7EcLSurnSDrrewVIjnT1dwsNFpqQV
	Wt5kBt3ZsYT8Me/G6l/D9rGFpk7e+ssbRF0qkVOzha+hluUMKntHYDuEGriGyHOEByIMt7Brh+SYU
	3YDnf2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMG8-00000004tRK-1V70;
	Mon, 10 Nov 2025 07:24:16 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMG5-00000004tQq-0xgr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 07:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gb
	Tl8SVcFIrhh7H7q4afRNJrfLQj4XvQ6GtKsnG8hHA=; b=U0oF0TZyztsSN/u7W+
	vYxistieOrd8omEbHfJM6OEIsdAyGpFL0zQ1LjhWoCl2e2YnrivDA50DWjxZqAhX
	/MxQV00uQVFdUGFvklOtSjv8eatCGWmMAnP8/tSWZMNXpdqWZj6Sc85UFlFVbb73
	UGyeMsg9eTHE2YssVSMns8i30=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAXEGwGkxFpvtzsCQ--.243S2;
	Mon, 10 Nov 2025 15:23:53 +0800 (CST)
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
Subject: [PATCH] ALSA: hda/realtek: Fix resource cleanup in alc_alloc_spec error path
Date: Mon, 10 Nov 2025 15:23:49 +0800
Message-Id: <20251110072349.102169-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXEGwGkxFpvtzsCQ--.243S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1fCw1kCw4Utw4ktr48tFb_yoW8WrWrpr
	4Sg34rGasxGFy0yw1fJ3W7Za4rGa48WF4UWw1Yy3WfArnYqr4kJF1UuryjgF1xCrZ09ayY
	qr1Sq3y0k3y5Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0LvtUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiRwkAT2kO8407RgABsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_232413_646734_E8C5B885 
X-CRM114-Status: GOOD (  11.47  )
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

Ensure proper resource cleanup when alc_codec_rename_from_preset() fails
in alc_alloc_spec(). Currently, the error path only calls kfree(spec) but
does not:

1. Destroy the initialized coef_mutex mutex
2. Reset codec->spec to NULL, potentially leaving a dangling pointer

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/realtek/realtek.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index ca377a5adadb..9a358c072e50 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -1029,6 +1029,7 @@ int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 {
 	struct alc_spec *spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	int err;
+	bool mutex_initialized = false;
 
 	if (!spec)
 		return -ENOMEM;
@@ -1040,14 +1041,22 @@ int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 	/* FIXME: do we need this for all Realtek codec models? */
 	codec->spdif_status_reset = 1;
 	codec->forced_resume = 1;
+
 	mutex_init(&spec->coef_mutex);
 
 	err = alc_codec_rename_from_preset(codec);
 	if (err < 0) {
-		kfree(spec);
-		return err;
+		codec_err(codec, "Failed to rename codec: %d\n", err);
+		goto error;
 	}
 	return 0;
+
+error:
+	if (mutex_initialized)
+		mutex_destroy(&spec->coef_mutex);
+	codec->spec = NULL;
+	kfree(spec);
+	return err;
 }
 EXPORT_SYMBOL_NS_GPL(alc_alloc_spec, "SND_HDA_CODEC_REALTEK");
 
-- 
2.25.1


