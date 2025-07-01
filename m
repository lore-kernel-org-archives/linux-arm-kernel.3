Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FFDC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43h2scNQ+uitZ0AV9xVg9Lwr/uWGDBBW7WgZih3doCY=; b=ElzheCeXR4Zj1iAmcrSncihykY
	KXR4jtZbyTiiks8I6eQRWzObLGbI8peiOGmrQdRlDTm1+Cw0+vWtoZM1cAAwMo5OEYIUhBldnGXOg
	UMZ60oW4Ayk4NFiQm3yR6KDy4bgyz64UnghlVoaVHpjcwbXmQMCXbkl81jsfCnnz/tjDTcaaqUfEP
	5n+qaTKrHcyQ/T2aEPp1K3Ar4wuE5VBeY6T+Xngk8hBjytkpNRmgnh7qL4tMx2/ZxfXJ1Chn0HD0S
	OEs5ZgvuQO7689gx1aj1A3QQIRnrNDvyhwMa+VpiXHGH4izFIwh8CUPMgORNxO+2FmmkOXVcIWoE4
	4ceDH5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaFN-00000005Lg7-001C;
	Tue, 01 Jul 2025 12:38:01 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT9-00000004uqe-3jHj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:13 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6080530e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370490; x=1751975290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43h2scNQ+uitZ0AV9xVg9Lwr/uWGDBBW7WgZih3doCY=;
        b=w+3BjUdPQRVNr5rES9V/V/GW23sB1wtdc6DkStaI7vmf985rKyDlFxgJ3vKOJ4CbZJ
         HEMwCOgsbjgjmd3JIwUGn8VIoI1xffhGWsR70RSNbCuWP36EoAjfoC8Uc9RZFMe1Zu/C
         0A/W+1Wf1ae/mS92JqaE+INjOymIiqx0pQLaLbE2ymkzPcrDGpeAnu0nVudyb6QC3ac5
         66E0XUnxWXj3TpOkv6Z0rH3435OjjhIVksMmObdyOaoscdnLniik67Yl9bhX+tDotQsa
         zcaCfjTCbn7sbwL/C6WZWtJyj/NHQxo4JP+OUtRGJ5fDzZ3FMQR7GZ4HQbhcHJJaLEIo
         tM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370490; x=1751975290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43h2scNQ+uitZ0AV9xVg9Lwr/uWGDBBW7WgZih3doCY=;
        b=kal7SMq/Jw4nsDI+bDz62uzSFcogVxLiwN3lDdfQMX+b7zNGEYgfd23svPCpgUO/VY
         glIHYxXqbW0A1EJSyG5mpe63hL5XBgBka9Z435UBmc3YRKp29glc4KzrMDeA2cHOB4QK
         s7chU6+3uHfZ5UKsgxjOK9TMP53nNqsm7juwuupUNqYLSurttGaXA9TDOcWk6tAzYBU9
         9SrveCG7cMrndMa7bGPe054NoBAC3R2ogHTAIEICT3+zAqHzCsOCNmfiP2YRY7XH2JvD
         7JyK6veiiSxVTg6lb8VG1nmrVNtTKRy1GinXhZ2/GXebYHTNRaXGDj9DWhZHEtm6rxSi
         RL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFYKVzRlOM3s3T2nYNDBGjqExE7cnXhhBrxjnB2QKfdBe6jdj4m6EOZfcbFhUDqW7m1d8BTlCxzmJVOtlxSsIn@lists.infradead.org
X-Gm-Message-State: AOJu0YyVfmuVfQmhVu2QlXzBtfJiMDdeWL1krM6j5UJk+PWvi3OFyNvi
	bePZswBhbMWVQJCppGqHvM8m2mzaRdnzddPwzNLku7jt3ilY7o3dmavInk5JcVUynco=
X-Gm-Gg: ASbGnctqUKXDXW2l0e8C2WE7Anz6V+9nyy1VSmtNRjebahJoRmu/U3JCzytDDs87KWf
	EnVZmVhhcAwMI94zb/0XkbOacl5O+8ka0QVZ7kTnvefHsBpUG3RXbIVmD01QNNrUBTwCa3UXNEM
	9kF9UCsywSsC3mLkekVwb4a3RHut9uqQOgsw0e8eoio0L7mJR02/Y46R2PJCR5UIVcEXHEPw3yq
	kWiHKyXR0Mdia/cT/8zde5Uj+mWy6tkkTCWArzMRFK6Je2/j3eNyXriMYKw95XQOS9EoEUPmTo/
	jA2ZAHTuv3PbcnkuBrWdSSo1A7psv+SmQxND/BgG/PcJNfL+CbG9hrgdIrexJH81pJSaDrM5MaH
	4lnuBAoTykvBxI1rfheRxhbKkk0PqOEsQP8jUqvETXesgC7E=
X-Google-Smtp-Source: AGHT+IGXZRw5n2EKVnLe+2fkx4wCE8kfUrNq7rzEqUs6wo71t2rUuFE+PmpyvT/+t2Fo2UVrlV2cCA==
X-Received: by 2002:a05:6512:3c92:b0:553:3770:c91d with SMTP id 2adb3069b0e04-5550b7ea103mr6576048e87.4.1751370490330;
        Tue, 01 Jul 2025 04:48:10 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:09 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/24] driver core: Add dev_set_drv_sync_state()
Date: Tue,  1 Jul 2025 13:47:21 +0200
Message-ID: <20250701114733.636510-20-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044811_930844_07BDBCCA 
X-CRM114-Status: GOOD (  12.64  )
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
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 315b00171335..686f2a578fbd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -917,6 +917,18 @@ static inline bool dev_has_sync_state(struct device *dev)
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


