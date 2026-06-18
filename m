Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B6CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=; b=k7/3QMYf1N40UDpjGnzNcTPshM
	F1PdNGWIgslydmEsjqZ8o0k+XNWpFuI/fwbjRHm3ZqbrbCiEcHQBWda6S1QIhtP4U8TQj4WFssYyu
	7lSnW79HrQvHdbDdXNlQ81q6U0+P8dEBVFh9IAQu5oVFsotM87Pm6vrdmDDVu09Dh/2uS3UCEG7ol
	ZqJa6KEe6ifP8hBrGrt3puNqsJg8I+9Vo8zGBwZtQuifciJJK6TMV4mBAMXYeUAIi8x0UZrsveJOX
	p3AWFwQXSMKICbo/7p+rbUPy8pyJAuuxXBJ+SllH0x3yLK0i7sQxY2rF+S0PTbg52Rz0jVXbh33nx
	TIxNilgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKR-00000001Ikv-0r5Y;
	Thu, 18 Jun 2026 12:58:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKB-00000001INm-27ia
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so4105835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787505; x=1782392305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=VSSHJPVwohiYn0aXt5yzURk4JY9kKPQW3kuWEjqAyl4Fo8gpDe20HE1bVsaT09FUta
         aNte+D9FzqtGhAZL1C4tvbfih427QRb8Er36LSdMceX7k+tMh5tN39FSXtQ7U/vVUvnY
         0VlnGYPrc+olIrr6fF5mVuzqxop7PB89XldxEfwyM/cp09eVcJOzkySdXNdPJI9ka77G
         LPaQB1T4H6uo5MY+rx6cW/CUaVrggf0trLzzUHNsFl/PO8A+Wyqj8XKVlsXr8lDeiv7b
         IPZ2DcTTC98ITKJsLT8v+fcbTCuWpPZ67mfZOc0yPnco5Rg5vyKOnZqu3JE4QhGH01LE
         XhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787505; x=1782392305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=SMkDUhz0aiNSmkNVEyRUg8BD+VJz5UA0GF7lNWAJVyL8R3iZ+1znStGGcXbpNHeIIY
         KQiT+5k3tZmauZTelIEBlCOq6FgXteZ1uVwj2gJvcDhUtsPBj71VWGrxdpyD6ToVqvQi
         RqnMDFnBmc8WYNMsIXizcgHNQwOgo+wPwJLQ+PMeisUUlgHFcL67VBpUk+khGMMGCVPn
         ThH2xXH4lXdWGqlr5aHvUgWNVEQluO664Huh8ox987qBF3D/juixeW2Hs+qWYkJvKymR
         yxQC5WgeitGNpe48aFAN8/67HQ3xEQy6M6mF+v9xQ3hc5CzTlZytJY4Ijx2RHPMX8LRZ
         fz2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HTA1Nhsw6V7/VlylPX9tXMcNi6piqrs52/B04po17Z1w9c7H79cQttfdUeitbl9c11Pz/lAoSIeN/IG3jBTZ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzvsU+Fw3YSRS4kPUis+AOQX7KlPFXwWvJj4AeBn9kK9HeDnh2i
	ybba05kLMsjXKxl8Oy6Ra4QGaNc5Aq++mzlUF1MQaHQjJCUtjffUoHpd
X-Gm-Gg: AfdE7cmOd+bvHDTg76musyWeCsn6jYqH9FCxpwLXMWEiAfKSvYvBbAkAraQUSw2Ny75
	pysBL/Dg1lIoQ6tWlS4KVb0mTxG0nDK4Yxut9rYCRwjmPFJ3FxRID8Sv843O2Nz69OOsl7+BOKq
	X6jVOyJZIEOK8T5AF608K9Ygpv5OqCxKCcfvN11C9a/u+ZT3UGt1ghGFtPINRQesW4EvYTYcRaz
	GVSWRhUWyLvHvfH1O1zzOMUOznLq0l2sjisrDMNvL24AV4/GDmHYPPdQ7sZwc0S47hcmPDe0/o0
	xTa5mkAwZBFDV98gvsdEkbajN7J//0HNhh7yViU7alZJJknjVraePLTk2iA2j8erHwnXsYbL+/f
	PQuxOcbCy/pVb457BztloaZmjZ/YQVc2hsZE28ChaLPIDFXL6eNm3TgLboahPs2GL9kUXcGErRC
	2/QyuHYphc4uY+C0q2LUheX95wtq51fddNimLBBdK0KlrCWC93n7pONDk03EQeZA==
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr93229425e9.10.1781787505189;
        Thu, 18 Jun 2026 05:58:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 18 Jun 2026 14:57:15 +0200
Message-ID: <20260618125752.1223-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055827_702787_04EB6623 
X-CRM114-Status: GOOD (  10.45  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0


