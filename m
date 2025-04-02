Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D93DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=; b=X6RtpFsU4GD/PI
	Cpca4BUDMZxXYSvuga7dFKQ6B/L3pXTvFun0iiDzqdYFnYPqDx3T3jeDdJe2GLw0fa3hSnzYefZKP
	4FrroctDVb2FHbFf/W1e5OeYajIyR9URpUxs26/vtPvarzyIfj/tQCKsEg3OIyNcDTOiO51JI9iWa
	Iv8tpoDZm02kSGq0PPi0UbeucgZHygiuv7fbIhw0Zokmaaj4XoWqt7YpcF2Iq8e/j4zTnZEF9jGr5
	NO1YXpACnek56qvG7MreB4E/2ilsGOGat1m94xGj/rCLkydAWGpSYYZmg314P9AVmNcbNZJZ+3n2Q
	l1Qi6ogd82bfsIejN29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzsI-00000006Umh-2wnG;
	Wed, 02 Apr 2025 15:19:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqW-00000006URZ-0x6r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3084617f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607058; x=1744211858; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=HLDbPQbsyn2FtU9kAuTYWZyoaT3vCfgI21UT859KuGr8qUuclFWHW1Z0OwaHZZ54Zj
         KkjCqKaJxXJLBWNAdBy42xLzvqm5FU1ljL9ZHYMsr33FGOuT/uvYCFcmhInGcf45TNQp
         L5Eo6VO5OadU6C4jV6nsbRE1wL5VT1OhThZpTjhRlMYen7wdq5oEDn+P4erY+sUo4RvH
         pu16mzMZbdWiNfCMcjTL7JU0TijKvbhtEYHpQpE3+4KwOgttcDJ6ZokTZ7gR7fZcPn03
         3nmEibmIkZMRY8gUqJObyD4BCsyRUNvmCH2LMj9QoiFbwc/HhgAxItXu6jeliExTxn7x
         vP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607058; x=1744211858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=VxOptUKXRTSdGtYp4mZo0qboBCJWJwvhQEDXZczPZc+RjQuGoSebEllx1yBoXUCOip
         6FaJtJ0PD4n+hHNdzon3Q4VYTwJIMXYmAjVV7Ia7qZ7WfvMF0BCavtLT3HA8T/McNmtd
         XPUu8uMTALmnUXdSa/RgRpoIeRByh3qjdNFVBRt6Fw3yeH2Axj5cdHcGQrl2k2ZKDDRu
         xA1WBwQ+uN6Snw58fwVbo64aUopAtwdHY1eDOKgvD1K1K74AUXZm+TGRIU5fXzVkbidZ
         eGk9836MUATMI58w8t3wPCphCJBj+flRQ+/gKTJ6pafzUMwAJ++Q9Wv0bFhUh8HvxboZ
         R4UA==
X-Gm-Message-State: AOJu0YzCXRhCPdSWhSrVcY4FLiy2ZKCdn2raO5qhEyvSZ6VkBv3+A3jM
	vfB0wCj/sxi0CkCp3iOiT6E9M3nRhy86Bs52IpARgEhgnhCqLp14wxyVDZS/1gk=
X-Gm-Gg: ASbGncv066+j3/9cK36gNIoPT0qnjFknJZY8989pc23rtYLxit0Z/JxeRgjD9EUUeSa
	xrFavi54zbz7Zu4Qa6zWAM7MAdZwfyur05LO9rzgwEg60tmWNeq1fNBpT3AjahqaIA6Yv2uFS2j
	JgP/ykrAmXyhbdwdrG4tJ0dC/aPAKkly4OQ+1hoswhrDN3jfJPivK9rk+VTms9K21O1O+hnsJcA
	Y9w5zr/1hBC6yX3IWDw90e2gfHpANW00BtZ2ChejPHBprUTrJRCg6I94bSjE59joesKXzuvNwUy
	xQSlc989e7gNZt0kd0rMmLSlA5qQx9hzR6JxvWUPlMRarlOL7gxWWhNkIo9qGgDAoWD1QIHZAQ=
	=
