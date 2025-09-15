Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB085CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EihPg0rDDUsO2zpTiZR4g9YFvnwO8fGm9cXNKFjmmM=; b=vYZkru1PWhuSDcm2HRNQoGHzg3
	a/05N9hFdsWpDDIinaHZ6H73Npzdxy3vL0fo76S6kPeNTYyuj8QYoO8N2BUOG6qlsGQRWjhDSWEL9
	adiKsVbm6xLTLYX6ltDroKk9sforoIhzxbELxF5N4fGn+2k4vtPJDHcgtkniWxS0pCsoLafnSuU+z
	FpBtCY9LUWXrX5quLA6s/hdUv5BxfQbPxYUGxmRD5OlRkWGPnurNYQoNfEmtRAUI9D51hRS3pSyO1
	THE3EHrvB8gB3aq8wVsSbygBSJGm944RNVjeYS6DR6VF+1F3wl5VwG4Yj4o5r+OI1sZsOjKt1QgOS
	OvCyRntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4eY-00000003E4N-2jeq;
	Mon, 15 Sep 2025 08:33:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4eV-00000003E35-1tM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:33:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5725e554ec1so1046784e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925213; x=1758530013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EihPg0rDDUsO2zpTiZR4g9YFvnwO8fGm9cXNKFjmmM=;
        b=k9az18p6AypGxXc6zztfnM2xpI4NzDsiHrYLZFBS6NuoudWgkjlxCz5Lcl+faUJesF
         NLaYA3QwNuBntOBIiCFCVPstHrH2Q4dcxlpj7OHwBQiKUtnMa1oR1baytbAhY2IQKgaf
         dg3jpH7A2XujkrfJ6GsDNaJtt6lYz3zixtoltgkpv2u0PUXfCmp2+Qx+xennvnAcbKgT
         ZenhytkgTjuASgux1/5wOL8imoBBFlVDJepl2nojd3eAhjguUQxx+KAAz1+Q1jrwzbRq
         /CUUInFfI8A1hue5ujoDCM8HmHWhh2kTRZBjJyKyeZxvxCBXQonJBLBCWrTiOgwZdz1m
         eJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925213; x=1758530013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EihPg0rDDUsO2zpTiZR4g9YFvnwO8fGm9cXNKFjmmM=;
        b=C8P7hweWnfGmGwwBhOp42k3ragYJY29Kdo5A6QaQSEq3qLEI1lr1kEPXQaATWN6fMn
         l/JAP5Of8r4p0I2jtPk98cV/PCekVMdmOxti6Og27aR8TjYU/t0alI51h/YI9uppFNcK
         P/nZu7lBrHqa41P604dU5TM7mzfr98WjitPRnjp/agZPwDQmX3VI5mjTuxBo2OjiKaFo
         LIMdMSEAN6l084OGvqeaI9eVERj3iHipqmDBgdz8clSLZEHREy35LMhIMTb3TqogOUra
         ZBR3+4Jwor3V31NNLzxJWJi49VUozS8Q5Y3whrMiCcbIJzuRkifBmZ3rnVVENmq76cpm
         zPzg==
X-Forwarded-Encrypted: i=1; AJvYcCVgPGhfqxzpNQIHTWMrD9urQpV8LD568H4UqhWM+ImMkqBiS/PzfkqSXFye1yNsKydstBQO/O1O4csHTlRnwY9+@lists.infradead.org
X-Gm-Message-State: AOJu0YxszK+9DhNzXkNuT7AHaktUkbJLTZkYWHzCNgdMUJcRaINaaoPx
	joewdwu18RAnG7FCCJH52QPpjO5T3t5XqIVg9coTMb8rUzX3O8OI/SBt9cmBygzwEqw=
X-Gm-Gg: ASbGnctrA5730laHfOHx9IWJOD6iJFqDYr727QT4rHfyk3SyqdKcx8m1VD+To2+CH4N
	yIWQu0YJ7FnzzH2mCVVXzeHtyLmCCRk8xvCQ3TX4g5r+B1HbhC+cXgzFKo4h7Hi2P+MleP6xgLX
	Y0GnsWzJHYXrKrfnsm2yr1XI3KPjhE2GAcJqJ7yP0v2pcIGvUdIdOwJX/1zL17LStSOaDwowxDj
	yk8EXMLLmJKuNyW7wM9qzo2/uOwdVBYM+MzCwWWXc3sIA71MtllZOXAE5RfI6ZLEEOP8eECRTjt
	NWS277VS7Hm+jb6puy2pfssJdk/JTcMDpD0q+ZmipKyMhpX5oOKqYRatK79Mvcbpw+XGywV8URG
	b6Eo784pmng/1B7CVR8G7rNq4gvpp+dCfX4+qgLL2dHlBnUqBT8GxN/Va2jOdN1C9TZir5CXFTw
	8i
X-Google-Smtp-Source: AGHT+IGOXTY6MavVKngLCpLB1G9dg0jsTMPCjkwVytxoyznWD2WrW7pxjPzUDjOIZ3mMkSDu12yFmA==
X-Received: by 2002:a05:6512:2585:b0:55f:43ba:9410 with SMTP id 2adb3069b0e04-5704b52f23emr3366686e87.15.1757925212793;
        Mon, 15 Sep 2025 01:33:32 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm2335142e87.46.2025.09.15.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:33:32 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 0/4] enable ROCKCHIP_PM_DOMAINS
Date: Mon, 15 Sep 2025 11:33:13 +0300
Message-ID: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013335_510576_5C06F46D 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Hi,

MMC_DW_ROCKCHIP needs ROCKCHIP_PM_DOMAINS before MMC is detected
on Rockchip rk3399 rockpi4b and similar devices. Make this dependency
more visible, or the default with ARCH_ROCKCHIP if possible.

v4: fixed Kconfig whitespace, added select REGMAP_MMIO to MMC_LOONGSON2
    instead of disabling COMPILE_TEST

v3: use "default ARCH_ROCKCHIP" in ROCKCHIP_PM_DOMAINS as suggested
    by Arnd Bergmann <arnd@arndb.de>, enable more MMC drivers for
    COMPILE_TEST and remove MMC_LOONGSON2 which doesn't link,
    remove PM dependency as suggested by
    Geert Uytterhoeven <geert@linux-m68k.org>
    https://lore.kernel.org/linux-mmc/aMQv1V49xa_MThGq@nuoska/T/#md2b3252f9dce14f3f79a493c426f2761cba1dc25

v2: changed from "depend on" in MMC driver to "select" as default
    on ARCH_ROCKCHIP as suggested by Ulf and Heiko
    https://marc.info/?i=20250912084112.2795848-1-mikko.rapeli%20()%20linaro%20!%20org

v1: https://lore.kernel.org/linux-mmc/20250911144313.2774171-1-mikko.rapeli@linaro.org/

Mikko Rapeli (4):
  pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
  mmc: add COMPILE_TEST to multiple drivers
  mmc: select REGMAP_MMIO with MMC_LOONGSON2
  ARM: rockchip: remove REGULATOR conditional to PM

 arch/arm/mach-rockchip/Kconfig    |  2 +-
 drivers/mmc/host/Kconfig          | 10 ++++++----
 drivers/pmdomain/rockchip/Kconfig |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.34.1


