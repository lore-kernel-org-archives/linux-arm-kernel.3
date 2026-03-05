Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AFCF513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zcZpnrWcDjcweOn1Um75L9TOaVFcEi5KqxXQxmAOFC8=; b=fxnmXV07zZyLPSm68P7pa+oefM
	boHVoy5bTNBjCxXnFr8vnjq7wPjawe60o441QObPxpYRdRByQjIoeCpoh8f3TQhxMVCq5NWbxnCRg
	Eplgw7Sy1RwTGSw0TCzsyn1mRHRJR0/9AGNaQjQDCq6WgPHBUEU9WXlDFRqcqOYYyfv6wqmFFIkak
	AXLYV5pu6+LIBD3RGgUu6Bz8+NEha4TCoASGISI1Ka6973KLno61nPRYev4b3agHDHYxSyeksffzL
	3YHIc03Zq6/Ld9mB2PIzSlxXHFxcfxuMbHPfv1rowev/XzX15/6s0LzBVmYMFqEe2ow0yVCIR0m0x
	Tom1npMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIPr-00000002kLI-3WAN;
	Thu, 05 Mar 2026 23:47:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIPp-00000002kKw-2Ii5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:47:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so97167215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 15:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772754456; x=1773359256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcZpnrWcDjcweOn1Um75L9TOaVFcEi5KqxXQxmAOFC8=;
        b=RdbXBVWrjXeN3YjPif/NSS8Nqan1FyvZeKJOiWSMd/YSanyX4acFZuL5Vau0ZXPMAl
         cVfcoY8n/RSf5IKTdGaw1raOYjrLc+q19+8tFFedgjxXMGc/B3KGuFrHX2rns5SCCpZX
         6Y5fCzCDSvCCOYe4UE6Gf6px0sQf/4Ekkxdw3OntxM992PFabTZeoWxGzJCkeph7+Pec
         1aRs27mquAxBqkW/d5rY3Msh0/SJOGiC2MVVTHrzVIyAv7v67zTMOjnIoXAjfKBZfaTx
         2evCW5N9O6+TOKRtHHA/8GnvZxYrbz59yQqWKPLisG6Q7fhiESZofg/FODCggEQw4EXb
         HMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772754456; x=1773359256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcZpnrWcDjcweOn1Um75L9TOaVFcEi5KqxXQxmAOFC8=;
        b=wjVTpwjQ3DkV1nqICEusrmUxcU4UWKE3KKHaFnSOfHiNGLiMymYw3xdaPz276pCAp2
         OFGj+lqon0Fo3XHBzt/kKehgBDRLdJq2OaR0b1YczP2xzkiK5mzxCktR4UKZ6MY7ls0q
         Vwp0tg+VpoHTo5WXPrV+9h2Y4CZKvN+vasOeqHo1kRdUNW26c1Vy/9kR6MPkwQ1zl38d
         ijr+2qEnmDDeJ7p4Z21idxCLfLSy2Q21DTkufW2VAczLlkB5EH882FkQA40wvbLpnXKh
         UwnzridiCD0cUYk2WboOFRq99vs/6Ce292C2hx91PCMD1wEDZ3I3TGR5j/f5/PtJzfbT
         VYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS9JoDmVrd0Sa1Yu/AEBIoHYsjdYibU4yy0pfVKiyGbSGn6GYCPDfA8+dZpYTLm897UoTxHu2asqXXvKgRSC3c@lists.infradead.org
X-Gm-Message-State: AOJu0YxEn6CYJM/0BuMtbXbWE8DODRIWvRurfIJALH95KiGEG2IyMIeS
	bHZ/Gw04tii2zeeM1sz9Tv5LvVOgQbghfQhx0yjoMUC8AqdbLbGZSXMX
X-Gm-Gg: ATEYQzxS2iaENT3DwmLC9Aowt26b9wRprXvVKT1aLDOdl2siCiTDwIrfg8A4LuLjCFu
	Jv76MUdvTnR/HeEACvNiHMAsgb6+D4ur7Tr14dpGOG27O3VSmH5Ef4FYy+ZnzEYI47a+Ou1TRJb
	2Kgwu9gIOmRocfNIgjpjYZ0W2mW48m9C95gmbWusDv0mXn0o2+DKlZ58Tje/K5OFs1f+eZBSX91
	0U9TM2PQ3qR6IOs7nDp0LpHdVZtqg8K4uwd1ks6m4Nn9Rb9m8cAKbIRTy9U3R6Hz0iK/B/evjmq
	4dwNDpU01V8lvXqoKE4oRaTbpsrkkY+x5kub72X2OLGPptjnLIzw8w/NbRmWnqI6bGiTvnuMt7p
	DON3M2qACrXs/Ax50pjBAAoT/9dT/MKlp6qQrJEnfAcihesYtK8IemNa8x7jpFM3JCZOpO27le7
	WEognMZHCNOxaAg5dhrk9D6owM+9xH
X-Received: by 2002:a17:903:1986:b0:2ae:4847:cace with SMTP id d9443c01a7336-2ae8242cf7dmr3033205ad.28.1772754456050;
        Thu, 05 Mar 2026 15:47:36 -0800 (PST)
Received: from localhost.localdomain ([1.212.70.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73917b4000sm2515316a12.15.2026.03.05.15.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 15:47:35 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: ulf.hansson@linaro.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	nsaenz@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent property
Date: Fri,  6 Mar 2026 08:47:03 +0900
Message-Id: <20260305234703.38490-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_154737_611719_390B1983 
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

The Broadcom iProc SDHCI controller supports DMA, but its binding
schema does not allow the 'dma-coherent' property.

As a result, dtbs_check reports the following validation errors
on the Northstar2 SoC:

  mmc@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
  are not allowed ('dma-coherent' was unexpected)
  mmc@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
  are not allowed ('dma-coherent' was unexpected)

Allow the 'dma-coherent' property in the schema to fix the validation
errors and accurately reflect the hardware capability.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
index 2f63f2cdeb71..579e44843404 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
@@ -38,6 +38,8 @@ properties:
     type: boolean
     description: Specifies that controller should use auto CMD12
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg
-- 
2.34.1


