Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDF8CD37AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rFfqTD2TBGaZTLksk3KUxZXH9uYFCtiZXBW3shTh70=; b=fof2O6S3ZiCbbNUMlGpUKsRjJm
	9muksKQNlrpv8L8/TpFFz7iny2xGqqJuv7W0KpLZsDW1n+WpQZXKQQIr1Om5iIfmArZIMGGh7MlWY
	ei2Bi1jRun1bzRke0g6VH+BhOx6/kr73qE7VGobu3kSkxlYSjJs22PzqR1AswnvciJvn4IPpQ6mw5
	wxyTYDko/9KEvanzsAlqLju75IVDkYVV8Q54yPfP4XwU9q2Irs/oCRnklo5yqp9emmQ+nwXtwn6Ch
	iDTrV/NLkneLE0G4xqAi5On8QhWj8/RfQ5AhC7lyvyyMEP7lEkis7ZnyGAZajOe4wBM5mTPLG/iKI
	hxlU9NrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUN-00000006T4O-2qwc;
	Fri, 08 May 2026 12:39:31 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUG-00000006SxH-1YjA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:25 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-39396f873adso22281381fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243962; x=1778848762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rFfqTD2TBGaZTLksk3KUxZXH9uYFCtiZXBW3shTh70=;
        b=GIH1jjJcbLNOM9tlkZEeETsnPQXz5W6EY4e0chL3+/6G2z404woNT9h+RjIvHF8Eae
         7MjK+aFyKSZfiVH37QBqiuTJ48qqKLTgWVNaYtRMkYKpxF/42ydhBLrJfX2+1+duOKEt
         TR8qKlUdqCQkH362WYjJXUNpQlF32JVQQD7uLb6REoqeFsWI26opTpQFTsBqmIGPoVsS
         qgZ9ERTiCskfxcPt4BWdO7kAHNOoVJRKqEc0nkmYgJibK5sPyK2pyL45SOtDRYEJACBt
         8gto0lMXMz0Xmid8wXAltzcfHFSOpZ3BrqJef4ftKBSXg1I+Vxt9HQBi2guqHVkmnGs7
         GVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243962; x=1778848762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rFfqTD2TBGaZTLksk3KUxZXH9uYFCtiZXBW3shTh70=;
        b=rElRaGLeg3AMytuV0y5L1KWVUYLCctCZLdyGZBn/etqhgS6zddrPv28aXjAuHSiSkY
         sDRI2fgHFBnsbQi3MaEOqIJi+pX6RaWHwxXLNS3412DyCA+FDzsdnKRBcu4w2x24i2Wp
         8+FYwfyMNa2wpPkZcM0gZmD432lJlsyifXUJtGC/2qEsHEp3T1IV8pdhKpugHWl6Mhbm
         RuaFE4WdQHjxcQEsOrvzeWa21Ax4HLQMt1ypAOfxzb/L6qw07pxSBWP4K26yhNM9SsDC
         5Q4it4KQuhOhyOiEjwJ0KrHJxR/0bkqC3zuj6abH3f6+TAdQKaDStBKE3CFyeKypsyma
         jsTA==
X-Forwarded-Encrypted: i=1; AFNElJ/uEjhQKRXpmESrN0yvCA8BBtI4IJaR+kq3QNEk+xpMYrFhW+xONkFWCLMjj7gIYMuy4sxq6OGhAZ1Y4eOtkgt7@lists.infradead.org
X-Gm-Message-State: AOJu0YxJxhlPV5AtPeqEI/idsd3gLm/NUKo2zyEcBO87nTbhZI4VnfkU
	jyog8pl21tuPfffbW+JpdxBxoUvTpfewyrwtvRCLzBnStKQcb1xnOuFz/jP7QUC7v4w=
X-Gm-Gg: Acq92OH7/V7qpiC714fVK1d6LQUUeBbG5vQRxSP8kHqCMeRhe15QI7fNY6gblxzahxy
	MPt+fp0fAzkTNMAvQmKqLgwqBPsXjDAoT9kwjITLEFmFjLxjYjhHvddTlQp/9nALrHXtL1sC5LV
	i0iiTQ4ZA5uHwx+8QOUaLzFiYm4A/I5TGetRABNPewC3Lfz2UsF3PchhL6ZAhkrPX5Rvif75XzU
	g1c94907xPBsrqPap9uUDMaL0EUi9IiEpgyOdrSE4OQFncGtoPPDBNzBECUSwEOFMfOpQi5V/oJ
	UCSCiOhkkHQFpCGdu/Xts6DO25mRccTX6yMuzpfbYNTRU7QTQicG1FMqO3aR9k2vxlC5daZnSBU
	7NBfZadj7GdXI1lKUODjX3cZRu88dgFHRwtj0e5NxeVTXpL3P+/aGzi8NHuAYhdcqCSsAZWLnOX
	pHBVpcKFnDTDrtZ4wRuZCftpjUNnJ7a4wBMNdhixUKjLEKE21g4dJjhVwaBLqY7AH164YEyP/A
X-Received: by 2002:a05:651c:318:b0:38c:6b42:3d77 with SMTP id 38308e7fff4ca-393c40ccf92mr30580291fa.2.1778243962364;
        Fri, 08 May 2026 05:39:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:22 -0700 (PDT)
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
Subject: [PATCH v3 04/13] driver core: Add dev_set_drv_queue_sync_state()
Date: Fri,  8 May 2026 14:38:53 +0200
Message-ID: <20260508123910.114273-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053924_430459_2CCC8E69 
X-CRM114-Status: GOOD (  14.76  )
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

Changes in v3:
	- Added documentation.

---
 include/linux/device.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 209feea8050e..e32f85e8d80c 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1097,6 +1097,26 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+/**
+ * dev_set_drv_sync_state - Assign the ->queue_sync_state callback for a device.
+ * @dev: The device.
+ * @fn: The callback.
+ *
+ * This function dynamically tries to assign the driver's ->queue_sync_state()
+ * callback for the corresponding @dev.
+ */
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


