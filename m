Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2799C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+GVQQEW/Nx5/3Tw2jXG/FjfLcvR6Pq+aehkGjHuNLA=; b=3buq1iAP04z8tGLggXM997MiK4
	g6vtHpyhHPRkV59T1WQ4QE5mibnhVIwP43uW0Fs5RFdFc4dX0Msr4RIhjSGm6mTgNV0XX5Tv0nM9V
	j4v/6SeyKFD26JApPAGg1L+I65P86DnK0jajODjLB/aMOGO0WdJv7JPNmOMrTJW7zw8qfzIl5IdJ4
	88/yZ58qcf3WHfvxB+Cl0ZIQ/4vkNtBMt6j57/vh5dx1ilvvoqffJX3Z+G5/nkDZqQTDNdRRCrqII
	t5f8RbOBMf1IDx+umW3hUWEfEsp3Fy33yj6y7D+deTKw8f/ZZPgBtUqUB6L2o9hbjDQGnrIkj0ynN
	z+yWfMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbN-000000045st-3h6s;
	Fri, 23 May 2025 14:42:25 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe3-00000003zNj-1sDg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:08 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54e7967cf67so10657487e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007666; x=1748612466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+GVQQEW/Nx5/3Tw2jXG/FjfLcvR6Pq+aehkGjHuNLA=;
        b=gDgyf9TvUCqcy3D8zfS8eYXXdF2ECryD1rYQJ3JRUB+1s8pb+bm5GFtTK8rvxpJT/C
         jWmjqv0tekI30h919IyQcXonVJ5LHpImqjt9lfq3JklznFDJ0huyk/dW5yjCt1KT5PpB
         VEPXIzmPRz/a1+ovMtJLTiSO4cnvSzqQA22fe9qsb2/yMjW1wQnsa7UaoIwkIYBZzeKj
         vBLoBhUJ4BHSSZM1c4diorJN+E9XKXudkX8NRD2lz+e9dZh3HDnxm8XlYkj2yuEiAMXD
         37Px+B2UVQ3g0NL5RxsZ03b6O8pijMO6BplyXOJ1sgrDjBAph8Pf/Nn6VyZkSWdYoTSK
         e6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007666; x=1748612466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+GVQQEW/Nx5/3Tw2jXG/FjfLcvR6Pq+aehkGjHuNLA=;
        b=iQmY7hgPu9xAgjIOke6utiVnLz3fE8CSLZhHKg3DSqfUvkCY7+mbRZVj7MA9bc1N8A
         VND2vwuF92rnfTCGSkk67/xQjvfJE+GcusdIdYpHzpIMujZztZulAsiMZHnZEisf2V7Q
         Mv46BPq+vIacD/9j3R0UfbrPV4/xbNxoIWwWOnFMg7vv2nSPFsa3EHRBCxDskK3D1aM8
         tA0zBRIn/q78pPQWRxL4p+2+qhBy9QrsBVLyQ3KpoSGn3TCINHMMP2fhT/htdNw7Kdv3
         dRPjPuZ3zExcIqPvAj2qI5QIVxS0kG2lKEN9G0ug9tWoKNNcKP/QUQeN0XiQ1r7rXe1N
         3tmw==
X-Forwarded-Encrypted: i=1; AJvYcCVVPEthrogI/eUDLqgFCQor97LI1hrc8Bz31wVEu3Nqfz/HSr6NUwYedDrrw0nLj136ZG0GWV2vneuV/ggVnLPa@lists.infradead.org
X-Gm-Message-State: AOJu0YxpjL3uf86jXMj87sbNOKt0lzdwZ+Ehdup1+H64SxhQxYsmKmqt
	cprym5kcdnwxrN6MU/c0FLx20N0U6qOuNSYjBhjktu7knKJU8dFYBgxDkcz9tTG/zwI=
X-Gm-Gg: ASbGncsdZmgNOMu+u0O/xtZ9RVHcHCQYGBlebWllam/yOFRlFoOw5PIDEYQeagrYCA+
	CYPuGvR+TlbJlKUhvMoivXqdWGqkLKsFmtgDRQKrn1gyzvs5rH74ojnSnW9EWZINS/ZfhqB2r6p
	khOoSkcLGnaVMjqOw95ckeFbbsoCh6VNUILD+OHOxkG7kBLZCAWTJxGiRgOQt0RkPzVIOL2P6ek
	oNa2iPNZcvrY8WtgmmqoaMWoNlWvwXN6zfKyaZXr2JGPiHCwcYT7wxDe8TEDob7xWKC8++7s/Pr
	RtmGs+xhEd569Wx3/5522MFB+D6uDit4wZ9gOhFlocW2v7gQ7Gk8Q1uFKfjJD1dckUDK2jkwLKv
	AIqcMXMAdGZpWWHILWxcrSnbj8g==
X-Google-Smtp-Source: AGHT+IFNmW5G55PYYj6h7M2zKXEklVPMXRP8NGNgucOTfaGyaIHNIHj2hhtdlXQWdhi0wo6WcDpLPQ==
X-Received: by 2002:a05:6512:690:b0:54a:cc04:e77e with SMTP id 2adb3069b0e04-55216ec7d93mr957968e87.44.1748007665804;
        Fri, 23 May 2025 06:41:05 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/21] driver core: Add dev_set_drv_sync_state()
Date: Fri, 23 May 2025 15:40:13 +0200
Message-ID: <20250523134025.75130-17-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064107_486823_02020960 
X-CRM114-Status: GOOD (  12.27  )
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

From: Saravana Kannan <saravanak@google.com>

This can be used by frameworks to set the sync_state() helper functions
for drivers that don't already have them set.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f6ca813eebbe..fd4300e17b17 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -955,6 +955,18 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+static inline int dev_set_drv_sync_state(struct device *dev,
+					 void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->sync_state && dev->driver->sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->sync_state)
+		dev->driver->sync_state = fn;
+	return 0;
+}
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {
-- 
2.43.0


