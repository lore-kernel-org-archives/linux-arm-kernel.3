Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D589C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RdG29z3muBgbn1ti43jq5C44NsXVWFLsxC+XrhFf+Wk=; b=uOAE5tYuIn7HTH
	3Mj0xCecj5dMavBisPHciCOjQ6aIxbZLhAPsHSQA9Y8Df3Kh9CtejGkMx6MI8fkKDFQ5MwLfmYh67
	bTmpM7T6Ra6EjeCs7D3ja5pPXEginf57MQqc0mXV38P4egL9/25t6NaBoNGrhXXuRQ2FnAaTVch2/
	O5KPE1sWWh7SSGuP3zyEbsenfUt46/xRPGyTpSY9zYu5U5WVLDXfZAH6L+Va8R/a5ofhEZ0xaq3MK
	37xTh6NP0MKdhpUb+AfPVXxQ+8gJ3BhhAkHSLRMXYOjRflROaAPOBu+DmSUXhlTBYUOvj96T2oVW2
	8rIXDhxcLojOULIsr2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFR-0000000C4Ws-19CB;
	Wed, 22 Jul 2026 14:48:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFO-0000000C4Vr-2LG3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:48:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-476a130c138so9134370f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731712; x=1785336512; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdG29z3muBgbn1ti43jq5C44NsXVWFLsxC+XrhFf+Wk=;
        b=lkx6iWD5mR1Q2lkl69GrLXbilr3dO7ZsYVqMimuJCajzXJF5uSQ2lVj2uNPbILpHrS
         VR+QKfiSjlxXKhsEg9LuKrHh3ZrRBNUGeiBZCHohmoCCSO4ZFQB2PdByZAAuo8RtXuog
         r/6nMh0aVtcE/hbxv5nA2dcAbTq3xvSTifDNyITvWO8aNHZ4wW2S/3JubdqPM/+sbI7X
         IusBl+O2e70vwqktsopWCjpfU6MxqlCO4LLX5ngTYt4UVoyjNGvJwJqKp4txmgWYpir1
         6UbLZinYh/OKc5t+G+X4qG133wOYC6IB0BZLhh9WhyWkRkk+T3PW0cTlzx0meGtGs6OU
         RuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731712; x=1785336512;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdG29z3muBgbn1ti43jq5C44NsXVWFLsxC+XrhFf+Wk=;
        b=KN9iYjrDAOtx6sgNzXZw8wENZ399MvGYQqks0FaLpgBrQoiovJiLSCgHVNZETRgOvY
         llHZ6x9NqzqZOod4XkKVMlQ79CjGtQCWXRuqIkN110H3OIlwzhOkyxpwV0HQsetvZSY1
         +F2VoHM6cIO2cNYf4eJZyJO5HpthZnTCFauYkiw45WacQQivnlnxNzDIXmjV0BbQTTzL
         xDRZ7a4XQ0e49B0DvljJ2jHL0DOyqm1FxT/roT+pZ/vqn25MKjKBjVK39GtP3GKaeHOX
         rBYS5ZK9k/1vy2dybjiVgZHEg3+IjMfQnRhxz3+/5/lmuS+VcRABnv41mlgYKUJjfXHY
         fyUw==
X-Forwarded-Encrypted: i=1; AHgh+Rpuh3BxfpVbDTzQV3507RG25DA+7rw47ggkJcjkobhnoVqBtetpMG5pFwumgkZtqFJG8dzsPWS+VA6+UWUt+nov@lists.infradead.org
X-Gm-Message-State: AOJu0YyD8dueH16HVVcggWZ3X7e4WMh6HOeFTlF9O34dpPOrXVRuo/4G
	i8NRcWt9/YBeyN4jT6lSrgczGK5DN85jZUC/e0z1jzwwFmUQi6tiBNq5b7NhNAttj6c=
X-Gm-Gg: AR+sD11+vu2DqGyyRmEEaquVBdWzBSQ9jK4E9r+oW3RgZ0OjKfZx/wFFAOZunq/MQda
	m0XCaQcZLSjtfyD7gAsnXmyj3/xyT4PiGS3Rxq5K//l3MICf709viw1XPwDrtKZPmZ0OZsj98ZU
	4kHT5IC2a2T1PXm9F8AULj8TDdakn/GdhQua7ziTPFnDhGt864k3sq+V9DUusgWwsAgieBwMSof
	OGr6ePwmmrEclRlT1/++4AYNw7YC4IIpIiEozPByeLut+nOblFo2rmhQs2tPnOcuf04DEwIDxiB
	GuO9OZFnrHz3QKceuczC02mHytDaa9oub/Uk4xmlFJ8kZTquy7aS76PE/07lTlAUlwGRot966Nd
	4GXypjT/2XXuggPxYVuNRq3yOpO4/JS4wgBdkQUfk7lLe1pUtKMNzefwY5k3FIcC8NJZgEpTizw
	An
