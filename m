Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3549CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=; b=AXf4NUFOjigq4qsbwoDbAnfQZw
	G5Hax4+utqwHmr4qaJTznG75lkujX7bq1/6iG3VzVIEvYRAu60n7mE2/Mx8LIAkIxNq6eUXJjdoer
	lJfa7pudPNuGsJ4icqBi7jpiLe/vPCPt/mDOfHfqKyF5xIopjk2XxPaqZuQ+eDIbylDYD3JFWm23U
	LyYYJPT0OAIxJ8uqxH4gufHKgyKPtabxFWZkfJebGp8ouq6b9L3E/PEudtkZe3/9FXskSjMkvGX2Y
	EEMuqyOkPwB7pbVtDQX2FhZi1TuNQ53ZEo+yEPwEcz9svh4KKwDfzXezzGST8nPaGz/wnFEOpM1In
	2kRc8gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb5-0000000GIFp-2Xlg;
	Tue, 05 May 2026 13:13:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb0-0000000GIBa-2Se3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so33268465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986833; x=1778591633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=cthE6dgmro8Ok+Y9oSltM7VFsWop+EVZ+X8ub6KQDZo31/zyfRtYj3T3xhj6XVN27A
         sEH+YSrRQb36BELlw/EHmHG1taBXrhKKZalZAcTkKg5sfVwAPbl2+ee+hjrnvysW46Hf
         5teoDOfK5QWvp02dX23UO18zU1IFsdj0xl/2GEsYAnvmtvpAOQwsIvWo8RB4+ixtLHZN
         7H60mZATqHLsRocB4plklgJg+eNEE+c6nKlpCxHT/NlyD+JfzESt0alaGXu+pqLV6l8Q
         hUdD291VQN2CmmUUcLhIahBXygFbk7Erko/mKsVlaakaxWo8PyMtWlh5M4Ot1uQoWSVe
         Qztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986833; x=1778591633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=FFkOpofLKsTJYgGD/JeaC2qM9RxtJBfCUMmuwmPUF/iew8EkBvYJP5KTON7vdzm0zI
         9iGs+4NopThWAozqP5P7VErGz5sLYV9qRKcm8xUdAZXnfziHWAgE6YBYSaWk1jnuogbd
         EHh/ayI8fGYGDTiB2j9sj57/iJT+n2uZG7O1+o8Uc0oRQfEtqpYfo3ZYbtbstoamRmkW
         TiPyHBn+EB3s+gxdSbVdJ/OihqT+jvKl1nECOyQA1K4YYfCPnw8kVy2ajYlXeveXN/yD
         TcBOWP0SFCmEYK2YXb4CdgJQt64c5zHe8mLi4wrILeozYFUzbT2W/0aXLp+SI1H80SnW
         77ow==
X-Forwarded-Encrypted: i=1; AFNElJ9LO3OS1XLo3EF1Zq7EgfSDqp9iK/SYwL82MKxH4anZzW0rVxILEd4O/suxFSOUyfGzGgfYsBnmcpr6Zvv1EyfC@lists.infradead.org
X-Gm-Message-State: AOJu0YwsOHSEkR37/kCjPhxL0cg5uzJzvZ+XTXw/8uUwrLxK0+hmVukU
	u0g24MPyVGcLutIk9Ku/YmFRHTyROci93iZodXBqYbTkeKSjS0NmHzS/o7abP3073Hk=
X-Gm-Gg: AeBDieuUtJFfPTP3kpptBgJ1qp6oL6jGRl2G6ogZrx/tD2ig2owTPg3ypWJyjLNxMMe
	tAAHN/g3zlBCssnasnfcdCNgO75IWY/bIlD8tnspk6yp6ZPjGbW6gUWcatKOwdgsjd4mUxsd1+6
	MhJgBK/2IcQY7xzhfDTPKdqnlYRZkxhiFm3qdw6UIlpA7ExN1DWuS6VPhIrnwDSui1a5HmzXvjZ
	4tKL9Fi7E3JaImyiJYV+9mnMVQDFj2A+ZTryPsEE6OmcVlHnP0WLsxA/Tyo5kUyu4BerrH5a3z9
	yoZyKsC8QcAqmaXK1kELJC2U2RDFam7H+FF+MfEDu1yM1XLpqWgpHvQFaNhHNIyTwzWqkMTyyeZ
	EcQacA+mfF615kkuSlpZ6iNz8VzpAUR2ag0t3RR63x8WH1XZch1AbL4cn6G/53CfRupUQ1Mh5PC
	bZQfn2YQXu4uNBimWTdrwJqnNO4uwUseWrcWvRSdOKhQXaFa+9nkAsbC+NqkY4+jRzZX9ep78ay
	yG8QW7Sltlwc4vbnQ==
X-Received: by 2002:a05:600d:8451:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48d187d9883mr36909545e9.12.1777986832495;
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:12:59 +0000
Subject: [PATCH v5 2/7] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-2-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=2402;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
 b=M+kZzEMj6dEoppNgvMWoO2zl4Mo+sei7crymfmwR16IvDgC0ez/YRXM/jUFit87zge5NsxBVd
 uPFQNsQWkvDD4wbmvIOaokkFfSWZApxlZ2CSlu0/KocvS/iEc6DU5Az
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061354_635562_4C8CB77D 
X-CRM114-Status: GOOD (  15.38  )
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

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Additionally, if `acpm_achan_alloc_cmds()` failed during the channel
initialization loop, the function returned immediately, bypassing the
manual cleanup and permanently leaking any channels successfully
requested in previous loop iterations.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and registering it via `devm_add_action_or_reset()`.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..9766425a44ab 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -527,10 +527,11 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 
 /**
  * acpm_free_mbox_chans() - free mailbox channels.
- * @acpm:	pointer to driver data.
+ * @data:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -558,6 +559,10 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	if (!acpm->chans)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	chans_shmem = acpm->sram_base + readl(&shmem->chans);
 
 	for (i = 0; i < acpm->num_chans; i++) {
@@ -579,10 +584,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		cl->dev = dev;
 
 		achan->chan = mbox_request_channel(cl, 0);
-		if (IS_ERR(achan->chan)) {
-			acpm_free_mbox_chans(acpm);
+		if (IS_ERR(achan->chan))
 			return PTR_ERR(achan->chan);
-		}
 	}
 
 	return 0;

-- 
2.54.0.545.g6539524ca2-goog


