Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DF5C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wm9uNcsgLmLy2CTce8UTPVgm6JKmZNFE7FHPVZSoHGI=; b=RM03tRQGIOsx190nx7Rv1gq/BE
	DScxcq8EfToX5AgENDCqYXyY2zhy3QCS3GjUw+Y3r+HFaYZuvAOh04xV3oIlPXN9I5uYF3ZdItqWv
	fX5zE/SdlQneLRJFuqKwcwPKMAS2aUSJqkxmHhlyZf3Wbh17x46fWa1oVRdEltPErGvdmtHL0Pk/b
	ZBF/LyqPHog7Bh2x/JQrkni0ldB3Uy/61cdxY8oqSyZmTpHJyF+RE9JSYX6J/p45vCm7RJkvsfsXv
	yLFBRfrY1c2ktV9VUW5BChwqyOokyZZ04jT3Vfyu52v7MQYgHmgVeEWTVKBY/ZRGtKBPu9A039Be0
	6MtxMmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZPK-0000000FPLl-3Ia4;
	Fri, 20 Jun 2025 10:55:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYNT-0000000FG8X-1jaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 09:49:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-236192f8770so11013895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750412982; x=1751017782; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wm9uNcsgLmLy2CTce8UTPVgm6JKmZNFE7FHPVZSoHGI=;
        b=ULNuS7iIi0WgPxS+t5vmgK3N3gCel4g4SkR4KL86mj6nDiFLk1XF7dXGNRJAQlcaNj
         CqO7AloT7vFLgpETRLNJJ0RBsyBnih3F+L3JOfDVSJo+A/BvZY5oAuZ2YVOH+jYNqdkO
         P5KwrzCgcnJxrzKTrVvI9a4akicI6DdOnjQU76tqsCYIiZ0E7Q6YsR4tGHkGFpPxW4Hm
         XEs6g/I5ixVCJhECP6jCVjc+YAPqbApwo7XzhaL0rHcPww225ApVg3RedlgKMOIicLPC
         nNirrR/qL3D5n5vwpn36vaC3dbmxhlEsmoYxNi4GM4u8DLY573QgclFY7XwsU5ouomgP
         Xi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412982; x=1751017782;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wm9uNcsgLmLy2CTce8UTPVgm6JKmZNFE7FHPVZSoHGI=;
        b=HUZkdyCkcoPmol9QLDsDJA5IYEbxt0aOVjgs5grfu9qIPDxKNFNuBWobQrDFlawOPL
         lPykkhPfeqvxS5PT9J1SEJMAsoalerBgfs2wL7jpMqy50BN7P9aIRhk0rUg1Iv4fl7Am
         bK/0zBQMIvibzXPI7KOwugweQVu4R5DimmVeROSBQKnf4AFGeKjUWV/xPOKPyXmupa37
         r05m6qk0Wv0e0L6tIG3BScbqNnPjkPcmfD9PVPN8YiuGurFOhd0HLhSsKia5PvfyOL0T
         HW1hLa7ti5neZqQAz5cIfHoNnyt/S8+gFl7f8k8ndi28/7slI430/kUW835PWNC2lazA
         rmRw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHYkEwelcYQUp1hpJPJwzF9NTL0cXj7hOxkxFlZcF01i+OKYIXzwphrfV6LODMwCOttH20SSXDbdLL0H40ui+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GDgv1VKVI6BLuKGPlkPubc5fv9DKHRphZHyEZqAbtrml6wIr
	Y/JW5CE9F+NRGmwhMMvpn3BUrAcwWAIwivBRA/YWqiEdtIllQVTfVrw31kJgGrU0
X-Gm-Gg: ASbGncv5LrnTjikSdtbFUCMHXn7p1wXf2R+bK1khJqadM6+OF/Dl7+RXJLq1kuyrZVb
	Hw4xrHlClxtGi+qNAZeiTWyJydIGpW/LpJDNUzW7lw/Hiep2XBQ//GUL6v15PaLVScFQQjlTvER
	E3aaGVwzXDDwYzUw6PemOI4xhi64zfLevBDTuzO/5nmNIEoS5lWUxI/cbPHnZpfgiipIAWtvKBb
	ONIvOK4PfRuaRreTGh/FlsrMu8vUXp86iYfr5GJV5nYxB447dHYE7NbE3/lEbn1BSv0nyoqX+DF
	r8BFBOGHjZw+ngBOfDOhUsitBBqb2irxX/pazFzkU2fj5vYAcV0Qq8hHJq8ksuYB+CTDt9nwIZv
	a+cxF3101q8I=
