Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404B9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0VBquDv6g415iy1L7kGakH7H853FAzWxsvjxiCHfN8=; b=sX5aLKAX3h25ldKNm1gwEgp+oD
	uizazbJa3k9VN/qAXaGR89l7LTgH+roMyjwEJNDxCL52iggkxTH1vEGfGCdAmBnLfgFc0DRDQtl0S
	P+8SLeDa81dEaMr34xn6OFgkegZPltY3mbIzKF29HlvTW1CAeEASHFK3TOq4jvsnPKGpywITVB+q6
	nc3oCGmJSHd67p3zam1BL3vM0rkeylMLg8bjR6vapLF5pek3X8f+PHo3kmdbzji6AY3VpyDTm2cjx
	EMvPDBZVRrW6kxAo0oSAWcOH5FORmjy5KWw7tJ7pv7MnxB3cr6ALaVT/54nr+UFute+CihWnoMI6g
	1dVErjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTs-0000000BHCp-08uw;
	Thu, 02 Oct 2025 21:04:52 +0000
Received: from mail-io1-xd63.google.com ([2607:f8b0:4864:20::d63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTp-0000000BHC2-0Nfo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:04:50 +0000
Received: by mail-io1-xd63.google.com with SMTP id ca18e2360f4ac-91fbba9a8f5so121759239f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759439088; x=1760043888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0VBquDv6g415iy1L7kGakH7H853FAzWxsvjxiCHfN8=;
        b=UglzPZm2ABNjvMsccDkp334DTNEk+mlH3WSsmqfb6V3k8NG866Iv5ryg7Uc7nmQGf8
         lvdx31TqQlsQjVsTItmyNPOpvhdpE/eUaHCncBsv4W7VtLbctswLoSrOX0Qxgyo2iMVJ
         FrKVv4qZA6ruMbgH7triJXE8GbGpmR6l1dlSyrV3X1B6pUnRx2MywIQaGcML4cZj8ASB
         X0duOyUlubWo3p1hVqx/hYsqNBKOQ25txJZtF3Duo5D3YpTda8T2efVZzdTYHBdRNFwX
         JHlA8IfDTfy0JHtKYyX/VEEKbBD6r04P+Za5p0Ob+rGyaHUSKQJ5yIZ0qnprEYVx8Fos
         nl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaK4RmpMB5icfPIkczECFwAONUgiYKZrQHTwTjjCFZLgwh457INGgKs/SlEBf6DzugF/k21Vj6n/ur0rRJVHbH@lists.infradead.org
X-Gm-Message-State: AOJu0YxtdnFMtYcq9ggJF40weTRt2VO99t1CH9BTkqH4cmPghZULJs9u
	4TFRK0vskIQqIBFsLxXAPWFWj7Z5dYtKtzeHwkymzzQUPt2D1xPjo+8w54x/QYIrRVk9qGPxlI/
	42Ue6WAIzFqh/AZAkEswAFHaN6L8uU79cZPWkLYIs0IHO5bZSc6ok7uix1XEtw7xpdWWh+Zeji1
	GD7s/QWPIzc9N1zS8gXUbawmW8c5oXn5i0WZJV+FHt1akzNDUbPxxJeToN8xub2riVHeBE2Ke/t
	jioiiMTSy5zK5VTYqPJoaw0oIc=
X-Gm-Gg: ASbGncuNe+vikrk8HkvmNAAoBMAqejLG9XFWn9kq8bQySJeW+W7YHsbXhBvDDnP6R91
	yMq+S7TohoVluo3QsIKPl+DefGXACykaTq2jeaP/oet5I3c1OuG1W/DeAIJ0g2FSZsI2vR1SDvC
	wj5TFPc7w2Uc4vURamrs0OBoisAft8Y0gXXI2W1gdIYWYc7SEs61yi17dOyeEHzdzYQgtFEzjer
	9LswqH3Qh3nFXLyHwNQRL23xOvkecGvnCe1eTIYuaq0PimNMohcOehjDf4jlEBjB8EwiSTnsuz4
	Uz3AmO2l4JnSdzNTmkLTC8K/U0DVgCalOvznhkqeZVK1x6x3gnzuCnxEmvs9K0GfWC5gXvPsvNR
	4/WLAorhVKVtToMM+sTScM3GloVzOY6+JDohrIkaqPbb7ku2k5+Cmd38mez+wUlukAL4HwNKiYI
	raDaDS
X-Google-Smtp-Source: AGHT+IGnZOZoiOmqjFZjHevkC1jqKmJ2JyROoAz0A58l4lxlaDqrEzFicPGftK6QI8roASgPV873ZPySG77Y
X-Received: by 2002:a05:6602:1347:b0:887:6bcd:7471 with SMTP id ca18e2360f4ac-93b96a7b22fmr84049539f.11.1759439087952;
        Thu, 02 Oct 2025 14:04:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5ed26c32sm212725173.27.2025.10.02.14.04.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:04:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e377d8c80so6850485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759439086; x=1760043886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0VBquDv6g415iy1L7kGakH7H853FAzWxsvjxiCHfN8=;
        b=GH/W9IIIHFlfi1PExfnU7gX7ZNwW602M69r4Q19N0KtgLCDq2X//2WK3Su1MUULkil
         sy2UZWcqEbPPNM94EZY2omWoAeoIaWQ1c5TMjIUO4pcvgcB9RCChUiMEiPOIojSKq96s
         1XyWC9x2Ka/5tyDam9HF1OkR0FeRpo1TcL1r0=
X-Forwarded-Encrypted: i=1; AJvYcCXDWDRFB/VB3XKZE0BcgGDU7EGNKWnsy658PmHEq+miLPQ7w6Uq5FTolKUnS5rNNzU/4Mk2+Ix8ymFb2rJn/3Cv@lists.infradead.org
X-Received: by 2002:a05:600d:420d:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46e71172104mr4721645e9.36.1759439086299;
        Thu, 02 Oct 2025 14:04:46 -0700 (PDT)
X-Received: by 2002:a05:600d:420d:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46e71172104mr4721505e9.36.1759439085831;
        Thu, 02 Oct 2025 14:04:45 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4c0321sm61711295e9.8.2025.10.02.14.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:04:45 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 1/3] dt-bindings: mmc: Add support for BCM72116 and BCM74371 SD host controller
Date: Thu,  2 Oct 2025 17:04:24 -0400
Message-Id: <20251002210426.2490368-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_140449_131470_8B724193 
X-CRM114-Status: GOOD (  10.73  )
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

Updating compatibility to support BCM72116 and BCM74371 SD host controller
similar to other settop SoCs.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..720d0762078f 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -21,9 +21,11 @@ properties:
       - items:
           - enum:
               - brcm,bcm2712-sdhci
+              - brcm,bcm72116-sdhci
               - brcm,bcm74165b0-sdhci
               - brcm,bcm7445-sdhci
               - brcm,bcm7425-sdhci
+              - brcm,bcm74371-sdhci
           - const: brcm,sdhci-brcmstb
 
   reg:
-- 
2.34.1


