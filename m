Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B7C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvn509QiPGTq/ln1pwdxML9/uSgUBXJGaIOsAHjxhfU=; b=QQoWF+pzk1sAYdro+XKut84mAy
	olKWc8Q9z2MZZqfCZnJafUUpGqKSFq1cCveF7DxDiYUD07n7XbvukzA7bU/O4meFaGqOROGcY1BdR
	iXa61ME1BR99VvqHtDMVh+6WwWNZFslO0sIIAJiDYVAe0vuswBRRWxG5n6JTiTYCJfcVJLGeXz8pS
	dDuJ/hN4C9erNseCsWySnLKVrfeBqqwsFwtafVZsrVYWx98+BsugqK31D9ly8yms7Rvx3A1Np/Gdl
	wPx7l7VZdppgYr7ER0P/O5hVsuPQ0V9IYZ7SzRT4AbyNJdpHBmCBFEeLZ5IKpNdRtYHLZ6e8AQG7P
	FAkkXmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GJU-00000007GAl-3lxE;
	Wed, 23 Sep 2026 06:18:40 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GJL-00000007G8R-0DzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:18:32 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885d4825adso362619f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144309; x=1790749109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvn509QiPGTq/ln1pwdxML9/uSgUBXJGaIOsAHjxhfU=;
        b=j01daW/UpZHJHVfDJxxpgGXCqTBIa2+CQUdtQMI7GWSXgdfWXoAPhQpEoPxRKXRaO1
         DYHs5KlQf1LbIOvkETV1FqTbQivfVar8hZ7hLSzACR2RVMuAXuY1AMmErc4ZVlRu900f
         dMwq4YFjYbJli2rdo/qNfZBcJQNkUY5pnIjqR3oDrvP9hHR/4wpNq1WzFT8ieaYZQj4g
         cdIMOCYVRNKImQjpAp5/Dwa42hoQ0bJkHnXSdeAo23W3qRmK3hYFoNqBM/4ddCrJtnBa
         EHaKgMLBbYb73Hn7jnwyaYpQbGjIIN3+vW/PQ/8P9kAm0hwP1KK3SYQ8kBDzkXb683s6
         xnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144309; x=1790749109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvn509QiPGTq/ln1pwdxML9/uSgUBXJGaIOsAHjxhfU=;
        b=d4JEV1SwhLP2HaNU0bJzYLmubtoUzPR8o/1eM6mKFv7w30+RzfD84XpqNNmsk44R9d
         U4aCXtrBF3FxcsUGbx3TDDuy89BmaIh70lMYnxzG8rf2IrCP3TWBqCyg5msYy+gLEKoi
         ZtFF0NHaY4IbU7LerlZdBWvpa8aWidQF1Epr7LZQZ7nLO5RReY4s3Bmp/P+JM5pZfElD
         9haja7yR99jzyxMYKbwbScXay74XcvK0PW5HIUIoOSkuHHD9coGmK2UzDxvK+G+xTXBx
         7QO5t+SoPZDfn6PX5bb9hw3djXtHqK1YgnxMv7Yc8IHesPJzT/BpedtLYA1nsP12KQp5
         +8Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwJtcf3kM0uXzFfxV9bki0zCg7ACcf3nsEqNpWQEEzlztf5EPzWFAysuGrpKq1fxcsXNK+hZrbow1AEoF/7QePh@lists.infradead.org
X-Gm-Message-State: AFuF++nwfCpPf7nx6rnOZv42oYv7zpeqdWPBuQXxM6aLNhDufJgYHKk7
	hxTk9vyn2+AldTSv3czKL+2ZA305Y4rNBnAjE4SmEqkep69OPgomwkqK
X-Gm-Gg: AYBFou3D7dRRZEKbRgKws/Gi9R590g/ON14uPuFy2hcNxyZ0mUp0dffyWskQz1n9ywD
	7+TVwEp9U+xhmtbcwv/W80lQi1FaBxcpjCAx15rF/YgB4jdmipsldIghHsfLnBsRkG+wXfoJ9qb
	P6/BIQ4RSoKtnSN5hJoH+2rHEhSQHe9INU5LGo/9DGZaCM4VNdDNasXAJ5zM9vjrFEnuS7PgHVK
	4LxppVxWl0ofMWPy2mF1T/yoaT+17cV7FCuOrhU2gi+JPPsEzbGJD6o535ApKe9Fwnpy5uI9lFy
	uaNbJR+0GPuOCBPZjiakiDZWpGg9MQVNKe5KZt2qRgvoalVQtqCVmQjPYxdYGbOUxxoR12F1cMk
	0C+mU7N8aaYT4o6NT5cWOH3uOyz87dzf3y55Geu2THOKKDQSgxcSOZSziATOWssQEGUkAmQFIfh
	sL0duY/qDfMImbQ7KmVIo3GpT3HbgOh+q+yBhqTF68IeAg4d8evviZN2AAbcD9Rp8iaMIpzCYVI
	PWYLuvqvBdTBtsIT5TGwJwgbJ2wmnjULNdWFT0Iq6evAhfZJ3CwFXfBzV4tWtb8Ll0/yyLNkXTm
	GuLi5t6mFZQfk3lV5NrcYaK8xGn2qj4S+Aq2RQ==
X-Received: by 2002:a05:6000:41e8:b0:487:35c:6513 with SMTP id ffacd0b85a97d-48867099e0dmr2216693f8f.42.1790144309059;
        Tue, 22 Sep 2026 23:18:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm3859755f8f.10.2026.09.22.23.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 23:18:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc
Date: Wed, 23 Sep 2026 08:16:58 +0200
Message-Id: <20260923061658.20140-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260923061658.20140-1-kmehltretter@gmail.com>
References: <20260923061658.20140-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_231831_111326_17B675AC 
X-CRM114-Status: GOOD (  13.54  )
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

The heading for k3_ringacc_init_data repeats struct, so kernel-doc
cannot match it to the declaration. Its three fields are also missing
descriptions.

Use the structure name and describe the firmware handle, device ID,
and total number of available rings used during DMA ring initialization.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes (ti-ringacc-v2):
    Changes in v2:
    - Describe num_rings as the total number of available rings in the
      comment and commit message, as pointed out by Udit Kumar.
    
    Patch 1 is unchanged.
    
    v1: https://lore.kernel.org/r/20260919163721.89044-1-kmehltretter@gmail.com/

 include/linux/soc/ti/k3-ringacc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 2de6031b9424..7b7fc237c08f 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
 struct ti_sci_handle;
 
 /**
- * struct struct k3_ringacc_init_data - Initialization data for DMA rings
+ * struct k3_ringacc_init_data - Initialization data for DMA rings
+ * @tisci: TI SCI firmware handle
+ * @tisci_dev_id: TI SCI device ID of the DMA controller
+ * @num_rings: Total number of available rings
  */
 struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
-- 
2.39.5 (Apple Git-154)


