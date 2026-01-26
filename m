Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAB3C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l0bRB7VVDjDIq+ulMsBVmhmzBjYiR54K3+u8tiEuOs=; b=C7qzYN0RqKxo0XsAxtobIJxd5L
	+6pDPYTsdPXlbQAg2pra9bIK1lQj6zFznL6fgJp2Kf2mNFvySPhCGOWVpFdnzGq05g4DqMqXtFMpX
	boYO8BAITf6bLmVuWa6jM/vt5cdpgLPfkCtgWysKn6RLFBa4EbYJrFNzt6S6Zecdjn7s6aLF/nPkn
	YnQyJg3CRZcvP7mmlbjnsoGO09Hkq/nWpOIyRHonvPQ5Pn9c6XoIroIh4cMISKD7oUIgdeV3H+2Cu
	Sp03EBk92DT4KHKLyKrGt+s0fuBdAiwhGXfgjtioFjYsjQZt9xF4jVjPym76xlBubeyUPoAsNNU9b
	qVPnyLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkInj-0000000CBQm-29lr;
	Mon, 26 Jan 2026 09:22:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkInR-0000000CBBJ-0lQK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:22:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso19772025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769419327; x=1770024127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l0bRB7VVDjDIq+ulMsBVmhmzBjYiR54K3+u8tiEuOs=;
        b=Q6jKPlK0PED7WFg7ukdwSNntVrL9Bi9VYgAEKLt+A4hQ7Y/FAkLV50Liehf+fqCkCX
         b+rnk7cVhf1rmjAh2JQnkfl0FJ7XgCQYFo/5P5ZUFDFrCFYJDNxjdX2Ev+isPD6vlf8i
         6Azvvr4dBqjELLb0JHE14Vk4yfuFwGhhfzFFVW0f/Khd+GaETgCniEIPjp4S5EHsMJrd
         O8dsD8cMvJzuYd4fEqigWdPpF/4S1roveSH5qmEPjcGqNrpp5mPBMWAoKa1bPZpXKw/X
         V3nD1AEzvU6I17SV4jrcvO1a5xCjHhkSECuycSd9H56j/iNo9NCHRWILLMDiClRPheRG
         2IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419327; x=1770024127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6l0bRB7VVDjDIq+ulMsBVmhmzBjYiR54K3+u8tiEuOs=;
        b=BYAj56IqUH7ogBdfoegeUyhGfH86kzEK+nzLyqACuw9HBQ1VSNAzM4rOcQup++QnH/
         FWjFd99cCqc1smgqohD5yZWQYHl+yPOU21/S8RuPpqOFKCUtNPscVezDSbBuzrJQE7Wz
         dYNgU6P7pUzCEeiHePQPLmUD7jlZen1lu/mrjBk99xuGtGZF3RhiVklODnmLI3CQnYkJ
         U8hOD8Xsbffi5DaydMiTsU5WnH1DE8SHNUFj1GR2+1qdDZxcOjMt+ZMULQ/UFE/n+qpr
         WdcHNR+8hzHeRbiSl5JTFUIUyWIYZm2Nd6aOD4JkS+c/kxsS3c8Z+sWjN83j+eT3c4nT
         ZGHg==
X-Forwarded-Encrypted: i=1; AJvYcCU4RmNzvCJvCrwgxC2RwgLxRRCTW0GzIvy40iIOSxixwcIMP3JNCoMaCI/drxYCIV4uzMjDjqqODJlK8J7siuYZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4chudIznG8sR6YBC3jsvKiRvEM8XyMs7/S++4CSdJlgnL7msL
	2vFBaH53jWffYkPg47JFHeVzQQYFq0aCZlYmSR8XBwf3OiPtcRd7Gv2QrjvzQq6lF3E=
X-Gm-Gg: AZuq6aJE+Z4h6hxRC4IIQY6G4D1kyiDihATiF9HFtJIHjki8UIS7kIRNDZJVzvsV09v
	DCCaMsgfCZ+FmTu67jypIpdFuoccOCwoqhC7LI2jeP5mXQWudbpwp0oU93XbAWleG/nwJ59H1hb
	CXw9xMEXI31oWO3bZi8nwmk3jF4ToqcGzAAkVNS3PeWD/+i9o4ca36XNDhEbxGg4xZ7nrqxsVGx
	w9LHgQH/eDpSEM4dOyqEaH3jVx3NnpUDXry8DOfUCM6dy57JSJUoOROAoa+onD0G4ZYPF0DkK8c
	yx2XxYiCTE0sF35zw68icKdboMkEjBZshToZJi0pDrwM9rN6n7rXLqJmyv5y3bqOI9lNnGPwfvs
	0tA6dLwKFOLindrIiwCL73RprRvp8OrQk+4Z7RfWAQOG7X9ApVGGSvlum2RbF3vWse7Bei48UKt
	13BHy2SYEB+2XaTQPCrc4=
X-Received: by 2002:a05:600c:3b9d:b0:47e:de23:dd6f with SMTP id 5b1f17b1804b1-4805ce42a6dmr67097725e9.12.1769419327486;
        Mon, 26 Jan 2026 01:22:07 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:e270:a43a:f2fa:900a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm346669855e9.14.2026.01.26.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:22:06 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	p.zabel@pengutronix.de,
	linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com,
	bogdan-gabriel.roman@nxp.com,
	Ionut.Vicovan@nxp.com,
	alexandru-catalin.ionita@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Frank.li@nxp.com
Subject: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
Date: Mon, 26 Jan 2026 10:21:59 +0100
Message-ID: <20260126092159.815968-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126092159.815968-1-vincent.guittot@linaro.org>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012209_258213_31F68A46 
X-CRM114-Status: GOOD (  10.68  )
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

Add a new entry for S32G Serdes driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..888674a308a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3202,6 +3202,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
 
+ARM/NXP S32G SERDES DRIVER
+M:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-serdes.yaml
+F:	drivers/phy/freescale/phy-nxp-s32g-*
+F:	include/linux/pcs/pcs-nxp-xpcs.h
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


