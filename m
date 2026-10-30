Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A6606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TygIYOGN;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ngWOtW5h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=; b=TygIYOGNw0Z7Zb
	jBIsBctykWaX6oAs8Z+Bl3WOLcbPI0IBFZVny1MUJk6orkrtIFqfpfllsAgjUcaDLMzd18IWk3ju5
	EYm0sKzjTnfq7fVkDNrB0gxkKkEIPWus+PbU8qwa+rAqzkz1xHgSxiBD9JcOFFkjSbpbcE/dx/8vp
	QFTQz852iODm1H9Qce8OscZKydZtoozjjdGe5LxHZ2TnDA8m30ejftrWzY4iCQlRcIOyTxMDsXpr0
	3f//tsPHkyutzYYf6SOSb58ib9KnCOmT/yeKVxnCu30vHO/jbJr53kF/SC8uT+YUAYRsvN6NYR2R5
	BTu3w5hhs98CjVon4yJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0E-0000000C3Tj-3So1;
	Fri, 30 Oct 2026 15:58:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp08-0000000C3Mq-44mg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10384135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375923; x=1793980723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=ngWOtW5h+wzMwXlupkHae6gg5mMHKr/W7fjSUwCuxekB7Km1XmLsEJ8FhwdmVmjBub
         RRpqwKFidV7Jr6yyemzElPSW1H5KXou5c/usRC5AgsiAWo9ePur8soSC842uvdObWNO7
         r69T/kM0B09NLg5ouFJI8Q+RSjxRGtWCSVFu1IthDYaFuEngYPYgr4bxzAEaEjQna1ya
         JGfdmxiSVlWGLLjvDQfr9+H1JTmCO6Bn452WBqapKtsMxJSKNHuXP19WKt32iMPTPEEN
         k/PnTH3K84zWZdmNMMXxJ6I4mOd4GJfu2qXdpPXhFmKAYTwsDbNuKxU3OlfYi1U8WBej
         Gdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375923; x=1793980723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=qmoVIRBMBE9lUsCAE3sva26ooOMtbb8cov6T5vhWT8jpf/x7mB3lpnJDrodxtnvjhp
         l0PMvRWDfwG8BcAKFP/Kh8+1Eo5LW0IS3aSC8sGflofY1MimsdoE/1edtmsfKajOtglL
         x1JqsPuFOcLEOvagESPols/HEa1Bp1YmLtiqBo7Zm0K28Yyl8/07NCisRkKbHOIkvH0/
         T34u38YFBpujF8DLuphDLlvCKHF1/MrvsheMZvQXDDdy4dO3jIeam5QJ0fiqj0uO+LaD
         hYb/ansyCeecn0grAdJZoVSjadlKmqCF1Mnfp5YPXS3P3jDKUNuOlxvB/1ykaC2VzWH6
         UhNw==
X-Forwarded-Encrypted: i=1; AKwUvBxy9kNyR5kb1VLkxx12aZOKcSbUTmyKeAPoILdiShyPh/fGv4DTYlMEdjk6FDQPP47SfMC4kxo4AlEXJFRe312e@lists.infradead.org
X-Gm-Message-State: AFq9FYJYq8bZdatJdQIT/v2rdJXH0LjBtI4O9XEY3dg/S3wlccWY6jHd
	b7lTfDzPG0O+mynu4W+R3qJW/KP7yhYagwveTx2EXLn2coFD//38LyCvPcaNV+cRLmk=
X-Gm-Gg: AYBFou3kf23xFBo1kHzF5mWnS/7ryvtdT65s4VAheWQOLRwjRdtWJy0XeYQ66lmwgI8
	7amd/MgJN91rBdigIwV2tLD/P0dZR0mvJkD0w+9/sJ/ntLVArFxBkr7Z+eoyEpi4AjIJV4C05+j
	aTV6iyInC4Rpb1gYpW36ed8GhPSWzfNcKJeyGxjKd8iq3wW7MsvXLYtqCPcs/wPQdRxcegiZ3DD
	HhcrpsPDLWwsb/8xRQJUR84amXdS3tkg4rNjLmm7XEOXveliMsBYBjBHuWObZICeA3rO/E4n/m6
	PndgZaIBUT61x7HAPTWNSu/8Q2uXFemxt1zKuc631vS6ABBYQraTikDpGvWqKLyTFLuldO3E3fH
	zLB6h4lv5vVus7sAttxmQMvgRP6uSA0iMjWXPoAkVCgpnlinptWZGLaVy0TH9iuDCo4V6JNCvBB
	D84lTRiHeZbbZyiuT0xSN4rI+MRU21YAy9P/dQ+GAuAZbJR1cIPzgYeSqjsw+pDotAidAIEUPwz
	5bc6xMKREkIv0yAF/CacNlB29R4Brbo/fmTL4VggqM6VV3btUHN2E+yNc/+Z8D3lTpr3o/VNkgO
	UCjQwBYYrHXOORINAhU/ZPg8X0rJsVh8HdaCvsUvw2dEpxkEorw=
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr63299065e9.31.1793375923405;
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm71893855e9.1.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:40 +0100
Subject: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085845_042969_AAB93024 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 24e02de543ca..6f44e8c0fee6 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.0


