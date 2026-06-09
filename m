Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E860CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=; b=LmQMl97zEYJRdhp5UbOJTUxEAI
	Puel+61XAzSYF1zDAzQkNzCtG+Of7qaIOWV2GTp2yslyje7bCnsB0Ps1tekcbw9jm+G6lbQjX5CH4
	wFZA7mC0jMl7zXhdJGFQOQzIYOl6dif7zztVkmMPtK9zS5GfdOq3H/PdhRxxmbPbccPGiMeNQdoUC
	8du5AR4y8XOaKP7Ui0sBVC1s9vCuuEd2FCuGCIENRAdKm3cgE1sQXjBAugTYH4txqEm/99GrlhC3A
	syMvIpwHlcfZFl9NIAG1Z+UCIrpmb4u4VF6p2LxVRVOBHwNszXQ9iAANZ6y8i3GRYicVAjTsu4ob+
	R3jcjmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8u-00000005sVI-2F6g;
	Tue, 09 Jun 2026 15:13:28 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8r-00000005sOf-1v14
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-bdb3fd39045so810309866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018004; x=1781622804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=TR2aUrILwbd+7xoj9knAbAe3/cPIa5TSC/gZLkKDEoz1i6YNRrbl/fWiInvRbL6Ljo
         tgyfqxrJTXPb9f4jGRS5VfeCTGy7rfdChl2HHKD/cykaRI3QRVhzIeuS7csejy9RVEMw
         zu4blW0PQFBD0pcv2JS2a2Yqj26fn5F21GFEexXmljxRc1/G2v+1IIDzTT6Cj3+NCOwJ
         CuCDzIIG0CHOhcd2Jh0Lm20dzJz++i0lmSHDGJmNhSMnKrVfNBsATuo9+VIkIWx80t34
         HDFxo1TwXI1V/2A6LpbqJXxTQ+TRo+2funFdoRnTMlUFNCg5vlpQ7uWSph3TbT5rWx+4
         jj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018004; x=1781622804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=Emte1jYOXuTVZtzeZSaXlTWt2lXOimxdqRpL3H/jYhNlZu2nu6ns6SYNi0uQ1eThE8
         uXqe/xBGlyyNqsH5chk8odmQUQ5vHf0v/RJ2zjwn62Bx1YLZw3ChtcqrvZQgMtIvqxqc
         LAOSggAwfBxBQbnDqXYXaWDBZaoaCqSid47penmCcELmmiGtD7KHKtm+QbDH6Zb8M2O8
         BQtYhDWj8O1nOnLw7VIvokSQTIcwNYMvqzCdOQmXEtpbBBXcxbCMZlsA9aa/fLunvhE6
         kaPVpHBvl2W5y+NmxaD4M/DW4aFL1NbPGlO+FJB1bkN3Lax7aXRcvjPKXeTGTm3heVNW
         B7kw==
X-Forwarded-Encrypted: i=1; AFNElJ8p02EkqTjl74T3Hndbd8zdzG1lL+JhW+gCs/MmEPjwkS9Jx4uJod2m1htQVH/7Z16eisCgJcO0ipKhH68t74g5@lists.infradead.org
X-Gm-Message-State: AOJu0YyufUSYKWhmguJn4Je3+Xjyk9U78UcOgTC0+GPbSrz0rjkQaAkl
	+YixEFMiv0nQY05Wzv3PkZubehIPz8ygxzn4+OP2Y4bPad0CiuxKVLvT
X-Gm-Gg: Acq92OGSHZZJ7zbKa6cczdrbTrm3fbQ0X96j+I2tLhDJMRXH54yOIfV/JPMWIBOZfmt
	eROgj/pqHDfH99/Ady58j1yiaJ9smUlB9IA6TAMQje63qLuwagZcQX85wHhqL4LPtjHQa67gCCK
	n8eMiMpp8tS8QziW2m2yUdOWbN36yaNN93cUGRueup1n2rRLURUzmXMJd24DLLNGeysrUySqCdU
	kL4W3OfoUUAs/L5E3DJ6C2usbnO6b15q6idTy2Xfi3soFcRq7wwz6Zbfgj6qB6un3ekj16Vuvul
	Hikl5daXTRdLgx1crBXZ40FF+M6Sw9lftnk7IecIJ2hRbIMmdODE051VlCoke008GHhlcrh+MOM
	KUaOvDocrleT1rOfjV/M/pLztS+cElNYxiQJcJKaLcvyffzastHGd75WtRCSo3FeOS5X3WrRRTk
	QFiYT7FaCZhOIDlRTMGiQNHgw7tEOsL95q
X-Received: by 2002:a17:907:724a:b0:bef:1df6:12de with SMTP id a640c23a62f3a-bf36cdcebf5mr953590666b.0.1781018003482;
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  9 Jun 2026 17:12:03 +0200
Message-ID: <20260609151212.29469-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081325_709254_C1133E66 
X-CRM114-Status: GOOD (  10.60  )
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
index eb8cdcc76324..8174f005ab43 100644
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


