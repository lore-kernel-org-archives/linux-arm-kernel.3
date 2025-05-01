Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADD9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=; b=BpLXY/8EPO5iNH/sU5JQWIgFlK
	/fksF1JQ3QdvDbP2n8SFIx21LgrQUDjA38SY+7GCfKsk5m1QjMl3408tAUtuNXKdHF4h0qA+DVzBE
	e5Ew2clJ0Q13m77qHIFal3DNrJL9JozyoNVDUaoXLwXpbsE/JvS0WvlUsjm8FCG9tzNvo1B6Um50h
	GCKz+JNofosUL/gi2Jgymkm0LcEBp8+E7XvYXGCzS5tevRXeHlclLKVD6/XcPG5/txpSIviSa33bK
	dI+Vv87H+AzS25UTJ01yAoVR8Qf1le/zVsPcdYtEG0mqh2k3kbFOW5xZTZ/kfZS5IqMgHIKRr8vfG
	RYUND1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARIf-0000000FCrD-3aMQ;
	Thu, 01 May 2025 10:37:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARGg-0000000FCcX-2Toc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:35:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39d94327297so16769f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095748; x=1746700548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=J1gk0Cwjvn0vqYRin6zMeMwxWbLAip4e5BSAwJkO7hY62CdvUuHzNGn5OAeFniTy/+
         RQF/MW8hzxiQ138edjaqC9MC2qHXwfdl0ogQ1jINwxL8UT+VhmwFxWaJSoOtTKwd1wm/
         ei24UbfveALs2fPBGf8fHSLDhxSRQo+Emd/L6pxrCc/5Q9syxj1aUEryVUk3qHOuqTBF
         ulJSdsg12fyKFYaMeyVyKRrE524soRzHPz/II8P/Gc9KbLvXkSoTE4y1pnMmRdkQewoD
         cvh3IJ+6pEKyADCCwDzplJTzSwT1wxkqtRfgAxC1YssAKBZvejdm1cfUn+XS07pBz6uG
         m2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095748; x=1746700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=bPIr+Bg8uNtUdjddKIwOZw8/3PikgR7lZhAouBNG0bSffAc80eKi6ViVNqsxv5tzQM
         a/WckA0chufJ5hLvYQRXqUfrGz0K3kCluFi9vIp59F6Fmd7fJhrgWpvQu/BuKbD4ghe+
         k/xUO0FlpNvlqKhnCLc4Sls6r3y7QnyXXifncNJa4031dKr6YDH6Kc3829c3NsFTQjaf
         6hiVrrjHUnT9sQsruEpLBItxW5swz+uYv+oBLfn7KK3yBaCYHN3XNRAhalB494PMmIvt
         iWdNK3/4TzVmMFPk5qZFB+XKPHwAF36BhgPlHt7xka3/WTp8Lap9iWRNTty1/Gxx9bze
         SzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrGTpbMp4XD7ItIX2UNIvv6qFcdYtZHIx3cryfTLaE+4AibMFpuP8N0VzI2/ebh9O2XOgW5IhmOgHtUIba7kSl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf3GaVheovcSOvnJt0fHoJFpHP0aVD6wJnimZZ9i3HDmxBseYz
	+Nlfs+7iX7qO1Dw2PwsnZePo6RLegu65SVYufqxk6diMfXnmArMlfj1uWOCK+4A=
X-Gm-Gg: ASbGncvSL0JaCZMZ/EM2JrkTd9moEPNQZLUKN33p5rgSPONmOmhaQcLcsiAP8T0bC6g
	dIDR4OMjMGFj2DR56qbWETKBFJYFk9lCzTCL8SXUeD7b8L9u43gVyl4ohmAaj34L6iFDcUJZ9e9
	uGPL3WbX5jMfI/xUf7iSJX+eplKTp7VEpFIq3LxvBCjumSYbgv26XpHG+PH4vAiRsTSNiyBpEh0
	q1HbZ4X7PkL+O+izWLOud5uMOqGZiASv+952Wkb0PRRJ48aP+4Lh8MuoCTbVC/73/WyPR09U6/x
	mabQ9PPLAg/rqWeSPUzVRaVTxBIhLOx4insd5/8ShXVigaEJYg==
