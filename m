Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F23E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=kvZetaesE++ZnHEigTWuzVmBE/
	Ls1dlEhqBIZePElTrgkLqSE3bnpZ3gaxVSQCz9TQ3i8t1l4iC7W4BWEhKLGlmxVYeIJsWsFWhrhXH
	MChOaOnc8gQSQYavek6CoBsuyOou/zclPkVW8mrAHwf6Bxo+fAuWWm3L+CdjUJAc/ZOuL16+P/3aw
	oOhfeenQPT3UnFnfbjWH9pHrOBQXyhz6BqexA6npZKpmQ6BC4m3b8YrTbVATZ1z9EaTFA3UcruNdC
	nxu2+yiQEpQntLoygEm5gTe3x37A3O23h43yOIXMqVR9e5JQh+w0JRJHY+rh1POP7OHWFFc/WmoTZ
	TBSwzfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuoX-00000003Xqk-224C;
	Sun, 29 Dec 2024 15:02:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRucy-00000003VyT-0sjH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aabfb33aff8so1483807266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483846; x=1736088646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=hF4nFLMyiPjN+VHzRKO5XfXBKjv8/xxA3J54dWzseXLL8p7hjmby2xuINfrVZkVYOS
         7ZEWEdFSKwFYkMouDF0i3Izb8MyFJJYKieFzJYN+n1euwtTTP60yW0UYzhh06lLGi5W6
         o9LFDS6poHv27/VsowSSID0u5+W55qXQb1RMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483846; x=1736088646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=JcMOqa1NNlQl1VyFhIzyEv8+pIqaO4783AYmUqSMJpW9+KiSydSKPv2I5j29kZb1u0
         o/a8IK3OeNNi3Kfl6P3V4BudqZEC1j9nlMmVESRz24PjsswMLEJNBcSelxs1BTSC7/hw
         SfQixGfK8Q/tZqbMOmIKsvF6w0JM566sSdeUTQqxh0va95mCATMXgr5Qb6OdSiK49qK0
         GUPlEuJ9JBBHywq/qd8n8WoS18vkeODw24IjzNIxpxMYO73anXpPQ/m1blXIgD5Cjysj
         ku1D3m8odSrLLXBd/TmmfHAR/Iu5HZyqZWrfyoDujBVQ/SnI+YN9KJK5l9NKPsaIgGA8
         +sBg==
X-Forwarded-Encrypted: i=1; AJvYcCXPmZguyxL6d+4u2zWFZ/vEOhUOo8EfHSX7f7KQOzG3S+H1JUAha6ZtPcnX9ToU3nmanxrEgCM13CeRqHHcyytn@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOTJGaizxh/c/Tga5o3a22RJxvXn+oYl3tHmx8iyHHwL5hi5q
	THC0aBYwGrpoM93WoTQC+WcW0QzAqfXXUnoIK1YexLAU/C4OQ75vTU648NjCXx8=
X-Gm-Gg: ASbGncsMYg2LVPmL5iVMncru4hEKXMlxI66qLqxpMeeoPKCQCMXWx2DBlVKrIQ6UIAk
	X9rRCXq/A4OdPA3vV36VXlCPg+Hy/yMUXi43QhwOUTqOIfXbC4BU3jYzf/ToCPCWCzOsGEWW8ua
	+SnsVb80rewT/r6qZnEXs99lVUzIHwXjiAJtzRdqdghsAme1avGu50dIJnGk6Z95EMrbFHxReJe
	v64n35iWf8I2aggTWnjnajCY3GSz9TJA+gqrnFvPebo4ZytXEXkd9wU/5B1uOiXgA5p5Y5sD7fM
	5rQhYdHEimKmBXydLkMa/g==
X-Google-Smtp-Source: AGHT+IE9irkaow+qaH4xXnif+LMSxixYb24+xXMhBwgXh6+OtcomA+ytcyRHDSj5KcZLfwK4yNuYsg==
X-Received: by 2002:a17:907:9482:b0:aa6:8096:2049 with SMTP id a640c23a62f3a-aac3350c059mr2950970366b.13.1735483846571;
        Sun, 29 Dec 2024 06:50:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v8 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:33 +0100
Message-ID: <20241229145027.3984542-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065048_246975_A810E96E 
X-CRM114-Status: UNSURE (   8.92  )
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

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