X-Google-Smtp-Source: AGHT+IH6Be5gP3+3exFSkxm22vF5iZh7JCUxNtdjaBLajdekU8Xmj0n59/agYpsJTUMoVM2m4rUZ0Q==
X-Received: by 2002:a17:903:32ca:b0:215:a303:24e9 with SMTP id d9443c01a7336-237daf6593emr27765085ad.3.1750412982159;
        Fri, 20 Jun 2025 02:49:42 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-237d86ef88bsm14167885ad.219.2025.06.20.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:49:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 20 Jun 2025 17:49:11 +0800
Subject: [PATCH] arm64: dts: apple: t8012-j132: Include touchbar
 framebuffer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-j132-fb-v1-1-bc6937baf0b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJYuVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3SxDYyPdtCTdFPMUUzML8xRjc4MUJaDqgqLUtMwKsEnRsbW1ADN
 YMSFZAAAA
X-Change-ID: 20250620-j132-fb-d7d5687d370d
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qTnLGaYE4mSJe4XGJd9c1paMNelCcWBLch1kHcCtYSY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoVS6zKNgfrxDu4IxQuG+XErH6r6Vm9rzm0pebd
 Z3LpvEPtguJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaFUuswAKCRABygi3psUI
 JHJoD/0c+i2KQVhxj9K7upj3umunHHR5iGCOEG7jxFTtrsE+9UuVngAG8qtLOrYp/X9GUmrrZ2t
 YjB8zqTSrGCkMZgDCQSvVnYq7RApDSyigQQ36SWV5Lh0zMI7tuF4rx1m8MgENCWOqRwZKEK64UX
 MBz8IOTYYDcFK+G5Dj9SL2QLI9HQWxAjpS13aSuYZ6+jT0s4U06FeLHcrPlOg8V+5os/NVVo+/q
 Zx4GZs+Gtry/8S1DKD3+TARaqvlCXS5qZiEvnGwCEOochN2Xh/DHTQqUlrjhAVL3XQn1DiN1hMQ
 EBd2Feg6UYw+iXnzywYNLUJZYcYGpD6SGYjwnxXBpJ1iN4izrVDbcXaSYfcrzlLhLBPyFDU1MQE
 oKCoPZco6WkgKXu6Ocnj1rMY7OqrrvGYT4ii2JrimT3DE1hf2BkIwfb1SIh5+aElTHTR056aGOW
 YIy7brULuGRblckBPK5MZZfsKFNaPgrwNN2BEj1C152m/CZgQmFouQG2X3BQZjdMLNtksmVCQ16
 SnmdffQVXD3VCC8cK6iALZdxHjRAhAFBCbTaRGg76wX/Be4wEiOniKeQAwHSAXi17FE+cjwdL3q
 luHN2WxpWowukCRgX/7ADKFDgaLOUxVo95rtVpeUopwEB4llG89OR/eUN4QiImlW+nfZ2mvXQ5a
 1taNYho8VbNMnHg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_024943_456230_48BB244B 
X-CRM114-Status: UNSURE (   8.18  )
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

Apple T2 MacBookPro15,2 (j132) has a touchbar so include the framebuffer
node.

Fixes: 4efbcb623e9bc ("arm64: dts: apple: Add T2 devices")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012-j132.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8012-j132.dts b/arch/arm64/boot/dts/apple/t8012-j132.dts
index 778a69be18dd81ab49076fb39ca4bc82f551e40f..7dcac51703ff60e0a6ef0929572a70adb65b580f 100644
--- a/arch/arm64/boot/dts/apple/t8012-j132.dts
+++ b/arch/arm64/boot/dts/apple/t8012-j132.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
 
 / {
 	model = "Apple T2 MacBookPro15,2 (j132)";

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250620-j132-fb-d7d5687d370d

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


