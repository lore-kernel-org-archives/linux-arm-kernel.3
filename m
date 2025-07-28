Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8869FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfBX2Dn6gQHlMzI4pjH3b2TDwu+3+H5wPtDXO245HqA=; b=lIUVEPNUOlj/2qfC2g3i9+Q1kH
	0u7hfV0RkcF/juOYlV5DWl5uMTAGR1iYnwv3NAwkPerfl01e7+BNXT8uhtvGtdDG1HkU2xnP/1fP7
	9q91CeYYuuTs0pSD1Oi75CgbuQ0P4to/oeyE67PPKkXTlWmkb8K9DR73XnzVpiaeAiz0TgT/y69q9
	ERZ/dJi/L4+iTtkV5Q8EoW58aM+CzZMHz2/EyjAxxMG49WunXMyFUe4PhjhXUVISkC0idK16q8W1p
	4kMyaxm+/f90NUrcC38bsEzY4Ck2XkLNJGn+DLdr61jk1JRLiuCQwjYohd4Lcmms8zAh91/8e97F/
	FFyRXUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGuT-0000000DiQP-1lEL;
	Mon, 28 Jul 2025 06:00:29 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqV-0000000DhKY-2Qjf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:24 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b3f7404710aso2587851a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682183; x=1754286983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfBX2Dn6gQHlMzI4pjH3b2TDwu+3+H5wPtDXO245HqA=;
        b=eDdsK5dzqdJn7ZoPxzWa/y4f6y1q4VOm+v3HBefzkmz5CkUNGlMqBBVBTdjSUQkl/l
         7JDScubcaG1+UpAB4yarJFReaHHncr5Zk0alMrkTzdjPdH0UHNFvIwtcc9jChIHr6jpp
         qkHbx0/q14joUJZK9VHLWy28SwIz2TS+WQHxAe2WD2bpG62P3VKN1mTiqSGV4soPD5/3
         ahu65OLouWDGxauUxmRjxAhDVlxXsWtpCMjJM00wOSQycBAkk4+1lVHrEnqnyF7Iuk4X
         aC4gqMqVxshXy0mAhoWWQWlf4H8Nqv6+zjOd8qWX9obIlcVtahNogn8cOjn5WVvupy8T
         Y7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682183; x=1754286983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfBX2Dn6gQHlMzI4pjH3b2TDwu+3+H5wPtDXO245HqA=;
        b=VNHIVDDcnTn4ziVmXfb1R7MA1EMjsh9kT8Y4iYjsrmssa/LwGWA/zoQGqP5zX+BdDK
         18ghhBf/1tdvJQbC98xbxFan4c79n2Zk1R73sMCh5ytkqcSfy7dfw14zIrpayFcCD/EV
         2FWggyaXVtd83H8nEOmZvD5lzJjvoWPU6vXW6Myhmg/xR2YbJQy6s6iB8KbeR0oTm95f
         PYipplT37we7dlTgnCAuVw9Sfg3J4WBSJKIgHJTteiadAiD/pTxv40zTXXBhnqkKXCKe
         rrHcmBbYWEtDHQ2q3SS+i6kb2PFEfpTrnrBaJppWObnOjqnr+/RJ3FxysUsED9u9vlkW
         0r+A==
X-Forwarded-Encrypted: i=1; AJvYcCUeBAhLDRQ7H9vsKf8gV5IrXjBKbuRjrtYESnwNSYk7EJoO8h7MxO0I377cd/gDsEQ9nGEe74rhy/xNq4VF/29R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3f2x1H0HBHmQ1OyejZ0nq1p/WtfCmFg87red0N5Dzd4n0SRj8
	o+s0YZC2U3otYNsjJFQvaRMRfzVccWnVIjMoGAS+mzDLoPe/oICrlVUw7K5Xdo4R
X-Gm-Gg: ASbGncsBQMGGQCpYCFpTzSONKS3KbCT8FVZfT+29sX5WgExyBEr2T1Q66MP+J+xCQ0E
	BumOMz4oeb6C7qgliPyc+hxDzIDxW7MwpeE1xgNQBaD7aR7+uBnqogf+/A1au9Y4hgrboTVxEEE
	lZTInv8HkCxUwSTCGpfcuuyzGUCn6J4rIQTlspkR4PkJ1wivVg2dtsA4OXvU+g4G4GT8PCcPrDQ
	NWOxe3mE5u0FovXib6f0MoZAn9LHw9G6uwerFSBrhqT5HFX6bPTfgXmpTRitKRWUkWg3+X00ALQ
	bIGJmhCPVEwBk/j8sLHb3q3TCmE4kc6l0Ctu4jWEOo7Re24P/BtmSBfUb7T2Yx1WVIpWmd2DK5f
	gqCx3wgZhcoJx2b0CyskOpTtw8LbwW1zjbaAUgQBnYcTymmylSE30HdFN3lKWHJ/kxc972zvUZF
	oYuIcmtivenA==
X-Google-Smtp-Source: AGHT+IEAtZDtFkeJNbSH5GWI9Ubuq7ax/Mj9S7hmCp9fOAX7SqKDyq386D0ys1EjsIruhFyyf9MRaw==
X-Received: by 2002:a17:902:ebca:b0:235:ea0d:ae23 with SMTP id d9443c01a7336-23fb304f9b5mr141625795ad.6.1753682182526;
        Sun, 27 Jul 2025 22:56:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:21 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 00/13] ARM: dts: aspeed: Add Meta Darwin dts
Date: Sun, 27 Jul 2025 22:56:02 -0700
Message-ID: <20250728055618.61616-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225623_622687_60B2385A 
X-CRM114-Status: GOOD (  11.93  )
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

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
ast2600-facebook-netbmc-common.dtsi.

Patch #4 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
each BMC platform because eMMC was removed from future Meta Network BMC
platforms.

Patch #5 introduces new BMC flash layout with 64MB data partition.

Patches #6, #7 and #8 add "wedge400-data64-bmc" board. "wedge400-bmc"
and "wedge400-data64-bmc" are identical except BMC flash layout.

Patches #9, #10 and #11 add "fuji-data64-bmc" board. "fuji-bmc" and
"fuji-data64-bmc" are identical except BMC flash layout.

Patches #12 and #13 add Meta Darwin BMC and updates devicetree
bindings.

Tao Ren (13):
  ARM: dts: aspeed: wedge400: Fix DTB warnings
  ARM: dts: aspeed: fuji: Fix DTB warnings
  ARM: dts: aspeed: Fix DTB warnings in
    ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
  dt-bindings: arm: aspeed: add Facebook Wedge400-data64 board
  ARM: dts: aspeed: Add Facebook Wedge400-data64 (AST2500) BMC
  ARM: dts: aspeed: wedge400: Include wedge400-data64.dts
  dt-bindings: arm: aspeed: add Facebook Fuji-data64 board
  ARM: dts: aspeed: Add Facebook Fuji-data64 (AST2600) Board
  ARM: dts: aspeed: facebook-fuji: Include facebook-fuji-data64.dts
  dt-bindings: arm: aspeed: add Facebook Darwin board
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    3 +
 arch/arm/boot/dts/aspeed/Makefile             |    3 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts |   72 +
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts |   12 +
 .../aspeed-bmc-facebook-fuji-data64.dts       | 1256 +++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 1245 +---------------
 .../aspeed-bmc-facebook-wedge400-data64.dts   |  375 +++++
 .../aspeed/aspeed-bmc-facebook-wedge400.dts   |  366 +----
 .../ast2600-facebook-netbmc-common.dtsi       |   22 +-
 .../facebook-bmc-flash-layout-128-data64.dtsi |   60 +
 10 files changed, 1795 insertions(+), 1619 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

-- 
2.47.3


