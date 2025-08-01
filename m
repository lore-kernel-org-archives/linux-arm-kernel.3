Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C940BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JspzBnfUdrapzn9O/Ou8fn1SPXl0+OWwJfskfM4dnh0=; b=UtaHOIEeeP/tkQLU1UFR9/nmmL
	G4xX2E2DIqNTJewNpuwYmNchm0qK47aE+RzgiiZwbujRbFj9h/XYUtiaEZ+PM2Oc1YXkJTNPbczHe
	Xh6yGz9mPraeWNYM6NrrmYiDEXqUFXoma9K+dSz6TDyS0aOGcyKfsUrE16MVPTJfil8t2FLc5D8/v
	vlR2+6gabBZFbxbiXpb7nGFVJGs2z+cZdQjqGMx14ofAY4pTTLYS4u19kDOpbAOkbP1MUiLcU/Rxq
	d7kur6s+jChCcjd3XmP6B5RZZ2yGxgptX3+vc/QJR+LFm/QsdiUoUpUgjHGvh1tjJn2Yh+k34r8ys
	gm6A2mRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqby-00000006DEk-2MQj;
	Fri, 01 Aug 2025 14:19:54 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqTz-00000006C7w-0iBW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:11:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76bdea88e12so585519b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754057498; x=1754662298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JspzBnfUdrapzn9O/Ou8fn1SPXl0+OWwJfskfM4dnh0=;
        b=E0g1KWe3lGUSUYorEWSFNys8TNQRFWnIpAF7YtCCsfGLZ+6BPpABuJHdOzaCl2cxms
         w5hqba5layfEGegMU0LzRJ2MSz8O5PMyp89k2g0QZMHZS2/ZI25y50wH98aQZgm3wLIy
         ykURrrKpPWTpM+mX40HtKLgm5W1em20CstuzDVtLRNM5uu/FxQgi+nbabpwvqtEUFtn8
         7n5Z8sBRYQmG3h0MYWtUanD0l9GIvyNy2OPKgvhyoLBLdaY+7wz0QNxp1eEd7b2JIjXD
         wcohJHmeIBU8jwSiCcIXlxsbowNwlMDvr6N7Hqtagy9vxqaFffH/dnNXVF/G2SNCAVu3
         Yh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057498; x=1754662298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JspzBnfUdrapzn9O/Ou8fn1SPXl0+OWwJfskfM4dnh0=;
        b=f9rLkPBemoc9VwyDfeqhUaX+/zvRsVm+Q7pTKXVvcaATlK7vVFgzrgv1l5hORAL8P9
         3FvsiEcHowBQgQBLLECMC0mKrH0JcQrEAAQQUaRI7Mf3C5BDqQIGo3WTYDgsMcKafDma
         FtTYA3oO9RLfrxZsQhVrIEcL7wOO+Jtt/3RsEMFewD09pBDwrdWNFJhTVdaOkmMK7jdg
         yaOeh2FokonMmO1Xy200RQ72rnImyA41Z43Dn8toW/UdMaxrM/Up/Zg+VVMEgDY1V5Hs
         QWT19EVsEYEKo1zYhhpxGty5m7qaztGfZTlQjlI6esmsVVQn/opyiFff1qEteJaQTMG4
         ScBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUou1nf3rQ0OTBZREk+mr+swHHASU5k/BFuGV8CMTmw2WGDMi0lKt0RnI8OrdP33yXk3oPhurcj7rkFHdX9XPzf@lists.infradead.org
X-Gm-Message-State: AOJu0YwIzSx9oIIcroe9bW+ARvoH2keipeamymfyXm8iFYsMQIjGNHID
	xrRdkCjQUjGhHWwF7ejnWNeLgQYvMxNqgtJeJyqinv3YhHSxHNnrpOYPCBoUlQ==
X-Gm-Gg: ASbGncur6IKlJ0zKJ660PVjKY748YcQRBthoYf9GsT3uWMUd/6KGLls8HJsL9aHlqlW
	fl7prdFZ7o5a1BEBUrHX+iOra9joJIM5wuJ09at8oJbmGhjx1bZlHDf3Sq/px8OZvVqn0BtRyta
	78hs6I5gbrWxA5UcHt22BQP159G31VjFSa7vlMkuX3JIXdfjAYoKu/aZkq1EBxLroYaHPXPYrtQ
	ElwUmOsdtPakC2fvWt3fPIX58YVX3YgRu9TH+3Bcp23TARZok+SG3sCzV58Bs+L260tJ1OyWRX4
	r/Pxld/fohBr07otCOmYPKAps1fvSQuhChNR573VSFO8eJBupWctVYf5iAKqxR9YgXMv91bfDZN
	yt5vdTNzzbRz+IyI5qiik9+de+LKkyleQSdYwZKRwTpABy2AE0bnQiHOy/JEotlTgOkSh1EXnmO
	9pifNtOubR
X-Google-Smtp-Source: AGHT+IFEFWflCdTZ/ecvpU2vVOlz2gwYHJz3TWkpnJ/7/BQFqAXMZ1d0N0k5n4bY1xfidiervKAK7Q==
X-Received: by 2002:a05:6a20:430d:b0:232:cc63:45d8 with SMTP id adf61e73a8af0-23dc0d608d6mr19356658637.20.1754057498342;
        Fri, 01 Aug 2025 07:11:38 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb0db0fsm3849984a12.61.2025.08.01.07.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:11:38 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Jerry.Lin@quantatw.com,
	Jason-Hsu@quantatw.com,
	yang.chen@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v10 1/2] dt-bindings: arm:aspeed add Meta Ventura board
Date: Fri,  1 Aug 2025 22:11:30 +0800
Message-ID: <20250801141131.2238599-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801141131.2238599-1-pkleequanta@gmail.com>
References: <20250801141131.2238599-1-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_071139_209545_0DBC689D 
X-CRM114-Status: UNSURE (   9.45  )
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

From: "P.K. Lee" <p.k.lee@quantatw.com>

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <p.k.lee@quantatw.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..8cab682b7bca 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -90,6 +90,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
-- 
2.43.0


