Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB70CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=; b=E34Els1YbzV9onFrIvXU72T7Jl
	QRCkyFAPwxmYVwb68Em3DbyhtaOpUckCGoUWoK8cl3H92VPlUInnHAV+bIXFZCgYyfi8ONB6vHJ+3
	UsHx1Sfrshb4lk9NbLhZAEjRBQARcYhwcDMI0yEE6D6+Xdz9g5cGajHzWIkTTzQuxnnShmaYUhCrO
	OVFw4N36nCHRTjpkf4LCjSaKPRSzveagGZ2R0sIbD7b5jqcf3A3OhqyEz96DjDTRBM06hS/cawbLh
	8/ogbf6HyUmX/FMOAbq4X0hf3lbv5oNPmiYgvY7505WrzD3CYVGteE7QeY0KaaDo43J7vUyXUCT2C
	M86Ne5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOk-00000000Fxp-1TVp;
	Sun, 14 Sep 2025 06:39:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOh-00000000FvO-0eNX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 06:39:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo1734538f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831977; x=1758436777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=NWhWKvLJe8UCAiYv3Q2pC4WtXJ+BJAXRioq/e8V2lefW8YV9bpEepLUGzc7ahdFsKS
         NhilzdK88rGbqowvPUWBVuVqPN8Q0Bp27Kr1l6zhyYRokJu5EI6sRkERtls31aVOZOJH
         nvAmMODNd+SYJZ4ZfpozvACQ25nTQRYqdWZfdDFbvX85uDG972KhLjkUS12w0T/Rlhy9
         ogUVIpSqbvIzG3wCuVeyrIxNokwy4abAoCZLNwsEaxiZTAA8lyz0KKd8wuNHFgEcZ/86
         oLRuWgzpYkHV4hgIS16uwfnyMFLNYTCgomEesWHY3LrRQfmbTGLjEdsDx6F6jVt3vX1I
         fKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831977; x=1758436777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=Bv65eEvCNymEWDOQap6/hVNvSzl218cvCt325sRscANtQ7Qbo8Z2Dh8cx8XFrS2i1v
         7LBtWht1mLDUiTf8kc7pmxEiOzd2DwPzrHejL84gPb564Jmg7seq6VSeXy8k0yKLBr68
         mb/A4pJdPmdvuL0A/W7G6tgb0SDn3yU1U5nPU+CiNx1bnmRsx56BuNUmi1aTxj7GCUFm
         JIJBBBCMpmK8WucJnQxUQwOHrCzvr0NMu1QRPfekTPwL+bcP4T6O4FsQgHW0CutAXsnQ
         PP8e0wm97todm7mGVYqxLXwfDNkJ4bHPufjE/Uzetf+V+5DhKM22fua8KCNDW59A7F4t
         /MKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWboLG6DUF8FZIAVtxZCquJ6c3nuXUgrdnZmSh7HJ4K54OWmpoc3XjyZ52RkOpQLYMJpIucFGekvhmojeXnz3no@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1I+tDvbbApcGe9LtAKyNhADzvwve+vDmcCpV09sifq3Uolbxr
	G1VgdbGyEn0WnyoBVXwTWppWonFtgplDpHPrFS9exZQPD9dDuxJZ/oHY
X-Gm-Gg: ASbGncs6fSlX+rha8PldYH8QhHoCo/ZY4snva+6JbmmEu28IbHuVicPIC97A2CRquyd
	WgzU3EBqXy4ypO+kDpIU5g8pLCiD9VzEIfx7IWJ86kRkmpg8T0nUxeW++dAeOVbNPVHpLJaev80
	lVJOfZCvSC3DV4gCspOSPkDjPbFaVOz1iWGXrX2WqdYLmY+Lp1KNGG4r+JQM8F/CsXrDZ/Z5KcG
	0fHjCjjfgxDesCR0FoHybuyzaLS2oyytYh3uScq9ZHDT/jyk0ID6SC/kX2WBEAhRFKYLqqjItjI
	M0OmoqkXaFDW/A9rje79d8ZTmV0y3RB7Zf0GfmyjB1hmo4hTpD9ZG8DCJzg5WfdKtKFV0T6610G
	XYneQonxivZgNKfH4OWI9O8n2KMSvqVIHMc4pxxP+ZtGM/WI4IJu/zARCr/AuDwTb4W9FaHguJM
	rk5DY7k8n/om4TBg==
X-Google-Smtp-Source: AGHT+IHymrOL+tTeViZP10RPGLwsdPflgferYQ5FgiwTqzzZ3HJC28XlDRAnkYKailfHPno4A8dELw==
X-Received: by 2002:a05:6000:40e0:b0:3e9:4fe4:2619 with SMTP id ffacd0b85a97d-3e94fe45cbemr2544297f8f.25.1757831977436;
        Sat, 13 Sep 2025 23:39:37 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e82f647b83sm5778948f8f.20.2025.09.13.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:25 +0200
Message-ID: <20250914063927.89981-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_233939_206552_728DFE50 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi ARM SoC maintainers,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt

for you to fetch changes up to e1899da95f59240ed2d4a51d7a89c8b77c45ff06:

  arm64: tegra: Add I2C nodes for Tegra264 (2025-09-11 18:35:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.18-rc1

Add I2C nodes for Tegra264. These are currently unused but are needed
for subsequent audio patches, as well as various monitoring and other
auxiliary chips.

----------------------------------------------------------------
Kartik Rajput (1):
      arm64: tegra: Add I2C nodes for Tegra264

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm64/dt

 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 225 +++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

