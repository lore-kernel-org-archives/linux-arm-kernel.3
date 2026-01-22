Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B371D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eU9nAAzm7tuhsde9kPZ3jwJ1ZSEJF+Z3udZWl8Q5Jwg=; b=CmrJE43maUyb7XnH7C62GszSlo
	Py5lR55WmZ22J+Cx7iRnKmQRWjvVage+uYhkbMNfTYBdh+hjqArrsqLS3O8EcrNxL4qWC6W5LoUeo
	ryPjoc4dKcNbLSYZxVvVQNlfsZaUD2bw473zUXNkWnIeIwm6Tq5aw2U0SHQB/cJYJXP1d/k0Gl2xA
	WuTm9Rc6ii0VpEcbx/wqIEHUPlyWGwZe3mQvRZdysyq8NXXihXbNPusgDh1G2+jMFf73WZINg2D50
	9dQlmjufcdSBnGbFubjIh5oQ12GtnI77Ck6EkkHmQWZuScHcBzHUe5bFlp2KtJMoi59FTvkEjNdv2
	D/+p7+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizau-00000007eEE-2w4j;
	Thu, 22 Jan 2026 18:39:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizas-00000007eDo-0y3P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:39:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c2af7d09533so786029a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107185; x=1769711985; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eU9nAAzm7tuhsde9kPZ3jwJ1ZSEJF+Z3udZWl8Q5Jwg=;
        b=Es1v1Q1LGBw5UEw5OH46++a2cfyW7V2m70TLRK1pXxt41ciEdC4rWE3IKPW/kfCPrU
         wROpZ/6mbHrsQMJmyUhGtWaB1WssVYPomFsnEPVFZh6uj0EEGzClLaa50RfzJQtRhC2U
         L17A1LsbBlLX/t/FEuWhKPy9ZaqfN/joynXCoMIhhQ7ubOlSeytqaSJmAGLiLnVzSuYB
         zZm6wQ74ftCFL/TPOnvZDQIeW9rpohrMH8YtkStdSBgTKBE/GuP8IolcnMsfkX4bJRd2
         T73YDvgSmuZHTUAVWURzYNQQM5aePKZkhWZUoivz0Q62trOTbKoH/cprDJarPdJk+n3U
         gWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107185; x=1769711985;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU9nAAzm7tuhsde9kPZ3jwJ1ZSEJF+Z3udZWl8Q5Jwg=;
        b=bcivS9So5P+G0UYNY4b6Whk1SncsC/zJyjubtT6WTLRrWNmkHPk+hT+AauAt5mMaXl
         3fxaA/QVO4+c0n3abn+Pws3WAfB6Wyjt7kpX/6JUOb+1IrGtnH1xb+bo3AskgB0Z60Bd
         1PaUW4s+K9z3gEPm1kyT9A2jEDa1lEoY9YTiBZzUQd1YI3jhbbztKNNWytgKkl86i5r6
         uQrmFnoWuPxEOwOEImBoTyIcRjq0bHihIqQYq6da1CD1cHl0648QczzSNqiMWR3gigBd
         68PvNYya8jWQxd08Wgt4BiUXPtbrsf/73U9IjP0PZ22Z1VIelrQr0Crmbmjhe46pGv8R
         hhWw==
X-Forwarded-Encrypted: i=1; AJvYcCUOV0Y8RYefRSMH9q3Jr1K5bJ8yQpOJ5i44e43O55EyUJm8a3/FmsPenEJwiGz2jrP/v6SyemVnBWhMcuFPKxN/@lists.infradead.org
X-Gm-Message-State: AOJu0YwGz18MF/fIABf5truHxmpwXEXg3TKAKm88AGaG9YLqL58XsR8I
	CRkf1P31lqf+laI2rvT4LVZTqxNTkHYQuxbZp3bYOdxkhChycqDg37Jw/a2tnHSLMoU=
X-Gm-Gg: AZuq6aJL66PO6k06J1SOFeNW6iCrDHMQW4G42cRWDCm7NivLQ+EPj4EyYk3p3spXUtS
	lYj6CQaeZEoWTEclTZ7XOrnmXOCpZUHcrbBykt09+vbft87nzKLqiU8I8vEHm5wtGOEIWlFFTNT
	DwqRBW+FPuJoygGIrMZRkz4amt1s5GXnF3qNuGQzP4zIC9Zlqn20Qye4wiQxXjKtsp+JeDfoosq
	Vr9AYSccwfGGjVEvPZgjBOyQJeTMeAE5BAc3vGQMpJ0dt6GPU3gdutGfPtFe8/gck6/7mEfRjyK
	MVjF/pWvdSt9WU+DVBHEN7dXw59SQS/9iSpFMo/n7nbqf685Z485YnZtU91QMic2qPHuzxTfaGm
	h6uT9+0JF7TLaV6U51Y/ESIsNKcmpObfd6P7v1ZzDrBFdjbw4f6kqxhJ5LW/yVoJ1M88CeE5vfZ
	4AcD530uC7Rj0dShCsPWM=
X-Received: by 2002:a05:6a20:7485:b0:366:14ac:e1f0 with SMTP id adf61e73a8af0-38e6f83ae57mr387123637.66.1769107184746;
        Thu, 22 Jan 2026 10:39:44 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2ddcsm41909a12.17.2026.01.22.10.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:39:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v6.20
Date: Thu, 22 Jan 2026 10:39:43 -0800
Message-ID: <7h7bt97aq8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_103946_405646_E6671044 
X-CRM114-Status: GOOD (  10.03  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/dt-signed

for you to fetch changes up to 76f88d2edd9f21acad7be8422069403118708455:

  ARM: dts: omap: dra7: Remove bogus #syscon-cells property (2026-01-05 12:11:31 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.20

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: tps65910: Add gpio & interrupt properties

Andreas Kemnade (2):
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton
      ARM: dts: ti/omap: omap*: fix watchdog node names

Kory Maincent (TI.com) (1):
      ARM: dts: Drop am335x-base0033 devicetree

Rob Herring (Arm) (1):
      ARM: dts: ti: Drop unused .dtsi

Vladimir Zapolskiy (1):
      ARM: dts: omap: dra7: Remove bogus #syscon-cells property

Yegor Yefremov (1):
      ARM: dts: omap: enable panic-indicator option

 arch/arm/boot/dts/ti/omap/Makefile                |   1 -
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi |   1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts     |  92 -----------------------------------------------------------------------------
 arch/arm/boot/dts/ti/omap/am3703.dtsi             |  14 ------------
 arch/arm/boot/dts/ti/omap/am3715.dtsi             |  10 ---------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi            |   1 -
 arch/arm/boot/dts/ti/omap/omap2430.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi | 237 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |   5 +++++
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi       |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi           |   2 +-
 arch/arm/boot/dts/tps65910.dtsi                   |   4 ++++
 14 files changed, 15 insertions(+), 360 deletions(-)
 delete mode 100644 arch/arm/boot/dts/ti/omap/am335x-base0033.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3703.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3715.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi

