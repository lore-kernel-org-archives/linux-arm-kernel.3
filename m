Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B480D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtA7J2/qth5t0PM6hBWIeoPmBTb33drrrwinTXvOw1g=; b=vIxpRBeeOuwoIRZPtcWd3Tu/iv
	DrkBIfXGgBS7BsBFkk5jp0Empu/qclTtU0UF1BAKf0jc1V97bDSimm8SHs9/HK9p/tTabxlZt+Xm0
	yRMOmjsYgy3XxtA6JJlfTFnyA1UJ5lIiy5MNsVHfCcwydZGAAYn9frhawVwJGpIt5zLkmxr0+fm92
	BKTfnkLQobne9zC1TQoYLloxCUtfEgcVh2kitFJOen8GUA5dsMWsEKQf6Wa2orbr9jC4cGB3hE/ui
	FZwSaNV9SxTUE23mb1U5oqMysyxNgmqroYBDyeB6lvv8WdOXvgEPgwC4OD5kNOwjpP2nfY/kzSpq3
	Oj8hY2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Oc-00000003mBV-3iGF;
	Mon, 15 Dec 2025 14:17:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9OY-00000003m9F-48qH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:17:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-649822b4b64so5577840a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808269; x=1766413069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtA7J2/qth5t0PM6hBWIeoPmBTb33drrrwinTXvOw1g=;
        b=ls/pqrYoAvyxK1PjtyAHJ5gGeh4g3gR9EpU8nLRaatXBvqSi7qP4leIkEOpMwfV6Jk
         1ZIiBIWQKkkjtAJrOSBq1gXUQLXPDINIlZ1vRODH2KCdrZ9ArKMQZNgADePJd+6JvTk6
         tuIFwwmBn/jSI+tZtsYNLrS+Kg3IiKRz30hG8nUQYJfEBUIk7CeIXXHaRXyvIFPfbxff
         kqWZRDgTCPIG345c1mwskZbXR9PFwO4Rz9lzUTIapyIT/VKrANMZnazR/A2JMomcMliJ
         KiqK0TqJIylIo2OXtm+Orhp9dPlbh0xxPjWxDaZsIMxhzpoig7Dylbbi4MwrBi7RZxQm
         u/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808269; x=1766413069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtA7J2/qth5t0PM6hBWIeoPmBTb33drrrwinTXvOw1g=;
        b=ARWo8jDKgtCPGo9Xhr8u5SK34dUt7s2y+bAmbhgYPKkOQT5Sra5weAwJ8hwlms+WHI
         WNcayPUUdsNFy+I1O+dzWYh4jOT3DoMRjP9j4kjK1bgtw4REL1FLn+xkyFcY7ocwEEOC
         lgEyyS9iY+cxxiKEu0euEAcM2yjWENRvEMmuDpI/etx1I0fidpIRtD+0f8yP6YNdhjwi
         uL+3E0jm7SEb7gIpWjIg//uIpANxAR3wtUsF4NOL9ZkNoog83q37QTa6D/v2irmeFaVS
         KrTPGUIIeFyk8CBxK0eqolUBZdwNJtA4/LleOFAr593GECdtKFQWuzA0XLisXTNyAdd6
         q7XA==
X-Forwarded-Encrypted: i=1; AJvYcCUWplXVgnfXwiV9fJzkH131MMnG3Xu45jTR1LaHKYZ66s4YiVWh3158Z1OSiRjIlaUvW6Opj3DcuWMriFbvp0Lr@lists.infradead.org
X-Gm-Message-State: AOJu0YyJBTNgvaOqVur417QXprXaXu3zDR7zsvRz5kMbIn7Kpt34qafv
	IjLrdm4KxufA1058wnR8+FBabEE9DKVfOrx92mJXGqg/gKBkKRTCB5Ij8ER8bx3Y7eo=
