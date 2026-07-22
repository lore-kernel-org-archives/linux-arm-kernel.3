Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC0C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=; b=MfRaIeV7dhf46zEAbg+xVisrv/
	2cqSnSTAkqe3DnF6UBP7cUyXfe4qeEOg6Y6q6gBRvQrlxwAuaP9RJMaOrfu8txm0GP7p2A22kdeya
	IqHiTiCHU9HTvJdnlj2TU7RFVVzgHZcCRXdW1WTXo/DEEPJXILVA7IF7iwKIDfmTxi6wW93WESD26
	925uWdmxBYzADVtQHrjBG7237fiVjr4gP4HDy1CE9gJ+i62Ot0Mom1bOgMT2+ocfrBAsEdVXIX6No
	61UXqfIfhcL+RxOecGYzglXgdlsHEdKMOe/PkSJAiKUvST+vK/nKQ7upp/gK3lYtXbWfkTw9aE/IU
	hx+jawVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgUE-0000000CxTq-0D7Q;
	Wed, 22 Jul 2026 23:36:26 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU5-0000000CxRL-0oVg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:36:18 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81eaf3709b4so706297b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763376; x=1785368176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=R2eUcDT4ViFuBM/uYkSXCrLaEypTg6ZrmmQnWh9E/CwpPrg6z/zac2BzYZnt7k5jbN
         ljtvlyzhzTrr+7QsTu39j+mmb9Acr6q2GCQhSiMkjqIIjk8E1TbjUyvD/E4NXkTy6vyP
         H5imKh8GWMjeNDaXQfg03YugslbRUYEUkyhIvQ+l7X0J66zsD9xh6vkc15jEI3v0dxYh
         sUQNCkHlmUbW6Syt+jwTTzRYRk2RvMRVYu1wZoyDpVv8n3VZeixwbvOYzmTkqNXACNn5
         tQh6ZZcAURQxiuUbAPRrvlaaiqPkr42qWzsBM45OwOahqwwSwYtTcAnRN4BhgbJGiFWp
         UbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763376; x=1785368176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=npeW3q8lNpj1pH/GevrXb4tV3TiUptbRCjMCFQbp3YsL8hxGXbF1ChDUO2Krs7JTyV
         Bg915uiOEcp72bOy07PeUm3H45mNdrS06LLvOAdTAsljw97amZM6zJeLyRe9pdRnqfbm
         6H/QrNeK3NlZK5d0SBtOJBPXhIO/GB4ypZENCXXBdkP4GWvMkQv5pwCRckbv8+TDnrBz
         QCK+AMmUKloMj6oAu7aGc+ADwnnTNrqCWGxnKYqOix0WI5oPybvpDOMt2mC7mSE6nKnB
         nP6xVKBeHuqRoBSbxENsjtdFbfq4NbhLlDphqJjCMvZmFYrRQ17O5I9JKQ593ccPA0UX
         nFDg==
X-Forwarded-Encrypted: i=1; AHgh+RoX4C4B9sS6jgCOKL1yDUKJKfw2ry88I9VqUgAwbKvN3BqcGuCuV9ISBIHCdp30IIRXIWJuj2dGJ+Dx1+SPOcpV@lists.infradead.org
X-Gm-Message-State: AOJu0YyvSmf6ZeCTElFQZo1U/0xQ1fm9k40iD/hgqezyI7NJO9G8Nrk7
	gL3YPLmzDxDXXS29lJyekq855kw8H2oULb+p51j6WpHjyqAG08E96TQb
X-Gm-Gg: AR+sD11EMrjxGc4PblhOcbkyFmlCTk6XUCs2GmYpoRtjyulXsX8D61VAoFkA55r2eM7
	a3w4OM/khhsE8eeDiKUPR0yj+s0+BEUc4v1AnsrTM7quinhg+a8J4Qr/4qJJ/qsXNWl8Lwrg3/h
	X7yalMlG4OaF/CMmjl/IUkLPLMUuvgWxGgWLyBsUg66tuA7fLdymfx8MjAOI3LK9IkLB9+vh9Ug
	16WYJjZUi58sBCCfmBcfNX7Gqse9kk9edM/r4EDyOnabXd9LCZDlQJHZvfUNPIeGXN2TKzxBHTJ
	4M8292h4eOoZSzHakspgX5NX0yXeKeCrqjvr6ivxXecgrobmOeNawkmG6Vw7S5F+ofMo+YipB07
	wZZlEXbP2XtdQT9gFQC1Ce/Lf1dKId6yCcToFdM6scRsIGluu90UPeZGaZ09zH1NkVjztFPO3Tr
	8Wn5tCO4WPVGVhvVgEpj0YNRMVefWm6VRMRnq9xiy0UpzRMhY=
X-Received: by 2002:a05:690c:6b81:b0:80d:e214:c2bc with SMTP id 00721157ae682-81f4c2a96bfmr2265757b3.35.1784763376007;
        Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 19:36:01 -0400
Message-ID: <20260722233604.3001063-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163617_485041_47E4528F 
X-CRM114-Status: GOOD (  12.43  )
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

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0


