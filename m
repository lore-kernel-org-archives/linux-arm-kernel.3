Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B3BC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQSiWGawSQuy9JjtPPgjfFND1Bm19QyKn7xZ0H2UpZ0=; b=swRnyjXrOtDJPapwYg8b82ye6q
	tT9n1Y8r/Akg2PYQQ5u/ho5XbMsLrgVl4kIfsSuVwLKntB7qAklYOjCKuVXsFUmqfsKi0Q6Sce73y
	o3H1Iv2BCuniOhRRIaJ/i3VpHjbQdJiz5lFABwVL8MrJc2mfl5i3tsLE5OsgiVpEuvUNjPZW7tjXk
	f3ZJZxWiylJKuUC77RRqz2rnudor3xJA5dTcwl5wCdtOdQb01qZ6P/TAVoMAKYBiwqRhUCxAGLMHC
	WPnOFh5xRbEgDn3o02QgppYK/1TcBeQ5GxdRsjGAL2NywFZUnHms2my9jK4SLPsn4XEz4BFCMK5Ym
	UVVStOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGM-000000001w4-3PO2;
	Mon, 03 Aug 2026 16:11:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGK-000000001t5-3vur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49802c418b5so18630045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773495; x=1786378295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQSiWGawSQuy9JjtPPgjfFND1Bm19QyKn7xZ0H2UpZ0=;
        b=iL8RT5yUiO7cw4vyWnm2EKYCHlc10Su/LXQrbND4JzBJlckpVXHT+zUdAir6+lm0jB
         fVlYzngJ0+CsWCLGcYGuCUVz/E1n7f6Ax4ECEFaktoP9yOWDn27UeWx769Ue+a0bYQOV
         BOp5EZltTj+IKHxLCNTEHFyxC38CqysAC8K7lVbqd821l6RoDeTklGspb9kvWUDFlg8q
         74sUoaxXsJGYG0k4lF8I/CWuMow9+RAsXzYMsq4om7B8/0Fs7JQ2zM4THl1xUYtPKAHW
         4Fubu2L2JudPc+ylXq1lLtBOlYSCVpBcAzpFd5bukmmzC/GqEwwyinf3SO4uiDPpTXjL
         UItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773495; x=1786378295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQSiWGawSQuy9JjtPPgjfFND1Bm19QyKn7xZ0H2UpZ0=;
        b=jgUyih0H7xsPIt4UG4/jACETewgMtC71ZF9xSD45Si05lFVbnkaoOkoah8Qdq68F9b
         ivgS+yP9Lm/0R28TSU86+1MszeknqC5YGzd1o8pf1rFyhWN/kEPOCkmYFqblNVJ3Nkqt
         RvngOsRj7/44SGA9EMgXdZSspui9Ap9HB52X+hBnHz8trGMmi4oU7+lle0rsUbqu4Bz9
         14eE+jRdpPxQWyZl5Ls9IXQK+Qzv9dD/6ZEJ8ON0rW6+kDq9bUB41vCRs1p6GetmqwjZ
         r73ggw1idhnhf9YuXlvDaQiJlXC4HZJTyLmDVarDmRW2rRw6qX0tdZ1HUGL5EYPWryU9
         R8Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqV22adi+i0mBTbvtU03oJvYTB4bWqhnNRnLlcBR8fFtU3k5/rcH6DRyMhY6OIw4JTPvY9Tk362n5o2P6vzp4zJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNTnVcZuGUjDAjHQIyXkb0fT35VskPHH2lM2KJr2TC/P+v8HN
	X7uhV4ClW4/wLuXScBMMl6eQXoenHsfFYa5SconROlyypA8ULu0vbbb/
X-Gm-Gg: AR+sD117As74KVfKsL1oFRhnFoNTYjt2WUcANc9IF24fLeVvACVCnZ9Pg93dcDht/D3
	LtovjmRfe++4kvldyzQs90zfT7UGGK9E7SuQxPMcf9kQ5drT0RzmvZt2nbmc/6lEatBPsVceAbf
	ue+eztQC/O/1k2rBqoqDb4l0yAtVpgvAEctUuT9ynecHv/OkAQzVCJ7zXjbqbtj7FN0xK6dr+tG
	Hf9rhcN3autvw3gA9wJLRY43DfGyXqlfeEGaNT2yunnih2gVa6uXRMLU+0sgVa/5yn7GV2xhyRu
	QBEpzGG4DAnV0ebJtyzk8G+G6n/7wvjekb3lJG5VjYkG7+TIRWlzOl+vDjK5Lw3kNt9YFWXGyr0
	gObQPJHEiTOJJy/4Dk3P6bOajboKByMQJOHu7H21K5QvZeakCfkq1dQTyXfnhVZk92mOd3awcXt
	JiNjp23WCXdI6i386gy56/+8OiaNansDFZtFe66w36NMQkXX4w3ubLCoaFxxU0EK0aaQ+W++pkN
	dipX8vbT2u50BWSSAQNy7YFD5cLKqpYPXco3JQiXZE+Q8heABdIrtHu0cGL0sJAs+x9mzhcww4P
	48MBLC9bWWXiLMIXvAu4kJU8NeI0+jgIomRfNNfC6WmlT7KgY7KPMZWWkDDsMoMPhGt7jgUQyLe
	e27YwnlnHx2hNUe7rJ+rA/INXBDYwI4aUOwCA2HHwufw0NoQEIGlrN+ALYyTtRCXRrrl+z06poN
	1C4A==
X-Received: by 2002:a05:600c:354a:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4980c673874mr224712255e9.15.1785773494475;
        Mon, 03 Aug 2026 09:11:34 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:34 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 09/13] drm/sun4i: tcon: Drop remote endpoint reference
Date: Mon,  3 Aug 2026 18:10:47 +0200
Message-ID: <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091136_982478_ABBA2D8B 
X-CRM114-Status: GOOD (  10.63  )
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

sun4i_tcon_of_get_id_from_port() never drops the reference taken by
of_graph_get_remote_endpoint(). The function is not only called during
bind, but also on every mode set through sun8i_r40_tcon_tv_set_mux(),
so the leak accumulates.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index de2d66623f7a..67047e3b657f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -972,6 +972,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.43.0


