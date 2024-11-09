Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07DD5E388
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 23:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDnEol/sO6VqVywxS7JlKi6+yDV4PyqK7/lKBRL3LN4=; b=4kGaWORHJXfUq3guJca6m3diNP
	L0ieXiHSWQNfbhXS/eq3SzBjfVWNpHyagQjeALvgai1eXN5GdgZyYjUzXRzDfFeqJPmGWvfzA60xy
	eXyW7eNsHCIBjRy51cyt1xwZCdV38lVu4KjrfrCpZMTaoi67T4sOeFX5wWes625opZwuocmidktC5
	+iUjC4KRXo3kQAg3DcGUThJcFXxRwoIZrEoXT0adXcJnU4DSTIbp8UD1HgWbG/t+ncnpyHZdswP3a
	HHwy/HP2FfP+idD56hQnSnIAiwdxLVOqLVuwFkbk9XRzV3FPp1OqY9ZLTwpW0G32hRDLCA8vWzaPH
	6JaGBEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uWv-0000000E5fy-2n5b;
	Sat, 09 Nov 2024 23:06:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uV9-0000000E5Tl-3R3n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 23:04:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c70abba48so33574265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 15:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193458; x=1731798258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDnEol/sO6VqVywxS7JlKi6+yDV4PyqK7/lKBRL3LN4=;
        b=VY4f2uHNdquCmWiJHjsKso7/sbR/IEvx1v1MuRbr6+swz53kp3LlCylUNylateYsuZ
         tY3EaohM9d9ef7mZlgdUt6xp8bpkLZcLVCkbMWir1cvi4HoM8doIbj0iLPwGJwIGhUw2
         zCRI6tv9hwO6wgQ1rI1rSB+SwrySwRDMiYB5UHWndzJcgmYW9CE3gfNJn0k2rS4AWVCT
         YOyXhAKjIgHrVahjubOkeEpEuL50pBi1q21LeR16FB+VyD2sYkHZZuYj0XR1J/TddArP
         mBGEe2m9xcTD0alm47Yklf/mLXHrZhhO90VpefkaKObW7RKQeidBqKj5T+jqbVHiDQFI
         s0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193458; x=1731798258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDnEol/sO6VqVywxS7JlKi6+yDV4PyqK7/lKBRL3LN4=;
        b=pTvFEaodfiUdF5+jeEDGU1fQd+U8CuhCPeE8/uY61qu6UWaPLVMiYizV46OVA8G9U/
         cv78jy/fxkvaTHqbVDqQfICrYB03bJC6zPU8+rspLLd5cZ2A6F4kKzZT2msoxaf+MaYU
         1BpWEedbcLuoSteqmpkK71/nBkKC8Cv22Z40iiqcW6/p0GlhLPA7sz2UCtZDLHGg6X+g
         RcUtQlQWdM0HB1Ir4bFfHngrl73HbzgnYyCfyTTSoVlQDA2tXb64wrMA9DtrWjeCrtaI
         Vzy5rRc/NMjjbQwv8xELkub24xFL/r1VXKKOfwJ6YA5cO7vSuWKePQYSBDz9Pxse41Tq
         Zvag==
X-Gm-Message-State: AOJu0YzTQffaN7D/R3HkdCo1TWAGXdlOy0oN8OdYVRACjOMrHu2j2qBl
	nGRwmFx4s5UmrE4yMHL1E79L3kOU33slT3I6U4xwxARE5kfLI4Kw6XpMcKjTaNU=
X-Google-Smtp-Source: AGHT+IFe/igCtkT6IZ/6bhwjaaHJHxUvojfaLWGRCzpaPWVdfzmPczFY2/Rfp8J8r5utBgsFvW60Lg==
X-Received: by 2002:a17:902:ea12:b0:20c:c086:4998 with SMTP id d9443c01a7336-21183d7cd04mr86046655ad.55.1731193458233;
        Sat, 09 Nov 2024 15:04:18 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:17 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Sat,  9 Nov 2024 23:04:00 +0000
Message-Id: <20241109230402.831-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_150419_882614_10948E90 
X-CRM114-Status: GOOD (  12.24  )
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

Hello :),

I'm a newbie and I started getting interested 1 year ago.
Well, that's the beginning,
until I learn more about kernels and the C language,
which is important in that.

Well, bluntly, here it is:

That Samsung Galaxy S20 FE device is part of the Exynos990 SoC family,
I saw that Igor supported that processor,
I took advantage of it.

It has the same functions of:

* CPU
* pintrl
* gpio-keys
* simple-framebuffer

Just enough to reach a shell in an initramfs.

The preferred way to boot the upstream kernel is by using a
shim bootloader, called uniLoader.
Changes: - Simply add dts from S20 FE device

Special thanks to Igor for helping me with that :)

Sota4Ever (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE
    (SM-G780F)
  arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts  | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

-- 
2.34.1


