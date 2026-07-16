Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F11C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=; b=2gFxbmWRNxBvpV/JuT4TE2Dynm
	dkDAKNHm5T2tZ+UEUjVfvoPE9G3n/SpEP8vlBOQJyZIhfO411c7HIyMyqkdL3f4R6SUwtgvNWUWLi
	EoUJsZ1OkGXZSgMHqVhEdU7WZJ90HuCXucRY7cvwo91d7hUmrSGPpgCd1Fn8LJ3BCzWrk6ZDHFUS7
	ACvTfrnSHe+4GeDickDUIwtgQn5Z+0KIuYdWQf2u+CUBu0egDe+5Tl8sbaHI3m2g8HJ5IHQpL4x2m
	GCWeC2nwJ457q1E8WhxGcmKHp76OxlJV3czfvLVXYSRXBVRX33UoELRc6qwBEo9cv7RddxsKckWw9
	N/4t8lMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPil-00000000FyI-3cPY;
	Thu, 16 Jul 2026 17:18:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPif-00000000Fs5-47LS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:18:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cee9b74ee1so34695375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222277; x=1784827077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=BdSvtZ5qYwHZOeaD8m4fU8XSvPi5ihCZNC0gY5e9O8eubHQWEstXYgbB+zJ29laydS
         Fwgu3CIJZRFHrNnJSf7KsbQm5AAQG+EQdvLwTZSLnFpOOQgqKvLtYz6Y5CGQlNoovNjs
         pxkOG5HnpnlfnUVtRcXPcYiJAXtx+iXQDaaa0xtvtSe6ctni24CpHhExfWErR0DEVY/Q
         sCgD3xcLSmPdc3DGxUlKiRgc+vsdT3MbYnaBw3AUueD5GmCWP2xvZPvwbewIJgn11IlJ
         JzSXS+NGP4nAKGFa0HqbcaOS45nj7Y1rwsAq64NO3sAPZX7uIykl6O1ny7Ix0UE6KADh
         rtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222277; x=1784827077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=rX7vtC2mRnAwt1bkyizOcWDmExBPSimBX+pKGhUqOnt5cdhqtx/C5xXcNUfrTyXJBi
         F5QeGFv+438pD3OA9aI7XzWbqU0Zsg+h2tB9pK3afxNAdQARH4HDrgCbuqQ6zJjAKwnd
         VWKHG/BP2cJeVwLE3CUt/HRfjjh/zdABqZzI8RAloetpsi0mYYzQ7K4cg/id5D6IwDdK
         S6hXSxHzxidmyE1fFusEWf9QC/j1pq6kPvut7l332rggJSS7PPcAtgkpu85S0U8+B0eY
         vyDTO/v/P7aHKxdtUCSXB/9VAn0GxR4w0RPr2AhzJ0oS6aFGj+tZCGUr74lzJ3tkczt2
         o5KA==
X-Forwarded-Encrypted: i=1; AHgh+RrLVToSqASqZzC1oUGqtDs4voTf3koL6edXzoO4O1FRuji0VDoLmAP2517KL0y0XWoCqhHP8V84OUhXwrKh0f4T@lists.infradead.org
X-Gm-Message-State: AOJu0YwbSecYCFwmhVmNrkRszgTrsFWxb9Z3xClbmUfus30UgkQJMgn2
	4CS/tYh29ShOtldyKucBPnaPn0TtuC4uQLTXTmwbueYQOt4QSZ+fzfH1
X-Gm-Gg: AfdE7cnkPdX1JNOnecrIcyEVEmhBcciKMql0LxNdu8HHtYWRnLqRTCps9knIOU7pQcS
	sNkNQJr9+inxo0ECul1kaV45T0KS3WKSE0QO2O+W1NKoXewZN4Ro7lOnquzmbxCGAEHUSquakWf
	YzCc/6rfoaLv8wNKfwiFbfOwmBCOxTIaLBLJv0qw1Ho8IVbvghdLJf3MwIqYI2rH5EOuu7V0U/G
	13RGVGWM55B3by0lMOmVvHzkFmpUzJ6cRiRHivTVpX/KAer/bwYv02JIERUxmf1ECTmGYA98MSr
	1Dcrrzj1CBidcUcQL89sYuQXrGxhc1uIrBAzQF63V/Na/lijAbspAoT5kwgs0j1Lf8AM+hbdl7I
	XK7Pqra4Q4mtzxR5Z8QhD0EZjd5okS/pRQqjIkGDJE52rCzL98Hn8laPgmMzUFudVovgNzn5O7i
	G0lxuCNeumNQPxiaydbejzxkgofJNF5vJW+A==
X-Received: by 2002:a17:902:da81:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2cf03c7c756mr75109205ad.1.1784222276928;
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
Date: Fri, 17 Jul 2026 02:17:32 +0900
Message-ID: <20260716171733.300885-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101758_025869_34499D64 
X-CRM114-Status: UNSURE (   9.04  )
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

Add compatible string for the MT6320 PMIC.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..f2823338cccd 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -34,6 +34,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6320
           - mediatek,mt6323
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
           - mediatek,mt6328
-- 
2.54.0


