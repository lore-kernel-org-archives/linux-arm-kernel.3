Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29EDCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZZm1gLHrIJZUIiM9XL9gym+JUwXXpMXWNiMLD+uRZ4=; b=xpjmDIzH2dQUaYn4SSdWlo2uW6
	XDViBstwxhsve/g8Mx7DYMOcMte0NGcBHMQZS0SWkQQYv2EW3ajz61IWyMBMRrYF6vfae1IumaCIQ
	vNk7MRADyD2TyNb+EYYghWEjhFjyOKG2na9/sbntgZkH4BZaXidEvWYJN/7Js3cauUWNC+5YEl+Ul
	JEJydp6bSWX7TzhOyj2mdGWGQarwpFbMnKhfuqvCCx6prIUXTMoX+XwttwfQEilJ9F4ix9HAZVBvK
	WW1rZZe13YtsV0MTVk19Z00/uM4F9ebw3TDcMGCpLc8pb3xlrenbkRKY1U+gjbGscVHqb23bmXotk
	qrwk9v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUH-00000006Sz5-326M;
	Fri, 08 May 2026 12:39:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUD-00000006Svh-0Fpi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:22 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38be5e86918so24419811fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243959; x=1778848759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZZm1gLHrIJZUIiM9XL9gym+JUwXXpMXWNiMLD+uRZ4=;
        b=io4AVmriyO71yWFqY3FZ5PmMwkDegAHeU3L4L05ukLc4c9GfgAw6hSQaL1WG8V/ORO
         OIojy5kUQp6rmFCSNM9tZxg/d3b0/smHagI2qiHtW1IYYpy9eyljN3krBSOtQvIMSaUC
         al/yb1azuzqeztmLuHgbjdT4snDTMyDT1Af/2Ya2LtLoano8FDzKrtdPn7xZw/edy6cT
         UsJqLhiLUDl9/WA00RLfmzPleAJARZVzg1aEblhFzb6rjfa0Tz/ekO4kf9sbvn71t9Io
         pF80zcspP1/OTrQYx5T8HpfvBwtJXuMidoLuWzQ25j3xjoam+3r6rZbUW5O8zRG8lFR8
         jheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243959; x=1778848759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZZm1gLHrIJZUIiM9XL9gym+JUwXXpMXWNiMLD+uRZ4=;
        b=bGa94KqvaJNRv0Pu2F+NMgaS28Eta02JDQxn4dsZ+u651flkjfC2f0wTxb1v9v4Dfa
         eSNUKHhULRfOMlnAIiGbDDJ1Kb/CX/dl+1lg8akR4gpuhhu8SiAjYV56r/1QRxRVHTnO
         lidIFIf/JOCjV7KC2uKnA3zicXul85OMT5EFs4t0wP0bNP0Lz9VkGCZXqs9ZIpXvcJ2N
         0OvIvSGD2wwHaHWFowvPbubVDm0Dn4rZchxTlI975jSx2wz4cmQqaAjUihrs3x5wnGz9
         obfDrlQ34HkgKP6MDLF/wLe1yEbGlbXyLIEU3j3UFWZ+je8PNt4VJQfGF3/uAse+8eFR
         S+iw==
X-Forwarded-Encrypted: i=1; AFNElJ897bt3rJFM3kjDeWVOkXnImsJRjxG84xHowa18ZE9tfa/9F0gdreBNwusUvHePRrwhIWiHhNxINqh8JeHHzNu5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr3B8oGCeptlqwYzVw1kfcgowbeaf9oQvdCp7k7Ze81ui7Nvba
	sOH7oLRXpKjrsrCUjF7eTFZyrTs3SYnngMB7AZVAVXQHk/QH/dBkOZtM4dlD/V1JaJI=
X-Gm-Gg: Acq92OEZrFbAvMjmkhgkQk/UCx2EkjbS9UdYnUqpO1yl/WGjIplYyPbWSpmGNJ3AuaW
	WCwKU5tnIynXypPahs6c1WHaLk/R8egCGq3Xsduz+AFH6P1XNZhb+Xbm0vwAFYReChodA8kz9bR
	Rt/sTphUcHQw4+UyqYTGqFZhS/gwbjvoXfVuKyVWHLM3QBukfmN0PKognYsucLjYYFjcAf02JRk
	8vytFTac82P7itmAaEoyT9mUewioEvQT366tvy8Vwhdyvj+FF09JGrClgSbfDA6lMGqODsl6wgW
	muqF3g554z1PMC4l/Cjt7H6X/feJRx8BTkvLQET85oOM1qW2kFz4ZUqxGfuTVei0IUNefcZmShA
	NgU3tNFOAuKmE4KMqcT7z7UKYnz9+Y0Mv1N8CwF5FUTOZJhStyZ92xq0MbJc4XQUymoYV15s9SR
	VxlHawdYSzTACrYZdeR6mWfs1adfzzpsXpVLUMPwn6QjkTBmxIg7nRn/+RUzzEM/KeOgj47sdy
X-Received: by 2002:a05:651c:1050:b0:38e:8411:c304 with SMTP id 38308e7fff4ca-393c41c6deemr33966421fa.16.1778243958791;
        Fri, 08 May 2026 05:39:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:18 -0700 (PDT)
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
Subject: [PATCH v3 01/13] Revert "driver core: move dev_has_sync_state() to drivers/base/base.h"
Date: Fri,  8 May 2026 14:38:50 +0200
Message-ID: <20260508123910.114273-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053921_112419_782BD629 
X-CRM114-Status: GOOD (  13.63  )
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

It turns out that the dev_has_sync_state() is needed outside the driver
core. A subsequent change to the pmdomain subsystem starts making use of
it.

Fixes: 9db268212e0d ("driver core: move dev_has_sync_state() to drivers/base/base.h")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/base/base.h    | 14 --------------
 include/linux/device.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 0ed1e278b957..30b416588617 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -188,20 +188,6 @@ static inline int driver_match_device(const struct device_driver *drv,
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
-static inline bool dev_has_sync_state(struct device *dev)
-{
-	struct device_driver *drv;
-
-	if (!dev)
-		return false;
-	drv = READ_ONCE(dev->driver);
-	if (drv && drv->sync_state)
-		return true;
-	if (dev->bus && dev->bus->sync_state)
-		return true;
-	return false;
-}
-
 static inline void dev_sync_state(struct device *dev)
 {
 	if (dev->bus->sync_state)
diff --git a/include/linux/device.h b/include/linux/device.h
index d54c86d77764..56a96e41d2c9 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1061,6 +1061,20 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
+static inline bool dev_has_sync_state(struct device *dev)
+{
+	struct device_driver *drv;
+
+	if (!dev)
+		return false;
+	drv = READ_ONCE(dev->driver);
+	if (drv && drv->sync_state)
+		return true;
+	if (dev->bus && dev->bus->sync_state)
+		return true;
+	return false;
+}
+
 static inline int dev_set_drv_sync_state(struct device *dev,
 					 void (*fn)(struct device *dev))
 {
-- 
2.43.0


