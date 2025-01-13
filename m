Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3DEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=; b=VpEqbynl4I95seHSlrckU4VjIM
	niV5gAqnTvZ9qM7PVk3/pxHY/L5G2CP+GKmUtAP7wiyuipsHTemlXFHF68IwqDUhTr494zJRqQd+P
	rUOE34HihOD+PBVVJYZ3nPn6d2GJL5KvHnbg0Bazz2CuqAqXqwSIXuMnbEBFEwPLINx6b0ulHLP8F
	G7LParQoTr3hTN38b4QfkIp04aN/abHBZ0L8zBywu877B6XDDYd7F3jN8nYjslH9dsgDIhxdPzng6
	NHY4HyQceBXlmOo71liJOo/a7Pg22h/J3cmJAe3VaItHj3fi0LDqmhPIM8UdZU7BUoMfm7M96C8rU
	eI9Jr9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNAn-00000005oub-2nDw;
	Mon, 13 Jan 2025 16:20:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLsk-00000005Vxk-3hZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:57:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaeec07b705so714515666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780253; x=1737385053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=NnqP3V87QCuE/4uOt7FIfIuotrQmXOYlDALt/u1/YdRlXqWBKllz7B7TUbRKtgLwzB
         pdUviAkRaYUsfChC06zQJvccWnA967PoaJNZpsjwjxot2J9HqXNAo8vqZjndhm+Ny+WH
         c2NvQXr+Z3t98S+TeeXpGXdans4weFRFojnsYDOnVZWladatrvTExLvtfmmf3TK3ikx2
         ZRlkhZP5RyesoHkmlO9zy9Yu7ivzAWTgh2uV/Ms9LFOapFqaFCHdvFVipBe0lAJoCZy8
         gm/ncxRofc4nXeQIvrFlwLBWbpwYnDNsbMX7sjGT/JvNoJUpECgXyqBoxIPS8H+YUels
         QXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780253; x=1737385053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=SpIk5ojfb+qSyOy/nWk3DiBE7vYrNz1YRMMuil6iys4IN2sVd9Dtk16Q4z8gDPZmQp
         5bYQ1X6my1VYT63NidFGo/a5PT2OvoXF2BkN+S62v6vNjvJmex4GCBLBBmdX6B1vPP0B
         Qf8M2147RMsHVR1GsMSkEKsLyc33VxfWdnImEXQjFYbcV7VtVL3AOQRQFmMQ3bRCJ+6V
         626GaM5QNn/joP7WlxqIXv6G0yGOcZbTJOufEBHb/8t241gI8SWEIOvtXQcFvYTqXKPS
         ypN9GJZ38MTc/rn1SGta0vHFuuN5MDBTHttuavQpsUGgZUeM0U/r/olH0PVCSjLgzglb
         FJDA==
X-Forwarded-Encrypted: i=1; AJvYcCWJHAVV5DJK1K58W0PfRQSR9TSmA/xRiw27HsD2UbRiGd08Je5vYBg7nbo2soYoC3hOA8ul1P/gW3UMW4ChT2S9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LwqWB/+EsurYG6s8Kf30Y4B9y1TLdV6NoQGaUc1i2vAh14q7
	xl/vmWjgNdek9hWSTWarmkgV8IBHdL8HyWcJLkkixYOLvIr+HQsH426DlGCcQbM=
X-Gm-Gg: ASbGnctV4c+WaoTAvLaHINx30DDHqfoa0EjDy7u9mNCIotsDYt2L9pLfwSl2jMJpbNQ
	4euSDvsgbrRjg4razjurt8l1fCllBDlwlK0y/JZsVTZYfvFnlmb/0tlFrR1erREqjKTQ3V+kB7i
	vETRhgweedE//hGn5zLxKg0KagqmpZ8qQsHYpeahxXG6yxfgUgiD2i1Ve7bEWH1aOFhWGvRjnOG
	+BH82mvNvukR+tqH1NL4sJH0Y67FoSZL0eFdpszja4ywg52fqFXI5d0/a+hFoZlyVV2CaZCOM1r
	IPqMeoqrvkAmBLIZcmBaOQ41Efs=
X-Google-Smtp-Source: AGHT+IGT7ZUyRqjYZDfn2augtPO24Nq1KfGdCS+zaijGp4OI6jVXn2a8avrfPMk2uXfMIqlZpqSwuQ==
X-Received: by 2002:a17:907:6d29:b0:ab2:f8e9:5f57 with SMTP id a640c23a62f3a-ab2f8e9652bmr767188466b.21.1736780253509;
        Mon, 13 Jan 2025 06:57:33 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c96475besm506777166b.180.2025.01.13.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:33 -0800 (PST)
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
Subject: [PATCH v6 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon, 13 Jan 2025 15:58:09 +0100
Message-ID: <325cb9d9956344fad68c137b99a9c92bcd707481.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065734_964076_389C7517 
X-CRM114-Status: GOOD (  10.67  )
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
index c62831e61586..91b39026dc56 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -690,6 +691,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1272,6 +1274,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


