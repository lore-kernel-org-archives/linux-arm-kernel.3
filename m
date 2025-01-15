Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ED5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sk8XcCPQk/QfLtG6UwXSc1dy9JRT7qUXdhOLuEZAWNU=; b=GJFJ1YDLSiwvxp
	zt8wq9bqCWA5DjGM/OYnLibnrh+spJ7z4M6dQt9G7T6fuYJi4BsHknDTg2rWqEZJpo7ti1vO4RV0x
	OGZlVMlKEy9PRW3HKPHW8/qWu2AR4vL28iez5EuUkxOpItRse82Zz+o3X++9VvfPp16Em9OW6yc6F
	SXpnQWiUDu16u8x7bzILTaTvuCm+Vs7WaDy4wEgLt3aEOgtIvAISWi25CjGqJ24aI3N8J0lmH+Vqz
	Gib2dBPlaTVPR3WPo0ZAcLkRc7GxEilhdwokmqjUvZ2GLBMYmn/Q8s/NBOSZABXPyGSoqHFPEzMU8
	J5r6gEnDUyp/mg3ZkBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY60N-0000000COO0-3pQX;
	Wed, 15 Jan 2025 16:12:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5z6-0000000CO8m-0jLl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:11:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so11589414a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957470; x=1737562270; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk8XcCPQk/QfLtG6UwXSc1dy9JRT7qUXdhOLuEZAWNU=;
        b=P75l3c7WPvuZEdwk0W8O/rF8mmW7gXW86OsU1PCsY30c8acmn2sjsEsuYEigJkhFVH
         QP2WCyRwJ+dP6umlKVePeXLMsHxYr504RIm2CY0PpbtAeZjW820NsO9HdO/59KfejHr2
         TM4qQ5f+NRWhaIhChg7NJmmZI6wbh4D4E66Ak9Xsquj5aKjYqA9WVEjgObrZuCnFr0dl
         FXl7dHrvdw48w+DXaEUAEfiSpoUJB79hFaybsCq+pQKVPyXPsf0nsH8/m+XJUEDyviFB
         FTzFQs+3CKcHJ7HrzA86iPkUu5VYFC7Qgv2AIscIooarUgPSP+i8inhL2gUhSMAmJ5eY
         teCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957470; x=1737562270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk8XcCPQk/QfLtG6UwXSc1dy9JRT7qUXdhOLuEZAWNU=;
        b=BpQ9wUwmb7PiGQSEmTisWx457T5fTkWBfzpXpaqiyomBD7ZEqapDa0TUBj3peArV8R
         QATG+z909pUNb+qNhrj/XdzvI6aykEmnj1b9hdXpfxnkAh5FhsajV11rhuALmHTmu3Rm
         kACkR/dyy8mDE9hrML8x2feSQnKvwNPxfqiMNoA8X6SmH23r30I8dUmEvwDBWb/H3pGh
         prFN96cZtdyBxCp2RXLrJ8tlkhxdf6mKQygQWFoIfWaPvB3tm2uCH7+CqJIfyBoQPIgz
         Lyv02/aIOQynG2rn0I1iubbh6gFQ0GldrIa1G2PNfh201skd90d004AxDiJ3PNA98coZ
         Cybw==
X-Forwarded-Encrypted: i=1; AJvYcCVTyXNxr3ogycEPf7MseE30khuObXH27+PpzzhQ4k4nJPRjp+mASmanZ3bsBDWA9k9+w+IxwBX/2nXw0suz8KER@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2/gQwVt0rs/obpVuCf9xziQ06xT3UpvrmfpM1Z/ewlBllBSW
	VuAB+MyjMkv1rT4jG8hkQT5JicBwy39E2hHnZ+ECpRtAkUKN/1p5I+yGVeT5fsw=
