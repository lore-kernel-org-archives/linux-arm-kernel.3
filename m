Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03081C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=; b=vIQx9DlES2iQLMo6w9kEvJmDFP
	lXaiSkAZQ1SFcJbj6L5/2ys8vHSnV0NA1jZ6Q6pDUaIFjrnG/LGTDiA/bg3J+SyASDsmueOBdA3u5
	9jvYI1ZCp8ZJv2AK9rQQypjzAZLvWtwda3Tp5fCWPvMQBjtstWENJ8obd3/48EPq0w9epOz7uSkXQ
	oZA9xax3Hq9SU+eoGRryebt+hZX35KcgvqYFbB9rZ1Jfc6EPclz1LZqB5Ev3fxgr0iklDkEK9Sb31
	+uD9J7gYxxNqSXCbybvF/lIUsPOEVIAGoDZulMBjxjCQX+znymC+Kgtt3utaEAG7fSHtUv9TQuBWd
	YdtIj1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoRC-00000002QC2-47R1;
	Fri, 14 Aug 2026 09:42:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoRB-00000002QAu-15IS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:42:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cab973140bso13467445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700572; x=1787305372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=qVMC2WdIky/WHrbla4SggfGjE3jMQIsQsaNhW5Rr1fORfH+i0Q8L30zAjVMu3evsCr
         Y6cb0Lqj8HzIBt6RB3eLAcjpEfW+DZ6NyRrzFcV3EqqbF3IhcLoY8pZTZ3HgP9Eh7FSX
         HXKfHgoYTIA2vhkFO7w/Yov+9xJi8BJt7P0FRFebQb4VcSr7oI7G42x9sApNYXwa6WOL
         PInsh4qeSJToLnvoAxxugQT8LDRbDox0iRWwsW1TNNmbJgWhAzCC7l71JKl4ZrHHFOOC
         ScClehW0DId2DLFD2nw4y1KVanVJnIwlKz10TJljNmCI1DBh19aQHK1unJy+EHIrulFg
         gQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700572; x=1787305372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=hNickCd8u3BDq1tESug8/NlkyjTiL/DLs/kT+MADi0ziIuhHM6ZJ9DdxWbFL+a/KZM
         LatSYDwfafV7DnLLXAnkWeZL+zmnCklce8h0og4rY1AjBXmEmaJBp2SZq89QL57fg3ks
         JPM5wr2o9gnd9HcJV1DuzNMApqUmDiQSd+av/21sl4pMfNJTFgAhZIfsOKg8immMgiJc
         yHQgGOjnlr1G+slNDrJDe3vm1a8pblDUe8OziXXaITPVRXk6E5rBbGhCST+WJtVoQyo+
         l8dls1kspjHQesZByKcUoDij14Mx0HdqAo+6ov1WPABomORcWggUdeMLUK5B9jmHy/hg
         6u/g==
X-Forwarded-Encrypted: i=1; AHgh+RrhJ3qnjNpX3rAgC6SFTJHVbk+Sx4GvHubDLIoTRvhCyd18H2/oeiR7RBZ+TtUubBNUVmW8o6Pnk6ZjS65mN9ur@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4JXcRKCYrD4r9l2W6RanZENyhGWnzLyBVVGGH7SCQ2lOUGYM2
	ZwmujGTBUof6IB0EyQVgUV5kc03IaFY3SmxED/zuNKwnQ8nVuJq8mETS
X-Gm-Gg: AR+sD118AV9tRxZ2bc1jvDzouiOot5BFlYpBIUa8fe2gaPJMqzK+ywUvBNt0e/qfWeC
	nASrqcRu2qRnxNYoGbz5drs79EJ3hdj7GBtAndFzPQ1KF3i/AH+mTfzVXtazPsfmLAE6HR567TD
	r/ZiwZ3ifdJfI4OJkz10m/6I8Mvy8XizUI6CfMko3aFLnG0UNFn2Nq2ZUqQ8oPPUMPuuEc9T+dy
	SW4KqLjmA6ozkKqY6I28aAc5Kj9IbXte6xuo7Myyka03fXh1sBI8/4dVY7vjo8JaXL4JQtYgQ99
	omTnECFnZQDEf55i6/fbIQ9fj8K3pVKnVCXlt0FRPBc5UXqY63pTh6UmIp5dKxWrQ0tlpkTVzc4
	wm1uRbHfDXY6J/uh+e3OqEmLvE8m3E2hnMivb0p+IxCgAW3n/YIwdp8fcXyDSo73el1KZl7C9ZQ
	bXB2CbnpWBwfiQ6ygtYvWjRRxq3GtA+wjGPG6cZIabnzUZeGuuXzv4ImMO/hMyJmQt0FvZj8yVh
	8GX4Xi3kJpG3pdIs6kLxtxPJcfUGCsURNqk83yeyFu8jU7RfxW6VrU5mBAn9ZjiQP1rArzNXd48
	Du46
X-Received: by 2002:a17:903:390d:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d3b04c40a1mr57522695ad.0.1786700572325;
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:11 +0700
Message-ID: <20260814094211.25151-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com>
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_024253_294614_C4EF2F7C 
X-CRM114-Status: GOOD (  12.13  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/meson-card-utils.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..e4c3eda24d82 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -290,17 +290,13 @@ int meson_card_probe(struct platform_device *pdev)
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
 					   snd_soc_of_parse_audio_routing);
-	if (ret) {
-		dev_err(dev, "error while parsing routing\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
 					   snd_soc_of_parse_audio_simple_widgets);
-	if (ret) {
-		dev_err(dev, "error while parsing widgets\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_add_links(&priv->card);
 	if (ret)
-- 
2.43.0


