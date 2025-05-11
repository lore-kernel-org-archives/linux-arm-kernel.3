Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67682C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=; b=42Ad2/CGsgHupeqangdqFqPon+
	Qh7WD0zxNyOC/YjKUdQvCgzgxE3T7Z3YrI8XcfmwgBIIl7V6wWZU3dZh1ryC1XXaxBRFgy3EJgEnt
	KjlC6wH+0y0fJXssaG3Bipsssrnl05scyOJWDH+vqgvI+DFNWz2ozluMDVVlxIZKJMaZrlejyF0/e
	LxFkSGtz1Ya/GE71KOb+0agCGtcYzkApXhBRS7ojYjF85Iyv0no8jSVWqh9ibEwp0b36viTz2igRo
	IYfK5RV6+cFWlgukAh42gbD2tIGdCudAGqDDZPUtkQl1UTuGJBQyLS6hzvh/acHnE7/hjWaA8ZTqC
	KqVTyJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9rX-00000007YIs-1641;
	Sun, 11 May 2025 16:49:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9fw-00000007WcL-1nWm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:37:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22e09f57ed4so49180555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981435; x=1747586235; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=LKtwjXmFQaN/JrT4kJdKRuV7syst+AHFYTgx5pQMIwke+W0bjZKDbn4UyZQZBn6oe9
         ohwsS7dZWGHWmzlI8N/hYC/PcpmECNGv1+mmK511LMV/JsvCIZqXyntSYhZMYmetI8Qa
         Av8gojweSQxuKwLF531r4eLn9GN0AwMXnav34VCoD5whJOuxjBau+jkiMOsEXyzwlVeJ
         dF+qsNiI90lGAJ0nnoptIEj2Gj2I3pkM/Z73KjwcaAqWp0/MIfNOSYeANljg6e5IgyuK
         iDiB+NUSLfvBFusT/0RYvfBRCv5zNnP5iPCPFKastJ0Mv7FUtLpxPADyxtlfGpLoYBYa
         UEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981435; x=1747586235;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=fqVoUtCQQTEwvwKNPRmWm8PdUOYSX5NI/XziInGrAtDMG6CGcfFo/0zz/ii1fI0l8Y
         WMRczvruQQ/K+eW80fDScA37VNHRYe0CSDhN5t0B0RGUChSsr1Vjq7vxzt7b+T6qXaI6
         s4GD+T+O4lkb2LkwKaYEvrnJdOfmUZ0i5EVXcRvHbHSgAWxZad6esTOhSq/4Z6EcnP0e
         oaY2YlPyo/FaE2kaBja+QuKBShLPm+vJjUG7/OuIjj0Zy5g5wBkyfhQp8/G6/h5hHdJ/
         gV63WhykpXZCD8KTdf71DHmxEyr/AX7RtQpRxfFiLOr+3BW3XKFF03U5h8oCytEqR56H
         GaEA==
X-Forwarded-Encrypted: i=1; AJvYcCWRwtWZuaxKv3Q08VNa59M2Hl8qYjk4u1v0w6rUglWsW57Bb3SUHqWuuag/R08xPocMfucSKg+2v/fxjwheqDot@lists.infradead.org
X-Gm-Message-State: AOJu0YwwSKUo70Q0eJTcQ9jpyDltuybW2UjPW0nPjA61dJt89tAhWPDt
	bOsPhtGiK0vwFYdvSeVwMuw3775muosN9FTKWKRjTgxaMqul3wGzZnqsfBgvUrFgDVigIlx2u8P
	hq7Pluua3
X-Gm-Gg: ASbGnctv+tJ+mz4/eWqWc2iOwfTugWYtsptzso4qwZDuxUN7yEvJCDICZDOsgCwd8rl
	oaF4FGWwB5dJaQOIxJm16TBiVDEi33SCfm1n68AHzg5DBpYck44Tv/R/Nzr5/POIeIK2W6ncPYc
	YSwYghZNdfyWe6Yup2savg5qKh5haGgSm2uI8bb+X2NutIN69ZtRRn8/ABLeO/gT61nR6ioLm1X
	XhXW4z9a7izxag+z72Df9e4OQF8I8ApgA9wSWXnFy+CoPvYGG2wQtisU486QlaawFTuQwtwI3Me
	VEE4+b1xJ4mHoRtb/8x5lmPSffXS6dvTSsQqeYdRk8l+YGY/kQ==
X-Google-Smtp-Source: AGHT+IFPEY8g82RGp5yhOqpGmRIP7cEY2ruWZiZR0/cuOw+7hTLUKHCqDioAZJqYRH9/2X6lupqZlg==
X-Received: by 2002:a17:903:3d06:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22fc93dc352mr153833875ad.21.1746981435274;
        Sun, 11 May 2025 09:37:15 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544d86sm48146985ad.47.2025.05.11.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:37:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.16
Date: Sun, 11 May 2025 09:37:10 -0700
Message-ID: <7hecwvrtmx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093716_468897_2E295297 
X-CRM114-Status: UNSURE (   7.47  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/dt-signed

for you to fetch changes up to 550e5608c25e0a886da1182386a6477f49caf2b7:

  ARM: dts: am335x: Set wakeup-source for UART0 (2025-05-08 06:15:58 -0700)

----------------------------------------------------------------
ARM: dts: omap updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap4: panda: fix resources needed for Wifi
      ARM: dts: omap4: panda: cleanup bluetooth

David Heidelberg (1):
      ARM: dts: nokia n900: remove useless io-channel-cells property

Sukrut Bellary (1):
      ARM: dts: am335x: Set wakeup-source for UART0

 arch/arm/boot/dts/ti/omap/am335x-evm.dts          |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts          |  2 --
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 39 ++++++++++++++++++++++++++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts      | 32 --------------------------------
 4 files changed, 37 insertions(+), 38 deletions(-)

