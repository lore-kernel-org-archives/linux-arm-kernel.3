Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EBFC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=; b=yFU+2HHeX271NRkQMsKVN4RFPI
	A9Sis7/CZkPxJDuqg87dHCb4e9JiI7Gkq8NJJOVdhWusBMu9jxsLLuY+U5vuDhLedVf7HvidIy3Qj
	RjNzsenqLeskc6PuTtS4npsBrtyN5InVHA17SjuHNgMIxO94K/U2u8lFGjREe0Ir8g3ISz6/PhkZx
	fXdFhPt1Vo3h2YKXzWNOKJqQxvC24YJLM/XD+CjrvOgRPEjtuY8IPZMR34uIrkdKbGdmekkYTN9T7
	hQBiMSGg+Q06bIk8K20MWAhm05AoBw11MTZyRDuSJrOEtiOhlf47VnAI5iBqxhFL8ccaglc6v/PyE
	QaRgvl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqacB-0000000Etsf-1NS8;
	Fri, 07 Mar 2025 16:31:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaUC-0000000EstT-0AOu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:23:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bdc607c16so16191555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364622; x=1741969422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=IJsDy3rVv1rYnvRuKuQXQluWgki4MIlc9W/A/svHceXWGiTNKtbQNU3e1QBqKNJLRH
         HAhyFd7cpYBnSYCwIn/LR4aBivjIepH1SQMOqNX6imaeAkTJtn2Su5s4rfWeaXt0t7a0
         Efitiz8wCGwJu+bCgxyKsr5XTbZpcivibESN1BmDtT2ra9LzgbCiIJTXgHyK0nxKfAqv
         92N2hLBXsS66sHsk+wrNb55pyVUsxqiQUqCxeTou4zCB6/w2TsnfW/dWQPY4qT6iTCR4
         KEJe325rQCgvbH285N1jnGVwSkrGf1GlwEMhPz0JyWtw8R92SAVcnEwje8gMCndRySPA
         sIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364622; x=1741969422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=diHrk9QFjvGzL/xoytpAbTbwTfR2gpLzK1AI6MDnlYs3u/10Oq6hKtIT3aKdGrLtzi
         LvlxnD3SEFzok0UFALLd0h0eUldgnBtpfqF2GTeypV/zog9ZlWi3ApND8rlk9uGkB7YR
         zomTGbmqpJmKrbs2Rdl5fSopArPW0l/rXVkn8cchPLfW2wMe3qslF9/xLTeF6cLJhV3z
         csTcsk79oPAT+CdOvMnmnwKAKO/EgwheRYmIMgfoRIyz5TnqY+6w0K+OGE8513/gTxvZ
         mMX7McxPaGwwyPnTq+7z1cP0E31FiYCG8VrtD3JdO2E+/gKWLhINgIKwM0yE11zuH+rQ
         rs9g==
X-Forwarded-Encrypted: i=1; AJvYcCXzTJmBqPBOgVp+VQN4WHlazp5DM2e/e/SdJIp5KIm2XK/6njQ/K4W34kq2SzPukkKCqi3iBGswjFoa0hi3pudr@lists.infradead.org
X-Gm-Message-State: AOJu0YxY44V23tXHhnUl9zswmOTwspV9xyr9ZBgPTXJ6uvpAEqMxPG9P
	sqKdl4PN78a72kwU4tTvd73KZotNNMTn09P9vBscPyp4li46zXlFSXuMKw==
X-Gm-Gg: ASbGnctdDVLdQX6XQzT64ABuzlbcwLUB/0RiuI9k3WuJv4d57nnWLJqKr7cgH0sgWml
	56IxmaqaPe/EJTTXhSYcuKYNbpw6tO1nNUvRhQtZfFGdrnX/SI0Mes/a2hLAmRCMATywpimdu//
	jekRX7FjVeoracDT0m4AfvMOdO5AN+m3XsRp/BC4xwPwHnaeVUF5OV6niH6n2tVn3vzq+8R7Qip
	Qmg/Zlwg7CTXwoi6Jcqs8dAbUlnlJZv0UVc0VIJstisjBASaassKtnTBN6Nm/26VdW56SJW32fF
	SOpQjTKQ94ilHAVQOOv5FziTjEScS+qE1GfG04cGy3KgFB3NFgRTKWAZz3nAt7yzKWW6Xd5+YLG
	ZmYorXYsQp2Ria9yMjGeg43dDD/2TclMY1Vpj
X-Google-Smtp-Source: AGHT+IGYSZAdIPByuhfnlGvu8gIwV8NG9QDkn6z6XiamtvDMqZsy7KeQwy/cINDke3X/SNx+z6U0jQ==
X-Received: by 2002:a05:600c:19ca:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43c5a5e5259mr24255695e9.1.1741364622143;
        Fri, 07 Mar 2025 08:23:42 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2b8bsm5846199f8f.64.2025.03.07.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:31 +0100
Message-ID: <20250307162332.3451523-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_082344_085225_089D78D1 
X-CRM114-Status: UNSURE (   9.89  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt

for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:35:53 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains some cleanup patches that remove unused properties and an
unusable key that was erroneously exposed. A fix to support GPUs with a
large amount of video memory on IGX Orin is also included.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, and the output voltage of some pins is adjusted.
A fix for the VDD_LCD_1V8_DIS power supply is also included.

----------------------------------------------------------------
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

Jon Hunter (1):
      arm64: tegra: Resize aperture for the IGX PCIe C5 slot

Ninad Malwade (1):
      arm64: tegra: Remove the Orin NX/Nano suspend key

Rob Herring (Arm) (1):
      arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-scale" property

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts   | 10 ----------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 6 files changed, 52 insertions(+), 18 deletions(-)

