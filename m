Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E1BCD3421
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YPkr/JoKjH8U6Lko6pTK2QTabDhqIIQDxw6EgSjYcZo=; b=2M7/tGRf2ixxTm
	xssD04xuvLBaaHeBC82MooaX7oYNxCVDIWcjxLbgNIAiJLnNF/YIIJ2E0HzfLTTZnxOBYuXkyLcND
	1Zw+jAVx9RBVAjgWIlW+b0JCbrxArw539bhL643chyGlFPOL0exnsqdgrjz5P0TF+DsWLuC8yFDo5
	4MKilA4JicVFX6x2KdsmiEonZWeHqGt4yDqKq5PnYfPl0Vd8/PwLU58IsHyjCXufpnjIg7btP5jxb
	zq6Syy/e9bxKMsbBpjOe1PpGuqv1vceNIkEw4oOvpMjU0kXQzlxBFAeRIzV15OhKuRFXqdB1NNALD
	ROb/SMl2yX8DC/PA5hPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDgl-00000009B4C-1IRt;
	Wed, 12 Nov 2025 16:27:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDgi-00000009B2V-1byy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:27:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47728f914a4so6859715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762964834; x=1763569634; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPkr/JoKjH8U6Lko6pTK2QTabDhqIIQDxw6EgSjYcZo=;
        b=xCNhwQjzhVPqpPSqIJozNnZV1SZG+qXZaFZ3mg6QrEDQIK5RL74QudQZtODgq+gTfM
         2yiCLJGENmT4/hldTyiN+9w7VIpg+jOs7yr00qdK1h5f3OWhLVjmTUFmR0E1wLTdr16Z
         BLiWliT+ME6cxllyyCVauDLK6xIERtKHDzRO7bI5BAOaCk3DROf/GLi80Jy2Zm7C0kfc
         oNgJZvbY5DVismYhHjrs4yUut6TndZNJH75eIlT6691m1noqs14oNPrnRjsQgNGutCH9
         kvfeDYIW/LwLiu5K2KSXORc7m0N7esMyZkaSXfa5W3/UO18TEV7C4DSGmHJVpRI/Ha16
         gxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964834; x=1763569634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPkr/JoKjH8U6Lko6pTK2QTabDhqIIQDxw6EgSjYcZo=;
        b=h6gogyyTiEUYghQhDa5NDorCgsdDBb8cqbJv4/AvNMqDtBAnFUFyYp1thCC1k2S+c3
         bBOjdf8Udo8Lu1iIwJ2QkGkJsOdJV1iljAIbrSLBXJq3LrNPIVu6BdrFLC9xgMUQO/HH
         OkukrCu3QLlvcmHufpzu2FsF+ob0ERJG4BKz7//uwkKOmtYNCS+73wp0qslpDKoNRFWv
         SDR7ewYE3kQ/bYYbaqfYdGv9OBK68OYSDxzqiKabkFc901CYUR1BNAmVdyXklZE4/MBd
         BNkRgEmexKXPEJ8w0lQnYKshXWDmr3uV3Qp4LWowV536inrXgBDBMHS5CsB8wA9oGRmX
         lDQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/0B2PgKVgJNhale8kR9ny9cAYJMeaxGvgfwstX3XOxVQDXI6QbbRkK77omuBPhh+RmQkemcCMJuOeCHRwbTYx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Er+NEI9ZWTXA6Y2b2PBv5/TTXdUbBhzbZ+nUc3zrYwFcJKtE
	xEWvBe7t8TyVBI0WoqyK76+7dQl5pCItpBrzhv+GYBHpikKOx7pHs0oOy7iFQ7FfFQo=
X-Gm-Gg: ASbGncvFE+lo7GLPv3W7QYf8FIeUsWL7Whn4GxPL/Xu5wWBlRyIOlKKRHMNCcXd96S5
	6mlmFMRtCRhsBxseThqV38S9JHF9H1cXTbOPsbvNuRTswt3XczFqVdIBp5qr+scwn/eoGcdJhWr
	m+RAWYv//ZlY6Ldk+GINH793b6kqDPGwMJO5/1IrSwbYEU0x6WHqbLw1WFo4M/e+Ib6iTPOYXn/
	njeWXZTjpjUqCNZX+uAu38+opRIjAbro1TXOblQMUE5HSf4b4rNSpmNuRyGF7NZhpgK9Fotm3t0
	ziV+NC+pPwa22ezVpavhQZXGPfa8FUGrnWiomFBJOz/dYRqoVmRb85fikPDc66XdsIV1a20xxYW
	LEXlp9qAPZQ41R4r7hAJBcD6bI9XxvCiiaUlKUrvpIIlwD5ldSMLsXK8IGyZNj8+Scw8vK4FtHx
	DUmXtNuIRZm9kERiCD9ys9fGWoPIa4dY8=
