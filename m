Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FFEC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4iCdgU2Mi1ltlF6Zu07ake4LF21lMQp6/uBwdAs/1H8=; b=i5stKkgVHYYeVBvp2RVLslKJW3
	v+A9XKholez3dyl17Olaw+tfD6Ls6l5YEtIanv2CU85/swshvEfvta11N3YtlVU0G3wEGhz6FTxJe
	E7MSIqXhDuZSLex9Dg1UYF2j5UrDLiIOJVR3JFd1yeuDNMRO+bhcir/TxFZWnDlsTxmLP/BZXybz7
	LMFmHykxJ2sJ/yprGKvxy6R06NJej/wPZuMHYVSnMfgnhXAG9XDBZlRqt/BTSBQguFYtEgQiqEWxn
	7t/s59C4ZVJ12KWfCS+fvyCIbe0dBEl5ptqhbUHV02p6B+5WXu3FGeZ2JSS6316c4bg9y9SgldVsr
	ubdy3hQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHE-00000002ZZ8-2lJW;
	Fri, 17 Jul 2026 15:15:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHC-00000002ZXe-12lj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:14:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso11785963a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301296; x=1784906096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iCdgU2Mi1ltlF6Zu07ake4LF21lMQp6/uBwdAs/1H8=;
        b=IcRn2yI8EQSRTkJGcnI1Fnc6j1X2hE6MC6VJIxKqa6hB0TNVQnbR1n1M6nFqOFdc3m
         j0NedH63Jqm54noZzolQZkUokvQP15T5DrzmaePj3/OexDHzVUMvU5SVjJKAwwHvO3D5
         oDR2WB3syFejHa5msNsM6BhaGx2bqHlalF9+sE/oQN+wHY8mJa8GNVnx4e5SuPRwLwnh
         6D6TlgvZZxnJMYzy4bLLY4ZFT4c8NnraUWKADRTgfmx8DbP9C9/xtawdoaC+8kYFJdFD
         tufbYMRjog0vIe8ARA2C088Yu188LK2D0N//sui+jCQAiSfkxbr1fPeIt3Ukf9Cw8oSH
         WFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301296; x=1784906096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iCdgU2Mi1ltlF6Zu07ake4LF21lMQp6/uBwdAs/1H8=;
        b=TZowJ0SWr71EkZ2EPsYVO9tlFRAgS2CfRUPEeSgJGp97UfLX9yx7ZXxBH+Zm6Mkq7b
         bqp7v7nGSSjPhZdwViToM45Sfe2bQr7QJb2LuskfkmjpgwkxSeEzz7P41PUJZOP0/u30
         RbLsLOEckaKL/xka1jjNTeWbarMlg9Jj6dQBR+YFhcUpujVnAv0pkrYCoFvay+V11h8b
         RGbRXvf6eKyezns+F4T+UHi+7n6elLujMDB1BrNyQKc8ymvWKyDm5xMmJ7sKX5+XRt8H
         SPCD5IRl8p3gPGUXoFsONzjzlKvG3PV4h9HkVzsYLzci20gXI3524836YkZQ6yg+MhJO
         gYuw==
X-Forwarded-Encrypted: i=1; AHgh+RoLdN/ejls48hAnFQoIMOYnvd2FB5XePzGlk5C7l7TSVpnL5YE23HQNxKhl7gg5RQvBNAIKO0qve0txJE72TKw8@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAHZMffm/vSwYLrnXDEu4OK7i1VrYYdEwFNp15dDCN8DyNkCs
	62tlsY1GUbo3OiR4Jf6jSwTRb2KGXc1IGbT7TpSm1L0PVdVXSZLAziDg
X-Gm-Gg: AfdE7ck3VZvNwQKThoxLdnHxAg2BrLdyhlDcVW/DEndCwBjimc1pfwP2FQwgVgMxRgW
	Ky0OEo3XHyz7KcsEbL7hOcQKJd+Rpit73d0uotzSAmCvHs5YqfOy3gk88K2cwWnz6sH9K0kdWVn
	M9ND1Gkjri2iAcmNz9MCFRmJbkLBNauT7CeXeOuJKMwT2lIBz6LUfq0byq/TIUvmCTLmWDFbxac
	lXjOFTaNKAFRxwZTGnzgulaXb05Oj9GpIkwmYL6mfvtRdU0L7dl+ux408xYJWd3i2/ooY30eE+h
	SyfGC4A3mjysOAhqgutTpFsrFIWtA6HNaNhAo6RHYb9/sSDCqysOrEtP+Pm1OmU04UDfJob1ZYU
	Hp4iWZcWksHV83x1bf2u/UBx3oyM83tKghD63cXd9s/zAypheGgjpBU3iBpRhZD01Km/NWqFATQ
	==
X-Received: by 2002:a05:6402:4555:b0:698:6620:d988 with SMTP id 4fb4d7f45d1cf-69e6528189bmr963155a12.15.1784301295646;
        Fri, 17 Jul 2026 08:14:55 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:14:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] Properly describe mt8167 watchdog and mmsys resets
Date: Fri, 17 Jul 2026 17:11:07 +0200
Message-ID: <20260717151134.678839-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081458_304403_3AEA0D46 
X-CRM114-Status: GOOD (  14.89  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

In the first two patches we improve the description of the resets for
mt6589 with values obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 6th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add MT6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  7 +++
 drivers/soc/mediatek/mt8167-mmsys.h           | 40 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  3 ++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 7 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0


