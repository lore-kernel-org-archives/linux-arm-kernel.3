Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1094C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PQ7S6mvnJWIgkvAn2u3X6CatMHsWA3MJFpJ2pyOLwk=; b=A2vN7Hl3SYyx+1R5qyhMYnTspM
	vgaXomAytj7pUz1XpQNWPFFh8XKeZqfza+gcxH/Rzu6zbQws41aAKq99zzH7tcaud3sp6FeG2t4I+
	zjKWTVQj9oRfeo/UXSGYKSxiPrLzJAl1Qhzodrd7WjeR3KYiMckAw/69gi05lPUJGASv29MReUR9x
	lo6YlWF8IViUM85JyYc/dczV34S4VQ9AxwpDtjwvPMZLNHVoS7r4lLb8bQlE20lo30p3TcTHJSvLj
	tPBaNhMxd39nxCucApu6DRgV04QPmwj5nto2AJZhLnz7dBZaXaZgwAnS1l2W4Z4GWJg9NgC6RIorP
	GQxJwtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWYj-00000005Ad5-3Ee6;
	Sun, 04 May 2025 10:26:57 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWWq-00000005AKs-0ec3;
	Sun, 04 May 2025 10:25:01 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7cadd46eb07so177136885a.3;
        Sun, 04 May 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354298; x=1746959098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PQ7S6mvnJWIgkvAn2u3X6CatMHsWA3MJFpJ2pyOLwk=;
        b=g8cO+nXc+6rVXzYOeyYol7jGYHfX0d/SoGj7cYA/g+b6B9tdG6U6oZp/7tk5bJ8jSt
         Qhdz93wUKfOQUh//OnTrjIRIiqi4YU9yBRH+niZSX5o3uomF82Na0AU2NbvRBqDrYhnU
         bt/sRDbmqtTjHKTxlt7SJrwOI2+nQKPFC+y203urxlAPHVJwoTEBgzvvJ6pziNTTXyJs
         ESiqVTSryBwczNGpAQX+q8FRv+e9jFV79pdgtpbDz+NT+Tvro47d+dVhOO8Z7+x440wc
         +W5Abx5aEIH7UEBKn3zNGZHHZkJj1QlfQxaRXmhdX49SIiSOUbg/jJccs0cd8RrUyoPw
         t+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354298; x=1746959098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PQ7S6mvnJWIgkvAn2u3X6CatMHsWA3MJFpJ2pyOLwk=;
        b=wfru7QDogZ7l87UAAMcEmBeaKwx+tgzuDxAmOtzWi/gcD1nG61o9ae/Yle1KgiIy1z
         xmnRLYV89HweyNR3VIWgQDqQ6jhB0H/1w0kX9Q7YlWtIgWvOxNjP2P16MgN09Ka/3dnv
         ZFVZWHiLHCCN+uRxH0H/3DSiPhUlu2cgFPBMHfb1nMZTxE3N7FVhfWaQw02z8s9HosZY
         oDvLHtCV+9MJqW81Cbwf4s4h7I19LKMxtgkS13rFqhITlXDTM7x2jVSIL9RzkUzjJWIi
         1KM3l2Bzl+HxzwsGIGNHTbsTfEzgyN47K1Y/ZH1fkPCu+AmjNQXnSVRfitQjM+GZW/YP
         LmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUby0T4qAi8g6NK8RGLREwvNx5VsbsWl2WVSd89cQDgTScHkh4gj7QZCWwKbnIFMSMMCQFIko0QrM+EM8pNv5Bd@lists.infradead.org, AJvYcCXds4ns2P7pr0raO4DEWY8f3XSKWAe3k96yi+H8tFrh8Iv0wz+6Hz2/ZFZuI+rr+QBnaMaYUDo70bAPTf6z/MU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzccordh79Z4C80uCfCmdBVTRSp+z/7JpWQIIxS/pabvjmvjSv8
	kg1g88kwHxR5BiwpR0zyKtWyRtTqWQT3y/xvxm4JRAsZg8calHR2
X-Gm-Gg: ASbGncstE48jf1ApPsFyjrrQa2vwgeQiX3onnn65LVHUX8/3DwXHXp4cxuWj8+CnIPE
	HU4tYPV2YGOiBlgU6WhDrcr6fEI9GrsHy3suKbZ5p+rsgXKryf7Xxo5Cn4fIHENlCgOewp/sa5H
	Zy7MMp89tkutgWiGlEYAdhqGI/Xk32+yIJ0iqtG3aYStsXy8Piu3DuKSEoJdtb8Xq56pom1pV2Z
	BtKAh88MS9L4oJcV2C6En3m6noO5jIERXZw5qSypLPrsWrT6BhEcnC9FL4cNelY1Xro1bfVkn0J
	b2iHnVNi61kq6VH0pL2VVQmoU+6bSb74/E96mAkvR9W5TE947Vtg
X-Google-Smtp-Source: AGHT+IEKTdMWS+jgcgAMuh3WRdpxZw08Q315wtPX2pV7WRyc1kxWG/qYE8O2gr4jHmjNND3M/QRc1Q==
X-Received: by 2002:a05:620a:4014:b0:7c9:4c25:9eb7 with SMTP id af79cd13be357-7cad5b3867amr1038889385a.23.1746354298396;
        Sun, 04 May 2025 03:24:58 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48d6sm429222285a.32.2025.05.04.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:24:57 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	inindev@gmail.com
Subject: [PATCH v2 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Sun,  4 May 2025 06:24:44 -0400
Message-Id: <20250504102447.153551-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_032500_209627_94BD51B5 
X-CRM114-Status: GOOD (  12.41  )
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

This series adds device tree support for the Luckfox Omni3576 Carrier Board
with Core3576 Module, based on the Rockchip RK3576 SoC, enabling essential
functionality for booting Linux and basic connectivity. v1 was posted at:
https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com

Tested features (on Linux 6.15-rc4):
 - UART: Serial console operational
 - SD card: Mounts and reads/writes successfully
 - PCIe: NVMe SSD detected, mounted, and fully functional
 - Ethernet 0: Functional with RGMII PHY
 - USB 2.0: Host ports
 - RTC: Timekeeping and wake-up tested
 - LED: Heartbeat trigger works
 - eMMC: Enabled, not populated on tested board

The series includes the following patches:
 1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
 2. dt-bindings: arm: rockchip: Add luckfox,omni3576 binding
 3. arm64: dts: rockchip: Add Luckfox Omni3576 Board support

The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.

I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
welcome feedback or collaboration to align with mainline driver development.

Changes in v2:
 - Enabled HDMI node per feedback from Heiko and Nicolas; untested due to
   upstream driver issues
 - Enabled Ethernet 1 node per Heiko's DT philosophy; untested due to
   suspected PHY driver or configuration issues
 - Clarified eMMC remains enabled but unpopulated on tested board, per Heiko

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
  dt-bindings: vendor-prefixes: Add luckfox prefix
  dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
  arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  | 779 ++++++++++++++++++
 4 files changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5


