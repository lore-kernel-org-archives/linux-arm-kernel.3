Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=; b=r7q0vVRTILugLGUmV/6mL+ltIa
	cgzSZytjdRgM/Ta+C3VLq9NI6XfpG1A66XOJF7i3r9ONE/uFEeOZq2IiTx0tVB92LRHhMbfK7JlPx
	4x0uwjHEKq19Dd6XWPDt58SvfEGPc8kDlK6UhhZXTZ8qJ8K1tTeZbaLvLFLHRbdNrmnwhUQBPSlNl
	qVFUrAtnVX64hzENhIfxP3h3aA4cJgvLHf/yvwM3A2pl0nik1oScIdeAlUH8dPWxXGCLZI7taMU+R
	HB5QOFP/It0o8gXiRxIwdndHnAxrszY35iuV7U/pmVkCMHgBHionzF/uaDWqU6KLLOLqe6n+XHNmG
	pQwNpxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziWS-000000044kj-42Eg;
	Fri, 19 Sep 2025 21:20:04 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziWP-000000044jT-42fN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:20:03 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4248b320541so3137795ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758316800; x=1758921600; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=QWy8LInPVyDLQVhGK1FKTtlEHi51Bz8+LExs67EUGwMY8LNlxm113EkFyX0uGMtZxo
         Da2dRM+KwgMnMalk7/kSS6qfVlCRE9jwjCf4BY6CWHl/YoI6kxs93rROPljj0pXZpH9W
         K58U0e2Wc0meeD7OBqh5OyM/c08GEXZ/HxuN/6e0bMie2u/md5YfPtagAXg77RemuDsi
         wfHlPsZBsuPFlDZMM+yTeH+9EB/m72qWfXpz5X4eqo41W5C+DyqUsHZiqs7ROlWUnjWl
         ZlOnPc5qdTvOnIrVMS4C/tlPddyBwOVmt71vbvAwRHa03HKu2k0Bt60dpX+B2Rov3jNi
         8OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316800; x=1758921600;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=eSRvr0jPdZjiHoHuy1JxEkDh3IITiCRP6tM94uLI7tnBpD1u99WooKCrwKXsoEdVJw
         d4naEfyhlfE95whi8C1H0gYwHxO/+6BnnZY7+lazO0NZ9RaUfWw3kyRrPb4ptvg1OuS7
         wd6T2BcT9P9nIzFH+Cky9YyEbVMtj7Phg9ZRMWcgMI/bn0b/m0d1/oDF+9EUEQRrrzxP
         5fTR2Ioqz+Sz5LQx8IC/Bixp0cFqYUdngWyLKCvWgTzVtSYjTvPpW0NlTmD5/jBYktop
         7uKwvtrayKOg6p9kwyPLemOzTrgHe5KlmiYuZ8UnrqUWdkbvmW1ZjPjPKvwijEWgjiO9
         pkcw==
X-Forwarded-Encrypted: i=1; AJvYcCXnu9+fHfaUWypSPxqpJ0r8+kRgKRwKhggtqjEgiBFvVuFKL1huD/gEeWAcxidhsT34hGhpWIJ3sEmwKTcWoqcV@lists.infradead.org
X-Gm-Message-State: AOJu0YwG5BkJ177YdQLlbh2LxIlXR4kn7iJ7BLGCQNIXoXT1Om8E+E85
	c/6rljOjj10th9oCqWMrZal0W/Ag8JB/ubXetTV55CPe6GTT/sAMzZ1Sks7GID2NMAo=
X-Gm-Gg: ASbGncuCDTLOd8nXriJsRYQOXyTUBeCtHEMVGeMLN8I9e7CCdHNlFeTr9toEKvo2rv/
	5w58ewm5cZDla2x6vjrmSmGVSBU59W/QjKj1p6JWue/JNgX1BO8jGT+C5RpjkvjoQsPyrazaw5O
	ouA5VrdVTMKvj1QYOEy/e+DZd2X+WiNn26OfDoVPzlmd87/qgmcmolFYyTaKNlo8xhzvAGWRU9P
	5S4fGhT14sD7NJXXDxCubsxrtsidxEoGseh/GX76Tt7OJ0D6nhTZOWat241f/vPI1pFgOnJQuaX
	U/bfwgWt5dQI0Z8rX5+IPp6QtO3ZmMYJWGWEY5aJl3qYtN9nGgv3WUlv4xNCoPaXj7kGpUyXydF
	a+ighpbi6haMzBfJeOmJbWdFqjNbVir681jUxz4kqGHkGO/U5Qzv2OfuZLA==
X-Google-Smtp-Source: AGHT+IGsqsYnhTXUsNgx0wZHnvpKnyrcoUJXU5jyFCHL/FXVHe31eOcLv4p90MIR2Gxa352P4Ejr1Q==
X-Received: by 2002:a05:6e02:4813:b0:424:8650:17ba with SMTP id e9e14a558f8ab-424865019f7mr47008285ab.27.1758316800610;
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e41e3csm2599947173.71.2025.09.19.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti: omap updates for v6.18
Date: Fri, 19 Sep 2025 14:19:59 -0700
Message-ID: <7hbjn6p2bk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_142002_011514_869FC63B 
X-CRM114-Status: GOOD (  10.23  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/dt-signed

for you to fetch changes up to 27322753c8b913fba05250e7b5abb1da31e6ed23:

  ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property (2025-09-05 14:37:57 -0700)

----------------------------------------------------------------
ARM: dts: ti: omap updates for v6.18

----------------------------------------------------------------
Bruno Thomsen (1):
      ARM: dts: am33xx-l4: fix UART compatible

Jihed Chaibi (3):
      ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
      ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
      ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property

Krzysztof Kozlowski (4):
      ARM: dts: ti: omap4: Use generic "ethernet" as node name
      ARM: dts: omap: dm814x: Split 'reg' per entry
      ARM: dts: omap: dm816x: Split 'reg' per entry
      ARM: dts: omap: Minor whitespace cleanup

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi               |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts               |  2 --
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts          |  4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                  |  2 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                   | 20 ++++++++++----------
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     | 14 +++++++-------
 arch/arm/boot/dts/ti/omap/dra71-evm.dts                    | 16 ++++++++--------
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi     |  4 ++--
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts              |  4 ++--
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                    |  2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-om44customboard.dtsi   |  2 +-
 16 files changed, 49 insertions(+), 51 deletions(-)

