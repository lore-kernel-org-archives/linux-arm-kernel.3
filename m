Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A211C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hPNYOvoeyuyNbMmH40+o4vpJO4lwHxLJGrBhXaLvXKU=; b=1e794GZP0mmGQyAZhNQKBRQp6i
	WYB8b55hYeJIxNloVzgscmJhJyqIDoUOSFr7K0e9FJwHieXnOsZKRnVoEljVCkFqpDgNougCDz/oe
	hnD2Ip7kt4+0fRJ9DuqXPrHvCS9xuPc5M3jdRmiNwqnDaqU0bkT0oBPAS2GOyuD++q23FTG7EwkEO
	TQCzA8tj8LISB4ExuiUzRUI6Ol12iETOO9KlF9ojUYDH+HVA1m3mF9EGOYR8k2P9UgWlvZZKPcVWs
	HisedH2CnbL1kHol/3hdcz6lhDrRVJsLl/iz7AHvIO2PW8+J2E4q3wuY5y6EQuSMKMbw/NptM661I
	NvN6EhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddi-0000000Cjpg-2wNg;
	Wed, 22 Jul 2026 20:34:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddg-0000000Cjow-2wT7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:34:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso29290435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752438; x=1785357238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPNYOvoeyuyNbMmH40+o4vpJO4lwHxLJGrBhXaLvXKU=;
        b=Fi4EpBzmV/Ider3gH3OI0ZjZchttgRWr4OBGyHzpQUy26tWb1xMKObMCOd3EfQUICp
         EilznfNHMXcNts9Pg2SzbbycjwaCL8yNQjbYt4FtZIarL/26HmBH3JdBFQTC/s3yktTQ
         x407QSFZuG14zPBudvjiIKfnlUCybkRyZAm97t++amjVc53OOvELFBswWn7An3sglVSv
         Movtg3IwpruiROaRFjGTDHCUceKp3HrfDjd7UPhqBKBGugMoECxB7duGgUeoySKHL4+o
         QQiNTZ9Lv+pZtZLtIrZ0yMKj/0C9E0G8d32RiAinpAaAupMnxWJW8538Wh7TdsveSgUp
         7onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752438; x=1785357238;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPNYOvoeyuyNbMmH40+o4vpJO4lwHxLJGrBhXaLvXKU=;
        b=EfXZQFqbYqQFHbxSk8obOYMywo8iRvzorpVMcwcTfiXHC9YEpKspUTdtg1PJhOubcB
         D3iSsOa/HEQvva38PxdqZwQShITWYJo0mnMRFPwKmFkHTjR8yKliC+287i147uL2jdhs
         C8cMQizBtJRPilFsu0QUw7HSUEPRpWzTJf8n8z1eP0g+trWEdQO77jDxAmkrRVxyjETm
         LU9zZPcXR1Mrva1E9eDZ5VAuAwDLhw88cN9do10yepj5geA9xUQPfP4sYFbFTsdbalUf
         TAdS444IKvnQ6IsVaHdkvwhjEcoq19m9JyCujmrzwwdU8vWlKo9ARoO7dC0qVOCQkxVN
         SJyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXiXtB760gYncGRf2jqVTPsVxAodRE+UZ6JlgML2YFctEQ5OzP+H/3K3lX1WJL9DB6IvxQahkUkECj27pxvro/@lists.infradead.org
X-Gm-Message-State: AOJu0YzcGYpNO7bkg/dDoYlPMnQ3aw5J63F/fufL3sLFtSRoq90t0Cct
	/dgWLcw/C+UlOhj1+0RqVIIanYPxT1bXCuF6ZibNqvWrzW1jmqdkNUlc
X-Gm-Gg: AR+sD13ekY6UzvsiFLLEtOCPaOKGdmn5qUzS6sczNR4cSBhHewUlWfvQP+PSQot8MaK
	JkEsorLrUU50dahnAe6N/nfLxRTFaVWN+g6YM4meYcM69HyRutt/Q0KYxTESaoJEzYaRDOE3UwI
	ulBWDNxQr+qhA6Jx721ihxyV93umxgxDrhPSOy3p+kx2iuugi29dnlT5ThUDY74YLHizRLEfNtE
	XoJNNFjjBUuQmM2bcPqoMx9f97lJVBTmEz6cZh9PzVJD57fqHVVQLSE8d9+8wxWExkqgpiavrLj
	W5RYnQl7PGe5hC64BbBAygkTiWMpjuCsOHIfO9PA6UzdulhuBHcMDnvu+lE5eM66iWMe06KMSZV
	iFEARIatLzEDXEG1UsnijVjXodxy2rbIIQE/nixYYX0KngE65wohkpKkQQLG3PKb/IvOPtEOVhy
	b6UnzfonHrIOrxWqZElbrU9fLj
X-Received: by 2002:a05:600c:c4a2:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-49573ce96aemr2250455e9.26.1784752437615;
        Wed, 22 Jul 2026 13:33:57 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:57 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	FuginInsanE <FuginInsanE@googlemail.com>
Subject: [PATCH 0/3] thermal/drivers/sun8i: Add support for the Allwinner A80 thermal sensor
Date: Wed, 22 Jul 2026 22:33:38 +0200
Message-ID: <20260722203341.2917852-1-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133400_803263_BC328569 
X-CRM114-Status: GOOD (  16.57  )
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

From: FuginInsanE <FuginInsanE@googlemail.com>

This series adds support for the thermal sensor of the Allwinner A80
(sun9i), the last SoC of the family with an in-tree DT but no THS
support.

The A80 THS is an early relative of the A83T/H3-era sensor generation:
same register semantics, but the block, bus gate, module clock and
reset line are shared with the GPADC, the THS registers start at
offset 0x40, and there are four sensors (big cluster, DRAM, GPU,
little cluster).

Philipp Rossak posted a driver for this hardware back in 2018 as part
of a larger THS rework which never landed for the A80; Armbian has
been carrying his DT patches ever since. This series takes the
mainline sun8i_thermal driver as the base instead: patch 2 adds a
chip description derived from the vendor BSP (register init values,
protection thresholds and the temperature formula), and patch 3
revives Philipp's DT patch with a fixed interrupt number (SPI 115 as
in the vendor BSP - verified on hardware, the original SPI 31 never
fires) and critical trip points.

Two A80 particularities are worth calling out: the data-ready
interrupt fires at the conversion rate on this SoC, so it stays
disabled and the sensors are polled, with the interrupt line serving
the alarm/shutdown events only (as in the vendor BSP). And the A80
SID is not yet supported by the sunxi nvmem driver, so calibration
data is unavailable for now and the driver falls back to defaults,
which produce plausible values on real hardware.

Tested on a Cubietech Cubieboard4: all four zones report
load-reactive temperatures (idle ~40 degC, ~54 degC under sustained
full load) tracking the BSP formula across the range we could
provoke.

Philipp Rossak (1):
  ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

Sören Hantel (2):
  dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
  thermal/drivers/sun8i: Add support for the A80 THS

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  1 +
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi    | 68 ++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 93 ++++++++++++++++++-
 3 files changed, 161 insertions(+), 1 deletion(-)

-- 
2.43.0


