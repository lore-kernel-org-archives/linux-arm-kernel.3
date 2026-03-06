Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945C1F0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1Te5dWKyFtHCAsQSaH2ONpVBfHilH2WjO8uBzqlY+c=; b=1n1DRWF4iGaKoNa1wKeRlVFjL1
	z6RgXBe8LqQyb/RDX9RSpAwt3VGz8bQB7Vcb2c+lqI7Jb+eyHNTKmYm/ecPNICRGGUpp2vWfI2IsV
	4OneAYyWUZkRRYSfhwlXEgWaok0yxAdsMoIf1ZdmKA48UTWaqQQOhp11nRa3mCAe3HKUPZKc5AtAp
	7qerX1sovyYThrPbQtix1svM6y2jkuZp3HWUHFSrONI7EaqbsCgKxMlh+eSfes8h6l/2Hfq5AQroi
	6lwZVZCVKftGhEFwypiLY4t50TMb8nhfqkm3nCcb1k1p8umdMoCI0fiiorq87pmstx4hLAvIxnX1z
	7Z/13rJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwW-00000003bJ4-1gE6;
	Fri, 06 Mar 2026 12:06:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwS-00000003bHm-0012
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:06:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48371bb515eso136020325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798762; x=1773403562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1Te5dWKyFtHCAsQSaH2ONpVBfHilH2WjO8uBzqlY+c=;
        b=SkUKeGK9qF+rfw5CNgOTmGJMpume4C3UcxG8EGuMQmhzpjmtm0dS6WNvsJ5QrPCV2j
         PsJRL5qp+VfJSkjHE+nLjRDbDujE9nksV+pcg1rP6xp2pIVGXUomcZqm2xTtBooJJLZz
         mp+iol8qmq1bXXraj8aUUsWYjgnqb6vM8iJMJVFmWLkSH/czmLyWTIvIVJvC8pqpx3Nm
         Bcw2bONZAkrCOEwPoIK/HvUFIdWGyQzVfTapezbU7MFCKibY7V8crilzZXYwveCZodQi
         +YEoMZvGmEsvKuXCg7dj4Mqhl36eB1V0mPl7yRXGOE/Qo0adjJFKS4FgQCxeU4a8AgqI
         LepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798762; x=1773403562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1Te5dWKyFtHCAsQSaH2ONpVBfHilH2WjO8uBzqlY+c=;
        b=N9PtaodW3OuGFSo0Rl3MdTVqguvOPY6z/Om/L5dW5w6D30aCyfmN7x9BdSYVZ2Xlbp
         LuHvuxnaPMQZsKCbhKWZuzJ8XHVrDcetB19UjREiOzsCZWSg5RbIgdh7QQYOznDSQ1aa
         YZRkBAH3yxmzqyhOCEp/542tRZwx2TxXkLEqacPisflRqS7GPIKQ3h60TRr08Bq6YTHf
         30E8vxryTwFCzEY6W529Jn5OZ3Ztwy6yug0Z2yKl2g3CV+fP2fcQf5SWS26O4+0gjz2J
         Pq5RPz/15V6d20weONC1yZ0oLBzKo4qCCBJZMkNt+wHsGb9YUut27lrVmZWqtpZSvuKV
         OHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaqS+p5dBcUgKkuK0VXgcZIzxKfKKLf+omdfVRSL+CkSR8HFt1vmJGKt615507VSqH2dfcdAqLbKU+GKvIRQMW@lists.infradead.org
X-Gm-Message-State: AOJu0YyNBpiFJ+lI06O3RzTl8a7PqLAG4Ehf/sof7RAZxFCDxCSfzfIk
	BewKgr9BeMSu+ERgxqT8glaz+WMJ1pk1Vy7TYkWbMckNS09C26Mogob2
X-Gm-Gg: ATEYQzzLX7SMZcIO6aNsDiHcGt4gi61DTMfejY4krjbSMarZ02RiaIvJ0kVdSvtn17f
	vqeze++ZwwuvcxFplXR0cWax52LTcJ7H67H9S6sEMHiwdOucxuDm9wIEzdQa8J2652kJckXa1hR
	hTRc84xbiV3ZXqO3j44maUJSbxvYvo8wefTz8s2s1EObtxhZHBG/rStPIOwWhXzaFB/LgodzFzO
	/N4jUc6XvY80sZTXVZg1tnVODY9R5pgzEj4ciK6GSx8GFTVK2F4EBWZcBMsagslCvE71lCbmH3v
	lrmIWzyD4A24b3bszUcPjWkIE/TfGqlX4SaVgF4R9C2vCCd8mPrqvqDjBovlg2DIvC3YZoM6tw/
	JUbW2CLiQXdJeexJ1jsXEsXHSPFv6TTr7VgqDc1FGbQAk1F8xyfMa+54v0xXDeJ2D0O0xUNyUNA
	hthVVeHftEiiGkYID9upU=
X-Received: by 2002:a05:600c:6386:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-48526918f7fmr31691795e9.1.1772798761805;
        Fri, 06 Mar 2026 04:06:01 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:01 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/7] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Fri,  6 Mar 2026 12:03:05 +0000
Message-ID: <20260306120521.163654-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040604_061337_FCD15E43 
X-CRM114-Status: GOOD (  10.08  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..c358b2f8059c 100644
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
               - enum:
                   - mediatek,mt6366-rtc
               - const: mediatek,mt6358-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6397-rtc
 
       start-year: true
 
-- 
2.43.0


