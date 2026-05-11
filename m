Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAB9CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OY+ypXJEiq1cE5wHUAR3o/Pxpxd3IRXNAos4tZp/uec=; b=A3w7KsI5SQFxwlU3F6wc1zTp4G
	4tvK5+bkYR7Cp8z9KmC97Zsi6ELN7+cd+xzzwHDHiisUI0iYtPWsiReMKOIsFOhsMf+WWs0WUjSfR
	cIAvV2BxCQuRbBj/kfC3bL+ElzsQ1Eg62lVJCUT4NVRkeUKoLEmjyaodRk5lg0vSmYV/hioEtNgAa
	29y6FsupI9vnNfrPFOvPYndXZnWpLH6zWrnREU6dfZqvQq0dm5S+gxhclgiQmgQNhn00iynUf53Tv
	V5WL28wgn7ZhCzIk71Qs2VVyeO4y3SsDHwkiGvVIQlBKzK5bWndKEPxeRyKcuSfrYxBS7DEfVk8Qn
	MjWGih7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOQ-0000000EVtr-3rY2;
	Mon, 11 May 2026 18:30:14 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOP-0000000EVtB-0T3h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 18:30:14 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c80148ae949so1986005a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524212; x=1779129012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OY+ypXJEiq1cE5wHUAR3o/Pxpxd3IRXNAos4tZp/uec=;
        b=LoKwWbbelE25KFC4toTrAU4MXDmuOVN7PGOOV3SWbe/eG5IigsG0ikhwTyBF8np9Me
         673gTc1Fg2Zu7QZV6MnPIStuqMXzYu+XoxOuoO1KhEhl2Tr7rqvCaIhQ0Lxz+dRKTg2N
         AsNIP0kMthL4Wzi2fKKP0bWzWjhYwl9AvXaaayoIueyX5QytvtnyFqvT2BBx6Kk1rttF
         RETWMoQZE5kyFLKRWWpi1UTf5tBPN0xd1UmKPMOEauXeM+5Xx6XmEI2hsT/uLmY9Gkwb
         6ax7pUOMe1svUXYDzZQk47DLssMDMxVcRlJbd7DWgu0EuLsGl8hPbK8rt5Cz3yDCD0PZ
         0piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524212; x=1779129012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY+ypXJEiq1cE5wHUAR3o/Pxpxd3IRXNAos4tZp/uec=;
        b=B6aZ7r8KxgMSG8wi50QQjNCLJDocCxn7Y+b3gTgfX6xZ+T5sKLAgWZ0m/1waE/5jG/
         spPagK56HXbnGuraZlQ78llywU07FRXHU72ogu0IPBKU4EOdtVSfM66yC7WBk1r6/DwI
         2nnHhtUJyRd2HJog/J+sBXfYVlijPcp2cpojn+/FFEbuHIxPM9DS18QBSUvLd/FzGhMa
         4RNe8j912nR2D6wSyLW024YdwZwRM6RziUkJpeFo56D07NVst+/kY6lFF6xtxgryCpbL
         /l/JCVm93350uRvB3dfWcwdUsGbIpbRTCX/By1FZdPdos1EZMfgXZ7w1yqUq5PmmJV23
         XAPg==
X-Forwarded-Encrypted: i=1; AFNElJ8SdpqfBN1ZTDeH1hfVVb5gDaZj55x9EpkLJTjlEXFucptrPfcia+dUwBb/FsJS3B1fyaD53rwAFCac23SEO2Wl@lists.infradead.org
X-Gm-Message-State: AOJu0YycLzmqyYtmmV9nVG+UAEzgz2+lxgMb/49amJ818nieUltr4TUz
	IDrlUQulolEEYTUNhtwynvKm6eC7Algg31f6PvTsDCEjkBxQiTtTJqo9
X-Gm-Gg: Acq92OFMLWWO96fIYIAX58Usj8Bi1f3i8Okb1vdFeeVOc77kfTgy1Yxax/pP/2XyRZu
	NrSNmtaoNbrb+x298QDKLNIyqFkLHTA5xW/2kiPvEfwxgUfIWIjKRIClqWtFn8A50KKix3vUxSt
	dkE6Op4i8oDxcrk8d2q+AsRaNPdG/gYvyTggLA//mpOM6iINJDoWltRQZETw5m0328KUe+Pw3rL
	6WiMDqk6V/a3Fmk8ARXogeW1wyX5KHejlZ8ZVx6S+woTvuwXYHXQMZYdJZLhV9w4x4l/ASODYrn
	VzL3DpHy5I6KwmI/jhVzly5cAacaJemmfufAe2+Ysui3A9dRDEMf9kNArNMcWuvMqhacFR0a54e
	kSrWEqjhJ+ySyIwFN1uOHH5CjtoBwPC6+spNrWJXQcA0wD05inHxeUxsXZ5mQUB9eQCXtKA3JLn
	jrAOud0GW5wEcJM1u2KzagdBF2xP1VAJ/gjnaJL5Sa6HKCSpw=
X-Received: by 2002:a05:6a20:e212:b0:398:7ca0:43a9 with SMTP id adf61e73a8af0-3aa5abe73dcmr27159496637.36.1778524212149;
        Mon, 11 May 2026 11:30:12 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267697d5asm9476220a12.14.2026.05.11.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:30:11 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: linusw@kernel.org,
	afaerber@suse.de,
	mani@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 2/3] pinctrl: actions: fix SPDX comment style in header
Date: Tue, 12 May 2026 00:00:02 +0530
Message-Id: <20260511183002.228520-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_113013_156610_E146550F 
X-CRM114-Status: GOOD (  11.23  )
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

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-owl.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-owl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.h b/drivers/pinctrl/actions/pinctrl-owl.h
index dae2e8363fd..feee7ad7e27 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.h
+++ b/drivers/pinctrl/actions/pinctrl-owl.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * OWL SoC's Pinctrl definitions
  *
-- 
2.34.1


