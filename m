Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96544C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=; b=4I8pvgpLt976Cilh/IQEco6N/V
	8AF2MrngoIFRtx0DnzNGNYmGL7rzNmbmnORgC+QoJulJAz/G7zcq01AeXvbtDOz/Ke1EXuZw0cBVy
	3/6iNyLutQD+ddxl+S0T/SH8XbzmazIZWtLBTCriT5Fa316QTTUd2/M3EorWnmEg0SCJwuazWCRu0
	12Lodebh0GTY+PWrr0e4l35sYfu6hF+ddkzqw1aF51MRk3ABjZAQj1bzGeelp+z+dxqBF/GzWodyT
	cBLdZR6g6GOPsYSix+VI0tFmCAO/9PMe/5WlIr1Wn+S+/TGUSChfFgckhyXP81eRZkcDF3K35htlw
	J4Jm2bbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzT-00000007t8W-2MKi;
	Sun, 30 Aug 2026 16:02:39 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzQ-00000007t88-1MOH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 16:02:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1995162a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105754; x=1788710554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=qiWB5ZbprasuoiCTnFDBqsav0hT3ulaW2GllWIbrCv7K4p/iLQIwK9niUi7ACoZnqw
         D9QHbMO6hOjZRaZnLCMBfYi8cvvCknAFEVemFrHdLE5B3W63GM5jMnxdBTpU13Tavow7
         SM+iXuWKrrEqGsCBwp3t5FZ9KHmLXYYroLqepRC08u9ulaQxU6/esAlXJLxXgzJqZC6F
         P770SlI5F7Sakn02myUL49lHvvWEPpy8EA0NuBy9p04FC+n/NafGggj+cjHg3jbaqSkh
         rVBVPGHHo2YEoHCU8mhQ3rVNZguE9NZ/uzoWSmL330v56LvruaNiiv7cp1pTUuApljlg
         wNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105754; x=1788710554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=PQzgLLNKT37HqyT5bBXwsOSFhFBcsIDtLLMJZqt1IxCu2AG+pNG4wM48FDzr8bdgP4
         SiNTyWfMea5yIHbAWe+tyD/Tkt5RjTEUg21IpTDv3tOhMKVqkDdT2a3H8j7aGuSoDWnd
         SCZnyjI1kmJuIg2Al4MCR5qxiwaztMpBg9Oua9DFTp8jTRd2g6lIyqut+pWNDTVpIpnw
         SljZiZOIpt2lobgXZmzjciGcvE1hdTM5ogUZgCOrhSA9h2Bzdos8PqG1aeNK2gdhiMQ+
         z1Hw11a8MUK8xkI76og3FgGK7yomFf5ELH6hXIgZvqvEgdbPB+uCZ50pwdTcbK6Em/kU
         0H3A==
X-Forwarded-Encrypted: i=1; AHgh+RrvMIPbUPvhENBxjFJrqxnHto2/F0P0IhzTgKnFDwri53ClKuO2fzz+SMEuThM5ItXR1OPTioxpFQ1gLog/iEOB@lists.infradead.org
X-Gm-Message-State: AFuF++lTCGDIUakWp453Vb0DVWRKoZnw3WRegMnVM+c6N1avglSazz6H
	1O1Budco6knrApX43FY5IjCOesbMkyYhX2ibJZqmZtWojhvCA37KSsvM
X-Gm-Gg: AR+sD13J1mLnxPL53iYF8j9bSJZXlW3pfcFnBVlsN4GUxv/3WVRqXNLLe5QULd4HzuX
	ZO5LKkUfXmKYeXKRX+I3ike/M5RdOLj2hBSF4v5pjBr/qTy2yEAZRIYDzt6minwxBFi8A0MBeTs
	EnyQSbZJiD+yvdHK9X22Hj8N/ribDUltgN7v/CAfBoKbjEqpfFUAKkdKtY+ol5nK40Ks4/8lLAP
	RFejTLbQmW431vbY5+104J6j79GUsrkceyDf1vRsAneo5EqbUHIPvdqpp29bvXY9lkdcFRYMHmJ
	TKBKApfkpa9HBI5hdRkt7ysJHMssmxq2T8/edoO5Gs553m8ijGDM/E6QIva9AbYeN1ScYLwuzjp
	gmajrC4hZMZicJFy2XO9PyTJxOlcHd00RAmt5tIHJ3+d4JGrq0lncDDddVjPqoBaYjF47R2XYBQ
	MdIXAxIlA5mn6/BxtiBa9k0qbTRBJSqG65nQ5AwbxKniWw/YrqP/CI3c+d4k0U9ClIR5iFGjhz2
	QlwoJheuU0d8gZfYvFeMuE4U+f+/G83De2nLgyT7ttrKOHoVrQKFA==
X-Received: by 2002:a05:6a20:729b:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3d26615ece4mr29016741637.8.1788105754380;
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/5] fix and improve for Hi846
Date: Mon, 31 Aug 2026 00:00:20 +0800
Message-ID: <20260830160025.211384-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_090236_372986_92EBF5A9 
X-CRM114-Status: GOOD (  10.31  )
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

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
- Add link freq check in filter for v4l2_find_nearest_size_conditional().
- Link to v5: https://lore.kernel.org/linux-media/20260712115012.91600-1-mitltlatltl@gmail.com

Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: Fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: Fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 370 ++++++++++++++----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.55.0


