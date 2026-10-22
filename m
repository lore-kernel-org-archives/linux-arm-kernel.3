Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190FB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZysWo7FS;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XLOd2+Dj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=; b=ZysWo7FSKWHZRg
	AI1zfq0Mn4yL/9zUHZDuBveAKw6fm0B1J88fzyLdaJguVkTQTfHNcnhF5oA7xobujnzf/I28V5WlA
	0HjtnpaQ625V2dFlsu9i20Q/ciL0Vy0GBrvVm54WDViCxo+ram7S6rjWzx54R9WBkXQVIsr8Ao2bG
	0PfaIWZW6lttTMnFEbhLTCIS6DlQ76vv3JKv+uHjBEBgv2xhhj9HZg7rLPLptx10meuo1mpewQG3x
	WSsy+t/AiNTs/Ikq6AFD3pRsI5qssXBno7X+6XrZvVY3vw9UImqQj/Cs/Z8gxevEqCdBG8az2E62N
	A2bn0O5e/YrEAHGZjW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9l-0000000EuQW-0c2w;
	Thu, 22 Oct 2026 20:12:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9f-0000000EuLD-0zb4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so1767985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699969; x=1793304769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=XLOd2+DjNBEfwOUJDKBlGD83Rf4HpW2vGa67Cr9ByRnaK7CzfVDjyonkLNRwd6PCBg
         zbQ4jE4zb805PqeimRAYWg2v3gd7U/bN24OFgumzOv6RNvqc7HseDzzcdzJNRsuEWgCR
         8KIoSAEFziTS66juDgaC+QkXg0MWG/2NreYSe6ZccVdZA4k/3fBWTcp/UfTuUpo3Y4J2
         kbnvNTm2DAW0jxt/oygaUEQe/ot/L1BGWk+aAtH/pLonMNT/BTwRGoDnbSykNZYrkKH7
         UMO+77q7Qqnem7ynzdWO4EFUM6DyyjMFD87VhGkO02XyRScNTSDBRZYNBJqAiSss+PCU
         A0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699969; x=1793304769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=qPteB4mlbdOAbNmgB8jc/FHFCDE+XkyfEDudz0a2jC3DonwtdtYoBzQ9VbTZcTUuUZ
         gXwlAVG3nkO7H7+Wh+x4/PtpuYv+eQL6yTPKBSAS9ooQbqIRw4r9FOORB+B4gMI1h6ZI
         0SMebbCK+iRdBcm3YSgOkmBpDZt1ngJBSk7d6VTOwoCYyjorKOA6DCy9U1yO0DsLy8cD
         Mp3suTUyZ6JwAFL8vTZLUS9JNQLYdVXnJkZrT7WGwz7a2auWXNsBroUUdAdYC35uZzB8
         sX+tHkOBCjGoxHp0UaITYmkBffKOANBmwBgyosxi8dVrsMzJS36jeLG24fEJTvhFaVc7
         sdOw==
X-Forwarded-Encrypted: i=1; AKwUvBxxwJQKeahAW4bcb0kMw4sF0BSbqG05M0da6J0btoil4MVsA02OwiVM8mPqTsm6qXjDpiZyb9d0XYmNDssIIyvD@lists.infradead.org
X-Gm-Message-State: AFq9FYJVHg1ltj6XnIt3udknjwR3Ew6xkViEb+HsMq7LEwPA71IK99hj
	NQ4pfM14hMhNxLMlVyTEXfv7DnSUMXUkRcNwBtPe92uwZkrOS6jdd1DDCeLLbJWPEztPV/YaETY
	Hvu+3
X-Gm-Gg: AYBFou3LXB64WJ1qTSNhpgr6glympoDyTMwbRI3c3DgrCSKffdDMq38tIAljFxRywcZ
	6/QACFUwIXoE1EftJklbFRuf6qv6ULtzi/9jWpDKkCWM3PsANeoXxB6dFvtZLc3JADC5EjRiHgS
	KphI4mg4lfAo9Wbs7Jj2YWejDH6am2Csh5ff7bLhmO4Bg+4RhwAf5OyAhLy2lNQwsL3YkfjCpVs
	zg65un1TOXNAi4spObvwsXTVy30fPt5fEjNj0RmU+ugcgHoFZWLlVH4q207BlUvrl0tK70cOBkT
	eqUnjeJhzwmkk6X5SdrBSoVqNHY80sml3XZy+knxoRuTMh/8ix2o9zfxO7RI78HgaXA+Tqwi4JP
	iMkx0JLFiUhvRjZbTLN+ULfebCfi8Q/Kn3MPZ9FqC92l40KnWh0P2CwtqgxFRSLYJ9jBQxBFKT8
	DwxVMnsCgZVQ6dFnKgqm/eN/ub0ew0smX8xq24lG3QIYDR2O0ZfK5NdsG1sJFPMaSr1rWHa2YkO
	Sj2wXql5s4Qo+QGYiqnGQ258esKWho0HAsp6juXN5vNbqK5OZ7z/gxVGZ6SBHLH4WlRoLWm7Gki
	+hlj/br+Rnj16Fz5O4ySPgQNzBDyTd26hq2XVXonMEWyCE2bSjzQpEyvd+xXU4c=
X-Received: by 2002:a05:600c:1c1b:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a211c7870cmr2773875e9.2.1792699969349;
        Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:34 +0200
Subject: [PATCH 3/3] clk: meson: s4: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
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
X-CRM114-CacheID: sfid-20261022_131251_361405_8066D356 
X-CRM114-Status: GOOD (  11.74  )
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

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


