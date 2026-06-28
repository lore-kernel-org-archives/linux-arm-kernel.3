Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nMtfhanLoaWIgc8kmg+9O3SBgKkKprc+QMTR2Mj1PNk=; b=rQ09gVx6nRRJfoDzUeELtLb3MP
	NiQD0vlyZHsP5Przhw5wvIpYk9KZKYtu/r2oBeSsPYx4A86J8Q8NEND4HSYZEDN4f4reWZr1HsWmv
	ZEXLmeNhFHUmIbNBQLTOaFIQMTK6crU1f8SPecG6yVtai+VGQTqsI63PuKQ20qXuzig+Yf6lLocxi
	ARGhqRuvTgl2jHT+ECHniCq6YIldQ3zs4wsphz7rsoETq3PTiiO2MZB5AVrYdp8mas1NgQ6NwZ+v4
	C/uOjwZBGsHfZJG/JXU90l5cQpQgUGSSLeFl72RDNhrXDg58Mo5O27hndlahcYABUNbt4Er8I792Q
	8SPwsb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyI-0000000DE5C-1Yfc;
	Sun, 28 Jun 2026 17:07:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyF-0000000DE3l-0hlt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:07:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4624a44e152so2288849f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666421; x=1783271221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMtfhanLoaWIgc8kmg+9O3SBgKkKprc+QMTR2Mj1PNk=;
        b=O4PtUMcAN+EeXV6mZGo1q+eg7VHz5vLf/nzSsuaszXkZTx+DGscAeYqh6hxQK+IV6G
         7UiKSvqABmAcZ6iETwQaySvmvxj93rGQmVGdN4r7P7gTMr8UkdRdAem1ncJ172cYw6gB
         SRnJnixvsff7nSivjTyp+3lHywB/jrOagpqdRf+6pYCK08ZYYFIlMSLoCIBoIAERkarM
         RTnnAfnjnFNx2sNj+41DHGW3+qyOmnNIlypZqHhoKEEH3DRNBwnDqQjbbBimkgpvKSCH
         IYPOQEkf86ZZYR9R4jkqba5oCVtozDbyhOMpKylNWKBRLXwLxPwK52Y/fHjnaS5LFZ5W
         MJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666421; x=1783271221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMtfhanLoaWIgc8kmg+9O3SBgKkKprc+QMTR2Mj1PNk=;
        b=R+mHcVZQX1cCMKam57IN0UIUQPEek5IZG4mBadqqNpT56HVE+rEiBixDD5EVTZ4z9P
         Ha0WR4iXm2G/6ZNMUuYZvGS/79OdpcKnm3qEnHsatww/ErBpzN59V/tV0K9ze4geRzOv
         jmHIen9+FP3cuXLcE6uFQBGaDGz4Hfh2UWdMX2TAypmXHmma1245wnkQy8I40UEJNsla
         QxHsly0vE6k4lYmeTcOJbdJBqmo28DsA8gW3ZYYv/YyM80Ts6TmVUUbZbkaYPKLz0vtI
         eHaFNmNV+p2Nozx2ZXoY85ROOi2dSAWQ9PyqCFR9ZNrsrnZvbFqdXk4DQ0F8chKwsy9U
         9HXw==
X-Forwarded-Encrypted: i=1; AFNElJ+715mn0DvF1Qy1ajXF7YFZZhK5av3rsKNjtMpMT/Tj4/uwToG4bcVWrmGAaoHizIUrNZCAZlZZueOziK/wU5uW@lists.infradead.org
X-Gm-Message-State: AOJu0YwfuXzRZegfd0p8SYALFZ3IDY9KxsJpxs7FhtMAkZWFHCrRQ9Oh
	BqSCcJASBGI3tAsx+Y/wT0nb4+S3Yc0tPQL6RI4PC6rRGA+X9ORSGKCc
X-Gm-Gg: AfdE7cnDMpY6INcruwPN93mk22ohJdhfC2YnqEY/5UVpIgkyuyFXmur63Pvy+MwzRz6
	6U1ZPoZU1bLnuLfNkj1hL1e1Jo7SzPE0KoYHeLOUskS/TXlgz8IjUdS2wW4WxpUzQjzwnQV4WN4
	G/kgYBSXXnQ05JqUrqsEx3emlmoHEmU2ejpjjuEpdXSKCIZj8vtN1cUAlgslS1hUm8LsdPojTk/
	a8aQa70lh0SZdf0roXna9Kk93SctFw2p180B2acfMowJkdjfmDJN57T8FHlTXESyUeZyBrqjNN/
	RqRhskyWq5kC4HGlA1jmWcD7NVN8E1ihgjwQf8OBTHM6255zJwqQKXh8oQXwOnDe2XOX4LRm3UG
	buhDVksy6VzgDjJuyWZ0aHj27PiRnZO+DbsiGLH+oSA/2c4yZnX5i5TuiBvPz1Nwzx+dAZeM1K1
	Y8czo561pTKQDnV5RJeZlC6/Y9LFtgtgHro0C/GyUgutTgR1iwVHkfAqjzd2jfvzRdbP2ijmNgF
	tU2luKDW55EWT4bMY0x0+DpTQ==
X-Received: by 2002:a05:600c:a403:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4926689fab5mr175303385e9.25.1782666420234;
        Sun, 28 Jun 2026 10:07:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:06:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 0/4] arm64: dts: am62p5-var-som-symphony: align DTS with hardware revision
Date: Sun, 28 Jun 2026 19:06:45 +0200
Message-ID: <cover.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100703_602059_923D1416 
X-CRM114-Status: UNSURE (   8.64  )
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

This series updates the device tree description for the Variscite
VAR-SOM-AM62P and Symphony carrier board to better reflect the current
board configuration.

It aligns the Ethernet PHY description, updates the audio codec
configuration, and adds the touchscreen and TPM devices together with
their required board-level resources.

Stefano Radaelli (4):
  arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
  arm64: dts: ti: var-som-am62p: update audio codec configuration
  arm64: dts: am62p5-var-som-symphony: add touchscreen support
  arm64: dts: am62p5-var-som-symphony: add TPM support

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 38 ++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.47.3


