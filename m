Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135D2C3ABB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=; b=yoO07ci3sSO++N9jdKQHniak0X
	+PQd9DhsaJXf7fAS8c+if/z8pR0iAmuQOK3qOWzpT8q4s4jHKXMQXwFp2VpE0oOmJH16aomZf696X
	/yzMSOcsdGj1Ze0k9GOJVm13G49B8xasmWw8Y3kJW+7KsELYtauN9XY7fVrjznuOE7oeAAojwqYan
	nk1rMhp9WvVOX/OCIzRX0aTgFcP4CtXjVxF4QZ9boMINyCdKQ5Q1TRZdiOuZVMZBtnFn2vjDHZgGe
	geBTMgwiSw3Y4Es2WdMm7uM0E8qu20DY60mALSAVKT5XDbTCP73R5rtbfaIExsVsYNOXiZQzCX0Dx
	7a4ijDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfX-00000001ZzV-1EJo;
	Fri, 02 May 2025 10:30:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCa-00000001SiQ-0nm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso289756266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180062; x=1746784862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=d9D61ppJdn1ZE+4gWf0vxoc0DxVAqTjKtQdOFisy+o3kZxcG+mB+wJte0o96kGUcA/
         RKw9Dqt0MuT9XmCPFc6dLhr19ND7ta//HSt1dJftheowJkQDLKw9DYrxX/9s8sd2dCH9
         BzhFDbyuym4ecrJmSft8fk2ntO5eFWw3EZpThUpy7R284qJyaQV+uKKPNTikgkv0feU9
         dB6R8XzrSUWmylNGdtRblGMhAmYCz68pLL0iNq/sTMYRCfM7fPB6+h8zAphd+NI0tFtN
         3mg3RSzGdOAYSvxTyxWeS1GVcF5IKfMOlUZOka+VN7fBFJpQUUTQeGabCpOLcsiHKhxu
         stPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180062; x=1746784862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=bdTI1Ukj2Clg+3WzpS6I7eO5VHNX4Po7IX0K1mDqWMAJb5vYeTVRtWcvK9E+RpGXiS
         ymDcqxDszYP0ovEfMzc9MYfVUbWVawcq5ihHrVN+RFtVZePePh7227cBu2lpR6RMDIK1
         y/9KD2Hpoxc2VKt8hfC0x/SZ130dsjmrbHfnholn6G7Ni5DDERMrF9YwBMod5XWJW7oT
         ufv2F3VRQm52M5Z0U4ilosswsODLRe4BvFga5jwUEIvP1Z7Px8I/5qVMHdV3t//6Rcol
         nKXBNB0/ALyRM7J81nXXMs/Hr6osCkM3fhSrGUwAtJhRMFowzNneaVTyzCNEGxsJDFVP
         ZROQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBkir9n7c6EfG3sThp3ZH787u6BKtoENpz05K0HriTf2CUwyUZu8/fg1kvWly1uFiaqQTnXygmYF89050SsILz@lists.infradead.org
X-Gm-Message-State: AOJu0YyU9LxkQBHRJHQwLQXaROgxXG3eoYFd/TFJskrb48r+vbQKpXpg
	bZhf3MIb1zCY/3bNrrqt9VJ90M5p1vhqU3nWtQQmfSGwFSrbTcY8NmYMR4Zqq+I=
X-Gm-Gg: ASbGncv5gbzMy7M5t+KMgir2JOJ4x5yZ9MvS36bCjgL1l2Y8V301SqLobKebg8Fg9AX
	uIE3z9uRkMjmYOpB+0C25xOgYdmRhgm2i1Zk/NyxXe/bJdNo/GKTNF6Paos8ascjUhy0DIQoDnW
	xGXi+u0YtuB1XdWIyYPEykSZhc8QsYVWG9TcsS9v+jqwziD4PokfoZRlkZbi16FKBq402XFDTuv
	EVTbAv2TwOd6nvbhjuXIgH8O1Cg5GB4Oe9eXD6CeQL8qVpbx1w11RSDs89o7KLVLPfytmKqJ3cu
	4lAj4jhkkQtl0wOAa7lvLEQY/TMLflUxR0sGTxwGeyXwDLTGH+R+tsEIvjV1vPKuKaA6rcoWUwz
	ylW4QZAYeJkk3BnQRxg==
X-Google-Smtp-Source: AGHT+IF8JUCWliZjcbeUSHN6uSsFMCJc6NTPRM+5qGy9ZTGCC1yXzVdzLyehffDilJirBntp5oHCOw==
X-Received: by 2002:a17:907:9411:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ad17adaee50mr226144666b.29.1746180062402;
        Fri, 02 May 2025 03:01:02 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:01 -0700 (PDT)
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
Subject: [PATCH v8 05/14] dma-buf: dma-heap: export declared functions
Date: Fri,  2 May 2025 11:59:19 +0200
Message-ID: <20250502100049.1746335-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030104_231925_DFC74D73 
X-CRM114-Status: UNSURE (   9.48  )
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

Export the dma-buf heap functions declared in <linux/dma-heap.h>.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0