X-Google-Smtp-Source: AGHT+IGtw/YaMynhE0C3M4qaV2783kGrZos1104coVh6+inJZg+GE5x2GivvB2wyhudpC0AEWiHjvQ==
X-Received: by 2002:a5d:6d8d:0:b0:39a:ca04:3dff with SMTP id ffacd0b85a97d-39c1211805dmr13821255f8f.40.1743607057958;
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Wed, 02 Apr 2025 16:17:29 +0100
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlV7WcC/4XNQW7DIBCF4atErEsFM2OIs+o9qi7AHhIkCyxwr
 VaR716STVNFVpf/k+abq6hcIldxOlxF4TXWmFML83IQw8WlM8s4thagoFMalJxjGpYyyTAtQ06
 yftaZ0ygBEZ1GO9BIoh3PhUP8usPvH60vsS65fN//rPq2/kuuWirJ1vZKeXDHjt6mmFzJr7mcx
 c1c4ddBpXcdaI6zzKH3ngj9k4OPjtl1sDmhd55CMA6Inxx6dOyuQ82B0dqO6WgUmj/Otm0/Ix/
 uwJUBAAA=
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=NyHdU17b3BYKcxSflMYDwmeiHSv8J8KHGYTpcsjLvEc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUOIpQvmKF+MMYf64vqTmU0WTMgiEeFEpShA
 AynK1joXv+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDgAKCRDO6LjWAjRy
 uoeJD/4+BiSfIgPVMI5fRAx6Coxh8/ggZfvF1RkO524nX45fsdiIaMPS1QR+Y7a9CdVb6L4Q3HX
 V+NY7G4o32bDe69CQ20fjklp3fu/QwxXMMENII1Zebp3Mkwt0wAlkTGNwQ/cjsVvRZSlywJUehF
 r5cdRDOGh94HHVuyQST+GQ9u4oMxyoiBardHYbuCLytcuXeieBnVg96fbn/ETxeMdWAkeiBQCd2
 1AX8VGBu00u9VUf3OB4e4X6fVkrp/7wC3MZ3Ty45olPqDf6NOCnLesQp9An9aqKnDkB1i72Gg/X
 U/WsJcAmOLe+Rzw12qSgWtBRGLhCKv/pzfUKsVGzfPRnafo4WJc5fK74OKQg/gN2qzNAbdQ4hQI
 bv5+mDP+IkAigc1yjYm31kZuUnt0kk8iLq6jzznvbaUWBhbI9ir/Tl++qA2iM5+hf1OBzyfEvGd
 XVLwHGmbavNBjHtKWVUVOwVAyx6XPgr2koESdSNiArZ0hGZNiv9mu5HCZkJoxhbu2zlsTcPp2uJ
 DfvD6979BXD2CWh5UBwUz2o/5jJuzeFUYUZLcVO8l3Zcd2wa54LrTiS15RZoR59InWWGEMnH0sl
 +CMBzDDa2i7TdzdRkTWVqqmNTxoqJBRW+5MFzd3+NP0ZHremI3HWNzMsByood+77Rhz+Yz3R64V
 syq/O8iBenmJoaA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081740_279310_D2086D51 
X-CRM114-Status: GOOD (  15.23  )
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

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v6:
- Make drvdata->suspend/resume symmetrically reversed (Krzysztof)
- rebase on linux-next
- Link to v5: https://lore.kernel.org/r/20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org/

Changes in v5:
- Split drvdata suspend & resume callbacks into a dedicated patch (Krzysztof)
- Add comment about stable dependency (Krzysztof)
- Add back in {} braces (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org

Changes in v4:
- save->eint_fltcon1 is an argument to pr_debug(), not readl() change alignment accordingly (Andre)
- Link to v3: https://lore.kernel.org/r/20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org

Changes in v3:
- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 252 insertions(+), 151 deletions(-)
---
base-commit: cd37a617b4bfb43f84dbbf8058317b487f5203ae
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


