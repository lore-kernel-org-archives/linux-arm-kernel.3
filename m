Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F142DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=; b=lQYe4D31iWETDHqAhzAc8VbhJ1
	3D7LTlenOwtAMYid+25n69Q0riUQX1M7A/wERzysHqT5SmLHAdavKa0hQbPUa9pWd3BXv0y83d9oT
	LatvT7VrMnLXQcClfbYTsEnoUdWeuUyG6RANYgY2mPbYtcMe7z+7fFM45yBeOsogtFSKkwlRuA2ds
	asoik9aIjrWlTechl7K14rVm3ALF6N1noJy719o+fuftzQPEuHVjWqvutETG2MiSf7x9ZPK/k7303
	yROnswoLLqC188pANDt71GBJT7XwFXOT/6cteM04BXvLeS7zJZYnkTfn0Rhff8gHgsWqHrk4IWMAl
	7Cc0dXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbF5-0000000FadY-3kHj;
	Thu, 29 May 2025 11:16:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKao2-0000000FXfE-28Vg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-acb39c45b4eso106470066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515693; x=1749120493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=efdvluU2w3icM7r4CNJreYwAiow/Fhs3POO3jFZEfzvTpXek50sD6/nSg6wyxvC3IX
         nHrw3Ggoy7fC8it+n6o91EYyMb9/Dph47ipxoA0EJOXcV+eiBmGdOtA9smqqdSQqEHT+
         6JTvSC/69PvD1REGgJBL23Tc9uGzoxXVh0qK54/YME3RgyMP0HmN9fyCH0hXsnPE3Wwj
         3VNOBIX5zpq3437fp/g8yxiegUyKq8cyQrbUmXfOjlH87Lul02cjhdh0vlYVZtP0ZTv4
         5/+j4XFef7V7p3Rd12AxeWDH8Aqe+7OlyJOMAPyPcfaRsXzml34fdOZu7SRZHiF2xd7q
         O2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515693; x=1749120493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=CpDDoP9DGoYN6gY7F6L+JI63XBFrAZRdk1nEA41BNayHN5o+uvI0TVSUQAhqaa1PWK
         D3eniUSpqnsDJL252/osaJO22phINbi9eLrMIgUtNVWIxSfdAeIPv7SucIJ1p3yrDPfa
         zoyREKdzhlI5clMuq7tBebVX/OmDTfEvNO9B4Rz5F2WbTbNnSianb0Kel2n5ZuQQFLqZ
         VVR5lBFbRUF1ZD+wVd9EaGzrC2IDiOfc7wNjKHh+oQ+zNqM+HiSuNiTKqxqB23Rb/DYV
         6dYEiVfEyDC2QqqprTEVi9sABy0tp5aYOLTZ2uk7ZWLBqv4ERCQwWslWfvX+aM+s18SU
         onBA==
X-Forwarded-Encrypted: i=1; AJvYcCVJXiDlX+NLxMPg3mR8wVHh8d0SSiY/OOeWmxEZOTcX6rSt3S8/S6JazmcONUqV65P+48QhmbCuAN4BPYUqOuaK@lists.infradead.org
X-Gm-Message-State: AOJu0YyuFe0sTf2HApbNdyv4ljgmUKybpCMZxgMXXHFzsNS7qvQ/HcGy
	3FwAdPUBeQPvr2xliBNhocPkY5DnsrNT3/+5mlRBbPMe7u8mPlUMQB+TmI1rp+La9jo=
X-Gm-Gg: ASbGnctH63uelomF82oJhdxZiFkZqcGMUG0XbXhXfFZ+z+rwF3phT0/dPTM7ztDhy4T
	mqgvqTnxuVgcIDb45aAswYzc66zU4e8TNNyGXxY+9PYiTcMrexv82EHSuhM+6CCRAnQlNY1cjML
	rG+2X8KoQjLYrY5yLK/HOxBGIsVcHe+NyJogecEZrmmiKzfOXejVjWlUCkLNqgQqnqSuDvjr2/N
	vQGyV09eP6Zlly+jRPq7wHLAC0UTd7ZSdLmwi/o+DyPt92pl8d7ZsdgENVnASsXFD084yg0lvg/
	xSwfOf3fkTQaKOMSHJvgfL2ydX7HPoxbKvu+53wqsPor37ZaiWRQe0IbYpmaYcm8ffwsMeyZdBv
	z4cNrC0UOJkt5eqxfNoDjww==
X-Google-Smtp-Source: AGHT+IGcndJR5WSb66PATrzUwaAKdyGw+iAxbtsrtdyFNRYpJH+6sC62/Ji0kCEJoq4+a4yiL897iA==
X-Received: by 2002:a17:907:2d28:b0:ad8:8835:f794 with SMTP id a640c23a62f3a-ad8a1f31b97mr453973866b.32.1748515692908;
        Thu, 29 May 2025 03:48:12 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de76sm121072866b.65.2025.05.29.03.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 12/12] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 12:49:29 +0200
Message-ID: <20250529104940.23053-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034814_546419_A5E03536 
X-CRM114-Status: GOOD (  11.00  )
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


