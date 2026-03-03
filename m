Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B46EC1444
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DY+Uv5zbRZBrLkNEfOsAHSSzgZnf3SBlBifVwXPv9CE=; b=Ni/ny8/NteaWIM/VqP/Uzxjn0Y
	MPFB09wV8+9rLf6gC2S4y1/1fbvp11dC7uEhOc9+R89dWgx6YQrfqiK/CaB7L/jHoiBjqgweva2ie
	DRY7Pm6hfFzR6QTBP2zV1JfKEXJeYVYLokT4DM1K+Rt5mevvqjCa3/X1Nten0HojJ/aThfoPyul6p
	mqElO0tC/fZz04+rYLCdL/LDdZWVtFqcusmPQ/X40zR+AFlRXPXRgoc4UWcjyUiLuGV6vp3yZhlrP
	/J17A4Q3x3Oa1JGwt65VfncwlRrncED2ikt0A3L7N17brisQW0OEFcfqTvALJNtkltZJyx+6Rcb2x
	bF6GALSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPik-0000000FD9D-3MX5;
	Tue, 03 Mar 2026 13:23:30 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPii-0000000FD8E-2P4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38700168abaso27385671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544206; x=1773149006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY+Uv5zbRZBrLkNEfOsAHSSzgZnf3SBlBifVwXPv9CE=;
        b=V79zHJGWIod2bY9lZhCrluX7t/erKMrWIYN7QQVkIRMZHSAVGs+rI7dSXhRI7326QK
         U18rvoX+o9fROv0w7J7+dU4cPrald2Ki0/1A9qJZcn8DXrG2/2zxcbznwr9glRn/gG3o
         H9O3EcEXK16biOUfWWjxUEeSfvSOK7/dHgelsyDLe6xIQ2pXV1h6mNjgj3k+6mEuSuI5
         j0YHJjrqzymaJLyg1kei8ci47xJGeWKE3/JYaiRS961Wd4R12a6+k+daWKzsdfoq6COW
         2/vjGkscfVh1aw1r7uQxzbWr0IiQGWlg0qzJIMf8Ro54R+aJSeBRuSu0n6L2G3SpADmC
         PvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544206; x=1773149006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DY+Uv5zbRZBrLkNEfOsAHSSzgZnf3SBlBifVwXPv9CE=;
        b=tbMX8SPoRxfqIxdpBxPhmTQO2WWIeJl3tXXODXiFPlnjfu9RuKS6grigGrsWrcE5/E
         usjkBkzsaSmpvJzxrhLedNwmS7xPzwNvQ6aio/ihbfV4MW7GhoEhZuRKXVX709mj7wJP
         A+gMHbSCdlhJo1fUaUU14NhlbjAhmUW97LQRm66frQkfQ3JI8fYaNl4o6IGjOTs3v5Mq
         UG4hlYYcC6ihAclNwtrDSLLpCsjb6F8TaxCjWC7M5dXzVGmyGDeYIe0f8g5S3Dqc5SRb
         f3dDnzh3itctCcf7Cnz3EhFGJyzkMfbwGOica3PedVEvgjYd3NO8EqHX73vQ4PzXlddR
         2XrA==
X-Forwarded-Encrypted: i=1; AJvYcCU35TS2Mc9Z679EYxhjtc1rkmeBK/wcZdAyzFj7MnXhoNeISKlU1wZgfKlcXKAkgbePbTPV5zpCWHqyT9Tuwhao@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/O7K/DnB+ulsiDoSW+WZEySOGj58bMGWd/uXxEMPtU01I2YhN
	wklXK6hFC7yNwcFSQdosbVvd3HJgSrIKl5Q0D9Fd4xC2Gk4lwMB/xgYgBWlgqp+hxnw=
