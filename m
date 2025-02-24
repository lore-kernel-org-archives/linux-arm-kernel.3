Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F8C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zcxQ5Im6UgvOQisVqwrBvBr+aTDn+0rM0hX5qHkX9dI=; b=F7i766jaHYmBKg
	9XPEt1c+IJM9m3CrGyezRp7X1S9H2WQwshzYsu/MeIlFC01lFrxW/oJpkVSHeWzOu/eecowqsZxip
	c8AD7Gq0Kd4i07Ytjvq0dvKyHU49JB/1HgEyoldp2Biar2kKHcUsanrKK07Mo+vYFYgzOvQhUghRD
	Qm0hZclpqEjQPQYaqK1UNo+DqqUCelfwvFG1nKSG+AD85WWS4L9XB7rt4696hVLxYyzp/63teIKZF
	j6qLbi9Giyxg9EGEFkoMEXEv9CmQpka8wP37vmp0FLqfo8A2KgWlzFA2rBWF61MfpCKFPmw8m05yr
	muKOLh23bjlJu4vSoMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTQi-0000000CcXn-1XHm;
	Mon, 24 Feb 2025 08:03:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTPA-0000000CcK0-1UfP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:01:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so26896825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384090; x=1740988890; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcxQ5Im6UgvOQisVqwrBvBr+aTDn+0rM0hX5qHkX9dI=;
        b=cKJ96gHa3kgdcdyoXURkSPdF7hTC+aRqthPPAwVQNZztzUjuFmMl899n4inE0+trWV
         JG9iazxrt7UyeUWE251BJs37M3Xw5nZCfQJircmtIxZW8DGHi8myR6O6JMzN63SnzSff
         YO7GA0VTnjJJfVz3f2lG8oAY9iVSRogsswjX1MPmX8RjQpHwkTvkHlEvsJqsNeaqIICq
         ROtBQ9lmEqWR+84xqRv3BkkYH5u6sHSgELdmqYMnwmeZ6xxjMC8ZzhrbJ340h+MC0sFM
         6X/M1Pan2Wq/huGcJWvO5fSWR2j3FDNew9ayKDJiFlxoZVCgm2aL1bGqR29BZ55F7lqR
         934A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384090; x=1740988890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcxQ5Im6UgvOQisVqwrBvBr+aTDn+0rM0hX5qHkX9dI=;
        b=pWtKVSlCi/B9ZuBxP64PaIG2mLj1hURKT8gK+q6MHAfOZGWy+Azw+PeQPzN/ARGdHk
         X5a7S8BDNOeCREoIE8GI1zVO8ATNJDynwh1ctbU5bTed6eMIcxNyHpQhSpcgKqDxg5DZ
         95Sr8zvnGj04bXxJDg/qpwwiU+Y5MB5Cw84dv8w9mcMkgaUKqqBTBoHclX5VgQN3w88L
         8sBMOOAIi5HjKpoeCgh7W/O3UbXSK54DpEK3ks18tmOqu3DlhLgyWxOMtzRZduhTePu/
         fnUdR6I4s0TE1n6RStXwxF4VmU2qqqccyQvJjh5Jc5gn/kZ4IhwS9JE9H2xqzRdlXQvM
         nP0A==
X-Forwarded-Encrypted: i=1; AJvYcCXrb5Zh/pVjnGczhZgQWxQ2KVNjDzNkjU0vbPGcZdxnlvfaPOfwhf1zXve4WiBusYjovRP2fVrzTa6UuixZgQkS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8kb6acPGI5vmg3xMAkSrlqBlI6rcAbS+QoVDt4GVfppJz1ne5
	K6nLAUg515ewnaTGY3+kCAzvKKY86xobcQ/PPropYGflZZ7akWIgIxl8RRnjO7E=
X-Gm-Gg: ASbGncu3thQ8xwSHI/GhJ+UXSXMfO7/x3Xea6SykazhjNt4peOLecN/+tQhiDp5O9jO
	w6EVa4fHGJNy8/mciYzkWbUUvjH+g15C3B8jcx/n8qGcgYrfw/8WZVXeHXSh4vlaB6u9yeV2ET5
	lg6xtOpi0STPAzpXVZ+z5ItkNfi9Kqf/BIwvJK5C6fiQhN/xZXkx2AM4RANtu9GNpbivj40bsCD
	V2v6oEbymOPEG6Z793ALBzr/Q5UFIixPexVC2yPyZ69iWHYxMWH/ABwF/fNn2aTSDA70/SNO/10
	Va2FLvlD5nXYefgSiSdDGxeimBZ+pUAomtQdTIrdWuV1U7An90i0MUX/eyo1ml2E7/QAMDh1tj2
	eIhskbQ==
X-Google-Smtp-Source: AGHT+IEQEeyrw3EzcFeKThOAVt50oI16dNJaA/e4rE8vh2rZw03bfg7CZZRU42r2tScBKfk4Ik5kSg==
X-Received: by 2002:a05:600c:1d29:b0:439:9377:fa17 with SMTP id 5b1f17b1804b1-439ae1f4d07mr102577595e9.18.1740384090295;
        Mon, 24 Feb 2025 00:01:30 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:29 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] firmware: samsung: add ACPM debugfs support
Date: Mon, 24 Feb 2025 08:01:21 +0000
Message-Id: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEnvGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyND3cTkglzdlNSk0vS0Yt0UQ0uzFAOLVDMTMyMloJaCotS0zAqwcdG
 xtbUA9QyMw14AAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=1478;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oRQzRk5xTUcaDM5dqPMGTeTs7TwHysSopVPkeUpXl7I=;
 b=1GPC+AlVrtrDlXyCWt4XXvvUJ+mIw/T4ANo17j4HAMMd79u31gNY//b6q4lBP2v9rVAu+EB+W
 OQODBr0ljjYAzDnslBcQAMWVTXD5G4t+vNS28bvHbt8GTSFQI3av81S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_000132_445340_36BB17C8 
X-CRM114-Status: UNSURE (   8.43  )
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

The ACPM firmware saves debug information to SRAM. Add debugfs entries
in order to expose the ACPM logs.

acpm_framework/logb_gprio_level controls the ACPM print verbosity to
the SRAM log buffer. It encodes a 64 bit value, 4 bits for each of the
16 Plugin IDs, with verbosity levels from 0xf (log error) to
0x0 (log debug).

acpm_framework/log_level has a maximum value of 2 and controls which
SRAM log buffers are printed.

Finally, acpm_framework/acpm_debug_cmd provides a way to issue
ACPM DEBUG commands to the firmware.

Add ACPM debugfs support with the above capabilities.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      firmware: exynos-acpm: rename exynos-acpm.h to exynos-acpm-xfer.h
      firmware: exynos-acpm: move common structures to exynos-acpm.h
      firmware: samsung: add ACPM debugfs support

 drivers/firmware/samsung/Makefile              |   1 +
 drivers/firmware/samsung/exynos-acpm-debugfs.c | 359 +++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-pmic.c    |   2 +-
 drivers/firmware/samsung/exynos-acpm-xfer.h    |  23 ++
 drivers/firmware/samsung/exynos-acpm.c         |  61 ++---
 drivers/firmware/samsung/exynos-acpm.h         |  95 ++++++-
 6 files changed, 485 insertions(+), 56 deletions(-)
---
base-commit: f4d315a1f9d8fcaf608f283f01ce4d66160f44a1
change-id: 20250221-acpm-debugfs-d196d08e6462

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


