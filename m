Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD4AC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0j2cSu3NdVpMVKYyw9NJm/4tDS+f0TiyVQZ6Bh9mEhs=; b=s6DpH2XV7k+0n8
	IkG1bgHNwnyqJjIXsxXeEudCwAdvrI/awBYDn/pldO3FfQ4IqwUh/081d8wlbyHlzf582G67bDojo
	8oV41CYrO0X5j6uY3Y7Vsc11lvRkxoWVY0u0jDVMXnKioGi744ndRb9u7PjJ22ZzvNWMm/XEjo1c2
	9/9GWDM9MUDM40pvmhkupKnzlqdANV7czkhMXmW4Z2VxioAaB6n5rQz47V8tktTcRhmhz7HLw69n7
	FFjErJX1uxSf62E+v31ujomXdR3fkwsmQFx6DLH6/ScPJejHdsqOJ+nP7rQCyzU6uIkRf82HU0rZf
	C0hMFcxBXM7oiuzIbrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRe-0000000DRdy-3MMM;
	Thu, 19 Jun 2025 15:44:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDHk-0000000CqNr-3gnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:18:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a5257748e1so474141f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750331902; x=1750936702; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0j2cSu3NdVpMVKYyw9NJm/4tDS+f0TiyVQZ6Bh9mEhs=;
        b=XG07OeyAD0AdCjXScyOXRNwFSBftUiZzLw2iu+rXLi4ey8H8cLKAg4p13iVU0PrPyJ
         jYAPCQPodm4YkON+OZdxq7BSPpiWB+KN6e+ogDioQQrU0vfsDdGgZYGR8LRr7skF39co
         yoYlerE6MD2lOa+7/TSHxjc8ODB3q5D7uE9/nuP+lUWl0oM2d2l4VjEwrg81zgm5AGzQ
         BHCB4NtzpPCywbvgJm1KGMHeoz2f0CZqwiVu1lSBxiIqmkPySILLJDEsNFvxEZsr1P7t
         RWtcDH3xozo5KAIN+COFKinirl070y7qLGZvc0nYMU0hKNG3kFWwZ8vvYp/D7wTxzX75
         eHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331902; x=1750936702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j2cSu3NdVpMVKYyw9NJm/4tDS+f0TiyVQZ6Bh9mEhs=;
        b=KDJVl1y7yuyRevopF3tF0OZEheo7Mz6uTItP4QXc3UitBCEqQYYRF4jcfWjfXElkKE
         seyOUr8/xYjLNXrS+FTpQgJihj7C1FmJ6etSI4JBDaLGfEqcG3s7Sto2AIVTOfOsnCpM
         Ace6DRL8tXpzQqakSsRqXqlleebBvmV5SWPv6sA6DRc8Zt1XtinJ2QyGeukA5bwIXKaN
         YCp+FIgdZ99fRMRavqRdKNqKykWztbaN88GvNvew58IkOjv1c59mz2h0UlrHbpxRGVz1
         1laHu6UxX0g6ajoP1XSuoDk3L5OljSQV/YP5muEvdcmf+FSyo97BlaQPiFkrYYwLkSEq
         lgNw==
X-Gm-Message-State: AOJu0YyINug5u8zuLMBc2/XGYDgEcNJIWVA68ZVBA0Ff/DDldy8Z6fe5
	3kJtxspkL4HmrPQZqDaM3mzrcOtBHDc6xEgPCS3V5s5nyOfhBZoF8uupyZ4PRjOsS0M=
X-Gm-Gg: ASbGncuXpUzknI52QKO/ZAMU2M9ICQ2wd+kMNDaX+HW8WmyO4uQOaG8/s730Ge0QCM/
	okvIurcAiF7DIBdePHS7xmOjHJ1oIaj0jSRLTQnofaDlQD3Y5yHbiH9XwiT0Cw8lt4ySHn0TNyi
	muGpLb3HOg1jeTr/qNJwggcdeMTkVF8WE6xlRzkm2i6s++gmgmdfaux4X0YwQVV6vemK/ttxZoj
	eKsy5KxNq7etTUtrlM/hcf0EFK6UTbdCTIbKfJmQ+Jytx/Cl3tw6aoyeH4mWhQqq4/6BOZ2WVbe
	ZwMdmKatusYX5DxIMnInI9F8IXzr18AAEKxY0ER0R0hB1RZ9dwHvBmdorCzdzGngoRnDXtJCkmf
	8UbdQpYvJXc0qNbq6gYgbCHW+54Q=
