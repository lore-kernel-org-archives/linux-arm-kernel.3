Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959BAD2FED8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=; b=ueBHIOrtSDFBT0aeapmoCBvzRK
	7poMNp0Ph2Z+SjDtyZvZKr3vgjUsjodO7XLQ6H9OsDydgupGJ7gfi+NaF6hA6pP2YSBF7l1D0Gc2E
	+TIc2HZQd2tIKyxBQPGwr4G56xf1pAZoZGTJgZJ1d4N4gMTfaNHdch75VE2+NNEJLUMihE7wdPuUz
	bMr/U3oRd3hMqNE5HD74Xi9enJfSUyRD0Kdu/YDnIvdpLY9p2pmbuCGKyLtAOiFiFTIMQBAgHS8s5
	O7dGfnJo9ZlpRehELCHMV/KJnDNWoG5zwrzh95woGq7ie9gWJA3zmJu7ucq23p3rg9pej8wv1wFuo
	bYoAHw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknj7-0000000Eo3f-0FS2;
	Tue, 27 Jan 2026 18:23:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknj4-0000000Eo3B-3udX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:23:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a871c8b171so6219555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769538222; x=1770143022; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=Z53LkRM3ZeJbWj2Iong5HBZiH6LGuAT5nOOPd7u/yttS4/mBkP+M4Ujs1+hGWW1yNT
         8xkIY0u0APHJXZmKRugbN48CnvrYmOxti7yYtgzRWdDDGoK206oQme3CU4exjTFnaafd
         TCY6WUoGD5aZeB//3ljJqDr5d5tTmp6/NS+cTePZkWzshyZcLNhgsUGEH/8YkbcL/BVd
         IO7Twr6kIjOHwbu7lLZxjud5Vu+jKcHzTAwRVN3rz1ooLoF7ERVSquxby53oOyxDzWT7
         zbYO+cX2MFWmDvPET/f9y2svWI9nXOIKlgpiULjhbG/n4OWbd35S2N8rvohC5qenXvlR
         fB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538222; x=1770143022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=Ovhpxsgo12JG5l07RTtVi1EWGmOFx9iQ4ax1QpKNkHhkz3tOGyiZOY8UkOkW/hMNyH
         4RtpAATI5yv5pG26yhybND3b481K0w1x9NAEA+acSAvkj0uR16uLys7UayhQhsbjvHhA
         gbME0qEMlhp2yUJfNUp0TM1ZEVQgASjEfeqU8OewD54fsfH4/Y7042lKVeq1I5GbKa5A
         jAY+tcjjpFCEKhQ5mxVoin/TSunu+HOSUVIhLBx8vUmMJCYXiKuPPdhUw/ZylLSz3l3N
         Pe+kRjMYsCcKTbTVBgCR73iEH1KBdSWDb7L0kysPLBzYhxw9X9tBuxJEUPO0/F5nItuH
         OlbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkHFx8HyRl5JPya2S5aNznXuC9nD9KthcA/Zhvbn4HKaYtLI5EMumNGRiju5Y7wV7uOk58OvlruPF+XB34vA/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yy84pdDklmb1B//KD0TNXfhH5j+gripA4/Yagcg9Opuz0o+pTcM
	FSlWIBRBQZxexsxAp2nFqc12G2vD5XkSk4wiDXfo2MOKVFKbk8K3VOVH
X-Gm-Gg: AZuq6aLEs+o+p1YpvRBaf2fKAq6v8Afw8skByU09n2V9Vt8tlgpY5zt/+VFJIijIC4l
	n7W2Y+AnIFjISbg/ViTik8p/JSVm+kgWxxr00AH1rpnJBMkmlHi4H/sp8jfQPuT/R3+oM5fVzSB
	fwmTLBX2/TD7ZXXwQqaN11sape6gYkQSGj8nicHRgCYUDbkGKbC3iijL9Ra+fnZtfX0YIK1X7n2
	HSwSZLONQN5miPPof/b3P8xYQ3GdJaRall/bXgoO/TdxPE8AhecJ04VQTHqfipicNb3Op9MM3PM
	JpyNt9ijeT+zLFdczY3FYnWcvW7O9py+RmTkudbb2P0O4D26yqrnSdTSd4XvRd1zTny5W1V4NJu
	wTzzgEmqIQZ3A6GcKV4SXnNFcQpGac0nULKxRgdSedz3SAjqTDMP6JE8GvvSYLNamDB4abfYlxC
	FKQbNJ11xto7boV1LWxxhfR5la
X-Received: by 2002:a17:903:350d:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a870d5a11emr26284835ad.14.1769538220491;
        Tue, 27 Jan 2026 10:23:40 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413d16sm610135ad.25.2026.01.27.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:23:39 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 28 Jan 2026 02:23:12 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in bank helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI8CeWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3cTcnPz0zGRdgxQDi9Q0AwuzZIskJaDqgqLUtMwKsEnRsbW1AJ7
 T6qZZAAAA
X-Change-ID: 20260128-amlogic-0d08ef086c8b
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769538215; l=1586;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=gzYCg7eQFUgU4V294MJ/J3tLEbmiBq4eX3ZoJFJXYAI=;
 b=Q4t4AtxghLx54Bs7JL9WDYzt2BKTvug6RGwBm9/o2ji5s18HIKqk+SLQR+Uf5ULhZr/nMxqAW
 rfdWaFvBwCODzsk8RoeQjtM7lb5ct9ZqvdGk9SaGcFLGksgu179QNIQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102342_972933_AF55897D 
X-CRM114-Status: GOOD (  12.13  )
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

of_parse_phandle_with_fixed_args() increments the reference count of the
returned device node, so it must be explicitly released using
of_node_put() after use.

Fix the reference leak in aml_bank_pins() and aml_bank_number() by
adding the missing of_node_put() calls.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ded7b218e2ec..40542edd557e 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -725,8 +725,9 @@ static u32 aml_bank_pins(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return 0;
-	else
-		return of_args.args[2];
+
+	of_node_put(of_args.np);
+	return of_args.args[2];
 }
 
 static int aml_bank_number(struct device_node *np)
@@ -736,8 +737,9 @@ static int aml_bank_number(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return -EINVAL;
-	else
-		return of_args.args[1] >> 8;
+
+	of_node_put(of_args.np);
+	return of_args.args[1] >> 8;
 }
 
 static unsigned int aml_count_pins(struct device_node *np)

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260128-amlogic-0d08ef086c8b

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


