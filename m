Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31821C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKk1eBFoHmDcld3Lfx7t6YPL0jmbrCaQqUFUOUwjSIk=; b=2pF7F1ss5uUlyDagvLsFSt7NXT
	13c38hCUKhlLi/ClzsJiGn6AFxpDqqtju+8ttLzObyvtMz3tpo3FM4s/zRV61aiUnUjJL9lsv0inh
	FmlIVLo4pv6ZUk1Qp9+3KuVgeILHbSYXRHT3rDV6en82oH3e+e0M6KpNCTdd3aLGnK6JD4r2mb3dZ
	zXIa25Bkf6mCnukLodSoCwBtt/QY4Ek2W8GhS7ngTX+7K8GjDwmV38E2wzQ+1g4clmDH9q8Lil4rT
	ALIrIzl/Pz3u3V3+QXyQ7lLEslxSF9TqYE2Rl+2j4yMxAeuMBZOUP4Ffwp3/F8CdLDn0wgvEGeG4e
	3SpUOWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFeZ-0000000Fgac-0UEP;
	Sun, 09 Feb 2025 22:19:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSM-0000000FeiA-0W2w;
	Sun, 09 Feb 2025 22:07:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43944181e68so3169815e9.0;
        Sun, 09 Feb 2025 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138832; x=1739743632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKk1eBFoHmDcld3Lfx7t6YPL0jmbrCaQqUFUOUwjSIk=;
        b=iqF2uLjL6vpvEbfnw1ucxA3kiuNgjMj0OncnT6jKGb6Z0lE/q3yM6VnrPk5srOnEEa
         61/ltQmyqsDyB1jKNOmpaYIfcjTECyUZKEi1FBLkUJLdy/m9tdNeCinryX+ALg1kjCYb
         bOYzdhl2+nuReqOE0d4OY//cpD+Vx0TFoJDuP10wYdhDWpeIRdms8EucYQtZIneQs8yW
         01GYgG5yfypCfOZXauLboXPewzJgcmT3Oau+NsgcOLZN5fIkSfbQs/KYLFLV+yrH/tLo
         L3mdEa5Z2L9+qe6XrhAdTkC2G5kImdyxX/PzuzNM5r6W5Jk1T9R7xdVGPQNNKmapwbCK
         LSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138832; x=1739743632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKk1eBFoHmDcld3Lfx7t6YPL0jmbrCaQqUFUOUwjSIk=;
        b=b0HGRnz7DdmgDAXZVkmnQk4/0sFbK2SxUSB0xQ4PdNrd2yE3YiscrCIlND9O1jwSim
         bAUv0UcgWA0y3OhqDzlxo+68WJ65IpctTXzJeq4pIofv0NR8+qtIsA4qKbRUgzeQnXJW
         nDIvRC5uLXGvvzuUGqnzbdi/QuPXuGa4jFSqTAeT8hL9r/4yTqGquhwUGjAfQ1LQi8Re
         3bHhYlNoG3sd6pW5X3/PeRFMxTJru6Hczrmy+mmv++9r0MfYn2GrZBrKUaVh3SchCnjR
         IMSR83fwlMcjl2SHAfTTNRGjwFVgqfyVW/GQKOYssBSd0XJrQ09ojrdg2MMuXMnP6qKl
         tQQA==
X-Forwarded-Encrypted: i=1; AJvYcCU5P2ssSBoFZ9qk38QiwvcLSJz2RlvEJA9DHQgZwuAc4fxYCLKAbJsqwmpZfcILLmntNO8zqrNok8yGCDY=@lists.infradead.org, AJvYcCUHiVX6vzd9eP1QmSdJVYsRT4Sho2dg28JyjLOGk2FAl3VwwePHWrzn8xqOnd7kZj2u3Z0mByECxACdOUvl5B2X@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQsnStPsmqi6mA4+qyUsUMStfGrzDJlYF3sCYs0ESFj2S1AxM
	+bMtCzVqb3cj3V2jffMqRI4xUYjOfdgLgxjekeWiGupWioYadXKt
X-Gm-Gg: ASbGnculoJubu2+EcFO0hZopJLrX4I9B25TElbONedkAz34HobQ/p+uFr6VizSJ28nI
	ZQ+kW3FykWDQMdKGEwydLR6yoHMWy5OjRoTzFB12RBMjzSuWz47IfIY2Pa9Uj1bx9ULYfcKUwPD
	l431j/qgL29k+BJD5aOaPK63V7+21bC2wjs1qTkMWwkYAHkKDtL5xNLv6MJOacoO2cjxEzl6gou
	5zXmev9gXempJJjScJC78eDB3zsIRTk9x6pnOaqqM2ihlCkuhqgoTyr0tJuEguwypmyDt1OcvGm
	zTtce5UzEva2rREzVxnJUYZ7yy2O
X-Google-Smtp-Source: AGHT+IF2Bns6I6YCSe2LhsETO1BYlvvXG98BlhUd8nZAEcFJtGt/bc67HK+7TnAd5oXHt9YnANZ3Nw==
X-Received: by 2002:adf:f70b:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38dc9135d53mr7026781f8f.36.1739138832176;
        Sun, 09 Feb 2025 14:07:12 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:11 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset nodes
Date: Sun,  9 Feb 2025 23:06:33 +0100
Message-ID: <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140714_161290_16FF1A6C 
X-CRM114-Status: UNSURE (   8.52  )
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

Add reset controller node and required sysctl nodes.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
index 53834b0658b2..d793b6db4ed1 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
@@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
+
+		rtcsys_ctrl: syscon@5025000 {
+			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
+			reg = <0x05025000 0x1000>;
+		};
+
+		rtcsys_core: syscon@5026000 {
+			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
+			reg = <0x05026000 0x1000>;
+		};
+
+		soc-reset {
+			compatible = "sophgo,cv1800-reset";
+			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
+			sophgo,rtcsys-core = <&rtcsys_core>;
+		};
 	};
 };
-- 
2.48.1


