Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF9C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC6MJ8bwLjjZgLx3/Q1ZtCKaKlgeak/LeNvekOVJvKg=; b=vWJrxb1gOgLMiHx8hUP48tT2Li
	eEB/7NCNkOCNF+yzDQwliho5EwyULsDuVkwOMHQZAV28OameH6fbnNxXQG7ZoYgxaRBlX5REEM+XR
	HI2EjKdCgy+IxckM9zlbuH9Xlml4fbkFuLMF4U7b2URlJuI7ICOkWmDB8pTBpUH7AyIjsEn4+oiiA
	ZmZyEkv6kRkRnCPas3nyfPkwuDKB7rGAfFuGHOHvlKMmX8LdiKo+TVjeeCfGQd5AoLM/fhob0WjkH
	t4W5OmRhvYhMFqEbePekOzKSolpO+3MstatIk9mD8DU8XC8g5Itz4Vagb9rg5cDylGSpQGktV6ELx
	sF8m5DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGR-00000000219-0wk6;
	Mon, 03 Aug 2026 16:11:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGO-000000001wW-11bk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49553515a8bso36281365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773498; x=1786378298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hC6MJ8bwLjjZgLx3/Q1ZtCKaKlgeak/LeNvekOVJvKg=;
        b=B8xbeQo1JfJR/vH//GSKFE55Qd76REqlTV9cvzdN8ISymA+qYwGLCmhL5n36aW99mV
         iuKUsd3CX18ofU74lX5ab+9I+KWX/xfG6+kIRwOFKOfpCDsuHbm3U7Zh9zUXCTG1mpnr
         ln7nSkSkzpzZlnlIm85NlD1/FvnC6uE+7np4Kv4doXc31i/XUDlpsTktKYMVQ5tsatVx
         2KhAtGlQHCAqxeEUjXkbT45DRZMVM2G1uEYKTXhktM3Ig1VH27roHJ+rmuLExXo62l5r
         ZWHJ8jp9nj2IvXamaluDBXyuG7LAcFX3yp+PgdfJUhqeWPSHw+yi9jAfUmsQVR5o1l6i
         JIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773498; x=1786378298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hC6MJ8bwLjjZgLx3/Q1ZtCKaKlgeak/LeNvekOVJvKg=;
        b=YygwL1dReskqtB8t6wo4QHm1vykc8DWjXQ0npx+ynVaMx4ZqgUmuXVto57EfE92ru0
         uWzKSg0sgJTkyxbGFHYVJG+T8pxYeZqIsT4y2S0QuyEKoPyDojCOqZ/2F+5ojvJd6baO
         euHrcHD261Oc4+0avAn12Zhdwtc7e7rdAk4t8Il0ZU/5zyijxVPa1Q3CD+jDjWLEZgG/
         0ZLntvf+FLEl9Q94NR90VLj2A5yTepiphlYvdekXDMHvlE9BTEm3CkAKPS4enF08fXt5
         TeBpB7L2zowTfr+FBkXybmDQfDOn2D/UjcvGjGHr2F+8c2KzsNIvBy541YJOdSf5ZpV7
         dIBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE3hpRmCCxa3ItOay4GU4IBk68qGtw9wk82jT05Ud2u4lOqXZIf2Fgj5ZyUz/V+gGenHQGvfnZJqkDmVH3ZHuJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxmWaSoW8ZyP2Ily/RTtbzOnDa56F7q8C0reyBjshgKAP9lobvw
	6Y+2LYITSvr7yqarAutQBB9WFRk3jWlADD5ifVDbQG9cniaDSTDm9rPL
X-Gm-Gg: AR+sD13bdt3sPkxmerbpJO+LAYGOqShOFzAwDEk5TBsTnb7EvBblMr3zYmf6przV8nj
	+iLbq5/wJvuzgcU11AEZi0rqresa8+WTdsyIKNFxgpNiCDJgrkqXqoFOz+e8NTGmaZeDkOlFBPu
	GYeu3CHFYmBgMSSxP3IsZXTMpCa9oFn59AKDHxxqfbQhggaUmT4JKUOpEWdlX4r45cc7SVD6D/z
	o2wGpSbEGI+QjElwUXqDxI+I7RRnM5m06k+NEIPnIlOh4YflcxHIqYHc5wx/VlOiwTeFye0M/E1
	+gb1XKTStGNHWuENnNsfYtTSmN7IN2hIK77nfFWcyGC27w2ar51WfnmFCMhfwHGkQw/cm5coeTT
	gJ8UiedtFOxgD95qBsHLF9d80foeosoMw20s50XwECXHXJ2XU93kxKn4Vq0mXul8iZWt121A5aM
	WUxt1lAhvLocBajLMd9iphwgri8BwIEbCtQoXtUrgGYeY7nhKSJyJqGMa2jG3qxqN2KZlw9UY34
	E2BbgnKC58IdHWi6342ibmrCtcteoUs7zYt1wZkCaZb5Nbvf0P7htIk6DQPFGunOHALW0JlqE8n
	MzARC9iigSvgg5HLc+eR7Zg2fxm99M+qZmzxlmZH3lhfXFg1aANATki6r/xUOU9J+adTXrYT3KM
	fPsHMfCgqXvUzgWlq2ss6kK/zSYyby6O078WqsdsX18Ghab7x2PlNMeZsxOZ/c0yrz6OASFZcJ5
	gjnw==
X-Received: by 2002:a05:600c:4e8c:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4980c66c82dmr193167225e9.1.1785773498389;
        Mon, 03 Aug 2026 09:11:38 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:38 -0700 (PDT)
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
Subject: [PATCH 11/13] drm/sun4i: Drop node references while building component list
Date: Mon,  3 Aug 2026 18:10:49 +0200
Message-ID: <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091140_298092_0BAEE0B4 
X-CRM114-Status: GOOD (  13.66  )
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

Two references are leaked every time the display pipeline is walked:
the output port node in sun4i_drv_traverse_endpoints(), which was never
released since the driver was introduced, and each node taken out of
the endpoint fifo in sun4i_drv_probe(), which stopped being released
when the fifo was introduced. The latter is still safe to drop right
after processing, since drm_of_component_match_add() takes its own
reference.

Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
Fixes: 8b11aaface2b ("drm/sun4i: Implement endpoint parsing using kfifo")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 8a409eee1dca..e9baca360160 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -289,6 +289,8 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 
 		kfifo_put(&list->fifo, remote);
 	}
+
+	of_node_put(port);
 }
 
 static int sun4i_drv_add_endpoints(struct device *dev,
@@ -394,6 +396,7 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 		/* process this endpoint */
 		ret = sun4i_drv_add_endpoints(&pdev->dev, &list, &match,
 					      endpoint);
+		of_node_put(endpoint);
 
 		/* sun4i_drv_add_endpoints can fail to allocate memory */
 		if (ret < 0)
-- 
2.43.0


