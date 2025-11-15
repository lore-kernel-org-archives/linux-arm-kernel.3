Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82351CEB2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=; b=zMksJhsZx1b2yzcmalCjAlR7Vd
	6kKQbZ/3j/34Rloleg8uA0E4gMs5xDnGVmngid6pJw55J6Mgmz5tA5yYdKi53bh1+POjaWy+3y6yk
	n2hH1gW0FBVuh4vU6wR5pMQwEFpFeuNIRzAcuxf6G+SD12pGjrxQReHmhGqRVmXOA+6j3wDTBqnlU
	ZVqNOo8W6RMxP2Wfmbblv54+62WMmM1q6AA9LzKFt2EjYTbFdbLCK3yHSXnLywA1zn/tCqCt/NFfl
	2e2aSYPs/HvueIPz3G9czXj8EP9r+xQmoQ6HNeUNOZh2k172KDjo+Il0BXFIZkuzpe4vc6TOaA15n
	Rrmaz3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9b-0000000Dc09-1Q5v;
	Sat, 15 Nov 2025 09:01:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9U-0000000DbwX-20x5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:01:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b379cd896so1729470f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197259; x=1763802059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=FdT0rrezyYva4RE2q1QDlrYvWre+sViGuXbmW5oFzJ2FovPhf2i2iaWdWQfmo4PRLR
         XrE2b2dk9o7Muatehi/GFMZZeW2DM7Aq3D+DLPlsEalbtmllTFqI1pLPW0tv62vZKgTn
         Q25DlxwXefT2ovqe5TfX/NHIR7S7/2YVQWfaUa+UcFQLlG+Ukjk/05D99z6CSXGA3fRR
         XiH7n5kNb6QflXqIk8FRhThCh9M+cOzgHBQBYIw5yqlyiVwL4i/v+E9peOSHAL4S0GPx
         pFTFAG9EyiLFqDWEDGldLb9zLfkdil6j74ZE9XwTnTYYD9wH/6xQ/XsBzjRywIiSeIVc
         91tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197259; x=1763802059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=qS0Um9sK9OS9DgCZSQEcAjsU6O3yGiXqr18+r6CL+QDP8ojxQqfP33CuLihtw0bURn
         wd0eJMc6Wj+wVpssOiNQxzPn+/JxyN6rjgVanI1CMtpJZeHRNJR4khFwRZIV9KYzHYhK
         FGWJRjeCNMorH3i22O6Xh8yAFaVd8TQ0XL2TvNUdi++mDh/hBHADi0i5Iz751mgChOSS
         +thIoKdgAz4Yev2cvWXrjwuNN2P0OHDQU1bGNHYPpM8yQPmxF/5Nl/rhFXDz0/C9eaoE
         amNkmTG3TYhyDuB1AQBZbVmLxDSP2fzaXhW1r+risBIWaAt5oYmwjBKYPBg8TVu12dDr
         xTXA==
X-Forwarded-Encrypted: i=1; AJvYcCXhrYPVKBuPyNy81bRPB8dOXDm8xklQJatrZ+2ugduFI0klWFnLhRJiIbGXsC5ZL7qQe6w9pNne7XrVE0ax8KQk@lists.infradead.org
X-Gm-Message-State: AOJu0YxeW5RQjCA0UELFbKLAnZROn+8+rVFQruqfzmxOsLE5CrsbGAUj
	TvWvJPiC+BvisOS8XTXq+ax+EYanEmRD3DtdDUxo6IrxnxVkYSrjqSgnW3WBCg==
X-Gm-Gg: ASbGnctY02msK5zBNM5GCBG2jhEr/R51Bx8JviXn2YN1cevkjAXKGpQb/TZ9PHDTUAh
	gCi4iVRWOQXGZH5gjNJ3ZfOHOtr/MIjaysjzSti7V/lUoE3ADwWiKyuVLgmQTOXvVLSBeTNK1sm
	xC9tLalBqd7Dt//R6HPtclNfi/n0Go0cHrf9++HGcKwUgfcwrqOd6Yc8/XLQYTSYWcoxOpl4BsR
	m52/tHO2BGvX9ZrvzvK6e16FMGEhxVLTpK6NqJeggUHb/FeiCWBIfA7IO/YMgy3iYT4OdHhekwQ
	XzcUZiUzHV2YBrPeiMh4U727clt7RNaFW66TC1EBQZDxWyTPEZ01NZjU86EE2bJsyXId1CEbHpR
	+2rytf23D2WhiiqkWkTgz0ocfm9fqtDiEk1i4dhKUosbe4VuFE2m8y5S6IS/IlhuVDTDTpAUfR3
	EIYrMMfvSddpyx+CYw+AcazHtns4dI4+K6vPR+SUQqr+kcPpSL5IgC3bGe+PJmbGRvMQr8
X-Google-Smtp-Source: AGHT+IFoaK3lhY6hP5vpOdFQPuE5XMwCFmwtA4zhKi+e0WF3vPhR/3CXQ4PwTkjEDkzYzg1tAlyYAQ==
X-Received: by 2002:a05:6000:288a:b0:42b:3cd2:e9ba with SMTP id ffacd0b85a97d-42b595a48b6mr5302713f8f.33.1763197258729;
        Sat, 15 Nov 2025 01:00:58 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17291sm14874843f8f.32.2025.11.15.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:57 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:40 +0100
Message-ID: <20251115090044.3140331-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010101_083373_307A005F 
X-CRM114-Status: GOOD (  10.31  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-dt

for you to fetch changes up to f224e936dad0933a1baa3b7152f48918cdd98498:

  ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101) (2025-11-14 17:43:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.19-rc1

Add more host1x devices on Tegra114 and Tegra124, as well as CSI for
Tegra20 and Tegra30. Support for the Xiaomi Mi Pad is also added.

----------------------------------------------------------------
Svyatoslav Ryhel (4):
      ARM: tegra: Add missing HOST1X device nodes on Tegra114
      ARM: tegra: Add missing HOST1X device nodes on Tegra124
      ARM: tegra: add CSI nodes for Tegra20 and Tegra30
      ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)

 arch/arm/boot/dts/nvidia/Makefile                  |    3 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |   19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |   24 +-
 6 files changed, 2960 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts

