Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0581E6ADCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KotHSsdWfu+c1NcMh6OyQCxQ2KHZlyrz53b2aXYhfLc=; b=l1DSJHAMa64L06mFC6lUjNYuA6
	55WZkfHP95H7HxRSCYvlXrj2h21eMwle7XZPxKESImEnCQwuTQdR6+mYOh9QgFkjFIQaNaoyhGqVt
	hqJPyMPseQlNYvkAAGCfOsgnpTok/feYoKyzd6ipWcn+NQ/A+QVnO+ZWzR2N1ouXzyc7XQR7cgUCO
	n9Gy+IU+GQitwIXekmNh5FlAB07sJZCpGMj2WDQWbbS5ApvJPxcJoRCY60OJQIREDb6reRhk7uMJg
	xNX42n4NjCkeJBPH2xIQMxKBFeE0SYyzgwCopV6n69MFaoUMnad4lAaMaeOJwfB1KO/N0WlPJ5Kj0
	iQmuA1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbyO-00000003OgA-0w2v;
	Fri, 22 Nov 2024 22:17:56 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbxQ-00000003OSL-2wDL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:16:57 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso29025561fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313814; x=1732918614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KotHSsdWfu+c1NcMh6OyQCxQ2KHZlyrz53b2aXYhfLc=;
        b=Y6txnjFohX+2zYoyjsney1VQ0OxHrXUefK1rXVTagL8sb3zOPfLB3u+HqmKWqenD21
         kAYLfPrzrcwf1SoXdYfo+t3c8Y22dGvu+J0gwy1PldDuFpGO38W2N2E382lC+VhZWwWq
         UJmdkAm18qKIkpd2jKug1UqGBB+dXOMlAsTOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313814; x=1732918614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KotHSsdWfu+c1NcMh6OyQCxQ2KHZlyrz53b2aXYhfLc=;
        b=j5wdHT6nOl7Lk39Ryuqpa8sx662Jg2HbMVQJCBpTpxbwroA5yPTT6/E2zuMYdax0nZ
         IhPpQwC+ztSzwdEaIjFNGIl/EsTpoZ86n5Ax6FabypUR1knqkLKw2DJIhiu3IYKF+yop
         aRbP0sFQXkr2pAuczaNVxfg1i5HwpnCiXy9N8xbHR0FXbLsLVHTjR77Neg8RrcB96NHT
         RFEil1Fkyd4n0BFMywFe5h/Kq3y4vgQG80MurFOvAIlDWL4NnSfIyO+5FSPoo4RLGbhB
         b7Jx4+bgw91tE9wyrwVfDUznRJwvBV60gMc4XdbB5ng8qz3jq0uejYGMAOGhzriFQYsC
         9QUA==
X-Forwarded-Encrypted: i=1; AJvYcCVYNqnQT+1JWy58Dz+lZdEvEwgiDxlqtYKoqmKOoFeAn89d4NoBi0ZqtplOL3THddyN1fjZoF/nF4x4OOwDYzSv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb02dmWI48DPu3LOECVet5VlT8F+7CLvpxC9+KPmt9Wfsch+2l
	V1Rrof6TJhvsQIRj8tmUsMI0sjGRvmBrHoBSjp6SO97qLeZxGuqRy74+mDkGXR0=
X-Gm-Gg: ASbGncvsCn1CadjO9Vy8q2PNALAtzFbhWbqGTcpzgGO2n91sVwScGjqcE1myWoblmpb
	cfy8W3Myo8xRxKxH+i9/fnDZKbR/RUnB2g/S/hEWosO8IBzqh8mZlm9aHy2EL0K4XfFH8LVJUjP
	tEdknXXVhIzM1PHCy4pY3E9v90VrG97EytuDk4N35bMYriJz3v9YYyi4GZHIMkn2ZgRPhgewwOK
	x+S4DupSgR6dpJloxGPApioGWEWC4FOnzqV1IfHyZ9E8MmGMHHBjCU1yzy47g+l0nb4KmbXBqXr
	zqfLF4zRFbSqZ6sED2zZBmAqFMMGm4+QNwGWjTY593MLa1Le2LQeT4DaAkP46g5pLDGXlCXVHNj
	15rEGURQjbmJNi+ti
X-Google-Smtp-Source: AGHT+IEgYJNLEjwioZmh1uhCLI6hNlRYOYRL36bIZjSJEVburbMq8ZOQlpm6AI55EqEPC9fLmZ418w==
X-Received: by 2002:a05:651c:150e:b0:2ff:9269:ac1a with SMTP id 38308e7fff4ca-2ffa6d214bdmr30427781fa.0.1732313814248;
        Fri, 22 Nov 2024 14:16:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dong Aisheng <b29396@freescale.com>,
	Fengguang Wu <fengguang.wu@intel.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
	Samuel Holland <samuel@sholland.org>,
	Sebastian Haas <haas@ems-wuensche.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Varka Bhadram <varkabhadram@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 00/12] Fix {rx,tx}_errors CAN statistics
Date: Fri, 22 Nov 2024 23:15:41 +0100
Message-ID: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141656_788682_88980A68 
X-CRM114-Status: UNSURE (   9.68  )
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

Changes in v2:
- Fix patches 7 through 12 to ensure that statistics are updated even
  if the allocation of skb fails.
- Add five new patches (i. e. 1-5), created during the further analysis
  of the code while correcting patches from the v1 series (i. e. 7-12).

Dario Binacchi (12):
  can: c_can: update statistics if skb allocation fails
  can: sun4i_can: call can_change_state() even if cf is NULL
  can: sun4i_can: continue to use likely() to check skb
  can: hi311x: fix txerr and rxerr reporting
  can: hi311x: update state error statistics if skb allocation fails
  can: m_can: fix {rx,tx}_errors statistics
  can: ifi_canfd: fix {rx,tx}_errors statistics
  can: hi311x: fix {rx,tx}_errors statistics
  can: sja1000: fix {rx,tx}_errors statistics
  can: sun4i_can: fix {rx,tx}_errors statistics
  can: ems_usb: fix {rx,tx}_errors statistics
  can: f81604: fix {rx,tx}_errors statistics

 drivers/net/can/c_can/c_can_main.c    | 26 +++++++----
 drivers/net/can/ifi_canfd/ifi_canfd.c | 58 ++++++++++++++++-------
 drivers/net/can/m_can/m_can.c         | 33 +++++++++----
 drivers/net/can/sja1000/sja1000.c     | 67 ++++++++++++++++-----------
 drivers/net/can/spi/hi311x.c          | 55 +++++++++++++---------
 drivers/net/can/sun4i_can.c           | 21 +++++----
 drivers/net/can/usb/ems_usb.c         | 58 +++++++++++++----------
 drivers/net/can/usb/f81604.c          | 10 ++--
 8 files changed, 205 insertions(+), 123 deletions(-)

-- 
2.43.0


