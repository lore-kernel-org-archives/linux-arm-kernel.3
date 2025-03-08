Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C6BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=; b=XxLUxAfTlwUsbo/L9pTPL37EWR
	n2xBLSr65jz9OdgVOpoHbrdA1PuEvFe9XaC0gOX+XXkkBb8LRvGXxZDdBkz2I1OKpqI7J8MqXqOXC
	gl0YUnXY6yGlj3iYHXPVeHFOHGpiPD+nCYV9INxs0rbgtVjf4IAbE4KMc19wAaV5e4oRC/SK1ctMX
	EqMLaubFDGKRwjCvWFNGiC59i/UjaoM/kKjV0Y9yPuL7qEkjcyuI+l+yNRRMb3jJQ1JzrnRRkuhro
	0Gxw/c4QlgiB5W5L6DWB6lTX+v/W+PmX5RTSRkLUKAiySsHVf/BLE1lUNeIC72uKC8gK6xJQXTjzR
	H7v9UQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzMj-0000000H3zp-0dT8;
	Sat, 08 Mar 2025 18:57:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz14-0000000H0MT-37GO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab78e6edb99so447388966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458917; x=1742063717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=JPQIeb6cfJTUk9kU1766At7g5roIKjJOnWRLrUZQ0PVlzDdl1bAG8vdi8Id8CAU/R8
         UVMdBwVMAOrsWy44SNNmJdiuGk+xI+7XzXQ377GPAGCH4lPvXA6FH8hJtCZ5PywIAy6E
         6P7+E6UfKaB5uYNH2cwQOZtfsIJ7fskqphzXlGEM3WOZRq1z6EUGhua9EEY3tUVQYAzg
         71e8BfqUzPOXesFpZam8vnHS7Jg/LqNlFJCxdfUtDB0b4OfYth+q/LUXIQ+Rl6A0imJa
         RHM0OrdPpryr3OCzp5yZS5vmJDpVb5V1NFj+yxY5uNxQpt4leeAiDZcWRPoNBpkmOTQY
         DUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458917; x=1742063717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=K/G27QBUuDeRvF60WyTIn34ZqGSsL8Ylpo5Cxcaj2ofAoBFVoc8J7DsJwsr2uMKzdC
         kNqFz0IybAwx9OPLsMLmT5A7WXYpD8CibYaDlCDhOZWZY85bbqbHnrmmxYVvRi87I1EQ
         +SIhlU6XlbprZnal3bQ5LZDAQov+rnQonTLWIMpLdUEjNLa0Iw5OHL1NSq3ymFyR/5do
         xH5EQcWpZHrpD4a3QR9CHsbB6CaxefFQl19hwbgAIjnJ9es7+Z7bKhrAoCE1K8QaArb1
         Apz+5uGFFWUdC1a8fbegqQjQ9WWSNE9O39JmBGLG6Yfi7ISlEeENRGNbKnRxPUdIoxrw
         9ZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJsSxAOsFsbDzUzleqMROCdapEuLi6Z+Qe7sE6AJ2OFELu+4/u/Dy6kY6azUY+B8rBkH4y/FqC6Q3hmtzL4a6g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2R0X2/oXRITcpN4Kvj9UYDNNLGOp/LnjvpVW4tLDM88q0KHK7
	ItFL+AK9XFxcYBP+ebDKB/jmRv/FXLDLeH8Iy5lzBvfYWhkLhvyc
X-Gm-Gg: ASbGnctapbkggda72SoVmVW2+XSADK2ApU6K9/GWAgWScJvfejj7E2vZr1Fbau54vpj
	oc+ToQ5bbX8gqJqLAtkJjzAHewnChxrtdVKrItH6vnVkEgbQbGS9GhKxIpvI6eYoEVITMVPGgYI
	cotN92hXS5QAkYufCPwvM954NDs8j1m/7+1DxSpBTeern/1djnJuATjmVSiKV4/h+BYzrEXxcoZ
	Fz6rROlpNoixS08RAsV/u8w4T40gi/QBH4I6/4zV9EiTZRMvtU6P0lOvoOl0F/qxTLS/Ob9HhtF
	15F/l80i/8W90mUHBX9guvK+apkZcIFoW/GoGu99m2JRCh1eZg0K07C1cRUkXjwfgR4A
X-Google-Smtp-Source: AGHT+IFxa4QmBw7Ig6TbMkCdhDiwKrrIoEA173KNNedZZ1zvVFLBlc4GfcP9AWrjoYPa9kZijnAFSw==
X-Received: by 2002:a17:907:15d4:b0:ac1:fb27:d3b7 with SMTP id a640c23a62f3a-ac2527048a6mr603962566b.21.1741458917335;
        Sat, 08 Mar 2025 10:35:17 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:16 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 13/24] dt-bindings: media: i2c: max96714: add support for MAX96716A
Date: Sat,  8 Mar 2025 20:33:42 +0200
Message-ID: <20250308183410.3013996-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103518_779324_FF8A8B30 
X-CRM114-Status: GOOD (  12.28  )
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

MAX96716A is a newer variant of the MAX9296A which supports both pixel
and tunnel mode.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 9c6c79a770ed..d4055ecf673f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -25,12 +25,14 @@ description:
 
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
+  MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
       - const: maxim,max9296a
       - const: maxim,max96714f
+      - const: maxim,max96716a
       - items:
           - enum:
               - maxim,max96714
@@ -136,12 +138,31 @@ allOf:
                     min: 0
                     max: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: maxim,max96716a
+    then:
+      properties:
+        i2c-mux:
+          $ref: /schemas/i2c/i2c-mux.yaml#
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96716a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1