X-Gm-Gg: ASbGnctCysRnm0Cyo8MiN2wJAyl0fJ0sZF3EJCId+dXHAoz3sDCYZpn90jIEex+tb1x
	yvZLoEy4GPo9fQ+Y84V1F9THwS0cRx7v/SjNNhe4/BE8Q/jv1HlTfOZokfKHTzlrl5fC+UEhzD2
	hK1t+uWy7uHYobZzJi7uudIhHw4dAHm/LR+1Qc51wh+HdAE4NZcWMFs6P8OkCVOcrDhGzKbqm19
	8ecXx/V+Y2H237EKJ6txJokcD3kZR4utuAGNZDYEh9KcMW6j/xrD7L3CsTL6+vqR7UhuweMtkDM
	YHHuTCmAvbSO6s03e6VvmtcUwGHBsv47OB6cEJKb
X-Google-Smtp-Source: AGHT+IG8jwVgJoqsILMY+vI3oCTtwUoVhDSB7vFI/n6QxjmCcZpiS0jPwfBOjTCKizLFXRVYFkMgtQ==
X-Received: by 2002:a05:6402:2345:b0:5d0:b51c:8479 with SMTP id 4fb4d7f45d1cf-5d972e0a087mr28935550a12.10.1736957470374;
        Wed, 15 Jan 2025 08:11:10 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/4] Google Pixel 6 (simple) framebuffer support
Date: Wed, 15 Jan 2025 16:11:08 +0000
Message-Id: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABzeh2cC/3XMQQ6CMBCF4auQrq2ZGYgUV97DuChlgEkQSGsaD
 eHuFlYa4/K95PsXFdgLB3XOFuU5SpBpTCM/ZMr1duxYS5O2IqACCU+6Cwiog9zngdtaG2vZAJW
 Gm1IlNHtu5bkHr7e0ewmPyb/2fsTt/ZuKqEEb52yDJgcyeBlktH46Tr5TWyvShyf48ZS8Q7Cmr
 biooP7y67q+AdUc+BXtAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_081112_219790_A25143EE 
X-CRM114-Status: GOOD (  20.91  )
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

Hi,

This series enables simple framebuffer support on Google Pixel 6 and
Pixel 6 Pro.

Even if simple-framebuffer is deprecated and DRM should be used
instead, having it available in DT is beneficial for several reasons at
this point in time (the phone uses an OLED display):
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Since Pixel 6 and Pixel 6 Pro use a different resolution display, this
is the time to separate them into their respective DTs, and provide one
for each of them. There are other differences between the two, like
battery design capacity, but they don't matter at this stage due to
incomplete upstream support.

* dependency note *

None (anymore) - earlier versions of this series had dependencies, but
those are all part of linux-next already, so none remain.

* dependency note end *

For those who want to try this out:
The stock bootloader disables the decon hardware trigger before jumping
to Linux, preventing framebuffer updates from reaching the display. We
have added a work-around in our Yocto BSP layer for the time being
(until a proper display exists upstream). An alternative might be to
port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
seems to be done for some other Exynos platforms.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- back to using separate DTBs for Pixel 6 and Pixel 6 Pro (Krzysztof)
- update name of common dtsi file (Krzysztof)
- use 'memory-region' property from the start in patch 2, don't
  introduce it as change in patch 3 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org
  and https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org

Changes in v2:
- We now have a generic gs101-based Pixel board DT, which can work on
  any Pixel 6 / 6 Pro / 6a
- Pixel 6 (Pro) are overlays onto that one.
  This has the advantage that all boards can be supported without
  having to have a full copy of the DT for each of them. We still
  instruct kbuild to create merged DTBs (in addition to the DTBOs) so
  that existing scripts can keep working while giving the option to
  just apply the overlay before boot (e.g. by the bootloader).
- The binding has been updated according to the above points
- I've changed the simple-framebuffer node to specify the memory via
  memory-region instead of reg, as that avoids unnecessary duplication
  (of the size), and it avoids having to specify #address-cells
  and #size-cells in the chosen node (and duplicating this in the
  DTSO), which is otherwise necessary to keep dt_binding_check happy
  and DT validation working in general.
- sort overriding/extending nodes ordered by label name (Krzysztof)
- format patches with diff.renames=copies (Krzysztof)
- dependencies have been updated, see below
- Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org

---
André Draszik (4):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +--------------------
 .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  22 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +++
 5 files changed, 58 insertions(+), 264 deletions(-)
---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


