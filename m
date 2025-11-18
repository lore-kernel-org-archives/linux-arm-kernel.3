Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C54FCEDDAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn1amiUGhpNI5r8WdOtn7hNJ51WcbcveDFhQ+0agXLE=; b=3VC6iod6sQN8vFSjkYEhQgmLGs
	IC1V/0Ogp6x11nz2QR4WDQdgmOxZ/kkpSGNuoHCE/BIgOxzUt016U8PnBiHwAUnCj5G+aiEYlhiHJ
	3WT/EZNmC8tcdrrE2XIArg8f87M4QqL+ziPcMYODytae7eEMSZv3q/bx2FiQczVc66iF4zyJlrsry
	sQwLipILyxlQtQjaCwEgahsmJI31yPwusacLBYHJWWTDuZeztsOUWEUIygTUMLmYhyM+c1hwJc3T3
	uAbXJ2dIGIXFa5jAwByMof+zGKpkWhFuQum+UDIAbtjStuncjQjUV8yUCyQ2MhuLNoa/H6Vrt6cDT
	73uk6YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKW-00000000bXC-1PAb;
	Tue, 18 Nov 2025 15:09:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKK-00000000bOf-2GEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477a1c28778so30037745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478543; x=1764083343; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn1amiUGhpNI5r8WdOtn7hNJ51WcbcveDFhQ+0agXLE=;
        b=AwVX7904ukIKl5YXtnnFBm+6t7Pww7vMb4/RxmmOxALD3fgB7a9VnhFfiQnWHQ7RgN
         vmpaC3FvHUiTeLKd0DvpLTVm85NeAf1DbOChQRYaDlVUzgdRiprOQRTdlKQa8MWb+avk
         xKRwWft/auhoR5P7Ld4T+rFB/nfS0A/HXUhKaiJ8t3ZjJepme1uLd8AzufMFMTI5f4tq
         g76nA6EMOuDJOgIYh+rzbHhRI+IfWNs8hS4pSoABJaMJCdSKdFR4eP1x10yYv9l58qsr
         zdsvejqmPpzrZJ1vHkN5tqmW0aGY5B5J6IPVNHqvoDJOEJHrnfWgoLI5OAqlAkl6GDc0
         KstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478543; x=1764083343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xn1amiUGhpNI5r8WdOtn7hNJ51WcbcveDFhQ+0agXLE=;
        b=QLv4bKjijWx21ZnzUlERyuAhNuL6lETBGyLPCUyeFJmZyFwC3rqrJEyScJ6O3dUyjz
         Cd6qHrd63sywT2RB8PV7tyqDX2+8GYqjJj++DflZpT9d5m3S6KGHX5V/TlxJCZxOy3mZ
         dQhbR048/1gSIwnNVxv6TZekV6MbIYooNtMFSZMrIEclrpK3bgoQlXj7ABdQrmI6kUm7
         QS41RmyfyB366qVXqnNNJI8I56yWYcTltaTIIM3CgyBGzZkqMeWR2MdZ+PR/KB6OEVVF
         bgIlADd0Gt3M05iLlYKoSbwqVyi27/bPYm1fb+nvW8GGNUAvNQ8vA4DHsi21Wtq5bsUl
         a8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz6+aynoaPHvtVKiJ/KnuuAcfXmEr4fK5wQUaZcuZKqiabQW/M+odrRRNibKjnOuIbhdNU+8I3P6MGypMus89S@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0NC/5vdb5cAkcDZCjosZ424Z/Luzne18xaPhBScp8SIGAsdo
	UUirQAoZjMf8emQ9lr7qvYZP0QKIBN0hMp+w3bACb3qjoH4KNLncjgdS
X-Gm-Gg: ASbGncvvJyrEvYDceaoWq4XzpeRF76MdKQ4D5oh0IU1FIYJqusYuOE+SwOmDO14Xwyw
	n5liO5868tbg2drsVs16YKIiHC/3Ge7aKr9qtzS1K7vkaJkCeCCJxEQ8SKfiQSle7TqZLRK5JO/
	X05F8iEq77Wkwjxk26kKEZJV2ReWIkpDTYOGIdFB8GgE7vaI8eJd52LqEJe1LGub9EQQV/hcsEK
	haniIF3EMdrugrIyHOMDoC4RVY895zfd51QN02SwKFMEn5UZGAYBYcIO6/6+hfFNvT/8KaxU1HX
	MMISzvJkrtWkR+LCJg/jeQkoFKgoRO61WEzqS7KDUavAYAf46BcwjfnxE8wFTJS/+5AB0S2lzUu
	e+T3YeM26Xdj9Qvf2tfi3SEW1DKJ3rdd8oXw5SQT9N5n8DQgqWX/m4SHmmLk4+aZO2+ijdSdEpB
	xXyhBx9Y5qmCKzOldOWk9EQ2kbU4epZii/GB74xNmWLQfu3rf+Sq0gb0AJh9wousZdtNd361aY8
	L3Ad7GFCWeDb9qZ
X-Google-Smtp-Source: AGHT+IGHfWRtYZTGPPYbxiOYmTOURyjIxMB6TDIV7lM+NaODJHSbF+ffu7r1vpKDpGdS19OrhVSrbg==
X-Received: by 2002:a05:600c:a47:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-4778fea195emr185980455e9.30.1763478542674;
        Tue, 18 Nov 2025 07:09:02 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47799768409sm199879815e9.3.2025.11.18.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:09:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:02 +0100
Subject: [PATCH v9 6/7] arm64: dts: st: add LPDDR channel to stm32mp257f-dk
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-6-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070904_594025_4FA3029F 
X-CRM114-Status: UNSURE (   9.57  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits LPDDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..5956d77f5fda 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -55,6 +55,13 @@ led-blue {
 		};
 	};
 
+	lpddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,lpddr4-channel";
+		io-width = <32>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.43.0


