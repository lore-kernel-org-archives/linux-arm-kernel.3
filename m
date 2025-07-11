Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5FBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=; b=zokH6lcYrXejlUnBVx/sENdRrF
	aTU11V1byZm1tB4SIkSoUN8myU98DDHPHhY2o+YxEn4PI6r5TfXIC+sg2Ab4jwtCPtU5189V8j5q7
	HzNR9istESZo7v4wxfJOfJHa7OrhyjyZrklGhLvlAmFLBi4cX7aMpBRguQNm7lP+bbznKLnzz5t2R
	yGOHmLvvjSdzzmF55XnzWTKu3Hg9TMaXFkO4YoytQyelQ7vSasIoK7P7paiMz7NnHcXeLcfKnjfmK
	/p3J2RGn31MIvf7kWjZM2zlZ/U25ujEHk/1Zm461KzvVK8OIv8fZW30bDyWn4ygimEwTrDZhjuODv
	bAQOeRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaM3E-0000000FwRQ-05VI;
	Fri, 11 Jul 2025 22:17:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwL-0000000Fw1I-2O67
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 22:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=; b=UHPrw2o+M0WB6cU0Yl9q5Ry/HH
	/LXhaMoX95QRdeORxSym61GtGdcjU5D694PzLhd5+0NrHf2wdPs1i/plkK2WeueBGTZNKBvZ7y/Z3
	yKnLwe74jjhBFL22b2YrYHmWCCmW6ZwD+s9Kr+op9+QHjV4aVUR2qBM9SuNl0DLUziE0ig8d84/D3
	Ye+E149C+05Gt2BIREzuwP7zvTbqbGYCmPFmr7GRNMVqnUfOKSvX5xwQfzcPq86LX6Sw0PVp4c3j0
	/FUZaatxV5UaeQgX4gXY9PExYhGrilbhb3jBhtm4l4yAEcXZS+gq5Cx1taW0UvG6AEUZ0Z6RrmDyz
	xsa4Jjqg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwH-00000009Mt4-1yRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:09:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so22393035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271792; x=1752876592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=I8fJxgsMn2O20qJEHn48PzgY3beDiWy9eVHD+W8Zp6kLPeYKMhhy/7wa091rnqoNE7
         Vuu9GcwWmtcqHQlLfmYRsNHWeJR4BXevLyMYxJDwcaUGtBlZHNfPYRnUbCPq+/IkDgUX
         Y1Hr4YSJu3Nd2rYPUR8M7cWqzO5sq3e1U9NadAMGv1MPRIXzS8eFyNc7Xu0paZ9GYmDy
         aMqfqnnmgdQZFOZi2V8MtFyr6WgVTxSVj2aAa56TOZfUxpvK98Cwq5vqnHOVt/BXTQw4
         60CqRZsmtMLKywsG/VhQEwcl2faZxwPoTc1NWui2RoVCjHKXszSNvXcrHFrJPrc53i6R
         DzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271792; x=1752876592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=KhRmQC94ZgU6AXz43V6Rkx9gTDBWeFB4aM5IYuoAvy/LB/3SqIoLemcKLUbzO1FF77
         r7KHPa3kDLNLjPZNftpBwSmo8ZrXJw9p2oRhDOscWLgoKeMXwjbShBUOXyBa9x5Pw4Gw
         jzoxrgvOssy1h2lEXp0tgTiMxlfzQwEgQO9jO+LkS08HP8QNR6OLFqs8hbANaRxPPu7u
         b4qIbruxA19kVUytgjifWpaUGg1I1fe1EKrJz4kjQFG5awp3pEzyu86PZl5WLt1NEfyb
         +7gZq80qU/472wjbJnEGvmYLukNDiIsaPAEWEL+Dq7LYbx3Pg4Pxi3TXjZtcf0v5/Amo
         NXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6t9DE2tXhGUAg0w7O3XZ5M/ed24L1vyzx/p+r4B5w8TSmMPOXjfwxD/LpdaDg5wgi8kQBDknvL5YhSwIW4So4@lists.infradead.org
X-Gm-Message-State: AOJu0YwhIy/RqiRhRJnSrhjY6QZ7axcve9shJDvjoKxHaIuu+Xv2lQ4g
	KP44aqt1TK0FVUpZS1EYLaKIalYfaxwN4+qWYxnueO1mHFjSqD3Dp/qj
X-Gm-Gg: ASbGncsE+Qd9yVdTu66mszqO8j07BUlgtYZI45naj0g9GiqTVUjvkDm/QVQhFT3rP3b
	6d9rztJ0noYrazl1ymMOBsAIHe1j2Wont4KfIV5QGyHMC84rbeShNd0to9UU8i0UG/FEjAHFKt9
	Cppk6HnmcjVcjXT/UNsjM39LWbqCE3PMyb4opbRl/zIVu4BUr3yvLWwO+XavhOFJEii03GAm4el
	4/gHrGLM6psInhVI6Y1Keq9l02LIg84j/cktd/102W0ZFgL7DN9Fgm8+Xmc0XM1IHJ4nWYRDI2n
	cYHy+VZxzgfCi/rGHhf1hCkwZ1ibgUuP2YRwcVwYb3zszbgKYNyt5dnSSDnQ+HWbR0S3409T1Jv
	46ZWeyzPGOfGusv9FqSerG/0C7onb6VScYSt1ooL8YzxXU/5PNhwYgj6+hW9lyepCprnYjFwnbI
	fqkmWqFaNaSlHgkA==
X-Google-Smtp-Source: AGHT+IExZjFpIAcWoQpl+VbmWsdNzvcMBIOoWZxuJvknKQKNhrZ/J+dmt8K8Q4OF5msRFOLLDCGpUg==
X-Received: by 2002:a05:600c:1d20:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-454e2aeec43mr51634295e9.8.1752271791612;
        Fri, 11 Jul 2025 15:09:51 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5easm5540016f8f.48.2025.07.11.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] dt-bindings: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:36 +0200
Message-ID: <20250711220943.2389322-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_230953_808386_185979CC 
X-CRM114-Status: GOOD (  12.00  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings

for you to fetch changes up to ad8247beb4c45acd29ded24c8e956bb96ece84d6:

  dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T (2025-07-11 17:08:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Updates for v6.17-rc1

Add Tegra264 compatible strings for some core components and extend
bindings where necessary to accomodate the new hardware generation. Also
document some new platforms, for both old and new chips.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

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
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 11 files changed, 818 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

