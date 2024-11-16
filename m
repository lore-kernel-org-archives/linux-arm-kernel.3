Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D56FD68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGohF+muowKkt4fdau+AubKELBZgZqyCJ8OaVgT7H9o=; b=eLYRctrO8YfqHVgaT5uVe+BV5P
	UCAnee1/LDfemUYQ9SJcVj7FehY5jg14TszGFVe0ZAYhUFS+3dxy2XFXY+Z+cMNXc+huL3wsuppfD
	m1SDOOysjV5VYXcciCWoQU/ZxhRmskCPOp3bo60azEFr0HmdEYZ0Sh7HA32jdPLmIiZYZFv6u6GFS
	uXkcItXJ/5jIHwCGVsUNEH+WM9pct8DtS3WWCHkTaya3Tmlqf9lVhLJrcqX85p89Ux/oPKJAWN2wp
	Tl45Cbn9l0S0zFOPFxFNxOSAwLhzzdxx7iowr5c6W4Stl5PakYXAFjPQi92tU0+JH6MTdvAgJu9GP
	yilWpVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCN9T-000000060iR-2al5;
	Sat, 16 Nov 2024 18:04:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCN8Y-000000060Ye-0mBJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 18:03:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa1e51ce601so137223966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Nov 2024 10:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731780188; x=1732384988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGohF+muowKkt4fdau+AubKELBZgZqyCJ8OaVgT7H9o=;
        b=C8DLJKW9gFkFEDxyCeDE5aak9UFGtYKvdzSJZD/BME7qGRxukfalOoFLdSgXhZuhw5
         g6Jhk+EkNUtEojEv0en0n9gX/aUS1rzTQDReBWBYL1FGfC3g9i3WFIiqfIyFnS4YWGte
         Qnt4GTHIFRhyNy5F92+Y1pdEhHtwOweHea15I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780188; x=1732384988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGohF+muowKkt4fdau+AubKELBZgZqyCJ8OaVgT7H9o=;
        b=NPhVbThj7aa8dpktNiYTfJu4DkfvNuO+uhBoBZRluoJTuoQZLGMYyKCUusZMRDvewB
         mC3m4V7ZQ7Lb/GOtkxZ1e9fCYg4+fjkpVVw9wzwJ05ze9E4AJvCTQAmbHMo6UQWbP5Xa
         Rma4bXI26RHv9mNZqjkoz6VzK0Z/aewyaOPaWFzpAsj+EqNczo1Kz/DkbLhZrdUW1KSg
         0oIp4uv7voBNfESYGobewoB0G/GZDIL/pAMEl1p3DSIVlbLJQD+3NnBo0a7ev4BaH9nY
         xHus1nAPe9QgNTBecNk0/3jTPWZw7Gw6+F+woDCNMDVatWesuvH4pWlz2EXABJulJpFX
         IYfw==
X-Forwarded-Encrypted: i=1; AJvYcCWfngpyUtLrvixQGuBwUaXsoFhouaGl1Jw+wHkjab/AQVEH+SfqOPmLtw2SXoyEp4o90CqIm9t5EymL6YOTENbN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Xbllx7c1mDWuthVb6D3/k+/0WxuHT8x/8cG6jRS/1n8V/Nq6
	KqLpd7c7n7n05Lj5ncYBnm+c4+9ojc+FtxewjAqOzUlnOYdLwi3QQG7lYfXw6dI=
X-Google-Smtp-Source: AGHT+IG2ObGwiCvfIl++zWd9qF2zaGLlhIycmyruL6/OHxRiEVmPAs5MlD90c/NhVLeiofEJ0atIOw==
X-Received: by 2002:a17:907:9413:b0:aa3:722c:cc8a with SMTP id a640c23a62f3a-aa483525d25mr654985366b.40.1731780186523;
        Sat, 16 Nov 2024 10:03:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dc6d364sm329549066b.0.2024.11.16.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 10:03:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dong Aisheng <b29396@freescale.com>,
	Eric Dumazet <edumazet@google.com>,
	Fengguang Wu <fengguang.wu@intel.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Sebastian Haas <haas@ems-wuensche.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Varka Bhadram <varkabhadram@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH 0/7] Fix {rx,tx}_errors CAN statistics
Date: Sat, 16 Nov 2024 19:02:29 +0100
Message-ID: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_100310_247255_F397FEF6 
X-CRM114-Status: UNSURE (   7.00  )
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

This series extends the patch 4d6d26537940 ("can: c_can: fix {rx,tx}_errors statistics"),
already merged into the mainline, to other CAN devices that similarly do
not correctly increment the error counters for reception/transmission.


Dario Binacchi (7):
  can: m_can: fix {rx,tx}_errors statistics
  can: ifi_canfd: fix {rx,tx}_errors statistics
  can: hi311x: fix {rx,tx}_errors statistics
  can: sja1000: fix {rx,tx}_errors statistics
  can: sun4i_can: fix {rx,tx}_errors statistics
  can: ems_usb: fix {rx,tx}_errors statistics
  can: f81604: fix {rx,tx}_errors statistics

 drivers/net/can/ifi_canfd/ifi_canfd.c | 29 +++++++++++++++++++--------
 drivers/net/can/m_can/m_can.c         |  7 ++++++-
 drivers/net/can/sja1000/sja1000.c     |  7 +++++--
 drivers/net/can/spi/hi311x.c          | 17 ++++++++++------
 drivers/net/can/sun4i_can.c           |  7 +++++--
 drivers/net/can/usb/ems_usb.c         |  7 +++++--
 drivers/net/can/usb/f81604.c          |  7 +++++--
 7 files changed, 58 insertions(+), 23 deletions(-)

-- 
2.43.0


