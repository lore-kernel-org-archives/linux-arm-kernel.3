Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026B3D2E9C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=; b=n9fYIGlglJPih6MnbXR2ba6PAU
	5Gdv3tMAT52VFut15IihIQvdL3IipbK/Ua+vxUbG357SMS11WUnCtTZ6Bjge1KnOUJsd1fsaKZ/wJ
	69FHH1tiFMOw1M246PoY1bfoRWOZ/t7VILfepl651BX/Bqo6XigRHURConb5Snalv8Zqw5h8957G1
	TKJgCuHkKnpCuf7Zjes8gwDB8vnwosG4UTgCtNjsRhvoxkEwRZElj9Sjj83DB0dNtLzC0v/GMjEgy
	NBY0GpDfmnE1bX0E7QUMt32AtL+KIdZ4pDkBiNcWGlZoLzp2aglSb0wAeUNIEYCqtbryn16BChHhU
	btIzd5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQP1-0000000H054-0z7V;
	Mon, 11 Nov 2024 09:08:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQNE-0000000Gzsd-3SFX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:06:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso723523366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731315974; x=1731920774; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
        b=hi7Rcl13cf4d8iA1I19amSvIqogciB2DDjQMPdiuJJ0JmsIwY0tk7gD0Lx34zqPF1F
         UtckLhk2rTpCOoXipESYve5NPo21VQaNM+OA5UfNRcGYA+fhGeiWO89oIGzc8Lb97cvE
         azMeCUfxmUtr4UBHIuXxNVB9n76G8kkoejVBsK2yVDxU4FK9L/P3RuaDTa+uEhdzmHkO
         woTt5BYXFdA2dkL0HFNotHzU8GNGutfLm6IvDZTjYIJ+5MZk712eWZ2WsH2rgQxkDdV4
         s9ig4qODqx4Dn7d1S7IoMfEnSz+GRNgztS8f+twhcx5dRco8RbqE5ToTTzt2rwlRvmWW
         iaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731315974; x=1731920774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
        b=GyHZjEwDlM/FQT87H/tvwNV608SfSMS8Uv1Vp/gBL9K5ADAV9NpEJ3hKZKrkewds4g
         sTt0SoNK2W59FnhiRGt0GAVaTKQ8jdBZuaJ9OfMW6I34YWbwONVOOtkJblRnztqSS1r1
         m2E34I6zT0i0+vRnKvxGYJAWazg/wu6hLtWIWg4Hux+I/eN950UYGhgP36y0mYHNadoH
         FTU+6OBTDdWT6rbvdHkBCMbvaTjKC368onqOPjQBrZkK8R/pL+yeEkVgXkf8z3FuwZs3
         7Ibtci2ZTeT27LMKt67gEX5AT7zS6xUqMcf7dqt7xdMq0XKfCUnSU9lKOfDfgIB/yZdo
         e43A==
X-Forwarded-Encrypted: i=1; AJvYcCV1c7OXwTmIgOtNZVvEiONz7jgIyPTtGb3hro4cQ3jVhoRKA7X9GFpyCxCV8fA2cSknY2e0IgcFWcDiLj5SfUux@lists.infradead.org
X-Gm-Message-State: AOJu0YxDt5FQb8gBZgf+FtmAldCPOdPw5TQzIyAAWa+ooCnuUB4usw7W
	EIAceuaj9tWnCu6MUcFZbl8h9IL69D83suEN25Q5blgdv7Hu2H6IBmfoLy8ECbU=
X-Google-Smtp-Source: AGHT+IG01DvV4fVYHey4p2gLJdP8gIwgetBzZShx8jJbLbuJv9DbED9jmrm294gcWaav324B9xGGuw==
X-Received: by 2002:a17:907:c15:b0:a99:8a0e:8710 with SMTP id a640c23a62f3a-a9eefee6682mr1056624666b.14.1731315974411;
        Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b82csm579023566b.67.2024.11.11.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Date: Mon, 11 Nov 2024 12:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010616_904656_20341D7A 
X-CRM114-Status: GOOD (  11.75  )
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

We added some locking to this function, but accidentally forgot to unlock
if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.

Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61ee88..0bea908b281e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dp->dev);
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	zynqmp_dp_disp_enable(dp, old_bridge_state);
 
 	/*
@@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
 			ZYNQMP_DP_SOFTWARE_RESET_ALL);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
-	mutex_unlock(&dp->lock);
 }
 
 static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-- 
2.45.2


