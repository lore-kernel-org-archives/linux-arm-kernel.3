Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70773CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkKspYGARDVWPzoe67v9qdw1CJ7end45NsypUudMHS0=; b=pnDmeG4fPZJdQLnRD0TRGVhASC
	EzKBg12Bx2YhYhyRvWPKoUamYPtWPw4AdqbAnQZeisLTPMZqQ9Yso7TIk4XQrl4vlFQb0bKpWOcxp
	uwuh0c4qMx7U+Xzg0ddKgw5+jKFVjx1fQOcKCcI3lRNM/b4lgVKJ50UR8V5Daw0RnbD41k900l9dn
	6ZsiUxcDA0mGBIIBiwpZ97R7Y+7cEtXjES+9Z5PGXMSLMJXaf46jKlTiM6dY0uHSddVb5vl/SHMae
	U2VCH4SbzOpt/34YAD0V+i/nNrAzJSqMSJWAUMFG+zsnlDvX9fEMWmrzf3tE9S4Uu0gpr1u3QJbtG
	mrs9QAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLk-0000000CfQh-2aHN;
	Fri, 02 Oct 2026 23:07:32 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLh-0000000CfOE-30Ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:30 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-14caa323519so77363c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982449; x=1791587249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkKspYGARDVWPzoe67v9qdw1CJ7end45NsypUudMHS0=;
        b=PpeiBMhb+FBpoCA8TdK+OQ1W7tATrLVM6avKUbtlPdMlh5h2QqFEU0bsgUE6z7ZzaM
         HS1QdglfIkp7WVCu5+YKBNAcyYbinlxvWh06jGgfeuDs4IHn/0u5oZ0wO3X0ech0msJR
         9ojLoFqTUg8X0n3QXaVcaSfTiSFw6YdqFiRm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982449; x=1791587249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkKspYGARDVWPzoe67v9qdw1CJ7end45NsypUudMHS0=;
        b=jw/UamU3LBj4v3RHFVqgTIR9V1rvwsQx0W8r/0iYHmNFlDpI2qoRhYLw+37BzaYPGz
         GLoo1A5mGX/XCJdi4I/QS7qmkiwGOnaJYghJZHgue8ctKl80sWxSCtZQPUys+4IuPDwN
         m/o+mcXmaU/6QsHYfnWLxUi8yyC3qHxVqASxARzict0xh7CfhVw0Fs2D/hBOJmvpZ+HC
         jH0b13z0f7eJggwk6t2TlTebbCTpnNDjPtvtX9i+QmXHqy/d2BqJox7YaaWzUcYsoJ64
         09heBYzUN0+gb24CCOBpD/BjEWORxrJ8h5pLPioh5dY+cC04J86lGaPDWdr2uunAP7cM
         nbQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT4Iirw417IAVu55/IDATxiKt77oIi7CRNtRNbqM2DXdimJWokZn9HmgUdoUApB8IpJswCMnoip7ixRsmigZHe@lists.infradead.org
X-Gm-Message-State: AFuF++kDR4i+tZQJa+42ZhQK4Hengva2Lz1dTAuePPf3AtLCqmdVRpiP
	rZRFTslP8lJklPAsY7mLAHv/dig+ZMm/h9i9ffZpWV5vl0WN1NQSsPs5yTmxCSD8RA==
X-Gm-Gg: AYBFou0Vyv9JBDeYNOx5PuCiGx6tiDT6LDaD9okTwRu+WOEM7jsX3zVdLL0lXDysmYk
	cAAbUruLn0v61XFghugSGXuREv+TOm6ujNR5UOSWimtbCGIfEpA9ke3Ub20AAx6Wwk4dRaizrLJ
	KZUjEhuPBKPbJW2hSn+ehq76y0tXlB05B5BGur0vs8vL0i/Odtwf6tG7OnVchTGxShPzsTgR7Zz
	gaGEZyE7Xc2xzGmB3O2KghICIK2tRowbW24LtOfKHSoBdpmQc6FvQZBV+Ju14elyglKtCIS5Za1
	uchcNMlviS/TiajAX6Z6k9kJCCdtEMvUBUX9Euy+Ra1u50JzjSfNM1+CjEbXuH+Mh4Gz2T026ly
	OkeSXfxYYveEa0qtYzmyJlem8RLlu1G9JJbjXCm5puwNr/mQm6PVFmcZadWugbAdHHR2xRN/dHI
	AcjGKtpvWocLIO6/ExvCyTDVpMIBS1xNMaXcrSd+EqB6/0TDSj4nmgGrBK+THQrWG0aLm0p21/L
	UFGLY8PybGdhQnEvTe/iyQDiMzmIHf/buWIHw==
X-Received: by 2002:a05:701b:458e:20b0:141:4a06:ad6f with SMTP id a92af1059eb24-151c32dd5cfmr996174c88.8.1790982448536;
        Fri, 02 Oct 2026 16:07:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-151fc39a6cbsm555611c88.5.2026.10.02.16.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 4/5] PM: runtime: Add tests for last_busy propagation
Date: Fri,  2 Oct 2026 16:03:08 -0700
Message-ID: <20261002160309.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160729_764742_2254803D 
X-CRM114-Status: GOOD (  14.42  )
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

This is a regression test for the problem fixed in "PM: runtime:
Propagate last_busy from dependent to dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime-test.c | 101 ++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..4b507821912b 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
 #include <kunit/device.h>
@@ -285,6 +286,104 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
 }
 
+static void pm_runtime_parent_last_used_test(struct kunit *test)
+{
+	struct device *parent = kunit_device_register(test, DEVICE_NAME "_parent");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	put_device(dev->parent);
+	dev->parent = parent;
+	get_device(parent);
+
+	pm_runtime_set_active(parent);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(parent);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(parent, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(parent);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(parent);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	msleep(1);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(parent));
+
+	expiry2 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The child's last_busy time should have bumped up the parent's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
+static void pm_runtime_supplier_last_used_test(struct kunit *test)
+{
+	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
+
+	pm_runtime_set_active(supplier);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(supplier);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(supplier, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(supplier);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(supplier);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	msleep(1);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(supplier));
+
+	expiry2 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The consumer's last_busy time should have bumped up the supplier's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -293,6 +392,8 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
+	KUNIT_CASE(pm_runtime_parent_last_used_test),
+	KUNIT_CASE(pm_runtime_supplier_last_used_test),
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


