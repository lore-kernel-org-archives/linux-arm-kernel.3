Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D63C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZM3oG7u9MlBe7jgQYod3pM9eHw7F5bbi3sRetSKux0=; b=MGSElFko2QgYNMj+ibPlInyGgY
	v9hDnCz7lYZWUcb1GJdUNQfsiP8+YlDlCzG7wVXQcg3fnGdgyEc1M4BE8zU7m6b/c7xPh11IlLy2x
	LBLmJNQRLNII1PCAkgi1TngFgp5Gskoaczrs6d+R3SZtpyHyhjSPKepqycl6bo8GhHwczNjayvJA5
	Z0ZBuwKoR0gZECL03NknAhm/HjHnrj3YWkm87Z6FR0cN4CgfOigmzSqdjLiiXV+eMvGdOTmd6W3PV
	LftdetOe97DUoR1jlJjsxZ3INbmYX+MzHc7atRnYw0dkIl23mi11FLmBPjFc2Nk1CaSymN2q1gxgd
	lI9I77aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYdI-00000006dvN-27CD;
	Fri, 21 Feb 2025 19:24:20 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYYz-00000006d9E-3YKn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:19:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abb90f68f8cso468028066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165592; x=1740770392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZM3oG7u9MlBe7jgQYod3pM9eHw7F5bbi3sRetSKux0=;
        b=fu31q3A4n0WpPVknP0txeJJMwYyu0MAeNzrC5rH4U/uq/Q9L6Xtm3ni44dZo9/QanV
         05rulS4beFGCma/S0aA5MG+U5gT4PMR6izGckGBxpvBBZe9BH+l01Yy8HlEeBmSMwFBy
         uJgtSe2kND0twiLS7Pq7iTaQW6v/MM4TdjKbpoz9eLNRgTx0dHP5BLap92kw4wxzEEvj
         jS3EgrfJl5EiGbaDfVBVzcz/ZcJbugP1bNGDGhywfYn/ZjGK0DKZuHIOJQvFvlsghlok
         iuQSvlEcSg5nfgnMNJLKX6mKtqgBdgmwUNKivJXju6C7jP163pgtxO43ClQnYvJkiQ2k
         r0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165592; x=1740770392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZM3oG7u9MlBe7jgQYod3pM9eHw7F5bbi3sRetSKux0=;
        b=cWhkGkpXhFquCb8qLteYxvoH0Z6gQA6eho0SjDelXshB6ow1+O7+r/xT/W+FzBmpGp
         a7waSCxzmqZUXXXpqMkPEKJip/iVv+jvHjgKhQ5JH6lhK6oh3V03qC2swX0inz1KyhFK
         MtzVRlM2POuDZANZGs804P9tTITokoAnNJvRnvinu+e0NP2u0gk2xBEWczVuiGNajIl3
         E76eydgDSBvzBedAcUHjMm8Jul10Ty4Hbyu9jOafwt0AsP3Vir21rkJMUHCs6bGiNqkN
         12vklrPEPW2PATVlCnhTT/T668UkgFaa6+an18xGHKIq1VDxVWtaEzmA1LwmJdcEEk72
         NnUw==
X-Forwarded-Encrypted: i=1; AJvYcCXwoZAoqgBuV/1FG6tWAmuoZyRGLTh86QvX+akPNS5R+9YmXfR6jieyt09sh1wtBz6iDq/CPgwzmlV5HeHKcNQJ@lists.infradead.org
X-Gm-Message-State: AOJu0YziQxzMvZZ/ebxYq3ApDf3OMaWMSYp1hfvB/p0ETamA5byc70XD
	W8t3clrPf7zhDWe0xbzIANbE9a1g5vKbLNu7XPc5fVhD3F+/ELBk
X-Gm-Gg: ASbGncvgwrqAHMGyoKeR5bUpL3sbQFIbeWrG2zhTh8riucUCyGyTaS6H9H3mNSSHJnD
	O1IOh768llEJiK+RTp6g9p4iUizQzWzkwTCJYmevy7B1stlLjQYx7qlmxuZ5XnUX8PCaJdL6Znm
	Fo1BU12ur7SCi2DrX+lbFEwNUQT0lfakniEotWmrktJoy6oiPm4BNROdHYTD6RR3P2pdNxVEhfg
	0x2PLtFQTnaDutIqZpV2qkk7PiqzqNJN+3kJGOHcWRWs7AsfLleqNYh0760pi8/LaZM3o0XKXL7
	nMfmQF7mnXmbP8dV1DRoUDl1cAns5MJkrm3k8/MgxFZIbxI2bw+yicffEng=
X-Google-Smtp-Source: AGHT+IFhYP8y5xpswatsEAcBPviWPk6yhTISADU0DuizXwbXYM7HIbRp4R+leRv7ntYUsYVDT1hb0w==
X-Received: by 2002:a17:907:9446:b0:ab7:ed56:a780 with SMTP id a640c23a62f3a-abc09a97abbmr474131866b.27.1740165591932;
        Fri, 21 Feb 2025 11:19:51 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:51 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Fri, 21 Feb 2025 14:19:06 -0500
Message-Id: <20250221191909.31874-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111953_885396_F0C080DA 
X-CRM114-Status: GOOD (  10.29  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..869df7fcece0 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,9 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


