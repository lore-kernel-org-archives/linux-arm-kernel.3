Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5FDCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om1ONkc929u95vn1fQ/Nbz6FD0lMp1Ust+GYISd+Hxs=; b=VAU8KNB2w0jn2wzleJAmCByoRq
	piY2zpXAcvLNbDFJDx3wzKT3sJr+095vmN45ntGVWoMWfh/XZcwN9jMZNyEh3FfX22TrCM09RSehS
	pDNhjeEEIGkrWg4Vq9V3C+IF4djPmtc4fRuzdkSBfVYZPXCX9a/WwnjwQHjfKiEb/iKiX1tB4pNMq
	rHqjzjxxYfKrN1oh+UEpnLaf6ou+/Y7W7nsmDK6MiQ7xoyLMdQG2UhmwqrlDFaCPXv9nbgZ30P1lS
	8Rh6GhdjdbA47nyhSxCP9QWVuoxKoJTBhuBldJYSE3Xzhs0QTijfMxOxJ46j6jilGTbLxawFUwUQd
	kaptlciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyDH-0000000FRMr-3SCR;
	Wed, 14 Oct 2026 12:36:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyCz-0000000FRI4-2ESu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:35:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2597177f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981348; x=1792586148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=om1ONkc929u95vn1fQ/Nbz6FD0lMp1Ust+GYISd+Hxs=;
        b=B/P7NXkkdW1gyxoTokvTre0TJB8MM5GSOT03G0s50hOsmquTUYYdpktidvMQYEkrrD
         zyg8vLHB1muVdx/YDHke4ksXbgvHefL6zkIPb1UOxehthJGgE1+b7uMVPSezGWIjO9Di
         UDXPqGc1Mxb9jA1dNl0DpQp3Y8CENC+Ki79W3PmSw+35K4qWePu39y3SZxRpT7DVntGw
         WeOov7XjfRmyTjSvOO41vuWn9R0BQS4+/WQwuz2UuPAyWcXNhf/DcZPjNRhMAJPZ5Y9W
         e7SksMovEINc5fsmI7oqXWLt9nBX5Jtk7rFofMtkitWAWwiJgWvdLytPMZqvntverYJU
         xE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981348; x=1792586148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=om1ONkc929u95vn1fQ/Nbz6FD0lMp1Ust+GYISd+Hxs=;
        b=UjuaB0eNJ7mQ2tt0ddDnrMiyCPA9YpKdOfZwJtNEuuQJM++Cjiu9kmpXs/iRrnSJ8H
         mBr93XX0GSFi+uLtcMjs3Xwsyymi3uLizUCWJv3NGFdxUP6rzdUHRI4lSDQgHvhNhi66
         pQfzuVnPLPwGQYR2HXHVYwUSkbgLtuxBcBY9qjJHiWS9XMEmD9YJH+IJDbFRHFOVpTVl
         4O+peSM9zGUKgP/R5vWN1nln15mHS3+tHzxmNswMbKwRQBqY2P+cx77BYpzUnXLmNzXv
         MyOvCe2w7p/BMcE9Kmo3czq4Xkb6qgJdAG4TN2AVj+K1oeI4tQn2pr+/LxrFgUkohHXK
         C9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFJxhbl33ACQTeGijBVhEnvQSK9ltDdXFkPnD66C9RJbSy5xTYUR3nCC+eSko77RiNhMGK+oWWhM/svXNiEB2C@lists.infradead.org
X-Gm-Message-State: AFq9FYLH6nt7DwiCPbvqU83EKIwVolJMmzww35mVVqn0Nzhps9Ve7iX8
	itjI94IwVyAiSwb/9mkKIdrIT4JGuGRxV91n7wstuPyt1lBIn7hN+cLV
X-Gm-Gg: AYBFou2rDQGjY8fzwAXVbbk7v2QfXHAhbRCPubVJjUBhVozYJrvTkKZuMM9EqQmKCcT
	TzRQ1WWlys6Hg0MDwp0VenHSz0CzhV7RO9wtbkypsU9CtNH2Cnxrwg4JF0ZcdEzY/bu+yM6slo8
	+m8vyAcJOTQp5li/mSO6Et+9NJg52j++2crJMuTkyUgMvaOcxvudWyvFErm8Fb6meGPjDHpdJzQ
	Lf4DJ5aXLOS814Fjdn3/cPxvJonHnhzg9ehne5AMrIhgux9Bag3QTQ69oXK370dvehxLxRKUnlf
	RXQL3MtzHsP4d6ppoczr3mvJwfK2AVct6G5YBukPDQCBDOkoAtWtSD0vFnpsnIdcWmdozKXeEts
	Z+qLyYvwMsb5dSpQ4sAnatVNYOvS1HJ8wmFbuc96EOg58h1np82GY1wYXaSMGQDaNGaDwQYrO1O
	8DmBGdg0O3cz+1P9zbx/clu+fC2HZj9MJ8hr2y4lVA2H0lexgkN+i0gF/bo/rxJEy3zNAuasyV/
	p5mKwwTyx4WHAY9sShiCDTrwBVSp1XBbFdO7t2uwFwVQFrLWa26gejOkJCYOMA=
X-Received: by 2002:adf:e007:0:20b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48dbace50e3mr22564611f8f.38.1791981347653;
        Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 1/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
Date: Wed, 14 Oct 2026 13:35:38 +0100
Message-ID: <20261014123539.2259230-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014123539.2259230-1-julianbraha@gmail.com>
References: <20261014123539.2259230-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_053554_260505_569F907C 
X-CRM114-Status: GOOD (  12.73  )
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

ARM_PSCI_FW is always enabled for arm64, and the GICv3 driver only
uses HAVE_ARM_SMCCC_DISCOVERY to identify the NVIDIA T241, which is
arm64 anyway.

For ARM_GIC_V3, let's only select HAVE_ARM_SMCCC_DISCOVERY on arm64.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b795..31b7e4c90007 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
-- 
2.55.0


