Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F451112274
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PLOJdGh8Zj4JSEdcQhNVsEs0aSOI1jN7IdBHD4I9ibY=; b=b9MANLftH7UElg
	JMw6i+qkSnW0pEe6nCsw08r71FrXhiFrnq/9Py53GyrDuYENdXzHJxttSKp4WBiUThCL19y1COHxY
	peKSpPDFK4qPmlzzJ1ly0oYSidPT/1hYv7051hFwm9HQwQT1ufxxObzB7uWtrAokS7otPa4RqUJD6
	YmcV/w+t/hzj08BhsUt1BV6I45XqhzEuiCh78bXGk1axzy9fGEb6vDezAiH4Az8WLltMYt2uu8L3r
	DO3OrObKH7X+2rhD5xxDL3QRC0GrrB5xUHv1a+aTPn4bJu66vhrT6GwJGW6A7ol6R/y4G5AF3ka3r
	rkHQEeh1LwwD0mzMHmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fa-0000000Gb40-1B4i;
	Thu, 02 Apr 2026 02:20:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fW-0000000Gb2z-2F4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:20:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so2760585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096424; x=1775701224; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLOJdGh8Zj4JSEdcQhNVsEs0aSOI1jN7IdBHD4I9ibY=;
        b=Fg0RwkKSiFxbf8fYJKsoOLwJTnyEUN8UGAra+VMCTlF/SyKPJWdxbqFBGbFyEm3VYI
         ZgHWJ66+z2P8a7uqO1gifwFS4x0og7sNrdh10ydDKvEfmN4MVD5/0WXOM7Rvkk2gFzeZ
         3BXNGIVnt9KacaZqZ8Y7rInEaQR3WdDkvomj5FyKWyVuNgVhZI4H7Z5TnNPWQ54Qc6UY
         lLv8aJ84GtgOXxe4ryqr0C9zqW4RtOVdcDhoigIsrMWBhwbVreKHFVAtnw0EviAhtjET
         J/MMQcFqhYaQkEfLzNGovgxd1OGwztVQcPRpg854cB3HtpxgWVj+BnM/hDz2oXUV8qwx
         lf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096424; x=1775701224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLOJdGh8Zj4JSEdcQhNVsEs0aSOI1jN7IdBHD4I9ibY=;
        b=RMRWbXbiTVT6Uw5XqPayEh+7aeM1aC1EUHbcgIII+9YJFcJkRUPhA9s2kvmbgHn54a
         oRlkg9OoOKhyNW3yNv3I0EDZl4DWZpIOGVOr3zy+86nGLj/a4lgbCH8I/hBZleCAjSLq
         fgijuKpbM8h0/aXFY5W7hBky/QdIG6ApCGL46cyy2Rl641FruOzFMyTyzz8vNyoYUdY5
         hjoylcmjR9xP0SBGz0cyxSvCyiQ70gx4oPDkl8FZp5dH6Tg8vL/RN9Liim8fo1yplL33
         oSyfsUYY6ttLTiQVo2D+a3NE/E4Px+bkgf4Sev8GY8651nbbwxioup6asc02eTg7PKP5
         ds4A==
X-Forwarded-Encrypted: i=1; AJvYcCVlKfXRNrn4OJsrCEiiPBm7df12bHFU9YYGoReBaktK8o5aiXEABrwTm/7o5WhWfu+s01BWlQPieqGL5PyBKOAU@lists.infradead.org
X-Gm-Message-State: AOJu0YylzS8cl9gMEWd1oeyv7UvOW33InNayGLZOewjWfkschQBvyfYn
	T/6cJvAnDV8fAiU4hTpZP0K7T5rqGy9cJbygMhhhuDPXZeZo0z0KaEsEz4pFaU7IR4YA5TJYmZh
	p+s41nBA=
X-Gm-Gg: ATEYQzxP25VibP3Zq0YlfvUW6hjOCwIBARKnFE9StlK+mIUspobnJrb3JNsHPzAoTqP
	lsBf9zbODxRIO6aiwYr5hOGZy7L9pwuTZJwCLlvJHNSOUTWoHYZYVSNIhCZYC0wjORo5WTT47FO
	D0Q8ykmbIiKsg7zaXIM5QvZMXo+gOuweqR0mBaba9fCj+wk8h0R64g+5taI1D3Y8fplBnQ3bqv2
	M2Rr2MAlYArOJzd7aRegdokWyWnoMR/lz1KmX39iO5nlihSfgbG1hTERF2ib9jCSWNn3/8ooJ7e
	T2RQvQL8i6XvceJ+NFgP6KNMIbX+9NHfoz5H1oDOj1ZNDigL+caiV3gFGKDKtqw8k9h0HCixSFb
	EV7mq3cVjR1xiqPWleDxrYPf7IDW8wxJaxY7o1/nzylHekZUQf9tgkO/L5QUnKsHBK9dMqhmOPq
	YsVKErd37M3hFbYiMR/TRN6bRcY/Mpt90A8fR+E4uQMKU2xF8t3jUshm/fIGtoLGjAQCGVVHwFk
	QE0JvvcwqXyrx3a
X-Received: by 2002:a05:600c:444e:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48883569e3dmr93027505e9.2.1775096423942;
        Wed, 01 Apr 2026 19:20:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
Date: Thu, 02 Apr 2026 03:20:13 +0100
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3SzWkC/42NQQqDMBBFryKz7pQYqSRd9R7FRYwTHdBEkhIU8
 e5NPUGX78F//4BEkSnBszogUubEwReQtwrsZPxIyENhkEK2opECadt9SOoh0KzSrAsuhuc+bGi
 dE1YNrVZaQZmvkRxvV/rdFZ44fULcr6dc/+wf0VyjQK0a6hsndevsa2ZvYriHOEJ3nucXsOEZI
 MEAAAA=
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_192027_593581_76FCD7A7 
X-CRM114-Status: GOOD (  14.81  )
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

This patch series introduces support for the APM-to-AP mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block. These
were marged already (thanks Krzysztof!) so they are dropped from
this v2.

Please also advice if mailbox change should be split out as a separate
patch.

Will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything, I don't have dev gs101 devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (3):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox
      arm64: dts: exynos850: Add ap2apm mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++
 drivers/mailbox/exynos-mailbox.c                   | 67 +++++++++++++++++++++-
 3 files changed, 76 insertions(+), 4 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


