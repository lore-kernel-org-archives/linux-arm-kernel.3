Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FB5E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aB5cdeadV6hCwOqHqkeqnFHRRPrcOXD6QhSaEDTifao=; b=b1XJsZXI8YE+xM
	0PZ++YIcrWlvpr7gsJFm2DSac7uIfoWmfQl1FtNRU+ERcMCNE+BnJSSgo/BBDLlnyMd+ABrSAEeOu
	cWjTmTjDdSawfTRgj65p1inmsk+Fc9cVHpzX8tc6CtATW6TKRYyVyFKFu5+7LwJi+lk/4G6OyT6tg
	sQBaFCJK9uV1aSHMW3oEWLdOrNZRi+GF5qpYfQkKzXfrJJ2At/f/dirYg7lRejKwMPbVYbwl95tzK
	WNChkmmYj1+6I1w9b3AxYD6hIeqwJTwRotyXRE+4n5fX0CUZ6epupkiqLK8dw5AM0n/PNAwgqsZm4
	Efq6UQA/vVRqtZYeWmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUOX-0000000D2EX-1UY0;
	Tue, 17 Dec 2024 10:01:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU4N-0000000CxaH-1rEW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:40:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436281c8a38so33329285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428446; x=1735033246; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB5cdeadV6hCwOqHqkeqnFHRRPrcOXD6QhSaEDTifao=;
        b=gRzXaiZVTmbUjKNtbKWMfDzEI2DMliT8fCRudmK06N6aLzuP9qBihyUB/Jubq7lJ3C
         sv/FGTlhiXromhUK880MGLcBmjmX0viPxW5Zccbx4WR6Td0I4AVFbzxJqCBz2Rlejs1f
         oSdpyI8YCNgVqy3HWAPcSzbVvw9782+srFgpgWI+Hvd81XJIUufrZi6Pc8huan1M+ZMY
         pEqRMpl+P0HO/oCeVrtzkM2VpKNxk/SbIKmmmWofo5spMqNxBZHSMn/VFKpTbRM/WYUY
         5RcpIsXVMD1L7lOP1QYsnHCBo5Hq2HlrNq3PVFitFv3rcbvfnsJIl7djONg9sgOtTctN
         l/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428446; x=1735033246;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aB5cdeadV6hCwOqHqkeqnFHRRPrcOXD6QhSaEDTifao=;
        b=mIRiWLUMzukPPfUVbf1GnfO8HoCrpb13+v7VTNNdqSdAVg39n1twmr+vhn6KdzJzrK
         MbdiLuB5zfDlidNjoTSXwUWQibWybcDt+VAGNHXtN2ANrEZPSNIzybLw//38K56/9/ao
         Nydi49nveZi7RmNwm+FbRvOVEXHSdxRsFv/J8ms3Mc3OYAkYh4uLMvJxkefk4RWa3WQf
         UyOjf5lVMtFF4VtAuVPVeoDeRerAh4NoIUGVMcCHHju3RGW9JYXsgVYERHpsOyZy2SeR
         J1V4pQEJhR7IKcucjt7nuupJyFkrFxiWVQrg95FKgpfn+LM2Q4Q/RZuI6mpyGACeu/EP
         A+GA==
X-Forwarded-Encrypted: i=1; AJvYcCWxuVQpGnGOPAwSBX6pVKSbnXhAeV9+CSlu6Z4cKhGOJEEfImVe9O2ekdkMsJp0Y40qq0+WczEdWfGSrKu6OEnX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlr/O7cS4frfMaA78OkCe+R19vkLBd/DJ5TuQKzkQ+/GyHQ4BT
	ShJNrYarie3AuFb6CJdpXMjX16wILmXeq26yvs+t7Ujy986jE42iE/mL6yYzkJk=
X-Gm-Gg: ASbGncsyx2av4bO3ORTEnYhU6XI5bvKIS42HhFHK1Vy8vKm9TPyw+m/Vq42nBdIYN84
	4+0uR/z7IshFDy88c12KnsKfkCMEaqgonkaUl7KXdK8VcNfvkmWtI6UlQYE/9s+oYf6wzKDwR6/
	xicNs5eUytrgAshEuBfavpmjJ33NtLDNq13t8fgbNQpoHdxMHVfoksy9h0y0Q42pTqxagjW85MA
	xmj1ohi4g3JHgUM3lptlrE7pgki7DuJnwySLTcBhUwcFQGHNBwu5er/LoR16nuFkNHw5UaKRldY
	FJrt5gk1Md7aiTJJCuJ/N4/M5EOXSjkazA==
X-Google-Smtp-Source: AGHT+IFMPzbTWt1HkiEeugGyD0NbWrhqAxmzfxWPK1THCAUhCbVkXXzIU/nWMBLZuXZL1MeTGXgAYQ==
X-Received: by 2002:a05:600c:1906:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-4362aa42b9bmr179229525e9.10.1734428445814;
        Tue, 17 Dec 2024 01:40:45 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm167475755e9.20.2024.12.17.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:40:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/3] mailbox: add Samsung Exynos driver
Date: Tue, 17 Dec 2024 09:40:19 +0000
Message-Id: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARHYWcC/4WNQQqDMBBFryKz7pQYItWueo/iIupEBxojEysWy
 d2beoEu34P//gGRhCnCvThAaOPIYc5QXQroJzuPhDxkBq20KXWp0faLx83ge4mrkPXou7BjY+p
 baZQynaogbxchx/vZfbaZJ45rkM95s5mf/VfMQqHSrh6o0b2z7vHi2Uq4BhmhTSl9Ae8VCC67A
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734428445; l=2295;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=aqXs/GouKrhkgUshCq7lvESEEVCZFwMG74JU0NNq6zY=;
 b=V0N28bPBxuwqNn8Aji3OUsPBTYyftNw2zGFwhrQtFnRXAbFk6Vu1sP/bEGYpyY70C20d7sHhs
 +kce7NAcQ6WB7fLRsit3nSg+U5MV6iSAwYQfNKjAq0WnWq6fHwq51BH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014047_499394_18E3D685 
X-CRM114-Status: GOOD (  12.34  )
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

Changes in v5:
- fix dt-bindings by using the correct compatible name in the example
- drop redundand "bindings" from the dt-bindings patch subject
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr()
- Link to v3: https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

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
      dt-bindings: mailbox: add google,gs101-mbox
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
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


