Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9ABEC143C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrTcqboCNhMKSZmhSq2Q2fHRWd6h/WAqYEJUXJORyrA=; b=Do1WNVj7ni/N4x0C41kGSE10BX
	/XeZI4KD2/7m45FzOG6plLlvutt5UdrHb/oTn8xZEhnddSkAwUByzmmcXwbDncb7fpTgnNxYMaU3h
	n4s7tlfN6KoL4CahBsorSEm0AAOw0LczH5uiV9+ClCnAqqSIK5rISPDhHqSvIcNzHCSenQTot6pp0
	XPbPAD6E6pZgkl6oBJjUB3FYDkFtyPc5g49WuKoHxoFVgVmA1ev/CZKUn9n3dDE7Opxuw/F29fe0f
	zp5+0ORCxRll7D0GyduD8KAncPAzKuoa6XNpwt8c553M82N07dDy1WbJ63CD92foLx1WquNHPz4EX
	Q7BcuAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPin-0000000FDBH-2dgW;
	Tue, 03 Mar 2026 13:23:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPij-0000000FD8T-2x86
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:31 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-389f9e70ae6so96052871fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544207; x=1773149007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrTcqboCNhMKSZmhSq2Q2fHRWd6h/WAqYEJUXJORyrA=;
        b=pUMiBzGDlvklehkndczYgmozVhNEi5VqMNMWDLb5uyy+hwLiCjyLJV0cEVBIFZhR8A
         Y44CkR5xBmMcjva8/8vi+NvB6hzYhUBNsKPgZZgaVp38A1Wm92M97pOvUe+GLWzMHV6i
         v7ZH9zZCbubNGOmtSmtHrhOwOV6htYycvOs223wafG/c84ZvxaTtRf7nH3tGkRvColXY
         k35Mv814bne0zFI1rL5QQUauuVWCaPWWxrZ0cs2oNR57lfAQ1c2yPZ4UNEhTLLBon1Rb
         CM0xCmQ3XWu84AzxeTyUlPH9agwWRpnwk2kb2iB5QS/jm+sRBaHne1fT+yLNEHiAI4e4
         X1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544207; x=1773149007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VrTcqboCNhMKSZmhSq2Q2fHRWd6h/WAqYEJUXJORyrA=;
        b=r8l/WbJ0ZGnaXGt8zTG+0f+3lHEyxDQPHPjFRrN/HNe0pfBcQgh3Llp64Gq1rF7NYJ
         3BdsWEQ37b1d509BE+g8HHBoOIOKelh31DAMMbYhGj7sK33krubjCLfeHnlcxXw8bg6D
         818PUJbC8veQy4XfPM7DC3LT9K6ws/j29vkZ+lSAYbHdDaubziUGvB+mxzmdI019kvy5
         BtZtTFUrFu2O9PW0Pn5aa6w3HClNbnJI8b684Zhn5bibSHQihyYoBGpvaoQMxwIr1j/c
         eBKPlQEPNmQJ5Zt/6R60rc6atdE6sx0PNrwJ7hr/8gTXG78trlRuABLMO/chsi8HzUNh
         jvGA==
X-Forwarded-Encrypted: i=1; AJvYcCVC7GshwLCVwE1Qw5pFW5c3IIv3qB5+9Z4w+C5Hk7gD2uWLKSm6wFr18HBt38i4gBdUVwxECQl1gk6jDhYX6+jo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx6GURcRMOTYjFUqaRIKb7GclWgJZ6cRST2S+v0IE9DY4dPseX
	EE35016n3X897e87ajyH+Zvp7yqA4bR0xoz9kQjQuA8IIQbm6SNhfKoxDzTjiPq9KQ8=
X-Gm-Gg: ATEYQzwQfiTgEjjUgEp+Yn6lLpB38ZND4TgQI4EEVYBbX+0lypCbR0SSLWyG5/iR5dh
	8Nlgzv1qXVNH95vU5Thxg1hNi33nPWoHmQJbdFq2c/dZoacHbHmYRgWCUDmI86mw9qhNSpmhn9X
	Wz94+tRqyernNXRlOYBB+iXCE7b7RQb/s0scLb4Xau+Gz44qIlXAe96THI+XlwBZjM7VzooMGbe
	ExS3UygOuv8czoglSJJQg6yZdef7A0zTu9+0sfKthfNNxfUCS0PnU35n+isBkYjshNL+G+kUZEO
	0S6Y/F6kSrxdMvuIs4FCD177bVfJ33A7yzFkKpkyGjqBTM9O5NjcSVAcOie6Kl+YkkB5HQS6bH0
	M9liEyvA4aQW24+VnKEjQO6BJ6qbCg2D8Tyq4OASxJPuTKJs7lgfFQeZ9PPVYDrf+soGz1vkY/w
	EIl+q8WW9HwmoPY7suTzNHDunH+GpdVPLGKpNlBOin006omD6F4/Yl+O4M0agsgmS7sROn5xc6
X-Received: by 2002:a05:651c:25d1:20b0:385:f235:51c9 with SMTP id 38308e7fff4ca-389ff363773mr101440641fa.34.1772544207434;
        Tue, 03 Mar 2026 05:23:27 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:26 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
Subject: [PATCH 2/9] driver core: Add dev_set_drv_queue_sync_state()
Date: Tue,  3 Mar 2026 14:22:48 +0100
Message-ID: <20260303132305.438657-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052329_759625_391D5631 
X-CRM114-Status: GOOD (  12.93  )
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

Similar to the dev_set_drv_sync_state() helper, let's add another one to
allow subsystem level code to set the ->queue_sync_state() callback for a
driver that has not already set it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e6..eeb18548ea4f 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -940,6 +940,18 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+static inline int dev_set_drv_queue_sync_state(struct device *dev,
+					       void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->queue_sync_state && dev->driver->queue_sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state = fn;
+	return 0;
+}
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {
-- 
2.43.0


