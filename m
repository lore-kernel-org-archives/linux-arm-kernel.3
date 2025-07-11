Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38959C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=; b=bxmpVHsrSvSP0QyhK9KkuhUft2
	K+79qY1O1ZwZ28d6UTnGj48KsHd64NiohrQNHZUusSOgaN3NiwnssnuyGRs0+jwCCUBOnXdsQPAFP
	kYvSIY8lJ2GcAlKtnK4K2XDRmY7B3EyXUg3hopDz4rgSKHa7cvHmjwtYZotF4jnJj/QdFRZfliAEb
	AEX3a4BA5wtXKVqA981qtoAdkF0l8Xulv1yBnvCis8444ZV36dldJtj6gPDZAuVweJZkjE6Ev44lP
	ixmFqR8kEzk8MxoGdZ/AtaIzG8LRxPX48UNd9PIu3pwtAONBKN43LTLx9wrq19NOJeKqTLumQL2ir
	pMQHJNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMAA-0000000Fx1N-0qzU;
	Fri, 11 Jul 2025 22:24:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwP-0000000Fw1y-0tiA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:10:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1480984f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271800; x=1752876600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=c/Grj0ST6G0517FqL3ZkSgWMY567UOwOJyr7CU21lQxkNkafZSkHaDoS5Uu7Ryo8Yo
         oxbYCJVPFZYmoYpO79FEJ3YUoUDegSzXe1LtNsFGMYGpbhrzo5djgtrZP9VL1xDDlo9M
         CfBdm0oXqHP+KvGkXgqgXjzI8+OUKdMP3C8m7Qi6yeIvAkV9CLFRM9I4vLh6B9SRpDqu
         yd8RnJju+PtueLYmgHfuHuPkb9/gxccX821lN+FWfHsjPMoeYOE97VbD9uVrr3nWFLZK
         O2+sPFG+lui8iq3aEAx7clu4zZ4YXKJbCT3ImCKfprzewZljO0aE7cCcQGmvHWZ9At5N
         MqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271800; x=1752876600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=tNf/3IsT1wSk8tx0S4ShWKihZM7xklNl83g6BFU2Is4oBR+5SHRhs5BOwmVuMwJ9TR
         80lKlukJB7jIzpZuGOaoGKnAlmdyXzGqpt7yfSlQen+4vz+yZiUHSZpM57GKPT81ZOpJ
         nDS0umJDLNrV6Ktze17DtoqHYJJ2pMA5qT3yJdogbPBPNPHMvAi5CMAEB4MXZFhBryp0
         efArdMy3vm76eh2YambdWrK/y+RlM/cGAtIUTS24xUuiiqyW5c7DIwOMWgkuiotLb5NK
         e3d62QRBCgX+ovi7Ufu9cgQMYPxTh+nDTfNE35YGCMLVyY1sFA3zQjXCJaIOq5GWvD61
         03+g==
X-Forwarded-Encrypted: i=1; AJvYcCVLRVtrXw7eb7xIrNy7DD9gEYiRKDfU8u9hFYVk3FKZCKuUEbjcn5BnF9nZM90wiwH7LshiFyYbMd33BSS6TUKt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyln+j1vUWXv5Lbb7EUexBw3ysInDItvrUKeeBw9cVQzGifYc8
	Dq07cnGV36mX0JL5SocAFSFTuglL3YNah3ln6H6k33na+9xR6mcmPor55dvdFw==
X-Gm-Gg: ASbGnctWOeKFMck05HlkbT9CcakbY0DnU4wpKYJ+Qk/nCOAZyQeTZoUvXJnxWBOqhip
	PkDtdbvP06leXkq+dKlUf3ec/DaSkBTfJfuoeKTBUwbc9gWC0zEN/LmDE7P9IjIwkqL8eCWlH35
	l5b5Shw6BlVNd6w6nMrLoK+i0B/REb9tT2oPWCemOLIk4yT8r4ZQTdziNurY/yaSlZHtkKzELm+
	OOIOJjn3hCQ+KrVqdEKRaQictDi7Y0MH7cpAdKgpFmRgtZpbVoXwhhJ99mXEB4d9iVpUdMX2ijZ
	ElBoGT9/bB8j7dFLYpdD2uzGvC/iXzzXE4qJ3Z0nW3Oo7XIZOGFe5nF9/0rDdQtitdspcGshtP2
	2Bs3pqEc4PRXnWcB6jQFBqqSZGlgXozGuO9AyqdKy+6xIqWiV+MZKOUzYfX4yXMSSdVO/tzI9Sj
	Bos+HkPOp30bG9Ew==
X-Google-Smtp-Source: AGHT+IHVLhu9sQqqVzUADbZibqpiOXQmra1YzYG8sZbz+5Usd1b/VVnMLyp9rN8lFuXsffC1HiqoUQ==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr4258546f8f.28.1752271799602;
        Fri, 11 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc9349sm5520827f8f.45.2025.07.11.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:40 +0200
Message-ID: <20250711220943.2389322-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_151001_256892_8A39C858 
X-CRM114-Status: GOOD (  11.40  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt

for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (4):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 415 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 704 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

