Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73915C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NReF8zJPQ2mkoOGGZ8LIj6uOL+cpVio09VFK6cVJRwA=; b=rSUtO/2AVTgE6fS4k0vEN2Epc8
	mxwf37na6Vs+a6ovk7Kbwprdy7I6niviSEjvI1CASY+9WYGWHmRF0WP0MPRx2fZ0TRcawiCB39QZ9
	iaAdhsyG/spbg5wGaWBfiWkItvlKF9ogt2nbVxIruc4QoXH2aF5TDplHvJ1bwNru0JjUCfeFZwlzq
	oDBq7AcBbTcGl2CtmlZg4GShlQ377ozXZqWCCJIIvRlt0bv9H+/QBka4tfr8YSLbvTTgnN2bEytz0
	vyR1X9RmILQ7n/LbJ++rPJ/JV+Hw0GbCusXgjbuAzbc+ibgZ9+aWcmtrculw80/t4H/CBCJbw1jFR
	xErOjryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0ng-00000006Em5-1pHy;
	Thu, 06 Feb 2025 12:16:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0ee-00000006ECM-1R64
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:06:49 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so1867542a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738843607; x=1739448407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NReF8zJPQ2mkoOGGZ8LIj6uOL+cpVio09VFK6cVJRwA=;
        b=IiihIA+yiyLcl8oNkSyUNrMWwWG2YBd/2d4GU8rYn0GTloF0NjzAqUsBbTiTpBl2EF
         pJaAp+3QN+2d9NKfhIVMujTS26lJwnSaFZQUtrrYwXSCfT76UBSTV4edBtJR1rRTFZel
         /3EmxLr8HgZq/WLN2CyT2Lg7eg073tkWU7Wa/3wOTrvHxl/IFARv7PZqdB/gfYwWk7bP
         o2z6hwsugh4u5t3Qj1CebvRkQBbCgIJslPnCQNWUu/1w5s9S9BY4vet377QF7R25TpfK
         9U+aeExdVOePzAWdv+wTZ3lXskuDCUXCtdP5HvJx7+iE7T97f+5JAUJaSuyeuPRCWQXt
         Dnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738843607; x=1739448407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NReF8zJPQ2mkoOGGZ8LIj6uOL+cpVio09VFK6cVJRwA=;
        b=Ggg4UwElQcNc1tPTQ0Rj1RzvgaAAoSRjzo76QWWlFm8XDBNZG5pjdsTYbeZonSYVyN
         EmX3iIJHeTonwlhrumo/pcjvGetxstJhyBrLP23sPpTx5qlM+BqWSEpAHBHZbt13QwGp
         JrtZS5ko1JPIKzGpwNsgwSYOJq5UWvv4QMMhkCOQOAnQRjP+y37zgO6PLdWLE/t+W8V9
         pEPnJMGIZRCM9tXkxLgKBZ4N4+fVAs3Kl0LwNj7NaYn0WigliU7krcrPzbeKsl+Mdffu
         0vJrFtNq5VLBpJxTogabQgpWXGcfOTf2UQkrZuQoDWopXY3N8ZYMrI/58ifimOZDrQO+
         GSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3vu0zqBoGYE4cPpXoSVZ5zrdhiGgw4W3vsgOSu7r6k1ua/y+ogrlsSJmiDyLQ8Bb7zOdDC6vhhwTptWZ71XA+@lists.infradead.org
X-Gm-Message-State: AOJu0YyUWByIu6cWOh51TmYIvCHMHwtzSX7Yp3eton9huT8JZhPH8IoO
	DbBoPLWLEBG16wMMkzwgF1q5THShXJMgY9WHwr0mSuS3QLKagobplOkFDHV2Xig=
X-Gm-Gg: ASbGncsTDDkyXSJWnzDQWqxXvwdnxwWD2YdYRfNbj+ZQxO94miYbmBmncfZNeycce3q
	TxQJpLqFMsq7sP4OjwRzD9kdcKNKoVESRlgc8i4CD2gIfKxAIWFDW3cQl5XwpJ1YtVUK4ap6aMW
	fl93RNGqStqIfeZ/pFFP24qF0UtMkWtCFgvfQ/5G5uWFQLTaxHl6VHcOOVilrGAXBu7rxvx7z3U
	ZoZS0MDIibNeXclMgkeO6YbpQGx6Jqv/W/n8S4bNJfXoetsj89QJyWz4555+AnHZCc8wKFYIGqx
	DJmW3QonMeLAXbMcKMO7IvrtCGp6y/xA3iDL2psyouLXaC5ZfsNLrTH4+Q==
