Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29789E83077
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTaOmh9wnqbOJNsuDkJBw5xu/ZxW0Le6p4u6pemJa+w=; b=BRKNoGbJgv/Ey9JiHBYl/irGeP
	xC3c81Kb6iCHA8bdRtk8Y0y7Y19F25KNsleN7M7g2y6cDCKeTa/V1rzXYd0r688eVs/tQnRxxrshj
	IdBYUhJUcuVXdkrlLjUcMj4RlJufM7s45HawaGja9VtQmaIkMnO1ANe/fWYm/auCSRF5y3zplg6DI
	nA7fwVPDGNEJdbfIY4KTU+OlBQnlzI8T3J/LvXScgU6F9TzVr4GhAwMdPE5r0vzxG8Pn3flyx7/ia
	lgxqysvyXqemREJFXlv0qPv52aIIvRSulZfKk6R1z6I2RZ/ye0x4txwUtrl109gZ0V1mp1p2Sv53o
	l4RBH3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHC-00000006RUx-3fkE;
	Tue, 03 Feb 2026 10:04:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHA-00000006RUa-0xXO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:04:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so72045195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113090; x=1770717890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTaOmh9wnqbOJNsuDkJBw5xu/ZxW0Le6p4u6pemJa+w=;
        b=UK8ARsEtagPfpXkUcV0JmYYuB5ZAsaihZZ0L+17JNlx9Odjk4J5oElvijfe1bowO0N
         y+NWm9oCQ6egYkEjyuWyCaTkO4vE+F+Gzqr3Pt+DZiroiBB3TOwBvIfoez2PrOR8sOGx
         WdPGQdGgAWZaoCkNVO8IjEsD4oNg1LFJz0nKP7hC6IrcHjxdxNjX64/Rt6As9uic4S7R
         P3JbcvS7kc72ncyFkTydy72ycZiA9bwi5X8miCGN2WRz9Tx/1G47J4iN9OVD6cVliZxe
         5ln6sghtGz1j4m6MtXP/1UCDpF5lwfBq4LFTrjrKyQMx2zT/DLAv1p1bKqWVoiL3Iyj6
         n3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113090; x=1770717890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTaOmh9wnqbOJNsuDkJBw5xu/ZxW0Le6p4u6pemJa+w=;
        b=dbbawQbds8VvInIHa/Z7j8R9XFbbQMzydqd0dV2cBAZW3kWQWFACBHzV1A4wxxdATN
         9SzXLJZpprXAW3DVhCb/r2PyBUrfORkFtk6ifbEReRdKH/1WHC/e+rktymrl+pvCegCB
         yomtfK3Xe+u68LB8q0J8Z7Y5hI0Jov8PSk5MMQCAqon6EdYYGuImWM7fvKy3CJpmsvab
         LiiH7c9BZY6C910Ef+6Fd1eN1av6hxMGbDzsDeMPdOhVZ855DKf+fEZJOkosGgqHDN7O
         Bc17r9HyQFXiiA2LXbCb8Egm1cV/XzD83W1G1apZYQTRKRqNzSDbol51YJRkrGXKS3aK
         4Mvg==
X-Forwarded-Encrypted: i=1; AJvYcCU9xuQrgHoU6xEJbBMfCTq53wY2utTFfZgc3ufcfigLMpxytX5P1WiTQl4IUra3By5dqGjU3jc2UhBPtcxL6f5U@lists.infradead.org
X-Gm-Message-State: AOJu0YxS1Sb4P4QsLNF0fRO011k8MRF78/KcqPXvpardrqQB/AZZsDXL
	88FAOcR5GJem27B9Noyvzau6SLhtyRe+846q4sQoL/00S8ZFN9WTwYRM
X-Gm-Gg: AZuq6aJmWplIL+gWxldO6p2TAwIoxKzWukzvQzgXVLRKhJNh2kHYIYaovKIn29Bg9GI
	5TrMSF1HsVuVFMAVbgzKrXQtlokgJ//r8l++EApq3UypkQgGo6gBlOfdLY/g9FB+fjtJ8bomb4E
	kF78ARn71LueX0uJ2yu8fZToCQGfFeIzn8PfvQGxqjhbMvII8MUYfdF9QD+U3rWSavH/iwwluhh
	Ssv+F7R0zDJ1h9UvhSbPdqE+w1gURlrVMEjn1/+PGRCYEL0paQvO+8GK+ShIQ/01mMOKA49hb+v
	z0tFAa7bpnRT45N0c/apHm00MIYNKj96HpAez8Brs1Ji1+v5sXlziAxqBDB1j1REqnl9wCPVNh4
	O5X519wmcoOlBeDeYgmKgwurBKwkvtJkY8xDQrdttwqDo+CZ4Bjxpavu1GDRrFDCARqFD90ZOIF
	gD1Mtb3QG1yeMm1pETIJeVqs1S0YRzAANwaPBjmA==
X-Received: by 2002:a05:600c:350a:b0:480:6910:abd1 with SMTP id 5b1f17b1804b1-482db491f3emr167091755e9.18.1770113089849;
        Tue, 03 Feb 2026 02:04:49 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue,  3 Feb 2026 02:03:30 -0800
Message-ID: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020452_274907_D8E20E33 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

---
Changes in v3:
- drop binding patch - picked up by Mark
- split DTS patch into SoC and board patches.
- link to v2: https://lore.kernel.org/lkml/20260126145537.2301-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- adjust binding commit message as suggested by Frank
- replace whitespaces with tabs in MQS pinctrl definition
- link to v1: https://lore.kernel.org/lkml/20260120150329.1486-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  arm64: dts: imx95: add AONMIX MQS node
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 2 files changed, 78 insertions(+)

-- 
2.43.0


