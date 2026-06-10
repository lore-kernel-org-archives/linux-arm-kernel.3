Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675FCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pUH4vpTTcuqb8I5puK3jULXEG1NkGmpFTMLsVnbq6C8=; b=HzRCqHpww3BJ8w
	7/k4UDRWF7JARePFowQn+Enf9Efy5rP/wADnSNAI4Ep74NmtN6bUGCQ9jEGkhRNbX0jx1pDwZ8VGI
	MrVmGSJLqPunjZ9vIDYG8VnDVorz8Xf4ZKEz9GDVtKh7Kt8IqhN07kypXIl18wrmfVb4Yvknu1Hyf
	TC0CBviKibv8Anzn9HysZkLc4n22Z/E4z+YMyBElbf9jLvtRHNTuNQ5QuT6ZL4qnPn1D/7CvT6VjL
	TlMHR4EfWqdVhugLE6C+nhfhieuOYH4jsROzE0qbvzNa1wbiWmCpof12ZdhT1Su9utFBljAkIibKH
	Li/sMbDIlK05hijhfkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7cg-00000006cMk-2vO6;
	Wed, 10 Jun 2026 01:20:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7ce-00000006cMB-0VB0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 01:20:49 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c86214eead7so1429767a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 18:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054447; x=1781659247; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUH4vpTTcuqb8I5puK3jULXEG1NkGmpFTMLsVnbq6C8=;
        b=N8OfQOATx/vTmF7TTrhZLx4BY2Pwizhs/o1xWb3TCIOnMPTie0AJhwt9fvU7Ej2COP
         53azKtFdK/+rikpsJfAd6pvm6vIT4xN4dmPQKmVpWIeLXBckNeQZ6AxeZpZh6FfWvdGK
         EPOo1dujdtr0BFprnU9Gci0W4HNTCGVEA/f/3NeuOndDMoInldn4GzraLJZstzJ8oLGq
         3JtK/lOh0OWTzSxUrHSNEBnrdLhovkYMj1hc3tc4owIW0pTKAClbwKbKFfurX2Gh3+Cv
         xc5jcATLQGDDjax3WHlhE044z/rGkknYwm/FTv/Y80zEUpJVV2AE/H3F5jU3o9Hv32ES
         HGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054447; x=1781659247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUH4vpTTcuqb8I5puK3jULXEG1NkGmpFTMLsVnbq6C8=;
        b=o+5VKl7JeB/wTrue78hr0cRa651hBebQ+2DSdU7bVW/915dxKRtwhuUlE/j2EadX2G
         4RjBnUvqaIn3OuuXU2QiYik/0btAMP9D86JWDQZRJNkSFltUZaDIIYr/TWcvBfSh6d0U
         I4A1LkzaBHxNRJNYgDv2E4YcDvg21w8OCHavtNRQ2GRMZFRb3xoNTJDEO14hJo64OeYT
         v0CGXBKwosQUWz1xTzKz+6dhTyP3nOOVAnKLpaZuh6lcbsIrIoYgfEmCcPWAfU4pUC46
         m1twig7Y/H9ysR3WSol3fVHfw+1lsy640F1nzG6cm519hbsJc4cVm3LB+Xlh/VJ7NXRa
         QvFg==
X-Forwarded-Encrypted: i=1; AFNElJ+ylSOa0q50P4M2IIbBuM5CpInsK5ho0Pwz1ji/wXSUtI4GYW1+PIoN8vTwWYsAIcvDUHJitvuayLATe2NKVOsI@lists.infradead.org
X-Gm-Message-State: AOJu0YxAJybRqGYxXB4Xvr6ZsE7wKPpG7jphTS5zje/ncETyaURpB7Mo
	Q0LpVTu5wogfWvR6L2+JHn6FeM/Bs8T44NVN3VgouQ7AjSQ+Kg6tH5DS
