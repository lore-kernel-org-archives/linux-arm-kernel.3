Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38886CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/6FZTn1uDz0N1c7PIwvbk3rD0JkNh6yzne9kAdOtgfI=; b=NGk3tAp+Q5PbkQ
	RKlCuLRUF+Uq7OdzmBh2y4ZODCE5YL8DUYCLAkBjmXlNFa0e/vqI8EwoV9LD50K7pqVErTCLc+Ylm
	o2QdVOXLXeCLvfO9mW106xLolgg+ZEJ/vQ1Qmedi8il+BZGhgE/88d/J4ehqk3DakL+g9ro6LlOwP
	JgO98j+fdplQR0Xct6jaVOroRRH8aAR8C8hSAU6GQegLyroV83FBtvil0T6wIAGhFzZo2sOytkNeL
	qgl5twC72IGPrsbtWQ0H+fyzOt5+B3Xpt1W8r0jQpcGWbmQD6DXDXzlaymNYvctOn0Xjin72mz8VI
	52O7tTZvcbn8CT6Dc+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIe-0000000AdpE-2M2u;
	Sun, 03 May 2026 08:35:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIb-0000000AdoV-2VVj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 08:35:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824c9da9928so1350079b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797336; x=1778402136; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6FZTn1uDz0N1c7PIwvbk3rD0JkNh6yzne9kAdOtgfI=;
        b=enG3OmDZTQV9saxi2YmkkdX642OEFrnUIvlm+wQ3BYViTERUCqSyxqVglvI+wn0vGp
         nE9Le0gCeXHZ0iUz66f+tXYoxJvtC9AGo+zfxiQSFT2IizEANeIGutdFkcnGaHmrQAs5
         hXLdmZSCgiyXoM8KFyiv1FAO8CYm5WgzQY4Ti/+/1/A9z8YDGeMHo5Du+Ld90X3r6FEQ
         k4ihRK3Uaed5C25Vzv+Z4nCRKkGm6B1gmFej37DA5INX7O2DyLyr56UPWhcRgC3nicZh
         MxbOMc+lv4UMgU4gNQhUFzYmeBwj21eK5+Dc9RGAD5CNBIqk5xk6IaoZd82i9TsAE6sw
         pP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797336; x=1778402136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6FZTn1uDz0N1c7PIwvbk3rD0JkNh6yzne9kAdOtgfI=;
        b=R+Z5koZoIr8pgAurv5SQ89yy5iQeucoOwqijP592Lypf9uOHJ/WkBBQtJAoMaWzlvs
         dtGkmKv4OH6jwwvw986LcOGSj0YaJUjp4glV9fBrSFvebiWWEwjNQxT2Mysp7du/tF7+
         FDal+cXJlGe0DpSQjLaOHQ+SV/yKUYygOlvacT8KUUkUrn2SKyGKTjDjcoNS85O5IXqY
         upBuVC8HcjGRWe8llnFJMS+Kb9GFQso+v6z4FJf+V35f7R1Y0sicPqvwcCLHpxKksGTZ
         hjreQ5UMS5bTggu+UHMgpJmTsHemi3Q+wiutDl/AWk47+hd5xkmGV5ztfvv/miSnu/5m
         YpyA==
X-Forwarded-Encrypted: i=1; AFNElJ9JqgNPm643+gl7RBZ19M5m+AfD21GBgZlslfz1v24VOdeGR/ArkDHB3di/QlhqbN5MoOJf3i3nTyiTQvucCofU@lists.infradead.org
X-Gm-Message-State: AOJu0YwtlHvkddkx7qm+vXSVpz6PjPNBIhY1lOUuFv2M1Nvx+A+GutLz
	yYTMfX+J47k2ozLXIoBMnB24dxLTs0hjNqD+W6wdipZrbD1Gxz3DH4ob
X-Gm-Gg: AeBDiesZ2cWJ7dUR78jB5dUyonQyslTWHxGW1vijiwUb/0pfzGzerojZuOBrdKloJLn
	fiRfYBzSCfJpMvkF3TIKjdjuQU96Qk5WupZnrm2ZvpslszvrtCbBn3wlH49UUOlWHShVh4C4bD9
	BlbEzVXa1jz0Rc93LJDmVr/GrnJM/N+Otp+89sgloyq0hfUo1vCSFMhk4lHTMYWbYBtTEn+2fsN
	7+WFKJghsqm92X5feag3awFtlJeqfSDbwH5b7wiH8dr7hWqXlVkNh8S9R4TUFXwebOhk79PcTCN
	OBMXeGPxBUdVNgyqlEjLIT/LaKT3XsP4DqpkSCHHQ2XhXduhRnjzLWEv48Ls843hUECThTw8FDO
	M8p+MOhz2zRnkB+Zj1he+ZIpqr/LQb4urp70zsbt2vyD/jubcNI/ZK4ue536Qv4ssC/z4CqkXld
	OKPXbkPtHGLxuiQt3+sdlN6A5UCN4Je6JlWczDUdae7f/iLn9B41HdGi4=
X-Received: by 2002:a05:6a00:a88e:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8352d164430mr5171642b3a.16.1777797336292;
        Sun, 03 May 2026 01:35:36 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-835446b1b0asm1578142b3a.8.2026.05.03.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:35:35 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Sun, 03 May 2026 08:35:28 +0000
Message-Id: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAI92kC/zXMSw7CIBSF4a00dyyGZxVH7sN0QCi0N5HSQEM0D
 XsXaxz+JyffDtkldBlu3Q7JFcwYlxb81IGdzTI5gmNr4JT3VPALyRsJwRKraW9Grby/CmjnNTm
 PrwN6DK1nzFtM78Mt7Lv+CEn1nyiMMCKtkoIzK5RQ9ykYfJ5tDDDUWj93hWQOnAAAAA==
X-Change-ID: 20260327-st-mmc-c906ad95ff83
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_013537_647880_7D0EE746 
X-CRM114-Status: GOOD (  11.02  )
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

This patch series converts the legacy text-based Device Tree binding for
STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.

Note:
The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
depends on the patch "arm: dts: st: align node patterns with established
convention". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align node patterns with established convention
      dt-bindings: mmc: st,sdhci: convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  93 +++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 3 files changed, 95 insertions(+), 112 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>


