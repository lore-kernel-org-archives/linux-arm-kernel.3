Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806CCC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=; b=gl7gSkKla4S2DvwHfJBQefKo2h
	9q8tptFLWLbuy+e2UHFXfal9WrsrIOjIvy4rjVrnFuXdRnKSmGn3OT8G36Oe7MGI5yUNgchgms06c
	6xmCxawTVAr2Se++zUVHNYduloYwTJjVa9XBObmOzsAJM9pvZupEiSQXE9t+CE4rMCrEUFgAUE+C6
	PYin7yQFeGLXuYKNQNjH+nURUxkKzdPpra1pCiLRQ1zs+z2nCMbAuigDfuEJhhQUvd0h3EmpaKvDx
	hX4hhoMhBDFiEtRfdmL6I5oysg/4CSxsOf/pHkaZDniXU3dSabhGumlR6R9jPnzVyUu8j2tcO7eTk
	Ww4M0bWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdi7-0000000A7rm-16QC;
	Wed, 09 Jul 2025 22:56:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaGR-00000009gus-1arR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:15:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so36073f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088530; x=1752693330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=ZYrCOt77Uvb8lx27Z1Pzs4OEpjJ7byItQAExlkq3BTs00Ep2ZRzZUX7ZJBzbvf5+D9
         oQr5rGpLBEstyc9vRY8BZmTsgHYEu1An36K9IFygGYHiYU9su2scQ4Vm/qlHQKmKlDep
         8xz9ri/jrxGaRizi6lLR46SLUqE1Elpv2L1b1KejYlrzQvQMzKCGVuQ775RM18X846va
         r7uj6nrKIz3LNb6RfwpFuGaW5ZAVHLuMRK94EBUCab9YF+TgkOEijBvZvV4tmmYVifOU
         10wjxEOcrDc1KIA9iovR+Y5rcqYMDqQr6x3WJ+eUw1aPr1dUpxC7xXEOWDEVcybZWZjO
         DKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088530; x=1752693330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=gQLO/YKNLeSWzMZ+4r62FsqddjIK1CPNa+er4yiINV64sseU6rO6Fp88X8m2RE7f1+
         de2izUAcRydMf0JGRUDNmJDOKJrr1Vp0wgeqBgsJ9jLzl3P+Jly46ECuSH06n0XiDxeH
         viJdcEbaE/y/rxwlrpn/GAhPsCl+KWTLO1YjTNAdlHjNZwhw4mG8NP+K3cb+DBPjoD0p
         COSS/iYUEMQvZDtuX0/BvE+0t/VBoLijhffceF7BKISRyW2/ZAQfpdUO/NrOXeVdo9AT
         NHsxe4OLHR0ELzSnu/6t41xkLhzITfntXWq/WKdGo1lKWjZBMioscwCXDn5qnUWhzXyY
         6R7g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9S+7npIEzvfN0Y0CAAHF2/wmPTf9IoAcuY6b161xvRy+O1m34xxQBVWHJn8TRm2ASWcYb8UaU3nb3+GXPzWB@lists.infradead.org
X-Gm-Message-State: AOJu0YybPDD2U99BKfzgsRHej6UbhYjbsus3yoF6FOnnzx1h7G7O52Ph
	EKFDfircl5SeIbUk6/zpE9wikRiQfIPrasg43wIiwPpceu6p5voLZnOHhlziTDDoryc=
X-Gm-Gg: ASbGnctDI6yFP52Hh8wkx6p5O3nLXGOz+y/Pg51Jl4xUU17rZ+j+d/eoqgq8WFvhW1e
	DqqhJqY/XeE1zuzn/aifjY7PXiT8VT2uveSyvneNj6PqAgaCFxi45dF9YxnQZZxyz8viHNOXgWD
	8h/wPptHWTW3vkhGvaVZS+EWxgXrVghDKD6dvcmeXc2u4U39W5b5C13Y8anOzK843ADxrQ9PAjh
	QxVSbTtwiWtDGdL9XwU0wFQ/sjCDm+26/lGNZ6UXuhPcNIOgrzfimFWjsn3+2rCvbumQHt+610Z
	bGr6edHe59+6UbZJw9noLha4ofDQY9Ef7hYnB0nF68ggcYH1388FepxLngXM8mQmoNSD0E5NCEg
	=
X-Google-Smtp-Source: AGHT+IF5fQuSnWVC1+1FSPZh+mnfL3zRfmekTmST3Oxxmhd4JajNQiGduP450T3HuQ8hjxFtcBtDTA==
X-Received: by 2002:a05:6000:2888:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3b5e44e107cmr1444727f8f.6.1752088529780;
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: defconfig: for v6.17
Date: Wed,  9 Jul 2025 21:15:20 +0200
Message-ID: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Vg3SYFcxbZhfxzHwdzewVgAiginzpLipvsLFtGoX06g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/LrlRRiB7NlTXa7KpRiF8ppNyVSL6muQZyc
 U/nnYOJbbOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/ywAKCRDBN2bmhouD
 1631D/9+mUsRGRHWiIdpYnSIndM3CR/VSb5CpOedsp/WMUAxCfvyYm+cNPdqWe68MxqUBliQTxh
 1luK/jO2yNlAMjmvD96Q/UOLXSlS4g7NdpSePbKoaT3isLHiX8n972jvmX1pE684SlPD+rAl8Wt
 BflVWx59w+n0qWa66Hc+lMgBw58NXoJ2daiG2t2w50XLSdskrcF/Oadi1bwI5f00HEywZMPxKnj
 QkquXmlnBi6dyHdHfFGHu3c7k/Zjg9Qcy5F7ut+IOUC4wdJkHSsnAS5xgRC9nnjB5holPin6heD
 ozlaZ5iKoM25cHC3GxOJnmDjQBaRrMbb7vIdJkEVuQlr5HAFmKbPiZHusiVlJgVYMcu9nt4Axme
 fGeQkPXLKa6wxYWeS9QI+IrZEVm/Oai3bSurC/PZeyvoJu1w6pHZebKXR3FoPsLR0klnTkGBbL4
 zenZDZRqCT6Nq0kS8FAy0rAIyPykug3COaM4NCi7WsbJWpHXhM4hlrLXG5Rqtxo63beki5kfn3K
 yOoWXlfEQ6J9zcesgUhIyAFhgqvATrlJVJG318inhKHYbiR5YgeWikUbEeJGNlwgXDb6P2kITWk
 y2Hpg1qxObvXjVB6wKFdAVf++28TEW/v9h5UVrsnsxt4X5nEidEK+72Amfzl0J6zxKZ1N1/gLw+ ol9EG7e7CPuRbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_121531_647592_0FDC870E 
X-CRM114-Status: UNSURE (   7.22  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.17

for you to fetch changes up to a7d7aebed4005b9c287f9bd9d22c273da63c9028:

  arm64: defconfig: enable Samsung PMIC over ACPM (2025-06-30 08:03:28 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.17

1. Multiple SoCs (including Samsung, Apple): switch sound to module from
   a built-in, because it is not necessary for booting.  Also drop
   redundant sound codec options.

2. Enable PMIC drivers for Google GS101 Pixel 6 phones: MAX77759 and
   Samsung PMIC over ACPM protocol.

----------------------------------------------------------------
André Draszik (2):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: defconfig: enable Samsung PMIC over ACPM

Krzysztof Kozlowski (2):
      arm64: defconfig: Switch SOUND to module
      arm64: defconfig: Drop unneeded unselectable sound drivers

 arch/arm64/configs/defconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

