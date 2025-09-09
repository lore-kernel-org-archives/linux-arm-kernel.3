Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD00ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSHpkOd4uK0+LGgGfUUkh18hfW5funXXjdKKM0dPo6M=; b=vONrho64Q4rygW1Vd4ZY3RdfJ7
	+8FNiZ8dYWDLwNmfmQxUf4XGdM8pBn7NP23dtKY9DtZqiLffFUozReOQI1y/ViBRv2smaWfOsdoDA
	3mJV5sG4bSZbHyJn9G5ac00uhWeIW+07gKNya0HnOJW4E0c9WXondB+nEWmY0ZTzgk5bBv5iGyT/V
	tNxj4Jmqecqb4hB5j6LcOjqMmeLq18u0TY3+OpcT4nkEn/yFLwXsATxcFW9coaP91GNwwyfwZTNGh
	3HqhAg7GWTJDlr44u+v6GCPtoMDKDJxFKrar0Ic4kkT2FnwZeCLdyKAy2j5JW3r3wHndWoa1YSGM6
	keSqd80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ud-00000008Cv2-1MEu;
	Tue, 09 Sep 2025 15:42:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLF-00000006Hsj-3qoq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45de6490e74so18633945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412768; x=1758017568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSHpkOd4uK0+LGgGfUUkh18hfW5funXXjdKKM0dPo6M=;
        b=WyIscV+XJ+8ri+oNSILmnBHTbU5RVIGgP+diASnjPebbZw/gXK2B6jwGPNmkFj6BkN
         vbAP9l1hU1pVAJe4lydHrtZpPqfsfwPRUFvbb8NavCKuVqixKlOj///gP0aAbxVyNUiC
         ixNymLNkxVoE1PUZuLgE6E3uqpkXnHZS/5vzllleXhPxtxhpht75/HvXPckM+DyiMiFQ
         arK48NqyFcO5K737uxxVJdw4oP3wpXsX9w62v4j6jGYBbRJwVqajF/LZQmTz6eo/ieuK
         bQsUdHaZ7b3LjNHP1aYVyCoaNwpQ3w6GoAdPhUaQ+vsmwdZE0SP3pHERTkjQWr3amnjQ
         CfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412768; x=1758017568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSHpkOd4uK0+LGgGfUUkh18hfW5funXXjdKKM0dPo6M=;
        b=u0bI80hXPAY/cZTHnPcQS5U58ZcD4IsRIv02Nc6VqW4YtVRHGC9sEgfk/3sfS6gUvD
         7PJ9H7ShNtze5orYthvarY/WwXWD+D0MV2i8YQJW3pTfwZETpd7z35UlzUYzxRcsSVBG
         GnCUHS8GWOGRaakzul4YzwtLDNjn6CqVZxQ38hZBHiz9nOV+7KFbW3XRxfAg4LJS+wT5
         ahPlv+5K7jggBGhiHM+JCPEhq9dkLN5ohC6T0yS/Ol9BXYkwCK5QSYOoeO5g0r4KW1Ej
         WAkpMKdsWLGMxY5Cf9VV/oUaLTvgFsUh/iHc+bRR9qj9dtqqF3DB+qBma+qC+023ulwX
         UdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZXpfp2oM7PQfgwgx7usdgEcTHUK1C/htSVDZzeHc64bbm/TMeB+h95Mlx6e492mfQ2kCoFXY/duNvlDCgPyF@lists.infradead.org
X-Gm-Message-State: AOJu0YxydB/PbcQ4Y/ZiE+YU3FsRVH0XPVN92ytRwWcQN5xbvkoBe8nZ
	eKI4eBNNobAKYDou3V2l+VaPKm/dZM8GXJnOuLgYt4zWOwChgiZ5ahRF
X-Gm-Gg: ASbGnctbm5/1dXXVE2mstguF4pPHWBKt0Atciav3OZS8UNIM1hYIV2NEo82yJ3PhXGX
	5aJj1MLLQKgX/3R3Ezg1J4O104nllvEfd7fiNEUxLKldGwBX6GhVH+HtzKtf4Zri4SfA5v70185
	f9IAU4UwoVhq7IfD1jE9UPr5s87Nq5nnyHrCXd7tRs0+FDEeVjFXAl48uogiNnjpiMb47R6B3UV
	qZAid0DvbxTjZajBUvr2sQ6zFi7cb1lok6abRycHd3+NN4ZpIvcKL1wF+1yDk8bCaqPi8JmVBYd
	7R+eEaxfgyrRB+KDWdY996qblkWJOPovo2fQSCE2KTRzYI+RJ/rsTlxq5vqH1S8/nuCo59YshLs
	Tt9q1YJArprL1xKmF5Q3eB219ESgw5Gxy81Qs8M9WJ+8cZfZO2tXCQucDrsT4HJSSwlNgJsi8iY
	4Db7VKK9KQShcB3rU=
X-Google-Smtp-Source: AGHT+IEBMPQ+x6q1DQHn6tfQDdXdqZ5wpu49XiP27S3xqO3Tqwiv+/CrXaWQp/nERl98m+vIT28Mxg==
X-Received: by 2002:a05:6000:2003:b0:3de:d33c:60da with SMTP id ffacd0b85a97d-3e642f9057amr7829659f8f.21.1757412768431;
        Tue, 09 Sep 2025 03:12:48 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238820sm2018879f8f.35.2025.09.09.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:25 +0200
Subject: [PATCH v6 18/20] arm64: dts: st: add ddrperfm on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-18-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031249_975058_D42EDDFD 
X-CRM114-Status: GOOD (  10.71  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP251 SoC.

Keep the node disabled at SoC level as it requires the property
`st,dram-type` which is provided in board dtsi file.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index fbedf23def52..69f0276d3324 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2100,5 +2100,12 @@ exti2: interrupt-controller@46230000 {
 				<0>,
 				<&intc GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;	/* EXTI_70 */
 		};
+
+		ddrperfm: perf@48041000 {
+			compatible = "st,stm32mp251-ddr-pmu";
+			reg = <0x48041000 0x400>;
+			access-controllers = <&rcc 104>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.43.0


