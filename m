Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A781CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QS8izAcIpePONpdRiDr0Q2OS2iBDSnSdZTmJA4AydsM=; b=AzLf961IZ86sgehAH5rmuB9MUY
	R78RnnjBDZQU5Ikq6QlH8/Ahiskvn8/5McL4qP38pULB3YDLDbKva4fKJX4/joIn7E4GosgOteSg+
	IcUzYZvAxYabAwmYA+BWIFRfXr98el6f+78KN4L4LWXDSIKtJqHtTBUJ8SfpLflU6KYXxIY6r3eNU
	5Jwec7HueCM86YaYbHWNZ/ROYTFNi+P1sqRWxJpUBNp3EWR+9dwx5nixum2XQxXaxfR071nTU87TK
	WwmbKMdqcew/OWxtNeqXLZrW5oav0WA01XddEiWISE+Ku9inyrI1KKt3jICN4sFhWdsI16UFce4ZU
	T5PjDbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLmW-00000007xD6-3JBW;
	Sat, 30 Aug 2025 13:38:12 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLbV-00000007w69-36og
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:26:50 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4b30f73ca18so12339721cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756560408; x=1757165208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS8izAcIpePONpdRiDr0Q2OS2iBDSnSdZTmJA4AydsM=;
        b=FL+4l5a757E1aZGmzYC5CfhkOSsiSBLOczvRfpIGxsHPI5TU2+ihy9D4up2SYW+1T8
         Ybu/rB0jgzVGca0yRqHkntOeWt3kdRpYT8ij9nDNpjJZHGM0CuHM9RQRwjAQBPm8b8sU
         86kZm0MpiilJ5IzsmwGOr+VZLCJV+2rOJ33SzKC1RdAAgGWYbJzJtQaPFgmerratWr4v
         lgRdHz16zXZHL/sLfQHXgEoY9n+0ghqn9LVTLoTv92v+Qz9b9vwxTSEhgclBPAeTJyLx
         0S9TATQceu+ME6Tkhph7hNuPEJAy/y4Gt5K8LauxFJx8zbJzfym69bViXjIwqF/mj+P2
         GFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756560408; x=1757165208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS8izAcIpePONpdRiDr0Q2OS2iBDSnSdZTmJA4AydsM=;
        b=JTaBmlxMQC32YNURNYHe45gVwY/j2+z0/Cp7gvf60RTmgm99tfKghaWBNuE35KFRp+
         GduOuGFMUEWIzSlyuwVbjDfCVZJsKOmPJylLiPgpgPaLn4uG1neX6uvZiH2lkkm+n9/n
         cfHsTrBFNJgBmIMeQul8t6/LEYZPTEBdtb5k4EUUpBscSlUchWKUK+lfZCSS21T9SvTh
         R5l8ryF2l9u4bQWFtLyVMLdMXCG8KGUybZnBfQqLbMmSxjWyRuZHF4MaKi259Fi6cg+Z
         JCQMyQpLfg2/xMWHUeFgvPfFn5SIxJEjfXaVAy+lztic29bqn1S8AmFmbEO6CguN0Muo
         NrCw==
X-Forwarded-Encrypted: i=1; AJvYcCW4OhJ1jxxalEDeZB+wZL3TvU5LeGG4xaWmrYnkPbM9YUC7+HHNVeiNOmSFRldM5gAPo0couW7uA3Ynpl3Nt/ef@lists.infradead.org
X-Gm-Message-State: AOJu0YzlT3ykPUMywGhX2VP8BREi5Xx1aeaMN5yzwYuBayIcLS5z4ccc
	XV85+geomMwLgw1YwBtldQ2r3P+0SjwcAtqT3YovgD6Vd64jFJOGOqsm
X-Gm-Gg: ASbGncvSu/VZf8vCuINQ5I6/SBNXxJfcsu1XqiluwbD4g7B58wrIZ5TyyTGxxdgxi6F
	0ilCih4Rxu6/WSA2kC11fJaYwByCK7WG7fdFeXgUfRGEP5Zf1QrXP792ZLmd3wDve0EzAIswSUr
	ieLVr+qrmqZPmV31Ykg7USZzCE0F1iGDO56bvEpataJnFeh8gV5IKI841F1fjl5safaOi6v1tl7
	GzodMrKjq4ZsADVIP+ybjh9v3AakaTZMgh2akh+J95tlPti0qCNxh9ypAn8DBwl1+juMVOCqTBW
	vq3xE4vFdOhZH8UGs+9L428Zi9O7ckWZHgkw0GaEH1cFYZuHXS4UfgD+NYYEqtDaBqGjDFl8xrk
	qX25z5NUwRbYlKefonpwcl0kpTvcQCjVR2CDt2OX4JU8gRhz3nHaA0TSPwB6izDQWsIjY
X-Google-Smtp-Source: AGHT+IE6zrU6iyUqcFmJvQ9qSLszP/NdRcQFyUgfus/aUtp96mxi5yjEyOyOpURIPS+atAgLgNl/HQ==
X-Received: by 2002:a05:622a:1812:b0:4b2:94e5:9847 with SMTP id d75a77b69052e-4b31dcac538mr27405641cf.74.1756560408196;
        Sat, 30 Aug 2025 06:26:48 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b6b9683sm30936871cf.39.2025.08.30.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:26:47 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: vkoul@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] dma: Replace zero-length array with flexible-array
Date: Sat, 30 Aug 2025 06:26:33 -0700
Message-ID: <20250830132633.1803300-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_062649_778113_C4FF5AAB 
X-CRM114-Status: GOOD (  11.57  )
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

Documentation/process/deprecated.rst suggests that zero-length
and one-element arrays are deprecated, flexible-array members
should be used instead.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/dma/imx-sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 02a85d6f1bea..ed9e56de5a9b 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -256,7 +256,7 @@ struct sdma_script_start_addrs {
 	/* End of v3 array */
 	union { s32 v3_end; s32 mcu_2_zqspi_addr; };
 	/* End of v4 array */
-	s32 v4_end[0];
+	s32 v4_end[];
 };
 
 /*
-- 
2.47.3


