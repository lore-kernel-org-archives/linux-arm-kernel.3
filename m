Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A29FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBLgNziettBNC+dAZgZIrrnObr0T+wTrJghaGzbU3RM=; b=AAN8F41qFW6vXzg+hyvsxYqeOc
	PHO5V6ItDBxkwFTjvfISclC0MWR5MUolq/vO23/9jxTpOsXo3sm01NuwsSgCBGdiL3Ax4MdQxJUWF
	kXRCaoiGZE5SyoQh5Vm88zFhGwYf6zs42oiF/wnq4s75ZwH1mEt8hqpWLT5tUcb1vmCV4ZKhwdib/
	bPDdQYhLIzehq67FDI0dDd3exPhDek25llVBP5lIWwtlvRe8NntR7GJWOc0EtC7uKNzbRY8cIPpPH
	v5+ja+7vQtQ/tkvi6j0JQkBpMOJE8bAQD51iiuGsyCsUXS5kI9V8pXFprwiKPtGZ/WBZelAQWas4d
	Eak6BtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QWL-0000000DNFD-0I3x;
	Thu, 17 Apr 2025 14:47:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBY-0000000DIko-3Tfi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso1055494e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899947; x=1745504747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBLgNziettBNC+dAZgZIrrnObr0T+wTrJghaGzbU3RM=;
        b=Wj3qtqzlWdQSygDxKRrG8xHaPwjxbHyhTAbYu9XjNc84Mqna8SrbcFUBskwF0uYxCp
         ElrDkmynUZQA+RRccl0mc5quISl9VoXmwjOrPZ+0jZKGVmy4FIwtR/cbWFv0WmXSxZZ1
         rL0Hue+htIYnQTgNuPJ31hItEnHwOSXlCfJ54HhVj+ILis9Gx/OJdUOGGZLyPzZDX4Eo
         BZKoE24Mj2lig2ueYWXee48FXFkVb/owGZvmxsTEQKqqaG7TWIp2zfx7aRD3kbQi1pLN
         cuaX7/8jYgnjOjmCqtNTLVcnroum8eFnubTlEsqbopvGoRnD5j2mtoRzR4QDCo7uvBPh
         Vm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899947; x=1745504747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBLgNziettBNC+dAZgZIrrnObr0T+wTrJghaGzbU3RM=;
        b=t0ET8csudPehyEkXQDy603z4UdcbiNH4dDFc3kMHv5pWsRGa/AYAFuABfyg3COt9Li
         9rXUPVQsQTGkdww/BGFF+mEVn4ZC/O0NgnITr4tA0lW5KhmOSjXyqnpiGLALHZDE/tJk
         7njrBKuVk0mMEumkN+iQdUOCzDyzylukZAONw/ZyQ1KRRMa2RSFh9CLlaLURhgajAbIJ
         Ea9c8TScDgM3KSqMhg1TmpdWKTi37/E6jADPEJam0E9uWAQm0M6Zehy8g4my6LtDvKUZ
         LpvPANqhdBh6YMsG90GdXiAGGJUpnjot1lkwA7/N3kPkq/lVtGK91zLOtw2r8aX3oW8j
         6HpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSQmG2U5OXd6AcBfO6FsgEi0j9bToIqG0NfJnn7ZkQhHI7GjQ796M+OMfCI7pxtoGRJL63YLLHlexwYvarA+KY@lists.infradead.org
X-Gm-Message-State: AOJu0YyRUeefrkX+0WfVyTYl70EeOYx6TeVkxKFId8C+AbtDz770kHlb
	pLizs6GL55NRgtTHcX24Y7Z3q04g7DqBp2MZwArU8f+RHR00mmDW3+GCIV/bkpo=
X-Gm-Gg: ASbGncszz4UtyX3WUuDEjTCV1n5w6Fcfx7Wlcr4DqXqEKxc4fWu1gaKLvXBz6NMMGdv
	MPuLFJCM+rzdq5uuP/99Ol/V7ULxIX84CFzGH26jdNGdFBjIpIwApFg393jdL38dVZbfaya9EPA
	pWY+5s6rGfyKHXY68AKq5/3yYMyXUTNdTiq/97nGv9aY8+JcxlTFwk+36HSS6F3Mlo2UKNfcwgw
	WEzZVqdAt/ekzr07iMLCMjpnhmT79TDdaIlidgNUDZaoiwhoUDwjhKRk3qi70cZHH3v/kb3ix4y
	bjRsS2O60xkQJLPHvDKP8Vij8OJM67yyjW6jBGsJvrGZX3mLZewoebkEGXXmJvARdxUduim65ER
	xN2j/4bHBDGILeCU=
X-Google-Smtp-Source: AGHT+IGdzxUvJDdD8yKezIscrWK2RHUkT2/k01YPoiwp/s9fHB9GDRUF1BZX1s3xswvvS2oLa5JAdg==
X-Received: by 2002:a05:6512:2206:b0:549:8b24:9894 with SMTP id 2adb3069b0e04-54d64aa65bbmr1947682e87.15.1744899946966;
        Thu, 17 Apr 2025 07:25:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:46 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] driver core: Add dev_set_drv_sync_state()
Date: Thu, 17 Apr 2025 16:25:07 +0200
Message-ID: <20250417142513.312939-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072548_866368_E8512EC0 
X-CRM114-Status: GOOD (  11.53  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Note that, I have picked this patch from another series [1] that are about to be
re-freshed.

[1]
https://lore.kernel.org/all/YG6lhT7vuiCNvvDg@kroah.com/

---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 79e49fe494b7..544523d48cd4 100644
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


