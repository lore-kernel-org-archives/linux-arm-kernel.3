Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631AFC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVxxd59a0doljp4cj9wSApSMEwIu5WK0T7ewILpCQ84=; b=gNQ/GuuQnHp6bRp9MfRjGtTwbO
	T0mYzMTDwenAZ+KAEbN16fkeLTGk8gqywlJEjoQP2xfWbd5rq2f/npJEFat6DgH2hE/8879fn+z69
	aUNoBD16OTHhsQHdcwh7wA3HcO0J85x6A8Gz1groM7GB0ia1tknSqP4s3VCawkyK7LBu7xLrK7NC1
	TIwFeOaTdFNSc+8rU/ANlXUildjQ9lgWmZzFoNc1MbuuveKgWV7ewvaYhubxFxe4BwzqeLywB3O9J
	MmyFNGND14Lnc0opdxIZpzlSL3e6u4BvNlfLjnb4r7sPIh0Pa2olleXHaSTl5lTt+d7mXAg4dSQSq
	+k+Gfmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNN-0000000HIlB-04M8;
	Mon, 03 Aug 2026 14:10:45 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNJ-0000000HIiZ-3pAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:10:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6ae534c2aadso943772eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766240; x=1786371040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVxxd59a0doljp4cj9wSApSMEwIu5WK0T7ewILpCQ84=;
        b=bt5AVngV14YZhsIc8EDFref/aryKO6rshGfYOBRD+SjVy1UpZpNRqM2VO/hQz5fCgc
         7LOB2lGNvvgJ6Pi24NB0JUt4ge7VBzRRQ1eiUPwN8N7PVIOfpRTyARIyCRUECE3PN76M
         h9b/NYyv3UePFVuS+piK2+3olPgCOSFu9kdx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766240; x=1786371040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVxxd59a0doljp4cj9wSApSMEwIu5WK0T7ewILpCQ84=;
        b=ZlkU+dBg+qocv+bU/AiEJeq90Sl7Ffw8VgssDiHv1erFRIaq00TScI7yNo+3FEVjxm
         cCv7PSHSyZQoGIaKvvAl09amDlJuDCMGbgq6fsnmc9YCabghjDrxqB4y9fOfEaTHiFym
         QSQxweUaAj3mirrjEeVjvuLOfnpZipT314rcODV1FCeqlfvLdtrf35fM5n0pNQqp0SWK
         ElYOz7P5rfjDi1GiOGpUc4HMryOIC0j/8JOlq4jXusyWC3mPk0LpS9HowtkH54dSWbXP
         lvNMq9D7xzp/aNyxgmfLzW99ASbvdAEv0zo0eqoy7e/xUV7I/f4LTuuE2we83ZJnCU+J
         s9CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rri0tpN14OWAC0cyEfHaXqhjSeHdKCw1iiafiPUeOBFQ+MZMBrYxNPHq2Uxew9XX7vsxHQaLe2auTDBlL/Ds9oc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8k7Xpn/6TwCd5VNDsMCkHy/0s3PAIXlAIzw7xu7ZzktdGuKQ4
	C9K2KrHHadoM9gOdcIALTn4P5fHR5dmnRaAKwuyPXpPgPZ6D16fLNeirhYOZrPefLpZfaBbwO/i
	51rs=
X-Gm-Gg: AR+sD13PJlTuw3iUKTUbFAJPRweSdChCOFCDIkAnZwVvDVxF8vjHDUs3rwKiiOThGtM
	24TlAUQzP7TJAlFpXha/7Ngp3N7rUXnk6cx8Xr8nrZrutxA91Xh9oN7deKiJWG+rKvlve+yx+CS
	lGdsTvpMB5mL7hcE0Bnn46af705hpKt5oczubhe/htSMnNNqJpDdED1BcUklbdEbzeCsmZvGTu9
	Jg6/tgeEniOfqtqbhVbmwwAeog7dQZGVs5xOjtGAYIZKWJLs1L5lnwufIwk8gZ5OD7wlgfgmfIS
	SGlqyVQDcBy2+ClEoO1c3ymIvtkm+ity1jtHRA602+fZsgTEiu7/f0gg6u1mJVe4skvJgZj+1Fn
	RvYuTw91QdlxqfAME4fQmRp7G5qj53dtm0vTjLUsNIuIh3txT0jJhcehP8CbvBt7Q/JBZn0pfcT
	TS5e4E4o623SUB8uw8341mORpHos06EytpeOTjpBQAOpaQm/YduepbiIA=
X-Received: by 2002:a05:6820:811b:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae4336d8c5mr15037985eaf.29.1785766240682;
        Mon, 03 Aug 2026 07:10:40 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Fabio Estevam <festevam@nabladev.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2
Date: Mon,  3 Aug 2026 08:10:24 -0600
Message-ID: <20260803081024.2.5ce19c438ee3bdfa91ee7d414bac5ff6b16eaba8@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141028.710706-1-sjg@chromium.org>
References: <20260803141028.710706-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071041_988876_970A2045 
X-CRM114-Status: GOOD (  13.97  )
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

The RV1103B override in rockchip_get_drive_perpin() forces the 2-bit
level drive type for every pin above 11, but only bank 2 has the
2-bit fields; banks 0 and 1 use the 8-bit level type for all pins,
as the corresponding check in rockchip_set_drive_perpin() shows.

Today this is harmless, since neither level type is decoded in the
get function and both paths fail with -EINVAL. It becomes an active
problem once decoding is added, as the pins of banks 0 and 1 would
be truncated to 2-bit values. Add the missing bank check, matching
the set path.

Fixes: 6d3ea3120eaa ("pinctrl: rockchip: Add RV1103B pinctrl support")
Link: https://sashiko.dev/#/patchset/20260729132736.3807082-1-sjg@chromium.org?part=1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Simon Glass <sjg@chromium.org>

---

 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 8bfc7ab5de15..08084ed2cf1b 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3212,7 +3212,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	u8 bit;
 	int drv_type = bank->drv[pin_num / 8].drv_type;
 
-	if (ctrl->type == RV1103B && pin_num >= 12)
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
 		drv_type = DRV_TYPE_IO_LEVEL_2_BIT;
 
 	ret = ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
-- 
2.43.0


