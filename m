Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E118C36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTb/6m+cqxX8FWirPINl0MalDPq0y5qkx5epBIXmSTQ=; b=qBTixTwiMHAsy5
	XPlqoPBe5Q0bVEQK17EiuAu0y4+6lEC5paK4V50B+ECACCW3Iry26hydUo8dBNC9BpALdoGLRHKac
	42DmrD3JzKQEFmkchWpglrdYpnYr+EO/NnbSKqk1uubar5iRQEXvkyl7aKV7T1R9rFLv1Jye9RyP9
	LDb4AtddyYFHmINzYkbwJR4VxXFKUvMEZFh4LbSraicVQFZcRNYki0lOT8dxk9gWGBUjgY2YyG+T0
	fQXJHs0zV7anB/mqrZYDq4Zj5uyyp5JFxrLyLo8SHirKUKrA6ajWY7fpk25SqqWI/ndrYTLTL30CN
	YamVnt3xhx1P5ryJ7KZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2H-0000000Dp9X-06HA;
	Fri, 28 Mar 2025 15:54:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQZ-0000000Djix-0Itp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:15:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac339f53df9so412430866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174921; x=1743779721; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTb/6m+cqxX8FWirPINl0MalDPq0y5qkx5epBIXmSTQ=;
        b=sQObdPa51bcb9+yQmbyNf60Bq+0aZB1LS+YtroYobM5jbQUEHfK1G3wSnocuuRpwdQ
         iCib1B59qTjOvJA71es79qmI9LUG0NUwftq/AJgqvN5yuSYd+v0ERt3Mps0wqw+bT6qM
         PyipM4w1hA1Al4NMz7/D6gnHi5Vqbc8Nwdar2+MOrSlpZjaJUH9RXoFXkkBUdgUD7+ME
         lWSlUHSoqUV5HCnVZqXppvmEEJPaa5FABE7sA1PF6griN91RvUdIp73+Rv3sIyWF0BKM
         wa7oZtrsmXy2j+1QdllSF2TfLAOA78oxTtzMM8xeYeRaXTM66XrKU77c/fwxs0N8ndQk
         ZxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174921; x=1743779721;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTb/6m+cqxX8FWirPINl0MalDPq0y5qkx5epBIXmSTQ=;
        b=AdYu1U1aL5zS79FydkEzZB14p/ypCt4AOiv135Ihbo/m5ih5g150NO/pnb8wqVlzet
         WduNGu0l08NJQg+J6+14TC5XhEWO1wwh3I9MgIJzV1vyjbRDgZemZRb8xEMlR4s0ZtBp
         19pFfWrf9UKNkCa6gHrnsYDO57RgQt7aaOpk6fBizw9L7BCkQnWcfDTK8Z3790sSS4c3
         RB1cwcAu0aJtIUmjMWcV3d9XKE4jVKr+qp/zmjkprZLHcBdu9aPwbFA/LNp642+ITTQX
         wOfPRvx+ktsH6TvYepiEk1q9Wqa6KCzojqcERnNsHOkQbOvgKYpe6mCNVOgjSpEylVHx
         2kLw==
X-Forwarded-Encrypted: i=1; AJvYcCUoes8TnJvtOAURtIJf5pTER0HlPZA/ke16cGC64EKHVcJKAypGNANQDT2Lg7XYVv5zlOUeSep5EJvSc1vapnlc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzab/tCWaGmg66IzTYgLUkaMrmMWp8bdX78JNQHZBc7A1rEECU1
	RbEl5tu/aNU4QEflWsn7nUHEQ3eIi8E/zMIIh+FvN+xGZyGy1pRi+KzUOznjAnc=
X-Gm-Gg: ASbGncsdS1FH2gCOK6xIw9jO0rqExhi79kSckmX1wt0DPUd5f0cBuMsGlKOOyRo5pUg
	k0i07MHGtXIZyFpbGtSF9DJuGFCExGxodEnAu7qq7spf40Yrk9Wq1pOGU4C4MBSs7wuzyvpnsG8
	8KJIdBfzRhEUTKylmqxrE3X7Qe4bhzpfeVE/rwE5hsfdXcaloYuF7mrDA+WqeXrkpklGKl2FoOm
	h+NWe8vEZZjgo7k7hxQk4GxSJ8+oxW35mTlN4CbvRetWTcyqx/msQY+ndMjR9DvFQzz+YjfCo6H
	hwzVj4iLfoh5aZiC1td9KoQFnAlS1OEj0CvDjq87qfjPtf5J9oBrKMIWT68cq9ENqeZHqFoOkA+
	Eek1vb2VOKelD/heKXFswza5lb8/T
