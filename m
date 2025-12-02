Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DD8D1267B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=; b=p36ba/KgsPHoSiahiXHBOaAiRR
	OXXLATSotUdFW55bwtMEE07wVGAVmQ9L3uwvFWyhY0DmQ2QF0736mfxQtGgKCcJMjwFtYoOxm8dqT
	Hqooh1O7Q2NyhQ3t7GKd+HICAVleRy9ZK7ZdwS663cbeF9bTyYcnpQM9/OweqU0Sy3SxBSQBjgjzM
	UN95jsIX8f8o6UHthT9dPEbOUHocSiiSOcElkZNff69D0xjOvzZlImGawAn4g5yiGwMeRvFX+gKIV
	0nbWBd/raMunSzjpEnuzUhqUtQ4A4jBxYOtu0hNaW+hcps4PaBIG8Xb2cfkM6YvE49zGn7RNn5g0r
	wKbTyGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYg-00000005sm0-13Gb;
	Tue, 02 Dec 2025 22:09:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYb-00000005si6-26X0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so45617695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713352; x=1765318152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=;
        b=gm0pyvttjn8x1dNDwcVzPjEfhtRUZBHOH+qhqK509UHn2SZJ+Ahs8z2EzQeI/7UYZv
         ujmN6v0fWZ1i5Uqf1S+86aIdHlPqkkUsRoVfUzagTmPHizwnROvasS9K/z3wfUzv86ob
         EtVBBc2SySjj9kxEZ0yIJED/78ECgIER1qpeqEKCQ9izGP0a+mXJEQsO3Co2p90j33gp
         /EZZCy7pyCezUf14glw1qsKOjZNvUYGe/5lkqQQz19RSC/56BWopyPm8+i5s3HAKJEs4
         OQu7q4Or6WRx1psqPmKBOpC2JNWQA/bb0f/6ZR/GWd7CsXh4RxjkAswklKLwEp71zxtM
         tedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713352; x=1765318152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=;
        b=dFES0N7ijZWtA9ow6AV6Zj6+HHFij7hxTQIANVtkbVD2yMVAqdImGUoYVQV39bTBb2
         pcYiynu71jFvA48r8YS1TrOyIFwwNCWGaWATNlK7AGXfE9aklu7f76vNr+wZdWsNPzt7
         11lABLNOsOCR9/jYK2gQsVxNlfmNk2lfFGqDdS7CX1bKxODURnccG6mmeq3C8HGldZyu
         BRPjIe66QDMSdQp73q/nacOy2PUhScWE60c1DUdG05rNbFuf8iVHcM3hO62SFJcqC276
         d4yE5MvmkS3pQ2iC7iGcsStMlM3QWCC3OQmBo+ZD97mWlob5w5yBl6eTCDsm0rv+sBYO
         YUMw==
X-Forwarded-Encrypted: i=1; AJvYcCVswvzDg+AZ8+/QnsDwlw2N1avA5Tfecc2CAjt/rp/vBmgO8h1RGS1Qrf5sa3dfDsX2QbANAV3fUprnxuJIadOm@lists.infradead.org
X-Gm-Message-State: AOJu0YwCMNFsF2AdbYoX6d6WJwPoUDurzzT4daT65esfpZXx/M+nhYYN
	xAAR4ieQJ7X+5te6TK+dv9oK8kDn/hCYi3OfiqN5alS/LfVNZv3ppD6Y
X-Gm-Gg: ASbGncs9xFbDPw8I1z+oSrcXIoz5BJypyYVnDAiZq0rwitrj2EC6i1Ct5FK/iel9+iJ
	xiMgMM9zYnRI7XfDy+jh5A8uXy0DAWSW2LvlVqF95c0B1J0bLjfHD3GkcPBqsjorPL7kKrlE5fM
	7hmaOoroJ4AKhewL1Bz+H3VtMY7ysiAAz789qfBXr7Y3uxmG36WMm3xgKoyioE6i/1M3YK7G0Mx
	9wZrpquuB7IX21pDIiOnrsiWkEZHtaOZ21AMEmTR1vXsyHrUoPSN3s80jGa2+6QUbQIC53x+05B
	Zo6N8BTU8WPw7//tZq4OthARFTlDcZxuonOO6eo3zwa8CUjh3n9CEr1SbeGO0ZyWJBe8KIvZ8op
	VbWsI08TTlAC9RKS3PbEwSlrxcq8JrOfx4MhO/YLsN18zaHq+ca0GPOajTRZQUqFL7eNY364gUk
	3Ue24ESJ/AuFkzk+32DHGp3s93wQ==
X-Google-Smtp-Source: AGHT+IGcYut1avBJ0RhbMsqBzps8Zu+UKnCF1K3gVzlO2l/t9Cn0eEwJtq7isEezD+hqY4z1vphezA==
X-Received: by 2002:a05:600c:4448:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-4792af327d1mr1552995e9.18.1764713351773;
        Tue, 02 Dec 2025 14:09:11 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:11 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:46 +0100
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-1-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=992;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=frdAO3Hz729tIcyTYD7GFdGupWOs08m0/yUdMpYeKN4=;
 b=bWwx0WQbvPFn66LUG5ddmc7Hwf45SFYXRstCUIQZC9ScvBFH0x52snjIbVMGVjU64S8Gb/bg6
 bN2AIKBcVPfD2MyQzbytFb6AwnsG583uqQYdSOrRwSaJV7lodfJHo0/
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140913_560551_823BEFC7 
X-CRM114-Status: GOOD (  10.43  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- None
Changes in v3:
- Added missing Acked-by from Krzysztof
Changes in v4:
- None
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


