Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26269C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=; b=41PLnwXqBcv/xE3vzmjpmwjkQL
	umcv+U4vsKY53Ov29mfVHv1Gu19BnXvY7C8Q+lVjDOPaxSduwMx9UVDQwYBJ8KP9Aisi5xUEKOuhV
	Cl7H/oqFJNkdAqUMCJZ0n3L7wDgUkR7o444vriYUlYR2mIv5KbRbJIBizN9dbh5r27oSO+B+24YA5
	n2gzJRgzlQ5lo2Nu2SyLBgD6Kc0UA6/GOLFFC8BxSmBCSQDRd8eH2bFcdbN12xjywlvHhson3Ba9N
	5HbeTDHCArHplhOiGXjyNrA5lMn1HZza8jTFnBdhadRCdD867clW34TY+E7uSiDoKW+XPNmVxxQOt
	fQiWzAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WMB-0000000Fkrs-2Gjh;
	Sun, 06 Apr 2025 20:12:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WJz-0000000FkgL-0Woz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:10:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso470591f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970221; x=1744575021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=VZw0QPKkEoUnLYvotp52DrDACGCYxXA8AamPVEzKqa/qHUiKfgFh3tGgT3o4GKIzOB
         fMkNBjAThl+osIhGhq8lwRwOdu9JMPm6XgkUj9qqVln7NFP8oLwchjEmFXpK583CNoqF
         UzYNi999zr793NFvQBv5TgZOMRNj5V2u5dwc+wjHQkVk5vEEBUaP3T1plljtbpfYs8Fk
         X/ASQgkTmo8yDhHWTEuQyK5Jo1TuQjH560fDshv1cmHJLyAA7lxaeqIgz7dZNQo5DLdr
         sMuBRMRk6bNCtBKy4ILd7WNiqQQ+wY5+dJxtZCIR5a7Pbok+ENadWsFtTGPQmKWhIVgl
         m4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970221; x=1744575021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=WMAcWE8jCTtQr8Ktsdv9Tx64vayRyVaK36tMOW5iQe9BaXvP4QEKg/UDBKBM4ExKxA
         c4TWqHu21kxqop2SRHhR/6I6dD/53ErDXnTsqoW/ECsSXEg0kZc299+8N3CtQcC0El9G
         lmaB8ElPvz4PADFYS20AgBbSBT8HkCiTdndp01O4Y7904WOOpMctUknnhi0JBQEujlpX
         5soFck2U1XwLcFl7ED6R+9n2W7JzBiVhaI8SFjBnmQIgmiBp05CWBBjR6j8HwGuXRRd2
         8viaMAEseoXUH+5t4hb9E7WTxx9YSGPjLnze/MYBnG5gmjHErqVLi7DTKFd6A03t66QP
         +KDg==
X-Forwarded-Encrypted: i=1; AJvYcCVp+0jqy0qvhEh+jxbsSxuUFYu8Z6G2uQwePNrLdto+mB9c/LCetKgW+giAgJra8NRfkxy6EfLucsYUoy1pxq3v@lists.infradead.org
X-Gm-Message-State: AOJu0YxA1Sj54HYSYGh1ZnR2j1zcC0U+usQODN4+guyXKFFeYwBxGVWg
	YWvj1zDrcymI3f0ia04EDc419pfLbrkuMzqVN443YSELwCxWH36YS3HC7o3tYWs=
X-Gm-Gg: ASbGncv2LA8lYMM/EhmVGWM5DXOP8Rgt+ouElT6wX95U5Gkyk8oVUtvYmf3N1QqC2Pp
	cmjRgyNLQpk19OSfdbm4ceVuK0cjwuZ5bFBsghC+2n1GOS+Yw/surVQtZIARWRTsf/hL9qe3QyE
	cHEs6mRCRdVfijw0wzUTXBFlkvvq0O6iaP90iKOFU6kLxvtIt9rD8An6pziLNqpJ3sTAsYtn8+e
	aN2yPZ7t9Q/zLf2hqi2y0uRgBkmlqJxEIb/LFQ8wVmL7tOlYJC0jsrvW9OCP+aXqDFKLfacLFv9
	uELdUtOTqEaX8FL9lqLZPB4GLSHtnqpE+oa179xlM4mnLTA9x+REAw==
X-Google-Smtp-Source: AGHT+IEaJAv7cq8up/ZJcJ41xkkrRi1H6wbFP+rMyncmJcukHJubfsFDxahu/j9T6NCNJr3cSnjNkA==
X-Received: by 2002:a05:600c:548c:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43ecfa05765mr31050015e9.6.1743970221127;
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] Bluetooth: btmrvl_sdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:16 +0200
Message-ID: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_131023_163568_7E276E4D 
X-CRM114-Status: GOOD (  11.52  )
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmrvl_sdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_sdio.c
index 07cd308f7abf..93932a0d8625 100644
--- a/drivers/bluetooth/btmrvl_sdio.c
+++ b/drivers/bluetooth/btmrvl_sdio.c
@@ -100,7 +100,9 @@ static int btmrvl_sdio_probe_of(struct device *dev,
 			}
 
 			/* Configure wakeup (enabled by default) */
-			device_init_wakeup(dev, true);
+			ret = devm_device_init_wakeup(dev);
+			if (ret)
+				return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 		}
 	}
 
-- 
2.45.2


