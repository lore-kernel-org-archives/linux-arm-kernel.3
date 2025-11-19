Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893C4CF2588
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYHfBeSzfHHxVu3uMn0kynACtSYKaWfSTnHHUJabxhI=; b=b991tQChuXLdqFemVvA2I/FP/3
	D+NQer58sI3Kktzg4xCxwPEcFxkXA4dvijwTZKwCy2s7AuIEl3ugE+TMerlCu4FlUKcETgFSZPjVh
	PFK2RQhvBEcJNZ7lZ4NgwLMLH4SFqRqR3ZPB1aW+tjVQxeRbgmnDyxg71f5pNez88yL9a37cB7sLw
	58rdfWRGvnfSxho07zi1jZ//kbCcXaPks97xZorjJQJdRR3xEQ4NgklwWCAyFwc3N94q3/r8l1udB
	8u11VMUewD7IlKHsh9Iw0/QFKHy0VaY4wt9BfiBOMktBtmOER+VuNDfBcWXrvGxBe5SvdzGXy7yiG
	yGYYWXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcM3-00000002g4w-33V6;
	Wed, 19 Nov 2025 07:11:51 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcM2-00000002g4b-1199
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:11:51 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-29845b06dd2so73409195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 23:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763536309; x=1764141109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYHfBeSzfHHxVu3uMn0kynACtSYKaWfSTnHHUJabxhI=;
        b=ebybf8IaQopwrRknsam7mz5d0uDKlIY3mPdkwS8eb8hUXggk2xBrWkSHM8VnqGW9r1
         mXbVXvXajqjW2zcq5gPLXaZ60aODf8cQfn4kUVLYvDk90zmDKHnnswj6lRRhQu9VjLOs
         nfewhFV66SEN1YC3j2BEXw9+B70zRPtBKdUws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763536309; x=1764141109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYHfBeSzfHHxVu3uMn0kynACtSYKaWfSTnHHUJabxhI=;
        b=rRDTLGfNgLUAV7jHNVf1rAjOBxxMl4FDBTB8kH5eicCJxSX8WI3ZlBWpcoYESiSabt
         2+HTIPJIP2Tnr2c8DOT7D5QemPZxybGSZhhcilIOKzU0ZLYcyvIlGT70LwcjkCi04zdi
         H95IXxD7DemVYER+ctc5j/MI2WC+VuaUS61K1LeSAVBVf9zvg4zL9Mtan8MM5PUreAbD
         jMhhK6XsjPNFoStKc+TGLsSzRKE6M5qmbsyX4yue8p0FabjmLFexCbfTDm0WF/zAdTIb
         YJ2UQpWXGqxCQLPaEGtvNT5R4hUcROZieacVrHzLx76ZDkp4K+x3k6sWSmxSO+ty8njC
         Tvpw==
X-Forwarded-Encrypted: i=1; AJvYcCVrRCpsrp2pe3isYeIbr1Bmfpv8DNEOonh+XfbGr5KaKmFM5w2jeoXmG8XaY8NWLKhH0oVBATPb2pqcHD4H9ES8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxase+/p32wd47om+k0XsotIK663jV9AlQszqkV8utuVIs4btQW
	JPmG+KzlFoVOsMInh0ws4SOPVlThWWxewZ48+O/S/lbx+uJIaD5gpzOoUeZlXmeEMQ==
X-Gm-Gg: ASbGncvRIjvb1g532VhHpSStLSkW3CoXsgLzKMY4VQq/YZ2TZQi/PEBxdDZ3JziYc3P
	7Bnq7eMTHS5OYqqiRuhG5Q9E7ZPe+pKLFND69Qd5UPaFkTHXSU264XhJ5zpiftsedh4sUx0MOXx
	wed1bjTpOC0g2IkD9JVBZ4uyToeUI+DffR0fR1mxDaUVuy2l53gxUilFLCszKOvj/YWGYc6d0iT
	iG/Bk6zyaigM/QeVoQYYW9c6xpKjcAtHPrbUMuTjQvlRYgEKCrvuaiKBisnStjgUbT/+mmCoPuT
	q6ap0wCByuhPRMleS5/y+B8piA2mvLGPAz5C0uCdn2e5lEfZ4cdU4/kidfUcDK7jqgu4s0WE2X9
	r6f22NZ/RoUZbMHn5keoECiCVxHT12DoCinRxGktRLqv/12LuFLDQqLTfl11CzgtDdIIwdHlQO6
	ykjY4mz3JafHiBtbF45swP3Qj02wcYGxdheY3+CzLZsltxqeQ/Mb5ip1x4AIh7yvZRpsBK
X-Google-Smtp-Source: AGHT+IGNuUZZklbSnAwcwjH0fvBJN9XmBWel6ilOI6vt+JGrwzQllOqIu2jGWlXL11D1C3baD1ynRg==
X-Received: by 2002:a17:903:247:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-2986a6bf3b3mr209119565ad.24.1763536309538;
        Tue, 18 Nov 2025 23:11:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d42c:6a2b:5251:a121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf1ddsm197554725ad.92.2025.11.18.23.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:11:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: coreboot: Document optional device specific properties
Date: Wed, 19 Nov 2025 15:11:25 +0800
Message-ID: <20251119071126.1719405-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_231150_321278_02AF77B8 
X-CRM114-Status: GOOD (  10.40  )
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

Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
insert device specific properties into the coreboot firmware node when
there are valid values.

Document these properties in the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/firmware/coreboot.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
index 4c955703cea8..0d04ea482aa9 100644
--- a/Documentation/devicetree/bindings/firmware/coreboot.txt
+++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
@@ -21,6 +21,15 @@ Required properties:
 	0xc0389481 that resides in the topmost 8 bytes of the area.
 	See coreboot's src/include/imd.h for details.
 
+Optional properties:
+- board-id: Contains the board revision number.
+- ram-code: Contains the board's DRAM configuration type.
+- sku-id: Contains the device variant SKU ID.
+- fw-config: Contains the device variant FW config value.
+
+The optional properties are only populated if the values parsed by coreboot
+are valid.
+
 Example:
 	firmware {
 		ranges;
-- 
2.52.0.rc1.455.g30608eb744-goog


