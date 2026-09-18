Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D85C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=; b=fkL4RetYMwhdrCncn6YldVM4pe
	X1JQNnOHzSjPYh722XuSlRhsACbx1H4ZqD99waguKBHR7jwVTb+3vodOXOc6kdVcR+McrX6qkKEWP
	tfHqNovZQ+z61F3q4e3JeChlJfvs13nl9/CM2xVio/pKk3tr5yKtTRqvs0f3QZE42opn9+ltFQRaG
	uou4EyanUHSPZNRe9FCbUIGehYILnDwltmnAEnYU5XPn6Gils222mOKkW0h23bTu7oTq+Q8/aaJae
	OrzP1ETiTVLf+nkxB1D0nqbc066ncaFyqtTejsDyxA4HF91p9nQc0rvi44bP5gPPx+ECHygPvkjUp
	dX0ji/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfj-0000000DTyj-2K5R;
	Fri, 18 Sep 2026 04:58:03 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfh-0000000DTxV-1OK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:58:02 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-47bbb846425so192852fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707480; x=1790312280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=RqYQSizCbg0FrOwbUUycktGFy0ZDNgddn1JIPOrpZz9HarWprEDxJZQl7iRYOob8Qx
         A5xbOuQvqTHTZR2331OJCS12uwU8PccMGt1Sg1wVXtMvgrJwLNb5w3MZQjhkkOvn5NCX
         pPqiuVINVdeabcJPaCr6rJ1nEixPQy7nx1SD/pN572C6yaE3632IpLxVRT7DIBhAuMsM
         +uXaYONUh+bfI4RwPdTquDVCa6fLsmle0E2ubWuL9y7Ei/Fit/2hXBKXV9Ae+Ph5Cl3S
         tm/nJfDA8b+sn0f1x0aIuUcdhybj0n714Kz127ykQNgMd3gH+ip29dRe2KgecJrSLZ2v
         Asww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707480; x=1790312280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=l7rvDSJg0p/d19SoeOQnSbwk95C43q9X43NTAqznOfm6WKptBvribD/BmOiGcUCdN7
         Td06rakSHXBx9eMjT0beOiHC6FeaCM6fdEAUQVDiOD4nmTEq1zOFelrE/8e4mA5061wP
         rTTySZzW3fWO67evkJ+xaRQQaUm8GgYfLgKmWugnkVWKhUWW+FdZJDbtKyX5XgbRK4+V
         ob1wNDVWcRp1vUaUdZCeZT06EUPLgpVHJEeB2IRxLRRLs9FlICounuP4Jw4lpE432Wux
         ZRTl4nuw1ttmWIm+RWb9VkQGTruGZorEDl2kYzL2AwWNPZuOPqdKxWUg+vWD/quzR4SY
         54UA==
X-Forwarded-Encrypted: i=1; AKwUvByPFzmsyWv1CrSaJSYhcACiQrtNzvCwNI4abyaEo8eUjOKlWE+RBPXi+II5vA/v/ZE/FVNmdWXzJoZTxzxgMAaj@lists.infradead.org
X-Gm-Message-State: AFuF++mODYytKQEV505HcmYSycmwwzIBfieOd0Kx0oKOKu3mVXAfEWik
	WsDd78QJX9sMoi7X17tZb7og7EIru/eGLaVHtHoFAcfL69qJgwZyidwl
X-Gm-Gg: AYBFou0fnsVjUuQYpDfYits9cv1p3Up3T29ufrWuzjOuzzqXohftjrVuws08lnO4A/1
	F8nQbLHwsku0e8S8VjMu/dRitt9EcFCrwqvesZjzFfk1fXxOY59DjTPuCPBeo2sl/UTfumm6iZn
	Pm+KOFcaoEDhlcvOwb+xLj7xoje3wBMCrZH0OeGvyvjhPvGlnkgm6u+WSL8GQsbMWN80sxu2iRe
	sR0Jrnjg/eQFERQ2Uw7+CB4qezs7W51cq8BL5QC3MSBZTj3iQzQrmUtICD38qo0bij34Mfn35jh
	Za3+w9y5xaprq5g50mM1A+msZHy4dxZ5Bm4Djvt/q70xFJHNzlc67Asd2RNnB4QOJysgOtonajZ
	iM8NpzLZfuudGd1i61qpViaLnv+WkVAiUcDVrSkW+0OqnsVKc0saXVfzBqU6A1ptow9AXYXg/Sw
	J6CNEFGPo/XwvvxLyriVZjYYXxxUwfrsJNOhoQ4thAycANRL+xDVoC+Uz2HEeQ7PyOsfQq9tWJj
	9gN
X-Received: by 2002:a05:6870:2419:b0:483:b498:9db0 with SMTP id 586e51a60fabf-486e5447154mr1433078fac.14.1789707480336;
        Thu, 17 Sep 2026 21:58:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 23:57:46 -0500
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 nvmem layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=1572;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=QApoySis0Adh6uF/PzHVfhA1jkpjYHZNgPhek+gBJ7E=;
 b=mjeSErd6IUo2Z5QDXzSoT7MEYbyj3Na50gNAofJEh5wz/azQT61QJzOrgH1djAKYxTLLJUkYV
 wo88yBIlUloAzlG19N2bRJfn1YRBdEMkcgp1nZ1QQEMSYEmHHj+zw0v
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215801_388291_2AF0E130 
X-CRM114-Status: GOOD (  11.35  )
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

Four of the MT6397 RTC's alarm registers use only their low bits; the
high byte of each is storage the clock and the alarm don't touch.
MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
assigns the first to a fuel gauge, which is what a battery driver reads
at boot so that the reported capacity does not jump across a reboot.

They sit in the RTC's always-on domain, so the driver can offer them as
a battery-backed nvmem provider. Allow a board to lay cells out over
them.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..5c89c589b53c 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -81,6 +81,15 @@ properties:
 
       start-year: true
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+        description:
+          The RTC carries four bytes of storage that neither the clock nor the
+          alarm uses, in the high half of four of the alarm registers, and
+          offers them as a battery-backed nvmem provider. MediaTek's
+          documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and gives
+          the first to a fuel gauge.
+
     required:
       - compatible
 

-- 
2.55.0


