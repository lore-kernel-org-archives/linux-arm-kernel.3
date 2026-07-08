Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB88C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=; b=EyFZTbWjU7AOGY7lJBxfsl0siC
	RkKWOfYlDYdV5FDWdyfEJkZlAK9Jk83uCw4FHA8z2YLRV75UdbwGj7Qj504kKfoMYsPB7n7CLv0KY
	vhDvQ8UGbqxDFIrsTAMpgUVtP8Ac3ruD2024wgmVYXt9Z0rprZt3XXStgDDOtBO97cJKgOClVz6b1
	AgHL57OU/R8Qqkkf5aNbR107Y7Gubzjaj1T6xfAIrleCv6fln2D6gDuDj4yCfiQq1+EzunuAofC6e
	ebKhvCw2RVzfFvxpeLUzYmKTxzugjJewjhp/y4BKZpjNez3a41PyBNGntIfi/kU1dzQXHUpRQPN4g
	Xw6+X5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRD0-0000000H5PH-2OVR;
	Wed, 08 Jul 2026 12:16:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCw-0000000H5K4-3GaV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so609491e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513013; x=1784117813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=;
        b=npg2dazAFyGq58LFT5LSvL5oNtjikMsqDB+pQ+oGOe0QetOFVc0fIWK5tdu3QGJp2U
         wp+BswP+amijmajiBIC9nav7ZUU/Ohl02CgJXQomMuFB7RO16cE3aPlbNZEukzeQhN7K
         QtPSZXurCrXSetZadqHwXGXqymYpeOAUKEZTiQU8X+WKDljumgYI0tJDRjf4lJExmvem
         8/Vjyfl7RjhQuDPRLhgmzlKiMo8ZeTDAk08fM1Cf6OiIsii83zDKfxXza+RF3zmzPFcl
         mYeClRor5fg0NdMZ1of9CFuz1fHYDFC6gSjjyHh5g/hVJ/SUI9FUUbWrNjFPLTC+vBYk
         WUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513013; x=1784117813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=;
        b=qlNhHQi7EILH52T743HamzoXbI41mkitx2SWaVxRN8pFp1jzaPmV+XEtixqQY1EOjy
         mdvhS1TVJwlFcDs+1cH+BcixeqGekBuct4uT1CSjUPYvRlOa1y0CpeCURT+y4+GzcsP3
         LNr3MoASjBAPOYs2O0CizmaWZyy+zzoFmu1Mwp+miS71n0nnS68joewolGRPyyV5AO+r
         QM8pFc9z1pAFnJIrCKAP23ILM1nbJrgJmWyjmpCusNwQ3vUTCWqQn0rMRGWJatEA86/6
         bTas/eijs1CxwL035OQdrBLncc+HuRfOYJZLt7TrkkDEJbUCnZL7tL+USoxTQcLcy1uT
         UT+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Y4bXzZPjsiooDcy9S8DpcZpNI2J12FNm7tgHfmys73q5huxHHVQVwPI1QsSeLoFH9FWstHD9X7A2WMRA0LVz@lists.infradead.org
X-Gm-Message-State: AOJu0YxOxbWfJF4ryhe+54OMFJxtdcSjB7aTHnhADuZjfTw1jqZxLjO6
	DLWem5e6E3ao4S0mZGE65lZuozJZtRhO8iJCREe7nwxqG5iJtylb0HaJc1s4YDH5QRs=
X-Gm-Gg: AfdE7cn7/C01qx2bUFKRjIPnTbUiCIky7Yg8/WR/qceEYROhGv20vbCvBuXtqcff88r
	8/k0t7nfyBIl00tZLAdlY2e90fnPsWZl9LiL6qMipqDlChYl+JEc7X3jD/ulZPbqUGbV/orp7QJ
	geeitxvfI3EKjXWAC4LTS7I+IriNOxERxxUs43aZWGC2ivsrd1xaOuvPhK3hw7mh8QTbuWPOiUK
	RF8vnCzrr+ZMtSaZOQ5zxYrYNHwXVPji9Wfz/rKrM6t1b3c0GBNarOISJWkIcTat1M7swuPgbD6
	TTt6AbgrNaCY3RMGRdg/0RkkJQNTRzBRXiaQa/rkX2cX8Sqru8mTEvub+V0qi+3+4+mhjiX5Etm
	emhwBngtGhlIQ3+rXuE70udW9EUcpKJrnbookc3lfhSksFT875pcq29nRG5IDUQH+CrKCLQjyGC
	Fxklk+PlFtjtOYnLCj0ZRz9wD9G0UuqAwt3Z4mKEipj9smOSlS9S+ByNBkrA==
X-Received: by 2002:a05:6512:1556:b0:5ae:c3ff:ad03 with SMTP id 2adb3069b0e04-5b0114a1798mr401304e87.64.1783513012467;
        Wed, 08 Jul 2026 05:16:52 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:51 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:18 +0200
Subject: [PATCH v10 6/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-6-09dca03c8a15@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
In-Reply-To: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=tWBE+9nC9oYSk5UAsuWGi9/zHXxUjrXV0Pqxs0s1rgA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+t/hfQEjggqeMYycAhhahuTzJfFGICtE6JR
 HN7+5jvvr+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/rQAKCRCIgE5vWV1S
 MlZoD/9yv62s1VvnHa59NCKpr13J5p0XHsobTQ9Js0FkXajv8kKDavWpMXaPqA1/AmtkrMXqMqw
 ZwMkdvj1jCPSXkEFHKZwBFbzulV2f72Blr+RO/mN2mgHxWz+z3j6tl0ADhg9hqj39d14S1SsPcQ
 jVxGmpmx+YP9/c1Olpi3DN9g02IUvUSNUYrU+sbmySAKTXyDOlTwSsXUuiUdlF+EzdFsnv4FkK4
 U2fY4/9HibrnawH40WqgEF0d9yYyqNvVtdnIR5K08U6qerNUrsJ079KaCpgf4JB+SljjkF/h6mu
 1i1KREngKDsvvVB954tvy29pXw8MVUdA+EVazQVbaUURn5KXsOC8tMQ8wZLp1SDgw/nKrBr41I4
 Ng2dZVhl2qNMagQmM41lnRtpweOGPMQuSFxfkCDSyJCOAC76MHyxbGW5AuQDiYjOmyed/b75mYj
 /taenYi+VAO/4QCRb9PLG6j5/BBgWJ21aKUgBtnMV9Ey6Bjy9OFQCc9x5SQdyNBtQ+lIRp2JsFL
 RPPo41wwABDjZ5ghBkx+8pylqT5wr01QDsRj4A8HoXdDfm2Qqj13f2ncXrc6zOnR/+kvmKLUeRF
 /IFl1ju2d9A9MIXz/sHCnhA/UYAFNT3BW1B/K6ic7V3XWg4eATshSWTYcoi8VYKoPsDHcmtougp
 xYoEGDuOb1AaQcw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051654_846704_FC4347DD 
X-CRM114-Status: GOOD (  10.37  )
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

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 18228f5b80e8..d1bd59d73799 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, MUX_IDLE_DISCONNECT);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.54.0


