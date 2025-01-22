Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Md673f0gPc1Cs0CUTHmJ8oomJneh2yNJzotFkHi/Wpg=; b=G7Ci2dHfBxSe5JjiUdBEVz5XJA
	FmOvs/H875wJ9SUSj+Z4I3b4/I0x9BV5sb2dZneDyrCXEQmWKhYadv7VfsqMvUEp1JzZVMUkagMAe
	bzxov/UAijX4rXoLQ/5Y/rAx0lZgYWjudC69mKXwfNF10FP9ps4GpipIe9Z8cAZ7DFsRTRKeRu0xw
	il1/+t7BUfvcYXhOmr1CghKDEKRBgWBxNpouoxY7tp5LL9MjUhcgIukJD90+ifavvHfDZ+2gItkTk
	HTPVvdy3J3U8uTM6MFbgjb7c0oDndnWiiXqVGYeD/jvBmKOzpPC6YRRXI/Fynm9Q4sFyZHypMQalo
	NKWBbiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXyq-00000009wAB-0adY;
	Wed, 22 Jan 2025 10:29:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv3-00000009vSD-14bT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43618283dedso68918445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541508; x=1738146308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md673f0gPc1Cs0CUTHmJ8oomJneh2yNJzotFkHi/Wpg=;
        b=C0a5FOIT8gUCtVzocrTucOFWuPdYzA2nP+Q59vfbNDkjyFudleS4PFPXCEQ6h4+UOe
         F5ngER3wtqB4KANEYsLV/1XCVi76gNiaFTkQmcf7+L161eQCamvM2ud6pY1uUJRFVDv7
         hK8mYB1afDV1LtZjOCPHbMMa/epUfHQtxRl2E6dvG1aYyNnorbV0hGYsEtWALssPfDPP
         go5TWPVEHkKJugK3sqSgtMHetaqWIyd5/sfs9tp8If9Kdfu1pZSLzKRa5ivuiiM4RA/0
         GA9lGz7/4NFDCS6ubqycIswN1kEpd9b3sBDAS2YTe/4zBWKlMA3ok+1W7iH8V2VesqXT
         xnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541508; x=1738146308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md673f0gPc1Cs0CUTHmJ8oomJneh2yNJzotFkHi/Wpg=;
        b=YFFsuXzJ1uFssYE/gSdbmU2LQjYdAfRITnNCrcUTm3iVWEmElkJgM3InzMHNJj/aRw
         7jE3S2SuqU959GjMnV8jWdXrGLBaZFxSagU3Kuz3WATIg+E/LHLLNqMHroEGiSXGKVy2
         Sl2krlL5b9eoSdgfzMXXcbqPWXIUZ6r0IlwGGPzacGRmCd9KmLdtQQJk4cbnYJM41rct
         74MzoiSRxR5N7FQv7TGY7sLQCappdh46rjkryQrFb3aco38s1AfNQyaCsFijbEsIa8Vi
         cjBtR55xTtXfTAB7qOR1/Nlh/s54TTQx/MjHPyfxhpYyjmHFudNIyIHffypDhxa42BPT
         Bn1g==
X-Forwarded-Encrypted: i=1; AJvYcCXeip0Vo+Hp2JoYUKW1WYENofEg3NErQI/NcRQoGD6cG76GDX276tuYtnhq5hYFFwchYnkfDG3d7qvZp+ACCuV9@lists.infradead.org
X-Gm-Message-State: AOJu0YyvPt9R0/v4V44TvK+Quh7F4ZjPWqQo0eBt9WdNlAnDMdkR+2JT
	ys6LaJ05Y+YELbOYPwMyhfeQXoJ/v4CYtP+zjj0iv1sVlAPsAWAq1Pigrnd+hRw2FoPGdEGZwjp
	L
X-Gm-Gg: ASbGncttNHHkDCY0UbOhXlam6n545nBYq/eLaYbT3Avvq8tabLB4ouEuv/Vdpt0NE6X
	VKEREzrcdN7s65oBUD2xtqkdnXogrZpDOCJmxqevw8CMn5g+Zn3i0Dvv0SYLbKR3MRF0bt/0Kn7
	jTuMzPXIt/iGKHW9OlkXLI0dAI7ezoZqafYDa3VYnXX/pYfkmewK9ySto4IE+i3mCLht5DFJG1t
	eKV8/eDdQDDLEbzVF1lPtvMrJd5d7IgGS3TxJslvHp9wfp8/Yh929COGoco7RQFMZk=
X-Google-Smtp-Source: AGHT+IFCbq+3UCdDmSN++N9c1Y4Yc7X5v4bvVncSYB1zWDSxEbjpyTxVVprsAIhduuhAWkyIDaeOHA==
X-Received: by 2002:a05:600c:1da1:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4389141c4ebmr162686955e9.20.1737541507801;
        Wed, 22 Jan 2025 02:25:07 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df407sm19307215e9.37.2025.01.22.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:07 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 11:24:33 +0100
Subject: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=msp@baylibre.com;
 h=from:subject:message-id; bh=jzZocIdMSmBtlTunl36QH2EI2fT53+8QSFYYUBUXkgE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHM/dFPgxZds2p2exl4piucTSH2TvSEy68cy+xWYx/
 5w3oi4XOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJ3LZkZJiwJvnj/GN+/961
 ppTqLKuotz5QWagWMqXgSNYb5m8xyzkYGTbOnl512vajrK7n+0hV199SH+dHX7HYu2kql+SLLYJ
 WC3kB
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022509_297138_EBF9261D 
X-CRM114-Status: UNSURE (   9.89  )
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

Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
register in the wkup-conf register space of am62a and am62p. This
register controls DDR power management.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e68c69e7bc9ef8c2c96f0e7d1b5d88eeab2bfba..fa2e904b52ea0baecbdbdc14a4fb636eb87abe59 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -110,6 +110,7 @@ select:
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
+          - ti,am62-ddr-pmctrl
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
@@ -208,6 +209,7 @@ properties:
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
+          - ti,am62-ddr-pmctrl
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl

-- 
2.47.1


