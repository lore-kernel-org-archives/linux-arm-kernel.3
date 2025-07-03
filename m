Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42622C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=; b=IO3kYFQsP7sT7faexggd1SqkeV
	v0o3BtACsdCJvBLw0/uEOutiugONJJCe8JTvTBWl0GtWnv8Tl2pV3wS7i9jw3NS7KOfsdSWoZKUBm
	8URQ3TLK9Va+DXW6tHhpiR5nkxRqyh/LhO0qD9/L3HLXdAZ9DHkxsD9RqB/OBhcyIqmAVspl2jilA
	rGwzHyIAY6PtTPntztzEQpTSuxrHqwLEJVe4PgAXOwfLyRoPbdp8cBf9EkhiobkSsBXSFC/U/F9nM
	6qIJghW7vPFRyjSjIA4KcoVDZvGZogCG+ZVZSpgLlrvGq8PotAEE8hFIc3sBAKJN3djqLczUTfJzG
	5ooAIdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJKL-0000000BNJs-1J2x;
	Thu, 03 Jul 2025 12:46:09 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIGk-0000000BBVv-3Wln
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:38:23 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-873501d2ca1so124017239f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542702; x=1752147502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=AuXe7mlUWzMBnInObvFdHRUkPEhY5OsNYv2bJIkLCzbfQASGCSKaWHDtjSbAntbtIG
         +7yKeyroUV5gFBdtj5Ajstw9DkPCSlK3fx7SG86mfJAzucJPp/FP4MbtoqVXaxqYKy4I
         PHeTNfSIfJn8qSrYt2hHiJdq205pTfzEnwWPV7NU6o2hw30mMik27NWU230e7jG1+DIm
         aUCyFYk217TMR5qgVZxYx2e/cnoACXF0B3CYGCoeasaKUju72Qzzv6UhweW7PlZM70g+
         gf0iiPPhe3Ts70PSN6/tImLZ4c3w5R/SBVYytFtT0VC1QCv/wUOT8A3PfnqkvLR6uNHr
         1BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542702; x=1752147502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=MhYDdR7glI6yS4Ssn3Mq7bvWyYQaabRZv07MWm0VQfO4ysiwj8i8/RzlQUS3rgPRYt
         PJiTrB09ilTtWze0+cv4we3i4r43iNE5wVLf0K6kv8IV2qEbsPQ2zzgXnkAOWsR7CwoM
         RIHYRqNmIvzfmReAKDsOPjtNs/fHQrylwcCKLKAmEmR/zFReIn08SVhlENzcvdFlxies
         oFrpsc054DJz4nHG+RXXydNWEQ6NJTooQK1XCZN02ItZcVKvaucCQJwzDdfjYTxrVzsF
         Ip5aOgoUsbSzxCoHxGrDRaLr/4qht8eqYcSN0tBK+q+LMkngdSB3fZlD3mkKmYXC9txR
         eN8Q==
X-Gm-Message-State: AOJu0YzU7FzBnX+SDcTqj196t27Cz5m8MLJan+rhcCDNJoHUeBzfRqfp
	x1B7JLcHvU0Zpzv6A8OpagrUiWazgIGHpRYa8v3COjh+D4OuGf7ZyXR0GKq6Ug==
X-Gm-Gg: ASbGnctLJy6fUVeGQxJXMrqYp0S9dPjlJv389IHyr2XTfJ2tSRZHy+P+jBgMqLTDZeF
	85qxjd8olFD4+m0hF5U6j2BHvUtbWl0Ev1HZ8iUPvigAjchPDJMDRC7yXlX5fMAnWG8UBxgPJIj
	fq1V6v0qlaNsR2BNXw3wP3ohLXEeIpEwCJRr0quIidihBrCi0SnSrLCjgnWIa8JK9kWCvuzo20s
	QisN2Kcn7C+LA26zO7KdDOdc1m26O6JEfNenAuNyLkW/N9wwv8zYz635jr7ZFqDfrSTmK2P5g0i
	FQFXG19i3C+ByWcpP+SRAXauqxQnoJuj7TbtIg/1CIbJmDLT/GPGi0Wz6fgCt0MtG+/rl83izAW
	uOR76ASSbAJCdMMj6W60aPrdqmlrIK+10x3Qi
X-Google-Smtp-Source: AGHT+IEAElfMxhOjH9lhImsexhBa4mz6jk1CGA5i/+dNtcBikMrBN+qolLPRqJUUtETlB6pD742Ssg==
X-Received: by 2002:a05:6e02:17c7:b0:3dd:f4d5:1c1a with SMTP id e9e14a558f8ab-3e0549f29d8mr72031885ab.17.1751542701597;
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
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
Subject: [PATCH V2 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:10 -0500
Message-ID: <20250703113810.73023-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
References: <20250703113810.73023-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_043822_877988_1677DC22 
X-CRM114-Status: GOOD (  10.68  )
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

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1


