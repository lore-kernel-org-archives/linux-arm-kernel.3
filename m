Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SOlSjdZ2;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QTq45ZbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=; b=SOlSjdZ2uxfojt
	jHxf/fM1N09iBIumwKBHgfXAZOE6dUTHz/WritWSL8sJWQfLrPuckcJrsDvE3n0i+isrDlPLVP8k0
	/gdSVualbP9qZ9r7Humcw1wAqy6WRaspxLIu0YwgAFwNwDgItemaQ6SNICtNJoncSZSQ1lCUZ5Mt2
	MC9kcVwdjNdQ2JPmdOrMcqaxaWAnJwNXUtwY8e5o9dC2CsNE75IByPoMvU604Hm3QQCcZ7LdN/8kr
	bNbrl3V5iQYa5+xJ57bWP0gHcuz2lU4+fIZdef2/GdHxz54kq3kz6pkWOgEjkDS6Qv9LvnmGkjfvZ
	IRE2GkDy3JIbL705RJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeU-00000009FXM-32ft;
	Thu, 29 Oct 2026 12:54:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeK-00000009FRI-3c80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21508055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278470; x=1793883270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=QTq45ZbMcDmJruseNY9ooZB8tAozWhG1Nr3fLrdev/hnEh9b7QyGw8pPVFLmhtuYkW
         NCF+5FaIT25I+WaD02BuqU1e6L3AK9ZhFQVzXK6MG1YD18/Zyp3iWHDGfnIXQApu8wce
         mpU8YfdBigc4mlk8KK6Wc1lYQUIiLszeQSxBFzfqgo2/Zrf9e7oQwUenmVv9t0jFTH0T
         2/EAjBV1YPNGVojMfcgm22ZHqC/+mJPzLEhVXnpnfHfZoAxPqEo6Xy6Q4t/IsnFBqylK
         Q2ePkrmr0VnxG6kVDoe9XPIqYQU1Quwtc/LD/pwBrLbODZ+tG/+9+XmL2xg+z/52Nxo0
         MQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278470; x=1793883270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=RnDGrI2NagHMqtXdVhTA+d2ERStyyR+dzOE98i52tlreUYu+DBrJ5QhE2FA8CXxGft
         wu4Ie0KzIcT7EMCvxwgggxNEmbBcww247rWBCuNgOS8Pk1IcSMguSm9gPqrHlFBKoG7v
         p21owcD7pMX/nZU05OH+ml0FiSpx2T0+T52xgzcS9wQ6nrKjHEfkgf3Q2sAQotlFLKSE
         Tv+obOHZkcvBsEbdVkqx0j5jyzVC6xDdjwzQKB66PzE26PirswweUm1a8lzfkuftg//s
         dGigqRXsD93YfKg3M2zJoYdF2l3hLmpsuAJByrwLXLy1pNkOjWrWEfYEPMrC3RfQA353
         2+Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxOXp7d3e65CerYYGAgdqUIKXkK1uWMnLigVT6ziopC1ZBZrhEHRKRtx8UQrfbyCz7CAlKaSdgYwjJ6t0kO5pXG@lists.infradead.org
X-Gm-Message-State: AFq9FYI1StMKDKeROODSPbsiLhPgBmRZZFiQTFwM/LHmtY6tUIUmq8RK
	ei0NBa9WO9Rp9u17no0zp4xWZKDe2zbQwjLOX8r4iZtpndLBmeVYryf3g7TeadqyBR0=
X-Gm-Gg: AYBFou1OqPC1YRlMyHkRlKIwY/33NvM3+dgel5/fQVpgnZEEypuMylb0f2Eu+R49Z0i
	086is0oNJbl7JZfQSdiL7EeMVWFiugn3pt/Uj8MdfP9XVUvZff3XUIjVFB1ofdP9mpG3RESXkhA
	Y025Ps7X92Iwzis96Qvfux/MyW8W9gT8nCA3MnIORA5NbnohyBtyCDjFdG9xj+alWoXRGFViljm
	djLqD+Auq7VgcoHfxgfZXlg1a637LAPnjU6Ir8NqyYTMvmw/sa3n/Vf2Y/FTCKkx9MKi8qCKzDu
	4Sabm5uhy0Ukll9QVwbJqdG0kempj/t7B5YLIXctRB39QRnp5bp/wogKw2hlczjuQCpqukIF+3L
	qAkdI8n8vUipCTSJmi3PoGV1DI35dzp1j9k27qJqtRMqr2nedlHrv5+N6CLWSnxdXOkdB4sH69f
	Gv16Y/hupqXFYSb73zeNoJ5ZHkBbqAs2/vO7p61B5oEtJ73uI+hQUPvAoolyOeDSY60+xDRYlZT
	3/i4UMWgqY7ksfkes7OyCrk/86WljXwenvZNsVnvUQuNca97NLHHHEQIXK0qb5QFOuExPLz17QN
	Ur8HPtXHdDY+Do5sK8NaMvpj9LLPHsv0N4qHZFbjezbpHMBcEYp4ctn5LJRROnfTW5ibIAkikhK
	5vIUEulIqw33vvIeo4NRJLsbrmvXNhj9q1oJLvYh82g+NqA==
X-Received: by 2002:a05:600c:6095:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4a9643d51aamr113545565e9.2.1793278470416;
        Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:21 +0100
Subject: [PATCH v2 3/3] clk: meson: regmap: use the current divisor for
 read-only clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-3-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055432_927666_CFAA553A 
X-CRM114-Status: GOOD (  14.59  )
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

None of the Meson clocks using clk_regmap_divider_ro_ops set
CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
can choose a new divisor even though these ops cannot program it. The
clock core may then adjust child clocks using the wrong parent rate.

Make the read-only ops always round using the current hardware divisor.
Parent rate changes remain allowed with CLK_SET_RATE_PARENT.

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 1ed56fe63cae..002e16865109 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -120,26 +120,34 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 				   div->width);
 }
 
-static int clk_regmap_div_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
+static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
 	unsigned int val;
 	int ret;
 
-	/* if read only, just return current value */
-	if (div->flags & CLK_DIVIDER_READ_ONLY) {
-		ret = regmap_read(clk->map, div->offset, &val);
-		if (ret)
-			return ret;
+	ret = regmap_read(clk->map, div->offset, &val);
+	if (ret)
+		return ret;
 
-		val >>= div->shift;
-		val &= clk_div_mask(div->width);
+	val >>= div->shift;
+	val &= clk_div_mask(div->width);
 
-		return divider_ro_determine_rate(hw, req, div->table,
-						 div->width, div->flags, val);
-	}
+	return divider_ro_determine_rate(hw, req, div->table, div->width,
+					 div->flags, val);
+}
+
+static int clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+
+	/* if read only, just return current value */
+	if (div->flags & CLK_DIVIDER_READ_ONLY)
+		return clk_regmap_div_ro_determine_rate(hw, req);
 
 	return divider_determine_rate(hw, req, div->table, div->width,
 				      div->flags);
@@ -176,7 +184,7 @@ EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.determine_rate = clk_regmap_div_determine_rate,
+	.determine_rate = clk_regmap_div_ro_determine_rate,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, "CLK_MESON");
 

-- 
2.56.0