X-Google-Smtp-Source: AGHT+IGQ1DA0hZwXcuSSWYUM+Nwt3fhgw1zzCRs+JlqWF6tyiwu3NKdw87WAG8YCeJ02lh0EqQN6Ug==
X-Received: by 2002:a17:907:1c29:b0:aa6:b473:8500 with SMTP id a640c23a62f3a-ab75e2f35d6mr665775566b.42.1738843606248;
        Thu, 06 Feb 2025 04:06:46 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7733399b7sm88700766b.158.2025.02.06.04.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:06:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] pwm: Add upgrade path to #pwm-cells = <3> for users of of_pwm_single_xlate()
Date: Thu,  6 Feb 2025 13:06:25 +0100
Message-ID: <b33a84d3f073880e94fc303cd32ebe095eb5ce46.1738842938.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hB4Y/PN8/M4xgeiRJgl1lhme90Lz9h74cogcmW6hNbs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnpKXDTGJARL1cSvb+WvKKbPpN9O1N3KQQQTDB3 QWnCB5cXhSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6SlwwAKCRCPgPtYfRL+ Tv9kB/4k1C64n/wjXyMEl2YAPPWhoTmdH82Ps93+wOk3K4f0TLrMY/v3IE/7doFskqR4mprAuUS 7ho/c3R44ScCD3492ffliwGypxz6Hve2qbgzjCOdIpiExgUY7CbTNNbns6kPQEXKQcruOYMSJeW 2ktRsj66bLtA8UIEuNqVC5sBXQ+hS1oSZXyB9v6bc8Q13RTFvMK8f1eVuyPT5/3oLVnySTMEy+8 0IdEKIGXZk5gPm/kmEaPuYgE9cYlDTAZpg+gn3fTA3u3LY3Kskedyfwe6rW5iD9kwwVW5Fgb1SC aFz3p+GzT/LuUpu2kMYs1J2mETTHLnBRQ5J+T8F+F38FwIfG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_040648_379411_A1645DF6 
X-CRM114-Status: GOOD (  20.24  )
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

The PWM chip on PXA only has a single output. Back when the device tree
binding was defined it was considered a good idea to not pass the PWM
line index as is done for all other PWM types as it would be always zero
anyhow and so doesn't add any value.

However for consistency reasons it is nice when all PWMs use the same
binding. For that reason let of_pwm_single_xlate() (i.e. the function
that implements the PXA behaviour) behave in the same way as
of_pwm_xlate_with_flags() for 3 (or more) parameters. With that in
place, the pxa-pwm binding can be updated to #pwm-cells = <3> without
breaking old device trees that stick to #pwm-cells = <1>.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>
Reviewed-by: Daniel Mack <daniel@zonque.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ccd54c089bab..bc05818fa370 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1000,11 +1000,27 @@ of_pwm_xlate_with_flags(struct pwm_chip *chip, const struct of_phandle_args *arg
 }
 EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
 
+/*
+ * This callback is used for PXA PWM chips that only have a single PWM line.
+ * For such chips you could argue that passing the line number (i.e. the first
+ * parameter in the common case) is useless as it's always zero. So compared to
+ * the default xlate function of_pwm_xlate_with_flags() the first parameter is
+ * the default period and the second are flags.
+ *
+ * Note that if #pwm-cells = <3>, the semantic is the same as for
+ * of_pwm_xlate_with_flags() to allow converting the affected driver to
+ * #pwm-cells = <3> without breaking the legacy binding.
+ *
+ * Don't use for new drivers.
+ */
 struct pwm_device *
 of_pwm_single_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
 {
 	struct pwm_device *pwm;
 
+	if (args->args_count >= 3)
+		return of_pwm_xlate_with_flags(chip, args);
+
 	pwm = pwm_request_from_chip(chip, 0, NULL);
 	if (IS_ERR(pwm))
 		return pwm;
-- 
2.47.1


