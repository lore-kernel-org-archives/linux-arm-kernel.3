Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B53C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=; b=tLMHJHq2kslhYHT8YNmOlZ+ZwV
	tE6OXFnnKwgI1sSKPlp8ruRD6av3XDNA/5iI2Iv3i33UNZEPOZ40l8foXntWQQd4nUV0BFSy8kzHT
	f/NEC138Nsm3+WAqMjjQg3pO7NtNiTpQOq8P+OuU25hUgWNtyteUYi9o2z2oKtJKOov8Ztv8p4P2n
	1fsAks+9mIFiJXCMbEkGCWOflCWvcSJeIYCf0SrxngIwqQBbx1aaBvPguWvnYPbOWGQSrVPDuYfxo
	wuT6o8BQKWj7bJvtSU6KHOH/FqboS1xxTnp3qN7rYO+yfR++Ap373GH96Zr2cmzKgGz9hs3VYXPvN
	6UBeZtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gXV-00000008umn-2vgT;
	Thu, 10 Apr 2025 01:17:09 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGd-00000008sCw-3lgZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:45 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c56a3def84so30972385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246783; x=1744851583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=a/Ocg2SEO9kjROaUO4Lr8e+gK8WmzLnW7PkGgbkl3vDim32Cloee8oacdO68miCDAS
         C/uZQjN7DjJ1n1M2GtgVZfXOYPvF1NrzWZHWS7U1DZr7yQYWkzhbdkHROPRkZu8OdZH8
         bEz2tjIdnsYz3UkjsVZhnfrpSxeA4PYM25cdz79pfrMEeYz+yEQkZJeyEm53LAkcJ8sb
         ek86AJYxdMWmffFaI9qEBU95rCNprDBQqyefo8LscSgE/+JXyJdBGOLfCzdeM1aAV6MP
         u+jtRlvVsEHq+LlUGDo9r4IaUB5yz85jGLTFwp5mzbh/POrTsrxA3QNXzBBQVTyACF60
         2z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246783; x=1744851583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=fDvRJuOmsOucVJq07IgLg66qAoaVq4zte0QO3p59SZRl5aAoQFdZ1J5ybRd/qRWYzc
         vAabjGOdS9B+KHZWI7tktXGnp/EhzjlSni/8EAz90uyjDzptIDAc7YgzZnLb+WF4xP7s
         XjOydjidBskzl8TdeNUQSVP29Yo7HkB/L8aUN2FLY7wUhVO8vZG7YVxI3yhzb2WtAIoJ
         lk+wdeXrmY0SFP0/OW4vpOCRFscjRpl1k2Wlxc94jfgKfmcwVtbQXQwFl8gVsPLlgPYg
         RTY5h4X/AqnwmURhxI4zntsiN2+OGfgoiHQopu+eXSKaapUhLLu2WZ66tqTaUz1zd1V8
         NpCQ==
X-Gm-Message-State: AOJu0Ywe3xnlYEvOXLBfIIcjpFwkt23ZyXoRw6O8Izs0R7Uj9RvKZvrI
	pPV9D9uEDpoWAD9gU022HlPoeHIMWOzSMkgY+RZ14G2LolUj0HfHtVcCjQ==
X-Gm-Gg: ASbGncvwTYgISknv2ebEkYFaKTuvJ15D6R+JvGJ0Ys1ixRFcYJ2nARpMOI/L/J1iCXC
	i0wjBLgv0zRWYrxK71yAiPrJ2Agk+ZYy/rG88tNadKKVpmWcb9XpLfFDGsTA4Frpv8sKChFH3GS
	nXEXfDH4J+mGYYPttWtFO7oYXc/Co91uaP5sagvXkC/QX9SZzcQgnMW9vAwAWmxWNPnHdfDkkcR
	xz2ynkife1MxiCNYTUHWP2ah1RkVhFgJhb4nLgKMoEDQUBBOldr/iwDaPMBSmDyjUss+DuNHtsp
	BfL2s+U6rIqdjrKZst4cZgvZgQLtKmxMaQg64y4wrQxwxxCQetAwFvoE76Rxc9YF/K4aWmC7lDN
	buBozaenQBvqHBJQ=
X-Google-Smtp-Source: AGHT+IGkn5DN9CLotIyJwd+pEk5Z4mTZgh2X4YBP62+cyvObhjex171ZLRHaadE2Sva4HkX98HZhxA==
X-Received: by 2002:a05:620a:2988:b0:7c5:a542:10f with SMTP id af79cd13be357-7c7a76bf8c0mr139525485a.35.1744246782717;
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:03 -0500
Message-ID: <20250410005912.118732-9-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175943_951518_8131B5CA 
X-CRM114-Status: GOOD (  10.31  )
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

The external RTC has the ability to be used as an alarm when
interrupts are enabled and configured as a wakeup-source.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index b3692b367a42..987c14d3af9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -245,7 +245,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1


