Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839C6F364BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTpdJiWpctaBz8EDwKAMUDhRQ5r/ZSbqFZcd3xgdw3U=; b=rmwcDdJujXAUwWi868xpQsmbZT
	Ft60WT89yWP6wJ3TM8zpb3Ce1bqJwgaYywTfuX5ohhLedEVqebMpT2ocy7qajzpxSwJD82zmAqxKc
	SsVbg6oc1jbanVfIybk818Gqcyw+ULzMAkBPdHes/C4ytWcELf6mAP5U0MLCOhaCjWWjJpZk9G3Sh
	lzjo56reqaxeUeOuZW/YPTUzq8ACp3g0wPCfgDN7zDTao2iXOwtf6zsRL6IlCczPXMWlJH6Nzecjy
	i+ZVixEvIXxHg+i4C3Siqvp2yyHmlDdXufWyZyH+MOrZZvrjFWA25HCmrG8deBDKgZsS8LF/BpXGz
	IayMqi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmS-0000000BE70-1oyq;
	Thu, 09 Apr 2026 21:19:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmO-0000000BE5S-3WaS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:19:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso10685125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769551; x=1776374351; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTpdJiWpctaBz8EDwKAMUDhRQ5r/ZSbqFZcd3xgdw3U=;
        b=QfEKfbgR8TUX0ownW3smZQxwkTyHc4yeYWEGRCea9XzCwLzt6cNhDpkFZV2VRjrLRZ
         2rJvQ5TSs0OGVEbc+N/43OUQecdhvT9+Py6WF82s43PLmdyno7vwbkkrt5FUJnQjGHjL
         iPngwPOjc5LlcgpWGrIKMin6VbsJLJzfBBvTNLjJGbCGzTuwQxpcY6oZQXn6TuC/beH7
         xvyKgIezR2s84bUuh7oS3rwzJaipbvX5gy4W0ws3NYkRG3XjE5mPlmPakE0qr9rrujc0
         zakY2v5Iq55P0gfvin7c4tixSz2tPJIy3ZF2Rg0O7GEvJCDky9M6AfUaipkRAbjtR8dE
         Z7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769551; x=1776374351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTpdJiWpctaBz8EDwKAMUDhRQ5r/ZSbqFZcd3xgdw3U=;
        b=gtocIUKPDvTrYm9vCP2QN+SqI5WKeI1z8B6RWkymlNAy2WNPzfm6oDxSU4eo9C7flX
         APWK5vyUaljYRE1N9fS0AIQ10Re1l2emFyz+1eo5nqZ500qhE0qiZYtPc2KXmKjjeCrF
         iApc586xNvm7JHVctpiCJay3R3R9lani8Kc+O+ezRjTGOfXsTSPCiJfM01tNsBHzC7fn
         H3CUAoy5Q8HafaBpIgLls5e3KG3dTmiAQQmfB3DmqNOiMgJmmkIeMLvxGw8xXNTMKkQk
         DDc+VEpFWfzaWo9tJXHdgwsCV2JBQfIAaf8RWgFNLMPcIJotXM2vCrjnyv2lHyi8AbVD
         KDXQ==
X-Gm-Message-State: AOJu0Yy2wwz7fLUB9t0JSPWVG7xTkyfTocK3nzZM9PLfiQCCDw+sa6ey
	YQgfk+rqPqPvebhIhSfjKygawWz9s7j0Fd0ix3d9QB6Tn6+MREk0gNyJ3kXpEhhuG/Y=
X-Gm-Gg: AeBDieulrel8pQhVbdIyDeTWjNCwwanUKrqyqWcwnW+Q0rxcQOgB0/A+1Zwk6d8H6uL
	YOGsA6LzK9oXL+CXrifDXJ95KoJKO45V+pfY+XQ1f+Hy3PTNeSWbUVGHUr2pot4dfLWOeog/Acv
	4hx3hrhitjaDmxmwpiOTII6wZhbR9/HdbKJlngJsgIqElmgOkIGnpeoaX2QSUJfoDJaO1ZWTgZ7
	T4e3g3y5LdYq/y04wymj4SwsuHbbdbX6rIQ1zQfeqFatb3HnczSCKSOnm24HRtNSTYV++RKstvG
	65Jq6gDP92anMXm+wvftqMvBg/16uDxdvj+3At4iWyGoJC/0cw+liyXiWM11HZwfytiNnMyTF92
	zj/v1yskpwWWnji36/THXyeeUuG+Xk+8N6wM/KPHeJDGNb1qn4FdnCqxDwS+6T1sVISXDZXzUKl
	DQMwWQZwVU7uWOrvTNLEL28cB8JhQcBXBOo6zZN1rtL7f+VLce0jtF8GBLviac9y9ODjqTznDDT
	+oCAitYXCaOC/HqkrWMj6k=
X-Received: by 2002:a05:600c:8883:b0:488:9e54:94c8 with SMTP id 5b1f17b1804b1-488d689cf93mr3393895e9.31.1775769550767;
        Thu, 09 Apr 2026 14:19:10 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:24 +0200
Subject: [PATCH 1/4] arm64: dts: marvell: samsung-coreprimevelte: Increase
 touchscreen voltage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=ndFclFFjoYoUngHB8O00J2Z5yd0XN5xq+j1JCK5Rmzc=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/e7XDgv0uXP3Pd93n5f/6fs749WXBBeiXXraDSl
 pd3fzW87ihlYRDjYpAVU2RhXip3iS81fKJDkW0SzBxWJpAhDFycAjCRk2yMDLO/lNuyZ261EdGT
 VMo2XHxPsDeXe/p/658ir+7G7oxK+cHIsO7EqpCNohYddxnv1vY2x9W9yux6NM38/7OzySu+35d
 S5AMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_141912_897500_ED50D8E0 
X-CRM114-Status: GOOD (  11.70  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The old 1.9V setting was found to be insufficient in certain
environments (in my case cold ones), causing the touchscreen to register
ghost touches and mostly ignore actual touches. Increase the voltage to
2.5V to correct the issue.

Fixes: ec958b5b18c8 ("arm64: dts: samsung,coreprimevelte: add touchscreen")
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b2ce5edd9c6a..bb0a99399624 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -460,7 +460,7 @@ pmic@30 {
 
 		regulators {
 			ldo2: ldo2 {
-				regulator-min-microvolt = <1900000>;
+				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3100000>;
 			};
 

-- 
2.53.0


