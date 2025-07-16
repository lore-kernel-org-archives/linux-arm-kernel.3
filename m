Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6374FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59/cGrD3cECKnmhhvyten3EjV5sJFXNCMmz8J9SY3Wg=; b=2onnrT7eChTBFQsiSCDAHpBbFL
	2fBHz/yf80etYYXsM5Df2P6k7jofc+7z2JWMH40foXGp0uxoRYC+j8S/2YemfLndJF5yh2hqjcJTj
	/pXU21AGMaaRQB1dDNGJm54qrqHuw5ZhfYhX2gyILykXkqbHhs7osrj5FvUOS+YnJRSUtGo4EaXcp
	ZtYSJ2bR9H3n/GfSCUPV2Fkth7hcj039Xp5n+7QcEdwsWsZu+FNCv7hnaStUcQOBO7HXsOUSDw1lL
	tjWK8hdGzNpcIfgARdUTtVt1U62xxbTeUlfdpTpzNCJfQWsGJuY4TzH12i94AYY3Rk/oWJ5Zj43mf
	zkJjqrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubykb-00000007KK2-3Lwb;
	Wed, 16 Jul 2025 09:48:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyfp-00000007Jho-1AWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 09:43:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2352400344aso57948855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752659016; x=1753263816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59/cGrD3cECKnmhhvyten3EjV5sJFXNCMmz8J9SY3Wg=;
        b=lwUGr3Ma8O5Vkm4kbzfJuQjWogWORrTYXuePWndAE/zYQSa2VuQnBvuEHRCZZWRcXL
         6Ke72gNFS3QVHGFn7Kr6RpENF2L0EemYslDOzXU10QFMdV32ruFYVkugR+IgfZc2emHD
         qjdBm+gyKwNtFzJU6PfS+xqf1sSZjqgzcE2v+lwUEDp2+9xyDe2WrPe20vSP66d5ocWe
         AeD1FDCtgv+d1bwrtfxfoPkGEazYpIvwDPkOA7Vv2lIYTrmuz0qI4nAVnJTS8dQt/TJp
         O+SlEZNEi/0yS7KUkyuUsp95KyUi/t4skKlljn8ljyknah2h68sdRZjngbSpswv2uEuB
         Yzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659016; x=1753263816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59/cGrD3cECKnmhhvyten3EjV5sJFXNCMmz8J9SY3Wg=;
        b=JsuMKFaPfVLmaf+ScVKZycXmMlCrODoZKokMxxTf5Fv7xeSNSuorEciOYxaJxd5wtP
         3/hBotGvjqTH7PiyyZL7IP5X5B9FzQgOTHNVGu++9WHB4fEn2dHanBeNLfa2chGU9NRD
         uVMBfZn44TgYre6hrFfIfLBOLngnkcRAZCcbb+NG3y2x0tUpRW56MVou6sFoTaNtFK3Q
         TVET24b/dvyhPZoH1fPphbMbLwShEv43871HQnbNRYiAmg2sL/VHc1FvguUWEy+VEoQA
         bY9HsPhrMmySQh7+AWHxo9Xg3dSlkGMxZwyTGv/Ddbgkw7BPW0Sml8mIISwTBIe0ZJfO
         ZzuA==
X-Forwarded-Encrypted: i=1; AJvYcCWZyftbUpABpYzu55cQmnN5zxhdNXvFsTYyxELd0khnHduEzZ0/755MtMNoVmPLuYQeO2ia3TUFkSPCiU8QrwXv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zJHX3Nj5V8OIZj5+615qDKb/16N1AUQp2Q9ta6c/DeIGNQiH
	J/8FV436qaaKjV2MXzD1+i9wWNFxHtS2AxSJdgF5PAKL4VICLGoCgSUo
X-Gm-Gg: ASbGncvBWdXeKBT6rneqs/PHhomUjghzfkrNAsdY+BX8lhX/gO4yX2dImHQZJwcGhrX
	zI5py1nLL9l7cxI5USaGaccqXrAbeTHeKQIuLnEi/8VrHa8VtVY1D/sPb5SZ0tLS/V8toqYG6AN
	PZjfupenyYf9VmAuxI/rnvxi3zwUuh49xVXjQfPskS3onP/YdatVHnz55/pmiiVYs/xwdT3nyfO
	NXZK0pbH+nLbJ202FhRVvope7/5QbUtpW1pa2QOj6eOyK09W8dE4pxwSbzYF2utx8k6UzaeEzsd
	sge3v2JW8Y9oDggla/iCIAoTg7TAnIGgBAKIooQ5WTeo40Vvtd7Pip1q5TmiJdI7prbnA1wsWxa
	I5Rvwt12a/9dG6bRA9Ofp4p+f5nFZXORjJSEm0VBNYJUE4Wjy4jXenEXrRGHXqijB1nX+aw6UJw
	0UzlTERd76
X-Google-Smtp-Source: AGHT+IEjRWwLIhiIoP0DIOS1wG+5KB2COrui2fTYZZ19Fi0hrVi8hf0inWpz3h0vQDLXUd7CjVKp7w==
X-Received: by 2002:a17:903:19f0:b0:224:910:23f6 with SMTP id d9443c01a7336-23e24ff339bmr32733445ad.45.1752659016492;
        Wed, 16 Jul 2025 02:43:36 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2350acsm1039503a91.45.2025.07.16.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:43:36 -0700 (PDT)
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
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Wed, 16 Jul 2025 17:43:28 +0800
Message-ID: <20250716094329.1069203-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716094329.1069203-1-pkleequanta@gmail.com>
References: <20250716094329.1069203-1-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_024337_316923_5C4ADD4F 
X-CRM114-Status: UNSURE (   8.43  )
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

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..98ea2b3e0eb1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -86,6 +86,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.43.0


