Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWyKqDRaj51cI2d9ZzQFXmmLXwANXVcxLCbwmNM9YJ8=; b=SYQtWVCUw8Cpn/MF+Oqiie08Rh
	HjPyySpyZWz5I6TjX6pRIHZykUx6Avg1IkbqJeRQXK9W0hTMveI/Jab5IqyNvCKrdDulA7/8zxkMA
	RgSFvQ8OiFA2CUCStMb2SJFZLJ0kRrXMUHlyQwrhZwSWClrJ/dhE+NlHqh0ZpcPZPZ+rvRNP4RgHk
	exkFmnPLUolO9t3BoJaZfREzkgEL1JU0ivrkmyucFl5hdIgVtRdCHbeBBwrdH4SLmvh9I1tO5gX/m
	I6JZEiWWiUvGUlJsThHtYGK8+9WcLsZ+Zdcm7vgNB44JIdTh3c4ImA2VEzweITgM+jl5ju+zbDJAH
	DKtBO4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5qU-00000006Afk-19YK;
	Tue, 24 Jun 2025 15:46:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45W-00000005nAe-2DyR;
	Tue, 24 Jun 2025 13:53:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5533303070cso5095971e87.2;
        Tue, 24 Jun 2025 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773205; x=1751378005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWyKqDRaj51cI2d9ZzQFXmmLXwANXVcxLCbwmNM9YJ8=;
        b=IGNLSb4rMTxIe9dwv9LOK+7dpOITwcm+IU7sIIjsCaietx7v92EA8qYpSFKc2ipzic
         8VE5NhbybMCWK8SUlFVAOxTgdqD4ZzVTDzPXih2t/Uj3ubpobLpr9jBSb/lAsCwhxFpO
         ZQTEV9hGHi+8vVl/pCHWE2X4UztX+FuovXsIhDYS/DStP4amp+gvzUA3yIfc34da236q
         P9Q5D/erhWIkvYBDi6TGfjucezmoQpAyRRslkPYG7o38TQM8EcfjPDfRZn0BfEJtOFc6
         1EqcDVJUzlgvTz/viKD61EWKHZcPWI6uAuBnCeo4j3PnsCMM+Efagny0KQEFPM0KgTPe
         OLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773205; x=1751378005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWyKqDRaj51cI2d9ZzQFXmmLXwANXVcxLCbwmNM9YJ8=;
        b=k8/ekPe5vZTWPzSLbtAHY2U01gKrJHEIyNNPBSOIJxS+aGyKuyWCLMz57PI/R8OWg3
         4GMA0sDnqzF4kmhM/6HgT5PpHxhc6ou2eJsUj4Zw3MeMPSsQyY7cNJxFSf9IEdFZ2jLl
         x6PKkVRtaHa+/2MDYk2WU2KhKXBwrASfiiZaecryHZe5jI+boVq0p1PpPgKDuf8imRkY
         DM7ahuqO4wnrwN2P9mn/etu9t4pLsDIH/WGajeWw9k2KjhdSaQ1lzZ1Cuz47dTLmJ91Z
         Zke2g13ZrFXN24nnvFs+fEV1lrLwZjrhmf+NAYHAJ3hMxHNwvFU0ywmBGUE3+LFi+pKL
         JrpA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ye95DvRGdqRiHyZSdTXsn8yIi7aqBxG2tCzxZUNAJbAXxgpVZ6tPB96duJxlUqaQxlsBv7/7P2ixgMvQgAutRQ==@lists.infradead.org, AJvYcCUNtE0/JjWZoqXtxD57dKPkQG1jiAfQVKNRs3clOi8YRN/M6kUidbl/HyDwl7wO2xZLe7FMI1UlEZDeaEN2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu8oY1oqozz/uqbMnHtYRMWITgNpoCcT26iXERpwez3ZDP7yvR
	cATKkorNtvomXyuIVrCJNGIq0LCkMFqwy7tcFqfCf2WdwcoWvU+kv2PP
X-Gm-Gg: ASbGncuBr+/L9Uv1JQ5evLbsYdwTcR0/C3byRQehGOuItDVNA+Qiljy2wnwM09lm1Lx
	IZzdtM0D3GDNApL0WoU7yobQGUa1h2dIyqpNDq6gZmN43+uoSE5kLnHhsGzIyKbjCEaoXbXpnJY
	zoF6MmnE+zqZQHW9KDgSR+duzvJupBJU6ZzEM6xGn0k5mwh2dr71HJgy5AQxsE1/JTPWBFTbRbj
	bjdGJDdZkEfBDysvYhT6bj1WrWvqjlCkpbfUCow6/vrx9R03iXfDJrgAAQ4XQc78Zcn4Us1O31K
	BheCtWs9chuY2e4mFYsXMfk04Zt5Gogydl3uzBHiDKH16enYBFatBMfQKIa+LsIt3kINmESH4Bl
	THKbyWXxxuXxlUMclfJXTDIXoEt/Id4NFkA36SEaMDJtV/fzY0cOXVClBzLDg5w==
X-Google-Smtp-Source: AGHT+IEJvcOuq37NSz1A0GUoBspEw+mXdhxdzcKnz3FUYzZ9sVh+6FGPluYMU10kI6uMB14c3FylCQ==
X-Received: by 2002:a05:6512:3b24:b0:553:2a6a:884b with SMTP id 2adb3069b0e04-553e3bb5176mr4787344e87.23.1750773204755;
        Tue, 24 Jun 2025 06:53:24 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:24 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 14/22] crypto: amlogic - Add support for AXG-series
Date: Tue, 24 Jun 2025 16:52:06 +0300
Message-Id: <20250624135214.1355051-15-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065326_569189_E160A2F2 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 6529ae24b75f..9452f05d2f10 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.34.1


