Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E3EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4+1ivRLPQ3G7Kv8GU2D8AHDkWXF6MhoqD65+o5xLeA=; b=I6b8HFWFH0jxbPsio+hTr7gzpY
	mEvMR0lri4zn2hHbs8xhFAtWAAMt5UZBNXtcqBw+AAQelSEGT48TlOpKKCd8n4FoAbv9/nNwSfoLE
	hfclRVP5rcbA+RwggEl0tLcbyZg7peaLrffJ3PTdCHeIRNaCi3lNa+6ZyaKAmS7+Y4N1gxyQqFya9
	hO1/HM6iKLhWxOnC5yZCe9S7ARHuoYwLGBU7oIeQk1uH/eQ94QZSUrLgTSsnHcFA+dFcFWnxwLe3T
	99CI37oUMFkLr3GIiWGlnJ7oOV0a1e4PXJKwzeKEWAQJ8VarAySzWrCeTB3Ap5nm0V3350UJOOZvv
	m0zVL8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90K-0000000GHHD-4Bpb;
	Wed, 12 Aug 2026 13:28:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90H-0000000GHEy-1mj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:28:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso6672765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541299; x=1787146099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u4+1ivRLPQ3G7Kv8GU2D8AHDkWXF6MhoqD65+o5xLeA=;
        b=V4dvMwnRsfivdFAV9GplE55sZBq37cDvBQVbstYEOSNW2E84Q/Bh/QVzpjSLLcKTjz
         fETHLlsxMGNZML97TWxkGyzVdGPA6ofvNy8Hk30sZp2MUqYQag/13UKEaVKSG9hfDE+x
         gsb5F2AjWInBss2aVO7A3RuhmLAm2q4JpXuUIonXYcDruoCqY2j7WPhgVyk7BAmUwOb9
         zXGMaFkZFvjs2GuyfLo4z2RPhaEGhBEIPD2YbP2xFB2PYCSZATNjTCzjjYVxztkNUOdQ
         7SdKxRJ52xtRwFCGwzIJuwPaHP8htDIWVCiMOPQ2yFo1/ehHiRUKR6Xxg0yKEbgLIdCk
         FfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541299; x=1787146099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4+1ivRLPQ3G7Kv8GU2D8AHDkWXF6MhoqD65+o5xLeA=;
        b=cc8BX9aT4wugxOC+ErBunoZw2YdUAtfqvK41/NQPWGqTmSvIif1SWW4EniRGTpqkXU
         +THiOKQq0W17Uc6/6skkxnWCs9erACa6FBarGELCqPVTqeFXB4n5A9bdV/+rj6LXpobe
         bL+9KUlTRQnbnp+SBYjecHLiVGd690Ed34M2fnaRmMG3awXTu0Hp7YF3rTLgLRgAGZEU
         TosgsdFGGs8aUfE9HqGwdkcCTlY2GZz/Vn+HqhKgdU0qEq+DRW+uS45eonQ2AlGy49kJ
         9ls9iRoOnQH/O+aGdl/LIdaUiqbUAwJeq53CKxVeKN8CO2gpVRREDWnZlw0R3ee5s7vn
         lucw==
X-Forwarded-Encrypted: i=1; AHgh+RpAeYnjzO8xLitLIjOZ+tTDt39LJrZN8SHg8ST7uodwAfD7lrzZFRrqbyXtahzx5m1zqlIuGg9JiEKFtXjAplfa@lists.infradead.org
X-Gm-Message-State: AOJu0YyKqq+at+O45frQC9Ggv9mBq+i6gEbTFQDQHL1qXnrtwmb4+zJo
	1tdkGpSyLHFU5RXfBYykMC9S1Sh61Du1zLFO2j27PIDK8UIREOc0mIw2
X-Gm-Gg: AR+sD13BSZ6PdAYsNNIJJkutY8wxlt1z0Fk+tqoAVthjwpqPdARvE8V82dTo5+Z3ATx
	mRsKJfrG37fjaNWTRYA2wbOWTRIN8zkCNAKM1Ci43NTm6jWd9Vn8meKURiCOtiSvIbXzXBqfcPJ
	PrVkHj2DMlJ8tmwRtFCysaZ6GWy/XSOC59syBiHcEqtQmqc5/Kbh1Bh0BuQnlg9qZqeme6j1GpE
	Un7SzYaekOCN5Gm9aW9rmp40SbW0Pl9Q2j7OKx5HhyoPmwjvefqipJSdU6C/umj2Dlxfk0RRer3
	smx9Av/dZ8ySjLKg54kebldu1VElJHLTP62mydWwqBj7gFo2FSWIG6Iz9Ajo9Hk2wbVFEoENLvl
	NmhZbSYldEy1iBC3+D34R1P+EmK8vrPJauxyDydS0Xdlp6wfSezwM3obBHI2NHnUynRTyAN/W+g
	4m4jGdaOM90uRYRK3DZ/t27eIsg3kkSpq/ryHZe3uXp9RA2gBSyf0D3IGcN9vMMpCygQ9eEJq2I
	TNbnQZVZ3RJecI9x32xiuGtgfbpKg==
X-Received: by 2002:a05:600c:821b:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-4997c1459cdmr73221095e9.9.1786541299017;
        Wed, 12 Aug 2026 06:28:19 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:18 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 4/4] ARM: dts: BCM5301X: Enable extra CPU ports for Netgear R8000
Date: Wed, 12 Aug 2026 15:27:55 +0200
Message-ID: <20260812132755.32585-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_062821_550627_63887AA0 
X-CRM114-Status: GOOD (  13.37  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Just because port 8 is a preferred CPU port (because it provides a full
switch functionality) it doesn't mean other ones can't be used. Let
software decide which CPU port to use.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
After some extra research I discovered we can't blindly update all
BCM5301X (Northstar) devices enabling all 3 ports (5, 7 and 8).
Sometimes extra ports require fixed link but it seems to be device
specific.

 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index bbb6b869507e..ef8f3b41d696 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -226,8 +226,6 @@ port@4 {
 		};
 
 		port@5 {
-			status = "disabled";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -235,8 +233,6 @@ fixed-link {
 		};
 
 		port@7 {
-			status = "disabled";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
-- 
2.51.0


