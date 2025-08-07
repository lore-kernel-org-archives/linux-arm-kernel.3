Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=; b=wV9E+YOG7CXgZ1Y3gAwp4FDlHO
	HCthaXXipsaKeNXi+Zq2zYd6eWz93Gt3CamhgWPu4QGsrR3z5XgA8N8Fi1Hy5cRyZQ39TJr/mcjEr
	fdx6MZFZ1byoiCNSHKFYLRfyQIOFGV44JQ5S7uhiOWoiWhKL7XYZFI68AjSmtQn4ZHCdGW1t22qSC
	Sg/8NmJ8/hUmtcoobm6EQANAS/xiitjdiMuAVOISmiQYEtEIFF9rR6o/tElDsbp2qSBCSdMHFRQKK
	hfM/q31clIv9vWkdJp0z1FGd1VANkUB0aJMmNibiMQ0LPXuAruQ7OUfmsCSJIhiD+DqrjmTlyZAGR
	8q7/mQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk20h-00000000t2T-1Bgm;
	Thu, 07 Aug 2025 14:54:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1xp-00000000sci-0RHt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:51:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so1155274b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578288; x=1755183088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=NVeHCUCKKriuS2koZNYsumZ6QlikOtZnhn72uPq2TD/fXFR0R0F4i7SUDNBHR0RMuU
         jxlZtWcI7c5shmU0dMRyZ/mrAn0vPCm00KDEsb4BfYBLnRVe/gn9FEd/enItGzd7Ihk4
         dJ9eNn6hvHJNQgb1DLlnDMxUah+27pJeO5DFdmZ0ryRsDjjddDNDe5Ymgt2lo87lpC8U
         MLt3PDMpnhLU9I16fELsjvFHvoXI28XMRnmJjp4zgH6SqzzMKaYRrgaCOZ6tS85ppMoQ
         LdcUyeKNyGwcfopZ/NaAE3wTUu6GtgTCYE9m+lUbaSh71ZHf4rEbTezhZ+Sjr4rACll8
         6IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578288; x=1755183088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=h7aOPrjHuwxA/O4rQczcZVuzzCLp8KcxYjt8AWqeiZzhT2AVJbnL0waUb4ElhbQKNk
         A1iWyVkROpcXvTyZvZHV5pc7XT0aLgRBV+F0Pi/YHvNEzGWsYn7joCTaeCjuQHDfClfy
         4ZLFk915Q+q+VafCWYV308OmN5DRGjtVF60X3UMM+GGXNum376VoJQEgL4Y9j9uaY+O0
         a7EKAi8hRU97w4ptoS3+iqseynH0LYjwUs3+1k+1WlXsr9Er9sUksOOeANBnVFmxlJBw
         r5jPCY58Q1yyyJcY2LLk8asaxoVFF/SmdPwRpMOgnNACzAEWJ//3Rn72a4TK1iI1zbLF
         zyEw==
X-Forwarded-Encrypted: i=1; AJvYcCVsxKzQAI4woy2m8q1NXL6b1KPFhY5DhGyW/8zYvdN8aYNCBRFD/OFzhnhyjJKoEnFE+b1CAm8cybJm6NLnbcf3@lists.infradead.org
X-Gm-Message-State: AOJu0YwVi9wlivz+PburhKdvMMYGjN/gAj95+ICVttqPPPnvaaoodQeu
	SnykKFAEYGHp6eglOfU881zELgkxBPKk6Gko+UaLGeOEMfcmLDC8HFrCmbXk5CZG0OY=
X-Gm-Gg: ASbGncsYYIuqZWF0E1I8V7PCBbFGTC7u5U6vk4bq8lju/Cs6MeTRWRCVLuulX95czAo
	XhqNHturAhn5UtQzzutWz8n7RJTcVxIwk9+aaPxJqwc/2As2lgrCG6Q/AymtfCOXzCSMCi9k0G0
	w6nlrigWrzO61UcViAFGcEufdubgjp9KRX0MkiIWdNcqhROccWfpVFQzcW3+1GqP7zUSTF6rjR+
	pAiDiXdLTt2+7qVTwKcD2Uflo3TyQp/vU45jX5FwQ7oCGH274j7shjH++Pz4I/hJov8jNw1aNSz
	UW/hR3LdiH4PAZgd8QPGUSEryFJFClCAv2N0p7jR8b4aLTCoCi4yLsoZ6uKqVHJhoqhNjZFaHRg
	pMSRI2wh6lLdqaJ+dHDhsE59gi4AY4E5qnkKCmGv6sImdyMdseHvCxraTJ/zpvAg=
X-Google-Smtp-Source: AGHT+IGtphOkrCppTiHiV45+Qe9W2hQNmX+FpcoXnXXadWOHWcmzG19NrBZWjxt3jESoe+Rbd+mthQ==
X-Received: by 2002:a05:6300:210c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-2403159487dmr11371637637.43.1754578288227;
        Thu, 07 Aug 2025 07:51:28 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([49.207.200.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0d6csm15569174a12.38.2025.08.07.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:51:27 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Akshaykumar Gunari <akshaygunari@gmail.com>
Subject: [PATCH RESEND] docs: arm: stm32: fix typo "busses" -> "buses"
Date: Thu,  7 Aug 2025 20:21:19 +0530
Message-ID: <20250807145119.2214-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_075129_143196_B3B37149 
X-CRM114-Status: GOOD (  10.92  )
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

Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
architecture documentation.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
index 78befddc7740..335f0855a858 100644
--- a/Documentation/arch/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f746-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
index e482980ddf21..ef31aadee68f 100644
--- a/Documentation/arch/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f769-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support*2
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C*4, SPI*6, CAN*3 busses support
+- I2C*4, SPI*6, CAN*3 buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface*2
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
index 4e15f1a42730..7659df24d362 100644
--- a/Documentation/arch/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h743-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h750-overview.rst b/Documentation/arch/arm/stm32/stm32h750-overview.rst
index 0e51235c9547..be032b77d1f1 100644
--- a/Documentation/arch/arm/stm32/stm32h750-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h750-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp13-overview.rst b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
index 3bb9492dad49..b5e9589fb06f 100644
--- a/Documentation/arch/arm/stm32/stm32mp13-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
@@ -24,7 +24,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp151-overview.rst b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
index f42a2ac309c0..b58c256ede9a 100644
--- a/Documentation/arch/arm/stm32/stm32mp151-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
@@ -23,7 +23,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI busses support
+- I2C, SPI buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD-TFT controller
-- 
2.43.0


