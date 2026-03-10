Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E0F3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zu+81jDXj9d0HvQyIrVJEIl9QbnoaIQZGWZhl1u/pfQ=; b=vginB9gAEsc71l
	7QHLIvbxuO7JNEjAUCK9lV0IE9TpV4GBX8k57Z1R6XQQC9TzOznJxfyzl9WnJrv4wWxA53yyczg1O
	6LPMGGcO10YWljo8W99998Ua524RtrOb81yQh/ds89h+tsnmdi94EQjN/1Bdu6jUSjxjI/u6/uDyR
	6GEEh+tv1Ri3Yg2H7Kk5otdxkFZpqBw+GO2ouMS6X5EQlW1Pgah2PlVSvwaHPjYB+wBSsGjrvRJbR
	s+ttWuGPw8WpZxuQ9flEvCn+tHjfvyiM9zMpDRPlHQqdcSlVQp/NPSlwPVYsIpBh5WUfinpjHiTBd
	rgOwBRCEMGB444Sudlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztio-0000000989h-1zaG;
	Tue, 10 Mar 2026 09:49:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztim-0000000989A-1mYS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:49:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aaed195901so58123795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136188; x=1773740988; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zu+81jDXj9d0HvQyIrVJEIl9QbnoaIQZGWZhl1u/pfQ=;
        b=dPyr7Cve16ttieMgFTM4J5QHnsMSyvbGsU8m7YKDtFTgaZo5jv9QLmHYNsd8y7nYm3
         YQoVOQyhSeKCmggDTtYglrN9QkEB173dBIwW7P2/hq8uozzylGHzT7PFGjusokGsuw7y
         6g3aySfr1Yjrqp4xYp7XDxtwaJbMPH238xkMNZTKnhqlro8E5gugQCyCgDh2+mVESGeF
         zDwHTh0IsP6mn1QjBsx85CG0V7HDjZB4FUOdbKFMcPWJkXR33UrLoeTBzSsiKNizkBkT
         40s6kNmJ9mI9rf1/y1Eoyj5iW+kjVzpXPbCdOgOx6lMd/0D/ytVXeVVNJj0ANR0dqD/R
         6dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136188; x=1773740988;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu+81jDXj9d0HvQyIrVJEIl9QbnoaIQZGWZhl1u/pfQ=;
        b=Oa1/vJkSHsCtXiqoi6erOWfA4ekdRqs7KElRbTDNs/tBHo38BT9fO9knlZcUO5ovGG
         UJCc9/AmDXcwtb7FF3y9keTyQMQzyxXnQ7AL+2TTAEa+SH/+zcbIBvLOzpBny234kSIq
         Q4U4lqzupGIsvjrhmIxEjk1GuHAWbjbb9L676hmtENqa2HDBtZsjw3aVrCIoKHKqVQwY
         Uh+EhQw5ChsC+VGfykWOvwmVhcHyb1N/OHoMMBGu3ijDCrP1HewF0n+ddwOkchiEWXl7
         wwvzHI71PvuUxD0BFxZIrPtcLDKGejjDSIJgSFVkAcAZ85f4U2d9DTOt1aAXBNJ9rY0e
         vG1g==
X-Forwarded-Encrypted: i=1; AJvYcCUgEM2ui4pTlCJfMZYv+pAdx3EitE6taB9BSDPwg2yu/kxju2bRGAq6Gs2BnYkChb5GJYXDWMi6pMG1auVszeMW@lists.infradead.org
X-Gm-Message-State: AOJu0YxXH6ChsabubM3vk2MccECVa3J5HIU3zjyDQtQA2dduT+iaRjwW
	7HU+MbD3a8rcnavNWjMekif8ZQhVCUpAxsIbkU5VPYdWIeWytxlm8YwY
X-Gm-Gg: ATEYQzxkxTRg/HdIYoVVArV35ST7soyYm3DDan9Cx8KsWz2jy8SIJaxamznj+qw7J0j
	F5e5rX3odWzlqjHg1lL0ucb3pOZxXaSCnLE/IeO8pWIKDHo/GU5uJAWj5sVilPWuMgP8UFSktQW
	jd3oG3ZoL7sIWTx/R1crTSEQF3ScDDOSE9lpE5sw7Q82R5qQVsXMY7uxpVMgWdXPLqj8C28uRC8
	UwpI+N02nmSZRxUvcDwnZ6UuFM51YH9dNoKFnGJ4ijTDRKClowwbIAGpfCsKyClT+1oXT2xHk2y
	zQleKmiHynr3PB0HYlvnEGxhSSb+rXTrvzLrbnS6n0xppt8uIn17bXpV7zjUeQAHFj2FcUY4czP
	pbL9F3WwcLmqPIaGvBCdNyst13/kD53Vbepa+0znez8XHkkQJh60f7El0PdEAW8gH++oWReLj8G
	O8/2jNQUq0hkXkNsYDmwk=
