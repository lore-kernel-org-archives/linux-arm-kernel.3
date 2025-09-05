Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA3CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRp6UU6DIJUEvKAJ/87UvE/hlm1P5JGXV4jsx+n8jPA=; b=bTtMTUc5b6u3soVGQQ5i7gmGuk
	3X3i7oy1V5vRZYDoHU1hmBhtopB2eQHDNv2LJHEJuLRyyW+7oyD2MuEQlOtpRdDKhJ/+2aMGxEGFW
	akrVMwHnd852yIY5O2rkyBRIYNB+sK5F5m11/gaaPe/6w5rBgnXrXd8bTk1p8Q5WTVDCqqE5fTDT9
	o1oMxOeluEOYlf/7Hq3xO88julXydEi1Ooqr6ByGBf1xEvAOnP8GmPBhjBys4HCemfFmGZFDndOIr
	Gk0u/G6dkwTOErlozGnblUhBM7XCjSUTo8OKRs6dZdeJoCTk4D6Tcr6+aGyH4exNnbfTuuYvJFNJQ
	WBJUnUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN1d-0000000GPjJ-2PAj;
	Fri, 05 Sep 2025 03:22:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdt-0000000GIUV-2WBM;
	Fri, 05 Sep 2025 02:57:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24884d9e54bso17610685ad.0;
        Thu, 04 Sep 2025 19:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041057; x=1757645857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRp6UU6DIJUEvKAJ/87UvE/hlm1P5JGXV4jsx+n8jPA=;
        b=en+TkdNiUkYmtyU94J+S/ag81RZTSfs4l8fusMHAfZ9ZBtHBy5G2On7Y9wSnFR9gqA
         J3D+p3C0dpLEFaGh9qozOBnN9AFYrjxvmsAKpru2WpobSSf49kTWvFZIsyIW0MJrCu7W
         K4z/ZVAe6wukuj2xtJHi/b1VPqLFTLgPW9igd6+K6vJKXTyHbcY6RYYvtN1OK7gzt8K+
         zny8IfMgUTgxPDtQjuawHIm+Rb6SOBdvJXUT/74U1yljAZG6qEAvhp2CF8ppCIYGiaMI
         Ts1xFLIHQslVthgsTrnyi8mpWKTTLeVhxE/cAt/Qhbrtybng3fRUWBzk5F5yrSKvRz5s
         xfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041057; x=1757645857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRp6UU6DIJUEvKAJ/87UvE/hlm1P5JGXV4jsx+n8jPA=;
        b=m30TGv0m7PaoMXZwOsVKHa7QuEYOuO18JSgduaPjms61DdZar3fKiU33BRisRyAmyY
         Jj00TpjKpUCMH9xcMWfw2m7AQnUFy/DwURBFAlWOQUohJFaVpeqVd2CjpJVcQKpTAQXh
         HCod153PX66k8YcN/4ox+GkOIQUVELXtFAp8XwTReJ6zzs9+JkUiEoWA715ejvo/ullN
         9Y6cYnkz+mCSp07o/cD7jJQCrK8BqZgPYMRgfy0thKTuj1SGBW75y+/Jq2a34FsSJeqy
         aQFudTxQSHML5iMEb7xGZFduFYdafH+JzIcCMoYit0tiDiXUsegWKHd3qpfvRpqw0uDU
         H7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfHs7wJChgYAU7Sbx/KGK+IxFz6AU6LV41Iyddsjp2cRLY0e29Jp4J6myqQ3ph77bwClNmvM6AO9UoTU6Z5aE=@lists.infradead.org, AJvYcCXjKgLu7ZJZ9mwt2CqB7+Gj6YoENe/ni0fios/UrAinHjOEP/THKk10kASwX7CSiZ7eBW4FOfIkzA49NwFC86vG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr1pnF4I3yqEsar/2/V11OEtygFpHemNS5l6kIXdtMEzz8dJFJ
	hqJf2ePQ7t2C2ObxedG00wp6gdIeLeskVH8XI+5w5sBDMdK7M3Zr2y4+
X-Gm-Gg: ASbGncuXlQtrMq32DxP98GIlzwfZ1jMwRnyWzTYdONKN7fQfzjZ+7ywUnxPO2QXoBBw
	YEoKi7zQ/lgi50f5G6HxE5D2ZC0c7x3uPuSOpbBpu9ILhI7M+ludbQAsCizQ8lXlyJ5DRtEWITq
	SbTPZEWHHL3S40CShxrjSCymAH6fLS9ICksfYYwro19wjErtmLnCi7lHlSuCMW01apKrMDIMWSb
	MNQlcIha9TJ4iYZppAF68FQGi45a9+XzJNs5OLUq+B2MwyCiP1TGEGWEKocRmKSnJDOl3v3vAIU
	SL4e1mDVnibgehYVLeIBelcYUy4+zG3eQba5q07kwZM4aFM0UPNIlriLm+LjFC7MoLDweTAqpUm
	mNx9xqlOi08g=
X-Google-Smtp-Source: AGHT+IFbbE99ORndFVlnLgJhcnpGQSRKqSs/VqX+oFl4ShJ9SUdAsUmhzucQekk/6sfybVgodkOxlQ==
X-Received: by 2002:a17:902:e5cf:b0:242:8a45:a959 with SMTP id d9443c01a7336-24944ae5ff7mr282610105ad.47.1757041056691;
        Thu, 04 Sep 2025 19:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:36 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 8/8] dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3368 DSI
Date: Fri,  5 Sep 2025 10:56:32 +0800
Message-Id: <20250905025632.222422-9-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195737_638693_3A75FF58 
X-CRM114-Status: UNSURE (   8.39  )
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

Document the MIPI DSI controller for Rockchip RK3368.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index c59df3c1a..632b48bfa 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -17,6 +17,7 @@ properties:
           - rockchip,px30-mipi-dsi
           - rockchip,rk3128-mipi-dsi
           - rockchip,rk3288-mipi-dsi
+          - rockchip,rk3368-mipi-dsi
           - rockchip,rk3399-mipi-dsi
           - rockchip,rk3568-mipi-dsi
           - rockchip,rv1126-mipi-dsi
@@ -73,6 +74,7 @@ allOf:
             enum:
               - rockchip,px30-mipi-dsi
               - rockchip,rk3128-mipi-dsi
+              - rockchip,rk3368-mipi-dsi
               - rockchip,rk3568-mipi-dsi
               - rockchip,rv1126-mipi-dsi
 
-- 
2.39.5


