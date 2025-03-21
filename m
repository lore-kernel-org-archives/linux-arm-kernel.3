Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D1C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieptwck2xbumRisfrT82whFeQnF/qSu7PPBUcK7FiUw=; b=3+dp23c+Lpzr0z84xf4r0oMKq4
	L3S3Y232qjaShfUxOIr3UlA4Je4fXOTa0Syzuf3t1l8DpEXUqw0aEkxDQ0anGWFXWYUuo+vkh/C3o
	My2/rEkmuCI5G1Z9cvyiB03WmSEH+oP6YtktlMmncVyqxfi/biODUBtCqG00bk2DiMQALGSQbuZqT
	YrjikxB6n3RLlegYCa4J/6UHNXuSKrBBF2uhWMk6zdylnDw12UublZVD4WaQhd+RC7KMMLwtvgCZz
	EO6cd3TjFST1g6wFBb5dCaBWK9bQ4DgMQuRjnQc8R5p+gRji1WOgOh0ttcSkKUdp0qTF3GDb8KJxa
	8n6vhzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWzS-0000000E7uF-0ilx;
	Fri, 21 Mar 2025 07:40:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWo7-0000000E65d-24xT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224171d6826so45465435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542122; x=1743146922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieptwck2xbumRisfrT82whFeQnF/qSu7PPBUcK7FiUw=;
        b=VpryVOgMCKuXoNvm+kQSvN+bAKBdo6IqHHYqCB1j3IrWIAgCQ2UU7gfZqabA0jGe8p
         yAa2k69NdVQ1ZI4OrxQc74ZPUVrcB5NUZ5xC72PzosQAB2zmevknecjWKru9XGZwPaRY
         dGu5aee1W11IvIBBwHidsd+w0q56G1KsomWej4Q1Uq8R2TsIMYCEN5FudrLLYBSOCDjJ
         OFv9QDhSgKN8IrEH/9PV6cwN9Mhd3V0+m7+UaTtF72ZXawm8Ey+2JEftTilP8gR1HPYB
         HbGNtVbK9DojZoznUxLiKIgsIQsfChWNef5ow96Ajlv2qr5wdjDnbJvZmvgxkdztjTZT
         xk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542122; x=1743146922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieptwck2xbumRisfrT82whFeQnF/qSu7PPBUcK7FiUw=;
        b=unnV1Y+Yvw+0k7aDCJ59h2hiBbHXa/RfnFUjg89XZh929/Unvg+H1cy6W4UvWb62iG
         OLLk8KM6YskCyVG3g5A8ytMHSptSJnGEYHzwL0ULBIboOmcdRxsslbhmTDQYNlmJ/ytu
         I9tla8mzAsQ/qGHArPNBRvtNMcA217loTe8pLJwBDkiFZFcuLjIzXp5zzq+VifSfS+Dc
         by+IhpO5GtRf/pty1dmiyDquyA4xmdATajHMy75riBYC8K9yB/AB9b78OtWePjEB0v+8
         +12slQ+5jruMkBdymWkcxT2g7+VrlKvwAfcq0eZu49nkGqehi3kSHRTCjNsa5Bp9cCg+
         wFnw==
X-Forwarded-Encrypted: i=1; AJvYcCWbpcF0Lpe3Da2oB10mqUE88I/ku/R72P/SN1Zqwq1MiNoAnaex16s/pI72acDYRPBN2a1bCcN9FTeYEffM8ode@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy+u7ylFxGIe+NMVPuDj+da0nwxS7FjyI0aOtBTcAj1FHIYI+Y
	IHw1JVwC/pW6tdfrrDM0ep926TUYiH0g8SW9ossXVwA6S5If8YuJ7T/Oog==
X-Gm-Gg: ASbGncsJfc//abHMgG7wk7quZNtn+nRUrYVNo/XhrfldPljxDr85g3JX8CC7QobUuEN
	QQ8mujYcELRxxZ6ZpukXaiiEiO0YeAe4coqfPlsI0CCPbLfkDRKLdSJ4poa8pM64+D+6aUHQHsW
	ERQEficbItTFr9iZXE5+CAXMi7ITZjsQoITuXsN5HKWFThSRNMmWF2bcXXCE3HRfxDzF331DRTn
	ib0bUmJ8abri8gcfj6n3QXfOT/zYCb7zVoH1rbBzA04mITbL6GXrpx31IVwNp97g5CZbRhMO6Et
	tKvUUt474zXSljtTYWG89qX2De+fDBw8knAqQ7CQjBBp7W42N8ixBO6dcieX1lJdKAk6EHxJm60
	NHKEBfF2anfSxnaqpi89wSQ==
X-Google-Smtp-Source: AGHT+IEjNtFI6VP/om3wHuMPu5o9rtQHBWQ3PoYv9Ejx4ZNfKMN6ezeWRVywDwtXRCBYtYNbqvqmXw==
X-Received: by 2002:a17:903:32c8:b0:224:1609:a74a with SMTP id d9443c01a7336-22780e14a50mr37653095ad.34.1742542121920;
        Fri, 21 Mar 2025 00:28:41 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:41 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:07 +0800
Subject: [PATCH v6 06/10] ARM: dts: aspeed: catalina: Add second source HSC
 node support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-6-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=979;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=5pcZNEUlvboNDNVPjfP/G7Ub2nFpRDTz1Jz2es019M8=;
 b=M6wY+kwMmAqRc2ixbv87/CrMLBRU7CN3BuqLHOdf6m5VlQvPK746/lKcFe0Hctj5iynCwOVZX
 s2cVFyFDJMzDo4NEQ88OMn+gfMFLSNydnqhPvBj9j6NMeddnDJLRHMN
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002843_535973_FC63458A 
X-CRM114-Status: GOOD (  10.62  )
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

Add device tree nodes for the XDP710 Hot-Swap Controller (HSC) to support
the Power Distribution Board (PDB) with a second-source configuration.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index f0c8aca152e7..306931c08cb0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -562,6 +562,14 @@ i2c1mux0ch4: i2c@4 {
 			#size-cells = <0>;
 			reg = <0x4>;
 
+			power-monitor@13 {
+				compatible = "infineon,xdp710";
+				reg = <0x13>;
+			};
+			power-monitor@1c {
+				compatible = "infineon,xdp710";
+				reg = <0x1c>;
+			};
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;

-- 
2.31.1