X-Gm-Gg: Acq92OHmHk4Tz6ZEPDJhKAA+llXkOYsFrrWabc+VTUkrNfBxcVVcU42XezEdpfoD4Ae
	WAXN0V02E1dlXh9iXSsvb8hqoQxT57oDLtw1m0GeHOmJgjeB9n+/AWw7l6REv5m+4s3fPaQdIGA
	Qind2yZdPVaeFsIQcYV/bZ8QiuR03ntaiQiQ23HflP5OBQVRazibPXd2GK/GAJ765UvTfSGMiDR
	GVSVV2AVWZqOm4LWssCsKeOgP9HqU5sQD84M75ShKpbt4XQHSx84kJz0CEQfDSkaeA2MdCjTA62
	d3FP7cCSP6vioZ4pRONRaKtYh2rxtKDFafE+q4E8iNabSc3b9rRQ61VDWpEndKFNtw+ue1TXj2p
	5YIhCPZBH/bpdqjLgTZ6zl1ErkQA0gfnyq+gCCR4msp70sSd4/jgef3QhiHy1geiO/HUnwzWz8p
	B7ZQfjJkWJtXydGwyTVWB25aow85WC4kWutohAHa+RB0kyVOKo2H1hsNM9idFPdNRKl3hZymoAV
	g==
X-Received: by 2002:a05:6a20:244c:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3b4d3d5e346mr19126727637.30.1781054446615;
        Tue, 09 Jun 2026 18:20:46 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm18858370a12.24.2026.06.09.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:20:45 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v6 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Wed, 10 Jun 2026 09:22:21 +0800
Message-Id: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE28KGoC/4XOwWoDIRCA4VcJnmvRUcfdnvoeJQRdNRlIdotup
 CXsu9cESkLK0uM/MN/MhZWYKRb2trmwHCsVmsYW+LJhw8GN+8gptGYgwEgA4DWO8zk72NFIM7n
 jLsyF96L3CqwNiIa11c8cE33d2I9t6wOVecrftytVXqf/gFVywWUSKBEH2zn1vj85Or4O04ldw
 QqPiF5BoCFJ9so7E7SwfxD1i6CQUq0gqiEQfAoOnfHaPiP6jujVT3RDOoFeiOi0kvoZMXcERbe
 CmIYoG6PxQzKdx0dkWZYfJ2EQ1swBAAA=
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=8Jq4+7GVcOBKAyUmh61mLdl1eJHUvEKS8qVvLj4xWJU=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKLxQz5qAfvzO4jxu9b6YJUKWGKm/aRg5aCp8u
 B24zB0LZ3iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaii8UAAKCRClg0K3CVbE
 gXYOCADIiQLAI8zfQcQ9SBWy51b1ync2ztOKHBSaZME7sVhPCmByKYs8LY3CDzTSVlLjgf4+07P
 0dejRle1qw/DTXvsWMNy1XKmjAK8RxF6OvS7xY8nKJpefUv25ljPLNhIxo/tbDBMlC1Lgk3eoyV
 9+TL/dpe1mYVCLQ+gSy7tav9nxr9lorGts1jZ7fQHN5l/qDIwQlO9+LyEVTE5y7TYdR2c5gDLg0
 mlyfNzrGq71+yok6pbaJUrvLxoOiioP9NoXCLhlsXx1bxR0ftMQUTmotM7p0+04DPevQ1D4c3gn
 AiJGC9aObJLixyOcBY1unRxYKQzQDGNaFD5VZF0Nf3sGsQ0h
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_182048_168133_CBCC9052 
X-CRM114-Status: GOOD (  11.79  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v6:
- Addressed automated feedback from Sashiko bot:
  * Clarified comments that io_expander0 and io_expander8 physically share the same interrupt line (Wired-OR) by hardware design.
  * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e, dac@f).
  * Removed unused properties from the adc@48 node.
- Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com

Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2891 ++++++++++++++++++++
 3 files changed, 2893 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


