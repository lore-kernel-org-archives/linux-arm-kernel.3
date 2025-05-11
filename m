Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E1C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=; b=fn9pnJS+P8j4ROe97AiXbB190X
	9pUZaD11J2NK/ftrLGiF8GnJnc1+9nTQFbzQD3ElA5zGTzWZTC7xJkEyH6CFpRenKNqb9bgIqrGUK
	AMTJhNVquao+0HGtYPPhLy37ZijOn0uDo1eD1IsMPt05sQowArkZ77EelVnqmWR0zCsR7zCD6aQpN
	TCEiLn1ldSZccfnhZ9AV5MBZ0gcg9C/dEk/LPoOBSECSOq4zn5XKrhZPCCDgS8kA0XUHdvLQEpxij
	cMSId2zE4HXmY79eG2aOvTPniAK0Jvpcgb1zjC0zh+vva5yGcVlKDQZBwYFIrxEs1uFzJxo4yAvhk
	9k8V1uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAhL-00000007cms-13de;
	Sun, 11 May 2025 17:42:47 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAeG-00000007cSb-3ywa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 17:39:38 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4772f48f516so53082751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746985176; x=1747589976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=K0gK8pph0mS4AAO17mwpdWfa/zxuPlYW5s72d34M4fbgf/BBUMJbLgp4ZAzbwxLScu
         41VdkotiXBpx0EPMGMRrRXUPbWnxMeIS1H86hQumxNaNjdjUldDvqnbRkJsZqM100Ias
         xoUVR34sK4PGqyPssJyxMhuhm3DvZznHXGM7T+sPeNbb1ME8maVb8pWeSYC75cB4QzpC
         RQ+J67yCXGX2jls1GW/UQNZAafPiSUAxu6QqWN5AO0Lt/UsneXC8ovkY01U7qjtn9RRC
         hHYBHUjxMxZf7sI3KSoKsnRCRfzBuPGRQftUUct14sC8eV0noFlmiJ+gVoG89RqVXQBJ
         0BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985176; x=1747589976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=OsadKXUYSAbtZzToMZk93WC4veyL1bhV0KiEdh7Wpepi6tpjEe3QR7h1Kfk9v6YyBc
         iCZFtWXMqPZNCc002q3j68F3mN1gjss3tMNESrwKvsJZ/4T9QWRpQ4LBqxk0g7WJ3Udb
         f3LJWbHYGYGvUDkNcVxarj20v1z/TkyPLjELN9G+kwl5iauaFsTQCBOA64PeFr3i8wTg
         IIXGk1+rpG22pIc0SVVvRS3iVriaHRno2/Rqeoyl3TaQ63KWhh7ac0pYGphMOzSV5evT
         GYK8W8I8Itwnc3iWgW/62Wzfe9M3Fa0OqDbmcNdNQLTc4kaR1smhDudSo9Sw3clT1S6n
         4HnA==
X-Forwarded-Encrypted: i=1; AJvYcCUTyrFNGVO9FUcgrL6sVMAMNRVY4ykDkWk+TmM1lRf1tJsXpO6iuLaTDOLZe/s7IuEo+MryWPpaa4zHMySd4XoG@lists.infradead.org
X-Gm-Message-State: AOJu0YylEgh3SxCBEUMt+6pi/3mlVgNIGTpr8HWgoUON7gWCACC2ua6x
	51UIRKp2BRSVOVGTcIU7vbslnTs0tV8ellXQ5lkFFYq2uU0A9HyHbQDSrGAiOw==
X-Gm-Gg: ASbGncsSmUdCtUGIspWbX1IONPA1d5Uh70fjlrTvAIla92avJmYoAqR+trkWVt1Nvx6
	p+1wIZKXH2NxSqUR/4QYWNi0tYHusE7B3NAv7f6+nbXQLuJFOqIRnrE//4kLhy0J6wUXYyYtVev
	D+MY6P+0UZ33LnyLdfAyGD7B5GtURbN8Mi9e6L5aFyBlkDgldO+ALq9HOCAMBT5mujTB9sC8MNe
	zbETjusyoNuBvkoSdck6h+Pjc8CmnQ4C+SN2mfPLM3QWbbCAexZmKTwdaNt9BUlmxbG5SNDLVRX
	YLoC9HGeL/7bUMdEJ74EnR4Lv8vAvuInQFZHBrdoPu1KcQI=
X-Google-Smtp-Source: AGHT+IGbtN6p73kbilpYBJERKanPWex1vuDrJr9UjFDjOEDztJIOHD7xUAEl7SH4fqjj9AVcDWDKXw==
X-Received: by 2002:ac8:5d0d:0:b0:477:6e32:aae2 with SMTP id d75a77b69052e-4945285d6b1mr173557071cf.0.1746985175732;
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452588d92sm38259301cf.59.2025.05.11.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
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
Subject: [PATCH v2] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:39:26 -0400
Message-Id: <20250511173926.1468374-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_103937_003555_7ACAF666 
X-CRM114-Status: GOOD (  12.21  )
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

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v1 -> v2: add Fixes as an older version of the patch was incorrectly sent as v1
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5


