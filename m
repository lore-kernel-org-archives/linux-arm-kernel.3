Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=; b=3BMT4q3UreDDShQQBAJlbbDTP6
	+dIKuZ1+lepJAkBtquwUWXWkvQapGCFaoILt0ZlvyMdZGLJmFezhOOHWvwgHpaL5+sHOGNqncl0jW
	0i7YB2pm0q3EbbZ1RpT7BQ5QQ/w0IqDHdHs6oSysLSiJR05kS1N92TLlANcSmmwZ2G/UH19NqYleA
	+Gq+oaFUAjIV1x+gGH0vroN3jntIU1d0hBPazE8BWgM0zAsK9iaTkSgwIOjrZWSG5b5rn7nfoHueP
	I+GPw9j8qI31wjEm3OgNRoiXMYv92Ku2LzAMILAOaCO647XG8J2E0Y0FrYC6EiXiWeQ7CJd9963eI
	MqC5H/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOnTv-00000005Xci-0Sg5;
	Tue, 10 Jun 2025 01:08:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7n-00000005SFI-0k7w;
	Mon, 09 Jun 2025 23:41:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2697432f8f.2;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512514; x=1750117314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=LcZllcBB+oquWCgby/T9C8wrFJ8xXw/IpwcD8T8b1sFdQKLW33W4Cr9API9Q3RlBDi
         Z+uhm16va2qrcEaKcFuxnzrYfFOMATCErnH5cucC3NkC6ldbuJktLCTHVbwy3KNzWbPF
         WMoIl60rGa6hbtrJ6hu3jF9Fty6bmexmZpE9VWgFW98kAnKc2+6yG/NvemAWrMqu3PF8
         cZKSAemRClIYrgV34qh+imS4tKxUlzzgeZITyoZT4xAxG0xtjSHDoJKPNuVZ/Cj+xNv4
         3HUUpMXVMpXDtJfpyqFjhQStzrDRoqPG5anyaeMDDwG786jP4+RwTEiy+It89B5pMnRd
         JQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512514; x=1750117314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=qRXMGN0FvnkbPWy/MFNPjI826ThzsoB/oM5lG1ywQycy0d2NfjzfPnE3tOCmqgnV6H
         De2en9AYfKpYBA4NAIlMsgIUUIb598s4jxaJI7ja6Laz6opgV422XuID5dhWyWaXNRok
         ufIkJRIh0z4Z1wiLRihytZ/WO2wbp9R7Ns2MuJGOWVLHry2fBtIlIv1xhe3GDbfnKsng
         Z5ihh7nFZ9ylzHGuh+ffoBdSnCGwDf687fV981UpahUVS69Ebt4uZMn5/CHinYm3e9KY
         CfEfbfvov9YKZAPwyq8dwWgEBkUIXtA+OTuLEeu76enFuD4nKjxI01pu5NNwXRS3mx2t
         qF0g==
X-Forwarded-Encrypted: i=1; AJvYcCUu7YTn8gkKWuy7yiAv7N4HArUSYBTTVDNKXZ3qH1QCp2WwXNODHg4NSNHvJtRJIXDsC5FU3O41L0cLW7L5r5/M@lists.infradead.org, AJvYcCVWSsAJp3WF3YSUU1L9VtR6jjiYu95hiFoHvJm+BREcJDrpK20n5DBFh9Pj1Oa4QN06lGs7vJm+tuZbHwc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx6q7PdthEGr6SN8ABC08dm4iJgFjdAhF4GGmJvz0MKhML7Nln
	LvaofyESNwDj/Nowfr4BUxw9UWzDRSiF+QtXe4Bi2aMgauNzrCgD+shn
X-Gm-Gg: ASbGncso03VKRYfL34qRimmDRHnVy3HTyX4kEHWcByWZ3bEZ6UF49X+1nFoh4OABEeA
	r7dEyt+OV6FDkzf6P6eQ7EXdSCcfd+ZL3qvn5ZX6sE5xr4KWRsgLT0TMokq4UcSLsxNwpsbqL8o
	Nr9JhsZTC7Xz7hcerhPUD7WisgVd3F2fZRqxHKZTg5buX1d98RomWnJWN3HLi3DUnnxxsWU59Ze
	Mf7bQLtMIewsPm4ZYkJ20lbcPmZukKDUET8/EOIY9tTqlsmxg0qGbWK6+dw0m1wrik1w/PMhUaG
	VQVx6LVlMtd5ei2Cqavnohy4cjMjx+oG8nrfrgGMe9SpCqkXCx0FpddErQuoUaS6SDzNrZpcvI8
	=
X-Google-Smtp-Source: AGHT+IHG+23gSY7lbz1gITYGdcTpMahA14EmzL8S35xxT7RAijs9v4mF7qIfd+85zAEt9lbZCMJf7Q==
X-Received: by 2002:a05:6000:18ab:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a531ce1809mr12878839f8f.46.1749512513652;
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 01:41:16 +0200
Message-ID: <20250609234125.722923-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164155_224821_7D491D2B 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..af74bcc3c861 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.49.0


