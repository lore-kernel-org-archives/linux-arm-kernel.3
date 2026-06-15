Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F5DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l1g6CPnWeS0nbdTC0p6FeyNadxSnUc62NucgUQYfYI=; b=VImSahs5k4wUUYzPFUs6M79cqg
	sENqsyH7fc65kuzxJW7E64xCaKxsxzVxhwgJqLQ1yjOKubPsuTNDlLre7CBJ+ifbWj0nH9JJCtisD
	3pODDY3O0eOUlapnSXHJLk5h+EQurWcBrvoC1LJyAlQ5CV2qoAlqxe/Wyp05rtWQKmd6V4CMDV9eE
	O1UlNXwxfr2NBwwK4xfqHUJ2+QSajDcAxmG5zKBvaK6IZn9PsQfdefBlee2qnlWC2jBvAQ71Yz9kc
	RJuoaH/4JDCIqWdshQcfxRNcuQSLXZKO0/7vEa9nAZL7zIWwtZB+eTGHqyqD8f0m1dF6qfVjBgavR
	yLR+W9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1b6-0000000DlGb-3lRb;
	Mon, 15 Jun 2026 07:19:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1b3-0000000DlF1-42Mw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:19:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19940315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507940; x=1782112740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l1g6CPnWeS0nbdTC0p6FeyNadxSnUc62NucgUQYfYI=;
        b=ojcy5NvxlyFoRgk4/FtHGplZA2PwkPwAsga/2Ih9+MhIwuQ1OM3zsdYuV4ruuGwtAa
         j01ilb+f2JtyqVQ9Y7fRlths61yrg9lUT6uHGeTNM5Ny0SFpXnQB5OeTeorddjqXpwRr
         NtLf8Ax8LGnjSiADZYSSCo/83+0/HjFiA4dMoT8LothhEIa0ryQe4MTPOC6r/2grS3FE
         OCV01JjpzdJi8WiVy154miaiub5GLe/VAULYJawj+YUwf2H/Rqw4P5g74oPdIazhRXwy
         +1l/UI3ciiSX9vGWC1PNMnbAb3T1iOaRAi/DpXleCx+MS7EK6rtptuSE3iwVJW3aS2b/
         XdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507940; x=1782112740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l1g6CPnWeS0nbdTC0p6FeyNadxSnUc62NucgUQYfYI=;
        b=nxqQSQrBH1R1d01ZC10zBGklRnvrsrJDPLRKB9ODIV8WXkTRjRiUMLMP4Yx34lR6OD
         E4i1FJpOSbc+tarQecCw3808wbt+DXM5Qa3EF0eLf90dycKOOsup1R8s9ijmHe0+labB
         /Q1Di0j2ygBKkxDMer3k2ISpfhVB/UG2i8wSqv5Ssy2lRmGzjJp+FGHdEgcsYoVAhWIB
         4DLZDOmWw3ALWrqSrRjnnJyTJg48CgoIZggIS8ljLijRnlattR3V8okvav/+fQ/UNKoj
         b0O+SHMIqfY7ltlqoISt32Cps8ECDqOMlaaT947KbHEi363S3oQRwrrX+dypRrdNvsyR
         fDOw==
X-Forwarded-Encrypted: i=1; AFNElJ8rGNk/TRQK/7l8kfCMOm2Da0pzbZ9la6hN/TVUar2FZh7KN6Aazk+C7kx6YyiAJdfvsHXx39MK2LXmdOtOOjqI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8y+DwezNQTUnFkQy2gZh1mG3AVudTn3xmapC+KGrMyG+KRDzl
	rKyOGLwlndNY2GBgKRA4K+sUCDxyhgGcUNDVs/W1HnDM9EeY9F24ShfB
X-Gm-Gg: Acq92OENsamtJvdk5hoSZSPtJr2z4UFKwgJ+sP+vbh5i5G+NZXuLdorhIKvFTLwTiQK
	9u1Bb6ef58BB0ghq0I8XIFwPmw3bG0QA4lQNwAhzcMBR0M8V5qZmTYMHp2DPMWeUI9fEwdI1ojf
	bicP28lg44Oh0IHcNYk8dzaENsWlRCqxS1ZdpGRb+m266dIlMwykPdp/s65opfojwvZONzS8Xvn
	pWYt6o38pu8Pcti5M82379W4PJBVULqHktJbsu5jibOc/KgTiU/n5IizFcVw1CeKmGZlXC5Ibcw
	wJYveB71woNVCW2AwL/lvCCHi7G+BP/Fgh6Kn0J7d0kA//ccNbquLNowcEWYEC+eRyqahVXWkBl
	eXlOQvytiduRy9r0WlIldrKbxbaJffdG3X6nssDRr2FtZCvpgApKOGcshyX2chEe/hG1Z1GgU/3
	nAObmo+B6H82CWG0Zj
X-Received: by 2002:a05:600c:5286:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4922017bc4bmr108656645e9.37.1781507940110;
        Mon, 15 Jun 2026 00:19:00 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:18:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:07 +0200
Message-ID: <20260615071836.362883-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001902_016550_28B18B55 
X-CRM114-Status: GOOD (  10.35  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..8b14956af4fc 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


