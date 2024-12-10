Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BCY2cGBNnositKDICf7Efd3URLuqM088tDb4fIyX/u8=; b=a/COAl7KYyelcKD6sl9+sHe84o
	SR+J9M+q05qu3BLPRqzmBMcMqXWN7j5mcvvNLCKRvp54iggCxN/TO465P97y4iHQKhh0WiVscMDO0
	PTIWLykT483VDMA/z3tIiVzcDVmv41XHv1TvAe1myEXFHShuYcgziCcq5xOI6ud58mvSFDMCovKgS
	5UYTZyVER5RE+KLO1XGu1xcDoE9OiYwAlsqgRvpSLkcsg+t+kTcADzJFfdX1X8M18Yvq5fdSU9ij8
	oYrZw+qxBXZb94dtTGmqFr5R5Zv0lTja6U/CLpdbd0rSM3Cekbef4XCq9oDWsacxFlpRIO5oZUebK
	6vud034g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4a0-0000000CM4x-2f4R;
	Tue, 10 Dec 2024 18:03:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4Yx-0000000CLtv-2TPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:02:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa670ffe302so508291966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853741; x=1734458541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCY2cGBNnositKDICf7Efd3URLuqM088tDb4fIyX/u8=;
        b=TEk5PpXBN9OCA+s4vi4IFWHIyw7teakYHhyEF0L7jE2GnvN/07ZtctrlXOXNXM0OE0
         7BDQyr5KLxp/taaN+BR3/g1N3I7atJLmDwzXy+d0wxLUEwfhIE971PeOezLfyW8oVHgE
         17O5GhYS438g49j6Qm/54XQb5M4H2a67V1FLFC7AAdFE9EeEurRg6OjCnZcBjeJAeGgm
         6kNVhWGkAIr3SsEeFx9Zz7Utg19ocrsGzAVnBFhX+AogFqLHKP53m9LsCLasfgeUoJ9Z
         PgqP7726MPCHfOwYpTxBXmfLSkA4Aqb1UgykycUGhCcXB6q//sPJv8BsbuFSIGdgI1C9
         wNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853741; x=1734458541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCY2cGBNnositKDICf7Efd3URLuqM088tDb4fIyX/u8=;
        b=VUmE4w0OosWid86DY9q8iGaHZgBwdFTkIV1MeHzmJjqeCErstw+bUPFbcNrmL7Ca/r
         nylLqXwgD6TIdY38tpK7sRrgq6BWM2jIshDBbcm1EH5UKFrLGYMmlCnoy9otVrcRqY1Y
         PZI9wFf8B9lArB2vS/Np3+HB4cqbJQ438X90tzSCXNdU4hZcEZhDUJrltE3Me6NHeaM7
         dL6bVSup7icC+yYl9JcgZMWkyhm7ztUfV1qvwhrBFqO5W6ENgQ0q/vgASHR7YhJVFSb5
         dB6Ux7Ffpg+pc+3Uu4WXGcxPT8CBG52C/34SvhK/+OeYIVq70PG2yj0k9npcx4yzC0//
         mhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmZz87NwOzTdW59DFmsRAC65lV8PAKYujbdq4ER0Mr/Ff3ZSvrtyTf5AfrswqSqeZBOB+gsB3j4zaULkuj6pe7@lists.infradead.org
X-Gm-Message-State: AOJu0YzY5y9HKPmJmwRa2QDwONKUD+l+U57QVVOlJmY2bwdXeZjGTrz0
	qNz2dlwk3PA425QmBTgT335PgzuW7bNFliCVOZ5BWdFo9rpY5SsY
X-Gm-Gg: ASbGncvAXZ5lJtDL3W5gu8Gb+OdXgEn73lCHhu8ZirqJ3uCslyzQc5KKenTVfKyBq4+
	TVoGBBdc/bPwpVGAs1iEf0JRWMIpAzqNaHf5Ya047ywzFMZc5UywyRoY0pWVngXdm58oCqsZ2X/
	emdQaZQ/j7pLgDV8FvD4IS7KT4Laes0nQyruJ0gY8B8XgMWCziq4EckQXoBpfUNS5mwP0EVEPOB
	JuTJ8ZEgtcyQ39/I26OSH010bRtqPOGD8ewsrPtdEyiR7ZoBitwsSDlgGa+SQyGSddRK5HSu4sb
	4bwssr9HFxAaBut9XJApu4WiazDlGA==
X-Google-Smtp-Source: AGHT+IFXTKqLN7rVjG4MT816P3sDPA226Vptf61aO0FKpDWfT8usup+FPSpJd+BDFWR01cmVkV/mUA==
X-Received: by 2002:a17:906:cc2:b0:aa5:27d4:980a with SMTP id a640c23a62f3a-aa63a242b13mr1598856266b.49.1733853740403;
        Tue, 10 Dec 2024 10:02:20 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:19 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: exynos8895: Add m2-pmu, poweroff and reboot
Date: Tue, 10 Dec 2024 20:02:14 +0200
Message-ID: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_100223_627378_F3B262CF 
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

Hey folks,

This series adds support for syscon-reboot and syscon-poweroff to
exynos8895, as well as support for the mongoose cluster PMU in DT hence
a compatible for that was recently added.

The new syscon nodes have been tested with reboot and poweroff commands
respectively.

Kind regards,
Ivo

Ivaylo Ivanov (2):
  arm64: dts: exynos8895: Add a PMU node for the second cluster
  arm64: dts: exynos8895: Add syscon-poweroff and syscon-reboot nodes

 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.43.0


