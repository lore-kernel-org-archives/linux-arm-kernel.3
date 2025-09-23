Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F7BCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=; b=47kwOHJoL7Y6n7g+8fVMr9vppi
	nSQaBfa9pvwdNHS/otv6USHc2negZpht0hStPRZQSBCAIRpuIeKsIeVde24+NdNs3w0lPu+96skyj
	d1MzGYlysKUcA3B4NC5zzTeaG6dmIUgA0gfr5cMObHuIDShivdNQHkwH6vUeU4dkMzbFS5Dry9P53
	ExFRzz4GR+1DzNKXyyi1+BPkQnGw36xXU08BP+k3EBgh8UAF3wFMQhE52VavUrm+6gVzn0jDGv0Zm
	I1M/IdJVY5Q8U4IOS7s7+RFP8SW2RPgvkX1fM8qSxLYxPw5yCuH3Y+EcPbd6nDRCsoJctELeN6RpJ
	jm0juAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v189B-0000000EZy9-2hya;
	Tue, 23 Sep 2025 18:53:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1899-0000000EZww-1xAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 18:53:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso37746965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653629; x=1759258429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=;
        b=CU6FI1stYFqX80BdwofGPmJOuQPBWYEK3qVsQgwRuU0IkH6XPonb9AEKzrx+2JIXcW
         IMH8nDY1cM+1T4iVf8UllzzGE3eyEeTwgK6CBgjcPSRy9CdS49oIKBtf2Sl7b+1J/2oR
         T1z2dw5xeQ9eYNLMV5PR598uXHaS7rbFQAfJuFkhQBohQ8Lg83il4ccE2Q8zTOfF604o
         hMZdTYG6yBoMIUbJw2O56Cj12fPwIXvk9SjijgrvRrfeg8FdQ9E605bMDQNDt2ylLUpt
         my/zdD2g15Q0CDh4/kf6iKHQPhtsi3F72k+QCF+3AlIVg8KxdKMLZUL4hhrEngq/tlYz
         lazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653629; x=1759258429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=;
        b=HUJcfCAGyzCzXOcRGTOIvCArHvXmKP7WLFuK7DRg4kIzXAzYQKlKpWcqfLF+k2Vu4T
         gpPQHprKTBAJiBkNW1gcZ8kWgn/zvmirB9GBzUp+dMtAvIHA9LNwp7TOKsH/CoFKFUa6
         BxSzVxOEeXypqRfk1twkD+SW/TQkoPxh+ntmADTXJB1+0Pj/YzvBKL8Lhhip6gzO4Oto
         1roZOiYTa6M8oLECdLwGbMbNw/0YBaadtsKltv1SxOFIs2m5SJUQv7vrcc1KJ7N3SFEt
         UqJH3WNnhEA0gA5xgqeNAwfeFWLmlWH51vFzxev+aMsx7lBQLnoxoi03pDOySFIFHPro
         jueg==
X-Forwarded-Encrypted: i=1; AJvYcCW5LF1tbXtLikQ7tdUTdK4GAc5l0ZVxsLDfExKSrjtdLIaPi7EFzNvHDn3kH9aE9Ve9edBl4315r/c0psfeT4v8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9DVHPLraqRwE3vR62XYzY38sGwxcxXatQBAW1wFIUlLdBDd6A
	2FXRpe06bjpVyMbI3PMEvFKWm3wwyc265zycDrAdZmVu04h5oZowLX4f
X-Gm-Gg: ASbGncvv6w1DLa1D9D+4jRLpyJCskpz8rrP5mTIAh8h/tB04MEOTtfw6Yj8SBFSbx80
	I8bBR+zUiBE9WoTrggPtBbSczIXZ7X54VUrZ9KH5pJnNEegL65eYSzM0HnFL/SSQ83rsXe04Zt/
	qHMaBbckX4XuT0GqV7hfrqhzNakZtmil3mCEi8V4bVJV1MwOoatteN0p5zwub0i6a7sIN8Cp/Z5
	5dGOnPu1j70iwmq4MRHvxXKo9E4YwIRKCxgb8x86BZEeAceebAW/rLRDdfFKEvsKKidUN2mZbNv
	zLb42ZiHQK0i3ShBw4UkqGiC90ZYOPP0NnJDrJo0ZwBYWGwnXSZi4Z4nyXVEPiRaOhg6OzKxAWt
	f5bRT8c0pISR79VVP3v1FdyVqlo61xl7NRzFu7CPNjzpjh79iPTmKE2VTQiPeCX86KF5XreiAGt
	zACneTaA==
X-Google-Smtp-Source: AGHT+IGKjgQQvlEa+A94efi/b5b4nbfk7G0qwnMnOukLmIKhoBHDXNsNeAGIWOJr8BOP+8/JH7HY5A==
X-Received: by 2002:a05:600c:4fcb:b0:458:bf0a:6061 with SMTP id 5b1f17b1804b1-46e1dab51fdmr45625665e9.24.1758653629107;
        Tue, 23 Sep 2025 11:53:49 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm295014655e9.23.2025.09.23.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:53:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Tue, 23 Sep 2025 20:53:34 +0200
Message-ID: <20250923185340.21526-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_115351_509060_94BDE640 
X-CRM114-Status: GOOD (  10.44  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Follow alphabetical order

 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


