Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E984C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=; b=k3DxMBAS//KJ8zGvhQET+37NOI
	EFfWBOmkMQSFuWPXOdOgfo57p7AWGRGlFxQGDnHzXlHL7pKZtVBt8H8mHUpT5U+IBgFhqphda7dln
	1Zo5cBfyoMnfG4TEMJX0SYkL9x/m3FDSQzn7skEElbWhGIIcxJ69BVkbnOG00KUc5fwef/9nX1sYX
	t4WWwT3A4xAC8d3LKboZGEQ6k80eVyJ9MwYW6ayCJtyHtQb7oGqmIrv8Ye0+xLMjXmu7Rkv0NGaRA
	8KA6CYssw0tgvNY+NY9jIz3BzG3wax7vI3KjIrRzjpxi9hy5nNq8WTPoXAiGm6OX3ozYY/ttJyWF8
	xYRn9TkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilO-0000000D2V2-3eve;
	Tue, 14 Jul 2026 19:25:54 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilM-0000000D2UA-1A5P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:25:54 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-44856d185bcso1166828fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057151; x=1784661951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=bc0RTU29TtWHfXaiSfgzDvf/QiecyVo6CFqb6dvBP+e9frqSWYnTaP77Cdn/M93dnW
         eJ7iVZgj//7+X8NNbDHxOERW+KBuNvLBTmBSC01Iou6wOmUcySbz3ZvbjLSfVQWn2+VZ
         zIMvSLXwIW1wJCi10nB0lQlYNpgP2C2UqnQTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057151; x=1784661951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=jOXvuzpJQD9+TSSmP+Dbgp9jlS510+E3j7Cqy8gSYJUqg0V2BUQLCZuX5AxieQgQK0
         OtI7OHHkmPrBmv4UDr8TnLXsjcBgR341pKjm5Xg5d8NK0VOw0qWtEaW7r/28zMGHHqAa
         2eeEFFoyIGIg/GY+rPGJ+84brGN5GZCT6lZEHqKSgcy5cbyt6qmmAB4/qabUAM+XxNYs
         ulvanu4wfaVrbxi/lLUllxabCO/aFnMThrEPc7Dli6t3yejwxf/jl6yOV1erIHLMflHU
         ZmLQfzurArYf/Je9TVTBcXSBSDP29q4PxItFOI32QUHJitN/R3XOwkvhp2+rpR7gFGAk
         MPCA==
X-Forwarded-Encrypted: i=1; AFNElJ9cfbaiAt5GVito/1nOjrWYv9eVFRXbq0DbLNwOQYRnwdDd3O6gOCaRH7CAop7W79PVZBDYMZLsyHkjD52rq11y@lists.infradead.org
X-Gm-Message-State: AOJu0YxvvUiJxWtW+lwGj3QkNSDwVdnjgZaEuVggbo48rACTxXTN/XWA
	KF/wd0D9/qgIIxyO68U6QnRjrjdEm4PFWszwZowZzLkpDs1tQUURW8Z+BDzC955izQ==
X-Gm-Gg: AfdE7cmZsEEYLO5tMyKNucnkszJT50JmU9LddWCbf1/CsJKCGgNMOUX4k7UWoMAYKJ2
	DkDUl1EJw2+chxGI45vPubkV/9CGI8mWOx5cRF/aVdrWwVLT0QHqS4k6jQ10QjYbU8ubTsN0poA
	UChJOn17fiY7UtZrd+212u7YWSGX2KlPG6Ycw3zfDbBL0jvRaaux9a/R9lxRru3jyYMqY7HsNmS
	CjQCfeF81QdCScwMZkiOwUMEP/3Gjvhqi/zhq9wJ6hz96zB9dBiiOGv6qUaNwCW6B1HWrgkmRem
	PCm6Vp6YchSoHMYv4rmS+6vGwMBjdHuVlB/q1k4+lr3gnScVkxbP3DX87kqQixUyPZONQtArWvb
	iDcCiAo05RtTdbdRXLuSsq5LdDEaynoelSUrgBr5RaoNwh5NUnF/b0UOTLHGP6uVRJOV/l/Ksx5
	VQbkEpUN4=
X-Received: by 2002:a05:6870:1793:b0:417:4888:328b with SMTP id 586e51a60fabf-451f13ced10mr7772617fac.20.1784057150898;
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: Add support for the Rockchip RV1106
Date: Tue, 14 Jul 2026 13:25:28 -0600
Message-ID: <20260714192535.2082729-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122552_320787_A472C0C0 
X-CRM114-Status: GOOD (  13.20  )
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

This series adds pinctrl support for the Rockchip RV1106 and its
RV1103 package variant, split out from the initial RV1106 enablement
series [1] following feedback to submit per subsystem.

On this SoC each GPIO bank has a dedicated IO control (IOC) register
block, unlike earlier Rockchip designs where the registers of all
banks share a GRF region. Following Jonas's review of v1, each bank
node now references the syscon for its own IOC block through a
rockchip,grf phandle and the driver uses a separate regmap per bank,
so no regmap crosses a block boundary.

This v2 is tested on a Luckfox Pico Mini B (RV1103): pinctrl and the
four GPIO banks probe, and the sdmmc pinctrl state is applied through
the per-bank IOC regmaps, with the SD card working.

The corresponding devicetree changes are part of the main RV1106
series, which goes through the Rockchip tree.

[1] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1122658

Changes in v2:
- Add new patch for the per-bank IOC reference
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

Simon Glass (3):
  dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   7 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 168 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   4 +
 4 files changed, 180 insertions(+)

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106b2

-- 
2.43.0


