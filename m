Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D388105F7A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX6awnM4LP0GNDRiHh+rtw/bMTX5xX0dYocQAg/Nrfk=; b=R9iYOgEfxhZLglg5skYpJOgbwM
	oudnesD63r+WJIhIlRDgIue4awSb3We35XIgw2XdBUuk6Q3p7ZptgrewEnJ3B3e/ui/zewGUjQetc
	6uCoXdnDAGCwJegYkDI4ztHr1F3NLfK7dzGQaUqUYI7j8Vq4IdP90QioiMrnH2ONDJTYbkeuoubwM
	ggjguYc3HCGlvS1V8rg2fv2bYrjyWcgZn92Bq5ftSN7ZL3ssCLxTfLpSI92IjMP5JdgivRt4DO6GI
	vnefwrMhiBmuUscnwdUXL2XZ4GJv/XOJBIcwyqW+DmVsMmjY2Cfw0QIgzAC9qFmJNnGfDwIvE4HY6
	Lef3T2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Ia-00000000BRk-271d;
	Fri, 13 Mar 2026 13:11:31 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12IX-00000000BOb-2Mny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:11:26 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso3337431eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407485; x=1774012285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX6awnM4LP0GNDRiHh+rtw/bMTX5xX0dYocQAg/Nrfk=;
        b=OUOoKCl6XpHTf0JUx1q+denra5TSQ/R9MhU901aCJLjOt5qHyRn9EDkznxmHCqBiAt
         s0hJ6HVIZYmBCfDm/61WELsKfTKanh+3KKeLEb0NcWdIpQYv17Hr45Fm9snW8FePcQto
         4FlA/BLyPVz0AemSN4kNiP7gmzXJdIQyDZUcfN1XyqOz92NA9ueV+BDkGEOCo2evdJ0s
         PbHKLJHofurU/CuwRN3XTD7Ltf4aGIBeb2F7erLsWpoonZnwsins0by5OqLXnT+FEHgp
         vIpfbHEfPx2tl/3gh6XCqeIlGaGJ3G3nyG4hZHRukrvEMr/X6zzm56tNhAMYS6fmm50d
         KqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407485; x=1774012285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dX6awnM4LP0GNDRiHh+rtw/bMTX5xX0dYocQAg/Nrfk=;
        b=KhklzlXho1z6xiteR2xvJNK3bM90iJ2gwITCUHQ7g9JSjqya4VZJpkl07Mf1jlOqkX
         3AjDOpjrCPAf4ujRu7CbXiC+alB/ikFDB286yRMl0UapJwaXwbUanOuB4/F+AABGH0i0
         Oe+kdeXiUnSBtqxhd6KE7YEMB2TraVdqDFsbxiii+HsvGmiTM2vchgctwJM/cQJV182V
         9Ge4RHIxVAbDjMKWS3xiPRJ0+UZ/XsLVkHNlC42Z6xr5O4Xy6bxbZDBW+lKFGnXjaTW9
         srrFo6xy3QmvhAOEsOkNEg4/eD5E52Xe2ulYCDWiqLA5Gc3q/VI1jt2h1B+IatlRqnC4
         /SWA==
X-Forwarded-Encrypted: i=1; AJvYcCWI08nmF3zgUIfybziskt3M12hZOv1WnwnkiJdiz4XcJ/LpafhQFU/OAhxAGKx9H5khJ+5aCPWgFNc1TUdU1b60@lists.infradead.org
X-Gm-Message-State: AOJu0YyizostxGqvhqPZYz6IGiUmUESyRhKjh1S8lmWRW8UmI2HVTjUi
	GHesz/UzfwaMZRkDJUt+V37EgFb0kvYD5uRlzjUb9ElYMehvR0FpvwPy
X-Gm-Gg: ATEYQzzcvuT7wNB+vb2/MDk266DzRdsj3NnOP13gw44UKxNXrfiXyiP0RNgjiK2mbiE
	TQO5sSscNcKWeGfcR9KUvF7tTdZ0Ge/Ia5qUqon+HbXMAEwpN095wmXfsi7vh/cRFjnHcY0de9w
	w6namjiQMtu01ceD7cliuNXfDDlqyhtcIsFHwfgIabFpsdzd14rpvhFiOE2joewUSsNrwGLdnrr
	qChKMco0M0JG6udclfkF94FHbQ1rcTbZIvjAY3/Rz0orSvai+ynhf1Gs4OwvxYnodIUPFZrABGe
	L80Hgf7praS5AYbKzviTlgA+2JRaJZjHXZATc89gPz6tKe97SX49mOq9nxuCoCRMEEpCnHCn0n6
	i3KZ7OWA8ZewwLm2WbGy9aMps15rX6zqkeHqNJihOjjmpI4M/DFjJnWrqQ9+RZ9UIHzjAIet/DG
	tE2Eb2CN95wQ/Ki46H/E3ox+eGZL7I15lLn+yH6k4t2fFFIbPyc8eZORxEYKLiruGqshE5lFG11
	L8x
X-Received: by 2002:a05:7300:e887:b0:2a4:3593:c7d3 with SMTP id 5a478bee46e88-2bea54ff553mr1560973eec.19.1773407484713;
        Fri, 13 Mar 2026 06:11:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:b6b5:4:db6e:9a2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5702e5sm2602315eec.29.2026.03.13.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:11:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Fabio Estevam <festevam@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
Date: Fri, 13 Mar 2026 10:10:57 -0300
Message-ID: <20260313131058.708361-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313131058.708361-1-festevam@gmail.com>
References: <20260313131058.708361-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061125_730772_D27C8B51 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Fabio Estevam <festevam@nabladev.com>

Onion Omega4 board is a board based on the RV1103B SoC.

Document its compatible.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v6:
- None.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 91a387621bcb..1e5be6c809fb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -808,6 +808,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion Omega4 Evaluation board
+        items:
+          - const: onion,omega4-evb
+          - const: onion,omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.43.0


