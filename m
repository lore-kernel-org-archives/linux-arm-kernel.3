Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DBAC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CJkjTMnEfLvNmWFsl6YSzd8cXiPBAKu28vg9VmO1beI=; b=op/uaohe/1g5+V
	u/dvzRSaSyMd3LXdC65wZbOm16F8mlh49fQI7MAzrzWb/mFjsMM2tQ5I5RRzIj7WGP6dW9481+oe6
	Qq3MrMRafloBc8UdS/u3BIze48FZTeOKEQqc1BEMVNnjeoYBTO1DibLM5miDaj0Au8L9P/M1mS+yw
	o1ZRC5iXzVCzNaJJnjDykwbYbH7aloGemAxfWKq/meOoPEitEoz3rQ+MDW1QWSIrkAwevQl/RYSc9
	nUhWwd5dPuURuGq0qaUPnWB29w/s4KWUEnU/VoOSUSzpxtHJWA4SVF0sUbzwurZMGPVrcx5unZjfv
	uuQqctbWxFhYFABUGKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYJ-00000009a81-3FrF;
	Wed, 16 Sep 2026 15:28:03 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYH-00000009a6k-1G3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:03 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f88so621973f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572479; x=1790177279; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CJkjTMnEfLvNmWFsl6YSzd8cXiPBAKu28vg9VmO1beI=;
        b=RHUwDOHId4G7UD+lW7JDuwFqVe7lkQkS1QyGNQvhpwKKJf8gNoD4xcxHUuAAQMoq+z
         EU+LvDKERdnikLAObJ95gDsPYivA2ZsZUAj0/UU7HLwtfmggIP2FdNAd7WkPQUOmqmQM
         pdNRi5vSOVr0MpfFR7679ExkWl2NWieBS7qFUHg55xb3ZejoVO2zC/9Xf2VfynihUpUU
         7BzoiYaLXiUQy2poCceRbpJ/9INnVRnJIjUZ8AFVoHUI1htIInZu91DorkyRtrqGqB0e
         62m2Y0NTG3GUERlxXiZEBLDPObf3eNUtGdqDZzINLk0cdLaeAV2IjRIgeMHlINoo0sug
         U7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572479; x=1790177279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJkjTMnEfLvNmWFsl6YSzd8cXiPBAKu28vg9VmO1beI=;
        b=bek8JySVrK7Iepnb06dMMuYEY5Fvspv6D4XOKVUZuEAgxatXRq4SoS/cv2Wx1nMFdR
         eJUySMkJu2G+bZeW0YE7m7SXp9IFCpWisn3yBpo3zQsz3p76HsktZwRX+SchPMu4sM8R
         +uPdK8/IkSaKhgAg8BW07jqRe3SWjfRbJNb60x5YNg2lBuNNHsoA5skt/ZuaKQ50RCE3
         gSLJUDfz7W2pq2IWY0PrLMNBLzXo5s58ihFV+xgf7BnlGXj06WGi6Z1T+Gq/Bscj11x+
         4m547lK8Aek9rOX/MhQJAUaYy1yVfMUsThSRhXuz8zoMDAcZP+bUf52N/qKJ1cBRMpJ7
         mF4A==
X-Forwarded-Encrypted: i=1; AKwUvBwraPbNtymqxUjrNb/0H3Ve6qST285wXbXGvQWeFNcBz0Ep8d4myj2tu10B+iSMQ4KAY0EJBWkhw6ftSMPntjDp@lists.infradead.org
X-Gm-Message-State: AFuF++no07Ad5omHZYF4Q7o4VZzXOEbzB6STGwjpmEksdWu+y9VALObf
	QvSTrJsCVaEta13MTpl9YjkqhJufaCIH1e7mW8o7V7XJRUSqfrCCWlvvBGZE9+7FibE=
X-Gm-Gg: AYBFou3uiIBgWIjuweM/GsW1A4wT7iAMXylfzik1+pwiSJtrHxhBYzQtlVjmnXX5cfm
	tEXoN9ATiUb+6fnCZ7K9QzMKKtK7faJr87NXILGf0TczsgjR5ulYuUzHzLG1d9VDsVbEtcYb/rR
	P6en4iKVV9GcyV0QYka4sJvUuW6bWaoMzyYgrplsO3mwB/oMdhNTCbEkLsJmjYvbaZMSlFkto0Q
	Hbl2sOdZIyq9gkNStORNP39rxtJT8J3YRu4mqaaX5R3yILIQ6berIn83rDVlJSWb37X9s1ri9K1
	+bjM2IBF74IhYNvDshowopzLFv1MRXP7Dpwia+h6cLKbji3Hh+E/b6KLmyvm7xZ5SXgIsaxexNg
	IzIde7cSPSX63NuVY54cRTiaRkCEIPo5KFNDoM234OPxZ1GBUIzkr2WS9o4LCrUm9rtIJcnP0+4
	e/aqhzfon14GsrXIrX1KkQ2OKE/oo2qfEfAcHkmEF4+X1ZzhDjHxbYBmG6zZVAFmJeEYKIgOvst
	T2NcCJI32Q6P2Q=
X-Received: by 2002:a05:6000:4711:b0:487:fb0:9ff with SMTP id ffacd0b85a97d-4870fb00af5mr2859979f8f.22.1789572479446;
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:58 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v3 0/4] dmaengine: use designated initializers for
 acpi_device_id
Date: Wed, 16 Sep 2026 16:27:53 +0100
Message-Id: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHm1qmoC/3XNQQ6DIBQE0KsY1sUgUo1deY+mC4Sv/jYFA0raG
 O9esBsX7XKSmTcr8eAQPLlkK3EQ0KM1MZSnjKhRmgEo6pgJZ7xiDRNUqgmpfkoKUEitRSdBAIn
 1yUGPr5263r7ZL90d1Jz2qTGin61771+hSL0fbCgoo6xXqip1dY5+O48wWKsnMMOCJlc2Xx4kP
 QR+NOqDwXejByEZq5uG/zG2bfsApY1KIQEBAAA=
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=3080;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=xMf/gpDE3CEVf0a8x1oLHjdngryoYW8QqrujU/K+Ujk=;
 b=NLwmNsd6OiS/eQph+fKT6dNVFkkcujKQ6iNUzMupPtYl2RmhAB/8DTkDpNfrpQ4QhT2UlHYwZ
 7fydntIbbvnC4llPaRtFnpP4bi8ZQPGnT4IVI65ocFS9VbThSpJOgQ5
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082801_372336_3CB9B75C 
X-CRM114-Status: GOOD (  14.57  )
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

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore, 
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new 
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc2.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v3:
- Changed the title tag to dmaengine; added Reviewed-by from V2.
- Link to v2: https://patch.msgid.link/20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk

Changes in v2:
- Tidy up messages and wrapped at 75 chars; added Reviewed-bys from V1.
- Link to v1: https://patch.msgid.link/20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk

To: Viresh Kumar <vireshk@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
To: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org

---
Pawel Zalewski (4):
      dmaengine: dw: use designated initializers for acpi_device_id
      dmaengine: loongson: use named initializers for acpi_device_id
      dmaengine: qcom: use named initializers for acpi_device_id
      dmaengine: xgene-dma: use named initializers for acpi_device_id

 drivers/dma/dw/platform.c                    | 12 ++++++------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c |  4 ++--
 drivers/dma/qcom/hidma.c                     |  8 ++++----
 drivers/dma/xgene-dma.c                      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


