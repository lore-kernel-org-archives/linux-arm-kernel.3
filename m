Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28004606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogehj2SM;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gsOMIzkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=; b=ogehj2SMpL0IiQ
	ce3YzuOrPjuBkAvxL6C2PO+5EsIW9EM5s/VNg2qPIfQEQDu8PzoxI48xjX7RVsGgh+Oz8h9aYj4Qv
	Cr3Y0C2P3bbNKffmJTz+7ay8RjnpCiNtzWUDZcgZEdfUH7LLrHLsv2BlKaTni/oL/o4AgfJz03f01
	DE+mycKD6dgzw9lCfm+JGrQXJlFjf0enwc15raDJgIlpWf8bXVSMN/jCp5YVC094NWFlG4iuzfzq4
	pm8zTx/JmefLhfZMZSjNQZUEsMhHmE9o+GZO34k/TITWtRddtfEMeokJMCHxm44f+y3nxXWAyQCqx
	RYPj0Xufft0/VFpsG9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLO-0000000BZlj-3CPK;
	Fri, 06 Nov 2026 08:30:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLI-0000000BZda-2biV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-491971ac844so301792f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953835; x=1794558635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=gsOMIzkkmN0k43F/sL22KZOsLm5Fb2CvZvG1pPwgIr1dFLMZJjt3qx4Eq64UN2+nnn
         KjcF+X8MIJJxbTJ2gnmtm5qjiyCjv8lAQQT5HUn8SgtXnSmWr9nx0AfyyqYo2h9vh/tW
         sU0CeiaMXoNwAuuTULzbf69TLJDZoAtPSj5mFaS8glgUNyyL3rO0knEOX2joikADyRgF
         GRjNEdm9czcgBY2jhxzvJd533ZO/1dn2Ewm/7E4X9PVWfD1PszP+P3gCSM9j0fu8tx2Z
         /Hhyld4MjHsHxK0h1I194wVAgSPD3xvSt8t+Hd68VKuqpHfTUwusmuY4B8k0U08ozXBx
         EdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953835; x=1794558635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=oLbh5aPe2cDma+iLZ4GcRCx56AxkvMNybp+ma8czLCrWO1866ALuS7gCpsrviAtuW7
         /O8khMmYUnwg8OR6+bZBwEdEJh19PkKm7HsqipPr4v5fUEcVm+CNT0Fkwq51sg9UpP/X
         IuRg6fMfJ1FMQTHeZt6jhAmOVOcQguOlCXNDWOOUVZWkbwfEDvOGbIEbY0ok878moTv5
         6H6FWFF26rRy3k1PxGSywqc12oQLgk+aR+UkNl/uoRKaUEMTUcto4DZU3TYIHHxoSubg
         HvhEkeB17fDldBxhuaNdT81ITyvAGKQvjYioUXRlA/lvj8QFuAYsoi9Tgh9d8+jGO3ZH
         VI9w==
X-Forwarded-Encrypted: i=1; AL+hErEz7dF9nYTQ7puRvjgWUWcobpffaCI+GsWxG3uxtQQzZX4eIk+KLr+wPCQqgnHMI9OABb9EsGWMH+WSeOhtVs5W@lists.infradead.org
X-Gm-Message-State: APuU4Z/H+myxRcBlW6u1iBjWf0NhMZNYe80PAKiU36yhpvfOm9/X/Yy+
	DfIkfDEJGvQDGfeLaqtedBdsU5o7IDofvy8WaJJDBrpBIMblOg1NAJf69z3eLyF3e2I=
X-Gm-Gg: AYBFou3swsBkuUv+sthkfmenuQm5aZ2jVaLfKK+r3QKXw2v86BJBwGs2JbMbaw0YQ7p
	q92d1EgEoy/6Maz4d27bb6JiOrmJZKaUiJ7lObcUKaPtGXH42HjUVp2FU6dFQfp957GkcZo0Zlv
	2Ib0nBWue0VvprIHL4MzLCZMrzhRO86SNQst7RdxcxcnmPAT2WGKYovKV5R96AsafE+U4L3Khif
	iGyfDG1J1CZChhPYsr+XE8QySQHwIUEyLfUUEsotBPjo43UA/ECBXSefYpepNz8Hkh26oDqXzRj
	jIZKeG2pJyMQ5Zn+MzXK44mkdy/YqxgvfDIaC+C1cn9+Hal0DitPVnmWZuRLHxA6gdwwER2aGXU
	A05Vv1pZXrEctcJirTJ0OeXoEDoi1sDf2rx9Lc9P9+0gAJSm31o32XM5F3E2XMGFIKfVeFVehpl
	IsqjOTErU29nWw3LgOYk4/Z7Tdk5XnbK0ks6UjAzJww5JmRnAC+M+90+2KxNlppuA5qCR8kCxGc
	f4t3fGy/vbDDTsMceshP6dtrfXgYDqzpCPtK67b8c2jyNEy8UL3k6HCUP5/5F2gMnhJ8Y30yCQS
	Cv4VWXkdRfrlQFSrhLeNvRkWRI6MsyYjtW/AKDj70MPXujdFx438Ul/iipg6kha5MyO6kRcrhxh
	XhEZar6sG1ohQfmQpQ398UOoJEFaDmewmy3q3V9kWtEGyiA==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr3030579f8f.5.1793953834697;
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:25 +0100
Subject: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003036_681009_E6FDACC5 
X-CRM114-Status: GOOD (  13.95  )
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

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.0


