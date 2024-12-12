Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59199E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V+aAXEtiKhZgITVnlfDN7uVlfTiNthjBcG1kR+vyvKc=; b=uNjrk6xPGGAsUF
	vknVhW1yNaMDXyElVVRcF4Mmkgx1KKtpUoDgB458fgrzLcspUEf7I3yWVHtXMfx9gTnx3pZeDbri3
	XFyibfkpIYzDwvo6h8kLXc6mJ5kV+wg829DvaUPkk7agS+LKjGceVo4H9dSRZ8D48XaOylq/TzZew
	kG/27HqScGuEcB13s/3sRXqRgbjcqjQdclK/0D86LI5oFATxis76I/KSpzG6LyV4MvuQ0rSrdEAQ7
	Uxee+fB4ZrTaKd8Q8cuTnk4K1hiBVcgJm81IrCOqi24Yit1CXUsZWrHkpMa/A3I4LIOzOdf+34B+L
	n6j1Et06Rqwr8ciWg0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlUO-00000000pYC-3sDx;
	Thu, 12 Dec 2024 15:52:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlM9-00000000ndJ-0zQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:44:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso8221335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018239; x=1734623039; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+aAXEtiKhZgITVnlfDN7uVlfTiNthjBcG1kR+vyvKc=;
        b=PQNhOLIQ/LmeV9epqveK7hgwZNkGOnS76TevkD6xeyxGe54m+h7OmDpqMbTG6FPBrk
         N0IdXqz7qyMj+B3yefUP09zfSpoBLdiuoaJYp79c0RzimmfEF4lB1B7olLKFy7BvRH1U
         ASE8nfMuViNSgkIL9ne5B7bNt5m56ohW/KBQBCGZbrppU2r8wClnuL9hrGTbApFvbl6z
         YImmIeNrVDp/52NsfbIJRaztZOp0FG41W0ruU+Or+/XdB4iwcOM+iA/4SAK1KHPkQ4pV
         T2bsK11Qtr7pzHZboCxBOoUpddpTJuosFeFMj3SG0Mol6Lpa8eFbOcHjqsogO5XJAdUd
         m7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018239; x=1734623039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+aAXEtiKhZgITVnlfDN7uVlfTiNthjBcG1kR+vyvKc=;
        b=jbEt1m9ZwAO5MAtrw/xZnEXP8zsG/7qj84w/ySm7oFHNyULlTq/VDcs8N+ageNhn7S
         EwjjdhMRI6XkBUBZaxJ5/mK/YTjjzqLPsC0PfwcD16eUHi0rigsHq5EZ9CiqrXZKQZZC
         7mTGnkmekZSQuC4WvXidzdL1Ge3nLATAgZvGt64GGKr3dhFC/bn8EB93GC45+/6DL12p
         msWlvf3ixt5K7piSSLMVKk7I9lmJqrbV9h+mm+/3fYLiRX40/5REz7TvdLzadhFeJPT1
         oID16yN3QnIWD95R73sTK15rKBM2ICzYsXKt0qESIjuH4uOsOV3ZD+Vxwp4fBT9RvivH
         mxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrHHN4/7+1uB7V2qEdaqQslsXEpcIO0ymcdAcql9gIaI+//l4cWa1CP2BEeY39hU4JyhbmPXZHTGF5cCQmiTr8@lists.infradead.org
X-Gm-Message-State: AOJu0YxvczKkBehTdHeciFQmQLiPPtQzl7hsY89v0Vz2HcfjGbVD6qtv
	jnw0ct59perl7HryEnud1D4AZDNRTgRLhwZUibIhNQyXKTUOdq1gWqCLNimJhq8=
X-Gm-Gg: ASbGncvYY+girb2aryz4NuLChGPB3BVCdA/JqcTavjC/S1SAPb8hUhesTctRIcmbqFk
	O7dDMG+gz8ySIfhD5+b5SSq39wUHBAxNaqmYOqTQUwbphkGZfsJVIZw58VXAhoRA+AEIBeekalZ
	0RnA5rbjvHwSjw+f0bnTOAvcycJbyhxv9/Rr0Bx1pWvANpoH7V52RGAI9bfWxGRALNGCKMBdS8c
	UmlSvrRSLdGcjXVlLok0+00G+37zhAnOoaYgNGzX+QeuiYRoWLKsAuUo5EZqQDtLQj7jtCkvXOS
	CzRK0OQSF7Ch1yLAzVCeMbg6IHFlbdiv8g==
X-Google-Smtp-Source: AGHT+IGQl4Z85AVTG7eUBC1nrNLIWFn7oDXenV6gUW5QnelGVJjm3D3cwfx7mwDbNfv9MIN+zuqTOw==
X-Received: by 2002:a05:600c:1e0b:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-43622827675mr33627055e9.5.1734018239353;
        Thu, 12 Dec 2024 07:43:59 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm19992375e9.9.2024.12.12.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:43:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/3] mailbox: add Samsung Exynos driver
Date: Thu, 12 Dec 2024 15:43:44 +0000
Message-Id: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAEW2cC/x3MPQqAMAxA4atIZgNtifhzFXGoGjVDtbRaBPHuF
 sdveO+ByEE4Qlc8EDhJlGPPoLKAabP7yihzNhhlSBtt0E7eYSK8fDwDW4duPG5sqak1KUWjqiC
 3PvAi9//th/f9AOGOsatnAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018238; l=2062;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=inxG5U01dwICaPn51/1LEiQE4F0yknkNINDgMxzkN1Q=;
 b=y7Ognb6ayQPqwvgD0Lmzmg/KIvR0LOshRRT/Qq1JDx+MdDTUxE+D2Vxxb/cIfuliW7U13lCnz
 eGFOcRSXwbQBAGbbIwa9LJ/hA9vDdp7sXQ+xW2AKj+qCSkJ/4BIfRCb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074401_322234_1CA5BB14 
X-CRM114-Status: GOOD (  11.90  )
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

The samsung exynos mailbox controller has 16 flag bits for hardware
interrupt generation and a shared register for passing mailbox messages.
When the controller is used by the ACPM protocol the shared register is
ignored and the mailbox controller acts as a doorbell. The controller
just raises the interrupt to APM after the ACPM protocol has written
the message to SRAM.

I mark this as v3 because it is a continuation of:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr() 

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's review comments

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: mailbox: add google,gs101-mbox bindings
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  79 +++++++++
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 184 +++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         |  14 ++
 6 files changed, 300 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