X-Google-Smtp-Source: AGHT+IGkEoN4sWg2lAUJ3rXUtrl89smNrKDWX680+800326hJYTJQMWhDrBhsVLjs3L/pc050EyNZw==
X-Received: by 2002:a05:600c:1c85:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47787000e64mr38038745e9.0.1762964834332;
        Wed, 12 Nov 2025 08:27:14 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e36ca3sm48534815e9.5.2025.11.12.08.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:27:13 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 0/2] Add new phy_notify_state() api
Date: Wed, 12 Nov 2025 16:27:05 +0000
Message-Id: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFm1FGkC/3XOQWrDMBAF0KsErSszM/JEdle9R8lCiSRb0FpGE
 qYm+O6RA20pSZd/4L8/V5FdCi6L18NVJLeEHOJUA78cxGU00+BksDULAmLQoOQ8rnKKJfhVzp+
 5mOKkBzob5o78kUUtzsn58HVH3081jyGXmNb7xoL7dedaBCACZOZGKUWoOklydsWlZkjB+zC9f
 YTJpNjENIgdWui7/O8vC0mQ/oLHHlrVI+oHQ/0aHT43VDXU2Rrugdla9WC0PwYi0lOjrYZGbXU
 H0FvkP8a2bTdj3YVgegEAAA==
X-Change-ID: 20250703-phy-notify-pmstate-f02ba5582f65
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2J28k+rkBGEIQnqpoey6EUz8XjM8ez1dZhEzYa6oxzE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFLVcYFXUfJuYXtUM4uyqJbaJ6Y1c9sCsE32zd
 GbAifZjux+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRS1XAAKCRDO6LjWAjRy
 uuElD/4upiReXgng0xFPts/n3ptS/LaaZKG8BuwXA9peTmNePtMCmrgipdYQQQsNQZT9JEnLwcE
 QeLVgaAbODCp1WU4xlw0FbDR8+OMJciud3OLA8iOEOJyFC2vulmkIsS2QIaQO55LJeRhV7L2Iuu
 qC0S6fV8h8R8NJhJS0eQmrvfOXcMt7X8QFWO83xULfVXJWokZws2c29b7EMmEVn1e5mXTXo8F/t
 HToMgLlEvniN5KzxOLHsP1JyOuO5Olv3CeN9T9aIsgu4g4MWOUNp9WcMiyctkWhteU+JCpU+7+1
 2hBbhq+w4MKQNZUwk+Zp29lg/GvHe3jKc8kBMigkZdMZj0PTC11GmRw32DUdefMIuQd009Cmq+C
 FmI11O9/5DbloYzPvg6YAqVY9a+161ADKITnyKyNG/gqk3fUvb1RMYXMcliZlmMi8Yk98/jlDzc
 YwhGGmuv7jM2/74e59posAroBT8heOInlLav7HBMLlOnBfB6FffTE58bhIxFbFu5ciQ+Iqutf6K
 KzVQoeGGKtmYv2cnxrTTBwgEMrqGpNnod3X+cN8WArmlhDOotvgoK8HP71X3l/l3SaXav6bvDus
 +SRPz7xb1rHLxLRZHelG9PmQrZwriY8z3QAQhfT5Z5M8StdtGAi9jmxfWYeappyFNvp7T2Hb3e0
 P1VM8WhxE15WVgg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_082716_459002_52FD54B2 
X-CRM114-Status: GOOD (  12.71  )
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

This series adds a new phy_notify_state() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired state which can't be
handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
need to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Fix typo phy_notify_phystate to phy_notify_state in phy.h (Russell)
- Link to v4: https://lore.kernel.org/r/20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org

Changes in v4:
- Add missing 'used' word in commit description (Vinod)
- Fix 0-day compiler warning
- Link to v3: https://lore.kernel.org/r/20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org

Changes in v3:
- Rename API to phy_notify_state(). (Mani/Neil)
- Remove inline kerneldoc comment (Mani)
- s/phy/PHY (Mani)
- peripheral specific enums in phy.h (Vinod)

- Link to v2: https://lore.kernel.org/r/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_state() api
      phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 ++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 ++++++
 include/linux/phy/phy.h               | 19 +++++++++++++++++
 5 files changed, 119 insertions(+)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


