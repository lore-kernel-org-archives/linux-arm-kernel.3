Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33504E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xGJf6mgKz68EpJgqnZRJBLUTpVwxCCOu9GDs7vuZ8Ys=; b=NPtAkJk2O/8laG
	8hw0tNOzcjNlr+u3sKrHRAr0yENAj9uioN0BtLtlJR1cpfIxeqCrvCeELH2tROoWRg3sxgiZWwmc/
	7oltxG5OIRiHRb586+EboiJ10gYmEn3y3HoUuLIGjx4OpeOkYOZsAoxtnBigRYKybhTXZnGkLmF8P
	bqTOcinP6uJvD+EKDF6gex2tqR1zoO8xzBFqtCCbtqm7x0hgq0sdIimimy+K0UK+re3B9QHh/WzET
	1AGOeQ7l1i+ALPMJVTQeaa2Ebw2VYM+sBIvJ63EhPbGy7bmwy1HBA1VkYqGlKoUEY2aptOPD81L/Z
	s7ZSxI9mPWo+nqB6pmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAr4-0000000A3lk-2jGH;
	Mon, 16 Dec 2024 13:09:46 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnt-0000000A2tr-1mej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:06:30 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3035046d4bfso11438531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354387; x=1734959187; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGJf6mgKz68EpJgqnZRJBLUTpVwxCCOu9GDs7vuZ8Ys=;
        b=D9vfrSWYyMw/6GailnEUScHjRhm0BPOle2WCHGcA26LwQA3NsD1YQFDVDrZnDVHt0g
         yIP2UcCtd/FW4eHuKChCkJxoXomUO6zzcYYM/5czfaNef5JjI0mKqBXZrW4YwcMHYqdZ
         q1GC5o0EMHcGxc52TYdMJJthEyZ4T0TCZzwWyMvEntAF6oOk14Z+7CRv4XeJ38kbec8e
         xg3oflbEnBpqWjxuW1st/1jqf4+8+qg7ScH/+4BPQ3XvHJr8r5JK3fx883IRnm/hfxKf
         x4EWSEJYuk1eJR8qmzPrU5wQJDybra6C7jI0BRsgcajKcE6LtQqXyrEh+Ep5eUrva+RK
         sdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354387; x=1734959187;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGJf6mgKz68EpJgqnZRJBLUTpVwxCCOu9GDs7vuZ8Ys=;
        b=QRebCCdsiP5KYTXIEwfflZf36vGEjKFMuVOgqA0vgF/+yukgCQcFLQhYBE9m8YyPfd
         Lx0Ep07/C04wuDsdRh7ivSDgFZ8IiEAZuQTl54l0He/2Flj39KoSBl9fGaEMQUDFYLZj
         kRWXd1UQ/LTHsZgOWZiMkLpGBF+QpwMeQLAIyscjWdfnCFoFQmSAU8ZSDBk4fJxqVzfu
         rSiSs7xKcppIbemE/JE/4d5OZSoTmCrtivJf5vgFDGON2Oo7PQsF1HM0KUZlT6MI1kdt
         FYG6wfAxV9L0rTf7DZw/EdFSfF9+RS7VOIdUdm5TFkMFosEvCIigS2cmPEdHb62A2UIS
         KQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVExAzXe8SdfFbiQ9AmQLcVEtSH/+kviPMX9KPbX9VsCIjYQ/NWt2+2EZxC96r2mRMwA2gJe3dE9+n6n0zZQwlm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxg46QzdkeQ4rw1ASpCFnr4fVpvsq9VU89QP3sMPVZ43nzrVsx
	ZMQ/ApaW3k7/AZD7NevLMyP/zGjCZ2E2KkcmzaZcOqdyFgRp+ugT9snAgSucWSZf8lCxFI0Wpsx
	nbu0=
X-Gm-Gg: ASbGncvzrFJaRpCLxTEizeXXoAt3DzgwalZ0TSFMBsX39cLO+O3Ji1ZdgsLt/w/gPDC
	CfAGaj+JDlTTw6fcic4pZ06+uozzHypjmnJ/+FRALo4WXplGixp7hx/akcBUUJMqVtQwh9aDEia
	DOp8SfJOeJtNLrfLqGkOoUv1hmH7AA2tbzi8Ug8PFu/N581uWtPQmPxAL+vLiKgfT0fBv5GlT33
	FQZ5RsVbK17TJrZqlmz9cn47xNmm6Sgl/jwuDCw2lIhwkj0/A+2g7BzgF/U92RW3XyMcKBw96yk
	L8QKfnsI1IMIUSIhEJWlLR6Y2ovRGA69wvygQZ2f
X-Google-Smtp-Source: AGHT+IFuuKkCg+lpMd0qLaMuI0DMbS5P6PzhltgK7tRQdBAky1HMLQROca2LzneeRNPwr+cYhlZnlw==
X-Received: by 2002:a05:651c:881:b0:300:3a15:8f2d with SMTP id 38308e7fff4ca-302544e2d4emr48536271fa.34.1734354386438;
        Mon, 16 Dec 2024 05:06:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/4] Google Pixel 6 (simple) framebuffer support
Date: Mon, 16 Dec 2024 13:06:25 +0000
Message-Id: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANElYGcC/x3MTQqAIBBA4avErBMciZSuEi0sRxvoDwcikO6et
 PwW7xUQykwCQ1Mg083C51GBbQPL6o9EikM1GG06NNirJKhRCe/XRnFWznty2lhHwUKNrkyRn38
 4Tu/7AfHAZxFgAAAA
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
X-CRM114-CacheID: sfid-20241216_050629_482034_9390DA16 
X-CRM114-Status: GOOD (  14.57  )
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

Due to the renaming of the gs101-oriole.dts, this series will conflict
with any pending patches touching the same file. I have therefore based
this series on top of my USB series from
https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org

Please let me know if I should do something different.

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
André Draszik (4):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 269 +------------------
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  27 ++
 .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++++++++
 5 files changed, 335 insertions(+), 262 deletions(-)
---
base-commit: d454191ca68125bee218d1d67d6716d7e753dc7b
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


