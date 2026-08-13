Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FFAC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=; b=jLq0FiquIrIYXaNhdebPj33JnA
	bAmshbcvlq6NDsTbKXwX3T/VIpWk/yz0mlBxfHNm/uY2J/rPkysv2XstoALq+4PUQKSwCgQJXhPXF
	x6ZsywjFC3bjbZvHRPs9CyUCfFnpQ/6eVu+FAkxbf0SbdlKdQWk+GacFxrcLWcE0CYHIRDLb1dklc
	SSD3Wi7yuI6BuaXp5r1GIOD6XDO4cwqnFc5r4BUUU9RFfPmZjNp3LQyK0MKlB/X54GPrCz6ChD1/g
	qJ/I4jAC0phhQvBy5oCznD2tpGmn4hJ7rhQP3+DopVdUZEjCYueWCt4V5b5UQ8yEhDY0sB+hwoaGW
	HelJivPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv6-000000009ob-1iaY;
	Thu, 13 Aug 2026 08:36:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv1-000000009eY-3dIJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496b7622a83so2759625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610166; x=1787214966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=Y7iCDYiPgEHp0sZ13tZfDQXDXo9Mph9sa9FIYbikAlLE18KgXDude/Rc+fkTT2Ikm6
         0yAOyc50cmJSKHoj5aIjpdI7+YrFoljnLX0/9Nxrqt9S+0yFqdpaZd+As2xqkSf5OPbZ
         ycg6vxEq8ajeH3ylR5wDxG0xEnx0cSeIEGQt12aq92BWiHn132jtSIQvP7PPjb1igXDb
         AJLoS5atpIf+SEbLNOzd+54VsvUH1g1ASX7hpQ49+MTOjcp9xF0geJQ72IC4N57d9HyN
         0V5dLfK98KB78N4gLVaX8Z0wwDJ7sN+hT3Mhpq4tO3iO2vzYFocB0eT1dqMt5iu5wUXZ
         sSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610166; x=1787214966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=OXq1bS5iqCi6h/OvlwSKbm7u2StTZ9AEmpJzjTRuBVt68Pn9vGj6OXjME3xm0Ve7ee
         t6oA5VnPEYDscXWVS8CtAyhJtHoyeBTeGjb2OPerMljI0b01qjlygN2BGX65/rSPUrUr
         Oc/T7eGgZV5JffH7K3x0+VVIc39JnwYrmap13YvN0BVPfB/SMlq6eP9XiPYGeAv58mxC
         UMX2TNQ5UOQzs6L8PH6mM8R8XG6xfh/6K/2FuLyH1CDNZS2eneLBU4duXE87dVUzopfV
         zkILKP9zWfkJansI3hPx4UzDqzeKqHvgZNOArsbvANTT3896o/dd7F78zLUN/NwZyhyl
         VaVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAbySVCRiefPtLhuh2KxqWCOzz0pvibzQV3J4gwd2MedrYeU+rFr9JlY/538+rjQHTZSwe9FkLaCBRa3h37j8T@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp0aRZw6p/h2t2cHDm5fB1W8gIKN8/4rVhoR47NmiA4Oi4L3Ie
	sOQCooTPTwWAvHY43AbmsU6UAfxQSok29woyRRrOy1bIIbHYp9d5FMG6
X-Gm-Gg: AR+sD12cGdhQ6TG7fZF2KFjvJBk+2qe8Bjm0qnJw0s/GMA/EugRA4Lf5K6uT85pVxYD
	DuhqcdVTuArdIHqCFy6JkN9MPDJoxGJE3l/rTl/CTfiH6vqFYGYtYGLvRg7CsR3MlvaukIwwB0R
	AEh6YE4WT/43d9KAD5rU3MjVaxHqQonZ+ksiTfp+aHNJlJV+zBDeAxB9ABZyQaCaaDIe/SUDnSQ
	b+jM0tzbU0uD4s0y58gQerbk84j/c1fvRRCGJPc9FdYtUDHHQXGq6Jv+5ilEi0EBSHo6VFxOoiy
	2XoJBeiWSkLoFo68JHaq7NIUdkzRGt18thjqkNxS6unHALgprhpGYnjXQr9lhSODFTCioJaJgbi
	W4rXxMynrM7A6Cnzbk9vr/3z8bBMmo2W+47eovFcLfCgCghO0eC5fHmd9J/fEuxpg5pF75fPFRK
	1nBkhZeLRdWcDSj/kGCzJ4xRTdR9etSK+465EKPEJIb5NLMvi+Z2rAaqGf25nX5SxNH+mZmH9Ok
	nU+XSCUaUpDBUCAJbIceSRYE5RM3ay2MwXswwk5pieyCGPB
X-Received: by 2002:a05:600c:474a:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-499821bcff7mr43640125e9.4.1786610165898;
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v14 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 13 Aug 2026 10:35:13 +0200
Message-ID: <20260813083536.970196-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013607_915755_33F8495C 
X-CRM114-Status: GOOD (  10.59  )
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
index e0e7fae5b92f..04db742696ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,15 @@ F:	include/uapi/linux/if_bridge.h
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