X-Google-Smtp-Source: AGHT+IGwpV5p0m50gZC15PUFj3RIHD8e2fc5imI9ZePiRScXMe39Wj/psDyd7PdgqpyizfOuUnY4mA==
X-Received: by 2002:a05:6000:2483:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a5723a50dcmr17516019f8f.35.1750331902026;
        Thu, 19 Jun 2025 04:18:22 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm25674375e9.26.2025.06.19.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:18:21 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Date: Thu, 19 Jun 2025 12:18:14 +0100
Message-Id: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbxU2gC/x3MMQqAMAxA0atIZgNN0YJeRRxqjRrEKo2IIN7d4
 viG/x9QTsIKbfFA4ktU9phBZQFh8XFmlDEbrLG1cdTgrGQIWeKJm9cVfRWInB25GRzk6kg8yf0
 fu/59P7knebRhAAAA
X-Change-ID: 20250619-gs101-eint-mask-a4c1162de9b6
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=p1fLHj7WBxZzvDsPJQ4utwW8hjFuRfSNWUs+7XlQwHw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoU/H73aaGrTalZO8s2XRrswNZuD5hjSmpTXNun
 XZqkZQxQ8KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaFPx+wAKCRDO6LjWAjRy
 utDjD/9jioNxxKYtV9tUtqZXI3eK7B1WKAXFLrnUVJ8PlzLQVmGj6f9fzskWxdst8bePe1CEr/K
 +++kbEKCHhbeMXGyqspUYFtktkvBzr8sT9WWr+qByXu9eKXwsqlU33UPTt6nGz57Z1BO2t0hWlH
 yc0ZeDxnK12Zr1q7FAUUywe5XkxUFVevz/xpCVlELbQA0TGfKcpJiOU89f9vf4InxbNc6HZmdoR
 WP2lwAJCGDCcqVKGDLT0pI9AN0dP3oyyzSQq0JKFV0WRZettpIeXpJeW1cyh/79xJ49k47X1Pmh
 RZbwSUTowpa7L5fN5rvBztE0zJK8WZYTfVWN5SgDFhHGchmEWNXNpcQ20dSyhTSgG4RIzjwGPM7
 X7M7SScOZc7FxqTRLxCGi0DrQp/mcCfLW8tFSVNypVBfuzDgqO1Pu7f8qyLzCl882BUUj4lLCTI
 ADSDwZ4H5ejUFmiauusorMeTPZDU78OWroTv8PzkahQTZ5YfmMJUjgkYPEj32UM5vlkFSy3tI/2
 J4FXNH3bvDyORynih7Ayx4e2Om3exiitQYMg5iFMhRIpYHktqJEUeFebRxvCE57jSQSJUrQgBeo
 TGYh8kbwD3jSIxCLTm9cBsyEbOJYK41aD4JLQXv0lSkb2+A4GJ/Q6Qacztm2XkJe0E/P72X3mdF
 eUMFnkEhlIs6amQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_041824_921866_25B12E0F 
X-CRM114-Status: GOOD (  11.82  )
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

The following series adds support for programming the gs101
EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
3 EINT_WAKEUP_MASK registers

EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]

This is achieved by adding gs101 specific callbacks and a dedicated
gs101_wkup_irq_chip struct which is triggered from the existing
google,gs101-wakeup-eint compatible.

This code path can be tested  using:
echo mem > /sys/power/state

With the functional CPU hotplug, this brings us another step closer to
having functional suspend to RAM upstream.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      pinctrl: samsung: add support for gs101 wakeup mask programming

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 100 +++++++++++++++++++++----
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   4 +
 include/linux/soc/samsung/exynos-regs-pmu.h    |   1 +
 4 files changed, 95 insertions(+), 16 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250619-gs101-eint-mask-a4c1162de9b6

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


