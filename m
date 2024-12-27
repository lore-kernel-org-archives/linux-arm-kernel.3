Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD03E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=O46mVrhUbkwMk9E3tK7w8tfG5y
	sacrOCFWdjLgUgjz+kRVG/KRwLpMOSRD/7MJENBn2Sh4P2tSbo0Ldp4898hg8QI8geowkV+nZvtHs
	YF4pk8t5ePXR76B2R627yhZpWEVvyMIYGQk4HM/oPse4NuU8ppBE4aSLZzLQA5jjgVUx+K5E1XwcU
	NibHW6Ps6sU7eSrmmnfVOAOqhsVQeeZlgEIjd933ScVHTB9zseO34ylc/uhvjymwyiS18xhoByuKl
	u8OBTNW38KX/vXi9EW/SqqFm85fW51bQ7lupmUy7O5VQJ2LosEqI4joreFD2n2o8gtMGrnqhzmRyD
	cHPFTPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDpq-00000000gaI-2WBP;
	Fri, 27 Dec 2024 17:09:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDed-00000000eVZ-399Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so11803491a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318658; x=1735923458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=kZvH+mjq3yDnJs+163Bj0Q9oP+4rdDLp0jLmBqKgW/8v7hY+M/CNwN0laj0xgcrL1s
         KACmo6KEOY/pXF9V+zj/IhVM2E2wSxtHpd0vCYDb9TtKqyxZxavPT5xV+NpriijFTSTB
         +zaj+cCTb230pRCkBsTToH0gac14KQImAFInU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318658; x=1735923458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=byr4f7iG66a5HD+jyKdYP56iZr+2CWa7W8IfP1CV6S1ibszbkBjXWTpHv0kUAYtaiM
         p0MrmOU/+GugMyfnqOmIu03jmQaFNUsIQYjAZRTqPrpdEC01I5+Jt90/M2XNs1yfMZqh
         1xnAYB2mQtQOYJwb8Q9Q0aLgyuAG4DjDcXFZ+n7Pttp1MQeip1jsRZCPxywQMPeJ+bX0
         ZycObhLFRF5hk6W4wVboAbzRHPILxUiWLZZjEgqvDjJPBub6BWiO1tsYeNdlkAGjvGCK
         xygFKVS+Zlf576OiXRnfvNzV7MgaS0rWy/PQ2tSgfP6s60Ya83SXXX9hiqsI01PSlgvN
         OjDw==
X-Forwarded-Encrypted: i=1; AJvYcCVeY9pVuX7Wu3iskdqODoUokoz32TLvqbQNyEFrYnTzKKvcn+UZMOAAtNbkurx+wuPMVeuIDdLeQCnxvyaUeE+8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy97Tdbab2/Oj27+ccLsXnLRc4Qb7pAGIPQ5zpOa5tOGocQPfOu
	sgMUTfhXpMEvaPHLsxlfQwfWhADuFlyZUolXhxtAwyPC++4N6z2vwqfKvnDyxFI=
X-Gm-Gg: ASbGnctHJQTUjTkST4T08mLti7cZMwhws3ebmlSeqsQh6ZB8gNpd1+VAaVjuOcBE3tG
	Uj7LtR8hm2v9OLf1H21MCo1qtzBxnYGeOIQd1fho5sgolbVfmNSDYOaqHUsCJFDTcCMLIv4khpT
	IdHZfWoijPVhWLWQK0nVQyBKe9QGW30T5+vVYMPWxyJ7CtOR1epJR0zh9vPHybMjhyZ5XOG712r
	pZVFXBbCceL0YCf0/VlMX4joxlssFf0KUsS+HbH948Ju3ce1z0dE6hh2gFjEBZJWvBioQC/ndna
	kmPCoXikEhoW176Mo7+GAg==
X-Google-Smtp-Source: AGHT+IEU39RTa9ECIPzQT71oAG8YXlNy7WaA4azCq4x0ZK+7kYxrqzuYsejzC7Lx7FeHEAwhQoFPPA==
X-Received: by 2002:a05:6402:1ed3:b0:5d2:73b0:81ef with SMTP id 4fb4d7f45d1cf-5d81ddfdb67mr28928804a12.22.1735318658268;
        Fri, 27 Dec 2024 08:57:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:37 -0800 (PST)
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
Subject: [PATCH v7 09/23] arm64: dts: imx8mq: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:12 +0100
Message-ID: <20241227165719.3902388-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085739_781326_528EFB37 
X-CRM114-Status: UNSURE (   8.83  )
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