X-Received: by 2002:a05:6000:2906:b0:47f:81c4:36b4 with SMTP id ffacd0b85a97d-47f81c43db1mr7895912f8f.14.1784731712418;
        Wed, 22 Jul 2026 07:48:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85bb5a46sm6832816f8f.9.2026.07.22.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v6 0/4] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed, 22 Jul 2026 16:48:18 +0200
Message-Id: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADLYYGoC/23OwWoDIRDG8VcJnmvQGXVsT32P0sOqYyK02eIGa
 Qj77nFziYQcv8HfH69i4Vp4ER+7q6jcylLmUx/ubSficTodWJbUtwAFVgM4ORGirOcoo9WOUta
 GHYv+/K9yLv/31Nd338eynOd6uZcbbNct4pSD90ekgVSSAoHWQN5k/xmmy08Jlfdx/hVbp+HDk
 oLBYrccwHqFZBK7F9aMdvh8M91mREXgU8CEL6wdrKbB2m7Rk4kR3BQyPdl1XW+XZPMrVwEAAA=
 =
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8daDhhVEFGopKhGWwC1vGtYJ397WHh0sBLBEojCbVe4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg3TTy8vMwTdudIsmQlovyW58N3OJzL7I1v8
 UWryP5lJQ2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYNwAKCRDm/A8cN/La
 hU2VEACYKNnHL5ua2TKNm+vwVHekwFmy4DFH/HShATeFS/g0+FECIlK01uaAzEO4LWMa0DW2Jqw
 UEm+AxOJxVV+opJLPuSrovebEixPKq29h+9L1fOQ1CrLVSLmoq8091ygFrKKhjyY5yZOAlqVivi
 0TG9+a9iMQu/s/OdEDioLC/CpLTHDYbnjCgEk8dQ6ubKV1ExVju5Nqz7JF4QFcQqQ95Sdz7PAYl
 upS9GRN6TroZiAPLFh93z2w96PUKx8Sg1UDVJMfdlnNACjAB4eOfcfA8vUOjjPnEcXpXrK7556E
 UjS+CLG8axHbNIDWP6IptyxUr+VrZ7axMeW+yqNLcJK5ypxWtyOyQpp6WOIR5buy2Z5ruAlA7tF
 37DS120CU5se6iBM34hRKBw3NrM/fWOtchJf15PFj1PP7A8lnSg9wSYtUOGNeEC2D8Y30SVSPtm
 8NsrDHgGsBqdpS7ekFna6iOTKzurRY/Gmtrtd1LJbLTllBO30ifFK6F/gYuCq/1wTiz6DIzeniu
 SGRnsZgyhx/P3bAOITldGRkBvUW+C11KyTmttxp5FohH6w9OtzvH5PepQjr4RWXzPBSUussCHz9
 j51ud3urFi7jzMJ0q84ZAixelWd32vpBmUhETZVw1YAFVzQtxjG1mdzh7nuKdZ8ttb0DAwT4U0y
 vRTaJh2l2G38ELw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074834_627863_DF158A6C 
X-CRM114-Status: GOOD (  14.43  )
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

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v6:
- Add .set_parent callback to the divider RO ops
- Link to v5: https://patch.msgid.link/20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com

Changes in v5:
- Droped already applied changes
- Fix determine rate mux helper calculation
- Changed clock split commit description
- Added a macro for the clock number without gates
- Link to v4: https://patch.msgid.link/20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (4):
      clk: sunxi-ng: mux: fix determine helper rate propagation
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate
      clk: sunxi-ng: sun6i-rtc: add a733 support

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 89 ++++++++++++++++++++++++++++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 +-
 drivers/clk/sunxi-ng/ccu_div.c       | 31 ++++++++++++-
 drivers/clk/sunxi-ng/ccu_div.h       |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c       | 59 ++++++++++++------------
 drivers/clk/sunxi-ng/ccu_mux.h       |  4 ++
 6 files changed, 146 insertions(+), 41 deletions(-)
---
base-commit: c52b5090bf1e3b88745f8a81f264f34100ecde42
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


