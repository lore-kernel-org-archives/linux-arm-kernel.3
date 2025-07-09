Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAECEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mM0W7rGoqRHc41L6IiWj0CbgHWaJ/F6WxQNs4BZcfiw=; b=usQ4gDLDYb1lVl62BLdQuqMJ1R
	1IPvhVu28RfAmp0k7ElhcdL5K4c/MrXYrn399M7oYKttOuaNqJy9xf/xIKA1nnEJDq0/a6rm4F7Qx
	QAQnDdqJd+TcHd78yBGOxE5td7y5Ln2nVz/f3UE0s0zI16lN9rsAHoVbcQurmU9UibCQeG2nIPWa9
	znH0lk4dy/R766TS10S/6DWUu29H1ZE164wkcALJfIjM3/K/8heYnTXXy5D2zsiiVhRD6TcGa4k8h
	dZ6xG/XSzTSecZsZ/pOBqRNvwi6JGGWLhuIe5hUuZRYIp/zXzzidMyMD1nWMoEJyjGg+ZI0l6hvTA
	gaJ+8O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZe1i-0000000AEfD-35kd;
	Wed, 09 Jul 2025 23:16:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdzO-0000000AEQb-0b43
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:14:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a5123c1533so226507f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102848; x=1752707648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mM0W7rGoqRHc41L6IiWj0CbgHWaJ/F6WxQNs4BZcfiw=;
        b=mz3B82fIE0NncK/AOHmjaxWOer5Gp1rtrZ4NSSKEfhovVCjA76bNFGAOMVb52HxPnZ
         f+47zG6/e/OO23tryF5m9TtSMLG1nrxAAQ1+vSeNR01kF0x5XwR5OhvRxlvXrBkDwV3Y
         LsBJQyPOcv9zna2fNjW7yaUlzqKyviJ4XhmRPqTevYo4jujtDiX9XEGTu9bojzbAcK/q
         RqX0ZWMY1cAlVwfJBsJt5FeORS4uDXuakZ8vOappj2O0e54EAk1oePIBArAUhIbLngnw
         J9QeCG7MDYS4ShBL/R4qnLqFB4L0vh6PhkVwKn4+ymWx7DonUCD/CDUBPZJY0FjTT3qt
         sUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102848; x=1752707648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM0W7rGoqRHc41L6IiWj0CbgHWaJ/F6WxQNs4BZcfiw=;
        b=j8DY4TwmJYe0SmKt/Hi9CWmB7Re85GacN8VmarzRnlrJq81nMPh2lDTbGy5lXQGjF7
         p+yWiIKIoVaFXH5eUfJXs9JT5Yj3zrCbiw0g9TuCwmyjv+D4fWs5PsDdUnAnleS7xgpC
         ghCdV7QTdHzEPpZHxjh042pObTOeRJf7QfhhGM7puIfc7vu6jWT8GcjZo4nYEMZFEEMq
         pM5u1KumEbL9ftgY7AIuGJpPreN5y5+D3F9KL3774hqYyHiKy5U4Zx+hQd2Kh1NvAcTl
         OkiooSN/wh5lgrY+qonpM29z+qx7uJ7XnRNDIVTAkjQ3iJLNU6Kg9vnNuTasc8NiEwOS
         sFgg==
X-Forwarded-Encrypted: i=1; AJvYcCWUW09WLrK2whRGx67CpD5NGi+GnEBnWfAJ4A1dVy/1vqC6wZmauyLb39+jpQPbbUzvzk2ckLdsLEBS3X3VXFUn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4plvjYd2grxYq5+h+bcD8Pp3Net4s9BGbX1fBgPRJSVNjvpa2
	RgmG8G4iFM0Q2Mi1/5B7MgOCSjKOdTLK3YjOpYuZH2d6E0vTFprr3si3celNuA==
X-Gm-Gg: ASbGncuJ3Kxi3X0l1bAPtjjbtnRML/Jdq9gmTfJ45ZyisImMMYeo1NCkU3HXA/dQeNt
	Taw7L7je0S5ZHCfN61Fd8HQRAaBfEHKPsS6k3aKOzMCaGzRzux6f8oPkk+lQ/Ps5cflFatDeZGe
	uLUn1i3kDxvrE1W/oy8LwrHrZBTdEtZv4ClEyafkh2jQSFcQ3GUu77sy31feYFSScY3GhVkYHuj
	06CzI6JoCFkZz/HG4mw6VDY4EcRi+FvJbOp8TjBwfxAmvj2yELm8a3F8ThhSv+wIhURfyClKVgc
	+zlyvO/AeXnKMl+DfS6YeEUnzrZmB6/OuNXvHL0Y99568y1G1tmazhTzTmbN2NEZzYnQzIVa2ek
	U3r8u0xyqH8VTMuqECN+1g5Y6RhkzxWTQWT7OsxFbeS6rykZSeUq1gw==
X-Google-Smtp-Source: AGHT+IE7vuy07GolYAFk2CtHyU06NZ/fwyEnRAHKXN7YKlt4mNII9jiTH0Ibq5KgvavaEtaELfGpSw==
X-Received: by 2002:a5d:5f41:0:b0:3b5:e29c:190 with SMTP id ffacd0b85a97d-3b5e86ae9d9mr411788f8f.29.1752102848479;
        Wed, 09 Jul 2025 16:14:08 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd54115bsm1608315e9.31.2025.07.09.16.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] arm64: tegra: Add Tegra264 support
Date: Thu, 10 Jul 2025 01:13:57 +0200
Message-ID: <20250709231401.3767130-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_161410_183989_DC33A208 
X-CRM114-Status: GOOD (  12.59  )
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

From: Thierry Reding <treding@nvidia.com>

This adds support for the Tegra264 SoC as well as the engineering
reference platform that goes with it. There isn't too much here yet, but
it should enable users to boot into an initial ramdisk. Patches to
enable access to the root filesystem are in the works but not quite
ready yet.

Thierry

Thierry Reding (4):
  arm64: tegra: Add Tegra264 support
  arm64: tegra: Add p3971-0089+p3834-0008 support
  arm64: tegra: Add memory controller on Tegra264
  arm64: defconfig: Enable Tegra241 and Tegra264

 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 415 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 9 files changed, 488 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi

-- 
2.50.0


