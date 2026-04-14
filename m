Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71046F9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=; b=Uk/5vGa9Ema9MaDkOKoOMKaxNv
	QTLM6GqiXf/jXj75WpUc4UO40wn0ajJ1nqFltRuP4TM1fd/EgPK/9VimHnOI8Th8pTNYK5J+sPlGd
	4VYlSertjCbTLy30g313wgecScV7SWaaMZ0RH4yo6HnTZiGrSNa/K2m1k+E3InGqz/rZ4+kTSIT9c
	iqC8k5VVnyW5gUWOPui0ET+vytLt5zTFlJGPmurV8mh0SW3mTuHzAaZTSGS+2JDqE2zVm2iqmNkWQ
	EWomkPQyJR3NYJYvA13C0IqLlBU5EusNzqxPQVdMBona9SxYqM2K9k9Kk1GyNnfIRYTL9Lfkl8mrI
	XhVo1Xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3o-00000000Dyb-1G5d;
	Tue, 14 Apr 2026 21:12:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3l-00000000Dw3-1SDr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cfce3a195so3783038f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201155; x=1776805955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=n+SGxikADKA77E6te1W+7RThN3GWAyQqBZmYlh7DTGHh5SGbM1zNXd7MFsznSCLvuy
         xyqdG2A+AEjHsENX4v+vnBnKEaiVO4I9JoLII9tjJi3RyBkuJqJhP4o3e8nbRlgnkl6q
         WNgtqAgw4Q1a7bTKtVXq0aZeGFM3+3E3zQeTocP+02n666rozfUr4DHmpv8GncdTqVmz
         1OCga2Aimq/IkGrxeMf+Ex/4jK9ybejteTFes1+02CjTALPSTvwLHqO5KJiaMTnn3SmT
         geLHRIZwlFsYO6BclSrp/61mgkScd1njflkf7oWUXtW5IAwUrDCwywmTRrjKqDGVQgMy
         nESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201155; x=1776805955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=DdSS297hktFwxSGkPw3j5vrzwizJC+Txy1RWrGjbHLFw+qkT5M9xyhXlAWRPwzpwUU
         eJrLZLEpP1wIm33uzvowQmwv5RAGDb7MrHHKgaSA4qZ8/ROox8xozB1FzHEBz9apf6aA
         ouDZUD6vOqjMBGbc8R2d6mP6cttgB8yRE8MwFCpfYUG+TcoTBss0RgCxaNMW5P+h4s+5
         YMq8iy1mV6I8OI5uQqYtBQ7OKVfgIIEDrXmdSC5TZcmk3BacyOWxA+c1kCtTMRo7zdf7
         Dluj4XoEucDfjgL/bpHrMBhVV7BQxtHDjnCYDp3Lj5VnglQISAeBDtpVkkA5WKyG8h57
         Y5Vw==
X-Gm-Message-State: AOJu0YzxXkfDcMm36ToGxi9yNJLe/6iDiXGj2SYMRjeR22nIqmI3A+bd
	iLB+gE/R6BjJ5GllzUK8Fk+uTscJOKpyXpjkT4NTG+ON38Iad6leFNxNeaeapTa7
X-Gm-Gg: AeBDiev+RTjn2J8+8MZaF9fzQqMYQ3KrxPWFjFXmN1vecbkKgzNdjiuJnavwvm3V6i3
	Wkit+3+fd2GmwpzQBljNG297TtBAh+BP3WL2gmBYPNf4OD0xUdEUHOUKOURayzCu4U1ZhQqJS3g
	YcEJsz6HJAAGhHeDPI5Ha4P8nALlqFzgKbSfj9CbMwLP4ucpzrWxdW6JVw+bpzVAeTrVbooxDSD
	Xc4Qhh7j+i2RGzibymh3Wy5CR9w4wOGw9Mao2G5+wI/ehNPAd4MNoNwHknK+jqJ70ZSbvs70JTn
	hwA1l2qM7/yUIb1efchAKmJwY6C4nx/aEp8JFyK5T0PS8Z750f+sJkLY8W/qkEINDwVpqa0JlvP
	KmtTgLUOUQhvNnYzAOkRVQ09LinXOZoFEwhP7alFyouOiXjwPGdIoAhsoxMpg1wR8NsDJng96ut
	tfBkiBFSH/bWA+kwEQQsKLkQRaJiccaLzw9yCk0Mm5dlry688mBY1aFQ==
X-Received: by 2002:a5d:5d12:0:b0:43d:77e1:6a67 with SMTP id ffacd0b85a97d-43d77e16b06mr14875137f8f.5.1776201155291;
        Tue, 14 Apr 2026 14:12:35 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:34 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
Date: Wed, 15 Apr 2026 00:12:14 +0300
Message-ID: <20260414211215.152850-8-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141237_394518_FC568243 
X-CRM114-Status: GOOD (  13.88  )
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

This is the UART that sends Uboot messages and is accessible via pins on
the boards I have seen so far. UART0 and UART2 exist as well, but don't
have pins enabled by the bootloader. They will be added later.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ecd07f3fb8b3..09fbb1d052e3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -6,6 +6,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -57,5 +61,23 @@ timer {
 			 */
 			arm,cpu-registers-not-fw-configured;
 		};
+
+		/* The UART clock defaults to 26 mhz. It will be replaced when the zx29 clock
+		 * framework is added.
+		 */
+		uartclk: uartclk: clock-26000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x001feffe>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>;
+			clock-names = "apb_pclk";
+		};
 	};
 };
-- 
2.52.0


