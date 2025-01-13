Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7193C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=; b=x6QZ4dgTOO5dYEf8TbBzcAia1B
	eJxUufm/u4ulieS/jeyUhEOf4xNZZgZdLFjiNq9dPbBZJP0BlzrwQtsfvcceqyK+sbXzN7tmu6CSm
	dtIVKRrerdNRdxBPgkj9TO5tFGT/GHNd4gvnqR9VpphVOtGbr6RZJpA7kWcqt1C87WkRBhgkv/wqD
	7aAkATokMALCvQ6OH54gLMFwfQmAvQxyobZyMyfWJALmIoXisSxuGorBpkMdJ/xZ362dwYQ26SoCm
	MRymLRtLnRmsrVVSMWJRmOMjolSqC/dDCLafTDNOje0eKxqYTzDSgwnqb+JGa3yufoInVcz4YfjtB
	hTgF+6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN9Z-00000005odE-4ArQ;
	Mon, 13 Jan 2025 16:19:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLsk-00000005Vwk-0nWA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:57:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso6300627a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780253; x=1737385053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=QZQalfgv1Kl0b8e4YQ/7BmyfsoOdaPxKL3SJKnFPmjVWOzPwyleijuYPGPv+6X6/2Y
         tDBvdmCX2mnGGIzXPx/k+Z638AP5LJ/7W9PAsWgin8haOt2SXg06seKdMYkYKfcwhY4W
         APbfVKAxBJms8TqaLojQ2L1SeR9utbxN5USIt9QlGGg0dvkXzq34ig+h27yiHQhRiT+g
         +ErrMY+la6KhO/yBHeRv6gKPigi3sQ39QTD21zZ20Puxln7RfPCuZxF9P2BcWPC1fJrq
         HalgVcDzl9Hrg1anK9r2sK1sSFp3Ipsasp5kgTSYC2QjCXbtCGi5fHKf20ORxHrkjuQD
         upGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780253; x=1737385053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=vXji4t7gHBuoSw7eRZtCc7s1Z4m1/ytIwI/008XeLmoXI082NZ0y03SEUN4Gbpks+L
         zuUM8UpDhATA/ptjCwXajx9cZnguCFbrzjhel6rSB+rpR1QuX/PSyTdxmGbcAIFQmRWM
         +Tg5u13/z54MuohQh8W3GvhdYrePDz8LxhnoO0ZpXNBSIfLfjdIqVu1NJn6WkLSGHQbj
         eTPUcmqGDuXg+1KyUbY50cgNWS4g1QP2uyC6l2UHxKeDbb+yMX8o4DBtmGk+o1rKBGtv
         dC8LlX2vzj75VqzeHU+bfi/mrhza40Sq0pE4ePCQmKE9L0UrPZkPeLSv75d+jXqLE5gO
         K2/g==
X-Forwarded-Encrypted: i=1; AJvYcCWkFxaEYPrSv7i38agekgEuyh+C+Pm5q0Q73nBegwYd5ncfbgNxDOVwfR/jO2aNMEz8p+mEaapuv5ZoR+aHRSN+@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjNIUaUjGPbpRRIB5LA3d5BZe39saDRzWReW3N9G3xjwJo47a
	H+yqgmRFL5IrfXLFgMK3xxYHicHNdJ4jmMzp3fcJwkAb5MUjesREFcvRl6xVwLU=
X-Gm-Gg: ASbGncvHewMxgXgACT5plQ28GOIFbSX+HDSt+1d1Bsc7kPyv8E8WlH7omNcFrc8DuG6
	ryt84bqIqQaZ7nUdjMoAhzgud2cueaQOGmpN1K73Xuxt+qBrmV8IJIrt38WmUdz/LADfX9jxVfz
	ryWO0VtyguqoLd7wrSSufUy8YvT/ILLauZ3UFqpZ6EscBrNO0BV+aQVmI2zi60xKzHsLKGCUyp5
	3maRB0PndPqLy3nQLopxgmnwOE2QHhefK3mA6aYe+PoDVAFh1GAtmsq7j63zgWbvxb7lEXCHjoI
	c7NsSs09NcamsjptkLhGW8rjwKA=
X-Google-Smtp-Source: AGHT+IFIxrNKB7bGJmJiodj5rOVrMgbeQ6c2Dm+g2BvJJIffbh6/B3xYKNDCOnj1PjUeZNJ5q9pnWw==
X-Received: by 2002:a05:6402:40d5:b0:5d9:f21e:ff5 with SMTP id 4fb4d7f45d1cf-5d9f21e18a0mr256894a12.16.1736780252625;
        Mon, 13 Jan 2025 06:57:32 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046a07bsm5052479a12.65.2025.01.13.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:32 -0800 (PST)
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
Subject: [PATCH v6 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon, 13 Jan 2025 15:58:08 +0100
Message-ID: <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065734_234759_8796CDB7 
X-CRM114-Status: GOOD (  11.93  )
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..ae3c0c153cea 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3


