Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B471CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcHld7eWfS9k/YycQdQCcj1jL0BjbTeZ29msr8uUtu8=; b=ZRAMpuSgCkPSjo/vHLyHN2wLRq
	teCD4408t3bpr8WBijgdH16eFMPSphpjDv/aCqQGDmAJh4XHIxLys1wyoQKalDgFAWt8iDAybCbfW
	ud+ZLC6UjH92Jcx8VpGoduXJRN060k1kxK3HepWEs/acmd5c0us8qp8F3VajotOClCiwlTXf3V/iR
	WmxNpRK1YidhxoKdp/diyClH1iXKgFymFaPgMwKeMXQrwotss4/Fwx7K30sJqW0BAsgNCRFLzG+tk
	GaAy2/GaO5vj1OYLRLYoPS8WkkJxokQ+bzu64tut5nXocKxG2IzzGwwlzkB0iNRynyiv8mzhHp0Aa
	ReXROuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNh-00000002SSV-3MJS;
	Thu, 28 Aug 2025 17:25:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc0p-00000001bl0-3blh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:45:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7ace3baso152604166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385154; x=1756989954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcHld7eWfS9k/YycQdQCcj1jL0BjbTeZ29msr8uUtu8=;
        b=K0G6yv3SESW2sb05gHupcSWNpWLjvTyTr5eQrWdL62gey38SCmPrUVTgN0HuKkkvQS
         IsD3K1LyaSnC4oHaWVyHnFJPd1lu5Y4ZSqDG1cKrNJfSVB3ir5dcXQSZ30luUGlSNcLO
         xSaAQQkDtntpSgrBgyPEXwnDKyst9yBthuLFyxBayZyO29kRAuaiffBx8/OJKMKSBF79
         fQl9ZCTFwav4coOctJL/YltlGVgetr2kw6dabHc5V4x/QCghViO2wRgSAgJ7Oi5BQma8
         MzkdcVGAtc1m+Ga2O2thHhb2Zh7RGxixgTh6q17aZDAFPj4fp52BfCjXzWNrZlAhT1Er
         PN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385154; x=1756989954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcHld7eWfS9k/YycQdQCcj1jL0BjbTeZ29msr8uUtu8=;
        b=h5gvQTPChT1AG/4qCVLe0OED74DtrodOH4IjneFqItyp6fqEiTQN8lonnQ/77FkR1m
         hPyLNx8OJO/1TMBO5WI2TIFKThxNL0s0azKWJ1QaE8QbS/+7aUQwx8zQjRlqXo+x0Jg9
         SOSQ0P5E5BCWno2LCMaugUL5nM28rflg98wW2NHRw8SODrbiAOKYYcCqStKZkiUVfnrt
         WgqDu3tEzaWFJV5MV8AP2jpuHjp+LyEQF1pHXY0C0x567YIzSlqXOwxeQhwOaMCkJpuC
         +ljRN+SvywUaNkPAjphGs/6n+lRFbzoqmX9eQ3DTIoIbaVLa8zyyNTidseIR6Z1RsMEs
         CtyA==
X-Forwarded-Encrypted: i=1; AJvYcCWJYOJIpgKgtl73NfyRCCVA8sct9+frC1s96K6SWKBIzr1V5DYKhMi15UfBL7HjizxN4tEU7ZCQnrHJmpknVqQ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4jHpNdnB6dG5rsTo3lS8SOcwXg7jfSdsKfGzA1unrtBOOWty
	U2bL5y+F8OWPp2Bd3iVyhwQh89pLQx1F7o5az0kq7BDiLcGyyq7/z+v0PMpntJ86dmI=
X-Gm-Gg: ASbGnctrU4K5r+zjJSAC6BUebf59R9k+9JTz/q+p4Oa98PbpgMJADcTWkeE4M5u9Pgg
	LHUG4dXxYMKVzAh7nmyeb0Zc7ftjHvj6654ee+dA3Z+4VHZuzJjm2S5XEeew+wpa0LqWyiskqqC
	4eEw6Pa5OzHQbrGIhINfFwUTvWCdG4ysZBEeOW1NtCaytoHXnVKAHepLDDZYq1JSIVY3D58uy6/
	kw9QwkgOnnP1/qpGCeMSmrQrlXoJr1pLKxZXu2jXe+mFGtW/O2JEPEbWZK/n6fwa8gv6BnuEYn6
	ep9Oyzldwp5/flHncEdSu7WnIHxpX/SMNo+3e52WIEFSR8wWXGVP9ba6xoDypZiAdlw6JSM0NGw
	s8iq4+LjvKViLtfhx9kaHfRr4IRwCp0ugJ7Eyx8ftN3SYCgVdCz1K6ZQxJxXlbTG/+A6XrjBXy9
	vSMlqflcuihCyEPsju8YnUd1k5qeQ=
X-Google-Smtp-Source: AGHT+IHTlEX0jDh5wp25sL0tVvvc1vBRnSxN+hiigX84aZY8E/p/0EJNR7c73UuEDJXxDs1etOxKiA==
X-Received: by 2002:a17:907:7e9c:b0:af9:d863:5ce4 with SMTP id a640c23a62f3a-afe28fc281emr2095490466b.15.1756385154182;
        Thu, 28 Aug 2025 05:45:54 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe91744c66sm733090166b.88.2025.08.28.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:45:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Thu, 28 Aug 2025 14:47:40 +0200
Message-ID: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_054555_898324_743BC1E9 
X-CRM114-Status: GOOD (  10.30  )
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

Select the on-chip pin controller driver for BCM2712 SoC.

On RapsberryPi 5 devices it is primarily needed to operate the
bluetooth and WiFi devices, to configure the uSD interface
and the power button.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..d4c3853d885d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -592,6 +592,8 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
+CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