X-Google-Smtp-Source: AGHT+IGx/OKAyGwvOZBy0ZMKJFwNxxrxi+pIE6CmLb9aaW4fvxERRLfNh9G8DBj8v5e+gDV9fv4WjQ==
X-Received: by 2002:a17:907:7f0f:b0:abf:6e6a:885c with SMTP id a640c23a62f3a-ac6faf14d75mr574320366b.23.1743174921074;
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/3] support Linux reboot modes in syscon-reboot on
 gs101 (Google Pixel)
Date: Fri, 28 Mar 2025 15:15:18 +0000
Message-Id: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAa95mcC/43OywrCMBAF0F8pWRvJo3nUlf8hLpJ02ga0kaQES
 +m/m3alCOJquAP3zCwoQfSQ0KlaUITskw9jCfWhQm4wYw/YtyUjRpggjEmc5uTCiCPYEKYyEkz
 4HlrAQkqhtdW1AopK/RGh88+dvlxLHnyaQpz3S5lu2z/QTDHBDXXUSkalNHC++dHEcAyxR5ua2
 b8SK1KnidaSK2Kt+pL4u6R+SHz7STTGCe441+ZDWtf1BevceLhVAQAA
X-Change-ID: 20250226-syscon-reboot-reset-mode-566588b847e1
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_081523_151989_DE81BC0D 
X-CRM114-Status: GOOD (  18.31  )
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

This series updates syscon-reboot to support warm/soft and soft/hard
reboot on gs101-based boards (Google Pixel 6 and Pixel 6 Pro).

Linux supports a couple different reboot modes, but syscon-reboot
doesn't distinguish between them and issues the same syscon register
write irrespective of the reboot mode requested by the kernel.

This is a problem when platforms want to do a cold reboot most of the
time, which could e.g. wipe RAM etc, but also want to support rebooting
while keeping RAM contents in certain cases.

On gs101, this can be implemented using different syscon register
writes.

As Rob pointed out in [1], register access shouldn't be encoded into
DT, though. At the same time, at least on gs101, the difference is just
different register values in different registers. Therefore these
patches:

    * add a specific binding for gs101 reset
    * update the generic syscon reset driver to support this new
      compatible 'google,gs101-reboot'. In this case, and as suggested
      in [1], the syscon writes are then deducted from the compatible,
      rather than parsing them from DT.

The existing generic syscon-reboot driver seems like a suitable place
to add support for that, given all of this is straight forward and
simple and similar to the existing code. If the preference is to have a
separate driver copying much of the existing generic syscon-reboot
driver code instead, please let me know.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- Rob:
  - don't add more properties to existing 'syscon-reboot' compatible /
    binding
  - add specific binding for 'google,gs101-reboot' compatible and
    related driver changes
- Link to v3: https://lore.kernel.org/r/20250227-syscon-reboot-reset-mode-v3-0-959ac53c338a@linaro.org

Changes in v3:
- support <reset-mode>-reg in driver, not just in binding, doh...
- correctly parse <reset-mode>-offset
- add a comment for all the BUILD_BUG_ON() checks
- Link to v2: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v2-0-f80886370bb7@linaro.org

Changes in v2:
- fix whitespace issues in binding
- Link to v1: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v1-0-91c1b62166ae@linaro.org

---
André Draszik (3):
      dt-bindings: power: reset: google,gs101-reboot: add Google GS101 specific reset
      dt-bindings: soc: samsung: exynos-pmu: update reset for gs101
      power: reset: syscon-reboot: add gs101-specific reset

 .../bindings/power/reset/google,gs101-reboot.yaml  | 32 +++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 21 +++++
 MAINTAINERS                                        |  1 +
 drivers/power/reset/syscon-reboot.c                | 98 +++++++++++++++++-----
 4 files changed, 131 insertions(+), 21 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250226-syscon-reboot-reset-mode-566588b847e1

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


