Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC89CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=; b=evmKKSmFp/FlY1JTEsv7eorPuv
	m1stAVKWF+1gGQdzFSrNKP8tLqdK+Fy9eW7XcgPDWSnSn9FQTwVXBdL3maERj5sL15dhtqlUmjuNg
	3PRp5dmPu/VGvOhQAaKpnK4+Utx7QmAqeqHM+DJIzMHq3+THc5tNJlgydQg4RwrZ3nua+b8veF0w4
	V8XLiJ9gUnrmv+1jCWFtBpwwyip34RIThN8dTY1rC1IJ8eZuD2cJoYSePHAyECj1GbCEb0WElvOcN
	5nTaCvUj2O39NHWH1EJ+RsXv68QuhW3dh6ov1emqTZp74dpl8FNFCDrlXKusaTpb5NcAgznYpmgum
	vqslJ93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYB-00000003Amp-1fV0;
	Wed, 29 Apr 2026 07:41:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY7-00000003AkA-3Sge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so306725a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448495; x=1778053295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=k0QyrihA2ggDznmmX2SLN5SlWus1yko0aYaRT3kgdvEx0fa3yMr5ZkPco07AAboXql
         l4BI0x8jkWOX0tR8jULraxim4Nb+cDi6RVHM/P4PrU5qqecgAfYJl8d2ZjjB7xc15poT
         q3NtVi9fCiMZcOBPwVYW4iYXsfGkVQ0VQ/Skk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448495; x=1778053295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=n6cFhE1jO4H3MToYzCJO5ePretVUkAT1peYOxcaGtCNQuCAXSRPHLg/Plm+b0Tmy8Z
         gma8lSzlNjQvYsjqH8WrZzC163SLtg/gIwMms9lslukjy7WVXMo5IYz4wNbs978CIEYc
         y4utb5olLGmRtkwFdl8XqcgEBzmX9XGjIcbIZjPfr8iKyXfWo7XGFYxGkcjHatEoKwzo
         e93zKFYBMXMhDTHtihsFHu6v2VIw/jS9rDKCRqafNSMTJMmYiEpAE6y+fclO6BlFY8Hg
         bZGht9yaFDGjsWk8u3nGrIExZAGAKRGTTEq+2OTnCvCCSLyNUDDvXcf9Zgt8XI2CLzii
         K8vg==
X-Forwarded-Encrypted: i=1; AFNElJ/qttgyBqgZn5sOJp20fZudjrSqUYUHF1rVR1jo02W6mKt4lhpY/cbLOwyVqBMrRFQQlLTsX2FqZOp+u8GkzpF1@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGUSd1gS4AFEU80CTJVcckJ+uhSo5DpvePgny5+H+V498BBsu
	YPyy+OspFukyQfjQZFMZUiR+l/ubBievkUjL8lxhgG6gNc6XJfApWjTg1rCW33UEiQ==
X-Gm-Gg: AeBDies/p5Yfk5y+h2B22NhTudyhnWnMY9FQRo8/MWfMeJjHtnuPZlvvJZL6rYYSVDr
	85FhogH0Hhg+bqIKakM/RqlBg/8mUpNocoVfY4WjUYHsmeP/LItGDw40K+g5oHtiCsL/OhOlYyA
	0tAa34W/xWVekq3wFsuF3Ova2UhbbkDYIH9Limfl0GUUuCxCzODRvowLIbtXT88LoLeS4ovLetf
	S5G5OD+VNQT6Ipao8uOcaulJsTu1k+M+M+tNk8rtsae3EWGgd/eaqXPdTfD7P8FhglrYwcY3ixh
	gCEb6KIusfEgPO7FiVAdAOjkJAtB6NMmiN63IUNpd3/8H6QTjLl8VPi3usD8Qn1i2Ix4zgFSnm+
	5Hc27a184hifOKEl8rDaHd8LFeRy7NxNRsrpveo0/1+H06mhXPFViYe2djzbVy2yjwFg1dyQO3x
	m8cYZKr6J5z90YvTaaU5+eUet/wfZ7e6DWqjzI8dJDPrbK/LgfFm5hJhIbcJ1fEK0zfqkacqy0H
	zesEXWLebOccP36cPE=
X-Received: by 2002:a17:90b:3d88:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-364a26320ddmr1570113a91.8.1777448495047;
        Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
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
Subject: [PATCH v2 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Wed, 29 Apr 2026 15:41:08 +0800
Message-ID: <20260429074113.3720271-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004135_874848_A11BD7F7 
X-CRM114-Status: UNSURE (   9.78  )
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.545.g6539524ca2-goog


