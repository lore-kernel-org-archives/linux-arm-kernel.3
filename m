Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ORJ7K19t;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CQacqZdi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=; b=ORJ7K19tZfFad2
	HNT8GMMFrB88Zzh5IMldaz0TfiuXde7LSnwr/SeEwY2aRzMydq0EC7gXb7bwh3sJA9W/Yig+hNV1p
	cTqgsAnHIAmssfckKiPIdhgUAxMY4Hw9w0BprJfA6L+EN7y9Wgxq9617G1QPhhVQXmHeRwjBhd1sl
	DNWptOnd8zZcbcw8Ab5aZ4wHr97pMmyYjX5SK00KLE9My4oUvPZ3xG/aEdV4qo5USduzuN/zAvHbP
	I6Henlv5JYl1C0hfEmHVLiBsKXMz+T0fEIV5s5gZwwQPabIzkH4MfXDRdHPXeHCS1aTenxxfAhf1n
	fmEcBjbtDZDVnguLCZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9k-0000000EuPr-3itb;
	Thu, 22 Oct 2026 20:12:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9e-0000000EuKf-18jw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so84043f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699968; x=1793304768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=CQacqZdiC2QpVZEq6qXVF9smpzK6wEusVWEDR67P9E69qbnP62BbHbzgaWLR7xLB7l
         UcX4KUYXfIEa6uDUIJOoQcsSs16aMYQg7UX5Cboyy7WGwcEym2EJiHhgjyDh2gYFaKeC
         ZrK0xtI/y/VAuBfY8mSGWjQrNag8i5rVypa2fSuuqbEb/eX1hAr+6MFbqRvL8IA2a8bS
         ZKVhEu/cKvkLM6qUeiqH8AJDwg9Mj0qylSmEcJMKDNNreI6yuh9kCArXZCrnuYJBSbso
         Yz0ZHy01cUS1t3QpTO+YHPM/H/sNahu3pJWDMLMozg8jXX+AfUD6gAhoqoxk34pKugdt
         KlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699968; x=1793304768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=tbMWFroxrGAKvGjBY8IG9BfrdgvPwLhGGBaXJDqyasEiOeS9c24zEUo3cVYuMlbkXW
         GrxJffiej4jU5qUUt9/N5KrIcWhWJ2ZlqZtV058s47w8f3ew4ArUoTlQfjZQp0SwOCZA
         /kXYs2tAbXyw8oKQRvJbvYlkWN0qnR60uapQBvzQChhf3hfI5hr6+BV2l1lYE6vSqxG4
         VulE4TeLlCkJ6Ek2u/oh34SHDQVQcyyl6QRJxeU5FMHN32btEEuE1U2KwymQAJtqB5ys
         Dwq6b8hdMNgD+mn9cc+OrTgZ2gKZt11mj2ECfeF+L/XRCifbbay9nDHr853rF38FDPYd
         6B3g==
X-Forwarded-Encrypted: i=1; AKwUvBy+LOS4YSx7cyIR2MMT4P6NzdPF16I4zXfLTnFwbaiibzQOETzH3higbb+8+4G9Dq6Cr7wv38e3xC58OjrT9Ah+@lists.infradead.org
X-Gm-Message-State: AFq9FYKe6UrwgSS4Ce7eLaDj8xaTmikEhCab7Q03lSNQRBkdyg6ABrhM
	v56eDQCV1udb4Q5EP9CU9bNO+sVLoHa8RY1fBSwKfpNyLPhdUf22eNcXVFrJ5Y6sIbA=
X-Gm-Gg: AYBFou0BsHCoJhzUxe5qyx2ACraCqcAfTQcSvIfjKTeEP/LLoZZ8ybNdmhw64/0hmTJ
	o8HdV/c7OL2xDG0WwirXAZO4Aoze68A53/RUgF1mlh0TRwGrR5ZZcuYVU0QBn4U7TFDg1sb4C8H
	pKGOuLb6eXb+qbNbAoJFmXpxdEkXT0/CrGfvkndTdtfz48x1377AVgveYzYrrgADYIglOWrH3Wz
	vp6+WgR2mXjCVVtQfTnI6pGTUP0LyLhU1CE8hvvFgluOxBWue73+YMLmHD2pcsNRY9H0q4enJGx
	j/d5aBjyJT5p6fd20OdPgq88Mr9zyQwqBgHP9AZReaeT2MdZUSE7GlfYG5dVJ8u7Riqwl+zNzJb
	pBPrs30SmUsWFpHDSf/rAY1UynZ7I/uSAvLF/AzlQFHBaPZjLflvDMD5tKqbZd4/nR+U41mvcSF
	n2/mCDcqndOb60xdrF10YFZXo2m3EQWmX6uLW95usg9OhIzdjrnNUp4JQTo59P09yvOeZOk4H9q
	EYyaHD3LXU3qdlgI7o8X3l7w1jBe5kzO3ihI0TSL2NJO98bjGjO8sDHf3hJnxkRvfRwBQiFZCvB
	WrEmnKnIEx+uqDp46z4I4foLQnyF8MVxPuzXjYjCfQ==
X-Received: by 2002:a05:6000:4206:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e2d102ea3mr7429893f8f.9.1792699968427;
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:33 +0200
Subject: [PATCH 2/3] clk: meson: g12a: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-2-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_131250_464293_44B58473 
X-CRM114-Status: GOOD (  11.41  )
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

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905D3 datasheet 0.2, Table 6-109.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..fdf41572be84 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3666,7 +3666,7 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


