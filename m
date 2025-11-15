Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77FBCEB2CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=; b=MsjHjqhSDma+N5oA+jl6moQP/G
	PkMtJohj+K1UYTV7l9KuPqbRqfQFzTNpv8lH6vDFFtBDV9xRXO7Rq65zDUJT3Xv33ZyCow9Osg3eg
	c5o92iZar28y5bsXJK88RkkbaGKrYb+yRwfoXLZJHNosHAu4sfzBEQJNpTx0RQnVuWfiGoTEWl1H0
	vz73wTbDWK1a6FeybOyEJ8cpF7zt1iaMQgvW9nGJXX6y3sCXNJHf1xAU5eZ0ruWOgkmuNck8bFz96
	zd44omAijHiSZvbFNhPsD1ulncSSiIwvOJuyIHxh/gIK5fJq85MKcl1FmZBK21f48sbeo1IeZxiJP
	B7bIel4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9V-0000000DbxQ-3oY1;
	Sat, 15 Nov 2025 09:01:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9O-0000000Dbui-0boT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:00:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b427cda88so1956522f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197252; x=1763802052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=UJss/rowYK9zo3A8z15m8fHuzBgV+IYydVyXQqG7n3Mmnvxv2dyrusQ5mhHDG4iGQN
         cUFHxRqzqBa4HtAiEiQ0rtsj+/eJHSrt6OjrCL8jkw/Y4W24c5f7tjW9sdrRtQ8gEYeZ
         j9ik++9Y7tmAE+1INAew24Nd/2edDF6jz/c55Za5ccknbl46IAmLETrzaShuspTrhWXY
         ghIMsshyG7t/CcHqEjqQDSvXP+l+6/84q8K3qLCpF6pa/bXwbjqCc7YE781j7miRtTJT
         25KBKbX673Mw94v4TsMctOmPh5JMd0ODcyxyNedG1iQA68dQ5/7a79NAiBGXgqErHb68
         ZN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197252; x=1763802052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=cipGH0USjYEhoN04QsBR7EPvHttaZTsjBM3t+MMnr1s67t1ALSLOq0EDD3k5NSGRo3
         BY2flAVuUhjge9bwdMKvg78732KlGKvMGfCGICVTe0yl5m3/rsFT3nI5aLNzQ6+GAzlA
         vPbWKpKl9A1YCk/958zM1k2E6q8MF4Lw8pyxeDRsdN1KwUPzAf/ha5ZzBQFoZWxLr/Gt
         UffAxpheDDRZpWUPHJdscZGRaUrt3aXNbN7ZCLVC9f4OBlsYqRgIg1RxMsnWrmY7UR25
         QIDZgFK2cyFK1HqYFiptvJ7l/802p6e+zamYFr1AMMqv2NC2pKsdPjsNShg/4UceUAio
         Gafg==
X-Forwarded-Encrypted: i=1; AJvYcCVikdFDaixNIW6mSocs7yZaN57fbQ/ONunQmxXHo1QaBo5vW289NRDx1+VLL3HGCbQspssC5gU7UPIe9N50ZB5l@lists.infradead.org
X-Gm-Message-State: AOJu0YwXUKBa8myPiS98prntL8Mdax584Sicd15nAJ96cjn+v3go88m+
	tnrkCQSvOiGJZTTC7S/x62+9xY7z4uD4UmH+jsmxo2wizNT/lSsXI6QV
X-Gm-Gg: ASbGnctA+IKhlHg+Y9b7POd/bQnbzcktHyRg6TlmwrrXeCnWmNTnvAcGuG7J+V/yvbA
	2B/MTUL8t5qHTqscxyfu6ulL4Ytbg1EIMfc44oOf6F5PqbPikjnhoEeAEPAC4bxxypboCEGYmHX
	LDMjuJGJ01GRw+ds5807HiPPJ7i5MuRqyiBfunmNIdmsIbX9SzRRN7bWcKqVnYzs8fxiFE5xkIP
	3kuFu6TYTWYVmmpFP61S7beYC5JjSDQbklLy853z5J4AVNkoMm63lqhxgP2rXPv/h+eyskBGMkf
	PnELk+m1OU3INtT6GqZ3pGZ4pW+tHgd1nPbjWhs6t7IPUEd2aYw9C4MOK8pXEDXNIsgWXjRI9M7
	6fEOdq1bBJzjyO+ovrPbV8SNgXQ5qKLdjpBdgoNZqxdD+y8rkYivqVfy9tUlSpgyK0AHfC3BUXp
	BT6RSCXJUe8AnrsG3DgNvwFijmc7QgnUIDdisPDdKkqXaYhYjSvupLrCaEWciXfNomClh9p4b+k
	3XG0CI=
X-Google-Smtp-Source: AGHT+IFdVfK+Shdttqb57lRCPUmJfMS313dD54S7D51C4gzOhgy2szla9wVkVMN99ItzkzULbuEs8Q==
X-Received: by 2002:a05:6000:430e:b0:42b:39d0:6386 with SMTP id ffacd0b85a97d-42b5936796fmr4919296f8f.31.1763197252125;
        Sat, 15 Nov 2025 01:00:52 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm14666449f8f.31.2025.11.15.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] dt-bindings: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:37 +0100
Message-ID: <20251115090044.3140331-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010054_198433_6623DBF9 
X-CRM114-Status: GOOD (  11.61  )
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

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-dt-bindings

for you to fetch changes up to 905f0dcc38f8078f0641c5cf855f420d78f10ea7:

  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller (2025-11-14 19:31:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.19-rc1

Document various new IPs on older chips, as well as some existing
developer kits that were missing compatible strings. Add power domain
IDs on Tegra264 and wake-up support for the XUSB controller on Tegra234.

----------------------------------------------------------------
Aaron Kling (2):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallback for Tegra210

Haotien Hsu (1):
      dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
      dt-bindings: display: tegra: Document Tegra20 and Tegra30 CSI

Thierry Reding (1):
      dt-bindings: power: Add power domain IDs for Tegra264

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/devfreq/nvidia,tegra30-actmon.yaml    |  13 +-
 .../display/tegra/nvidia,tegra114-tsec.yaml        |  68 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-csi.yaml | 138 +++++++++++++++++++++
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |  14 ++-
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |  15 ++-
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |  18 ++-
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |  31 ++++-
 include/dt-bindings/power/nvidia,tegra264-bpmp.h   |  24 ++++
 9 files changed, 306 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h

