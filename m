Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1970C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yAQPUlazwxUoIHDbZ2y6Frkhw5As3L7EqQJ2gVvyyoY=; b=DzlYdopIIgDLqtfZJhjSv9RAz1
	OiL9OJmEytKrHqiKuospc1rkrihNP5he3ZreemCihT0Ns2q6Gf1hvRqcW7c3RSPwXBmHiMCeiasQk
	Qba4b57uDEApEGOUvhs1jJuCVSg0iF/Qou6PPuEBqWt4RzblkWMSQxzNIIyupXMOXGJ2ue4AUvmcD
	xzxu2m+66IbYMMvK9lr6ay7AUL/bH4gzUGKHQ7Ah+9WA13cx9F37cHLYyaRJOteFsRk4BfM0TFcEX
	G6NJFtIYSaj9YYApFwEXbaLafdI+f26tciKcQ8Y9JKNMcdTf98OFtNuTImqEhOPic9Ks4Z1wX/Dzw
	8twH+J+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdFl-00000001XvF-0lfj;
	Thu, 15 May 2025 18:24:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdDh-00000001XF9-45C4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:22:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso10177715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333332; x=1747938132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAQPUlazwxUoIHDbZ2y6Frkhw5As3L7EqQJ2gVvyyoY=;
        b=IqAMtl3Ol7J9ZSomcEghhxhMG4qd0iM5z9f8iDhp1hazawGLuGLzJ7JWd/fUFMHaeI
         V+NO6ljlOHHfbB31jHmHSdUUlK6zNEBzRUrYJmsz2ct+EIzYs2vhZfbhF4J3CE5a4QX3
         +YlwGpZS/6T4vkhhU4J9wjcJ94VbfCiwAOi19trYto8CdHThuQHLQgt57wROZb2gHOV/
         XZPT23Hony2EaAWk5EOM92pHoM5sfWVkJWnxoqb79u9WQeZkYb4veGk6ad4vG2CbLonH
         CFBar11q5Q3ZRWL3DXZJDJOEGRcFhdO2G2Zci7lPvsHbUw8GV00wATELVTdB+1kjMtU0
         4Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333332; x=1747938132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAQPUlazwxUoIHDbZ2y6Frkhw5As3L7EqQJ2gVvyyoY=;
        b=N30jXE7OdAIB2Yguy0MJnRh+KyV/4w07jX5R9hd8isr65j+AkEu8gbQBtbiNJJ5+ns
         yng5gvVIAlGZHGUmLtJQPOV3jXSNFNdqEuHp9iltA4DpolprAXznxIXRliZ9M1CcvaF9
         +rdP3u6fCCw2Dic0Ej4OP6DCzIAiwuzq0qDf5fSgttSwVedfy2HYEWGer3hZet4hlwqi
         B5qCBuwKLnq7kZryOUSJoEIAEQNTraBYxN4eblDthQAHtXQsu8jqWxhemZSLs9SISuJO
         wnC03tyq2vVQ95jix/5m7ZzBbJSRfD1PmR3DZCy1+gPNrQQxJdW1KQMrc6yKGUYEIcTf
         /JSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2AXygixRch5U8GAb3JyV/A8FfB15ESOU/vOV7TrJKP67ViZ8HCUV0YFuieYMU5/hA216K6N7gHJJd0UCpvX45@lists.infradead.org
X-Gm-Message-State: AOJu0YykeCKks0e2uSglvTwCSp/dMDIseqzuXyDjjwC9zoPHQrFhyyyY
	KUrurpQ2bLT9DAt/JkNFqPGu+Ivz0hP+1TrVczm6bHnch5CNIgJmNbAu
X-Gm-Gg: ASbGncupXlrfD+YkVm8MvMn1RTX5MsRRL5hWtM2q53UeIyaTx1kHeRfN18O2CFIWh4X
	AhwBmg5P4YCWt5cgQTwaZ9bAeLweMkRqK0TjoKm8ZEaDDZ0VeSzok5wYjT5zd4LQWaUTn6j+cW2
	dUqDoR4X5+qPeYlNB50vzjp71Nkcn/TTBTk4dTPVw3nb07a8/OUsGQocY8uf30hlf7Y2vnBGdQB
	hIJemmgu/GHgW3Dm3QlQUNzCWA5OW0kC/quPJPliqhoKsFbpkhPWmoMZjheq0MLct7Ey4Wwy5qB
	IaQjv1wn3BfCGnXKeI5OlbbX6oKL5dRDn1Jn0NCxP733UvqTyHaL8NBBEP8bWTDbHfr1k1IMpWa
	jYw4VUwKM
X-Google-Smtp-Source: AGHT+IEdxsvYrXg4MZ9MrhFl2c/AvaYeZ00NOmpZwOccgoStuDdYQZs0PtZRXjp5OTdWelb6F0a2dQ==
X-Received: by 2002:a05:600c:35c8:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-442fd63cba3mr6819785e9.17.1747333332122;
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Thu, 15 May 2025 19:22:05 +0100
Message-ID: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_112214_009219_5D3960DE 
X-CRM114-Status: GOOD (  13.88  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v3->v4:
- Added __maybe_unused to the of_device_id table to avoid build
  warnings when CONFIG_OF is disabled.
- Added Reviewed-by and Tested-by tags from Geert.
- Updated commit message to clarify the change in patch 2/2.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe
    support

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  4 +---
 2 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.49.0


