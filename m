Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EB5FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=; b=HwIMlQ6ES1r3QQxqTXwb+Lb92a
	IW3BcImkKrbxZfRpUrIxPKXiEgknkNSKC8259OEBjok7ybQ8Jh472mXJCTgXRzQw469B7CWA2FXan
	UzdQxCVVd/mRc9iAxdFFrQw/2vd6o0uBrhM85r/8mSuu1/3GFLlrgUm0gp0EoaG/8ENjO7kUSUFwJ
	6j1SVjtUxyzJPgomR0nnmFXwI88kmspMMyUU1TLKMIir26IFXz645R2EEh9dPidLzbRpvZOowOrrj
	8TZT9PaO4KDGhRsGH0CSXmkwgTK7U1A5Vw0ItD4IwdaPB7QJEt1beBOkoPT3vELVWFruj2n6FQeDF
	sGxN76mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yq2-0000000711d-0twN;
	Tue, 17 Mar 2026 18:08:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ypx-000000070y9-4AO6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso6001763f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770892; x=1774375692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=ChIR8dr4tlaOi21hA4haDy/R2ogFU+C/s+Ryy3xINx5iXhwJw5C2jQVu+2ZqbydvTL
         f/Mz/r/MmVuzonNuDA3wZQpGwiY7hHWe262vDbu45pDP7E0X4OzILr8KVw1cOOcTjAZ+
         Acz7HRQqrQxi4Le0Smp1ShrmlBD1saSa/7Ma+dBxkQhe+6/1tn/54uU6anMmWI1oTQkV
         pTnTJQFJIOvKvDYPSNsAreVBvnWD65/xfKxJl87MSriD8ifqWr4s/ks8BAohRGji9ffU
         JeltDKODow+tFsb9kLX1lgih58KGg1eCSJvCr+ux/znmX2/YF756QezrVN5bjt4qRy2e
         cT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770892; x=1774375692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=m4RwSvtm0OE70pJi2rK7dyWPF5+IAR1YUN0B2mTLV481+C+3FFdNu6q3ZSNqdbybT1
         yHeHR42I/czA/L2heOoo5WuGb+A+Ms/37MK/3+fY5bQoEPtBany+iL9/zNQnbWqiOxXI
         ME3IWs6YWCl7iVzVU1uK+HdKI6dslwYr2MtK5clJzjXqn0RoHSY7eD1boKiV3ATUM8lM
         HvqhYg2ZKZOSJRNUxUeCEWyCLtDDbtCGnDlstMGU7TLwxvZ+YSNMfGSNsOKyag/73I3O
         mNVDNbtLGUE4XHy/fO/o9weq0IzWu92lHanV/bY+u0kf8J6K1cinSVs7FlBHRL582V+t
         jM1w==
X-Forwarded-Encrypted: i=1; AJvYcCXH/Ej/ZFOvUvGOBwN7l2lgUr5gta51iwAtrSA3sF2ksfR1PvqmziHxoDR61GZgDZwzt+o3BTXCzaDU0fTS9cHs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx30qICA+OdHoAowITzDa3M2MvGKvVI6DGBfM17LxWNxyNQBCdb
	DXAggGqBLuwGtq5sb0EtPGksgScm9U/64cJKAjegTHl1ZU4SI/hHetZ9DBiyjAva1lU=
X-Gm-Gg: ATEYQzwcmSNpRFf7iHMwnIN3a7i2WCEabGFAI8YWn5dnUh74SZ+rWYjGLjmTWpcIlEz
	9OqHISewuzbXaQaORrfH+H97rvkD75cOOQY80poQ72DXT4FUfjApagsf15aR744VQi1kxbVkuaK
	adS9cZRWB/LbvgQh9HVISZ4KJyttxYVUX5kVp5QtajM8anzD3Fq/3fLq8uv6Oz/f1/BnEzPT6XA
	4PvFF861XrvAr0GJafebHER6yJBr9xTBDbaSd1VugVpa79BFA63cKVLXHXsZvdw0axlqJuLSJDx
	WEeJYLm3B7rElTi6lYyY2dzmjcJOJ46VYjVYHpSvOQprJLwC/OgiyHEQkEOMTHUhqIb8ZklAcfl
	yZM+y3elzk+480wT7OIDtIsSTfTyZuL208UZwvLCG0yfsGRfax9NZM/2Zj073CbF7i8ok73pUIj
	gHqc1En1NMMieI+zZ9CDWGVbtIGTSBddkv0bXutt6AfzJqx8eSBlbQxmBbV1hWnC5YqESQp5mJ6
	+yptvNnDYRelwVW
X-Received: by 2002:a05:6000:608:b0:43b:447a:11a6 with SMTP id ffacd0b85a97d-43b527a0871mr372127f8f.8.1773770892007;
        Tue, 17 Mar 2026 11:08:12 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:11 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:07:58 +0400
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-1-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=alchark@flipper.net;
 h=from:subject:message-id; bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNGWxX9hHu/TwgdqBXVCqw4uu3hAfLto+YSe6Y4V/
 iZeR0tOdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVdVEM/0NfeRv6vWLZMTvtw74F/0IO1V7YEBDr9utKA/e3c/67I30Z/oesDEj
 NE718LvnIupknltQoM00srGFWk8jRvWsp1/pEjxMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110814_072427_56CBE13F 
X-CRM114-Status: UNSURE (   8.51  )
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

Hynetek Semiconductor Co., Ltd. focuses on intelligent energy control
technology, mainly for the intelligent fast charging and digital energy
fields.

Link: https://en.hynetek.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5a806faf7170..3ffb1a8e24af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -747,6 +747,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynetek,.*":
+    description: Hynetek Semiconductor Co., Ltd.
   "^hynitron,.*":
     description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":

-- 
2.52.0


