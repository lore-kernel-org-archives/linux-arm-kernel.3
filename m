Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A102C3ABD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=; b=hf8dcwhX9OJ5vLTCvMsS65BITm
	xhjOjJvVeBmXXv34eUdeGI3EJMSxGKLbIgsIFaotGi1J5OAoV6C8QIK3YVKl8r4IQQjlvEaYIUeRB
	TeFI3DF2rdDzl3/vuUc06d7WLBemHpN1MAKeAg2MUiM2B+UJxkaWBRM5KQo+y7tU6DA8jrHWR2UCR
	W9ist8mtAZf8HXPvD/AS9I9Rbmz0uLT9HOzeWgEWDx3AptUp+Z7QZJGq9rpzCXhpcptp6La3HsR+t
	OPWL24z7uMUn5GPeXQoFMWp2uUbrkRvL+xly4fn15Y0QKhhfynBYBdevR5zQjA2eR3fh+RMDpLXn4
	EAgGj2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUc8-00000009ogM-3nA6;
	Mon, 12 May 2025 14:58:45 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU7M-00000009j5D-3Bgz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:26:57 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so78298416d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1747060015; x=1747664815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=CqkBG29zhpmE/M5FtIvKXpzPZtqM8vrIwCT/V++MzR8Nhtb0t2P7RvpEsBz5pGRR8N
         CG56T42k5U81rAnWWkdwCVWK+2Aaj8lD23ifnXy+6BpFr2SZUHc9TxbRq4t1VEYWdB8x
         /js3fYdyv5XazW6YmYZlF1OAnLaV0WkgFviX5op2Wa4sVNoim1rbceHchd/vQPBNwNse
         VqCZI7LInIJbWafujFxCh5SVK0mlqvUxmLL/VX4ZmZLEYUtqT2Bg4/mBqLkaEW34IXCG
         P9v0TC0blr5Wodn3FZCVGG0Nh1C9HjROO7UBXqR1g0lrGxZ4JGaVu3CVA3kpxP3dBFch
         8ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060015; x=1747664815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=J1VVSlETc6pcAlaozaLvLLqsCAtzn+FfJpQgaBMZwUe0eBqlSwoxphEok8mHsz0Nb6
         riTF0rSvrIZveyU/dPkR+iDQijhtxUqwbQUMrJe8KfgZyNauvXlE//buK6nDiWXGHlA1
         B2FxRJ3jzpGM0RAEpsYAEniu60U5UvtnyfLzwOU43Yo5doDNkm5wiVqEgkl3Q6nIfZZc
         Fi4DhzkOEyKe4PXoAtardJmPnU+KYQ711CgWzvAdl7cfRkysxpRxffx9nwstxJAMjG4f
         FxlivvYONhwonxdjZ9xgOqE4uqMnhDCqYUEUDJeKKMSw898twG2Tz0KmMH54pJfXHLcC
         qP8w==
X-Forwarded-Encrypted: i=1; AJvYcCUQGeADnFAGICN3Uwr67kNjqc+8/ymCBPmwLtDpjWutSqkWivsVjba1cpV/bJUAIhqdCBmM35SLpxJchIoxrJy9@lists.infradead.org
X-Gm-Message-State: AOJu0YwtZfd550Fwdn3v1q11XQ5jzEueEaiRGMes0IS8zGHT2WkOUm68
	dO83oan4ZueeVgBk1DgTCyaMROyQ1aLAucOm71UKvMRELBD6gSdOG/5vQgH4sg==
X-Gm-Gg: ASbGncsl2Xd6lSANokCPHB/bC6QZ3V7G+E54RGYtBcHr5yXpwkLqc8wTgrDPRpW1KiY
	/GGpVu3AO/s3MstEzbEvnX3Lgskbuh8/62tgqn994Y53sBiHMD98dQ29EUB8Z9n4BkLSmd02Iam
	5IVVohbM6oo3M7nh+94cm0c9hN9rAVMpIPjFJ+jgPpTAWAfv5Hu3K9AHVl43JiXmFpw7LKo8v3M
	zdRU16y68M7nPOkOO5H6xE9AZG3y0YjssySkH/9dKlCmjtgSUGmeYj1LIZJ968XdjdPrhNS5QOf
	sxmI7nIL+gG2EAvfh/1qfn3JQG/ksTX1n9RgdVnS66HB5evt
X-Google-Smtp-Source: AGHT+IHwLWxHT8fQlj2kksRDBg+A0JhtXKo+AreGOwt+ETP5hLx/Dy37l3apsuA9OkV+nl0kGKBq4w==
X-Received: by 2002:a05:6214:300e:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6f6e47fa918mr229336596d6.23.1747060013390;
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
Received: from localhost ([2607:fb91:214c:42a4:3793:dd95:dfa1:719a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e393df31sm53362726d6.0.2025.05.12.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Date: Mon, 12 May 2025 10:26:16 -0400
Message-Id: <20250512142617.2175291-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072656_915551_AC47716D 
X-CRM114-Status: GOOD (  12.00  )
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

SPICC is missing fclk_div2 which causes the spicc module to output sclk at
2.5x the expected rate. Adding the missing fclk_div2 resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v2 -> v3: remove gp0
v1 -> v2: add Fixes as an older version of the patch was sent as v1
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..b72eebd0fa474 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
 };
-- 
2.39.5


