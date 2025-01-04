Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7C5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=; b=CnR1geX7tUbH6ujQluPRMRXpTv
	V//IcLgq+oq6unyC9Mn5I1tgTCYeFsEBU+CMsHkL7K/Lo3V24N9BC7ju5tCSpv/S9Lo4rAZEdRu0d
	sc2fJWcDeifR9FxT+LQSK0UWovyee1QtuZL+lH+wJHtQIk/X03P19p51Gx7zXv+vXDtqeOpot06hw
	qVed6accG4/hNO/3BgU5utER8De08PUZm1zmKFl888r2aojHaGZenJZmh7Cv4LHakLRXFR+idqok6
	+gnDVLL9m5XnYDsxHL0J2i2Zk5sjrG9GGuYQzPnjDXu07GLmALtf3NIcOWMyXsSYUih53esim8GDM
	5OYMwrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTynF-0000000EfDv-3sJn;
	Sat, 04 Jan 2025 07:41:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTym4-0000000Eey6-1UZQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 07:40:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2165cb60719so184018945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976443; x=1736581243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=j68285ieAv2WHap0Ph9cm7Vf3Cc+Cl7Dj3/rypQGnPOB6deyuOj6WwwnWE3kdcs0Sf
         DNi5dHDe4J+iWIHk/NvKl8MQ8hCqsqxs5pC5Pw4vZ3ThBV2QigDD4SHMk2a66Eda/Fl+
         QuLP/roAYumORsLO86QdyLL/JYa/zMfcvLFpyvXL2jYNXFkgeJvdZtTwnGPk40Zr6Zti
         gqf4bBpIdEgycqN+TNvU4GzkznzxXkIDdqpl4ksnDhT4CksHYJwXC2HtwTNvWlmf5lAB
         1NiQQeHa8SeBBe6EV5C5bkGYGTFs6+HPi7yN27tNKP0Mhvg4YGaMl4o7LSFA5HC9zb97
         y+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976443; x=1736581243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=WH35/EJfJ25SdK4L0u1PzuZvEDvHSWJc7RDlaFuL7POy23nt3T2ksQawd9L5hyxUYN
         Qfuiu4JxUbvJc5xW0j1Nw+HxnbvYT3MDJltZn9VynIUEdXZZZ6tvGPCPSRznCCIgWWpM
         wAN7ml8owJx526MGRY91iBwInC7XYBiKGMEdbACO45EEi7kiDrG/0nSUvU/pWcqjmX86
         IQUmDOBPaU9kMrkYoIJWseyILjvqMjzGB1SQnwRLhqYeCRT6hiPRlh68PvqClPGrSFFA
         nMVAaz+WlTv5C6IDTIbkvISrYfkKG7LueAzAGUivAcxcF0DTY92kWZ99KUnun0tfZSef
         MaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs0PiaUlEMFYYUircRUeQ4Uhewniv6lNtlOZFQf+FyNx/F08cBhyg8a53TKjo1VPpkrPezPRGCVq8iBt1Fe/Mb@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ1kBYkwWolPcHxCvL0XX5PzQr9lBBMdNDyYseYjevt1bGfqbS
	l+Jn89jDDvlzExvB6ACMBMMlQ/Vn41idNvaGgmbD32G3ODzv7Pp1
X-Gm-Gg: ASbGncuX2h3OMArS0SYZSTPBa8yzEUELrpMdDh6Es+yqsHeAUP5kLgKEhIKUin3+38u
	VSlE5HBCOcCpCaSx/Qqa8vrWW8XY+ZBw5VLjlzZr7uDetI7dmMhDlsBxTxU2yqIR7+0d4qtiXI4
	rrLkdffWmxQF5x6M42gEa7PzaIjXRullNYSe8KevPjUSHI2nBl0Gseo+i5PoyaZrQbz0dfMqH1C
	dyBKdlXHMCYT3+OJppqcSXUBF5ZTrKq3ERzRK6XXVFlkj/HZw==
X-Google-Smtp-Source: AGHT+IFLa1cMRqlQ9BB286TlpwABGnbwaJvMsE4Ob1+XZGsWNekaNd7fepzhC39fUKHuoMyTfGW+JA==
X-Received: by 2002:a17:902:c943:b0:216:6901:d588 with SMTP id d9443c01a7336-219e6e9d949mr797755625ad.15.1735976442692;
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 0/4] arm64: allwinner: a64: fix video output on Pinebook
Date: Fri,  3 Jan 2025 23:36:56 -0800
Message-ID: <20250104074035.1611136-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234044_415619_4256A071 
X-CRM114-Status: GOOD (  11.83  )
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

Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI
in TCON0 mux"), TCON0 clock parent is always set to PLL_MIPI, but
unfortunately it breaks video output on Pinebook.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock
parent, the video output stops working.

To fix the issue, I partially reverted mentioned commit and added explicit
TCON0 clock parent assignment to device tree. By default, it will be
PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
override it in their dts.

v2:
  - split device tree binding change into its own patch
  - add rationale into commit message and into comment in the code
  - gather the tags

Vasily Khoruzhick (4):
  dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
  clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 .../boot/dts/allwinner/sun50i-a64-pinebook.dts      |  2 ++
 .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi       |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c               | 13 ++++---------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h               |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h          |  2 ++
 6 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.47.1


