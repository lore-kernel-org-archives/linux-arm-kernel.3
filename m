Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0985ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=; b=Vq7skJu81PQ5SiaMGcrnrAw9ja
	YxE2bt4cFbr7TnAU+V1YbWsZsmHH3CtAHn5v2sdwH9OXKRUMeVtbxQyS2p6TaEch9CgwXtYKRLsT5
	WT1KbmPxtcPwzfN0C0Boovous+uKLcacLfqlY6fYZcEbZTV3BrnrSH6fmoPUYDi+im4ngbtm0GGad
	tEFEa6domESAMPa+W4glPmbRJG4CnfJyz6o6xfzO4DxVW0f8QsxivN4snA3nbc+m7dOqg4orNTVFJ
	yzF/vQ7Hzs0s4QiuLmQVEKbxlzsh1TfEJfew4S64FQEjaN6bnVy4EvRTx4hnz8GovJkcpM5T2Evmd
	ABCsun+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulV8O-00000008LpP-3UIQ;
	Mon, 11 Aug 2025 16:12:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTEg-00000007y7Z-3TSu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:10:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af91a6b7a06so743288066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921448; x=1755526248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=KE9W9KS3p2K49U6Bxl5KUzIv4kkisqZzhiToMJ+K9NJBPNelSCzrcASlEYkP84KD4V
         9J9ltzj20snNaUMecubLyowU1fX4Q9b6c97kfAxd6AMSKuWQDKU7rSHHqDrZeApznoVc
         3ZrbodEvbs4d0/Fynz13yNuufWe3Z95Pl4P6CyPYTlWv0xi5g8M8yWXoy6DvWFvGnuT8
         Jen1dfhFKsJFkYoi+4hAlCp4uBYrsrMU4puwquT2oO9ERNE1lXhKDSgmR/vB/6gB0NKJ
         vAkHYvGhjNRHyTv+g6dH7CAwyw3As9YrE4m6tUWrtT6fvrNByoq3uKgNfeDMOw97lw0M
         cK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921448; x=1755526248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=nmP8od/lH0pVIJo/TEOS1V5cY/GgHYfaIx72C/x6KanK5BId37oQfeao67ZsOdCEDc
         +Bep555GIZfRmkFMUQX9RiX/OAGEzYbM0dguH5vJbntkORLfJjCBRH1Tu07w1a41whyD
         BRJQeCsFjKBd2X+kWwgkbDaCIhsEUP7+tFo40YIWRtxr8PFWersMoctREJhHv7KHaSjY
         whwik4yUi+2soH70NQ4qWkHpgOFSOWke19wdc/XTccgMUaVnVlP4Ava7QYjZZCSjJVyF
         0VYgWRMkSLN/Ga4aJhJHA5GGxZY6R83SLDzm0XICh5jxdPIkb8aX3psqkqWyBaUcSa5b
         pexg==
X-Forwarded-Encrypted: i=1; AJvYcCV+P3XOGUiwAW6aQ4SYh4zBiSjLO3VIXOvAggv0DqISIaW3z7qsY8iYCyDEkMXZ6/AUHUHNjeF2hzwmZ2TKDOm6@lists.infradead.org
X-Gm-Message-State: AOJu0YyuQNTC0LssPNExkzpLSgNJASZV0MWqHyOf0T2JgFMTZTphJkpD
	WIApXx0TrkmmDl8lmx6g6YM3me+0igZXQxsCodnRLsB4bhh6bP9tDevfq7lLp8ppVCs=
X-Gm-Gg: ASbGncsdvQ8eEgGCbMV2jZrtpSJ+kaKX1d+qGrnKIEZ8p2RVa8md2cb0o15F2juFYoE
	TFSe1bpTAKsEndgMy7GFddkfm+PncK+6Mkmxeys3SbG5EdCClCNnVIaGvWggaArw73f8P0VIu5J
	vM+K6mZpKGz3l9ustc4IAUISoB7m7eyYiPva7IljaJiiwrFECTS7imiHwemuCxfP2pNf6QeFIRV
	OXsJs0+YYTycmjv9Afe9/xAmMpGcJi687FF76dkqkDygfxIf9oguarcffv6VWk/eneEBvmDEnFT
	KC8Jy3wbF6bCooGSBscDo4pvVLC7LUiKIg/AhXC4v61hZx1v4C7dwuKN2xgiwTmL+11bwmOHgd6
	OdtvovUAydo5IZnKuhFGJDT2e8gfew0m+NWEj+QSWfvAIV1XDcJWn6tvTTLOL7UXn6w==
X-Google-Smtp-Source: AGHT+IHdBKFk8Hdz0O5Qrkqv+q1AVcT+ToZrNVbbDng2NMf7Xf+fMHPhcyvkBGiKagZpBw13o0Tyeg==
X-Received: by 2002:a17:907:c1c:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af9c647bce8mr1317574966b.35.1754921448512;
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm2030552266b.120.2025.08.11.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 0/2] Establish the roles of board DTSes for Raspberry Pi5
Date: Mon, 11 Aug 2025 16:12:33 +0200
Message-ID: <cover.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071050_870854_FF312C86 
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

Hi,

this patchset is composed of the following:

- patch 1: just a cleanup to get rid of duplicated declarations in the
  board DTS for BCM2712.

- patch 2: explicitly states what BCM2712 board DTS will host the
  customized nodes that refer to RP1 internal peripherals. This is
  important so that followup patches add the nodes to the correct
  DTS file. For more information about why it has to be done, please
  take a look to the patch comment.

Andrea della Porta (2):
  arm64: dts: broadcom: delete redundant pcie enablement nodes
  arm64: dts: broadcom: amend the comment about the role of BCM2712
    board DTS

 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.35.3