X-Received: by 2002:a17:903:ac4:b0:2ad:c66d:ad06 with SMTP id d9443c01a7336-2ae8249420dmr139061195ad.47.1773136187586;
        Tue, 10 Mar 2026 02:49:47 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8a67esm199459775ad.61.2026.03.10.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:49:47 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH v3 0/3] ARM: dts: aspeed: anacapa: SGPIO updates and
 interrupt wiring
Date: Tue, 10 Mar 2026 17:49:34 +0800
Message-Id: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC7pr2kC/33NwQqDMAyA4VcZPa+jrbOWnfYeY4e0jRqYVlopG
 +K7r3ryMHYJ/IF8WVjCSJjY7bSwiJkShbFEdT4x18PYISdfmimhtCiDwwgOJuB+Tjx1EwWOVxQ
 Waqecr1m5myK29N7Nx7N0T2kO8bO/yHLb/tOy5JJDBY0VVpimFfduAHpdXBjYpmV1EJT+Jagit
 L7RRhkttTVHYV3XL7rXCx/0AAAA
X-Change-ID: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773136185; l=2227;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=lwETLfhCTVcdz3eoaOCi8pmBQa817MjhbI42mJmTS9Q=;
 b=LwoyJoDM1URyDCkYkC0JUVd7eMBMGf8tVEmyKmbEUcD16BHR0o1X7SOg7DN8/xLhhWQiT3Ltf
 us/voIpeqrgAPzOsY0DDAabHvVGhmc7iovEZ4O09xR7b5la/jWLu3Yo
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024948_470576_6CF77E59 
X-CRM114-Status: GOOD (  12.94  )
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

This series updates the SGPIO-related device tree definitions for the
Facebook Anacapa BMC platform.

The original change was submitted as a single patch. Based on reviewer
feedback, the update has been split into three logical patches to
separate concerns and improve reviewability:

1. Fix SGPIOM0 GPIO line naming for the RMC leak detect signal.
   This patch corrects the placement of LEAK_DETECT_RMC_N without
   changing functionality.

2. Update SGPIO GPIO line names and mappings.
   This patch reworks SGPIOM0 GPIO line names and signal assignments to
   match the current hardware wiring, improving correctness and clarity.

3. Add SGPIO interrupt wiring for PCA9555 GPIO expanders.
   This patch connects the PCA9555 gpio@24 nodes to the SGPIO interrupt
   controller to enable proper interrupt handling.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v3:
- Split the original patch into three smaller patches based on reviewer feedback.
- Remove references to external documents from commit messages. 
- Link to v2: https://lore.kernel.org/r/20260226-anacapa-dts-sgpio-v2-1-fd76828616b8@gmail.com

Changes in v2:
- Add interrupt-parent and interrupts properties to PCA9555 nodes to
  enable proper interrupt handling required by phosphor-gpio-monitor.
- Clarify DFT motivation in the commit message and mention the source
  mapping (Helios_SGPIO_BIT_MAP.xlsx rev: 2026-02-16).
- Minor wording cleanups in the commit message (line names vs. mappings).
- Rebase onto the latest tree to account for intervening commits.
- Link to v1: https://lore.kernel.org/r/20260202-anacapa-dts-sgpio-v1-1-a3a7b0b087f0@gmail.com

---
Colin Huang (3):
      ARM: dts: aspeed: anacapa: fix SGPIOM0 GPIO line naming for RMC leak detect
      ARM: dts: aspeed: anacapa: update SGPIO mappings for DFT integration
      ARM: dts: aspeed: anacapa: add SGPIO interrupt to PCA9555

 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 149 ++++++++++++---------
 1 file changed, 89 insertions(+), 60 deletions(-)
---
base-commit: 710dbb13377c80a6e39ef049a517665841e3221e
change-id: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


