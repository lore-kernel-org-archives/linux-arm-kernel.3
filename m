Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895A1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZdmnC8PcEOZPd/qRotPAi5bThc5SgobYaLTba1a6rA=; b=x+aJTIg/4xQ7ooXMDkcR1NIEc+
	9/BYqIUn8QOviNz7zrPkr87/RcHPntdZn1dNsYHY+7dUkZlISedtKZxBGRONtOxyJdrub+liDWpz6
	8LSjxpYsEnTOTzucjQyCFPOjxgDeCbbDJSAjmiPP09iOH/yWJadu6iXfo6odq3K4JjUbGs0jhQmUW
	CLsUWN4UBplqwPbydMiimqS4qVAlrajEOU+bf9enVYxPLym75EIGLHPvkHf5/heCMyepKF5dSJqAR
	x6YiKGQluP/wT4Xzr8cLd/5GOhej0MHSOs291eiVCBiLu4M/Ea/XFbrHu+/wVkW9Z1h5UAeKKEbCq
	GoHmllzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejIq-00000006BUD-1ZOO;
	Wed, 23 Jul 2025 23:55:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiux-000000069Mz-2VTi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234bfe37cccso2716465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313435; x=1753918235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZdmnC8PcEOZPd/qRotPAi5bThc5SgobYaLTba1a6rA=;
        b=OrOw8mIK0vhNkFJnDz3xezn8GKulD60AbLaNPTft4NAlx6hqpe/uFWg6SEYaoKn/mA
         2FF3i64yPXl1l7gftwpAAlvgtJ0mDj4Lyv0GP+wZj7fnnXoqzE+0F1QhsczMRUmhriD8
         igIVVgU0pUH1x1jbX8hg3KP6RJMN6UnaP3Sq8AXP84D8yeutzIAkQakxvSn1yjjOR1Ld
         gFj81/QWXDJjkZsnN5UqFLcYN93fUZfql+MK+K0ydcnwdzqy+xe+EvbwHz2nhdTjSxBS
         7JP8shaoC+HPkLOCc8zkKDhit2AgmnI7BDTAh8cZg48qoxL0qhsMNNCNQrOtUd+cf0KT
         YxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313435; x=1753918235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZdmnC8PcEOZPd/qRotPAi5bThc5SgobYaLTba1a6rA=;
        b=av5hhngDfQm5g8tvy+ctqDiXPSZwWCTtTOuSwsMDUfXJOadg4QvgKdl8EV8/JqmkX/
         ZmDOEqIYLeKBEs2f8Swe6qFeXbReIZ4X7DCCM7xduTHQn92hDG4qyA8f6nZw0FDK/gSn
         4Qidb/DpRgpbZ91/vUX74AoxIUDYgN74TqIrcpXdxIjuj1+ixOd+xRauPPiSQ/anlAbO
         25oNI1tsr13/iMiv3klpsl6YjNf+B4C9ryLqwMwcReXP7jssSmXusNpIt3VxmX2RTGSQ
         hSn93Ki0cTF59WDlkml2wGhs9D7wE9GCeEbEEdRdSSnD27fZS15LJEqsv1WgWgox00me
         u62w==
X-Forwarded-Encrypted: i=1; AJvYcCU+z08jvR5yotUy855YEg6ztF2WR4SWHvqy5m0IdCfTDaIh7g3LYqhmgtrqCvLZizBE5el2r6NhquYddnukxrbX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr+DFmkZeYFjsezeWPWi1aH3PxG85ta6IUrXNjfMuR81lDLOOC
	bRxrJX0sLiqZLtsFgh9IUI+H5dSpt16sBRWbkN5/RQIH2X57Ti2lm68UUJmQtES5
X-Gm-Gg: ASbGncu3CroxuD8g4XGtaGMDbqV/K5TMJbL52bXksikBiiIGTyTR/0fWgSi30rG52ul
	ff48g910e3kyx+N8k8Ty7AUfgqs04rZbQVMsFzlwzNhWuJvsi5hDKx97H/rA5TqlMp4Q/Gtu6ao
	4Lt3bk/dnF9NgixqQo/DCmrPvExCpT9M4g5Fog2xIMiNs4tQsk+nZ+DfgDBaxuBfSirS+zpyB7h
	cpFLfH3/Cd/jFEaBQ5Vakx2uySeyTRCKwfoHxMtc/LUrL7FIwry3PSovTWorP4zJ7rzEJ9xaElk
	5v/PYvXXn6bsqBSvQhKAm/D2nG/kCOO7G+EdAfKbYjUy4dCaf82hUHiN4KxTklrVUN/8g6jAqFA
	qljG6rR2YCUVOIJW52XJGplFEQ4hDXXRjQiCTF3XK/znMnlhZKpHUl5FqiGrwHfEaoirZyuI7K2
	k=
X-Google-Smtp-Source: AGHT+IFIyOTSA2qmRbTVKiynYv9ixlJ90tvw04lgs/CHVeXhcLa/lbzWOVby0mnDzFVJ3P7H39lEgg==
X-Received: by 2002:a17:903:2352:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23f9817696bmr78290955ad.21.1753313434862;
        Wed, 23 Jul 2025 16:30:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:34 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 09/13] dt-bindings: arm: aspeed: add Facebook Fuji-data64 board
Date: Wed, 23 Jul 2025 16:30:05 -0700
Message-ID: <20250723233013.142337-10-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163035_635087_4B482AA8 
X-CRM114-Status: GOOD (  10.19  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Fuji-data64 board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - None (the patch is introduced in v3).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 0c9d6a30dce0..3cc6e62ae5f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -85,6 +85,7 @@ properties:
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
+              - facebook,fuji-data64-bmc
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
-- 
2.47.3


