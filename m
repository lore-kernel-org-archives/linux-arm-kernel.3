Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D796CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=; b=kc+0YhNT5+yh70
	96DBJkKkvJQZBQnJaPRdKBQpXrEaTPRVPuhiqPHkHXzPrvyAbuTD4IUtiesLe47Jm59LhVGcqf06n
	Yy2YlvLcZlI2C9BzPIp8xGX97XeTc9d3Wy5ywWUrj0kL6yA0jZUjsxcWjjJ2UGf0FPLJZHCguyIcl
	7buGPTNX2QlktddLQxHXnEdcCXh8rEp3QS0JrMToLNefNwXnJxFJSzbr8R3cBWUuxiwrUBFr1mhjG
	8JMG24eOqhcC+rl8OsCxcNWL/xAXBxY+W4HsN51qXk0BATXNZ7wpb9k/QKxU4+6wIs5wTVCANsX0/
	RqbEldl6m4d+dn9K68iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwH0-00000000fT0-48i1;
	Tue, 12 May 2026 23:12:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwGx-00000000fRt-2vOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 23:12:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso42900565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627537; x=1779232337; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=SQ/BOZIbT8eQTGbZIIjFH9iQ5KApe/oQW78r/5enCSDPkTskSRVh+0EaJ4+0kMuZ1o
         8NHFQ3bRatBpgoDpjYZ2nfClZrzEBH19VDeSjVlsZ0l3bzpFSwFjj10rmrurh3OeXkpj
         hD6HZGLSTtE8t2gwMVfVLGkIVts5mELmkrK5ZuhDQo0e2rG3ja7ghVYaerAQRuOeZ2QU
         0RC0uhfgyGrE+/LEZjEWVkOk/P+G8U+bk3+Nm+AsLrRQYsfkYorrXOarMmpb1PYe7kH2
         jynhRK2yNdsIAjwqmFu3YNgImY202ACf+KgqgYbVQS3JjdZ1RMGHqmZeQyNljXt7uqSY
         1QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627537; x=1779232337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=alHk2Rtnd1aqX5Gjp1EYaw4h49ddjZJWPhmG1LoRxAitEM3jgnN5Aa3AFFDVOj25lY
         naxFMNPsJU8abpR4pM7MABcsAM5GkDNvHAuZHBbzr32QAfStCXPa8ABG5QF4l+54UvOA
         WYAbpNDB4rdC861U+zSj57CNsr/vW4GSY0Fge2VhXZtl7X1a6h6Sqx2SMWvKlTJWxmIb
         Lh2et7skqTmmyGYAhdYv1KTNtU3ltmLbYya3BgudSzR1oiKAjahmgf0i4uJ8jIigHOE3
         3ek49PP4CerWvBMzrUxrDd/DPBFWCEO+oYYFrwO8situLZZjr3MjQtwLacZYeSs1ZYvM
         YdaA==
X-Forwarded-Encrypted: i=1; AFNElJ/VC3HNYf2xusz5+Ie+JErOjRjmNYOCVJAm9VOEFQX1szC3lVCETt6WPpLdxCyg2GjA8oxWmvpdHzZrAqM5vjaN@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+fsWUCgelMp0G9Tb4r0KkbQWHoDya7zJxjE6MiIeEXVjkcRU
	69WpMh9i9oyGWScMcrp+W+F9rg8yYvyEOp8BJeVJgNFgkp7sw0JDtSyfTcqqPFWiAlY=
X-Gm-Gg: Acq92OGJ5hDFcS5GesHIV0n2ndmuhKeljqrwUS+CHNmGx9vaqOA9NrZKZ92q5OyXLdj
	tsx9QvfTig5Mu4e4rp3T1uEWeP/TSGU0uiovUvBJiifmKVgz6x3A800v2vkqnYVS3HnYl0tWChV
	Vu9OeqSsCGj6TVQPpjyorIBuhqbOGtWjBTnujFkxq+RRS34dYYWEIiNWIMZOUaeQSTCl8ii6I5o
	dWGw70n3YSGZEyk+QkpVNtllLQdVfbfj6AbwdCyWiScW5204cbCak0rIpMKE4B///JF8+bYI3MU
	51u/bZkmIkHJykX+AilVaPghPa5Y6unTPc7sWmL8PjPvbP59+bQMSGVh+iPcw7Lg9IdZAaiefl9
	1TXVENtte5wTOZwHZgTDOoJOShBXfISkwX6fjFwklcgKbW/rNAGqcZlPfM88llh3KLqdBzoKGjb
	vL7aAmV3iTxtk8Yc94vd7gA5TndV9yZssvLWw08vHYi9BWCDFSh6xgQf82+ryvnGl6YcMLbovb4
	l3WvzhHt6I4353J
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr10062455e9.28.1778627537139;
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Wed, 13 May 2026 00:12:10 +0100
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqzA2oC/3WOwQ7CIBAFf4Xs2TWALZr+iukB6KJEaRHaWtP03
 yV68eJx5vDmrZApecrQsBUSzT77oS8gdgzsVfcXQt8VBsml4rWQSMurH/Kp5qhtDOh8Ck+dCPM
 U45BG5JqcdpXglVFQVmIi55dP4dx+OdFjKqHxK8HoTGiHEPzYsPm4F5ishN8DDfuXt/cbGuqEl
 QejFJlmFtBu2xvqNeR31wAAAA==
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_161219_777874_C508D3B9 
X-CRM114-Status: GOOD (  13.87  )
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

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes (not for device tree bindings
update) on clk-acpm exynos850 series posted here:
https://lore.kernel.org/linux-samsung-soc/20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml    |  4 +++-
 drivers/firmware/samsung/exynos-acpm.c                         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
prerequisite-change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb:v1
prerequisite-patch-id: 223c977406801dde31779f956e33e65e51a0323c
prerequisite-patch-id: 9b11f60e3c53e94e28b5e54fb7bb87e5415d8a05

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


