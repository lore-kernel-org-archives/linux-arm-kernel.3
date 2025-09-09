Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055ADCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n3SZVEt5zs+XMpyDtIWhZjJMWmB8ACyyA+oaZqN6VC4=; b=VHHntJy/YHUnuDkhLQIWnxzFlX
	LAZ8uzb0PkiTRwsjYxnrwmb/TxWgZjqaiAjSzASgy7eu4V6MufZu68vqWuI+0sfxJvZ4x+iqEfW72
	iKbQHRlH0Nrww4/JNIP7MsTC6Akf0Zp4SS5rbEblFYy9PnLEcW6eiY/UVz5M7gj3o7zQnbCqWaTAB
	rNxG29CM2oXTbNVnD1eUJ1bN5Uh6wKRwsgIi914ch/8YXA117o09YnKqKJHh/uSlstFdDf8/azveA
	fnRxH6aW273UJYj+M3VThFw/9AAfF6MrRC2l+zcLUv4hYzHkupEFqvPZa3aRFwSx01kIOZ8ZHlKAv
	EkjBKMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2vZ-00000009N1N-46R1;
	Tue, 09 Sep 2025 18:18:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2vX-00000009MzJ-1Biv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:18:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61edc3d4367so847711a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757441925; x=1758046725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3SZVEt5zs+XMpyDtIWhZjJMWmB8ACyyA+oaZqN6VC4=;
        b=uSDfW7yxerDnMD1TItLkh1kwoFaZ3Ichl6e377alTcgRY3yqEB/p9rE922iVG2bfEs
         FDj9REmEPqnj1HjCgl8DsxUim/nZ40R7YI+Pb93qRmnMk4ZMy82gB6hTtii7ASEvpsYw
         Lyeh1zKPWFEHThZfI043zSD1gRg5TnvH6OECUq3KWKy4bKUSbgpIUD3MHppkhS+TRAA9
         /4nVTloisl8cBpuOOzn47unWScybAMJgbwM9Whdc6gFnJDcQRmgmNDJAcezRg5AkEZ2o
         kCSfeu7A3CEdiJL4DKbrrgsgAx2mpZOI4zPmHyTZfs8DD9y0omD6Rz0SGcWXZaWs2IgQ
         znBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441925; x=1758046725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3SZVEt5zs+XMpyDtIWhZjJMWmB8ACyyA+oaZqN6VC4=;
        b=jDmIjtxsIU9GI+7TQbAlqtDxQjNZw/ENFkRBNsFcQ+XvhirDFpGWCLrdV1NxSStv/T
         7J+9wlBvULmEX4epiFpGkDdTaf7IyfQD+fKGfUtfC9EtlTuRcYMBgR3RQqjbkR6jekXH
         oeFXZATm3NXaw9BRommuWHzBdNyF4ovRfxNvOyO2vLRSGzHKP6toohOun2taxLUP9w+Q
         flEw7Ws29+xo0JxBKv2fXcTQwKvCJ13gh+bwfcVA4CBaruuNaCnafuF99TpVVG4YFhzX
         f3IgDXYi6gDzoCHy9c4LE8SsD0vewoYMVxUbeDhEC2zbPUwEfvXorXnovKeBonVDo8IR
         E03g==
X-Forwarded-Encrypted: i=1; AJvYcCXD4oYzuJzMlFx3xcYcAbwOI1nKM/JaLGWz+ZgKwqTRHD/nkgoLN3YfsTN0NNmYw8ETBX3tFZl55OwsrfXSkPqU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr3JXc42iB57VVKb7t2J5d+HEhN2/tZkJTRy0V5ir2eUCA/RVQ
	93aZpLkn8HdmMuGpBJg8IE9LxWjj51sQ84EsDaBrt9DMXOX03dj0j5R0xoQBEtmZ9jE=
