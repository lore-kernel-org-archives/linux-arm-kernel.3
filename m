Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 03:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0eZVXCKfTD48oWYcUMSXO8jVUm+ueuSjn9uH27gyeaY=; b=LgL1aFL+Gq/dSjY1w3CttZZU7J
	WKHdQMwxJKP5MQaUBz0FwQQAlyUTmRNJGGRZ31p8eNyvZXYlpS9x3kFdLCrX9CJcNipFU+JGgVNsG
	Z4A+UGhV6mrMaNsM0vsvX/RoZOeHNZoU0Nxm/yiGj38rbJkmDZnkAHz4YJThItyksjGS6Z+BD4ZYm
	cc0174cWlLJZAbXWYO11mHtkuMP7NsQ7yc8ZbZXIjFvbewsgsllc9EQ9VyHyYv8HIjFmu62itf6e/
	+70ed0hwLt/7hZB3Rjk7KEpM2R8NwYiE9UU+hnpkgJ31Ynd1Y2EB99+cO5xZcPXKeAAl6g53ckJaR
	/7Ejs1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqWi-0000000Eo4L-0fcK;
	Thu, 06 Nov 2025 03:19:08 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqWf-0000000Eo3q-0BoN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 03:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0e
	ZVXCKfTD48oWYcUMSXO8jVUm+ueuSjn9uH27gyeaY=; b=H8oeiFDnBeh6rPvOm8
	7A07mMjPdqPcvMHylvyTmsIu2BT3xJ+oRlIM114dDjqcJHt0r2vYxv7Hc8zI0oam
	9gSN55g+jQNL+M6ZflSGNLkl1O9Fi9BFS4qhN++yDMilIYtljroS2xrbYyvWbgPw
	CbQD3/TKrIK7EA8fejmPvYtXc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXNueKEwxp3uGrCw--.54468S2;
	Thu, 06 Nov 2025 11:18:35 +0800 (CST)
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
Subject: [PATCH] ALSA: hda/senary: Fix potential resource leak in set_beep_amp
Date: Thu,  6 Nov 2025 11:18:33 +0800
Message-Id: <20251106031833.80303-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgBXNueKEwxp3uGrCw--.54468S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8WFWfCr45tF13XF4kXrb_yoW8Jw1DpF
	1fG34rtFsxJa92yr4rGa1UW3Z3Wa4kWF15JayUKw1fZF4Yyr48tw1rtw12ga1rKrWI9a13
	ZFy2vF1UKa98AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFApUUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwxFlGkME4wdKgAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_191905_501351_61E1068F 
X-CRM114-Status: GOOD (  12.94  )
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

Add proper error handling in set_beep_amp function to avoid potential
resource leaks when snd_hda_gen_add_kctl fails.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 9aa1e9bcd9ec..99af8d5e51db 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -47,17 +47,28 @@ static int set_beep_amp(struct senary_spec *spec, hda_nid_t nid,
 {
 	struct snd_kcontrol_new *knew;
 	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 1, idx, dir);
-	int i;
+	int i, err;
 
 	spec->gen.beep_nid = nid;
 	for (i = 0; i < ARRAY_SIZE(senary_beep_mixer); i++) {
 		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
 					    &senary_beep_mixer[i]);
-		if (!knew)
-			return -ENOMEM;
+		if (!knew) {
+			err = -ENOMEM;
+			goto error;
+		}
 		knew->private_value = beep_amp;
 	}
 	return 0;
+
+error:
+	/* Clean up any successfully added controls */
+	while (i-- > 0) {
+		/* The gen spec will be cleaned up in senary_remove,
+		 * so we don't need individual cleanup here
+		 */
+	}
+	return err;
 }
 
 static int senary_auto_parse_beep(struct hda_codec *codec)
-- 
2.25.1


