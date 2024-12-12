Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1285E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHEuWzDtHUDlvFzFUY2tkx2xxe7A6hFHuo+SVGTgMQI=; b=vln4HMbW5kR+pv
	sg+e4EozpxtGrhKNhiAjxALWnCw1T6tNlr8utBalJ7FtdLJ8Z1bX7QWsLHWiFTkpzg6xy8SUfXW/X
	AcBfppFE2f7GAw24RpPRJxkPcozlkQ1FaIf01bUyJQrgx3VzQLi+5Fqh/t+7a2vDz8tFeNcosyF9V
	efzd7vYq0MSGFTt92hEcoijvOuKd/TPbtddYl0h1//GN5YxkDjsPDQLoy8KrWL6OzAJHKfEXjNyKV
	55R3wCDrBMpGX/pbvMaCj+5JEZCrMxDyw5n2RAP8g6ldfQlFn4DaMmTuI/GYMBk1D3lOPkadWyVxP
	L2+GJ8Nspl7gL58Gs9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlYZ-00000000qgx-0qLA;
	Thu, 12 Dec 2024 15:56:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlOh-00000000o9v-0372
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:46:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso8249965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018397; x=1734623197; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHEuWzDtHUDlvFzFUY2tkx2xxe7A6hFHuo+SVGTgMQI=;
        b=D6zDy/m4F+TuafelX98+IZqNdUFrrIg7COc3DcdJZGQjOWEdjpClnHS2Fp3OMpVqnU
         Sk/HDZzttubCAsNe/tg8Kvr8kMe84xJsEDipUFJ+kXmUzjz2+vGmSAL4cAYjsotNinPD
         RdLygQ/tkFsXaeUwcHUs6tur4i0pTuxxawies6Ir/NrOlhBVx25IpLIvQAnV71TLnyoH
         pn5SlrGEB7eNjiMcpo2HLHlhwBS6gLqLo3jb/KvN3b5Qe3hXhgWbBxHDA92r6BdfMK1d
         lL5zuOV54FUGqVtCVD2fflJjDMjMsXxUwLrVI6iCWC8PThHqQjEaboSFJWkC991A5Wbf
         AFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018397; x=1734623197;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHEuWzDtHUDlvFzFUY2tkx2xxe7A6hFHuo+SVGTgMQI=;
        b=n44m07Amx3b9CTbvvLXEQCMhVJ4h1d7FYMWiBB0RmSx4pkEg988MxPJoysiFUiOXHk
         0ZLeRUQMWRUubVTqELZs4Bc+OR3mqOqAec4+S9s/5Q5xc3y5nH0ecD3hmHCKZ8mGGmAd
         nsh0R66YPUXgQa3Eel2UPkJ3kcSrnPYCaBChYDnOI7PnjsC7IF9j2eXYdTlJhe1+1dHR
         DXne5szn2LTuseBRste1XLX1uTmpUsYsL7zXs8/42he56/SxxhvkNS9UEPou6/ajpS8m
         GXNK0HRAR84bYS8X7Y4zRqr4hv6GGpmBQpIVVpCl47MsvHUKZEC1/GFL6yDR5nBDd5pp
         R+bA==
X-Forwarded-Encrypted: i=1; AJvYcCUQm/lxUFQXd2z2nPqb0xhbrDRm67nKnTTenwhxPk7Y87Kmbo/ewOLggNQp5fvv4b3p6itC6p9LrsycMl1HmyoT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy29WAcas3VxNNIFQCepLRXBWAlqcbuE0p6QZuyEBp9M5JPjnDa
	s3ZrBzvoyUy4VCqFXf5Uk1y4xQ7wW2nkjTO70eRrdytBsvIyVygULVSp4mI3VUQ=
X-Gm-Gg: ASbGnctipnhr9nC95bMF0YndAUKWvkKqBMmwyaTpEduDNRe5304NpKb2dVPYW8zs5Gh
	1PyBd/DYwfRj9Thyn+tXkxARl7qU6eGXgLHpBn35DXfUdy2i6v1TGFriRvXVeFe2C6iq58jN7CJ
	Azz9lXgXDA/NFxCimDeQ0MwDXwJniXhkfo3I85pJyIJ57GYVbUt4UvT7dnvVGMTLWEtvlTDhFJu
	7PKMlmizXUSOdvDu/lKR97h+fj4ilFE+2yG10pFvtfP2OlLdnroE8CWDHccXlgVdvRKAUHSDcmL
	vD23jFBLmYzJCaKyCRFyqdYMiErZ+r0/xw==
X-Google-Smtp-Source: AGHT+IG8CN2hgLpsM6m6nHOXhNUh7Kw3+z/BZiMwdjrpn026/mubHTDbMHcNXqdjvYXjEvUamvJP3w==
X-Received: by 2002:a05:600c:468d:b0:434:fff1:1ade with SMTP id 5b1f17b1804b1-43622833513mr35505275e9.13.1734018397461;
        Thu, 12 Dec 2024 07:46:37 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm20273075e9.5.2024.12.12.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:46:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/3] firmware: add Exynos ACPM protocol driver
Date: Thu, 12 Dec 2024 15:46:21 +0000
Message-Id: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0FW2cC/x3MwQqDMAwA0F+RnBewNQz0V8RD6lKXQ7Wkzg3Ef
 1/x+C7vhCKmUmBoTjA5tOi2VtCjgfnN6yKor2rwrSfnncdAyHNOeBB+ctlNOGFUS182QXp2nbj
 Yc8sBapFNov7ufpyu6w8WLcpBbgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018396; l=2976;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8MwlOrPw6hnbupZRUxMztpH21m465O5pFE9DVmIdMe8=;
 b=lOqHvlJpdGZcc5EAmus+LGU4Wn0TJ6rs/yuvq+NaKvlCmKlsQf4wIXNRwtmwoAd/IJmUd219t
 HQllYWe4NZ6CuXyqX1kb0SPIwgQWoEhFX4HFIsket14aulFERqbXvKb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074639_052814_7DAA588D 
X-CRM114-Status: GOOD (  12.59  )
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

Changes in v4:
- rename bindings filename based on compatible
- bindings: drop nodename
- bindings: drop mboxes description
- bindings: remove initdata-base prop, and define it based on compatible
- bindings: move additionalProperties after the required block
- bindings: drop firmware node from examples
- bindings: drop unused label in examples
- bindings: rename node to power-management
- driver: switch 2 macros to inline functions for readability
- driver: add checl to avoid shift overflow on these inline functions
- driver: use ktime_to_ms(ktime_get()) to record ktime
- driver: use the default non-relaxed IO accessors
- driver: remove atomic handling
- driver: remove stray of_match_ptr()
- driver: move header in include/linux/firmware
- driver: make sure to, from are 32-bit aligned and count is a 32bit
  quantity before calling __{ioread, write}32_copy
- driver: reject IRQ channels (not supported yet_ at the top of do_xfer,
  instead of when waiting for response.

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments 
- add ACPM PMIC protocol helpers

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: firmware: add google,gs101-acpm-ipc binding
      firmware: add Exynos ACPM protocol driver
      MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  51 ++
 MAINTAINERS                                        |  10 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 239 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  24 +
 drivers/firmware/samsung/exynos-acpm.c             | 800 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  15 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  55 ++
 11 files changed, 1214 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-b4-acpm-v4-upstream-firmware-4633e1f9a0ab

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


