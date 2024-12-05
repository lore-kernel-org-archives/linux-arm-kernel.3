Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B868E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKLV+ZZ6L5RhiT3EAHJqznTL9zji3yYsZpCcDpbwg+Y=; b=uEq6OSfC2I9uIaF+A38sQ991yR
	OF9Y9JpZ9/eccWiIWD7uIKrqM0u8gc0hX3bXRbbeTL5+DcCnTD7GnkkWdU4iqpJM2bjZo6CiHduWc
	UUsanxnP8JpGlBTAJSbRsBg4deCfxSRVw+8k5OvDbQH+FqV9XR4mr2yJJ2OlFeYNxgPauuSzCgvoT
	7nQQFb9/zbdvQ/JQBmhTuujdzZJ2P92mDuhrVdIxLqgdOClWfdX5C7gTXmVOFcgbkbh7wQtoJTRJ7
	BUnwy4k5RGcBLctwAc0M17AuS7jIDfWp+ZG+c4GGkEnxfgDlA7eozVtnVcho9+blFOEIiRNvE/uDG
	N6Y/tmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG3y-0000000H1sa-0qqU;
	Thu, 05 Dec 2024 17:54:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG2w-0000000H1a4-2Xvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:53:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a1639637so12992945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421228; x=1734026028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKLV+ZZ6L5RhiT3EAHJqznTL9zji3yYsZpCcDpbwg+Y=;
        b=htQt149/mgttho6hgyuazazKL1mp4LD4EJmIX3WA47MpuINuTTBhhuwDjHw+yJrdhS
         +KLeHc6Tb7pgkYCkyehzGGBKJkOSVs//QxRP1musymKd4bD0nEYCor0/othkOHEA8NML
         EBjq8nCbqrKm5kbrfXBnLe7U8jH0zSpEqlWRsYm6T4cPSi2m4LytZFoOVdPDfnd+DSi+
         SPqmjF7AYZ4F9D7j42ZM/Oy7fDd4IusS7keWAa8a9U+aInTZQcR1PklhHEE2+u6CaIR2
         XYFPFdhMJw/OK8+CSWFEsdaUVuo4OzOpb2JYuKYIg/MUitlY8X88gvRUz7wUDQBMD6r7
         PQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421228; x=1734026028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKLV+ZZ6L5RhiT3EAHJqznTL9zji3yYsZpCcDpbwg+Y=;
        b=pXsYOD8ra80nH1kdOyn/hQbFet8yr9jjXpMIWTtoiA+HeDbnIlG8xSz1pVoJQIWVuj
         CRFRm4j5ZcuEnrlVOvY0LCCzU7dsaI1ZOjuru3IpJuXSkIY7oWFQYxXvXP67PQdGuNcy
         020r9HFeDsQehx62IhqJh50Q9/FMn1iYOycpuoxLzPPC24AYdD86qH4872XAHtGItkHh
         ZcNdIFgF2wTY1m7caPXbV4/6m/oBJlC61vNy/yM9IaCMbmYtSs58NJw2nTUyleHQbIoa
         qs7bwveB1vB8y0gfR8M3sOM7moq8KYePlhhV5iQ3qfIQw3BXlQQvdA6DcJtEw8JkISC2
         rlsA==
X-Forwarded-Encrypted: i=1; AJvYcCVB/4TY8eggAPSUg1NRv50adHiVJGh+F7N6eyuL/FE3mhCKvxfK0p7J6tICFndEJk6EYF4ZwZfJEcGR2bGJAsie@lists.infradead.org
X-Gm-Message-State: AOJu0YwJqaRUrekXdL8zplEcQTqY5jiURgGm56GUWntcUbVCV+yLkvnu
	YjNe+qMt94yDCUE6QraUN+UDIMVsSKtbS39OpWAsZiCHjKLOeNCT0caYeM//33o=
X-Gm-Gg: ASbGncsbgg2yVPNxDc0fUgeRQYrLJ8ZR1qXbmSLB9P1cOkghJqarXXkGMmWtKI54VSg
	ja3SAMQIFoQEFfyCSzXk6tsyK9KzmalVA9ZBu1A2+1Nqk0JgxNTQa2ZBAopQP0FrQ6Lw5JnkzST
	sGS3WQhAQIKBXTO9u3hyv5l3zHp6GdJP4a+wW4QFU0iDzsIO8JZGWPY2YBYGO1+eNb+lVKsRF15
	7GEjo+Lh1W8WYG3ht/Krt4t3twmH/uFEuYxJ/ufHWqG9V/1qazuuE77FMn8YXE7MaxslFpwYd2i
	wmPGo8A20JUThlyJSkJDBcoDW9XJYRzt
X-Google-Smtp-Source: AGHT+IHYi5ufJF54E0WyoeAp8hOns/BOtH+3X4gKSwUdN9VlL8YVCCF+k0/XEjzO2xfKiytFgL5nWA==
X-Received: by 2002:a05:600c:35d5:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-434dded6649mr1525615e9.25.1733421228429;
        Thu, 05 Dec 2024 09:53:48 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] firmware: add exynos ACPM protocol driver
Date: Thu,  5 Dec 2024 17:53:42 +0000
Message-ID: <20241205175345.201595-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_095350_643649_EBCD095A 
X-CRM114-Status: GOOD (  12.76  )
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

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

This protocol library provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

I mark this as v3 because it is a continuation of:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

The samsung exynos mailbox controller driver, the transport layer for
ACPM, can be found at:
https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments 
- add ACPM PMIC protocol helpers

Cheers,
ta

Tudor Ambarus (3):
  dt-bindings: firmware: add samsung,exynos-acpm-ipc bindings
  firmware: add exynos ACPM protocol driver
  MAINTAINERS: add entry for the samsung exynos ACPM mailbox protocol

 .../firmware/samsung,exynos-acpm-ipc.yaml     |  64 ++
 MAINTAINERS                                   |  10 +
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/samsung/Kconfig              |  14 +
 drivers/firmware/samsung/Makefile             |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c   | 226 +++++
 drivers/firmware/samsung/exynos-acpm-pmic.h   |  24 +
 drivers/firmware/samsung/exynos-acpm.c        | 772 ++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h        |  15 +
 .../linux/soc/samsung/exynos-acpm-protocol.h  |  57 ++
 11 files changed, 1188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm.h
 create mode 100644 include/linux/soc/samsung/exynos-acpm-protocol.h

-- 
2.47.0.338.g60cca15819-goog


