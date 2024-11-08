Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06659D5C0D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19nNoiZMI2JgXeIpnibERXoHDynmYT61X0LDoD+6J9c=; b=cHmpJlzfQ0nVd8NSk4bolD8wBF
	mQULvgiUUndxj2K9va6cQgZ3MAwWk1jyMlXN+D6XVsut1TDg2tigniVu5q5T1mmZasdp2whiGFLw4
	KH9w/vjb4at1gF43bJ59pBJv4KimvNKZqkXOVnzbzj2n6/A+zTkYkgMVm79hfbvxx05rJzaYdjuIa
	WvCXd5IF0tn4Ljgc/nEeAw0kVBUoZ3fgMFeHAcTs7SDrPPFMLfzA/TNMqNR56RilLvdy89/wbP330
	ZXxtrIJk0jZHKJymRlVfLAso0oZ/CtAiSArvrajRVpX5MWceYvDvdwUqHS9/EbOcaRzIY+m6EhkvR
	3YM1lcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QMS-0000000Auyn-3Yz2;
	Fri, 08 Nov 2024 14:53:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PVs-0000000AmKg-0O6x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:59:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d447de11dso1507456f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074338; x=1731679138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19nNoiZMI2JgXeIpnibERXoHDynmYT61X0LDoD+6J9c=;
        b=lJei78q86vsM6AJ1SDi8a8EpSfHxr3UXMaOEuSdMtQfp+qcj/nV1UbVDZ8NXvUXleu
         sB4YJ3jXD5KoGLOY0FfBkUNtLgG3oiECRbY1+ux5H7Ndq5DUDukyU6y8tmfj0N24JL/S
         TJXyiRmR0QqOAgJeivYPAEKSecstufVWmlRWezj/HqPdhToZ03n8pQSPd90C9JRKLFW7
         T5SPxxJaCok/KOZRYfmhFZgykCjHzwR97usfLdQI9R2KjCdZbCCydp1zudE58loUV7rE
         EcxmPjUo4TB52F41iqdCdnR965H83frD0k6BITb5LElCiH6wzjgGwcuTbj5GJ4ZMujnU
         mQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074338; x=1731679138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19nNoiZMI2JgXeIpnibERXoHDynmYT61X0LDoD+6J9c=;
        b=RFC1gQI4zjmTuqXcA8whNXEYHEF+xAWSsk8gANcpo3N7+pQGeseZXfuusc0pjDIjhl
         qfoD5dh91Z9LyB88bvuxNTDhC+RzJHMGh78pCIm0I50Atblpe5JkezKeO7/K7St0bxKF
         awrfKds0FAY7FyrIYhEvAh2kBPTn9f6256IKPVdzOlBwL3VLWyWedLgxM+dyKs5xIXDa
         VaEujMFsWKNTEr8FusBHbG1UgiBvY6/gTILtmkHIqw2cPnWS5ZUnBSBVL1Vv4eGgSneY
         zNEiIOByrNwywmAUU4sX70puXkeqHGyG7If6SAwi5WpX9Ez11xw9xVY906FrO3CGPqWR
         6hOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR7W2DN8EszZUqXZAe3DtSW1Q4FCfdgqORBzN6YnpPpgSuyfkZAF70Hr8KNdoJgIzAPsLCoQGlIGrmB3s2FMw5@lists.infradead.org
X-Gm-Message-State: AOJu0YxbBsw7k/AF2rUFbj8qKGJrdR+oAhChX92hiIpf/6zPi5Y3F6bN
	EDyEo4LnkNxVfyD6jba4Pl6zzcCt4MDG3LNdw0qcVwVBqiWl4wDaB9VhVfQGkEo=
X-Google-Smtp-Source: AGHT+IHddZyZHnBvXvpwpiOFOpBw0pB+ps3Rxlk3QlAmQ6sdQYs/NNEYqY/D3vFEUDZaWTay7pUGFA==
X-Received: by 2002:a05:6000:401f:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-381f182fc02mr2476225f8f.45.1731074338350;
        Fri, 08 Nov 2024 05:58:58 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:58:57 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/4] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri,  8 Nov 2024 14:57:31 +0100
Message-ID: <20241108135855.129116-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055900_170315_D793D124 
X-CRM114-Status: UNSURE (   8.24  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42..4650ad3674aa 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -128,6 +128,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.47.0