X-Google-Smtp-Source: AGHT+IHpYbP0/kmTUa86knuxCp0uPFuqoZHphNnA+x+8xxOAP7htntUULz8OHSqI0KW/OuRv2E6e8g==
X-Received: by 2002:a5d:59ab:0:b0:3a0:7119:cefa with SMTP id ffacd0b85a97d-3a0900a0a99mr1574177f8f.16.1746095748358;
        Thu, 01 May 2025 03:35:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88218sm486646f8f.78.2025.05.01.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:35:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers for v6.16
Date: Thu,  1 May 2025 12:35:41 +0200
Message-ID: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=vNYmWvhVJQY/AqblF9NK9uhqlpRYbUIbtdpo5XR+1to=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE059ULjeHoIezM1OAEcRIkI9/eVyLkGHFQs+g
 7rpEZaMWx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBNOfQAKCRDBN2bmhouD
 12nUD/9GGensklaBc7M71nRyVAyLRtoLji6ft/Ict9H+mJZDnuu0b8HD7g+Bd8cQXxq/QEfpTpU
 3eZ2eHhGVRZjLwvIl29slEjPUmSCfJt0/FwGAvs4CS0S4J4Cz/NiemKpg/4e8Eew6EF40LceTHj
 4nZkclCbJ9W5znA6QdShYnsvijNEOLhZQsCNNSEQqIfXdzpnozs/QhftGoV9hT4tAqLSVU2f6Hn
 jmsyfqT4JENOwsmtDN8j9YQYOrs3vGAKzcOcUDfiFbQ8DDWfVE7F1LRzzUR7XfQ/JoplAGqJv5w
 98STFW/3tbErQKmmTxGmJRd7k5b5s81O8DH2VR+kFZ41Iaz7bH5ui2cPJ3ollez7MA8bbP3yZT1
 sZR7s6lOYvLV4sNQ/1v0+JoMkc9F4S2fl3NO3Bm65SW2K9Nu7QGVotAkKCYTLasz0ifE8Rady64
 oPew0HeOVHkHLteSdmusZZmR/o+dlbVXsmqIFZ93b6xs/cb03KGr1uRj8YiVf4swVqTa4zpG/a8
 oNbXpNyOht6RernZ4dKaL93ynESVArjwMoLvKetKMbM7DOXbqThhhUDSABqUfRc4LpEZzAk90FW
 M9IRpcYQOZn2KX/e38M8x0F9wQBL0fY6A9Bk93WsBf7nV/8QLoAgsFBey9UQvZl6Kn7GIBFNNFh fsgUW3E/TP11+PA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_033550_639930_8CC063BD 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Lee,
That's the stable tag for you to base MFD patches on top.


Hi Arnd,
Please pull it as regular drivers pull. Note this will be also shared with MFD
tree.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16

for you to fetch changes up to 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16

Several improvements to Exynos ACPM (Alive Clock and Power Manager)
driver:
1. Handle communication timeous better.
2. Avoid sleeping, so users (PMIC) can still transfer during system
   shutdown.
3. Fix reading longer messages from them firmware.
4. Deferred probe improvements.
5. Model the user of ACPM - PMIC - a as child device and export
   devm_acpm_get_by_node() for such use case.

----------------------------------------------------------------
André Draszik (6):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

Krzysztof Kozlowski (1):
      firmware: exynos-acpm: Correct kerneldoc and use typical np argument name

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 +++++++++++++
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 16 +++---
 drivers/firmware/samsung/exynos-acpm.c             | 58 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++-
 4 files changed, 70 insertions(+), 45 deletions(-)

