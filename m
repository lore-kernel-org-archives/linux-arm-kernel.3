Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=POpxdpGM8IrfyKUZVbTRlpu01ta9wvoDDQyv73QHKHI=; b=EjQtaXV8u49qDpfOs525GIsuJb
	Kjeks+LeZNsPqOx1x2fizmVOUNvzliZ/Nv+iicLgh+1i+K2Atcv7UzNPhjH30T6vtFD3iOvRask9w
	QAIojzB5jf9RPN63iV3xbUT8xM4TCBT2CeYPUVHz4v22B/B7RB6KX7ZmTLiLD8hc1iXnnWkiNzy/Q
	snYCkMz8j2iMYCBzCqf1jioL5zXJdgheKZewausx0Yet6MnfzxW/u09UOBugQ1n6wnp8YahlelVKT
	Yp3JEDeKGP78oLVTYirw47v5ADz+tddvk8nnTWkQkVMwOGq7qHNepe+f4bs5Ai/eS0BteGYgfOupI
	dBrSzQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2PnY-000000088jv-3Gi0;
	Sat, 27 Sep 2025 07:56:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2PnV-000000088im-0e6N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 07:56:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so29456085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758959807; x=1759564607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POpxdpGM8IrfyKUZVbTRlpu01ta9wvoDDQyv73QHKHI=;
        b=INCmf2LBPYkjpJyHa9q8GULjf/EjqXfHARYxb5W9Q1qaAAPT4DuCBkQEHsuxjs2x7p
         gz8+Ig13At5N+YQ/lEixWMiI2hP2LDIMZvF7cvUN6B1kvHaD5WJgKLA08vwYHLfxSxWg
         Vj3LHpfEChZIMFOJysH11RGOXM82j5LGYnRmo9gcQM6ciQQ0CQnT6fydKEhugdVJLkNA
         2j0QBZwlGEUAU+A2QNXrK5HeoFlGLfr8XkLYuopTYrjGNVz1JSIjElOL0B5BsOdY0lE0
         bLHmKrc92BMVHJXhxQ4cYiTk23TqiIaJ+ttRCOC/5we8QTOWg41Db7Zxzp4UAiLG23dm
         UTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758959807; x=1759564607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POpxdpGM8IrfyKUZVbTRlpu01ta9wvoDDQyv73QHKHI=;
        b=GMF/30IRpdcTg8qA4p/VswpzLwKtcihYDVOMeZazgFBI4hzLtKHLcNhlDXfaekTCgz
         Xfqba+oS86sHq/IAD8EMfyL3qQZ1LCpTJmGkqHyjACrPiP+13OFBubCj9JD4zOjQl+ks
         iZFeax2BMh8sYRCfk8e5H6o4yd63qzIINPYJEC6cSL7gYsqJQuRjC9WEdxa+YHvF8VKK
         VIBhuykUqRFew7zRURk7eoRCeV8fzWIE5gAmN5HaTFCD/h1zaI6Yeufj/6X8Q2dDLJzv
         LHxT9OUxzOMZ8qHgMw/eXm2SyLOqjWNzux1Uf+sb2bGJetZV19syplC3d74HlGSv+LRn
         F4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUkWga2dN9qp/ZEnf0cxFa+omv6QsO3j0irCiGaaK+GNSBhEfccbVRWYRJlTp/Ppx7aR4S1e0c5Y0q1nJq+fpa2@lists.infradead.org
X-Gm-Message-State: AOJu0YxwCQDlmUxpTez0dDWya0cvgULS/lEzWqRkJw8IaHp1YGUpOO8R
	jaURNejlSwEhtlXF/UzoOstDD1FzlGSE8i4lBy+DIyzCJ+k119yA7Bpq
X-Gm-Gg: ASbGncsdt85qSISiTihIpBv5idh7il9Z5r79TNVN1hQvzOhz4ReJrDnEHCbc0GKDGzY
	J0ZxY2/4eYyIR3EVfL40GdSxiE0utGZtaW/dJ/A81M0VDRJNxSMxphIDFWFK3yMH1HaSDWdQHSy
	y1cQp9LZ3KFU/34iNe/Etm82qVq8IzJHWLDhFTiIAIaXC/tMM9MeUqqAhJZ2lyH0eix+ClUDR1h
	y5ulRHLq/c+gqGGUD2rzGs8rP/9SLOOmHIs1OkCJcxW0jr8iaupA246Jv3dtDHerFk5XPephGOw
	K8LccA28EzUrT5l30HUNKgEsJx//fflsLtqTD/n6MNum+U4Cpt87esoynByv+NLX4rbg5FpO8dn
	pQCQiwjYrSugN6rZkU3lAZ+ot86jMIWAuTotOoMHDVQbDaHRh1WdmlsxKtgSoEwtB0UVOtYhnZQ
	EUJdd6q1l23eUrmKfZq+Zv6xXMIauxvCas/fWrppc3FiIHpP7Lk8tbyo9DdYCy0hc5/Xm/db0a
X-Google-Smtp-Source: AGHT+IG+Y3okceIM3FGn70ZLJhwXarOKA5dQZBfJnprbzEp2P2K4yII1/saVX5drOGKgTV2E6GttsA==
X-Received: by 2002:a05:6000:400b:b0:3e6:116a:8fdf with SMTP id ffacd0b85a97d-40e46514d27mr10341574f8f.13.1758959806732;
        Sat, 27 Sep 2025 00:56:46 -0700 (PDT)
Received: from cypher.lan (cpc73830-dals21-2-0-cust622.20-2.cable.virginm.net. [81.110.186.111])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb9d26ef7sm10153339f8f.26.2025.09.27.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 00:56:46 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712: Enable RNG
Date: Sat, 27 Sep 2025 08:56:31 +0100
Message-ID: <20250927075643.716179-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_005649_188549_BDC4C901 
X-CRM114-Status: GOOD (  11.45  )
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

The RNG is the same IP as in the bcm2711 so add the
device tree block to enable the device.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2:
- Reorder by unit address

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 4cd51d80d40d0..260d4a24e8a17 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -243,6 +243,12 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		random: rng@7d208000 {
+			compatible = "brcm,bcm2711-rng200";
+			reg = <0x7d208000 0x28>;
+			status = "okay";
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.51.0


