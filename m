Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA542CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqUco5wqhLucFlDbE4HzM7pJWTB6souJwvWVN2LvT1g=; b=H9iGmpOmVowcXySKFiiYaTV2jo
	FAZ5NRekJgtVktQrIJW4YvC65w0Wx+Z3IW6QoB7pZSC24yrOqDDmjp4QepEYHa8EtJcryiNEfmpnF
	XNZmPqPhwFdQScYUgbOaK1XymzCISQt6mVXfA+p+3DDdYycBdE8g7uoKakgYgISFOlV2Z/1xtfSpy
	6ThG8Bg8Rels77F3zFPisOkwouEt7qBrKhc0JxKs1PgULT8gLQVBLXYRxYUf800rOGGvnFkxuktBP
	UGBZ9/8zjHfQP7JQ/bYs05Iif8r7RjrAqRFjHX1p0y1e+CTIfFmDF+A2LqHB3uKLvQUM8scyxtkgI
	dcen7aIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUI-00000006T00-1APV;
	Fri, 08 May 2026 12:39:26 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUF-00000006SwW-1zUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-393da8f389bso17122151fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243961; x=1778848761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqUco5wqhLucFlDbE4HzM7pJWTB6souJwvWVN2LvT1g=;
        b=WE9mLczKRH3MfU1v4NBnOUCFsjabSKV1xujAVPslmCf61PngocFNqeRtICUlTTw0Tz
         5FHVdoHEKSxw9dJ5dY9qkO4jBjQQPb8Ebm6VIHfSrpNtuuS9sh1FbTsF3rFSmE7/g6fR
         H7otXLjvQ/UsDH0nDJM3RPeMcz8z0J7KwIBKGcu08OLT6X0HKZ8dB8UQMTB3vppx7XHe
         trEXhZTGyvXRKnYdGcNb2umWRon1oDV1ycdZrFKCuw5+ZWHq7rVxk95VEB3RJ2R1Bxvx
         dzBUgSbPsybKJo6UunUJWOUByGdD7389WgCGb1xUE3IKV1pKR/LABEfdRTwi1Nok8vGL
         XAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243961; x=1778848761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqUco5wqhLucFlDbE4HzM7pJWTB6souJwvWVN2LvT1g=;
        b=exWwNG+EDbcesaAwjEEkXopUeY+Z/H3uIr+bQNa1ypiuUE0ZroyBVJFvLoThiWct/Q
         x9KW6RTYzlxHhURycuzsODK0lGhHEHbsBV4WKJNYriUzLOMuwRV6cDmhJHzLcVxoG2nx
         fSYtVrQ4fGcc68FEgBc5jRxxpBR+LLiSZxdtUZYYxFkZtIiTdGjA1JDx058StHWdb4c8
         gfjhzSPgB5uPIlTWlFxG8Fwtfmi3Qmb1ziinKk1oIbN6UeYK1IRurF2X0wzE34CVKdgf
         PMyQsN//DkMqUKB72YNmcTbFgwOYPwxZTWIKbv5qQKv9OheWHFL7Em8ifgZ3WATuqjGp
         YZyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zq0BjsNtUFCfyVlxy4tv0Vnea7SQZm4nm0aRvotZ5pEsrSjLpaWcuJKW6ZpkzkkWukY/WCSeoy+TmqiGVhO3R@lists.infradead.org
X-Gm-Message-State: AOJu0YzfB5ZmNxBUR28f/kpFQs5a5FvnRjzmeVZiQS7NLA76+UFbsGQ6
	LSpTovfFbG8hMkwq7HzLKM0bOXROXTvuTWDdydHdhtCQXPKO8CMWA7CBGzsPNywrrYU=
X-Gm-Gg: Acq92OFSIhm74bv/udcESRHjeSpobK3o5htjabEomjVpVkqT0OWwQETjclHNu7QUqQx
	Q4pVKV4BocQyLTDjy/omIVHRI/Q0QVGdwz+91/8FmTRm1v/sQsvqNo2nbV8wCsZi4dwA6bQcnOE
	g9Zh3FOGEDJBUTMaUTe9kfZdkNe7FfGjr9LbbCJ3X5itL4+g7eNfA1mzx3lwmt3k5+fUfso8kCs
	8gi81oy5g7OBFBzVQunUCBbwLc4USX4MhvUbbxfcgTzFxBuUd+nP68LCr0PZs+98gEIhhm4dTRF
	DDOazKUZY4KLHTe1HJH5jOxTIBiDbTIeDEQbl6rYg+58UvfCo0J8HERr09vmtH+XPtEnu6j/Qrc
	mMtVOCDoqa0uDpSK95oWoI25DbybOEjwcElEbxXg+axWWK+DBkjhkuPq9gCbdaC5fAYy4qJAMVA
	zEQOsjfKje+dbsab2Zy1RzCgSVF+PT/cK5Pdfvf5sTbFFyfGeb7ZsaAp/hPQvdMgjahFoTHpZY
X-Received: by 2002:a05:651c:4187:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-393d6ddee4cmr27954951fa.2.1778243961174;
        Fri, 08 May 2026 05:39:21 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:20 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/13] driver core: Add documentation for dev_set_drv_sync_state()
Date: Fri,  8 May 2026 14:38:52 +0200
Message-ID: <20260508123910.114273-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053923_536517_B717696B 
X-CRM114-Status: GOOD (  12.59  )
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

As dev_set_drv_sync_state() is an exported function, let's add some
documentation of it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 include/linux/device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 6848b0a2c2d9..209feea8050e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1077,6 +1077,14 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+/**
+ * dev_set_drv_sync_state - Assign the ->sync_state callback for a device.
+ * @dev: The device.
+ * @fn: The callback.
+ *
+ * This function dynamically tries to assign the driver's ->sync_state()
+ * callback for the corresponding @dev.
+ */
 static inline int dev_set_drv_sync_state(struct device *dev,
 					 void (*fn)(struct device *dev))
 {
-- 
2.43.0


