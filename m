Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BD2CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=; b=gQ0gLVI8jVzMEZ2kxgCHPiAUHb
	eY3rwqEA8FlvT2NX9kRNm48lHzTEKytoqj2DGAV6QBLiGSG6pZPdwwoRv0pl3Ey7rgRkpZA72S1+N
	j5Hb/vpZpuTwte0+1+JgF3TM34INrXM36fsYg3JNAhu9RTinQtlUr1plLmiGvktQuyP5ta6ROb7Ek
	D23XkDz85yqYjo70hG9EpoGzUPIAO0cxSe0MoN8VG577YycD7kv6NNWBFd/B9br108BEcBTxMpil6
	MCajP/Yb+cV+2FEdTIJbZFB4KgAFafoTSoA0TzXYYETGZBTUPAHIIbmWS2DlDdw19Q1w+NPNp+1kY
	7OwfR1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFL9-0000000ENGl-0srb;
	Sun, 04 Oct 2026 06:04:51 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFL5-0000000ENFD-0CUZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:04:48 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso454377a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093886; x=1791698686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=PmZmpoOwFDENb/PZ3XfCQF0dWoepararuqYWxZVVCm2mhRvYVKUACks9US3qBbVMZj
         wkftbI54WGcaiHyxoJ2nUXaRnPvVzFvYcBTkQPYqcbazuX0+zTuoJB5EeO0Cs66n9w5J
         Ak9A5WRFkwd6m3bo9lmZx+P38NPQ1LmPmn01zjWw3C+mP5eqXaST4TP5v0rfjqEmnSNk
         F3f71jGBXkT2A8SpcHrHQfblckVuBJoU5sXvrhc+nIFywBRSNwUFcY+B4FG6ftyQrS1K
         y/u1sWuwC7eDK3//XsSHhErvhv7ouw3+6cDKoBtT6Y8EitW4mUm+rHiBtULZKKbqaZ+s
         s18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093886; x=1791698686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=Cxd0aKk3EZ/qmzVYS/Qz2R3zTkWe7DRsAO/08u6LdrjX2MYVcP3jNwHV5te1xggzNY
         fKSDzfTVHLMo0CJng+bdUbStvtvWpLA9rIhPQqutGQrS76orTAVxKHWNSS0WQj2U2NW+
         MIWBMHizjMvDR8yjoqymJpBcyuqKTi1N8iU8U/+zVma/d04zpdN4RiluKCm5yzaWAxwc
         OwDkNZTkNsHnx1Zq3jkiOOSMBEieV9zM787at+PUWx5wEtaWVvUWODbV0WRNC+aCwuUF
         4vX0qEjNTa/vvQ4Tq8chkXK/FsBROMgz3lkSqJ/2tfllp/TUbEb4JX+WBtmBdaobuaJS
         F3Jw==
X-Forwarded-Encrypted: i=1; AKwUvBx1JTOqNxuOSCQu/p8PSUEErOQHqwit6GTk866cvxhBxBHws1IslR/koppnLZcu2YEU3lo25kUHlR1e7/z9PocA@lists.infradead.org
X-Gm-Message-State: AFq9FYLjT0w4pooXKSghBuGR5gsyV0ZFuwO2qr5DE2LyLc9i1pwHtBBV
	05G28IhhNTudBfZ6Iz/dWgGSqpgErRG/47AZ6GuQWNdvTasHwhTlnoIC
X-Gm-Gg: AYBFou1p83ZtsTOWxqYCVjL5qO13p2sql/sJOCukKTYpnj0nm+c2YVAhmMk43Zkz5I+
	EIYRCsnfUcrUPpvvJwMUBh+1G8mjmAqVkPblt+q4618FbHagv9lGyyI3oj0C4JUt7pGa7P5STsK
	H82/4fprLvsC5yowq4ng0J0oYJtbPhMmIOfA+v8WGSt8P5xZcP0L/JFjSeh55lF2BSlSqVe6OH9
	RKq2+/NQCWaHitDkWJpeZ1wA8rd8rR3/2LPh1xy1aBxXllsBQF2ssC6lf5qbVXEFywQaon1n99c
	DsZ7K7F38XffpW0QrlOlPgyGI7l4FTrgacCFHEQbZdwZmOZzTLuSbo3Q+V/k/5ToWgXFi5ZxNHq
	SdGgW5bD4aEgJbHpmxsd+ki46oRmf4G+pJ6WrJaIhlL8MeLpC8d7fDtEf0W/y6z/k0kMJUgrZvA
	klhS0hN1PeTng4Q/kCPerNRkLBVJWdbKDL9qWmf9iR9KSTxnoqiqZMWtM1awJuPi0aZGDMTAZXx
	hFed/k3VvoOR0kAEKsCLzWFWra8N35W1+bGOv/jb88zn1TnFiirl8LHKEyzDmNb87KXaUaycd64
	9yxYuhpFYZ+RWY7R0BKIvZMvXHLkSSngHNUAP/0xDVUdIu8=
X-Received: by 2002:a17:90b:498e:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a79ad96bd7mr2514011a91.13.1791093886117;
        Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:28 +1000
Subject: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+REFZSpCqk53p5UcbNR45vnz18yDNnn95vKJH3b8
 6FvqWZ8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo39TL8D5gvGJ4vrVDcqH1N+NnXtIakiRrfQq/kFam4x/B4nZFhY/jvaNzDcCL
 TPdXm/5kfd+NnsHyZa7zjxaz193ly69zsXeSZAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230447_097247_BF34B8C1 
X-CRM114-Status: GOOD (  10.37  )
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

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..2637aa5f4326 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -32,6 +32,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
 required:
   - compatible
   - reg

-- 
2.55.0


