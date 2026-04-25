Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A30FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EI1lP6Fl/fJugk9EU1kz7AMxap4YeYzlUoYzl4zXJxs=; b=T0GqszKRZRLmm3UTlsEWiF2ZJX
	uJqpejY+dHBZZJGP4eAEmPQShS38dBFGa0wLU4+8rRteCTcRWS1/WjoUSlK4CtKA10s7lHOLgy7Vi
	5zRu9uMHy4Z6ezZuj7ec2XswBgpxTRjo+Vag2YVL0X1ESsdflV+FSxhnSiKrK23wkYasRdFzY5YpD
	sdTzcx6y1bd+XwVfKjwliUeTJsXL5B58gw6LdEGiGVWTZfvw4jVwYW2Zr1lZ6JEC/ekUkQAz1y2DP
	5jDP+/q5zIM58PDpQxmtMPd9tYT8kK3aMrvJBfXuPFO9baCXtR5qmTTkgwxeLk0Ok8ggrmCAcZSSf
	eb9sA+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLG-0000000EHdE-34sY;
	Sat, 25 Apr 2026 09:30:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLE-0000000EHbe-1muN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:30:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso42288755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 02:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777109422; x=1777714222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EI1lP6Fl/fJugk9EU1kz7AMxap4YeYzlUoYzl4zXJxs=;
        b=TQCmU+PSRz5h97O65ZAHIBfmMFjYtzKhPtkqsnV/ArBWKQTk3tAjb1+wF8xwu17G2Q
         b18gGs9J0OkXT+adz6QW9zSMaEYn4r7AaE4ojYYBDeUMZWdGhiYdYf7hPhV/u4GdrMcc
         O1dMo+PDoxSSGumVYG1AV12wNBiAp+wU9uK0eK975EJAcyYaA1Yl2bL00Zi7vw2a3FDb
         +sA/ou4eTfQCkti2S7CEUax4mA2xKAUUHym3VBSf0OASILo9c7JSTwe7J2RRpBS4qm6K
         d397pVTnvLWcXC7wIuKjIdjiPQ1YmritKxZa6+W0tH7twHSV3Al3F+r3//e5o1Gd0E5D
         UYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777109422; x=1777714222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI1lP6Fl/fJugk9EU1kz7AMxap4YeYzlUoYzl4zXJxs=;
        b=m1h7ZARsnTXBoepArPYrBjx9F+/qGH1YtiZEpBeDSZwcYUXc0ri/CUdn3fgpCkq+M9
         Jxl/r/s28vvY+CJAYbi0Jg74Tpk0NunAgPQ/0gApFPT5dPbAm9DuM5CZye4ZREWww2vw
         2Bi4HDnlts8WvewOOXS+pPLVZD5qT+lBXzsR3o9bevFcG0B7LIiIH3hrsEvVdo5IIr7s
         dpKR7bx0ZAKq1yjMHUpAdSLVJB9MPa10DDHFQsagNXZ8XxqUyViuwXlAvKgVXe2Uk6y7
         FubNAVidMkWJoxj9ElG1FPZGZyHEAsk9IFgcKaH/fr/s4Ra5LMr5AhsXL0YehPDDxrZK
         +9WA==
X-Forwarded-Encrypted: i=1; AFNElJ++tfWdMWkCmypBiNUdu2p0ihORxbHhbxdw8+nc20T+5tYNeSZbl7iYnYDfV/kPOlAamMDzaVzMSecOhSB5PQLT@lists.infradead.org
X-Gm-Message-State: AOJu0YzokIobKiNrzDZScSrBX5z3QqcRx/yCmHrAgnn2IG9k+7wdKvqD
	sMUkzBibUhdtIsZvbAn8br+pijomjKC+WxC3ZrJrrnydhrYdgzaWpacj
X-Gm-Gg: AeBDievo8Auyn+OHtzLC/OMXAvjYJDCMamjFaRD5VniNbCZ7R64HJB9lKoZ8KFLIe5b
	x3s0ECF/QTmAEZXzl3rK1b01657sBoGVJNTmFjuhpg39f59CpOBU95O1js0lMzdu/P7ajwpF59B
	zFD6w87zeYLQvQnTnq/YbmHI/nExr6zh7h7ffDSEJ0KKEEvjdtA4FAKLHi6ZgpK0tsKjCR2ChUx
	bg8ISaDgiPumLFrqjp/ZWGPnr91o90nmXMw3pHlr+HLFIv1Jacw6P9vHvqGtubjt/WZvtFw/jjP
	uDM07BrCn/QgKNS9c0fGwl8p0Ff3js96xc9knVuZJXbRiFIHaNshwlXVQ+Je2G+s25adYsNLJgT
	pyPv4qrykw08DmlG597HUdTazvylM6wfMGMG8ZzlWYts47TY6zukPbWmKgnKBlNci19TGoBJRUD
	CitW598be1bQd1ixNTs9OF42PjMm5eU7t9W4rhVrnYP+Ofh3vI8DSLPYGVI8qVsZDrSxzUMxbs/
	JCugxe+Uns/o+I=
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr395829745e9.29.1777109422135;
        Sat, 25 Apr 2026 02:30:22 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm204422615e9.30.2026.04.25.02.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:30:21 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de
Cc: jon.lin@rock-chips.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 0/3] spi: rockchip: ISR fix and minor cleanups
Date: Sat, 25 Apr 2026 09:29:33 +0000
Message-Id: <20260425092936.2590132-1-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_023024_503544_4E88FB85 
X-CRM114-Status: GOOD (  10.08  )
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

Hi all,
 
This series fixes one real bug in the Rockchip SPI driver and tidies up
two unrelated cosmetic issues spotted while looking at the same area.
The patches are independent and could be applied in any order; they are
ordered here by decreasing severity.

John Madieu (3):
  spi: rockchip: Read ISR, not IMR, to detect cs-inactive IRQ
  spi: rockchip: Drop unused and broken CR0 macros
  spi: rockchip: Drop dead zero-check on fifo_len

 drivers/spi/spi-rockchip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.25.1


