Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77891FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=; b=3fvsM97SRyXfKebp7aVg0BTPLF
	GwBruovOmqhz9NFvawtXWFgwfXQpbkPI9G9JcRa7Fl450ZOBB4M/irc4TlX1xVumIKWB2Ssfjot4K
	3uQ/9pPU0hdUolocKvmXfByv/BebS9oVGke/DNpigKgBiyTJjtAz3zuYJEm5vuPIVjYUchwG4ioZd
	jAa+wppulmlmog/eCZ64bYrULUoatEgdEMri0Cwl+j40mrONVNzHU/J5/0KqgxlwMOQ3QaGCOUIfF
	dd+UN6cXHOJDfRE87f7rSymsvcEuMrDJMuIxWkSxHlOWKUg9ApWqID8uAl+EkagI+pcx5webAeiUu
	FBYvdB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtu-0000000G71D-1qvn;
	Mon, 27 Apr 2026 03:44:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtr-0000000G6zU-1lts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b2429f98d0so56003235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261486; x=1777866286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=C5jWIzB4a4Hac985RQUP3GExZ1RkB1WX27umfK8PVvus6UWw4441O8p+sODsqS0FJu
         7J/UjOKOrajMPhogXa06lcMTbLyaPT6dwsGLC6Wkav4BJDwIO/BdaekHOl5De10AsbjT
         LCn9mF2snXgGDXG2jq7LxeR6AbaVykTFNePqcnZUS/K0UdO6qr6O2uAdazeIUxAeLIRe
         FnUMe+xwKag8H+ieUOIgpv0BwiRMGGA6h84t4zEOWlrGmBBT5ZeMOCdzAuIrK3lsoThl
         3vnA8uVPSVdou6smfxBlrQL4IjDLfNo+GIaCEU5r5ozkiwRiCVAasY49pdr9REKfKuQJ
         WTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261486; x=1777866286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=GGPqcBslxynf66JXEdV1PyHIupQgkla7g1/o0o33PzDz8O9oUr7776LEXBT3tQj0jD
         ueIM+KnIOV+6KA1Hhgq+ECNicAFW4ikcvV5Aer2YyevXu0Ask1m+w8Y2jzHoWfP2sb9/
         ou0fwLZendNRzSXgYUzYyy8jQHNxHre2E6VguRnzNX7Td4HrOcZoZJKiAIhNDKTmJic8
         P4iMZaz2n3sd264Pvru6AI/TnBEUKjG0rXKp0fqjUg/MqEKzs3YMUXYKji4CUTXRfEw7
         NZNMVrfhpLWQ86n33u2dqOqCoRL3x5zWt4ZUosHCdlWPUOw3qOGOZ2+8h9CFJXc2T64c
         7esA==
X-Forwarded-Encrypted: i=1; AFNElJ9F2usUN7RgQvZBG5/bPfngS+mnkgZcOlbheLvNvREihki2xpZK25qdDxuODBExO5M9R5Zjh2FbjMLvCp9hukXm@lists.infradead.org
X-Gm-Message-State: AOJu0YxdFzMitcN68bxVghfphCfpyRIFtL5UnzsJqxGAiBhCWW5iBMoK
	2tpa3RKXHVm1YzIpPpS5Vi2poNL63m+E6NFKp2RUr9SKMCZD6RF6WISF
X-Gm-Gg: AeBDieu/AdEXmmf2jr9l4Lc+N67V+eoXCJ1P5x+dKk0fckVpz0bPYde90Mqfe/+3/w7
	2b9rLVUUIDOQO1jfRLPfE90ujYXlVy50zpX7Ren7vk+NJaqaIM0cbnGkD6lhoh3xMjuIwK6ruIP
	ttqjQRG8EB1s5PphJtyVRxp/gZRwPUpp+0xCZ90FZpBC2OdXpdw7//FSaCTrsygbfJo3Ypss7Ox
	Oaz1OPIDcfrwdxmTzrNkaRr1Vt7lkLMJBeHOfnO50OUCiD1V+sKxdp9ZrAgrogkajvVameYgeKD
	lzjPwlHSyzT9SAk9Aur1MpMeVy4fqqU/vV6ytSgJ1t87xZEm43xj8JsdbCrPzAhReEttg2eKfDM
	IqnjNKP7ilu/8tpUbPB71aaHXpMy3i5Nk3en/mR1SAZDenfBQAsAgyIe5MCaWd4mJfJriS1UqCQ
	5Fwn83bMempBDmKZkW/ua8QXU76rD7Pa15G4lfEyKkRuAmxAP+n18Js/YSRMq9xcfYUUgv7sPYA
	BqAmADnh5NLPUwVITQR7ScM2g==
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr422778205ad.13.1777261485859;
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 0/3] wifi: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:24 -0700
Message-ID: <20260427034427.881389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204447_461924_B9C194A9 
X-CRM114-Status: UNSURE (   7.75  )
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

mediatek,mtd-eeprom predates nvmem which is used everywhere to grab
eeprom and mac-address data from MTD devices.

Transition the one place to nvmem and remove the binding to discourage
use.

Rosen Penev (3):
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
  dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
  wifi: mt76: remove mt76_get_of_data_from_mtd

 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 +---
 .../ralink/gardena_smart_gateway_mt7688.dts   | 17 +++-
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 5 files changed, 17 insertions(+), 111 deletions(-)

--
2.54.0


