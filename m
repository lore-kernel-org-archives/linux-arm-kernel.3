Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E728606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPxcMdes;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WgAdgAWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=; b=dPxcMdesPZVO1q
	l6gGMhMEyMVm9JOlwxxNO5a6bUQD33YoWzBkbFC+C/E4yScBQ0CWSxFjzogD/KXOiopgi6t5fCzdU
	pX0YS3tQI2RCiG5v2Aak/2RP7EqrhSmXfTDhGf6lM4XDoD7yuqDIc4IT3QDthr/CZMBJXT7HQUE/V
	X0F4MpabzlxXNaBHaYSZClu1TFkxcxrTw+c/TiU5gu9kjwJ9VYehrokz7SLw6c35hKrAA7+/rZk9V
	Isf/KtjU+6LUnjvF7+GXtpyJ6B4ZzU3SbVq34Y8A1MMqGInSg67N8L31UMj3CccE5TroXYobcNrH6
	Oh6XGymNnFWVZQ++yNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0E-0000000C3TI-2bCN;
	Fri, 30 Oct 2026 15:58:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp08-0000000C3MK-35kI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so7610275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=WgAdgAWTfDMnXOyhLl6kvHJ2EFIia1PWPonHQiCXYAe5+B4fzrB9O8bQum1D8SbrQw
         TD39aVsaR2KOil18hW11RjQx4oxKK5bCM5THJpmuzWaOzvriTNvaMOgXpZNfahXYuOWt
         Mqa8DTfq36m4xvphGdqMgY9z91bkL9dP2MyDzM0b68IKTOqutbibRvjURHLH8Qd5XCOA
         5WyTV1XJY1c0vLrPuqrWMIJ0dizuGfQZLZ1RaDqr2j6H/oeUcicdQutoLugpG/U21SlD
         oKxd5EYyHwjSZNL8w5UVyy+8LawBgZGFyQ3FLcwb/dHuomGm/BWPQ7vUFwWaYQNO79uL
         v17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=JWYKFKotGvfGBMJn9WDjz9Wi8PcBSTMjQ2OA6j8fR4o/e7iQm6JzizpnYY+W22CjdG
         C2lDVUj2JPsio0IYFyijs5ahA0NByCQkjpQZEBW5zHKs8DJzT3sI5f7u05SCtyPM51XP
         v5A5oxdjuwvzoBfycpplJIjME5/gg5hgmQfEN+drWZlw6pDNulr+OR9V3FQlJLoa0cVW
         19QI7SkZvtYiln344Hk6MYQwLysiW8BE6z8LcuIzle1MOWEoMLJwB/AAoUeoGPon7JBx
         K1EgCsWOr9s0x+AgQ82SoXJy9Vo/bMs50/NGBb4mSLlLRPUbV6hSNovCTbYLvplscq9o
         vAgw==
X-Forwarded-Encrypted: i=1; AKwUvBwVvlo6RfNJBdYojZOtyi0q8KQOh0aERkMUoW+GZmtvZtSFdCkjBuTIDpXl77mBkZcwOLzR6d/XVJpA6pNfzBju@lists.infradead.org
X-Gm-Message-State: AFq9FYLSb+fgVXZvrzyYDbXSYRQAp3hF+yl5zKcq7wobXT//gJlSfi7m
	VGyTJTmUyZPEFXnJtPkszGtWbMiZQk3fY3iZTOOQQonemSOwwXyQ+Bn9D1gDKxBIYhU=
X-Gm-Gg: AYBFou3yUzXO/KXQkhFaP8DcjTP/8UT31DmrE0+9+DCF/cKY9/xyvasF/bvAs+B54IH
	LTdyv0/8Xls7e7RJe639gNEw/1Ge0Mx13kEnyxGBM/etj3ol1DNgPqwQjbauQTZiElpyhTg7Lj8
	1g7BSKnnpjrGm8OBweRBBmr/t0b+qXItRpuqZtQjKTAf9/vWSc3g3rS+ihWgDJk6+gnZslGssP9
	g9PH+f2eqK0jD/VWN3X6HzZB/zerNG9DnRJnto4fh3JC8jolrcUtTNwhJB32IcTMCt9YQr2GyWT
	yBfbtIwW9DWEsNkymD4VIUSkY242OsB5WjuddxXFTZmKZoKOCdRE+Whw1yFuN4USFkwBIVpqDGs
	+cVaDqKTZufaYVTbaiDdVTPhPYUeeucU9qca8ojSMaZfNGBS9UV06mqislK/q8ABcxwNzjtSzpY
	VLkHAiq5RKD4ixqUbtA+061thNFE9TLD/aaArLViCE3smhJ7SMsX+IvkDUpQrQEn5puwymTL5qM
	TL3pD3gnoeoHeO1PyL+cjeRkpE6GhqhAG8PrX7Vk57XRR1eoY0RTTpE1vRo1W1yCkc0Z9NY5PKN
	3cHUfOsv6aMEY88rZgc9wZ6ly00b8QqCqXn1VygutKt7mI/wbAk=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr57138645e9.15.1793375922493;
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm50402805e9.0.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:39 +0100
Subject: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
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
X-CRM114-CacheID: sfid-20261030_085844_795896_13D47EBE 
X-CRM114-Status: GOOD (  10.72  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1a14e254f011..24e02de543ca 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -486,8 +487,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.0


