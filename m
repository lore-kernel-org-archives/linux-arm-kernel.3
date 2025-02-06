Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1545EC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzeO14o/pXr8ezTGYZalXSXV/Bh7c/D19pERNYYPjQ8=; b=XO0hjybrmkMU8wOUO23ZEUq2Se
	YRuyZYqUvWNtVnqmTE99K/+RoxjIvIcOjwN7f+vuQ2v0+GRLbc9FyVmjHu1LKDRsB0Aw4fWpzydTm
	BSBdiR+yfz8XFjhG0/iSxOgZJfo7FIXQ+uRzQMjWYltSjJmi+r3g1xp3dUpfMTX/LQLMq6e5ye19L
	hIluBnhHFzTzxaCP4D4QtaLyFtAVMCHhVyLrI22xO6Xw9JfZeGkccrPfzdjQtQLBB6cRRqZzQYMEr
	DOFA81SOco2PFe4tEaoQGUPOcxV9rxl2FQDMVwjCIXi9xs8ocbvDFvHlQqmIEUcaEKFrW6WOlxWcb
	f1myg+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nh-00000006En3-1Lel;
	Thu, 06 Feb 2025 12:16:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0ef-00000006ECd-2CO9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:06:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso184430a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 04:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738843608; x=1739448408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzeO14o/pXr8ezTGYZalXSXV/Bh7c/D19pERNYYPjQ8=;
        b=T9yuPwUdr9aJ6c43VndIPsZ9D62SGI4EYCDrNJux7iMeVBDuUH/kUIjc/u7yXVTmc+
         mtOB3GC6IHz+ICEk7vUFkGkyEHiXCgARU4QA/jQ9zqkVgWGdHve5mwFDtJIKrsg7Ds9m
         UZXDUzseAy9UD99WADMBWgJsZIXlUjbgHA2h2eGOfzhlxZEZ6pw8L04u9+OCuPGqBIWg
         /90I/qOlWW7+BPl3448yDiuM37yOqCktadaHDp5TcnFTXX/hijPNuXq/WjP3ASTbJ7bR
         VTgMJahVVNMLUEtSfYxIwu6ZqZry9DaKdOBpoDzXfw6DWKMle1t1XbkCfKmsH2edmUmO
         TvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738843608; x=1739448408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzeO14o/pXr8ezTGYZalXSXV/Bh7c/D19pERNYYPjQ8=;
        b=KqfkbnNRtxjSGsAksEy61hHMAm5406v/ohtRyIGKJC6z5HwpspKCHUX3VQMdK/7YmX
         zR+OcUIEvLC/QjDIRs2yS/WXjT/ZmtkEjpxUhekWLFqGgvICoAbi4p8Q4swqa1a5XlVj
         RwkNQKA2P+X1UeG0fmoWw2wxHPaJLBvfID9ze9xF/VV2Pf7XSslybuej/l19FphpQkjx
         owe7t+8wb9hTH1G0BeDj2vl0lpnJxrniOFLc7/rcdwxA2vHm/NFnR3oYunR6/gff96yw
         iIkLSRg5tPrjhf067WumbRHlgaJAWKO/WqPqqJ909im7UocPJ3VVuU5wGoisLEljGePE
         5C+A==
X-Forwarded-Encrypted: i=1; AJvYcCUSL/WsrknEIY90u10IJkahulU59jnCvAUFM6FAIOA/DHp2xmfN6XLHZKfWI0NBH2QsfBdCIl2wsAwJIsb71rUF@lists.infradead.org
X-Gm-Message-State: AOJu0YwquqZ4nAs04SjI+qWVogfKJ5tEPSw6o1BZYT7tAxww3J/85i1N
	xXK6IFSZ7t4PddFbr/BeEPrZxx/nzf9G/OzuZQV4ZQZCUa7xr0KCEuPgc/6odtQ=
X-Gm-Gg: ASbGnctmIM47Xo96Ij/Ru78CtRLnMikczoC3NYtbPgb3igkWYC7NBZX7JoBLjLDloKO
	LPl9gq+7uexas3b/g4nLmsUULVAOGbENjF/wJOaS+/5KIerUHRVNyVW3roMpzbZzbYt0q1CEhCb
	nBmKV8LdhCexQIwT0cdHDgGsH8FsojVj0NL8bKaSCozYaj4lCQohyRcF5/Z6hpO04CXvDTqMYrd
	0aKMdOQIlFkqU3TplY+3NCeW5wqveaowdvykdMZ5pXNrm5T3y5vALekKIMzsxjTU2RJaS3HED0n
	K3eD3eEJ0VF0BaZvqfPHLxboZ+uOoleHPFWabMOWyHDc8qCwmueXvUP4Og==
X-Google-Smtp-Source: AGHT+IFI71F4BsOEuE5LOsmA6xvcL/sHCHHEInIj/bQ3b2TPDGHazfEmK+Cl66ACwGBnNwW8wYr3HA==
X-Received: by 2002:a17:906:6a11:b0:ab7:5b58:f467 with SMTP id a640c23a62f3a-ab75e345e29mr775388066b.40.1738843607801;
        Thu, 06 Feb 2025 04:06:47 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fdb84esm87896166b.80.2025.02.06.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:06:47 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: pwm: marvell,pxa-pwm: Update to use #pwm-cells = <3>
Date: Thu,  6 Feb 2025 13:06:26 +0100
Message-ID: <cb799d8a5bb284cd861785a691b8d5e329300d99.1738842938.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mzzlOW4s4XFlnUNQki2gOaCCsd4YELQmA5LEb/HxHuc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnpKXFkdfzIMqsUtFwSC7Ld/W0uHO72JRAcmq1S vHKqGCjSruJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6SlxQAKCRCPgPtYfRL+ TllnCACpIZYHCIIgQPnWJ7NTPt7U9cHpdvBcYDh7PLjBCpqtcQkZicOtQI7NV/JICkQU8Isjs19 CPCh/yYAFydLFCGOv/MN4EnlEkJlFwahKCN7rpXFy6pdkS03oXiTeIYqky8YGxIX14ZNCyXQeZb XKJaAZXe5awZ+y6mk9uPJObdxRIr7Z2zC8aXD2ZU6RE1U4KrvAi31L8royEpMX2S/AmySoP4Aij GOrngzrp9VRJMt8MRh7BFoP9UuTlSKOKluK7EM4m+3v7ilSS14oiyc5eLn90WvCII5GKsV8cPnF H/vGOgRL8LVRoUBdBrvojRriw6CopeMcUJc8xs4a5tOoZdeV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_040649_561547_F7FA4F27 
X-CRM114-Status: GOOD (  13.29  )
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

The PXA PWM binding is the only one that doesn't pass the PWM line index
as first parameter of the parameter cells. However this can be upgraded
to the mandatory binding for all new PWM drivers without breaking
compatibility for old device trees using #pwm-cells = <1>.

So bump #pwm-cells to 3 with the (undocumented) promise to keep the old
behaviour for #pwm-cells = <1>.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>
Reviewed-by: Daniel Mack <daniel@zonque.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..74f2d5964742 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -25,8 +25,7 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    # Used for specifying the period length in nanoseconds
-    const: 1
+    const: 3
 
   clocks:
     maxItems: 1
@@ -45,6 +44,6 @@ examples:
     pwm0: pwm@40b00000 {
       compatible = "marvell,pxa250-pwm";
       reg = <0x40b00000 0x10>;
-      #pwm-cells = <1>;
+      #pwm-cells = <3>;
       clocks = <&clks CLK_PWM0>;
     };
-- 
2.47.1


