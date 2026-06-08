Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4319CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33VwqNJKC3vQHdZOYexSv3O8gJeHLE5NCtrHEddwJEI=; b=uujQ4fOeNah3M/cKLjYSnZN5Au
	jkKnACjJnbRGS28VF4zLWyymuQYIkTg+c9oG2/1xNl+tX+M2aLOwg4y/+B0l3qcZN1qRGwmbJVvm4
	tKjO6pWwsF14mq/yYY+07CXTFpUH0ov+2Z8IkfV3OIfliou9xYcfMGA8HenbbL/Qse3VoX67AZlLr
	Prn6EpGfblDB2KYcLMdEQ5cA5yb/OJOPhBpxm5DfGemM4XhqElPQqlrzjRuIKAFuRpLQhD4srei10
	jfwqlX5xJzSYuPpP5OqeOUbZJAZMwXc6/gXMgznSk+Onx7D7iAvUdEdhIALPis8yxQbifUqp9VAu5
	RdcsFXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWblV-00000003whU-1tnV;
	Mon, 08 Jun 2026 15:19:49 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWblS-00000003wgs-13ZF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:19:47 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so3078104a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780931985; x=1781536785; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=33VwqNJKC3vQHdZOYexSv3O8gJeHLE5NCtrHEddwJEI=;
        b=LRcl1J1hc30FVbbCGnBBdfW+2CpcT7ui5b3uDYvRHzAONp9rEbTMxi12BNinnZJ7w5
         efh0sgH9+bm16NfvZnoL0hl6N48YSHt8EMEzWtw0XNjlDGmMxpFro7MYjmNSPCUpYe65
         474LABxQanROO/k/fl6MbSElXpT61V101KCgXHWOySWbGYAzIAF/7/x28sn2JMJofxpL
         Ei0gLVF+5pzgiKrQZz9u9ieeuTxsobXu2xpb1qwItbB6rB3tm22A85s3ACzlvAzs9CRz
         XdlOgrIK1A4SopKHcX1OxD2RROhfNUzWSdLvw5MLAeEfHkFrm36bafZy67TmSU3m/hFs
         DFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931985; x=1781536785;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33VwqNJKC3vQHdZOYexSv3O8gJeHLE5NCtrHEddwJEI=;
        b=UBjW5XY9iz2qYq9tTJ5okYzd7Oj8uGArcnL/Libv9pT8lY0xySyyN0qkn5w125qkpZ
         u8RWaGxsacDPgLhcBabaq3WtEZSl4RK3i+MBTz8gPVmUZ4isbSsmu3qz7NbbCE9B3RE/
         08bHMUak23WlCs0ODtAM33MUs5GCLCcI2dtc6nEc98TDZkE275Jl0BJGYEimO05zLNHS
         1dQKyvv2mVj7A2ngWUkU7IORRAVcKbQRs0qe1U4TEnKjPMUJy453LX8YGx8qTaqIdt92
         USVKLtOgQeVNtDhxIl58lFN2qb3LB/vWhBFNHpdIwnzflxAPfDOXrUKCoen9D85j1fr1
         DBMw==
X-Forwarded-Encrypted: i=1; AFNElJ/6lv1qoziEEPNj+EXCFcipd5bQxkl6ASWo5QkG9Bp6/tCCobfYDdzfzyot+Y6w15gWeuGPXs13OWewEfkmno97@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3iE0wWxTzKc+Whsysuj3k7mb9jEurCxvGL3ovzXY/j0DxVRua
	Oa4GIuoD6yvPK4eBz1Ea93YoRaxDznxY0WPm+i2Cprgn+14PdcBxAHLfUPQ72gLsEDe5ctsjPxr
	rxyqHtxo=
X-Gm-Gg: Acq92OG2/QmTcJM0EWD5ySwtgOdwQeSUahnwycPkqp4TF03AQZk1azZUJm5PIWYr8/1
	epmT+zNy6ve8iSzV6jwaTWRYlW42yUPupLc9+eOmMpOdU73wBWjwJ+A6Kp3YB3GE3MMPgI/3k/F
	sNqpbckjIq6s5+wIL1OJgczujXl3uy61dGieyQf4Jv6fj7r0FgdDuSb2+olBQ3i6pyHtTKlta0i
	vKGay2BycqNvF0Oms9Aowk7anwUW9eSi91oWZOPo1g0WenrPe+FMONLVK7ZGkHsUGvRxpYJhE1F
	YvzvjAxkmycengN38DsbFThSn9UGlctg25NUWZ8WND0/CsyH2OCZ2lyixc2A3xXbKpezcGYP/lZ
	NhHFQLtk8v2LC/tJ/cgwl0DG/ERLM54I31R52UeYsOENC46fEQEXHFGpR5jGVtMDr7hKVaJkSOr
	hBetgTx1Mltz7w+0lFQ7tMxt2JmwvMlJ4=
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr20264896637.42.1780931984644;
        Mon, 08 Jun 2026 08:19:44 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0a505fsm16290448a12.20.2026.06.08.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:19:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.2
Date: Mon, 08 Jun 2026 08:19:43 -0700
Message-ID: <7hqzmhm54g.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_081946_295269_5890CD28 
X-CRM114-Status: UNSURE (   7.60  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/dt-signed

for you to fetch changes up to b6aefeea7b4aa9158c1dcec8c050a678af7bf9b0:

  ARM: dts: dm8168-evm: Set stdout-path to uart3 (2026-05-06 14:23:24 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.2

Minor DTS fixes & updates

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in iio device property

Christopher Obbard (1):
      ARM: dts: dm8168-evm: Set stdout-path to uart3

Ivaylo Dimitrov (2):
      arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
      arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts

Jihed Chaibi (1):
      ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint

 arch/arm/boot/dts/ti/omap/am335x-sl50.dts              | 4 ++--
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts               | 4 ++++
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 +++++-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts      | 4 ++--
 4 files changed, 13 insertions(+), 5 deletions(-)

