Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E3EDB7CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=; b=XlPLpYtIbD9sJzJbXXfh6lfIjq
	iTOr3/7O1EeJQZLxBAjMIDzzBbN0D62vrAMT44XrL/oQOdM8ewYUtX5Mi9jt0s4j97yprf5Um945g
	Vcyf/wkYsGI3lAas0gEAoJ3qa+ZvgPm4LmLx/MvGEVvIndTMb96hGFabNJwFv6QZ1GxlQlIZzNnAC
	Ar699vBt/RRgEI4/c2hjdc2+GK5i5ev6ebpXlT/DGDzW030dlg++QFnecfT5CMu2J6CrGrz4VUPXe
	77mMh0AihG8ThAdJ57PIOYU6qyQgVNcAOCLjujxEJROsCtj22HLD7Zce5F5xmwLu8JuF55+MXS3Gm
	3CoNPW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dJ-0000000683y-1Cx5;
	Tue, 07 Apr 2026 08:18:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dF-0000000682Z-2DFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:17:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-358ed696623so2019459a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549877; x=1776154677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=FnP5DgTYPaitY/j0T7KICDDTII1nW2yb3CmjOLPio83xSDmP+3Sx9y6KgyPC1iwMfH
         ySf7fSVvLiDRkOpm/j3PsZvSYXzCGZd0ovvuqZd9J+aAsJb8N+lWWke2QC0k9ZHk6g+O
         C+4eXgdt46zv9/KVDGXtzhPGAI7/M5Z0+IUX6yoTllBmgPSMVP/lRhyGT7KXpOSn1ovA
         FlpjAG0mTh0hhMo6BX28XoJbSwTnGrbfyjS7VAT5CtI1kkVfu0gjhYa+JZult+i4+dGL
         kmgbI/Rz/Vrg5NNV3GozroYCMvE8AgE2iqgEVJaAI7WnkoZJLgXWrNnMV5GJr0PE9KQ2
         idGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549877; x=1776154677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=PykWELMudTwCQd3cvE2kaBNWcHhISmuo7HowtOzllz2UFZtCwVgw1A2LkowbqHHRWp
         O1aod+zz0EmeXzekSC3Ew07fHnJHgLUPaKRW9NgmFG1KGmZSK1bNScBVWt4vD602jREq
         Gpz9kimnoi/EiftmsfCJKqw+DIuzANYQSkGlnKkHVOQwWsbzEG+PB1NabdFHoBgRaEv1
         QYXy9AhZ4X70mCg2tQwSD1s9uqnm9VIinNie5CgE/ImXS0a4oF6XWqJ3kqjNCyaTo1HV
         PTDDEMjVtoO0TTsotMthT7sOZ/8Sw866ELG4Ec9OGD6iUfVwWe4yYzAxK4m1gel5gr5R
         W50Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw2X2G6er9M1hAeOXY7o2o8CTehz3mHeTkAMgJtcMld/cE6XHfFwe7XpwRuvtr8ynD9Sot6wTDpp9QrlZ0cwDh@lists.infradead.org
X-Gm-Message-State: AOJu0YzMoM/u1tKV3AsJ8knOCKPm/WLmuwrCmJsXe2TLBJtZNPWu/SUF
	IOIERkmV725UXpv4vlcsEcBj5V9VzAT9mcW/JR/PdcvIbKqnL56f98Sf
X-Gm-Gg: AeBDiesIifjPpvij5DmkssvRqRZcCjHoRQ5ptj9WCm8uuthmXMBpIxjVJOu08RMjG7M
	TLwL9QveNzKkSC7tlwjOZjneTX5qD1R/uXkIZJoA2CAXhOeK00snaZ4yIt+GqcU4zxGgu5buDlg
	FGAeOw03BjkjR6ibBnM9VuIdHtI61Eu+W8os/id862qCribeWma/84mSpLZtWwOYj79CuBfOyXE
	iTE0SIVuuChSrcURb9WXp3W/o/VcnUuhO8v8TiRLFtb+T1AddWSpqCO1AAeZV/AH4r6We2ieV48
	L715nCbIToZ9y5zsAhNDHofzuunEWa05U/KUTtvGO0VWxVhiSiJu+hcxrNablZZSMgO+nqLk+zJ
	DTJhyNXui9O+xbPEssc+9kvApOvxJOPvu69Kg+iV9RSOMwScI6k0ZGMP7p3uU+SuvMY0nC7L/f1
	YZwgJ8/4VYy1ZAKJ441onA57v0VtMXFZDy2TRONl2LvC2BmEj8UWn7Q05eTHyCfBMehR7TTRaHG
	wcgLQUR3XQz
X-Received: by 2002:a17:90b:4b92:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35de678f2c8mr14931420a91.2.1775549876544;
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4592889a91.12.2026.04.07.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v13 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue,  7 Apr 2026 16:16:59 +0800
Message-ID: <20260407081700.2658011-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011757_565347_048D9C1D 
X-CRM114-Status: UNSURE (   9.36  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..afabfe22c8f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.43.0


