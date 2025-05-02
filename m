Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AF0C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=; b=OznMM65/RrB4g+nRrJ/7sc5h2Z
	p6lJZbsi3wQPMWu7bAWCNgZphRZ/TEW2iD1B65PqjGgHc6AL5Xg6Avbl3A/UWblGqLuuWhFnawjfe
	CvsTfXblAQnI5Laq7pd+zgyTGzx9Y+bUX3tsfD1EIkejaEiI97dqUIbBCKcQVsHC6PSv6fzRZY1R/
	8lTph7+Hqae7RBZPwxdlFA/UlS+nMFUVuTf65rdd8fHqVFTqFkA98WFYL59Bwn4Zfrro6O+YLh9HA
	fGFYaYgU0auQE1MuscHxwYfAHfVXod0ZYixcfU2E+dSkWxL/z+v1Wr4YHIXK4eslKAmoFY/W1LKh3
	7Qsz2Q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoNj-00000001lAN-3zZS;
	Fri, 02 May 2025 11:16:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCS-00000001SeK-1QFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:00:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac25d2b2354so276798966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180055; x=1746784855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=rskpFxsemHmOtWtTubkL4wiXjHFnAJlZBsjZoLk8RLPC32djZdrohP44qn43OPuLj2
         h0gsg0a7sSSCwnS1iq13JaiPGAzbGbeXtX7I9hiMVFGWogw4n8jYn0nwNoSAs7OOnQzF
         i+aoanDZxjXAe+SIH8mY01bJclznN+nU6MM2Kz+KfZ5k/zcmkkzEX1Uaej+hd6jOCP3t
         QTlyVeiPC5HzmOm9dEHpsBgBhARTHWQB8qDzyrLpDT/q/zC0L8DcTFPwV2l4k5rojhBC
         9fNXs+DAdSXTq0PYmeHrKrIY2MevgKDoJgib4ZuGMTEVZ1U2lk12yZuAbANRAVgoBA8K
         PnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180055; x=1746784855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=oyIEwR7aUgJQhCSBq1cw3WW7DHRmbnjACGafnMRivrxIn73sVnE75TxL6QkLTPA3qk
         G+lc5zVVvT2mnfyLWWb7M+i3Q4EyekiHI4PzyUuO9IyGLFy3qVT2zMB/c0fK842RnOax
         HkPuyHFyuvKuGYKrznDB2bcbqCEl5KpD4EL9xDziQ3LZ3mj94DOU/o6NNn2cwm2iyODB
         PeiAWosBXGKM47yzX7EQfDs2gzV1n0ykUSgXea430Ks9nsELKQ3e9XIBGaNipU+8ZemO
         GwhLi9Adu9O2GMaLjWP35Y96A0hRzr0STgt+gh/SG/c+p+W8F0Wm1hMjDz2a/feaRBXO
         MwCg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7fc1n+im2ZYmXl2Y2kgippjgCP+AlYYCasvo2G/5xygzr3ov88bKWVOqsR4yVEwSEb7qBWw98EDKwX0Wj0lP@lists.infradead.org
X-Gm-Message-State: AOJu0YxTbkiUEUr/pglId1EOqMR/3Rwo4m3IrSory9OWW7N+8QtVGF72
	IDmsSdH+RXqcuv+LDwBbslMoW5l5uy/Mz6pVVUnFr4FmhECUf+9otLXz6/2UiKE=
X-Gm-Gg: ASbGncsuHR9lwHBRHgC9a1/s8Rxf8wCrSeh1EVDQLBG8Xyrb/Xc/xYUDwTZy1kQ5KhW
	hx22/gEsO6nf2Atps6lPrj5P6Dv5zf4FrGIRT3qcPaXky7yORHN4q9CiAHV/WZiacSmvY9clrPz
	KsvLe0zW2ogyvIwMNvjkKnP4X6THtYjNAHd3IKTwgVEAFmzfyAKOE2JXaBAoBpsSY3+2XhXEfvt
	KY36iwT8mufK4mqCh5SAcdtx0v8+J/j8KEHRqV8xw4xyppYGCLjDcTuFBqN0CYYBcIbtDtDtFSB
	8rC7d2XSO2GSO0QRHE5BEprN3CNWey9jZf7QDvFO/RWyB28C8Guc7LHky0rxPfhXZpP05V2s/kF
	nThd2OsX1BtiFTKnxlQ==
X-Google-Smtp-Source: AGHT+IHsIhA3Bp5ORflZ8bo2wewMeJPgYiXyKbBXizljuVxA1br3p39Mij4FHprUjRbWMN7T6ANK8g==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199033566b.3.1746180054591;
        Fri, 02 May 2025 03:00:54 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:53 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  2 May 2025 11:59:15 +0200
Message-ID: <20250502100049.1746335-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030056_378837_E04F7B15 
X-CRM114-Status: GOOD (  10.78  )
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

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0


