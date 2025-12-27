Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CEBE8FDD4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1mzLS7EMQ7CMEUjGijkTRd2ui9VJENWahANf3YnZYY=; b=hOSaeHbc1JqU+WVn3fxEO/QFxa
	ehbNXfNyHU8pl4WGyW2wDFheZezGHdoWwRMkV7aOGw4jLsaBFYmEcNkJkPZmBzUSBdfY6wM1s8fnx
	JyyjwKxap5PRqQpUq+dK0Xt8HKs+1JY43Iq1xiP4w4eazfZxF8rO28BP971eEQNeuuesv9drxBUDN
	grRXM/QBO6cMzXmozUa+VsD5alz31vMetDSmAiAz2J0dnwDtRbaKulWEwrMWkrxAG1AA0pTQ1yVxS
	tD/XXK1DWIKgXmrBEWIuhorRPBRxdS3JLrp6qcPzrzQIkgygN5sPkrW/mzAKo2WEZHK0VnNZNIotW
	YIMf/zMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZPrE-00000001o2u-1bQX;
	Sat, 27 Dec 2025 08:41:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZPrB-00000001o20-1inr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 08:41:03 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso8841867e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 00:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766824859; x=1767429659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1mzLS7EMQ7CMEUjGijkTRd2ui9VJENWahANf3YnZYY=;
        b=eP6b1zJgSwR4BvPIKwbkhBPCkZeFCNsucqvPKj4Q66ETr6sRuh73lf+pRdUeslbQ53
         e8BWgkyZYEOUVX0ikHT8IWIPxLn79FekdbGWlTH3MHgQcUMCui6a19aPDpspiaMvg3QF
         9vd1YmKf5vADU4AUIwjBoNv1odZ53jxTkIO3VdmbK5pBjZ2uuBpJYvUUxDfeI5aqeJ5m
         haBDikLJnAxZo36ygrsnCvGMa6KMt7SaRjyfcYt/mu9GIgMbS1ea8ude6YSt05g1J3CV
         A+ETNFyX+NU3i79XB5/i5qDuRD9hUE/yStjXrDe1i+D6jcG6Lw6KUGiF0sVazItc+/UG
         TZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766824859; x=1767429659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1mzLS7EMQ7CMEUjGijkTRd2ui9VJENWahANf3YnZYY=;
        b=B6+Ol5k4pF6wWuvGhSDJ6EBqmpMKjPjbA0LY2WZN/9HQ4sRhKEhA03zkZs/tvz/mXQ
         pcBpERZ7XfyT/0c5I6BNcFCnzLZfVHnDI/I96BnqAtVFze219pKDouPT64+HxIBrJXmJ
         LUmGCi6iHkR+szofWmU4HcsdfieRrkfxKI+LxZ1mBTixuDzHhQPs00EU2DzZWZk9DYL9
         M5TQg0qXAgjhJkPr35LA+WM4fCh7q+LIDYhgACtCEnpqQw/Qfxv96UW4ddCDikpEQzZo
         ns3HA/aqj+g9Eqtdnpq7rQ8hlFzvS6oJeiDJBfTHMrSBfHOhI1ae26GdQ5xL9iML5zju
         56UA==
X-Forwarded-Encrypted: i=1; AJvYcCW6FEjT+9znfOhspUB9iAid8ssGYHo6KjIxR/EG/w5c9mS9qGKBgGGr07CHYwEIj2uZfi3bYc8gdhGYKacpKoAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3TImaX3ZizmuiuzO0rUB2fv4pAFce4DNP2gBGMOkw30ia6NXA
	UUZ+pGAcllwqcDg4kFir9HtZzGHRWJE2EuL3yJtihXALOTy1RWF5IyyQ
X-Gm-Gg: AY/fxX53i9QQq7ydHmQt6bcQCMwkZZHggQeOuv7OJa9p1goVo43mWljCtok4vNt4gjB
	fCqkSSVl+12jnLfqJgmkkS7F5Bz858XLDqY2dwByp3wijPVXZfq48dXFvVui68SzLQ97nPSudkt
	kDL+d6l/bNlaflUKkbeKmOgT0PCFx0mYTiL7OQi6n61+8AceWR3PjL+Bt6mf07VRaa9bse14xPP
	Mmv4vtLBqwAMx3ALXOjubnbRfYBcBskap6KlUWrXWWKxjE//exnMqODBKVG0UH4RwTq3w9aGw0/
	DDnrqaz8aUyRcIexq4E9lIvmMNNaC2eP5HGW1lk5iTl0F/J/ywX0M63LqH5fbOOtIwhsdMREuWW
	QdOHxAipCeKcBhjhVDXidw2af0Km9LHAAstdRZ6c9znIUjPw4WU6Pxe06XrbJ/LcTnJVW7oi6OH
	D6JOn4aL1Qny8/I4zo1JBlkt6Ft2s=
X-Google-Smtp-Source: AGHT+IE1gCiVZ/51w+w16JK8HSkIEZBaavUo8dO1lP3TNd8GAXnf3MFYxs6ktYqH0uvy4VDHnjLsEQ==
X-Received: by 2002:a05:6512:3b9c:b0:594:34ae:1446 with SMTP id 2adb3069b0e04-59a17deb93amr8297083e87.41.1766824858531;
        Sat, 27 Dec 2025 00:40:58 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffffsm7171646e87.81.2025.12.27.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 00:40:56 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()
Date: Sat, 27 Dec 2025 11:40:37 +0300
Message-ID: <20251227084038.28679-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_004101_496428_16B9D201 
X-CRM114-Status: GOOD (  11.63  )
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

rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
unsupported or invalid. rga_buf_init() does not check the return value
and unconditionally dereferences the pointer when accessing f->size.

Add proper ERR_PTR checking and return the error to prevent
dereferencing an invalid pointer.

Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 730bdf98565a..bb575873f2b2 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
 
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
-- 
2.43.0


