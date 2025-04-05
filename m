Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1811C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=; b=PWxhCE1w+z4ku2ITPklnEq32ga
	IDEOSNB9c3qrX9lhOTj4eN00nPa9hhwCukMkAbbmX/nLDrswkPwcY6wRGfib+SHEPI7fB4rw4eFz4
	sgncyr5R2Be4fCihWoWgric7mc1mXVKbE4Z5rGK/42QLmydLJbuPIHh4SCRyFC7OwFkJ2BJezviLx
	uARsF19+HsNBKesnOiMEmupvVWZIaY5XQdVUKtNE8wZFKEwWw11uJ6D2GfSoAd5fp3GxuZdHHeKFU
	aV6+XvAF/8uLqoTV9cyr050+7qoidlKEBi9XbqsvtgL75nmuXcAAQwSIwxss2DakkTBfHepQt2X2X
	EJgENMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zqB-0000000Dlt4-2r5V;
	Sat, 05 Apr 2025 09:29:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zoP-0000000DlbT-3srM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 09:27:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso5201230a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845256; x=1744450056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
        b=o51iLKu/kz6VDt65QiOBDBn3VsDlgln3s/R5fI6krqc3Dq1DJKRFHua3d98ACiZNI5
         WBdbtyoaNlnyh3bqSqAWbPGPDz+taGB/zxUEEZ8hFsoJMIkGqh9gc9lLqoooCzfZJm4P
         mjyOnJQs6liiQYeZZPvSv5Sz8yynw6OXR/D5ormmaP2EBboIEbkX0gE52uouXnG95GVm
         vEnJVMfwUxHfj9GUYsJ+5UdxHLUkYRYFGCZulrjqB53LZ7rYZWuaPWZwOkkuSv/TNZ4j
         PHp3eJ9Kbwd9hocy38DTv+hL4Jlj31u+dIfMCNu0+G9zZytsJy52YOq8JPADYBDQmr4V
         4lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845256; x=1744450056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
        b=uMYlwNUlFpJvswnmG3Xl/QMzRgoZDeuXTmiLtl8zSYsa3JqbS6XaENsDYc7JnsXHVy
         0qaH6gHvMuHRXQv8jqqu0+sxCMn9EZOFaJ8uOLRDW7IKOgGOLq/K0wUW0yi5yeUxqwyD
         DeKzaLl1o2Ac87EU+/LSqDHD3ktfvYAbB4MMTOw+zPFdWA8xN+yEGOX4hy4y2zVHaw5i
         uDfZWUaid549bsC54vdKvsjR/kxeqTjO5lkLRDWJb+ScyKX5qko9pY6ZKpXZ8hOBcFnh
         gH5SjqWk3DALxYvUYwvqOVjENpf8xLF3pskg2ySqHh78VTNtcJf+h4VYObPXmNYZwCwe
         sVyA==
X-Forwarded-Encrypted: i=1; AJvYcCWWpnl9Uwmr0mLqF5BvLLR9sOvl7PuFcqZDA95AnqAftzYcPL6xcdX2aBAeh9mcBy+HaTIk/Y8ptjDw2N6roFKp@lists.infradead.org
X-Gm-Message-State: AOJu0YzdVPzCkmi+u1o4kicM27IjMJjRbJCXtz6dPKfcTKJ0eMKpQLzs
	wTUtEOlAAMiQTCBnQ3zfC5qJTVRi9hFAiq2xJH+OgNEDXIR7jfgtvFm9HXgz8VE=
X-Gm-Gg: ASbGncvatEwhw1hZeYZgnEiCTbr2t1fauJ+sl95GfxokASofhsHnTJO5nsncdeIarBi
	4vyZ/AxhlCNgAx31pS7wLo7ztefHL8rrE3Q9e0yBmDLiyuGSooPMqoJDJjPKsjHocoSYcLnAOeV
	3Ymqqbs0ALY0kH1TXmSZUtLpTYKMBYUsNDq5TUPo/07JTt62yjwKVBFU0EMg2W6xNIsNNMLVGKf
	Khc8GTbFH1yVzQ2oal2uCAWh5uTVHutmSgrVHAwzfwIfAeikXH6Z7LT2XVR3LjsX/TdaEhQKy1Y
	qeeCof0UTO4Q1Bi13I3Tc6oWSB+dDpCsjWybA7Qu/CR6TjGSLQ==
X-Google-Smtp-Source: AGHT+IEbL8c+JGzPbn45puOitVnDeaHIThpApjBbi0QC6iao2fwFoA3sj7pZiaJmhvJQOzAGSNO8Mg==
X-Received: by 2002:a05:6402:280b:b0:5e6:44d9:57f7 with SMTP id 4fb4d7f45d1cf-5f0b3e4732amr4711403a12.26.1743845255834;
        Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f087ed1f40sm3442815a12.26.2025.04.05.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 0/6] pwm: Some fixes preparing chardev support
Date: Sat,  5 Apr 2025 11:27:11 +0200
Message-ID: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SdTjxolhxMdpEMLdv2bok/HJQZH5YHyXLZcK4xTHZec=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvQP3wue3FO2D7yoPyX3tFXWCtPSC9wxXg/6hGTMVGZbB hUsSOLvZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAid05wMHQGvZ3cUu4YtHTp 6coW45J/V5ef4p8hFa0cvPZHwTankIZ5zcd8X3KV8W84vpJ5YuP6zPN+y88nLy7l0rM9cTnLuLL G9WP4rv+Zdsb3XjxQMVAW9f434WduiGpiv0aE95O5T7uZZdvK018/ruj1KZ8/V5DXo1la9VhDeo WpifGV+IOPl7c+yAsWdTY8WLbKvITd6Gy/u5Yi644lPVpzN8zxZt5i+P/zp7dX91xz9WTX1bK+p cu+IOJaaHvGkjkhBT0V6rM6e5jK8kSW7S57pxZz4oXsBE8nxqu1joLhd8+JX1m41p9XW9U+ba9B 0fzGfZ32j64rr7YwizpmKp1fVFSz83yM3/11HQna2zcAAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_022738_239043_4DB01885 
X-CRM114-Status: GOOD (  11.48  )
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

Hello,

while working on character device support for PWMs I found a few
inconsistencies that are fixed in this series. After that I plan to work
on getting the character device support into shape to get it into
mainline, too.

While some of these patches qualify as fixes I think there is no urge to
get them into 6.15, but given there is a bunch of such changes I might
send them to all together to Linus for inclusion to 6.15.

Best regards
Uwe

Uwe Kleine-König (6):
  pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
  pwm: stm32: Search an appropriate duty_cycle if period cannot be
    modified
  pwm: stm32: Don't open-code TIM_CCER_CCxE()
  pwm: stm32: Emit debug output also for corner cases of the rounding
    callbacks
  pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
    rounded up
  pwm: Do stricter return value checking for .round_waveform_tohw()

 drivers/pwm/core.c           | 23 ++++++++++++-----------
 drivers/pwm/pwm-axi-pwmgen.c | 10 +++++++---
 drivers/pwm/pwm-stm32.c      | 25 +++++++++----------------
 3 files changed, 28 insertions(+), 30 deletions(-)

base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
-- 
2.47.2


