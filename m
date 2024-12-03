Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC72E6C605
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L8n4o1v2RJyro7eTP9OXPaLkCulfPUB3irYVBi0m5MY=; b=QY8/U3CMFBIZVf8ZsHO4OBDLr/
	sAD59Yvvjdnt3Q1cH/IJhliGrL5fZQz8yuLwsBSO177T+hvYPfWvbwQKhd6ffG/4AFOTMYfrVUEi9
	LDhtvViXW+Lu54PMcKaZPr4cro8zHU4pN0tFayPLjVPRMUwf4Rv2QRMLW6y+X0PBvP7V2MB31iMVf
	/aDmgq/G/wm9ATJumVqQuqvh9VBNAlkLwvgSAUTcFxU9WJAZi9YfIENeVQ4czy8NNo6BM9gTfFWFQ
	F/LXX9ABhqOFe9HKpxisZZi5tF7DPC9s0n97S0tg/c8/upUV3etuNEspxsYjP+WQDlOp8WpfVWIJ8
	vPX3XWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILJe-00000008JPT-2INB;
	Tue, 03 Dec 2024 05:19:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tILCg-00000008IL6-3tYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:12:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7256dc42176so1918852b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202726; x=1733807526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8n4o1v2RJyro7eTP9OXPaLkCulfPUB3irYVBi0m5MY=;
        b=IfC3aemuxeILAnCQ3Yjo22rSNrIfc58ISsDvtWZouwC41oaCaohoWcc34F+8YNMhBs
         8FJEl4ROB6ieF5vMhuqCpBImxqta70/NFpvZCU0c266sCx8zyXPgdCBOsGQ0MGdjgmCI
         Bntxt8j2cuGOzggYPh3I8o+qtT+XyrdrpqMg7rn0hV72p8nv0I9Nse8baxzyytGB+ChX
         lNCiAKyRGHw8ebmBmxlv45Kc9ao5w1Rx9oVOvi9xmyJIqVIlV+emjI5rPVi33MV/uI0S
         m+RJL/Sq8wsivUvDRzVwArmHuvONjCeHrXVNU/plHHNCCh+y4SHyHX5KzkXN537aylRK
         3VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202726; x=1733807526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8n4o1v2RJyro7eTP9OXPaLkCulfPUB3irYVBi0m5MY=;
        b=ERHxKbgTwu/1F+QuU4QB1y2huaLGxc2i0SoziTiYg03gpxcU7Og85iPG6KzW4fA8Ac
         cQCmgt/mahtAegZkVDUbVM3wQxsvKt7XVOjWzDNrP7l0eBpU5KRlcQrgvHrS+Ilso/gl
         jFys3SI6w0uDNth1tLzW5Ywk9FBpq69zl8gycX2ObsajcnbxFQi/T1F/UuYWQFSLkDGh
         GvKcne8AhFIqBdkEYrci5RIfpecTQLSt2tzq+/BpTlzJ0eY1hdPeVlKlXOPLwWv/Z3zb
         8uxxtn0LzvJAqU6XCZ0JAoOf6O/xfvS99qj1Ky9kOp2/cscz+hdQ9DKcedrQ8XZZO0Bg
         oSzg==
X-Forwarded-Encrypted: i=1; AJvYcCU4TTdnIpBKwsdOegoD/dsRzPLiGShJnFHhT8BEP4EJlGg3cGXRhi9NdkPXg8Bd9Qnf+pc73cIYev1lmmodLPbU@lists.infradead.org
X-Gm-Message-State: AOJu0YygYWUmvlPdXLnxAaVQ9XLNPg03uT+c5tFTob/V+Yff/VSW34uj
	daBTYFyJn1odwYBzdvpgxo47NrNGLIz29tpqBD5h1nnPdV/b561h
X-Gm-Gg: ASbGncsFvqX91K1CnS7Ki16kCf+tQbnbCBVdTWLqO3MPmxFY/8/mWfOo5G9PmPjDU/x
	A42DkmG0FQGmMbBiNCaLttV9VZoErTURnzlPRG/p09DAJlKetdyN80M8ofgOT0agXAfaQI3PSTc
	5EvfdMWrZUMZsTT/LLaV53/VRAWso/lf1zfn56rr40rq5pzDX1IzRmnuyYWSslY5nnkD50gCKdK
	ZUlhZuVB3gb1eHkBCofIH88WS5M1skxfdBiddP11t8ds+PhED+oLN2YEDZifw103w==
X-Google-Smtp-Source: AGHT+IGnu83UebF01ikbueB6H+BqrayrW3tr1aPcP1nMIYcEm8aOI82S07uAdTSrZ6i9cAF+koyUfw==
X-Received: by 2002:a05:6a00:2d2a:b0:71e:6c67:2ebf with SMTP id d2e1a72fcca58-7257fa67cf3mr1425111b3a.11.1733202725908;
        Mon, 02 Dec 2024 21:12:05 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541848916sm9525047b3a.172.2024.12.02.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:12:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
	Paul Pawlowski <paul@mrarm.io>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/3] Device Tree for Apple T2 (T8012) SoC devices
Date: Tue,  3 Dec 2024 13:10:26 +0800
Message-ID: <20241203051147.110980-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_211206_969997_73CBA8E0 
X-CRM114-Status: GOOD (  10.90  )
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

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

This series requires the PMGR power domains series for A7-A11[1] for
the "apple,t8010-pmgr-pwrstate" and "apple,t8010-pmgr" compaibles,
but otherwise can be applied cleanly.

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241201155820.29259-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices
  arm64: dts: apple: t8012: Add PMGR nodes

 .../devicetree/bindings/arm/apple.yaml        |  41 +
 arch/arm64/boot/dts/apple/Makefile            |  16 +
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  20 +
 arch/arm64/boot/dts/apple/t8012.dtsi          | 198 +++++
 22 files changed, 1387 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: bcdb59aa6d1f196ec853235957aba5852d6697cc
-- 
2.47.1


