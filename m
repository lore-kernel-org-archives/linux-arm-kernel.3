Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6964C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=; b=jkUgEvdLa5q+Ik9r8+7amIj2ry
	wS9AJN7b0PoRi5+FgndGOFMqucoxovyqi9eVkmS8S52baJMqbjXBu30gUpNi3bo8e7YMwVAX4tIF6
	luDqcyQFy6esIN+ee6RuujA8SH+7qxfFba3MyvfTspVY5WPexbCcPe1IQUWqgUjQZOQcJM6S7ihJv
	ojlGIggVfUWqn9XGKGA7n3buIAcralwtRPspr2f7PWmYVmY2wQ5iBjJI2bvFunXoRbX8h7RERyH1G
	tzv46QsTkYSu9EfPn/Y0MuZ99oVwmHouC3Q5m1jnqwGp9fRRgPI190FKY9mmSh88WOAw9SVNd/w83
	6tE3yi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfVP-0000000GEIX-49r1;
	Fri, 20 Jun 2025 17:26:23 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfQz-0000000GDlL-09Sc;
	Fri, 20 Jun 2025 17:21:50 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-710fd2d0372so15387947b3.0;
        Fri, 20 Jun 2025 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750440108; x=1751044908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=l3hisvRDRVujXJej49ujhuLS0xVANiu8H05lUuLsNamt6irUEVm+bSb7/pdnwmIi38
         9FBBHmd0YQ8cUplcuuI5F+W/jvGiiXlftc0J6W9KMV4N7VQBpgFoDhCrckAnK+uaLLM/
         RPtSkQhrwXtDUgp+QjvdET13RdipCVBOlRIMUafiTXSPLwYEhokqkSszGrR/MMrDkigu
         bpwsYSAQZFMyoTI+5hCVJthjqxXFqJZqFEufXywXWcmj0sPTbCKldAY3qPlsFNOLEZng
         rGlQw9LA4AoZo1UBUqRaeDvdW4r/UPRixd/LjJkqQm+UVC+xZlSARKUbIC3PthXXXJSC
         xpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440108; x=1751044908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=gGl4J3wXgpTyrkR7dF17DEnIQ4+Vh9/tnzLHkBMMDdee6D+qaLzm6oABLeIRbXM8Tj
         v0cgasKoMUBvoPjTeHHHkbkfnpQQ8+48Zp/tRAptMuh1u6qoNS1e9/KTyU0pA7q8J1UF
         8Kx3ih7xUk1nM2Y/2PtYDRvRkD6goPHUir6tcYQFB1LBNqU2BSHtRpOe4/soANhxVheM
         E0xwoL8CWa9azlweZ2KwQpu185FKvmSsZHpUEPtJ/uR0eb/cl6945znAPQICa1iaRn8K
         jH5ZS6poMeCfX0dbt4nmknABRPtCGZy5z/0cOEYdy5OyGE5A47LeLH9OnTohfFBXAg3g
         G/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCULves0cvbArWjmchouPqTku0Ds+a1OGm+Aa56OpSxTKfP9pS8Jin8YvMHphLfX+LPkK/Ts4L4FIrAgT672atlj@lists.infradead.org, AJvYcCW/EXiD/0jPtQVQpgQ3Gj6U4Ygt1HFDb7bOg/mEtLOASEBh9AJYmaUWzp/LYowu6kaxIr0w25D7L6sbdhZZeiw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWIgS+8HB2M0w7Rk2t+NHjd4mOsWZiuQ3YQvNz6xL9PBtMdEj3
	RodnoqcWKRFdpYbIUwY71WYO2GnFPSwX+Kr/rJiL6+4gKGBXWq8Ce7LV
X-Gm-Gg: ASbGncso/Zqvb4hpHSLemOgplefLLWkVuAYYGo9N+WMVENv+A4u6pInUIeq+C5u42tA
	aM6z+dunN8YdWjmuGFoPUBaG8Q/yYKr+g3QaTzverGS/EzujPDJzjBFzMZRqo+qgmHBiEbhQ9Yd
	FusxRNXuOlls3Zb5eeCv7g4vgaCHyDU2rWOQlobpSQQ1mdLEojz8F1YXIEZVWegZBpOJAeaauey
	bJAEsqho4VDSNcz/mtC4yJJBV/PaQ90pi7lUnTPxwCvKc1srP5f+DB60UmPu9SnJaNWsAmW4M/U
	r/g+SZspWTWlKG/Drla9apefvbz5+W5FHWxjyPxJmd6Tu137oI3whajV4hzo7epGPTkn0DU=
X-Google-Smtp-Source: AGHT+IEKMfIKxqzSxlwm/b6Pu7iU5cqdkCqXdmQOfZnLOU60LHHV6vXUt5Ra9c/TlNbBQZw5gq+MNA==
X-Received: by 2002:a05:690c:9418:10b0:712:c295:d01f with SMTP id 00721157ae682-712ca2f7576mr27493007b3.3.1750440107847;
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a4a7besm5004037b3.52.2025.06.20.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Fri, 20 Jun 2025 13:21:40 -0400
Message-Id: <20250620172141.173266-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620172141.173266-1-inindev@gmail.com>
References: <20250620172141.173266-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102149_073026_BBE104B8 
X-CRM114-Status: UNSURE (   8.42  )
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

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 59b69c4741c5..10de9b7bdfcc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -295,6 +295,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5


