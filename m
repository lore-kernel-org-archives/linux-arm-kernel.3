Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FBFC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=; b=eMpktNgTdEQ5x0yAMwL/O9vVEe
	itD34LJw5mdmYPaRBI1Fyl6iSo1klsNpoyz3mDgyEFnliFTe/zwyradKVG5UCo7KGgQPT91IOAwZN
	EffZRbzEiYNbrDRYUjuMHyTxAWkFPbFjxjfKCzZzQAcQku+Vlj2Zogr+DuGpXsujOsnzKqQvQoZfJ
	5c+TA520FMjfRvRprGo/SQFepR3zOsJtPbkWQMF6IFo30W1Ue8aQJir5tJUYeSHO/ozjy/866xVZH
	lB14cYF8HQUB2uBns4R53EkIiuVJrhZEZVIfTfYP+TRgZ/3y/zr/TMX4zIt8SYOoUtgIOm1pUFz+B
	g3P3VFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWC0-0000000BIJv-1VbE;
	Fri, 07 Feb 2025 21:47:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwN-0000000BDW7-2Yw0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a4f1so5321945a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963870; x=1739568670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=JhjWAbsbc20CtwL5QkA0L9BkJaQsS7WGVkckv9SmISzuoNpOpohXMvsKknObV2v5an
         mSi27S4AxJFsLbylFEezENKUmAN242vyql1BDNfpoc9KvsgX8Zc2eUaigshHliqDcbVb
         csBK//QFo9LGVbI8JeHMglrsC6lh2cM2XDCpP8mKlKonmci7kjBE5zlRJNi/cIsYZhHi
         eGYeYu6uL9BvZoTJ6YhcRkrlMZ342TVrT23QQnPJqOl2+d9eUgUm2PHg2UsE2egYy0dq
         N0dlqh5XYPByivM3Bvz7caI3GLElN7zmJLlfYF6HsD4iw1AiqVZw2vqYSaVA1mXwpYyq
         QK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963870; x=1739568670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=CyIvB506gZyzQzQNKeO7PjNdG7gKuYJCUHSKEW6yzZ9iry8TzvgBdubCgxIElxnlKl
         DGwL2Pt+6EnqIvG2PDmBglSVxr/4CLJeX62jwEgrme7g6CcaKTGWl536ZasMjTo+WQxX
         poTKGHp4i+CCoZHzHfXDkDmkEJyyIyEkEbAZCqsqEO+SQugqpPy52NAM9tMEdLcpvVXI
         NifeAA7uw4E5vohu+6zDSZ9BN3tiS5Aa3W2sq8+GgTk/7j6TONJd+jAL0upZMhQfpHN6
         u8fR2xccMQ45/9XPwNuAGrA64XRdTG1XY6ec0jcGrVAW3CXNIaWtf6bylIXHmiKmBQID
         XSvw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHpP2/a2fSl4olq6oqNI5dnu0luja0dT72B+aLLASBk3jyE12anLfWkIjlNbv+Fl/KS+jW9T/qoi1oxMcKGyA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zUqgyj38VhQdDPYTqk5UPl9ncSmb4c4UoXDiTOGrsopTjAuK
	D8xNZ5gSQY7YBEdshPXDAhwaml7VW/eJxLStYlwJM0cQ5cF1Djo7VPrMuNprQXE=
X-Gm-Gg: ASbGncu6Yd6XwRLz8g5HHtDBriCd/vz1vky7jCxzgKLF3NMuoqydFgXwj1rG2/MPRTV
	g5h+ne0kzcWSPGB0Iz7CXbJObW82qwyVrHWVPto0VFuDpzsbkiUejulkuaQ1x2q2sZKV2GYm7l4
	fJGUmBHLxPLKJR1fbiX/LVP0jXJZs3fRAc3C5QFYhz415xdJh9hd4rRbk4pwsSifTYQOuKGzwfw
	E55KkptufGcK8bdSZKqIK9AgtVyy1wTC/dqd8Q96mx/3UEqQuHKGEbEfPcDKfjMRPdRxExXvzo/
	/kwi2aUSfVEJNwgnIRAIYTTM0xsJ3T5LF46BLbugFhNU6a+P+ezz1l7dXHg=
X-Google-Smtp-Source: AGHT+IGqkLo0lI36PtNVD5Cy94zl3v7p9AH5vVE/OdrL5N+bHa3ei/O+q+8oK4gR/8Gmpzk1d7rM+w==
X-Received: by 2002:a05:6402:5290:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5de4503ff1emr5658453a12.7.1738963869994;
        Fri, 07 Feb 2025 13:31:09 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de51768762sm970455a12.61.2025.02.07.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:09 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 10/11] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Fri,  7 Feb 2025 22:31:50 +0100
Message-ID: <4a84775f3dbdc0d66882563598b837eaf6328d9f.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133111_655768_21DF1677 
X-CRM114-Status: GOOD (  10.55  )
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

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..cc70793e97ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -618,6 +618,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -700,6 +701,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1289,6 +1291,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


