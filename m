Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D161E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=; b=s1XMqd76Nkxvj2YW1eWH1GEd4I
	kIQjagZKFs5iVS/lAvdR3SetPErecTh2+p7O7coOXyPRLbjh9j5M1j6XpVegcKKqnMfwor2xwyWPs
	CG/nffLXkvS4zhtQDa9jZKkSpHEpkSEn2gURuivtL41JVg+0cYCwiAgJBceETJVkp60K4uat4BHmQ
	Pa173xzOdcU8ji2bFrzn5ha35VqqQVNeKjMvY4bquNpzFOZ+qWZNi+grfR1MwDOUSOZRTL50L6O/O
	bGmEJNIaQIv4+C2uPFJT25DpR+WQpa4A9uQHrZBdNpsGwIuiaXj6WiMH6x2NE2JIMIESeXFa+bpIt
	mnGzP6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0c4-0000000BX16-1WCu;
	Tue, 24 Dec 2024 08:50:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0as-0000000BWpR-2ENG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 08:48:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21670dce0a7so63925275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735030125; x=1735634925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=;
        b=Ems/pD9e1c2A6b720g4B8rB+DCai8xapj29Nw378PiDvTW3dtjaDENlhh5MJuqKLTs
         OzpSzrl43q2I1zPPTAwvd/EGjrAjvfbJoi+XpsCiI3ZpBloOXohZQiKUAs/bEvLF8uje
         KjD2Q1u59RqbYvuRArCW/CNRmG/YAF3m5A5v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030125; x=1735634925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=;
        b=IzqEHnNeKN8/8JRTUXh5mdR+kuD1VzviYCKgYS8wCqcJcfFNFhKNmdx6yF4V2trww4
         31a3K/PB9HfGSPJMqXwqNH+AyfCmotqeJuK2GZQQdA5D61+eqdPoKEr+RW4iZ1ePMsSJ
         qbf/Ah7tjm5Gubox48EpjKqWczgVlSy6VSs5hyz0rWWVqG08932LefnKOqOxoZ/Lavz0
         W58ahrHbxdkQ83+rToMKk0vXDnOdk9RmZuG2Q20FBog2+I7flCJKMueP2iU1T/pSu4eV
         86FquN3ABFBdBfHlZ3j01+nVIlJzFF9KXJ8O1JH4zieXxb+IqnabN0rT+E/5Cn2n1P/y
         WgGw==
X-Forwarded-Encrypted: i=1; AJvYcCW6V6kg5zDEcP9eN/HH1Xyeqg+BykLf8Zm+INQhbLC0TIWMuVFZWh21gGewcKYkjkWd/YRJaqbqgWvAlc0ELcni@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7pTJMBGEugCe0LV7DyB7OB/jVzFNqVyikUuPT1iwu++NJ1oUW
	KJ3NpgrNGMnsOAPWicRMgTEU/PZTxAbbVzh6kCPzEbNOH1UhICuBypTF8rUkJg==
X-Gm-Gg: ASbGncuDvv55sWAc5VtCaZ+u1X1Lkay+3mi4xrqFfkeIc1QrIlxBkSJ+yQbl9lmCJ6/
	TEbChldqMFvXhaXSSBG78s4hCP1H+yw0DMcbDyW0P1qUihB9ueI3zrPw4BopM9VgbaizHYutQxm
	NDOjpGSstXe33xR/6EaMpXVrKkMk3ilfLoqH1bGiu1UZKAFIS0KNIjDx6k5CqmMKaBUJbAqkoES
	DbQKhQDHcMRiDFQzFnsacGaSS7I+/XhBfGge412AItKAxm7KrqLLfgxIq5uT4BSMRSTRijD5Uw=
X-Google-Smtp-Source: AGHT+IF6Wy9RxfKZv9MvppV9tdwcrpmy7JICFA5L0xxCj2pW2nZrKIeaOlDyLP7l6hYjccjkEykagA==
X-Received: by 2002:a05:6a20:8427:b0:1e0:ca95:3cb2 with SMTP id adf61e73a8af0-1e5e0458eb9mr28926443637.8.1735030125707;
        Tue, 24 Dec 2024 00:48:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a4dc:753e:e6ca:9a68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbaa6sm9203156b3a.91.2024.12.24.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:48:45 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped
Date: Tue, 24 Dec 2024 16:48:37 +0800
Message-ID: <20241224084839.2904335-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_004846_600790_DF19F4A9 
X-CRM114-Status: UNSURE (   8.16  )
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

The Hayato rev5 sku2 and Spherion rev4 variants were designed in
anticipation of shortages of the headphone codec. This never happened.
As far as our records show: the variants were never produced or
shipped, and no such devices were deployed to any lab.

Drop them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- none

 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index da6af39caa9b..3ce34d68c213 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -370,12 +370,6 @@ properties:
           - const: google,hayato-rev1
           - const: google,hayato
           - const: mediatek,mt8192
-      - description: Google Hayato rev5
-        items:
-          - const: google,hayato-rev5-sku2
-          - const: google,hayato-sku2
-          - const: google,hayato
-          - const: mediatek,mt8192
       - description: Google Spherion (Acer Chromebook 514)
         items:
           - const: google,spherion-rev3
@@ -384,11 +378,6 @@ properties:
           - const: google,spherion-rev0
           - const: google,spherion
           - const: mediatek,mt8192
-      - description: Google Spherion rev4 (Acer Chromebook 514)
-        items:
-          - const: google,spherion-rev4
-          - const: google,spherion
-          - const: mediatek,mt8192
       - items:
           - enum:
               - mediatek,mt8192-evb
-- 
2.47.1.613.gc27f4b7a9f-goog


