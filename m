Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23h330mvwmMPaZW8Skt8X7vh3SKfShoYxDlivAwr5wM=; b=wtarcvyoxzFWuCCOkgKGofeOmG
	Uf3S+AkbgCm9uYtEj7XrNsRpDJr9Yi30gM5fzfb7zAWjf7LASXYQCObKk1YCXKV5WdWxYGnYKqIsN
	1BknpwJ2VI75F7su/xWIFKw1KQgStjiqbY+OPeZ5Tqjgmn+8NF4ZANI40ZL+IZOwGHvAeRn8G573u
	jrS+jAZ9rHwB1dQdLgP4k9x9K30+K8uucxf1ryzYxrPyF3gHXMqVi1jPs5IABXrSA7+DotUyTo6w9
	3Vqd2imdIt4an0DmnhEuT2wfjMR3XdRtvLL5DoHaAX3CGPQRW/ziBY9EKSSYDgkGB97E4kVLTRVvJ
	IKE+yjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qvl-00000006bf3-1nfC;
	Wed, 09 Apr 2025 08:37:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qty-00000006bQa-211l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:35:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf680d351so2831995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744187716; x=1744792516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23h330mvwmMPaZW8Skt8X7vh3SKfShoYxDlivAwr5wM=;
        b=dm/14hoybmcCZF0+GskzppBiY3KWP1bTA+57tWI6AJaiU6G5AL2/3glEpOceoKk04P
         dfl57dHRPGh+kT5i5YRyH8hfq8vAJQn4H6krrhu7tJyEriODfv7Fl4Z7a0AIvYatLhsR
         EFVJFSKeIunfkia/PYC2EVhVJqxJt3uhEYAPWFLMxxMJV/zZG2+Cmf7AYmta8Npwk4qb
         VjOUay7muz/yO75B3hPmOMPebZEjkpz+TLfjKVvd0HlK2i7glxZ5/UYIMFQFXJR6hHDB
         qd3IUZLjHJM4yXSc4LLq2M2BiE6FcqG8n2S4RojHX2ITl2rzC0AoUYYVHBQXBEGjbfS/
         9jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187716; x=1744792516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23h330mvwmMPaZW8Skt8X7vh3SKfShoYxDlivAwr5wM=;
        b=Ny/UHhVsBdvpDQ0cvMeT4cUTgUBJtclwNXlJHnnxOFATlGVpIew7Q29f6GgV2rU9Ah
         Q4XqhLMTfGHHadNInEFmLukZqJn9Ji3uXjMs4GKe4YsEKeTOJ1mIkXqgppGrJXeMYJiw
         6MdMOtxhUkjnWOSroO0RYa5RF0yatJ+9SVIDFDfekTuK6WPuPdGgz4HbEm+DUviLbpyd
         jYRcEg6i7VyUDI2sa9IQ+3jh7LrNW/3b0+GN7dO7E4Pgx7wN/MIm3oNjTP8+CKzMmy3P
         CYUA2SsB3k7l5hzHCreRXm4m+tPo05HXkDznpiHp/I8R4FqN5v4damZP5J0Lp+lcOrO+
         /5/A==
X-Forwarded-Encrypted: i=1; AJvYcCWbW55YWUADkPktO5GJSEW4bR/SMvVcFXHZiu+hBB40eLnl3g9wdYJibPCrLSanWbF8+WxY4ipLKDGSlmXNsGL4@lists.infradead.org
X-Gm-Message-State: AOJu0YyNxa3BlqmdZSO4G8L/cMJAccpSYsxRA3hLNG0yxyrhxKTpP35H
	ysZn2rLXj1lkYsfz0PqRgKz7ypu71izhJH+tCiAPgE2hXzRtvEzTLf7PbvdCbsQ=
X-Gm-Gg: ASbGncv6355us2rj+1x1XXSWwnS//bYGp3qhD8cPzfqBvUW2H0n/NWne3ylHKr7gQjr
	L88O49bVl8NdcsiB/EX48YDstWxc0Rs8zQKP36jQEHsQghjLzj3iKpCEUvIfB8luI/iud6s8Kh8
	uxyy6KAtXYNLl2wIZfiB2VwrwHbUe12VU9iIdo6xJUvtgQ/IipD2bLAtxIYOmAHC7DOJfi5bD+o
	ESMaKAXtACZYCNIJerqtRASavMrJqKZ66NHIR3bN0lLdzztrL2myqQpFVnum5ZyB4NPTtcZf4qw
	ih9G5qdCBxA/6W/19A3ltkhrLnHAX6RXEyJDGxfq
X-Google-Smtp-Source: AGHT+IEn1yvBB7exNZb7FHApiQ8xOI92TeGlvD29xSjj0MDZHF6MjvnUpIu9t/EpRfwIr/nwRnc2RQ==
X-Received: by 2002:a05:6000:22c7:b0:39c:13fd:e6cd with SMTP id ffacd0b85a97d-39d821127fcmr5430572f8f.29.1744187716262;
        Wed, 09 Apr 2025 01:35:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893611dcsm941303f8f.9.2025.04.09.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:35:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] ARM: convert board-file GPIO chips to using new value setters
Date: Wed,  9 Apr 2025 10:35:13 +0200
Message-ID: <20250409083513.21115-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_013518_517474_7A8EEA01 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Arnd,

As discussed: please pull the following set of changes that convert the
GPIO drivers under arch/arm/ to using the new line value setters that
allow to indicate failures to callers.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/arm-gpio-set-conversion-for-v6.16-rc1

for you to fetch changes up to fb52f3226cab41b94f9e6ac92b1108bce324e700:

  ARM: s3c/gpio: use new line value setter callbacks (2025-04-09 10:25:26 +0200)

----------------------------------------------------------------
ARM: convert board-file GPIO chips to using new value setters

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all ARM board-file level controllers.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks

 arch/arm/common/sa1111.c         | 6 ++++--
 arch/arm/common/scoop.c          | 7 +++++--
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 arch/arm/plat-orion/gpio.c       | 6 ++++--
 4 files changed, 18 insertions(+), 9 deletions(-)

