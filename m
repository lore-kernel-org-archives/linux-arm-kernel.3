Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198F5C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=; b=Y95vTZli5Jexx9rAROl8tRDozB
	mFRB9j5DASe2JsFPwRy0j6qSMfAw2vs/kgVLTnbGVlNr3Jj4RZKa+kRgOGMIcS8TQ6GK8i2/sK2hm
	deKq/iRwa7Ry5BrtPe/xEWD5Xb6wfai0ZqCVtNxq5jz3qe+PKpcy+CEuqjhIAflnsEQSNs34ZzBQS
	yTZN6lSvPi6ZcDIQUoItpeRC8xfguWav+Od+lpm4Tl0pw6Y4PfJ6nA1LXzoF5xQie9nnX5NfINYCN
	s9UFmAcreaSc51QG+I7K3xc+lC3w9s222dsBfq83R0BnaQs/2QeMRaahK/EeJZtX+4Wtor3RxRUDe
	QTQq3VJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW0-00000001oxZ-3n2D;
	Thu, 09 Jul 2026 09:57:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVx-00000001ou1-3obY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caced6038eso8942355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591073; x=1784195873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=;
        b=RNUzF0Ue6uma6hy7UA2Mrkt/ZFxmfBUdvI5FRpFQ9FBW0ifI+wjJ/Q6jooxPeGrtQc
         aFVXe7QJ0NLkRanSQVEWzAqGieyhOq8nS5bqNX8zM7+G0/SzM/XO0AdlLX+xGJLGDEP1
         Pcs5YEswIDPnjjZ9LIZ0lUegq5Zx88ktXpBAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591073; x=1784195873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGS4xa617bTzeR6KQL6sDpcq2So7IhszuqJtV9dz6uY=;
        b=GsHBH/l4Prsw0rO2wss2PtlAGUM1B9ipMkxnpHJlN2SCz3xYlwW63F1OllUM+rODRs
         MZrksIEj0bd3bxQGC9uIUUIiXLrZWesTq84luDk4GYmc0zmHs6DpZRZfHRBHmcadpJug
         OzFqOqTG8BibXuQsw0QE5ncA2cNWaKmzdVWsQPTnj46huZWiVLOEflHf4P6NmqOqLV1e
         X9/c/MzqJE43xhpVCx7TKFNKzrLkKxttJbxS6vp/xgCFfPmkfoFfCz/gHXOespqfZ4A8
         Q0ocahE83mIZ+4r84n6PePTodR2oa11I+OctEaqxrA5TqP3bQYeda+HaWdENHt4Sts/q
         bJkw==
X-Forwarded-Encrypted: i=1; AHgh+RoGSi1DJEQoh0+F0xSog43FxXNpUrGOK6ZGD2BErynI0hxc3p0C/2ICH9SNrs9butwZrmH3XdemeulfXoNIuSrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxRYJhqRngTTPWufqETHnijq067AUX2AbR7rFfddAfyBjbrlTCx
	ZE9hqtV1FXA6geH+tzFhtHNgZYjotrE+q4PFoLQ/VD0El37xDvL3gZjiDCEcS+SmNw==
X-Gm-Gg: AfdE7cknsR7qsR5eEirwa1E6I3HhjAMghOiQz0PTHWFGy7LhaFMcd05SUMeYFBI/aqf
	PmcBWW8bphDzy3EyvGI0ggJpfLqz2S2hq4aQHLUq9mbH9PPidXQqtm+6WNdq2c06b8fSIdu9wrO
	uEIYzh64Vqlj+GOPebd+cKWPris/q4Y+itRz6bW8/gn4xup7tRHjummPDEIry/PrhR2LTeWavmG
	w4u1je1YJdry4ejhM+H1Bng66/erxULSS8RwP9rby4T3IoY/Ur1TsGZnqZaqwqh4BFbaiPmhlAB
	qUiHHDKsouj1Hal626uAxjbah7J1g5dbbpRqTtUh1safCPsePh9TwNb2A2Dv35HfpuKRXhwCWxt
	FeTQb9yjaNzR1Wu3xIeYizGEMKxevudApcKBPOpe6cXf1eTQ1LU9TVjhPZibF4D8whSitnn8k3a
	F3jo9zs7UbmigDhnV67WpQjgaUL60lv2HMVtPSFP/Y+U5ka/gA/CkNcW21V8/x6ofbeN4BFw==
X-Received: by 2002:a17:902:d2ce:b0:2cc:841d:cd7e with SMTP id d9443c01a7336-2cdd8b2ebdamr22781535ad.21.1783591073109;
        Thu, 09 Jul 2026 02:57:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:52 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 03/14] power: sequencing: Add pwrseq_power_is_on()
Date: Thu,  9 Jul 2026 17:57:08 +0800
Message-ID: <20260709095726.704448-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025754_000062_3054D3A9 
X-CRM114-Status: GOOD (  13.59  )
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
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency.

Side question: I wonder if making the !POWER_SEQUENCING return success
would make developers' lives better? At least that is what the clk and
regulator consumer APIs do.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.795.g602f6c329a-goog


