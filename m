Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F74E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=; b=y68smc7lYUEDbmJ6U03Ak8r/Ts
	R0vgVshAwjpJgZ/s0oYgw9tmNYGebDJ6SFdnzN+YWBYR7DuHsdaVzdoqZc/NDGgkdgqChZzgRv1my
	WJjZWWW7WIdaRVlrMnXWOpYEMjkJ5UovdH+9vuyORWG4FippoTkBGA9mL/FQO3aD+Qhsy7vG+BDVU
	60Gk4MUeDRZrzaOww6uf5ZLvxWWWkK/D5bBpArDHNeb+OSP2L+ZujdBVXb9hIM8Q/MfVq5as32xse
	cGFm/Rb6zlAQrsPbEUscVPAqBpCXaT+WJZKAx/D+Nss7kDqOFU3W1jIousPhVdHpC9Zd9Vr9DANZ/
	snrP4wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWG8m-0000000FelW-1Tng;
	Fri, 10 Jan 2025 14:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6l-0000000FTtX-0xWl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=; b=I/4sjvpVPDwyodkb8YSm30XUJP
	dceRCuF0Tk3Kz/PU+NihSCqOm1djgs5rLk4UMRMkLixUvqX0EKLzP1c9o2rq/g7oBtZ8zc7I/54ue
	aLEku0E2VxF+HBjMDWXefQU/HnQtTXZW7Z6MOUOMLUbdF6rcF79MTkA/U0U5OeVntfSb+szu8dHNT
	9l5QuAELgYaaC7RtTXieaGxIEySlVV/ZQkOtBzrXl6bG7y2j8Yu8uW7STpti0pyZ7YIsG84oAb9bE
	k2zsknRKADAQd4lI7xHA4KNbc4b5x55/+haWfGouOppEYpM7IEkN2QiXpFMNArlf0wp/e17Fw7iHo
	CAetlmow==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6i-00000009m89-0zYN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2072028f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515882; x=1737120682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
        b=10FWtEs5w0+dbDcPirCOACREdCfUiO9CzMpxWVbx0H8J5yzG5ntxti4KYf7kjF636Z
         9AsP3ofjj0Yw59pSHxcf6AQe+QRbHsuibSGzAkYr8K2sqXgiCEIqUHn+Sd9VuNCi0CST
         pWRRexRaK4Jp+0suSmxvvZmORaPRDhXwGekQczHMY8ckhpR35GvfXA197Jgb5Q2XkdlW
         b+0+f1Js/k9o2uhdHid2pTEJwSta/bp4r3YcgdWP25sPFXBK/qPOB5cXO9IYd0fAq+fz
         nK2XCCU+aNc0NL+7rkthHA7qZyMg1KJfIpLAgCon5YPMunDqJuFCclYSFxc86mIZqZgB
         RXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515882; x=1737120682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
        b=sqMSBgr5LQ/Y9BvQkuEGhwrmRP+JdViIdfnVJ2Dg45cPSBBFVBedJcE1FnbCjb3IPG
         5V9YqDL0xNKi/IzIBX+MCjmCMlfcfP2ozkszapHQW7pvJeE/uoOzNsYQy1CFQgi48I4x
         v3jZBKCK5/OaWDrFtqkjyeVAysbn33ZOq5gqWxkDICVpbo0Oh8VLZ0s0Ch7qLb7dIcBb
         At55jMA7FBH4dlyLKZC77taFZfveATdnA+6/PYH7YXfeoMk/hvxtAvO2WT6U7ZtmXWQt
         hbkIRvHWXkwxLut7NCbi5BL7z8DsAjiLUh56m71oM157gOYcFi8ykqNhdpYKAvbNK/pW
         ohMg==
X-Forwarded-Encrypted: i=1; AJvYcCUERT3mrMOHmFM1Irz2XgU25QwogQVfekPxyXX/szSQ0Y69+6y52mRN4xHUfcAGyCbV9jU6NXVgL10/GEz7BLCs@lists.infradead.org
X-Gm-Message-State: AOJu0YxZtR5bsac+iunLIK5Rq3lRMLDtw3O+wtXyP3TnN2hfu3Nfma2Y
	k/bYhd8OeO38lrL9EJ/JGXn5t2GT6Z+F5KIxVpWiGk2biSpwILl/kbtNMpepKX4=
X-Gm-Gg: ASbGnctALaqJew21QYxHIsIs5PI4AQjqt0pSjruKlfFDRb+0V4zLn14u6sRF4SrHov0
	omkVf9K4/NR3GnATo+CbinPkxzvpVdgfX7tR7KG8WWqgqQpGQxgNY8S/VdI/mhm94CgTCnDjLyW
	O7/crRJL6sZ8NoZrZsbbfG7YUgd9XjuysO1/sO6X9abp2eo1oVAG2ndiUfCyVF8Q8okyVAmzp6a
	B1DugBT+ZRPvQ8aVb3+zma3Sspm/ESE1YNyGwb/iqolw10cSpcKgzlKTFuw
X-Google-Smtp-Source: AGHT+IEeT/k14BcIEcdwF/8jsOntipWrqikOfy+83Y1jOalU/MN+akEWeVXNGmRe7c17qKDi731Pvg==
X-Received: by 2002:a05:6000:410a:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-38a8b0c71cbmr6605006f8f.2.1736515882478;
        Fri, 10 Jan 2025 05:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:21 -0800 (PST)
From: amergnat@baylibre.com
Date: Fri, 10 Jan 2025 14:31:11 +0100
Subject: [PATCH v7 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=1JKrAs8ef9/G6ny5cfhuHd3DFIbQFHxMMv9wBH5/HqA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEneE6zOf8vEEwrluvT4BlZNUmmzfnh8+dgMnkc
 OKzALE+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURYjpEA
 DGf6hGHBkuj/S8FHNwSNHu+zjuNgTJivuTPoZm6K2uGhF9lAzwXa43mbbEEJya8ShfFWrU/m3v9KHP
 1Dzgk9DJTlOO1lvgkRv+N6DK8ptMx1C6Aef4kKpP6+dBg5x3dP5J4zL//RyEIZODOEq8GpIRXZMHxn
 HcNdOkYOM65h8eFd/qcfkRbgOH8zSSUUhdoaqPedu3H0TreyDnOD7i8q7k4SIOYYnnXsjxSiPqh3RE
 FPmcXUYg2ui411JC5xLGwyK/ui6RIx0/KpfKiH/ZJeT1SvepMvt4bme6wiqZDJjLKFYqkH6SRX5QDP
 FkMuLf2eqqkjko8WqYCdK2peo26/J/hwDlpMuokN9uJbQ3WR2zIxYjHy5xiexOtkqAjtxeXdJLlJUB
 FAhBmKw6sLzd/9K/D4r1sCSi4FcGfN7VSvIaL51H44UPdMl0etiRaMmMr+8upGdIF/KW1F+d+CAEbi
 eLKoW0d2PUIV2IeBfqXMEnZA+6J1jLZBLdsNdMvUmSoOhyB7utbOF9r7axjT8szg47IsXC6vB+4n8B
 md1my3Uh1z/civLxqDjHZblMSbEhyNglYKeXBleWsc2Dxqs2/dMiWkAslxuxoFbOxq3xPY2yICClKB
 32h3cbGNzGnVEne9TVLq23Z5N0xPqsYSqBDfnDJv+PV0Ihw8CS0a2PEsuYIg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133124_519152_3729C6CE 
X-CRM114-Status: GOOD (  10.55  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding example.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..d5ee52ea479b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -116,11 +116,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


