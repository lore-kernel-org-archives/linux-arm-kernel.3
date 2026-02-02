Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8965E7DEF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LWELuTIWWRa0xPEQkmivdJUD1uoiNrgwtqfeTq/8BA=; b=VqTukIFgXWVDufDsaShVyxiehn
	ZzpjLLfg9tdA58PMk+97LXE/hQivETGWJ/6tZvOtgwvP2YmnrlrRW6BA3UyFCJbohthOHiZOm/nHy
	f7XSucstib9ftrAiwLgpWh8BdD3tlu3XY/RBfT7o4z1EyAFmLdj19Zce0p60Pa2diQzw/DOUQIox/
	9ZFX+g59u071a7HerE2v+Hma1szDCL8kwoUvJvkxVReoFUYh8BZjelQuYqdZh2yFldJVPwsDTzSui
	Acm5uOMcDGotbrc0FjU+zkk73ejMRRQ4j31fy2vwtEVKo9LpjLcoAswA6niXadeDddwri1PRu/v6e
	/4H6PDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvU1-000000059fS-251h;
	Mon, 02 Feb 2026 15:04:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvTx-000000059bK-2v2G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:04:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4249178b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044693; x=1770649493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LWELuTIWWRa0xPEQkmivdJUD1uoiNrgwtqfeTq/8BA=;
        b=hUNAJoQPN2DloETGF9DAI+sMG0xVTIRTXnjmV2stOsBPDw6n8cGf3yYJKryH8vZnCS
         VMYazsOCF6G23Kv5GpkocT2fVSAmcEAsEIlzaTvX81ygx6yUho1TiylcUNdbugRGlbQS
         o3/J4uumyKdNcx5AxKeLczURumEEH3ON4sVhZMIvtDBPxnkl+Tc+Yw6OTok5B8HN1AWe
         IHtIJhmIDt4m6KOHE8L8NpwfNHMFHHUIMCfVlX9SKi1ybnl+MxOHJALFCxivkB+AckFT
         pv9fUFiGLFewtUZMRy9WxouT/nYZm7UGaVZ3XpoGre4mg+mTLaj9+/HCJ5XgtEwcZ+f2
         L9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044693; x=1770649493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7LWELuTIWWRa0xPEQkmivdJUD1uoiNrgwtqfeTq/8BA=;
        b=tv3L4QKCbG/TnnTKmikfuwB5BlxJx3NYoBIg/c3aYgygZ/i59LU9J57LixdSI3yo/F
         qZkdsTXjSSUlgvOPita/lqpsWo5raBNOmHFtjk+99MXjaPHOWgiRH4asEhJwtT5SyJPm
         LQWjBvPxm+WVT7xSwtFY8nLXRUKJyTPLzrl+ESaAloAuhzhQ1AROgtr7P1Dc/O8aoBcr
         1E1E1KqbsjqdPKXAfp+ERgBCsUXqSjU8XMzqj3lv9xlqDAQIPIOo1hyDJjdXLUtUx6EJ
         AU5V7fNISidTz+xc1Q+D62y1V2M2VWfY1AX9HkaJQAxG/iBjMEjHVcW8W0yXIgSeQF+j
         wkhw==
X-Forwarded-Encrypted: i=1; AJvYcCWMTbn1Q5vzRdFHCK2+kWTdQYPqg8Y0bGzOjIT2xoQHk4aKziE52JYxoWbhqVR5Bjo2nSBoYNmfTHEiECT4BHv3@lists.infradead.org
X-Gm-Message-State: AOJu0YyG3ifkmMeBEe/9k4ia2Z3eKHTKAVwjQmlCVEtsQbbT+32yiv2I
	rtMPWO6YbKcUN2LyAaJDkNfX1Xir10cA+S3NNgMZvMVA6Os9Xh5W8vaC
X-Gm-Gg: AZuq6aIVY0f8q/x2daI6L7pcoJMFstGJK0UI/G/TQ+VGMtsLp36W61phNsF5sHS478c
	e1o1mVR07bFujdz1DaNW1C3EDfpONqwfLNvLHkcZnt1SaryFUI3nQE1crzP5QrCbvuYraWvl5w8
	YAWvTuxaziH0FcCxJTArW3mJ1W7MuQwdSmaMFVwc89GA0yRvDDJA/Iwp5A7xHEPesF52B2G9CBT
	d/ouwVdyk9Fwh09EC0fHieZro8nKqwK5+mgHhSWwTA3cdJ6QpBbmZNAE9ieFiEg0I+zA869huhG
	favluY1oIXk1Lf91MAPbcqnAFQaHmHAoshuyQZb0J5KFJBG/f1g36NkVRfPhRS2/twLHpCdCKQ2
	Mo99I4cGPEzAcIXxrtO10jUmxYakdikQNaAc2UJx8DuRaijsqSo8gQ+rRumiO07105iofUtIRe9
	vKR8QqbY3z
X-Received: by 2002:a05:6a00:1482:b0:823:1580:7914 with SMTP id d2e1a72fcca58-823ab72f0c3mr10277504b3a.50.1770044692582;
        Mon, 02 Feb 2026 07:04:52 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm15948480b3a.54.2026.02.02.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:04:52 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube series
Date: Mon,  2 Feb 2026 23:04:02 +0800
Message-ID: <20260202150437.270567-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202150437.270567-1-jerrysteve1101@gmail.com>
References: <20260202150437.270567-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070453_795193_0B628CBC 
X-CRM114-Status: UNSURE (   9.17  )
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

Add devicetree binding for the OneThing OEC and OEC-turbo

The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
eMMC storage, and supports one SATA interface, one Gigabit Ethernet
port, and one USB 3.0 port.
Among the lineup, the standard OEC model comes with 2GB of RAM, while
the OEC-turbo features 4GB of RAM; The rest of the specifications are
identical.

The OneThing Edge Cube series (shipping with the vendor firmware) is
originally designed as a PCDN (P2P Content Delivery Network) device.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..5cbc3bd31676 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,12 @@ properties:
           - const: openailab,eaidk-610
           - const: rockchip,rk3399
 
+      - description: OneThing Edge Cube series
+        items:
+          - const: onething,oec-turbo
+          - const: onething,oec
+          - const: rockchip,rk3566
+
       - description: Xunlong Orange Pi RK3399 board
         items:
           - const: xunlong,rk3399-orangepi
-- 
2.52.0


