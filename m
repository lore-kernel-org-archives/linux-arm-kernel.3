Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7125BCE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4fLacl9mFAQr08mGf7Pwj3Tmlo5Fg+y5GeLVVCqGWWQ=; b=ecHoL6K+RyxuESe5eFuOkYwCon
	EFGBnK3mTP8lyJWLGTTc5IX08Ow3j/4JkpPXBfQ730MVjmPjGyXKwWnDZHJz3alJJ++/16RO4acRT
	zj4sqArCVyl32NXu+ZmUUfZB/Omxilr82vY3GDfdMPMveirmO2uPYt2jPU16y/V4regc+SwH1bGdS
	cLazhDhxFJhH610uS/NfTgRlRuyJ/bioUWxs1/FFp6VWD60ZuaIXuiNI14z1SlV4S2ugfvB7WC2C4
	O2U0HkUDuZaIPfWpKwQFxOODctfrH5eqd//mp+IGC9BrwrB2tt2Y38Q1eV7AH0pvC0x42OBn8JbLc
	bd9F6s7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNx-00000000FxN-0MwU;
	Thu, 24 Oct 2024 11:52:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wAt-00000000EVA-13Ki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:38:44 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-656d8b346d2so474989a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769922; x=1730374722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fLacl9mFAQr08mGf7Pwj3Tmlo5Fg+y5GeLVVCqGWWQ=;
        b=fcrz0l8R2xB5T1C3sNYf3jxzUwlkQc+FysYGZSKlpQFdEGPDN4j2uS8wJ8JDnkaloK
         8SZ0aL7oA5Z/t9XCWIQDRi3tXaM/Ab+bSUT5TWiJ9RiolckW6dsv+vZlLtWMBl/A86Rl
         Jrdh4aCwKdJx3aV3qMRbOTDMmH2Aq0RD1RTPunqQF/ywK+Qa6ToLsX3S4RuIZYTvtiyr
         xC4gQfF8U8/a5KOrJOozhepFWyBG5VjVaGHjygrafNhngX09P8oecWUUHGV6Sh681tde
         K6Q2788ctNWgyK2Ho9w3wJYdlhlQGNDFR4GD8AcNnXJo8ii7MgzL+ZBy8zzenyE60SdX
         s1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769922; x=1730374722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fLacl9mFAQr08mGf7Pwj3Tmlo5Fg+y5GeLVVCqGWWQ=;
        b=E8vlGvlf5fVqpPpA+Gci8EqMvMADQbV5SDBdscvu0KBuXTI1wPTNBuQXH6AzHA2sfJ
         oFzyRXtnQepZLc3DqwWE49paUvjVz4Gm8KuPwh7MH1FxZpP6EwouFzAS7lwmN8z4XpPY
         6S82eJsnypKqTSwU8iHZZ1IdaH6nuK6Wo8L9/D3NnFgHXKRibSNISf3Za737W+jicJlI
         GsKkYnJJdF+Hcy8cZpb+VXnTjnJJKlWouOjAEUUM7hHfMikLfhH+NMhNXkQjvEn2OaZR
         hKKr9lgNs7fqA2XhHKXcxnL4dvi9S6wNrIamWD4con9DKQ3qF5VPYG/i18jKmyCQRstY
         xYng==
X-Forwarded-Encrypted: i=1; AJvYcCW1lLN/DnHPZiQMyVG2W/b1oUalG8/HKj/HCNJQW0tLTtcLYNK7xW/EvSQpNSC86qie7Cl/XEx/ISafV5Z4tb8C@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/2fpl+EqbH6Mn6yiN5OhswmbBPz58C/W0SY7dJvdJ87gTNycR
	Wzzxegw16RQDtiu6TUpQUlzazftTvTl9WZfGr9GiVsQwiL/sKTEZ
X-Google-Smtp-Source: AGHT+IEkqI04BxDtCvY5jcDyZMiBGcsXPoBgP8y9Xb5C63ws5LBwXPMrxU8kmjCEpifRKrC8LS8ILA==
X-Received: by 2002:a05:6a21:1519:b0:1d9:28f8:f287 with SMTP id adf61e73a8af0-1d978bae47fmr7195483637.36.1729769921824;
        Thu, 24 Oct 2024 04:38:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] media: dt-bindings: adv7180: Document 'adi,force-bt656-4'
Date: Thu, 24 Oct 2024 08:37:51 -0300
Message-Id: <20241024113753.1353023-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043843_320082_AFE43000 
X-CRM114-Status: GOOD (  10.50  )
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

From: Fabio Estevam <festevam@denx.de>

The "adv,force-bt656-4" property causes several dt-schema warnings
because 'adv' is not a valid vendor prefix defined in
vendor-prefixes.yaml:

'adv,force-bt656-4' does not match any of the regexes: '^#.*'...

The correct vendor prefix for Analog Devices is 'adi', so change
the property name to 'adi,force-bt656-4'.

Keep the old property for old DTB compatibility and mark it as deprecated.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Changed compatible string -> property in the commit log. (Krzysztof)
- Fixed checkpatch warning due to the commit log being wider than 75 chars.
- Collected Krzysztof' Reviewed-by tag.

 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index c8d887eee3bb..4371a0ef2761 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -39,6 +39,12 @@ properties:
     maxItems: 1
 
   adv,force-bt656-4:
+    deprecated: true
+    description:
+      Indicates that the output is a BT.656-4 compatible stream.
+    type: boolean
+
+  adi,force-bt656-4:
     description:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
-- 
2.34.1


