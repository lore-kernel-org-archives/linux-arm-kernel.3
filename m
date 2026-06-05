Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF55CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=; b=bKBtwzjrafQ8Jt5JGKun2G7gY7
	riJ69MoulVAVEM0sY9XCGTHR4s4lynij3VBQ2/QDmX9MGQosK64rUD47MDWP8uN89Hu10vu+u3+CO
	zDp5IIc5N/iPCc7SPMiwHkhdiWlyBAb1LwQkpCQyBLEekwWum7b3EKUrUiZ5R/WakokTXVWdRFWxO
	tcvYjgQ9sf2q/R5UraBg+ylwC9TWpOx2gOCK2KFC1DipDRsT3AoXaYHdtAaO3yUAlgcSyAbnTsqZl
	Y51ozr3qOrkrhoGJiIHmcI9EN4QXsgqcc79g1QC0XpkdnPy5WOar3duBZ1pS3htaonPPTC4TaBA+f
	HTBh/EsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgw-00000000CuQ-2iti;
	Fri, 05 Jun 2026 07:10:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgr-00000000CrF-374G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso12885915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643400; x=1781248200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=i8Jz4ibxFgBTtqda2LDBQxUBDAC5hPJn3rtAOKX81gnvMsErKVhA2mZoLlsJ4yZ7/q
         jVziwiIR0XdVA2u1L1RqQM4bRpL8w2qugssttfMNkawsYaDU3yJUFnTrMyOxjhv0ZNe9
         Cu3jy+zgtji1tWb2fwLecRWubXAzhX2G+Ea8Rhl/xpnJzzC/2iINnP9+9dStkLu4Fzu/
         vpMXXhMNP7OEiedtZ5JUCvSxpcZ4tm7thosIjZyHBsr2p9dcz/zuDOT+PgmldIQ2hiUi
         +fhrVdY+ZnuY2YMH4AJSbvm3q8wVc7xjHgns+pVDKu2tlLh/i0UdUFtgnbbgvp3TuLEr
         He7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643400; x=1781248200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=oqJ61c6jZ/G9gejf3u9qRNUUUz/KqDyQWoeIQR2EO3UR2Sr/xE9swp/1eVI+N1Qv7q
         Eb/toA+rwwq0pmYTJX/nEo4a0wWAjOTc6+VF3+Yz1JcHkUCD/dksgyfW/+2EFgx0xt5G
         fKzwdv6zTMe24XkMMgSjPUNijOF4EkUypdKkLc+PgUgAozIwu2YpUW6SfKIeJoIeFtRV
         +xrYJhzZ9DnsZLuhW495W26V9eo0bXsA4akRl53RddX4wOhHAEZfZGJXDQohE6VjFsh+
         vrCFa9tz3V8zUOBSwFu+L7zBriQHvnE2Yu+OfpzsY4Q8M/cEkyeZwkrwjJyv+YXFCn65
         zc8g==
X-Gm-Message-State: AOJu0YwvTNeKt9W4R3zlCg/E3EfRVxwSdepOTUci3IP0OCsZzMcftgwL
	dI6XfNtRL7Stz/UeGMCrfE2Haq0hkjKC9m6l9uBewTur//TxSqBu3wmkMlYpLaUtXhU=
X-Gm-Gg: Acq92OFpS1zQGPJY0+plLYtfW/aHQ68AylVNMcaJIw6dNwj/PwXQKVaR1tClCUAadFG
	r0NTMs4nWJfN0AQqPUmNlhZ4BEl9SMJ+umcNQA9rWOZfi1viEaWiANsI3qEviyAFx680O0hLp5p
	U5Dxw3X9of1ZNbYTVEa+2I7DbpTZF8Wi7HUaf4xnY1bPhUugG5cM9DW+jRp82xqWOlphAFn+EZ1
	9+xQSrp6/N4LOMIY4ICn8+Noj2MNe3dayD5KWaCXf4rUfg5t+A65NjAD9NeY4rIlQA4TopGYbNB
	2UcL/phSOMZhk6nmoeUPsh7hH5mIJpPOSpWZ2ncVZGyWTxxBOikHCixX/E0sj9noKlTdXd/ooGo
	GFUtPd1GRzhZSfk3pPyPif11OU3yGXMq4FQAMdVnvxtK6oHOipaCVyANSOdUUY+J8uM8CEIUWuK
	eciOtHeRnxxZznk/zrHOinEZje1YL/N6xCTOeo7iEpQkKfLkD8pjFnWTBFOjfjWb3qzkuYbbM+e
	a1ZUaxara1un2N9uF/nZQ==
X-Received: by 2002:a05:600c:3f1b:b0:490:bcf6:46bf with SMTP id 5b1f17b1804b1-490c2599fecmr30837895e9.9.1780643399552;
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v4 2/7] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Fri,  5 Jun 2026 09:09:16 +0200
Message-ID: <20260605070923.3045073-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001001_811101_4416A5C5 
X-CRM114-Status: UNSURE (   9.43  )
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0


