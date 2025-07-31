Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8820BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=; b=ma961ON5LmgP999fmZ5XWzdF8T
	v8C3r89zJEGvmGSxjD9QsMHiRwTjbKA14zOAs3xJk4g/Dig9eHrqR3kBBzZ6LZLP6xi3oIEDyY+vb
	Z89V9nSTM8A5UFEO1FmNYx9Ee0d2TkgDhzy9f716T9dcrCmsZH9jMZDL8c7aiFqtXkYg27KdCtw4+
	9iQWjo1WtU0NUOVwTXebT/p4iHrlQFjWsgab5OFT86CZSXQOZ1XDYlF/VGrGxiByJ2JautuU+JiiC
	ubnKql35SWuGiYbN7qmuNl+Dmg4V9Gd/szEM85tpmdLr+IK8skgDhGJf2mhBwPBrzMe5PfTviVBtS
	Q4AXA3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXJ4-00000004Buy-3bfE;
	Thu, 31 Jul 2025 17:43:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhW8m-000000044kT-1saM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:28:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so6259285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979303; x=1754584103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=RTH7GBBac0B7i/NDB0g7LOcyiUX1+G0M5BHoNn6Zy1ZenyWZ4aXGwWZGjfdxVRoKWZ
         yoag4quAA99o2/tCYFCKBVI0HqlrMXFpDOmk7963lamlSF+BD2LjmgMkC3FtoV1WLfwQ
         +UjF/Uu8DxB/319+50Sjg8pDOTeRWai/etY4fXI4bWpedJtoZfhrFwmzZw/J54l3M/9/
         UahAv5exe1gENjXrvPlFT1msTJ3QDKryrniDw1i9YXg74RcyAoMd6hNVpFrxA+TbtznU
         VeZOm1qGr7hK5yqLobFItg0AoX81Kdhq6HELTOeEpeKEnBrMOPuSSBy8SQh3KESM/U1g
         vRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979303; x=1754584103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=m99dR2sxWJxDRMvrtwwTwKF4+vN/Kh9KbG/2LsppjLci7R25HvElSYJRgrszeEMot2
         Z2vJam18agGwjirINPXCqc0IyYAWFGeSo7owV2KLI4rZ2gobnxrxeSTJmhJSg76o09Aw
         Ph15ZqJP0QfVYUztHmrR3kSXFYuvAuutgTd3Xk+q87+O8LA6Ow4AZ1rfpYCJYWEVP5/J
         kx7YpBVM1POB6/s7tAJrQkYQJUtRLpM43eu2eD7R+AQElkxsBXMRZBsO+LJSCB4RqhQT
         Nstugj9XlHsAPmoJ+jzRe8hgHVsEFUNPudtFDzUllQmEV2deAl80UIMGDNvBhw3v46Ei
         57nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8fIN2sBqpJ/4fKZcZChj4FC6Lio+/trGzWqFyyOzuRJOuxS7qhzJDrrybjmQQYk3gAfsffYDD2vjRmLL3l6wz@lists.infradead.org
X-Gm-Message-State: AOJu0YyOqzGdGKLZb9bkFnqSSzapALoYOsrJfeCj54jeSxF+QL6YEMpe
	YPErRZC6KwvyZ8bZFIy2JpEgVp2y8XXwPKQ2eKEBjh3qapLyPXbP2zn0
X-Gm-Gg: ASbGncvlvtSUb6fZpwXP2MrbGAabjsCAedT/1ESNsKblJHDlOujsvCDWD1rVSa8ZQAF
	Bu5lLejWOW0zKkk1y180oA10zjZKa9u/bdtVqBmOBwPH17rzvg3pYknLBQW8/BJvfNqYDMidnmL
	cqmsw3lM/s7gbQoOQ83AOqlC6NbtmnFncfprL6rHj6cbq9Yie2Op8eJhsfP9D0UHKN3ty2MaYBx
	ytd1PzehLXLV4J+iIxA+z+kMKdh0/YJHaa2V5PeHuU5jUmOJ/i7FUlwc9qrY7i5S+udtdaAA8xq
	qTA/tum5EUxeV1wlblosNnqv3RuKc21ZI29IRQVJh6G/ujdPeNBthhn0/0xYfqqZ0Chq3oJplrS
	bitXzVrKm4YxEYqwS8ORXzkLTcF15PTp4nnPDaQzWq1ZnxU/j/5cpnR/1yu0MpM62kSmulmGco6
	CdnS+SNXada18fhA==
X-Google-Smtp-Source: AGHT+IHcEzUc5fmL7aR35NqQbifBaImO098SauslIIzWmoLzT9eyyd/1zs4+hdMyqVtFP+GuFPg+aw==
X-Received: by 2002:a05:600c:c4a3:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-45892b94d5emr69940185e9.6.1753979302184;
        Thu, 31 Jul 2025 09:28:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edfcdc3sm32989405e9.12.2025.07.31.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:28:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] dt-bindings: Changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:28:17 +0200
Message-ID: <20250731162819.3329735-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-3-thierry.reding@gmail.com>
References: <20250711220943.2389322-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_092824_493210_8EAB3BA9 
X-CRM114-Status: GOOD (  12.40  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings-v2

for you to fetch changes up to 6f8dcceb29a9d3169dbe23d3516783139544de91:

  dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding (2025-07-29 17:08:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.17-rc1

This contains one more bindings patch that fell through the cracks and
that's needed to properly validate the new Tegra264 device trees.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding

Thierry Reding (9):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions

 Documentation/devicetree/bindings/arm/tegra.yaml   |  13 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 12 files changed, 822 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

