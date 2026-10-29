Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uQP7Y0d7;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WbgRtcSw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=; b=uQP7Y0d7sMt8x3
	s17tdm4Xw7z5MM5Zrm1RPfJlRxyyMKadr+uFPDCHxVFHuFytMOMHTVsnDAIsUq2Hwkq4LgkoBbdtU
	9gaOmVWJVAPNXT3jxppov48+PA7uHttgawbahgFayozSbkE9x42C02gBzQ+wjwNbmgdZoakagoop/
	RFDNbVM1Q4iPzftzEGUureSsANIWS4OULCXlxs9X0q/UHR1Mk3FgxK1Pqo+/kMsl8WlEJ8hgSDAYR
	psfGgvRPFwdi408BDyuksBY+/3DW8vw9X1TsEDe4KVCaCyZT4LqTZRlACJZH3tRiDuf+Hx1Top+ZT
	rMaDs7LbVXh8ys+KD1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0s-0000000A7uD-1TEk;
	Thu, 29 Oct 2026 18:38:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0e-0000000A7k5-0Eg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10159245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299074; x=1793903874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=WbgRtcSw7HgzdiNVKL4xifqbrZAShjx+1a0TAmLh0GC0U03vvymH9GqW3E12BrJYlq
         blm+nsX0U2g5t3RpBf9DZDGUHk8N2OweK8myQ3dJ828Rx6HNm8W+VGbe0Cs+9Y4cfNWW
         NhMdefM4gBpIvRm9Rxh+T4nkx4Ml00MJSwFAReBt9KScu7bx6xYG/yTz93hlY0pm36pk
         kNbvm6qiM94JWVHZJnRfJK6gS+K8nEzonLfCBw/bseo9PJYxcD9a0pHO6T0MgMI9RM9I
         Ovqk/57wlpK+KpxsZ5u0BHnRR44kvbtgnMawQ4HORjuWp1hrxv7TaX7NfQelaUOqtnb2
         Qq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299074; x=1793903874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=QeAmuIJCpDxDUhxwZ0AAUIwE0FLNbErIdGVMC2f+X8K0n47mVPz0Sj5iI276EVA7f1
         HLhkBTFlLsE/YfH5oIysBCEiUAUbRcvKtxq+vtp+tJz+csEfPb1XaSn7mp+F43UilzfD
         bCUV7FrFa/ksuZx6nBVzBKVUdkeg4MNwzjgHBS/QSVneDIJCduLwgUsXG8r7q7prG7Om
         fqMYjf/T0Q/fbedqNrCW8fkPYHChU8jkQzcgjUXDe8oZe9ShalkwXaZ2vq1GhHfOX0yK
         HIm1bgoAmprpltpDkdIzIcZxdKcrJpvVmMcR7XPwQVMoRWF2g8I1/t9IXvQBFkI8A38i
         p/5A==
X-Forwarded-Encrypted: i=1; AKwUvBwattSp/8dZvsleA0dZfDIcvFzLgfweXjSWDelI+jsRHQJvgcr5chyexGrlx/2H8UnciyjKAy1+T3+B6Zi+qR6c@lists.infradead.org
X-Gm-Message-State: AFq9FYIgBc+iIijE4SULiUNCeFrMBdqFcpErOZSPRodZ6EexOkG/ndxo
	N5qGvP2jEp9SeHhBk8ICqBEFrB8rqCewddHbwje6SOftvOOmNk7gkog/3KDmGOBNh20=
X-Gm-Gg: AYBFou3pH2zc0E8Q7yhZEkF7tlAMlNRatmUGriaTbfq61Uzteehy6qG3hP/psr7i4VX
	2kKF6xCYKVOvzBNgRjKaS7YG71/ApWSRmlOAB7x8DIqrRJBQhN2wDrkuBf5tUGbyAqBHALyBIZW
	gEQrCOSkwcZiRniD9DoOL2MCUuykIyZfi8IvJ8RBtT7dw4I4NCCGmsAkuTChlqdQakmq6E8vxxt
	evWLr6DyIuSBgU0XOxVJW2neF0FZB9MiMuwuhNDZVJZdCioFrT1m29ugOMUhS6LIrilOk5diYvW
	J0mKuJPxNBPRvQGhYa8hQmDkBx3ribncndc+1ErOrD88PBwCTPMBS++W+nq+0vm8qT0FCyd8u+z
	1wt38ZO6cshdM6IoLjb44eCS7khNKwUMXcJM/F2F8Xg9crc1dEOuxult74BYyP/H8iuyDQLwKZ0
	/OZJcsFqo+Ny2M3gFtLJyMnj6Khzo+io0lSBztIXDGbFsxzQQMtk7LQaCkFrC/qZ6FIzq4hXLRE
	b7rLeVjAni0oU23W0P9uEXKcBdPwmRiJ/NqeDq2KiUGclyYUCa74yFa47fX+P+iLclPuvXqw40x
	nDUp4ltFcckf0zATQTLk1fTj4B8MqrfNZr2xwjhJ+OtdvtMzmoBon6ED4ujeZzk2R/dS4smEkW5
	154qJv4zKvDWZQi4G+Q==
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr85280425e9.16.1793299073743;
        Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:35 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-2-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
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
X-CRM114-CacheID: sfid-20261029_113756_130700_21D5375A 
X-CRM114-Status: GOOD (  11.24  )
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


