Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC4C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7affcrby2vNkam9EwwwwjCrmVQatX9FyWXaqSRxB4wg=; b=ruK/kDx+XAMyHg
	xo3xWZGSE2VWzUIgwl7jaRqYcSCZ0RupAnVtTcQEipCYQCJhvFnPeTpiYuVAGQdXEgdSVDfoXN2O+
	VpgNDoy1GEmd/SVUXSmdpU1Z7/dl4OfQtktudi9/vNTtfiel0Ren7lvjRoWWPVIl91XuroRsgIXM+
	BOvh5VoF+UyAHpVi9Ce0dguCqAAAg2mZrPtYExFt4GbrPF7H3fg4/wSkYYOrdsjC7LKxuuJpNIQ3h
	YpRdvV9VP29x0fSccAh9LprosK67YAEeXxFT6c2HFPP8leeOgQCrBcvBxoo0HrBvh0eddezTv/oeV
	7bgMxI4WX7wOdtOppcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyse-00000003AJ2-14jt;
	Fri, 02 May 2025 22:29:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyUu-0000000380n-2JBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:04:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22438c356c8so26220145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223483; x=1746828283; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7affcrby2vNkam9EwwwwjCrmVQatX9FyWXaqSRxB4wg=;
        b=HmuF/cGno4Ggi/EKQJph2zXjvs59MyVryxJ7jCdKQaN0piHazf6EgNI0W20tE1snSE
         isFCgmUlIIKoJ/1JgT+/Y+rPe+ZyaDh1wCeQwFOrAxIEuofwVFl7P7OJ6duWbh3wC2ro
         eUEFKMOO/0lWT1LqyibRjV7+tUjH95TKYkexgYe5CgflLjahYSIEG8DPV50bfxkC02T8
         1K3CKC2GzqKE4rc6kxxXj95aP6SuVX1nCCyN/+FC14UqhIffW1+TdqFCZBTuNU2rKHOC
         YmPvTp4pUQxYUueiPs0lvaHsTYFcKc0a6Zv4zNh1jLYutxRdG0ThLkhFheAlq2JsjN49
         z4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223483; x=1746828283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7affcrby2vNkam9EwwwwjCrmVQatX9FyWXaqSRxB4wg=;
        b=XgnKIqrGY+FMDXn4RGdtt8YNfMMSlxqzqg82oreYSxlgVrjTL3QqHLzp88fDhEKuVI
         88i1YGHHCyb1IldjtBtebjZQ4UaQOugRrnuINAeL4z+G1f3pcfTq9noBFGZap3xLfjZ8
         UTpgJT0vYuwyNKXlLRtCYoclJFglsXqV9TW35e0CSsCEEp4quScghjUCpzsHxK9SX/VB
         TULYqisI92n7OutmP+DMC4TIJBe/jtjWQZqypxYNNbaff/8D1ML/lzEkFt3d2ReDzYVK
         We8kO5iMQv1SmgwwOgv7YAxiaGMLavvm/tVzfORAgw5WBoaQo44eOS7zF4ZMjEo5ptEc
         8Kug==
X-Forwarded-Encrypted: i=1; AJvYcCUgdZcWh/EfYcH7R4z0zJps0G7FM+4m95623SJWzxyEPEaOzMKWx6/exm2SZwDGhdJAazg2+OF1WE+K4lMiCcly@lists.infradead.org
X-Gm-Message-State: AOJu0YyabISX/SFr98FT/5l2zOgPjOhQM7DELGfmhzPKjVXvVkbeEZCj
	2HwGD67SXsGuMl7BuDi65p+sPm/Kk7GUzXVyRG80dDIAplqYA/5f
X-Gm-Gg: ASbGncuYDx77UFqhoM6vzvrApCHMNYuMHJBhBKNrUIPuINxhN4AVnshugytI9l2Ea+q
	lXXL2erNGszY0j1JTGqqzuR7D4oKgIgT68LQ+R6oNwXZpngh0Oas5iKUdWZ1WhQW0vTTaYssL6H
	hMPKcUWTt+CpNS7feSdE/NnH7Pxn7/m7THP/O0lIh5bvllYSrVEgbegdxDiGB/1X9qj4XkbJfel
	YuB2yj57KmjHa0FmzIrmvRNclpd95qltFbnWxiiXv0ywBmRRtPHqihzH8RehFH/1BGOvJGr6idX
	JaWzvNl+FT+pgAmK4ZB4zN2oQEvyT8GQE4ht+ubBm/9e9pt3W1qu
X-Google-Smtp-Source: AGHT+IFSEK0BFBWq98gRMREk3vYKHwod79qnzPoBE27xjeSvNK9HzGZJPObIMMGJCWFIuUJZRuoBrw==
X-Received: by 2002:a17:902:d481:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22e1038971bmr54216585ad.37.1746223482750;
        Fri, 02 May 2025 15:04:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:04:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Sat, 03 May 2025 02:04:22 +0400
Message-Id: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZBFWgC/3XMyw6CMBCF4Vchs3YMDBeNK9/DsKDtFCYRSlpSN
 aTvbmXv8j/J+XYI7IUD3IodPEcJ4pYcdCpAT8MyMorJDVRSWzZU42veMDiNxktkj4apM91FmYY
 t5NPq2cr7AB997knC5vzn8GP1W/9SscISlbkqW1NLlab7OA/yPGs3Q59S+gIa5icqrAAAAA==
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=2281;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dRIhoysQGSyJs2hdqVmcNTx/4yoP6dvGtwt8OZlsnmY=;
 b=ydF//7uFMmST3aeLF7U0I+Vqit9hRbYNg2pIAe0z+Xv3le8sthrn9K5pHbECZQOCAaTfImeb8
 ZvWJxWgSWskBfPA29c6mH7vKgaUStaCZmF+EhDKv5JYHfKfPihGIPNx
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_150444_592084_82FD36DD 
X-CRM114-Status: GOOD (  13.29  )
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

VIA/WonderMedia SoCs have a chip ID register, which is helpful for
selecting support for correct sets of hardware quirks at runtime, add
code for it.

This will enable the use of SOC bus match tables in individual drivers,
allowing for finer grained feature selection where device trees might
not provide full information about what the hardware expects (such as
with non-user-visible SoC revisions having different behavior within
the same user-visible SoC version).

This series intentionally omits the updates to MAINTAINERS, as there
are multiple VT8500 related submissions this cycle which may go via
different trees (and cause pain in sequencing the merges). It will be
updated separately in a single pass to cover everything VT8500 related.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Moved the DT binding under hwinfo directory
- Changed the compatible string to be based on SoC version
- Reworked the driver into a platform one, and switched to devm_ functions
  (all of the above - thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com

---
Alexey Charkov (3):
      dt-bindings: soc: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver
      ARM: dts: vt8500: add DT nodes for the system config ID register

 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 ++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   5 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/vt8500/Kconfig                         |  20 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 +++++++++++++++++++++
 11 files changed, 211 insertions(+)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250423-wmt-soc-driver-de26d67bd4ef

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