X-Gm-Gg: ATEYQzxDimcx2g/Nmr0ZdUfthvhV/6n2ZPoI7V+0u1N/IR7gnmVGWlvcBp122FZWSEN
	W6ymXiLHvxhnIYSOG3qEGb0LmctzKuV+DGTlRpdw1kj+xRURU4AgSrhEfzQCCkkAtCmFlJCyXHA
	9uyVdCm81cZHSFoxC7BDg0QiQEhqSYoKz7K0VJ75VJbCf1ahb5ZhCzwy9oAjs0kz0StgWBiBSsU
	h+H2v/jZpKd+ymtjUE3EHYLjCUZejqrpCY8s+Kk555xsu5ZuJZSplCFtgV+pFuw9qnCLY1LnDcL
	MU7sjsgVvOLfzwMG8rK+dnKcQAQHgd89oPPBe5wZCSFMbO4lTuRWzJQ/fkNqEEfnIR+hf2nOkxM
	BQN1YGDNq/anL6xIDI7EaWprTPjV7OipE8++RysWSx1xlNgmtaKDTAeyUgohco4nMyGs7iEXFTn
	4b5WKTVqESKCkMQyVS6TO/F64ZSfxJG/aRn630ylk4eh3tSItxCjMe5mR6rFTVHKn1iPbHA4U0
X-Received: by 2002:a2e:b896:0:b0:389:fd52:a1d9 with SMTP id 38308e7fff4ca-389ff141f4fmr91698381fa.14.1772544206259;
        Tue, 03 Mar 2026 05:23:26 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:25 -0800 (PST)
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
Subject: [PATCH 1/9] driver core: Enable suppliers to implement fine grained sync_state support
Date: Tue,  3 Mar 2026 14:22:47 +0100
Message-ID: <20260303132305.438657-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052328_641055_7E3A5F49 
X-CRM114-Status: GOOD (  22.54  )
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

The common sync_state support isn't fine grained enough for some types of
suppliers, like power domains for example. Especially when a supplier
provides multiple independent power domains, each with their own set of
consumers. In these cases we need to wait for all consumers for all the
provided power domains before invoking the supplier's ->sync_state().

To allow a more fine grained sync_state support to be implemented on per
supplier's driver basis, let's add a new optional callback. As soon as
there is an update worth to consider in regards to managing sync_state for
a supplier device, __device_links_queue_sync_state() invokes the callback.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c           | 7 ++++++-
 include/linux/device/driver.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 791f9e444df8..a262714a83b6 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1106,7 +1106,9 @@ int device_links_check_suppliers(struct device *dev)
  * Queues a device for a sync_state() callback when the device links write lock
  * isn't held. This allows the sync_state() execution flow to use device links
  * APIs.  The caller must ensure this function is called with
- * device_links_write_lock() held.
+ * device_links_write_lock() held.  Note, if the optional queue_sync_state()
+ * callback has been assigned too, it gets called for every update to allowing a
+ * more fine grained support to be implemented on per supplier basis.
  *
  * This function does a get_device() to make sure the device is not freed while
  * on this list.
@@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
 	if (dev->state_synced)
 		return;
 
+	if (dev->driver && dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state(dev);
+
 	list_for_each_entry(link, &dev->links.consumers, s_node) {
 		if (!device_link_test(link, DL_FLAG_MANAGED))
 			continue;
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..bc9ae1cbe03c 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -68,6 +68,12 @@ enum probe_type {
  *		be called at late_initcall_sync level. If the device has
  *		consumers that are never bound to a driver, this function
  *		will never get called until they do.
+ * @queue_sync_state: Similar to the ->sync_state() callback, but called to
+ *		allow syncing device state to software state in a more fine
+ *		grained way. It is called when there is an updated state that
+ *		may be worth to consider for any of the consumers linked to
+ *		this device. If implemented, the ->sync_state() callback is
+ *		required too.
  * @remove:	Called when the device is removed from the system to
  *		unbind a device from this driver.
  * @shutdown:	Called at shut-down time to quiesce the device.
@@ -110,6 +116,7 @@ struct device_driver {
 
 	int (*probe) (struct device *dev);
 	void (*sync_state)(struct device *dev);
+	void (*queue_sync_state)(struct device *dev);
 	int (*remove) (struct device *dev);
 	void (*shutdown) (struct device *dev);
 	int (*suspend) (struct device *dev, pm_message_t state);
-- 
2.43.0


