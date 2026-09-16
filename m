Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAFEC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=; b=o7ARi54YQ9rud8MhV/GmuhIVYS
	DxfhG7PRIB2v+AVLiUUv0z7j5k+XZ6fSbI/fDTwgRxNJg5K1gxSc2TQ9OzL8+TIEYs5EzW7kxBdVB
	zWPz2XYsEPii9Vm9QB1t7hUQF1oKar6nfWH4k4EhuAhF9rztr23acK5N2p3C+FnM1ezzz8Ppr8eV8
	IE+DKD0GMI0915OgHrv5HdBnAEm+GLNt+Hy1fbiJhsLYuJe8atL9MPOJywz+GGMwo7E4FFXkGGmye
	g18vtN7YFXbleWYMIMt+u4aPISIFcCKV0KiC2Adl8kFNgOmw87XKQU9hRNz/rW0hvtap+WdprqxaU
	AicP821g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXx-00000008e4p-1IAu;
	Wed, 16 Sep 2026 07:59:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXS-00000008dre-2fRy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=; b=jCKw0/gQVRqbxpwiLEobdhX2Vz
	qgzZ+ogusuE5s8LROKF3uDrp2hRoLUtnchX2hmRW75j5nw4I/8EjFQ9aCcQerBDYCcXbyGfO4NFuK
	PuWtpRln5yYDl6A7xdyL6/sv6xVMVsy5iXSfDHOc+g87NFk/7m50YOoyIz3ydKLHFz1zubtaUpSa3
	38R0zP6+d20YYKW7Bi0RJkZ3s6O9wteFa+UwAjJDfbrDYAV+Yf70QlxLAArAQxDq+UmDeRFCucQIX
	vPAmf/+2gEoMfVB6ANFgo273aSB9VfU6PUoryoLuRJ5CrngPfLveIZTae8xe3F1hFUon1xxzffVXE
	RbkoDXIg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXP-00000007bW7-3NuC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:41 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ec6188so4525525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545518; x=1790150318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=U67FzxEsG5pkpTPSr/WrDNYJ2RAyT5MMaH16VM5w7psap+YXfe4VWl4f7iO4q/FVWe
         X+VqJJvUO4wCd0ebKDO0+/h/rQZv2qIwxZrTzGugNG97DBZkS+tgR5OrH2ORYjbHx7J0
         bR1+KNn9cWAE2W98bovAx86tXgGmJ75VrelSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545518; x=1790150318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=RszOYFFTHn2XQW6Us+Z+jV0nnqyMsrVPnoc2GBawWcn2skY0d8vpvAvDMRpW9ylC3T
         31spOGMXzlstqrS9Elj2SgIpgW6l2bm8/gxr1PAu9j8OdoEoCAHg5Hljw2gj8ywiegNd
         cqk8qSWA503PvDW7rDpRFj9MQ5ALUE+/NvQCIH5cjF6951TNn3M+9WsUH9WvpF38DqT7
         SArOAsRdGr+AVl5t4gphh/ecBPPxI8URejTG85Z+1xsYLoIfw+r9i+56EAEq4Hg1mC6o
         ORbJBpLLzDgcD77O+2cU+4VfpCc2MyWj81L0jwh6yAr3y/vCPvomdjPo+GKBiejrWNV+
         pX7Q==
X-Forwarded-Encrypted: i=1; AKwUvBww0fthu229IQJ4DF7B/TvfAsyAAoMvGvs7XMTyiIsq0rR3CadO7FhUSAmeHuBQNupIfg930bCjuHwEm1uO6sSE@lists.infradead.org
X-Gm-Message-State: AFuF++mBSWtj52Q5SpopEoDklZo60bVGns+OoBkKCyqbYLYIHBX+9Fdj
	rZWZ5TwRqXY/DACnU64oweTiKJacq5B/ELgKnupnu9n+Gc1e2wUFLErDSsjg5F7aEw==
X-Gm-Gg: AYBFou1qQcLeurvdPoR+T1zkZSEoTwApcRkHpZZ3tBi8/+jj9CG8uR14InrG2MSUpjZ
	Jwe9JM1y/y/28MdCfbiD/lQBp0F2JFtQWFE1HtX5G6wkSkrSvP3ziA5Kzdmx/uYQhaPqzltzb9F
	R2yloO11mbMoRCr9E71XERJ5BNvhZ3ilnvSN+ozZhl09DGjVPwHHr/BEszPu1eDTnoyekE1UVie
	lG7/PIRdg4xXysHWsGo5K6c+aa+DAH4S4ouMd8k+joq8CRClFE6WrdJzcjo9Kb5KQJzQYR90L3R
	tXFD+Ifq/K2A1ijhaq7AFx0eJtRrCuAjwB+aq7XzXBVWjwzPhSdYn/M+qRigtdu4Heog/9s1Ej2
	66X1bCdI+abcYtCaCntfKr7MRM9Tb1PfgREzTyp7XgjzdU4dXwGBJwq0aZ0J3gvKnI3gtk/TC5z
	20ye9zLGnHhC9yavNFsRb4UF1DADwZJH3zOM8k3F93cIYhLty8vuYJmqUYcrq4udXT7S9kXbep5
	rrRwX6D1/RftEVVsFsmjBOinouAW/fKOJxWeVtWy4OwNk8pVmZFsPBe9Q==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4064349a91.21.1789545517871;
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 03/15] power: sequencing: Add pwrseq_get_state()
Date: Wed, 16 Sep 2026 15:57:29 +0800
Message-ID: <20260916075745.3549953-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085840_080587_FF67FE40 
X-CRM114-Status: GOOD (  15.56  )
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_get_state()
so that they don't have to reimplement it locally.

Instead of just on/off and error codes, the function can also return
"unknown" state. This is in anticipation for "uncontrollable" power
sequencers (such as GPIOs left unconnected).

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Adapted to pwrseq_enable/disable() rename

Changes since v6:
- Changed to pwrseq_get_state() with enum return value

Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 19 +++++++++++++++++++
 include/linux/pwrseq/consumer.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 3076b3879af9..8e06fe77fd6a 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -971,6 +971,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_disable);
 
+/**
+ * pwrseq_get_state() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, PWRSEQ_STATE_ON for on and PWRSEQ_STATE_OFF for off;
+ * negative error number on failure.
+ */
+int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
+}
+EXPORT_SYMBOL_GPL(pwrseq_get_state);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 16fad5f3e3ab..e2a2991b20c2 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,6 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+enum {
+	PWRSEQ_STATE_UNKNOWN,
+	PWRSEQ_STATE_ON,
+	PWRSEQ_STATE_OFF,
+};
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
@@ -22,6 +28,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_enable(struct pwrseq_desc *desc);
 int pwrseq_disable(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_disable(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.1032.g73a4cd73de-goog


