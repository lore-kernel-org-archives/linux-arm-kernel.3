Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980B6CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=; b=fBs6IiYf/rL6W0X+Ao7dd+wa6x
	14eGF2OX7vYzl9G+Np94n2+qZwkft4a9+Zrr6aWGya9qrAUuAK2NKXTjTJsVTcNUimvIZ/lM7SOay
	Ew+1XR5m/9Ym/MYsgj6xsuDOteWAPdFd38FznbpUwAIlIGPXlWv9v+Ul5FAZexNIHT0EpTRY7XJb2
	zRVt6Q17qFmIJVcz/CNXRB3XuMvQs8fm56SMxAfwV+m6akkUvgOnn/oujamxDOaEUAxn0K3Wyth2S
	22uLaYmrYruXJBbc/81RYIovVIcLpG0t4TaoRo5+Lvq96xLaRAOgM9pMvv5CGLtfhkRbUZztX8RBO
	JQm/1iTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisn-0000000G9I5-2VFG;
	Tue, 12 May 2026 08:54:29 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisk-0000000G9DN-2PfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:27 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so2163038a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576066; x=1779180866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=D9PNGWXv8FGl0U7lrmDEAy4JDbQzcU4jEQAEV4wFfsndSMOVrNAg8aPTpb++dbcXNw
         inIebDtyo2VT2UMXQlClEhTUTspDDq0b4/ARm4uqPbA8B08MEKCWZ2YNglj+d9kw9ZBH
         a7KTNdP/QSc8tj544NG0tpC5KW70+ENIgeCYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576066; x=1779180866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=KJAFvDxARX4Npd2M6BkJizhc0ba6j3+OVpe6xiJSxeFJWkBpvUdr0d371wF6D3UJL1
         8cdKV4rNryRg/DcUUgz1N6+AsjsbaSjkCrRxZ/slolP211+J5R5iZ0uGTUgujyVt+ZQC
         hfjYRndG6hYVD8SY/AWmrDePRZ5c5HRacPaYCqshaKRCcY1boZ6aWGnSJMsU4wTBknnF
         9M+Y5CSM+Yplq0b2uFNLcw0nobWsTFOIBrjlZQPeH8/8QPxBTvwSNfxgaEX7ZG5ZQLIa
         q6K7j+2/5IDvbsTqapsUBAW0dz7vP6p7wPCFKPlFwej+RS5Ococ0+fBL1wOlxkemQk71
         F4AA==
X-Forwarded-Encrypted: i=1; AFNElJ+hCdpASvZlb4h7PCY4Nrmr4mNbZuy9u5wkw3t6ooKYRMnWbFT2q8zU5pjsf1vZ+ToRbccjZJLF9rpD41ZERlv1@lists.infradead.org
X-Gm-Message-State: AOJu0YzuDkb9AU8bBs5YWWqi/9ljXy13QAqSxe8F9oH0lz/j/kyc1WxJ
	Ks2xkcLZTGGmFFdpKy+bIRQuy+6NF0AU/S6MINIGVgWphKkBGXCFrdzqTi+U0toyHA==
X-Gm-Gg: Acq92OHkTT5iumVfk8iDAcRACucpthYMMnFv5h5nkF0IwSaSJgcZjBDQFj+D7BVAQ+D
	vxKjLM2sZSx/3sWSGlQ5SmslWo3F0Sfvy8yHqJs/qyeWYxtiwLn6ou9h5XKAJc2IvdwNZd8PZ5k
	BRLxF5/lZo4yQ0b4HpMDB7vCSnPg44jf61Pbbjes6i7P7b/atXX13d0J2yfEq58Xth3fu/WqaML
	ztwZWWvSt+VFFRCD4BWjUyuvcz5OpcjJm4JBPTtjfSKMEkqufqCVwYclR4Qx+eiL75ffQdR2GQp
	H0Cy+5s8Nq0JiTAnO33lysM1pHe/7GkkywwS5egNXsj10eq6eVW+F6Y40SRjr2bo+wyaTij1F5s
	a/XqWX68NwaOEyt7OixoWpa+bGaPSrggYxIq/NPsI1jhCCZOTgcVAbi/YBl14vs1blxclmTgZ3L
	cwJJwogTCNMKVAbWlXv2q1mIu2GanMpp7yoAQ6CWm7WtO4i7TOPXIPQl2E5pOnigm5UpPRC+v5q
	DB8ouxIPjOvMmU8PaA=
X-Received: by 2002:a05:6a21:9983:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3aa5ab71a24mr29852885637.26.1778576065529;
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Tue, 12 May 2026 16:53:51 +0800
Message-ID: <20260512085358.1693208-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015426_618797_7BF8863B 
X-CRM114-Status: GOOD (  12.82  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.563.g4f69b47b94-goog


