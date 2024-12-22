Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD12E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gPPjd3s39nBr3krlLS6DkSRw+C8geW511O7IiYKzB+A=; b=pZnvu0Qjb+W5NiSjmf6qTcZV73
	7w/zp9GE6MC9evv3l5fa/93kopsAj1r2lCTA7fwftQOA+LQvBr2F2oBgj4oroZQIfWnxV50jUfvbI
	t/tgjF35eUsxdJOOHfau9D12/QrPqbJS8cduDwyoeAY6J1YzRezTc+UpdckBs36YhO7nWICrivfOt
	lGq8lTqS+Clao8WpQPQQoJYzS7IIgZEs+O142hmvvgGP3mm3dxWUAaNsCX8M4EOd6aztzbHepIwtG
	vIfP9eNPc8Te1Um+op8j+y2r69DWLtJdTc+CglG5TmCRjzW+bYPjkbiDbKeYc2/Ij/yGy+JL2VwdW
	xgxHKXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPrG-00000008bg1-3LQy;
	Sun, 22 Dec 2024 17:35:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPpF-00000008bNE-2kl0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:33:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so2119095a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888789; x=1735493589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPPjd3s39nBr3krlLS6DkSRw+C8geW511O7IiYKzB+A=;
        b=hl0TsB4ekcrXthLDiGWybMYsJmxx9Rry/4K5s5u33zDDeM9ySjwOZgMpQaQsFivb1M
         AkdUH+pavnruXfsFUghwlHuoVD94fT5a1087em/6YFChVTG1XH2j3W1iQ5ze3lWUi2JJ
         ZGusZYJuCSdZ2s8evhX+XcGwNplPb/4elkqcwNlAoNsFNQMPHU//huavReMSk55HqAcI
         iIkCQcEv3d2lJqNY7ouX8QzegW62BezuQ8QYs8fr9gG1JXwXjg3+gK/Wl7XJQFZ4cqcL
         41iqTH5UQAu8mB0Kv8Lm/doL/Z8vaJaxtsksz42vXg8Ns0AmgFCoxL8Pc7Xeh4EqxUUO
         P/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888789; x=1735493589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPPjd3s39nBr3krlLS6DkSRw+C8geW511O7IiYKzB+A=;
        b=VB2qrmsYc2/tTpiSgcSyax8SH40a+YXgPKPjKUTeDC5NCAaS3/Ovvps4O5hunnSemc
         snxc+hPqc7VD/wVQZY+In1DVgtEeBWyw+PnMwqIBxF48Fzjkrx73dZiG2BLZUE5fyLTF
         57TkUe2Zf1ED8xQGOvI+kTjmgNDsI+GhDhczZzcYU7EKbNhhD3HhwE3JK4O29nBhk9BX
         J1R64zXTlNn51R9rezaaeacXXV1Bs2J7dq9DvSfbe8lfF5Nbe9GygOzObhtkUjzuinaM
         xorzzn1fkl1oeFuYrM5FjjJdQXu6TwjEjkyu9M4uxHCYETHENzvUig+6ceOB5ZeNQsnf
         oL4g==
X-Forwarded-Encrypted: i=1; AJvYcCUuvpEkMmwxZ0vg5SVxcJ9lX6J6D0Z+q0RV64iOnhE1DvA0+Y2ooj6RHINCKJllal3MVgOI3+5shUBAsap8Ve5D@lists.infradead.org
X-Gm-Message-State: AOJu0YzpHVaRRShn84EBE9umd42hf46NBzt2W/h81b4l+J19JMcVQyAX
	9X9hQfaZs4la1UKlD6flEdfBUnGZmpAemY7of9W6L6/Nfofp+2Yu
X-Gm-Gg: ASbGncsXhiy9D9+mPdK84QE4YuHc+JxVlqVPMnTDEaP+3rn+w+Oe55MWyfBb7YL5kzO
	KI45eMxog0eP0u8VWmfu73UHbLBfRQwR4wCoT07UyFyHuOOkCWc15rqMBB96xb85ivBkQsMFHuv
	dsUq6PNNz2ef90CrduXky1KG009IAPZbJrj54l+/zKWixUOUQvpWeP7QindbEjRx/rBWTJJadn6
	Gto1lEyMI4Wnq/H0YICG/8ab2gFtvIAyA/sy7dJoLMCzphGmCmVi/vFdA==
X-Google-Smtp-Source: AGHT+IFZKtlmUdh5emhOPXWQQU+C9eJT7EuMyhwCWbhtjsp/XYx8q3zWVUTywWzBdiJQT20JGLxHTA==
X-Received: by 2002:a17:90b:2e4a:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2f452e38d0emr15732309a91.20.1734888788739;
        Sun, 22 Dec 2024 09:33:08 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f4477987f4sm7567552a91.2.2024.12.22.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:33:07 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: [PATCH v3 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon, 23 Dec 2024 01:31:46 +0800
Message-ID: <20241222173240.147675-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_093309_703854_D376F86E 
X-CRM114-Status: UNSURE (   9.57  )
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

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

Changes since v2:
- Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.

Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Cc: Aun-Ali Zaidi <admin@kodeit.net>
---

Nick Chan (2):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices

 .../devicetree/bindings/arm/apple.yaml        |  41 ++++
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 21 files changed, 527 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1


