Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=; b=y7HXOZv9mu3b2w98x8CZ7MGhAc
	wz2VbVExlDnbXYbZvURDzqOWr0Q33pmcuNC3eVvAXDXgaLyAuGPvA9Gfo/km9lPSf9YpoFvJRhL1g
	f9R6KCkcXwsSe0CYfjgeHYPpZnOm5Go7mj44naDbubr28wwCRiMbI/Wl9RwHgNhQ0fH8va8CWjW1R
	LJlNEy90b5b2hss2gOqRU8pH0/7FFkdonJionIoKh42JIUb4UgvWh80vvP3N9u4oEQ2hkVSrGPJJL
	M4QWGiiqTV7RiWKd8y7XbLU9BX3L/6oQVlnlKVp5ECgz3QFcy+W5K8XyCY136b0UD/rWz735YEF0V
	lzPwurtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNz-0000000EDUg-2qC8;
	Wed, 15 Jul 2026 08:54:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNv-0000000EDS1-3q5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-848595b338cso6084900b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105671; x=1784710471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=GsvRFtQ/Yo86NLVsAVykZHcIKUE9YVOOvza5DHs/9W4jluUp2nMRGuRi9ErT1krxu8
         h8dvgEjPmiPdoltL+tP769yZEzSg9aLQrtxxL/ViBSivzTL3vgaz4Pux7jglGXHqGKEO
         xU18KtztXkXPfoIwCK8OAq9s7nebN87x2c/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105671; x=1784710471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=D3mmTlpS26O7SeuGt2qPp3sZVzRBS4GCQ4PUah2Xt6aBSgY57Zmf+Z1B1gdBCKswbV
         MkHOxw4KywK+hvjElhWCGxfrEL1Pe6+OPtOeny+ty9R7q6z+UWYdFVewKCI3NnQhj6SI
         JcM76hbl180ASKjfUgbLkFAFclyHzC3wkI26jIX7VJNtytefqzQsIj/f89x4ts2/ETbh
         WKNLmkKVzdlsw6AMfCZKdLVlPSUFnKZfLdARYOu+4X2VSwnkDbag6klj4lsrN0Fd+sOI
         C/v0v5dOe/FHxmQM9riqXVTVTKogKVY/VVXTm0LfUoBG6g+INaPeIwB+zKS6jus/vfNa
         h7FA==
X-Forwarded-Encrypted: i=1; AHgh+RocS35walh7FhKS5ATEAdduqYccdjP5Yy3nBur7rHBOSKWa49Csib5w02SM+q67J9feS1AWaqlN9s58YNOd4/tv@lists.infradead.org
X-Gm-Message-State: AOJu0YxbDdgeHro+QtqZoydv+/J6PiMOFyu7/HTrcnfpesELw00mdXE4
	ZUgYngXA+X+k04VaOJapqyQLk+Ib1i33nNzPUq933WURV7RgPvQ6TyMMWYFprmzxXw==
X-Gm-Gg: AfdE7clo0IipxTz4D3/XuSfvUdRYVnS5lB5fPfPuMDLHyBmFxO0jFFg5eYt1DZWQ8kc
	Q0/GOMMzkrGTyVp4lrfaSmO3HpLizteKxkK18XkZSbgbzOOoO7P23QvPELG3BQ9W/1jIKr3abYi
	rEuE+rJgQ+Z9ZVPpxBG1H1NaGep/gmIMypQx12GkZ7QTWK+8SbCPT2/rCtT5kQQBmCcIJzRHbPs
	lRf6saF2NEKzBGkkyaqXRfMRlsj4Ahfaj2hGvp9sqHLWrymDOyHTN6OFxjY6bgEtDaNAqZSNimS
	RTtB+OyOON7so7r75uTfKDUoLS3o7dunGLmGxW/xXoJscKi5VKNHMWVgZbzEgnxk0CF24ZsFv9h
	sequbp8rKWJ5w4zxN7RvLPK7cxpUsgCJTgR/rKhHcLc44pS4qgp3qBg/GWZ9eqIpK4xty6pdVo5
	8U8KsqQh3ckkiiapBJpwmDgoA8KhLRpQgpKkyfPczFSZY1cEVT7u6HbTfNJw2crFgLSqPF9A==
X-Received: by 2002:a05:6a00:2d19:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84a559964ccmr5439963b3a.78.1784105671342;
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Wed, 15 Jul 2026 16:53:33 +0800
Message-ID: <20260715085348.3457359-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015431_981118_C8F861C4 
X-CRM114-Status: GOOD (  14.21  )
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
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..db8c91be10c9 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on or desc is NULL (optional) and 0 for off;
+ * negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return 1;
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


