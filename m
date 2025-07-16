Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732E1C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lKjVbstUaXUkfpWGZfi4yqhbObtoazSimLO3Mc4PdaA=; b=sj9AxwWX1BED6UMuiUHNHEX10K
	MDeugwquQXBFbOxfEbgX3qAsLKiRSFM4bhVzVgTpQZQDsLXY5E6g3aHhwkEKlCgXEpQV6MsVr8kTf
	TIcxXvqm67p1WVZpKcEm94g+zpL+fqUG/0YTEhqsMCJ03ib1/3QtKKvE6H17eYeGmJZnf169ImGcg
	ldTnpaxo+JF6ASZdotP57rBq6JF1oLUOA2V67JAUyQLxCerQDO0UzaTf8YZAhyYjagfpIQyx29Pyb
	Ib6pN11VjOTDVrTI3Gl/bdz/3fBSJgq78SOs2RtXhwhYCuRjQYDq+eglNEK8oH5dR9oMHvMMs/ZoC
	/Pw2UCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4PB-000000086ju-3N1W;
	Wed, 16 Jul 2025 15:50:49 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Mh-000000086Kg-1IFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 15:48:16 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so11824281a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680893; x=1753285693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKjVbstUaXUkfpWGZfi4yqhbObtoazSimLO3Mc4PdaA=;
        b=DLhcFqMVQPoB/xF1NQ6Gts8fBatOh12xBzvqiF/TVvSvXX2D7W5Rd/rpP6Dgtfhj1v
         pImHrzcBQdVdwWvgTkuh61SF9wb5UkGgyRcxBaewLaqkgKSVW9I84Ws0ZSWjaQn6Gpib
         t1dNGcpJX9tybK7uPAJcGMbbYDoClGto3784bnOyBoDEHoKlYYMjS0xaWDTJeGsKySQa
         Ahx8U2SN1qlY3RaWY33pHWT96ZREUAAJJzPlAKDwByuDri8xZKFGjHua94dHZE7QSMub
         Fd7UGv/bJy/PYz4qvwVHhONTKrFruzunIVJ5271bcQFzaGVCKAk4LmnmtXWWUfXLDD70
         ycTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680893; x=1753285693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKjVbstUaXUkfpWGZfi4yqhbObtoazSimLO3Mc4PdaA=;
        b=wgk/tffBIPXMpxdhvL/KYDnzfkYrN8eBhERA8Wo2FoSxGd802huTTGiF9MGzYMNB3c
         kcsW0zzbjW35IgOEFnzSd3rp3r50HsHwffdkT7fr7aVYYg284o2dAGoDdfMlFYxwNscU
         7M3vnv+GIuoq5ZSAI+SOJoSaM+LAJihMtUwuMb7Y+KAV/QsM/nEWgJG5jZ2IQ8oQGx1q
         ChvYXglHTolAo1wcbZZsEmrqAgNPU2wcQoa5NTBC9/+FOr7tHOd0bjvhX+nP0zIK5r+j
         MMWe9UBfeBKPyOOXUc5RUBJMFHo4zAXGoIFGP1MQsnGRydeCbEl0ea0xUw/T97N7DQey
         OfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtnmqAPohbw6+OLRp+Nl3YHhbJU26GnKrukqZV3vzkFDS06RSM9mF3ux6p5yadcz2NqzfRDVAFRww1R9d4jcG/@lists.infradead.org
X-Gm-Message-State: AOJu0YyzwbweX4aogp6sEKfQTh+1woWLjJhcYDITq6/RzIsN+14BMlgL
	IYrVanE4cJsnsdsfiCTjwa+cI+2mqgpQiFFv7/s4fgdJ9hJ0y6r6qT8H