X-Gm-Gg: ASbGncukxbjwxzG/7BEgkqFYU8FJNSG7fzw4qYn0brVPpyAuunipTZS2kWr6tc1Eh/X
	HGFOK/g+MC4Os4hTFWzQMHQpZpbKp5O0k4YBl87M9ee6btrYpd8dGGYjzbV8HwGgpL1qI+CerX5
	wlLHS8tgjJKFysHCaFoIv2U9skgp/chkVzK5xLbZcoQKX9LcDiYnLoNdCseWU68RE9gNTU5NuU8
	JOBkF3Dx3/NtCy+//spsiHpOYZCAg6orxmRIe6m0ti36TmPlA+lEx23SrzeM3DEJioUOOJ+3eG+
	SzlTJGK9lBmob8Fn8zcOfh0kfGAsEuEi+1uLetgVfXilBUDiC0M7Eun3tuIpsMYyJiCKMVq9HXd
	jygFjvvoZgDfP8isNinbd4Ob6TCQe795eK1yMzR7+u+y8
X-Google-Smtp-Source: AGHT+IGNth9oSerkP6rAYgoEwMoe6KL9F9a2LImFw8iipYkxvb4dQmj4okAnUSdxaK0gh9AuCZGu0w==
X-Received: by 2002:a05:6402:520e:b0:61e:a890:aee6 with SMTP id 4fb4d7f45d1cf-6237a42fb5emr6064679a12.7.1757441925351;
        Tue, 09 Sep 2025 11:18:45 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018007casm1668531a12.35.2025.09.09.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:18:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.18
Date: Tue,  9 Sep 2025 20:18:41 +0200
Message-ID: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=QKAZhgwl8C9a3pJ24Kw/6R/+17cXSST9anu6lQ+Gwzc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowG+BZOESL0M4KVTSYey6u54mYycQfsFUzEvyQ
 SgmbY+SFAaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBvgQAKCRDBN2bmhouD
 13DFEACQ/DzLe8tGD51gCZ2sgoIL8ELCE3e1EmGSt7dS59c0+FRk92zaq9qdbaolAJgqy2GDO9y
 EZ2kcYxMZ/DU+ySaTAvCEJoxmTgf1sOyEEey3UI9mm1P4gxZ2UHuljxuOfWqHKD7PJJbdvQhJa3
 w00oN/TszoQ32k7fd8tK2uGpfuF74tRC8En7Cp2+DX5CEyTTeQ9URb3OUiIj5nVoVVxseFA+EtF
 IQiCrS7moxnrN9KTMEicM2PvpugJLsFwph1UL3oLWYnZYHSYC5DrY1MB6VuEBHTNrf93oct24Az
 6/1fKOgwxdc72ZRGKgM5dqV/espiu7hSsKGqxFFP21DmBqgCz9xTixDjrzAwoywL9xRHbgNVmyC
 /eH7AvrhdH4f0S5dz1kRCS9tJcs40CXOpJ4vaQ+gC/ThZtb+ySbtBhi+lIJ+5WxPQHq60llULSD
 C0mSILK1Btnuilf3BH8HIk/noRZMAWKA+U5mbROxRkyAIMcmMhqb9Ivj9dPXO3vjrRpDrZJv36g
 It+arAkoY8Ba+KaHZ9pDHbdFVsSNQNCgUwaNEHVbw+48bUeLUGcMY8UAF6+U7Vx0vlGmq2k/Yve
 Xj25uLN+NhKvc9syIAjR73z8R9QRhE2w+oSW0HztC9bD5EF3MAiQltNpzYR49mlCKqBZIEPLAaz ACETqPzn7WNXDVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111847_345067_777C78E6 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.18

for you to fetch changes up to d37db94b078197ec4be1cadebbfd7bf144e3c5e4:

  dt-bindings: pinctrl: samsung: Drop S3C2410 (2025-09-02 12:31:25 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.18

1. Add pin controller drivers for new Axis ARTPEC-8 SoC.  The SoC shares
   all main blocks, including the pin controller, with Samsung SoC, so
   same drivers and bindings are used.

2. Drop remaining support for Samsung S3C2410 SoC pin controllers.  The
   actual SoC support was removed in January 2023, so this is just
   remaining cleanup.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      pinctrl: samsung: Drop unused S3C24xx driver data
      dt-bindings: pinctrl: samsung: Drop S3C2410

SeonGu Kang (2):
      dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      pinctrl: samsung: Add ARTPEC-8 SoC specific configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  | 19 +-------
 .../bindings/pinctrl/samsung,pinctrl.yaml          |  5 +--
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 50 ++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           | 10 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |  5 +--
 6 files changed, 65 insertions(+), 26 deletions(-)

