Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8959BD58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZRLmaJWutmjBaVf2ZkxnCmHqpfR7O4995L9wh5FFM+E=; b=Zw7W5ulQ5Ths9eI3Wds2lmUgHz
	XggK1F9yWVIth41iEOorTJD1skYCZ/3L0EwEdfjnNrqsQ8CNF5lsiyC/VXEKWQ6aKhh1/5HeKpkx2
	sZCmbUBQxrCre6fCP1N+lG0XFJcWBkuN7Zk8Ulkz8Hg3Az5h4CpMrd+JCdHHs3C/PJ85Us/qu48sz
	TpadQZBMUJ4iSf0yuLhQleGZoPH2rfTQ9AhaDDrK7A+psfkcYDXSOPPjdAYE7nmsVC2c3N1Z/OeaQ
	l3ylMD978sAaWqmf8GAa3Oj2+BInoMueVzZvkhiYE6UTwMT4NwJx9l2320U6/bpdEQ0vzE1J67zbc
	QmkXcSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiG-0000000C5jY-2r7r;
	Mon, 02 Mar 2026 02:08:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiD-0000000C5iT-3Al0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:08:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c6e3e4e7388so1509548a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417324; x=1773022124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRLmaJWutmjBaVf2ZkxnCmHqpfR7O4995L9wh5FFM+E=;
        b=eZTimCHuTlhzOxHpst7xtPHRdoQGcbLI8H0noRrBWeICh6EUQu3vMH9t2n0wSNNmrr
         mJnk+EaLnTgFsiGaB+fXzkfSkb0BbciX6WnDkSin2InYq8VMkqybFlJ4ip8ROTlMurG7
         RJXPKjM/Yg1NTecLEcHRR2DzKuKVi7SINi4JS2I06hOTnoDmmll0VEMI6hryqfehHrmX
         Exf7/BDDBrahWfPfZ448iOrMeOqpNj9WUmkgWJzelrZkPRKqM57hW5J3UdNRcjcnLPQM
         dHuc+vaLJVc+AEWEU/JDHOSH+L7q5vO9gJuWE6RSVUaMkENXj49MSGHLcTr29fLvC/qG
         2WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417324; x=1773022124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRLmaJWutmjBaVf2ZkxnCmHqpfR7O4995L9wh5FFM+E=;
        b=SOlt+Y6A7dqhOiltuDWTfOoDLpHrM4BUkjelLgGYkuRXoboD/sOFHr5J1wBb+lbYry
         7VKsaOyCA+iv02/2lckkH12MeignpTEONzaPWYFy08UTRdPaI7/nzhEhgDCYlKnvGyh7
         Q2jrzXuRlcSKzj+0fcwm3MHB5l2TnDfOAcnqFBvdhHwVPpkc7Fkss9Kkh3shbks4bYLy
         8riRMrW1qkYTMVLm4tLZVyRape6wd4v6h3K6qZCIYjVBI+L3+3/SC1XIdeNuIoInyD4L
         As9lzmxJqEt4Cr4pLHOF3Nv672J803t/d1dQMGqRQGdM0VkKRkBHBw3eo63afGebUxIl
         7tQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Oq2Upkt54gAZCDLbvr6JnUMEROUxdHgdTubKBNVb5SaN5wZcB4Q1kcF+Kaj3wfxnIadHyXI8iRoTrDKd+qIw@lists.infradead.org
X-Gm-Message-State: AOJu0YyLtKhykWiwM0iqoPFIDLn2Epv/XYxhiXMfyPdzBwX1lqWQImSY
	B2bVcVlkZqBkH2lxHvgAIktgowxnGf2HUJ2D12LMC2YrpniCWJ+CBXJ0
X-Gm-Gg: ATEYQzz8qy/Jlvc6XkuMzcq8YSfGCaYluEo/RaawG5xmAyxxXnksURb/6x2wfAfuXfQ
	SmuyfvBgPzs54lSt+XzS23hqGHjvSnr8HQINXm9Bm3Atvluw9aY5kvEw3yU266tcM5y2kQRBRCc
	izKFL8g6XEfMotVfSsxdpCNVvfWUDYKHIzvFDJruldiWjB49k4BA0hhuRkUvmcJEZE0U8W85GZA
	0oNtK51Rxy//w2ppcxa9UhG1BIdgu+C9u0LQrtJednEQ9tj5EeFdue5NeId24F6GdGQnXCXx8t7
	UcQj++sUQNxowk1XeGUyfUADXQghIPe9f3SpXBnipf5vlBzdqUZAcd3v5EqcORT1FoBmRqNFSCW
	HsMkyEi060VrYd/SIjMetQ4NZSKHyVinYGbd3HdGsjs7NMuORM6HfrjKKb9x/KX52D0B140Fa0Z
	aLc2rzPQHp+XhqRWEcN7qm0vHoKWxaHKWuNlGEcRLf4ps92UfG9N3/IGYwoZ9H7A2o5kRADvUK5
	pOJgJBMZw==
X-Received: by 2002:a17:90b:54c6:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-35965ccac3emr9541808a91.29.1772417324267;
        Sun, 01 Mar 2026 18:08:44 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35987523629sm2764697a91.7.2026.03.01.18.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:08:43 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com
Subject: [PATCH 0/3] Add support for MA35D1 I2C controller
Date: Mon,  2 Mar 2026 02:08:19 +0000
Message-Id: <20260302020822.13936-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_180845_806014_3690656A 
X-CRM114-Status: GOOD (  11.25  )
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

This series adds support for the I2C controller found in the Nuvoton MA35D1 SoC.
The driver supports master/slave modes, bus recovery, and runtime power
management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  65 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  14 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 819 ++++++++++++++++++
 6 files changed, 977 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


