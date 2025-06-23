Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DF2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=; b=SnXAkZyUlYnMfFP9go2g+Yu9Vw
	Fda7zo5Yak8XptdIq4nq5wBvDVhkAcX07fZHdehgMqgIOJnN/oFs/4rsTk8pjn4A1VwYVJuYO1m0/
	jKvMag2J2m/moKzgWBB6elOh6jlQ5nJ95srY6cROCEuaXW7idLiExJJn9BSxHvk351zj0y8pys5p/
	G8lrsdyDogiFxUw58Z7SgDFKJ4dclh+p7Ww9F8bGI6F7lb7ZGKvNNIHoAVji0N1/pauV2BeaEUDqC
	2z7/TW3MdRJjWrwunONVdDA1/2BImBDvIiPBYUjpRX+4zfsifsjAcuRzyQb4Y75kJXWf1WPr1Cb2G
	vk35PiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZP-00000004FI0-0IlD;
	Tue, 24 Jun 2025 00:31:27 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlPg-00000003cgg-3nDw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:57:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so7033421a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701419; x=1751306219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=fHkTYT9L2hFSFxVPNbkoWYzfQfYk0K52F6DUWjWIwNXnEA26NgCMz8nn0UsVdjzS9o
         nkoo4q8E0AiCZcmoiKpLf1WfMNSOF9tdDiLs5/GBysH68KbmogZTNyUCtjlIF03ibNdc
         9YXqYGxZ7PGHcZWT0cqvOMcuUSo+qGQysQ3veZJaAfFcCWRYZFHJenOaf6zqWA4y/krB
         3xjJ4m5mnA+sqwXazEk54rKwtoIoaeEdFE/I4fhxwJ/oeGItvRa1al3z3u3zJ54hgNcB
         FaTN+EvWbfspmXnfeJMCoBB7NGlf5Ks9+dYmmioPBccQ4B8l6zq9Egs28xjKWAaOZGra
         rzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701419; x=1751306219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=Jpn8g30NbN2Gd+MfE5AuO7b7l9Ud4JRqQjqGS3qL00l02I2QMgDyqk0E4zypZCsLoJ
         THwqQoiqr4KHR9nPbyqXSZZ43PPsiL0Z3HpLtU5EJn9UjWfAkbgBTVFhIuCKcWvlFtRc
         OBj11/KmditepdJs2ovukUdZgMerhbyzbe1lY/9jBW+vfwyQ5HgIu8mKUF5syOSErKtr
         C4XqMxtucJc1uDoFZfCXvXn5D0vOzyUE/5/FwShf/Od0E/otB7/vF5HLR3lQOdkj4eAl
         V9SITTm947x4zzZqE5yQA+kiTZvL6dBE/3m+7s3IOOEx6XJfqp9kgoAo+ZzY/8pRkBjb
         Ittg==
X-Forwarded-Encrypted: i=1; AJvYcCX4tRT0/lrgaUv5GR779//p/bRTrE+iNDKRNQz7RhkoADDJ82v+R/pXnqxZJ+NdUbW5dm3d5KLVHW6VTcJ2fjct@lists.infradead.org
X-Gm-Message-State: AOJu0YzwfnrNeF4Og2BPeYtv0XPZJhC6mT7x+kfJfR1X4iBlGDtWQh+0
	Kb9MGGUvZ5jLjGryJAfIPnvMIkS94nDWOWpsD1Tuee2vQQNfg1HrgVRc
X-Gm-Gg: ASbGncsbdcn93LOXDgeDkR73j3fu/WY1I0nThcpJQXpOU1uT3PAwTlB0uaetnN/ttuK
	DcIzQcnzmED859AXZQf11JlTMVa89sNLxXtol4Hb0ZjENJkTroHT2Kb7puWuAYUpbD9mpydASbr
	UzG0Ant8+1L1V7Rla9cu/b8HPTHjpoFWBdYZW+V2lvw0f5iuTay6GXCpZx+aKtzBfcBCYlnNqyN
	q+gT9/QD+8PSPM5hMpAM9CPCqnzm5JfdfGL2ImLBtcn5T9ft1ikd9SYE7+S1OFCZhYIvCBgf+Gq
	ZhuKWkqplymbp1w9t9XS+AV+g3qYmRmV2tficGKw/22WAZfrH6yB0BY3mvC5aX/i2w==
X-Google-Smtp-Source: AGHT+IFHYGJzGKcHxHbMeasOLjpLtoHx3VNYxm2w5V3zB7PXBaWircwkfG+MxrjaKvR+fMF9gFZEZw==
X-Received: by 2002:a05:6402:350f:b0:607:f082:583a with SMTP id 4fb4d7f45d1cf-60a1d187fa0mr11731886a12.27.1750701418968;
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
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
Subject: [PATCH v4 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:49 +0200
Message-ID: <20250623175654.844281-1-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_105700_943014_ED3B3244 
X-CRM114-Status: GOOD (  16.24  )
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

No functional changes otherwise. Patch series is based on feedback from Frank Li and Krzysztof Kozlowski.

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
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 908 ++++++++++++++++++
 4 files changed, 911 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.43.0


