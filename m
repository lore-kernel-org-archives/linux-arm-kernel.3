Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B7ECAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+B9+WNcUf/SiLJEas3IyGzNh/XuKBSyoIl4DxHdrSg=; b=4wq/lLBPwRFfIKqrXwPfbl3gth
	C7E4Llrpkl7iTZajSrkjc+fD9xNNMYpZ8bJyhmIxBscEc5Enk9oLLqV2P0RUtTRphfvSZIoVAyjxn
	cDJBiIy11E1mPJKjemV398eTQAbf/gx3Z/kwd3/OuAu0S5noKXVPBwGmjlL8C5VaUKjV0HZ8uPG0I
	cnDtL1iPXz46xPxNzVJY4WV2QpB9zqMV4zbtfQko452g/cqZyCehC7NP7YPc6VFCmvEI9H6o7mDHj
	XeR+42hI4YzuCYbIZkvrocbOWOXqyQeOGXbs3/XDodJGXzxr5xqd5YlxJWo0C3NpFmcw8ffLmZslD
	JdQipBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2R9L-00000008dJo-4AS1;
	Sat, 27 Sep 2025 09:23:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2R9K-00000008dHa-0AoH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 09:23:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-269639879c3so29038965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758965005; x=1759569805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+B9+WNcUf/SiLJEas3IyGzNh/XuKBSyoIl4DxHdrSg=;
        b=J8Uq+j8BS3jTsi16wwQbOrryPBFxEvHt58FaCLRJB3SvDQH9cWxGbPjyomaM2wlKwP
         cfCsH3APrFl02RCe8mhfFnu18RcvFpvN9fow48BFI37JlreTgwPHzeb0Kjkk7lA1HIXw
         zjXKa/YIAKrjvCkMCAGtdl9K40aFg3kEzUV0W4C31HihSY4CQSBsX5v7NE3Kfu0Sm4N3
         prJ0j3GtU91C1UGaMApnHuaK0JbWpAfO6lyuGCqTF26OTmFpnUdynnj6l7dT33NdrAdh
         +koAQVkeFLVS1K0Tb/BBB8Tqb/9+zCT8oLPJ4YZddVkcWd48VO+2FWKrBZ4xzfF5jhen
         rfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758965005; x=1759569805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+B9+WNcUf/SiLJEas3IyGzNh/XuKBSyoIl4DxHdrSg=;
        b=PZiHaTRzlorbsfmvDT+1qCjcu3gL/tGuYvTL3/91M3dsTTGANxN/AwxPegIPAZet5Y
         4WjSJLhgvcklMwk4AAY1CcCISKFsCXx7itew3lEgqo+PJTPoM54b86Ty0N3mSqoqsVR1
         KqJxSzLgLP1xcuwpvQVsHTiYpR5buk7ircW6fCmPsmlGFil/e+tDenWO6fCqBcH4yYfJ
         shp42d/WUULnP6tEJuWPoBRMrj/xttHoU33RbdDUhe3pMCB1rFFGnAmelxlxRhnCqtyz
         Gdt64FD1oH2V+DDCn8lIrrRxY09Dsgy375K7nueCRuofRfqtNOtUuyFz6TIP3ZQo08lJ
         0QoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrPB0aF/n5lJdrxR5kmem6d2V4Yo9UEWgpDQDJHWdWFChMSNGgGh4/4AdOfVisMcYpMLB4ceZTTD5IK04Ifi3K@lists.infradead.org
X-Gm-Message-State: AOJu0YzTe6rmn265XDhyC4wxui4tbGb2aofiU9r3XbAI8Z/5RgOFh8VN
	gFCVlA+zJfYtKXMMuk/mGX9T7u2dbThzReoIQ9nGbyvhLq3l/BJSZjDEFTCBERdoSFU=
X-Gm-Gg: ASbGncsUa3Gn10qdbV6iD3m3wQaYji07hQ8IAJSlCHHZVNGFPx8fsS8bYy/mF7u383q
	gqml3xvlpDkKiQzKArKzhxaltTeCGcDXrYazgVXU6IyjimAmMBxNi+GbVkRMJ3ttvEReQljB4rr
	J6LxN61MHE65SXFcfSa9WRjq2CLTEJhLrzJSsP95xIyEOG0A+s4dK39LdBeqKTBBiUBTNzrotCN
	8LFgJJNEgGqTu0MU1jMnDR3BnibfFws6eRrGGcC35Oi/PyKFo5naUFgeKyBW+OTKxaHWhXVNWDj
	et4RCOoHnNT7mmc+JihLIzWgzmwzaFSniOjB4P6nj89a2wtYAOF9NvIlL2nkqqRxlnj0rC67f9E
	H0tI6WR+QTg==
X-Google-Smtp-Source: AGHT+IHMb2zeZCzMkFx8yBXTWRgBTgF1yuwQDLgQlJbi5YnTqM1OZiKrbYwL/jrRqQ9LuO5X6Hd0pQ==
X-Received: by 2002:a17:902:d60f:b0:267:cdc8:b30b with SMTP id d9443c01a7336-27ed4a873c8mr101655395ad.53.1758965004608;
        Sat, 27 Sep 2025 02:23:24 -0700 (PDT)
Received: from CNSZTL-DEB.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882277sm74215125ad.78.2025.09.27.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 02:23:24 -0700 (PDT)
From: Tianling Shen <cnsztl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Tianling Shen <cnsztl@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
Date: Sat, 27 Sep 2025 17:23:09 +0800
Message-ID: <20250927092311.789946-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_022326_081017_09477A7F 
X-CRM114-Status: GOOD (  10.28  )
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

The NanoPi R76S (as "R76S") is an open-sourced mini IoT gateway
device with two 2.5G, designed and developed by FriendlyElec.

Add devicetree binding documentation for the FriendlyElec NanoPi R76S
board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tianling Shen <cnsztl@gmail.com>
---

Changes in v2:
- Collected Acked-by tag.

---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..e8185344c6f0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -330,6 +330,11 @@ properties:
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s
 
+      - description: FriendlyElec NanoPi R76S
+        items:
+          - const: friendlyarm,nanopi-r76s
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi Zero2
         items:
           - const: friendlyarm,nanopi-zero2
-- 
2.51.0


