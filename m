Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B60DD46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=; b=kx+1bNJ2YcRdqFNMiv0hn8dz0w
	9ndl7GIlzhzNLkqkss27pyVRs17PmWk7WsMh/tZAjCV37mAoalM3ELbA6ziTLwM+9bKYQbBaNZud1
	HyGMAMVRhNnFBAGgCgjKxkXujQv0KxwGzWFVfZypmDeiU4resCMslcpuq8svWqgkrzg1JQtvfX6e6
	kpr8O4noj/A4b+BiMmbYqpfb1Ot8HxZxtpvZzfHgpmL/RcKz2MuMLsNWaa/Sj0q5ityvOIjKqLGxn
	OuQ10jK0Ju8oYN7VrCGua6RuqREpj6ttgUChZE7vf/Dqn48T76X3VBO5+Nz2lvyuQeG3tQJ2fa2lB
	aC31C1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCGJ-0000000GmRn-3ZQk;
	Wed, 28 Jan 2026 20:35:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCGI-0000000GmPk-0Ttj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 20:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=; b=d0LL7e5Z5nWX6E3xxeqT/LXDi7
	IUyKDkcVGjcPrqhcNKXCzBgYCxDMPCxZk71cr8ZWG9jpvd8BFUA/D0FiipMao5wXcaAxcaoBxeF8g
	cDrIXGcS3JcKl4xYI0gjTMpLt4/D56mF/8/vJP2RRj4qJVSN7csnXPnGM2hewTpbx8smxe7juf/N5
	cp4mxPownxB6ja23FGJDYHDz1lGs+IVM4eAvI+MX/s4LeeTFHmbria5BnNRUx9JQ1IzwFa6k1YezB
	NNnSstqQdNhxj6lGjjGnNcjRExb2rh4CVurj8gLsNHx26KDx3WK7YIKl1roELhtzAlvfQ9o56WU90
	dfu8IY2w==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCG2-00000009LVt-1b7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so2424515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632519; x=1770237319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=MPX6ZYMslhpYU0kRCzKmO+TqF9I9Sy8L8J0st9TX2Kri6zNOWWkLolPmnBfBCDUv99
         agStfwfL6EmzKpyCqcgpSMRk8h/flbS1jnpyFZh4r2676kd59MenY9B9JSwIQ1i5Gl6h
         HWvW77EBA20KLmTzo4PVu1Rs0Lb70JekTSEWd31OS2/tVUiab2zLl9wLYwaXxEHzz0LH
         FgXGYijkOkmDM2GzeN1jeJxVjlODiZ7uOJaSZrR1U+33J9hbJH0Mqtdng7R9cTtULcRV
         ophd01yG09oFkUhy60B/Ah4eDca630ATGlROeKSFu8yrtLES/cy34aB9rJy060MB1TRH
         FT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632519; x=1770237319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NEmpOzcIBlkA1huyHqaVTW0k9KksYnxs738QX2I8sa4=;
        b=eiF6iRr3x3uN4m9A5F00PUwEaawGTzaxIMc3wh/Do0+P8g8P37AJkgm+yGSpRdN4Pe
         Tch9hTpHM5PVaLqzZ3ISSepy5ql9iR49QSXFwyvLXqwAOjW0+g56IDS0/7IlHwo+m9xB
         Y2o4il4Jvoxbqk74HnabPmjEZA1eCyrle8ujHf01GMNVllg5X1M/Q3+F9jUTGUeeCOYY
         1UI7YEtaqExy5nPgJPC3KB26NFEe2s7OzujhvO2OaLJK2tWRpf+P0FloDzLdNAYwCJCG
         ntSn14smMaVUMIOHfzkPXPNJ196Vo/U79jq313ltBBJGzd+tU5LBYrnZbWegSHmQx63h
         eP9w==
X-Gm-Message-State: AOJu0Yz8zeoAyAN5YTX09KzRI1WrC+DreC5nMcV92SbnDLsPug+5gNkH
	IHwqQ87PRrumIlALkEg8XlWGosq3JuDdbF50WcFcDIk90duoW97A5EfCNiTEOSpG
X-Gm-Gg: AZuq6aJadwCYTNDcmhm/0Gu/fs0ofdIFkevjTtMlJm1xBz/f+8naaLrzU5qxXW6syNZ
	o8h2s6gIt8Ic9IbhKOqajQfwjoQWg+kPojiynF+5g/Vlk/MTcGCHQvVtN7TTlR6R7OVDHtGrwhg
	yzlgN9+Umi+lC03dveqj/iRG6DXE2XFYAhGXN+qDJ7eTIaaax+16je9ymClL+/p87RCDWnTZX3/
	dJMILRdhq/h6rPEOhvdzaa9Qz+Av1L4zVjBpFTmLQW9EqvRZYhOWONgPEYThlGjbPe3Bmak42Hj
	rc+vnGHQ44fzzHE8MXB3vIP3a78pID+IgZJtc+smoOcEIBt39d1IgLT63EbTsAo334Kygm965Go
	hCNOrUNT2URD2SFSMNcY3yqoapzAHHARhaH45jQekf+x44rB9gEP8nn7nVi960nXuaoSgBh92rv
	VNVTwr+zLNQgsOJMXpWjywLW92o878MY5YzUI=
X-Received: by 2002:a05:600c:3f0b:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-48069c0e198mr86825655e9.7.1769632519415;
        Wed, 28 Jan 2026 12:35:19 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:19 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 7/7] ARM: dts: Declare UART1 on zx297520v3 boards.
Date: Wed, 28 Jan 2026 23:34:55 +0300
Message-ID: <20260128203455.38569-8-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_203531_700592_E47415A4 
X-CRM114-Status: GOOD (  13.19  )
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