X-Gm-Gg: ASbGnctHJcnkzXqJu5ufG8oV0Wex3rzSthScrq+/feExoEtIIA1Oq69Qn5Y/nuCJ+rR
	ACGPe9CNQ0tfznZgvUou2jLPvfz4L1WB99MxKMTveaHn4L+9uABEumIU/9/Kg+ByUVsbf3/mKlX
	Tjc+YwhU7JfIlBrwtpBc3oEl7dGGuebUHXmqIms0GF26OrizfZcop19gTl7hY/aKcjMNi7dcC+Y
	901837Vem12mkklyTKRIXbgS/OcfG/JK6ft9SLZ9obrzHKcBSpH8O2QZXKQ/9J6VCjZIOShsl0q
	7QOhOQ3hO0uSreVZdafwE7QWr+G6gTpoSGF+2gEJ8dRlX9NnOFr7Fi/VGXwYVTzUpkP7NIkZy/b
	YwYqbHh4ds8XXpzQ8ghMETh94ug==
X-Google-Smtp-Source: AGHT+IFex17gwksYmEfwRekLYMBaX4AofLHIu+ZY9di4Kvn6YVkKnhCVyoBbL95UX6lWR4Ue7UJ9Pg==
X-Received: by 2002:a17:907:d24:b0:ae2:9291:9226 with SMTP id a640c23a62f3a-ae9ce1e71b1mr337656766b.59.1752680892887;
        Wed, 16 Jul 2025 08:48:12 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:12 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Wed, 16 Jul 2025 17:48:03 +0200
Message-ID: <20250716154808.335138-1-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_084815_349220_53D417B3 
X-CRM114-Status: GOOD (  17.13  )
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

This patch series adds support for the Ultratronik i.MX8MP-based Ultra-MACH SBC.

The Ultra-MACH SBC is an industrial-grade single-board computer based on the NXP i.MX8M Plus SoC. This initial support includes:

- Updating the MAINTAINERS file to include the new board in the Ultratronik support section.
- Adding a compatible string entry for the board to `fsl.yaml` in device tree bindings.
- Introducing a new device tree source file `imx8mp-ultra-mach-sbc.dts` with basic hardware support.

This series is modeled after the support added for the STM32MP157C-based Ultra-FLY SBC and aims to follow the conventions used for other i.MX8MP boards in mainline..

Changes in v2:
  - Use `enum` with `const:` values in fsl.yaml to correctly represent multiple compatibles.
  - Updated SPI child node name to use the generic `nfc-transceiver` per DT naming conventions.
  - Renamed several peripheral nodes (`crypto@35`, `pmic@25`, etc.) to standard names.
  - Minor formatting cleanup and compliance fixes per review feedback.

Changes in v3:
- Added "ultratronik,imx8mp-ultra-mach-sbc" to the shared i.MX8MP enum block in `fsl.yaml` [1].
- Ensured the compatible entry is validated by the existing binding structure.
- Updated `imx8mp-ultra-mach-sbc.dts` to address review feedback from v2 [2], including:
  - Proper formatting and indentation fixes.
  - Cleaned up node ordering and property alignment.

Changes in v4:
  - Moved `status = "okay";` to the last property in the TPM node.
  - Fixed indentation of `cs-gpios` multi-line property in the ecspi2 node.
  - Removed an outdated comment.

Changes in v5:

  - Reordered and grouped pinctrl-names and pinctrl-0 at the top of nodes for consistency.
  - Removed redundant status = "okay"; from TPM and NFC nodes, as their parent nodes already enable them.
  - Inserted required newlines between properties and child nodes (e.g., in ports {} block).
  - Cleaned up minor formatting and property order issues in regulator and gpio-leds nodes.

No functional changes otherwise. Patch series is based on feedback from Frank Li, Krzysztof Kozlowski and Shawn Guo.

Thanks for the reviews!

Link to v2 DT binding discussion:
[1] https://lore.kernel.org/all/578ea477-c68c-4427-8013-550bf4f9c05b@kernel.org/#t

Link to v2 DTS review:
[2] https://lore.kernel.org/all/aEmh7VL7BHkXp5Fu@lizhi-Precision-Tower-5810/

The board is based on NXP's i.MX8MP SoC and includes eMMC, LPDDR4, USB-C, Ethernet, and HDMI.

Tested with:
- `make ARCH=arm64 dtbs_check` (passes)
- Boot tested on hardware

Best regards,  
Goran Rađenović


Goran Rađenović (3):
  MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
  dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
  arm64: dts: imx8mp: Add initial support for Ultratronik
    imx8mp-ultra-mach-sbc board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 907 ++++++++++++++++++
 4 files changed, 910 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0


