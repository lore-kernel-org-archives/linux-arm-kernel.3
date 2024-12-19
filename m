Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722D4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=; b=VUMeMuhJdtOH2iXUMSJLTxZGTd
	Saqd29DfXCD1RjpbK4cETC4+mfonufB+nqFF21qPPNhfC+B9x6fbCiTfbl2VUB8qatTY1udX009XO
	Tkx0Fn01kfi4kiSaQC+m6AA0jnDk6ENkQBQek4VnfFT6s24iHMjmYs7MtwcjoeWEd3dUEp+xUPksH
	MjkLy7mtO4QhzAE7ePEgKN/PWPLSHgXjOUP2RBn5xAtKl/cUsv/SbsnHypwf5YAerUSc1OGlMYYoz
	WloC9qfdpOJn/5TsDN4qlUA5nfsalJG6HrieWmQFQBmYmK+84G7QmB6KhwRjaTZn0ECNaCZslAZZ0
	PAr1fJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEBf-00000001agW-2BYx;
	Thu, 19 Dec 2024 10:55:23 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE9V-00000001aGk-2AW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:53:10 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso536110a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 02:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734605588; x=1735210388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=E2lpV3hTyXR3Sxrj1rdtfITan4iCzRv94qcvwIOcR1PBgaLGi2Q6h251tqBqYI5/U6
         SMopSXtOvv/I5f4j6fQ/+AtaIdgdVexxc4JIRp3X0J/iIZ3JyqbJjengGUIzvVdP+uoT
         qO1FtwmNWSeI2OirFH19hGEC3zzszI7cu7yPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605588; x=1735210388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=YeVelKymhjgQfzSeq31Z1Xjx+gnwaQ442Pe6e7GpGUfFYcJkiOAAn9zfPRRkg1ORk5
         EcO8h0nLUtJLRW8mYLAvhgDDEtYfaCqLbLOJlCLOUNQf6uH5q8XlC+tDJbRv+P2Z1Vfc
         pCJ/exa9k8dY7yJ1yGk3k9wqygsqX1NvZHM8yA8X57U2ThO5+M50uzbIhcXGg2IfXihI
         Pjm9kezECPvngugqn3/Tl0XXOp8RnPpnX0oT2fIgxaHzXwUz7CyRdmdNWIEA0qTe590F
         8oFJFIAv5FlQR78/ROiMm+ty6YlHyEvEe25k83Hw19/nd4bp9ZHnG0AFBzI+361fokxs
         NiPA==
X-Forwarded-Encrypted: i=1; AJvYcCVAjxWDDTjlzaCYCsC6JObC+qFN3ydCZPUOTGOXQgZuF2SNVWbu/W9SDv2D5uL8u1Gv4XEeA8M9GPzNsr94Lhyy@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXQchwagWM6ITvjfY12k8lt8IPC0OVmQe9M3ugQboX+q36lqb
	uSGLnYXw8R1cqTYdIQWiRgkI1Z8OrXNg/YSteD1Jnf5OVLzCB20RacIfkjjS7g==
X-Gm-Gg: ASbGncvZ/GRaUD5q8Q1TlQVjEXPjwBqEhm5tNXX+onQhGzZRzCcvU/9rQLT4pHr1BXj
	vgqi8Ube/hxLpinWr5AewLFaXzOWEXVBMSpbj8rDRwZzixeHTQEZ5URkf+l8CKDCkJ+7JaU5pcG
	+EhzTFPFqCnFwJ0+THbi7LlMLycYhi5OAafySKfWaoee/C/WeJsf9Cuj7Yo6E5GKT39woXd7jJT
	B27QOL3bTA5d7XOsbpMe0GKertIc2Zu5rr3KIQ7m75sDoWmGEyu0oRBpN3sdBGG/PjTv1UxSQ==
X-Google-Smtp-Source: AGHT+IENxlsOZm9def6oti4V70uj/jGgxMRZENhVtBejHswBs3FlI1YExvOn9EK0Mjoqmtw4PCN2Zg==
X-Received: by 2002:a17:90a:c105:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f2e91a4d5emr9173937a91.3.1734605588162;
        Thu, 19 Dec 2024 02:53:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6603:6add:77e:d71c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd61sm2975014a91.42.2024.12.19.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:53:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	treapking@chromium.org,
	yuanhsinte@chromium.org
Subject: [PATCH] ASoC: mediatek: disable buffer pre-allocation
Date: Thu, 19 Dec 2024 18:53:02 +0800
Message-ID: <20241219105303.548437-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025309_579484_E6159291 
X-CRM114-Status: GOOD (  17.92  )
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

On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
(AFE) is limited to accessing a very small window (1 MiB) of memory,
which is described as a reserved memory region in the device tree.

On these two platforms, the maximum buffer size is given as 512 KiB.
The MediaTek common code uses the same value for preallocations. This
means that only the first two PCM substreams get preallocations, and
then the whole space is exhausted, barring any other substreams from
working. Since the substreams used are not always the first two, this
means audio won't work correctly.

This is observed on the MT8188 Geralt Chromebooks, on which the
"mediatek,dai-link" property was dropped when it was upstreamed. That
property causes the driver to only register the PCM substreams listed
in the property, and in the order given.

Instead of trying to compute an optimal value and figuring out which
streams are used, simply disable preallocation. The PCM buffers are
managed by the core and are allocated and released on the fly. There
should be no impact to any of the other MediaTek platforms.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 9b72b2a7ae91..6b6330583941 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,8 +120,8 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-				       afe->dev, size, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
-- 
2.47.1.613.gc27f4b7a9f-goog


