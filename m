Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31ECDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wchiVNh3rpBI2XZC92te0JGKBDBHe7YjoYm2rNU3USE=; b=VZaQqAoXC9iPjjBPWDgu5qb4HH
	9k8pMmbiUCakj31PjkfocKuFdCFsTeNY3wT539KFtuYBF68uM7E/fVJIMU5ax42Ba626NTlsfhghU
	55idh6C7GNc/sSDHoJ58bSHoChToMhqpBcb+5/W9OzAQi+w6+uWU2YjcehICvU8PyJl8howGmMAH5
	pBN/8KZF0YysQ8pjPhB6cgUJITpV7f9evT1zTMbhBbS61jcQi/ZAQHnUKs6sTusPMpW+JgNVAwX7b
	QB6JEkhjRgvD7KPw7a34RXYpEpALLm1iBq48cr91AuteAFB1H2X/Demd5LjwKxOhTXfmP6MEzh/Pp
	UQbFSI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc839-00000006sKf-0iZN;
	Tue, 23 Jun 2026 20:48:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc831-00000006sHA-298G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-462cdb88d01so251954f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247722; x=1782852522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wchiVNh3rpBI2XZC92te0JGKBDBHe7YjoYm2rNU3USE=;
        b=BFCtp/QlwxDYmIMFwjT3QuPSwOap0GqiPtfFkdxt8dvR9ocmHo5udlFaD15HW/0bty
         1yA3Q6YJBZQ+fS5yy56JYhBZMwEmMCzMSG1t9RaAABbEWap87yeEGtb6Zzyil9AXf6/+
         ygIJBgENGSbpSIThKc2ZlFYZuhtUWAf9aVG0gHbK3rkpnGY/X7j7W880d+aiwauIqiFJ
         wbHIfBq8m5G7VjrqoAo4ZeqHB0zjEs1Lrxs0fItvgyoTfyIk3gkLvcR1aw0Gkk3XhUDQ
         ypSigh5JNOSVRcOn7aJTnrYkNd2VlZxYsCjGtfkHOVVzLiW2N31tIzDX83O5pKFFpkhR
         vzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247722; x=1782852522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wchiVNh3rpBI2XZC92te0JGKBDBHe7YjoYm2rNU3USE=;
        b=PJpwldGT+eKjPmDBn/m8umyqwm0qMNL5WrqfQWu+IHHBI5FNrttKqdjXNuhyjad92/
         a0a0eyaSRo0oAg+Q4N24hPNCROQMQCtej5NCNGJ+QfaONolmpwH3+aMRpBoSPAAhRfCJ
         iSF89HGBDF3QH9/v4/hIOL1M5Y4J1yIXtfnFV5S1MoDpWNRPqfG2nQW0yNpZdU/ZG8Cz
         RIseH3s1Wc7jdw/fr5lbcu5P7TUGC+oOhU6ef+B+xPljEN6NYZGI7wGoCQoFNo1++Ekf
         P3098/zqze49VJEiWM+kBqqB4hJ+Z66US9FFGg+jW9yqCQckHTMNCcs0DgqT19EnigGY
         MfDg==
X-Gm-Message-State: AOJu0Yx0X3ZAcVX13pX1qfXWdzLAfTfhXnWMix/XNx1crXLUuOUJpTrb
	bwxiaj4C1FFIe9Xgwxvq2HHx8RuwaU1SkDm23w3Tg68IHf0CoYwGrWzXs33mUkFyf1M=
X-Gm-Gg: AfdE7cnXFs5x+Wab69gMqhMvMlQhpHaVxSunPlOmFkTQr8/Zcvo7ck2TxALfSWQi/lr
	kHF/TagxdSBNo/2htIV0MRVvL/wk4ecMNURVRKI7Om98U09sAF6zDKN0JNCAxRxVwrV4IqN8uxK
	yUm8JcY+gfKM73n6EtCeBpfYwNSIjVPIyjjGDS6eIPwhhk9SWpALahudP60h0LPUk5vK+fxwXob
	n1GJ0RQ+FInjHoyvL3H/y+10A3vCt6ro7dLV1QVXCA/QAAakX5W2jRxATyZ4ZJtiSrHhJtjRFci
	MKF6QgWxy84QvKYtmX5sMQ2HL8o96e2HNTCrnkeCBfOYTTvG33SmSi03D1MDdJB8BoxPklbedCl
	vwC1k0MbCM9WmlQYMTt/darNmFzGbRXm0JwH+o2gjIjNTNUX9MP8Pxj2TjVFQoLpifQm/S8Fd+2
	4a8g9uaod+WnNHaQvdWanWOMacnqpxKIwKzoXkuO8P/w==
X-Received: by 2002:a05:6000:4284:b0:464:fff6:489a with SMTP id ffacd0b85a97d-46a7e9f3eacmr9075904f8f.6.1782247721730;
        Tue, 23 Jun 2026 13:48:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:40 -0700 (PDT)
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
	linux-input@vger.kernel.org
Subject: [PATCH v5 4/6] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
Date: Tue, 23 Jun 2026 22:48:16 +0200
Message-ID: <20260623204824.691832-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134843_566747_6C91C31A 
X-CRM114-Status: GOOD (  11.16  )
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

The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
versions in existing SoCs. Add a compatible string for A100, with the R329
fallback.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- no changes
v4:
- new patch

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 6bdb8040be65..524c8b51f53f 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun50i-r329-lradc
       - items:
           - enum:
+              - allwinner,sun50i-a100-lradc
               - allwinner,sun50i-h616-lradc
               - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
-- 
2.54.0


