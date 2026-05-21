Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7244CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRbrNVL6NB/TaXW8v79sMJA8urvaGBAFet012ki4EYI=; b=r2n4L6RgJwZViP/Fc5IvCFfzYr
	gYvD5jjyYIxER8rMDBs5D8UUZRMmZfeon3mXWdg01Ci5goe2QiSbS4PJXM+2xdc9Rq4/R9MQfLmRR
	LFDkXiI0WhKxTAVhGF+EDv+oI14/uXeHQvRUM0N+DkF+UHT5I/AQVgurRIm8Sk6dZd50coui1gwg3
	xYXVQd5pvqMfa0crX0WK0EUKGmLaPwaDN5rR2sYK/mOHEpxRJiB4IfJPPLwVm1vvCRAOQ6VuZ4f/w
	/tLnPlDyFrBl0cj0+GOWDWcAFERJ8dNNVerP1hMVoMZdnIUJgDxZXVC1zRxQV2wBWxpLF9bvN6iZi
	spAjozwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tV-00000008DLM-1ytj;
	Thu, 21 May 2026 15:01:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tT-00000008DJf-1Ceo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44c350a5b87so3861953f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375661; x=1779980461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRbrNVL6NB/TaXW8v79sMJA8urvaGBAFet012ki4EYI=;
        b=mpA+BGu+uw6xH4c9KtTNlQDv60i5XQ/3kBFMXmGK13t3y2/H4Drjygog6KWmp0of48
         fpay7yKWB2RyWQqSEEkQOdr9EIvsbhoe8ipxU1OlLmBdg6BBQsapC3Vt2gtJMN9zPOOP
         naaRZdsXcERaZFP6ubl5h2AaEYXMNYTl2UnC3J+swiCRetCea7tAeJtXiWqACRJxK57w
         TyypwDCNGkdu30IGhxzXYns/Nh/DA263p8wQFJ6CfnS+GvXwGIqmt780YiDB3EP4euuN
         5otcq5faG0+6PS7KL2+g/JhiXq+CCq7xylLip8kNX19CEO/k28xh1cN3H1+u3MI7q/H2
         q4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375661; x=1779980461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRbrNVL6NB/TaXW8v79sMJA8urvaGBAFet012ki4EYI=;
        b=VFdYWESGk0uYDbJ869C1gwRARUghhfHh1i36L+x+7H8VHmi6GmPnSq8LbSE/oVMDLo
         E4i4IDPL4XeG3bMcWJ6T8yGrM13m1pnCcSEwqu/yE8mh+MU30mECg/XPhgeDDiOI/d9k
         dhQ5begUAjqyHXTb+N+FJ5b6UfBY9VxbGuZldrPfePWZlwvP7nQ+N0OSTPIeA7/sDRdj
         bV9WIK41qSfvU6spBaDDDmMul8NdG2XSJO0TZSf62bW+TpoyOblTlpUDNCin2aO+m3XY
         i7ktCyY4EvXOevHOdH2XUv+CaQZIwYGlw76ZM4LyZybXCqy7xbxQAC2pNBMnyd7rv3aq
         OycA==
X-Forwarded-Encrypted: i=1; AFNElJ+sILJsp6IPi6VER0j57c3bc+3mz/jZDFfPXEwM2tIQUDeGl4RMmSOtfG0gSwT8SE1BhRiAXgVs30ErweZEeq8l@lists.infradead.org
X-Gm-Message-State: AOJu0YzzZKuvurcwmOlNM4uMstPwGzcRp8+YstPSZvm5zPiy9UaEQ9SB
	XWxIbXG3BZskOoa3agJMJ5JHNVEGQGidQuW1uhB9bb5THLKdZ1SX8ux9qdb6jAIA
X-Gm-Gg: Acq92OFXstre0piPnb2HwEB1btOP583nkkKQlyhct+9Xx+qJk1KBn5KOIwgjwI62nYV
	IcXwCEdKOoaRG0M5kKpgutGnUcmK9QlO2t2/P0OzSGtwwc5/xQXi18YuHnW1ZaKEqvryaiZmMMO
	1+T4GG0FzC66bIH/H8jrWdiSpJXUjIX6E/uJlKph6isugucKmbl3bhOMNFH8L3TPHl5fU7zrg+1
	cRXUvUXPQs6T6YXiYmMGEfjNfbyUw8AWUpjGJx06PsC36fsMCeM5sDTSIVSNo3NanFY6fHfKhXE
	Lv3/XH1E9p1cghy+pSSC4Wy8QhefQ2fP+G5B7/ltJaEr2+nHrFI8nQrfN8kRKKOSpNJ7A1/0vRW
	zLEZRfXL5fVdO3I5EclaNg3hiKuc80gmBZqu4XRAqOzKsqaatqWaTNbcCCpwq6HsK2T3HknuGcQ
	qXFBgTQBZks9bH35kyPY/bVRUxK1uQXXDhLhiZxLu1OQ==
X-Received: by 2002:a05:600c:8b18:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-4903609cf42mr52668395e9.22.1779375661077;
        Thu, 21 May 2026 08:01:01 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:00 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 01/15] dt-bindings: display: panel: Move Logic Technologies LT170410-2WHC to LVDS
Date: Thu, 21 May 2026 16:00:37 +0100
Message-ID: <20260521150038.103538-18-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080103_341557_42E7219D 
X-CRM114-Status: GOOD (  12.29  )
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

From: Vitor Soares <vitor.soares@toradex.com>

The Logic Technologies LT170410-2WHC is an LVDS panel, so move it to
the correct bindings file.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b31c67babaa8..9db96dd724b2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
+          - logictechno,lt170410-2whc
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d5..f7e09f5b1b5e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -206,8 +206,6 @@ properties:
       - logictechno,lt161010-2nhc
         # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
       - logictechno,lt161010-2nhr
-        # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
-      - logictechno,lt170410-2whc
         # Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
       - logictechno,lttd800480070-l2rt
         # Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
-- 
2.54.0