X-Gm-Gg: AY/fxX4BnNF6mx9QtA1YapjDy284yYnbjmeOFGc+O0LCe7jvlTUF1Gk/4j5NCDmmIIR
	QEC+Arq3kQP0wkGagkUCzU993bmcQsI/8Z46XBcnw6+4W+bBfqt+0hyyj9v89OiLpf0XgmsdylW
	VHQucruCPIYwPPxBgriHuAvHsQpN4TA9VBD1mGIpq7egrpU24wf0RGhuErL0eU/6+UsmxnpDN9j
	IBI+FMML3eILaqKwXeGuxvMKGeYVgqQs9Ns5ozj+R1Al+w4Vq7BSx4gFB3YnYqZOxe43JF3pVjM
	Sm6TrklGklUF2N5HQ1MtRZSa0Yaix7H8Gv5gr/9ZyRBlqjo59PPa6HbtU/oIKc1BBaS7qLt3kbI
	CgqlxDorEs57CfGA4zFmKVXLTu4AO4CDEk7yg74tPgLBTdAwzI+7e8CvM3eX9KKQv1qhLea6s2v
	FLkCrOs/Z+xZ0LbSPT0QF2tCNefv1sOEx8liwmvosq1QAbpIhisTBhmzG93g==
X-Google-Smtp-Source: AGHT+IFv/1u5W9CnoFiaYoPlvVQjDIdpfyxbrw8ig3P6eLn1uHC5BYn5sqa+mcQbAnC/+TOxgPrUcw==
X-Received: by 2002:a05:6402:2747:b0:640:abd5:863d with SMTP id 4fb4d7f45d1cf-6499b1c2a09mr11674219a12.20.1765808268604;
        Mon, 15 Dec 2025 06:17:48 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6498210ed32sm13548630a12.29.2025.12.15.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/17] efi: stmm: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:39 +0100
Message-ID: <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=U2aCK4CwX4oX996AKQXtxl/fnEvZCMh7YIAYyx6fXTo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhiuTDaNseAt3EsBljDKzQwacM+pSRuQiPAQ arTLi9z4TCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYYgAKCRCPgPtYfRL+ TnPbB/93KOuWIwDOJ283H+/wb1IIrgxqlC+DspRkdayu/Cjo2Z3TLbCwKyVMa5P6gZTnCDpH9Si 8rY5VZw8XaCqtqlLyVXjKit0WM5xeWDSRTlO+Q9WpokHiBxGfYIyP6YwTr+uo5OUlZshddxiDMz 2SQfGZcAHDksHjUDaPeVnlK7IUY6b0gcAmXFtPxNMEs4g1V8A58bIiOWqeAH6qjmW/P1Cxu7xac jYyR+lv+iCEhcIfMPVN9z2+RE8RmB7GbwgvuIPvs3GJJEULWKqdkcmdpkMlwQ48qO2LpQPvrvw2 Iu45H6xt8WaFrlDiRp+l+5sICtpI1uY89HTZulc2m2fYD7tb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061751_047157_3032329C 
X-CRM114-Status: GOOD (  14.02  )
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

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index 5903811858b6..7b04dd649629 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -520,8 +520,9 @@ static void tee_stmm_restore_efivars_generic_ops(void)
 	efivars_generic_ops_register();
 }
 
-static int tee_stmm_efi_probe(struct device *dev)
+static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 {
+	struct device *dev = &tee_dev->dev;
 	struct tee_ioctl_open_session_arg sess_arg;
 	efi_status_t ret;
 	int rc;
@@ -571,21 +572,19 @@ static int tee_stmm_efi_probe(struct device *dev)
 	return 0;
 }
 
-static int tee_stmm_efi_remove(struct device *dev)
+static void tee_stmm_efi_remove(struct tee_client_device *dev)
 {
 	tee_stmm_restore_efivars_generic_ops();
-
-	return 0;
 }
 
 MODULE_DEVICE_TABLE(tee, tee_stmm_efi_id_table);
 
 static struct tee_client_driver tee_stmm_efi_driver = {
 	.id_table	= tee_stmm_efi_id_table,
+	.probe		= tee_stmm_efi_probe,
+	.remove		= tee_stmm_efi_remove,
 	.driver		= {
 		.name		= "tee-stmm-efi",
-		.probe		= tee_stmm_efi_probe,
-		.remove		= tee_stmm_efi_remove,
 	},
 };
 
-- 
2.47.3


