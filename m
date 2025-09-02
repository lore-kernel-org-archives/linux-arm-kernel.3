Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F30CCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=; b=gt7JceJ5LP+HqAKp0O2ghPcmaY
	nxOUPQey77blzDCJbHP0Glvwp/V7l9f8lKJHqKbiWdGlCrj1F5uZR7tdKt+F6KZRnilqGQSz78Q+u
	uBQGxMWBuEU/uwa/XNWL9s135GlAupC3Qi2104v4bz4SCynEHiK1J366GI4jj9k5b6Qu4JUvtTH1P
	qjcRWsaI9XxxG/i4mdZIY1mfb0zRIV0INEqam6wTV3VePVQO0xfQyuP7uorh3Ew7aiWeA66lAtCDm
	cWF2zwdcS1cknVx9p99px8NVfTA9WIYy0xGo2FCvYci0A/1I3z5Rrh0d/qjqdRDfsiVh9HktwF0fa
	GWHKpBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQQL-0000000HPxH-283E;
	Tue, 02 Sep 2025 12:47:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP4E-0000000GtTD-39GC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:20:51 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-327e5b65e2cso3290400a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756812050; x=1757416850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=iMUpcmEJbq8CqZYjQJlZDEi/w7U1EVpTll9XG8Fl7TAnMLYSWLnlw++N33MFJYB6c+
         FTUC+3hjzROmFP0eJWI63fUPr2P2FhcM9iP0B1hQfogeIzxIZJIGZ+Ql52nqcTFxmsq+
         rE3k0T+N0MLo5zt99p1I5JgHauq1UZbjs140c4Ds96g96kKYtcfel0NFHei/d5FZHXJq
         F1iXs+FwD4WDNWKdtMmAEhfw90fDg9WldakfCgRsNgKmoaobclaiaL3vKhccUt+tP+aH
         f16Fn5MBhhuqvpw7pkTjF9GqzCte+K1QNe/5JR/eoDZX32LWdUSeT/KeHVXZ849/0nbe
         AR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756812050; x=1757416850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=pw708+ubAOtEAwPHYDi0DOQ5Gxr7OiVPEMjeOIrbKnYsKPZQ6htQUD7Sa4UZ5ocitV
         KKEaDbXvlRp+slZjrjzovFih6LbWMIPhR/+WAxz2LzpTEsvGMwQxjMh7dq/KiR3mBwjD
         Xh3CSj+vbJZQI92OAMjKAQPTDUlbogHU7wGCbrPkTjOdktsacRzRQhqd98ud1Ifinie8
         yr6KkS9HtEaG59LiTPIrCv1ULyrr/RsuaWRvfBDynp44ppLi9c+pJFCJZY7pLK9Whb0K
         T4dL9TErClDrSxSCt12Yy6RJgeeMSNiAO/nKXjnWpp2JAgAIJZvwxGRofgU9PfQOPucn
         Lydw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCL6cMvG2ndhjBFYaq8D+22GvfIcNKbkAoMu6WvyhjFNlJfiYcxAWnAWrJvWJ4ia641A0iLJRFamyMVvPSCNr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1rDk63+d2u0mcmegxvGWX5t5CZPSF/FuaBpCaFEa64WgH1VYs
	6VXILlHw8PzK0JJ5dMiHOK8A3q2/8hiBGDzRP7ucmSt5ll6qW+WHbiJp
X-Gm-Gg: ASbGncuNyI6H72B1kStE4j6OFp7aPcx4zedbsaBJZ1eOethQskfB9ozT26N8KB0W8ko
	v7BC12xaSryh8yIuvLtpkDo997L5IZyH5+IqL7VupmT5xPpQ+VIXtIjtgRWufD1sj8D9xqSPXsB
	1Z6dQ1AspQXUXf3t4O8nksXoseMks2wimtpc4fidVNdmasmlmECq9p4QOWap3xqMHK93LcI682o
	ulUGcp5y8gAX/GseL3y8MvA8XrP1azSrA8ysX5J4jG/9sbQiZD7imfESeWKdBciEdM1T41UU2sp
	Wg9Bw1d4L5OYBB9+uq1wFFuuhKKQGl4hdfidX3v3QRYfptEBt+e2U9UAAMB3CWgiGsCDNzSGPZ/
	TvxAj0L6PjdmOTtATK+yegoc24XklshE/oTN8Exg2+FPt8BASYrJkrsXaCY5g
X-Google-Smtp-Source: AGHT+IHqll56l5WwIcczcNekaKIeM8kqWc+lVcX2zUeUW87kRMBHk1t9A7NrrAy+78FiIbnJ09AbDg==
X-Received: by 2002:a17:90b:1c06:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-328156e3774mr14270847a91.33.1756812049828;
        Tue, 02 Sep 2025 04:20:49 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:20:49 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Tue,  2 Sep 2025 20:20:40 +0900
Message-Id: <20250902112043.3525123-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_042050_783105_8C773AF7 
X-CRM114-Status: UNSURE (   7.90  )
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

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 64 insertions(+), 11 deletions(-)

