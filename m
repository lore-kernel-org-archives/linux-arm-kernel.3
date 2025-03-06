Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60004C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=0nKMe81qKztpu5ydz/Tsno5zIP
	Ap9ilta1aRVks/MswBpFi2KwOzcA0CWpLMvyNxkr79+wobSxO35xAtl/x6rum2CaNH7QapNu3mRmG
	j8go7JgpFJ1e59DHCDW949R2fSt4gzBVkEvykJ3BRZ80eYdJ3DVbgGSUMZgPJ9IeoQ8lESE6KJY2T
	2DZalqOsaVGhQpsYPm8Jvh7FS65nWgu4Axf8I5l4e7ewl9gG5fPCKdWjl7NE74XkVT8Qafkyu1I6n
	GhrylJ6syfzP/QD2jsPjoC+nq244dxXiDXyF5pJPGfGJbOv9QoOk+akRfYOBIzBEaxeSNwdwO5IAD
	MHA9SkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAOJ-0000000AvWt-3ipk;
	Thu, 06 Mar 2025 12:31:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9R6-0000000Amk7-0QRP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39127512371so407573f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260643; x=1741865443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=AGzjxcp5Q5MX7glynxj5nIpiZF8jzooChwtn1kbEJ3DmbjyaWLdRsqzq6pu0trTUxJ
         rCr6YcFSQr+ayVucQKiU29CPiGt112xGSyH3Nn/Z9Q5y+YK/yeaWfJZz4Bo25FI6od1V
         OZN94fAKNyjdT5uhDHHx+fWVxEAOAQhNT54pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260643; x=1741865443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=u8Mo3HmwEPZ/pWnT6BY9SDcuTQ+bash5myTra/hTqeEhxmnXq+49h2RhPEcCvt5Qr4
         g3Rvy+QCnU2rVZPcuGyr5R7+xGQKiba3gFPzEMdFEmQWqYk9BX1Kiff7oVDxQKuIHZ9R
         0Sa3xCnsk8RNAHjXvYTnrvH9zcILBoR0rixw2yHJm3MdbcjxFlJSLAV/IMKYk0EHzJdy
         5rFIzc4MrjYgGF6U8DdEcQCt6A7Bjiw/45ofv8UlEIaDl001GOpbbyKd5TQraGod78Cy
         7PE3z00wxHHiIvnDdBrPXC/yFRsclC0vCrS+wrdpA6wALpDE5YpGQac9u9F5tCnod4B+
         9JfA==
X-Forwarded-Encrypted: i=1; AJvYcCX4eclQQOUtcsJu+zd6cRVp32H4FzqefCbv0+tz/Oa+53d66lw327jv1p2Hz4OgT9efVrXpzap612uyxxPjm3GR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Mv0iRZBaaQthsvOo3HS0GJ+5W97LY9SXS2lfJVgG58Lmq0j3
	CFoGUWv2IKlY6cOUjz01XIzU7GxzFAc9+tWUx4rJXpJWWwyUqndsluX5Ax8i93o=
X-Gm-Gg: ASbGncukIh0SQWmYPbS5V+8uDQTFiJV/bFyoRBqBr1My8V4lx5TO8DdVOzLjtbxCJlB
	+4doSajtJZs/Af/jXmymdf1PeSRxL90YemhMVqp8Egmy76tFJjfNdl13sCWcpaLaVGJeJNDd3bb
	OAL5eXGA/0upE1xp74SloDNn9KmlNQX4tH4tqEa7A2v7I/CCj11tfooK2TAEyWVG0h3E9M8/NUW
	TUtBfR5XHf44b7UUYw/tcDmZFVHdWj8z7lnpBjmTF+7eKPw7ZoyWDsfz7Kuc5D+RbY5/m6Fsyn0
	LlCYE5VSA4Bixs1csjaOdxZGQJMrtW9oEgUAn3hz3TdOi9MOHfkn2THP8Ar4axSWAAJVGy7u56/
	3+p4ZVg==
X-Google-Smtp-Source: AGHT+IHvHIK6gnR7vBN0ADzhz0P4KuVyIojDRjOIHgSb1eLz6CEIpvyk+w8pwsH+YWiTBaZGmarvoQ==
X-Received: by 2002:a05:6000:154a:b0:390:d796:b946 with SMTP id ffacd0b85a97d-3911f7c229amr6475681f8f.44.1741260642721;
        Thu, 06 Mar 2025 03:30:42 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:56 +0100
Message-ID: <20250306112959.242131-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033044_139004_AC4660EB 
X-CRM114-Status: UNSURE (   9.68  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


