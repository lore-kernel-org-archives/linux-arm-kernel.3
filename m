Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29148E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXPrXpI449ov9UhSKua2z+0yiJDVS90M3hJvDU48AIU=; b=WUKaVoNS27NV+MHq+la4hpo3rs
	OY3siKqEwrfb1Iy1i6vPYdo6e90zkld+IlOBtXgov1FAtHRI4B8kAMKsOdmqHK4UUO1Ay0KLjOidb
	5iXv+wlnOC6QVUF+Dln80RT4j8Q8R+qGnKWApugsjOvzhGqRmZ9a91TnQwbeTzeKK2lWphepZXy+1
	2VG3FK6xvOkuoNknoEOsUzvo8zyLYmKNTeSm7BhJo5hJt/p7eafdqAnIB3EGS7r5JL2WEdnC2vUdW
	qrkcsvDFu8lVjPNnD+8pilD0ZufjfZTfv5jBcrR5nO4vEbJMH8H5oaE3FoW3IOMReqC4q5CNmirZx
	V/yEJEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAAG-00000004fGo-0QHg;
	Fri, 13 Dec 2024 18:13:24 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMA7Q-00000004eqh-0naq;
	Fri, 13 Dec 2024 18:10:29 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-83eb38883b5so67799039f.1;
        Fri, 13 Dec 2024 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734113427; x=1734718227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXPrXpI449ov9UhSKua2z+0yiJDVS90M3hJvDU48AIU=;
        b=Qzvp0vV3Bq1aXq4uoJhfJ4CCQ6pzmJrGdiW1rFEO76ZoqtVnA09nT6TqLAq7CCuEr0
         L6oGhIMpOVNgPsiwKmjLAdyyjFUUpONTIC0c+faye7rzQ59aYNw5Zbll/pS3r8a4np2y
         2S09+toNMX8wNEXBLTb7KN7HhfYbJst/R1dtRpmrupGK+sipxA2yqIZe0oYjA4dRYf0I
         vG69rr11R2y2ieFVrnW5UMHiNeEW4RlpZN3QpU74KzXoKOdb36ff6N23sFt724497xXP
         CzWCwhzrXYawRrFl+IX04+qOgtw7cYH+8y3/tHDvcQq8+9MiowXMdYu1vq+qm1iSnW8F
         ieYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734113427; x=1734718227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXPrXpI449ov9UhSKua2z+0yiJDVS90M3hJvDU48AIU=;
        b=mo2oVM4vKBKOjBdGh7sJMOFql1CkmO5xtv4/gD4LgUjSgpnbJsWT7hoEwWgJhVfuTJ
         Vdg+ZNNodc3nEzaMKo9eqCrcVzHjvo3WE1jN0ua1J7pmG9NMVHtlWWMgibiJxetfTuMx
         gz1c14qf57W7PUg7W30Gb9ql6Y4MsiWiknl3QYzzVDDT+CDxL/m2eh0E0Z5kviZHWwZi
         7Zd/c0G8udPiyBVJEbCl9QklBvhD1EkKR+NLUj8+CWsrCnwT1jehkrspk4qmNMiZaHeZ
         +sLzScd9JVnMomUfpQJtVdXcIK8RaQ/1wW8aTtA8c++LgFlS0V3AvcgyMaHa5k99pJbJ
         OC3g==
X-Forwarded-Encrypted: i=1; AJvYcCUvLMjs7RF98WZGsTgvr41lsZ5jE/15HPqdYK2naiaZaw5SfiYUmT6++5bcwQMhEQW42YZGXm3ECRNbh4lrImg=@lists.infradead.org, AJvYcCWYPMSVe6vWXhLsuDDZ5/ayeTHirTlbjWK+KnXZwtrsMDw85Z3Y00DW6gRIwhepSDipJqiE8EX7Y638cic4/esN@lists.infradead.org
X-Gm-Message-State: AOJu0YzT69vwYjzOm4UzrVAgSJ5W56UB/6ZKe7JLAGK8e9kutzDzRo8R
	+QtZboP1qHK+1kiJvUwZNp05oCu0x3LfXaDPK9E3R2tM7c6QPQj7
X-Gm-Gg: ASbGncu5vDJctVDsem3Bu552WSj4Odt28Trt4cPCISWvWdLvQXIedoqSRSdNfb2NZ82
	MdECbOop+Zw4Vo7XEqOeSjpJUlRx4nlPVCj3K8AzAJKPYyRc001eA0fJ664AE1ldqNFujq+EgAr
	T/XDeV/eXeUHpDTMV4tIIArjUbLJjIUK+5V6CZ0u1bK/t2TVOwh6vndjembSSgl4mTETLvE7jcG
	yzYjSi88Od90JStrHZTzhXj2cdaM1GrTPBpmYqT88fF4B+3KdsfbW6N4XsB3ZyAhZHNXdb1qjFs
	+VoHeQVXWLyhxcPigr0ssuVAGtk=
X-Google-Smtp-Source: AGHT+IHLYxooB8Sqn2S8F7OH0vGMIzkYzZ3Jr/Pux0565zJs3ssqRpJ8c0d/gYSGr71vt+GOdL6q1Q==
X-Received: by 2002:a05:6602:6416:b0:841:a678:de3f with SMTP id ca18e2360f4ac-844e8698247mr499346639f.0.1734113426981;
        Fri, 13 Dec 2024 10:10:26 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2baf714cesm2922533173.101.2024.12.13.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 10:10:26 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
Date: Fri, 13 Dec 2024 12:08:55 -0600
Message-ID: <20241213180855.16472-3-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213180855.16472-1-shimrrashai@gmail.com>
References: <20241213180855.16472-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_101028_223177_100B0A46 
X-CRM114-Status: UNSURE (   8.37  )
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

Document the compatibles for the new board.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12..9ee96acdc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -190,6 +190,11 @@ properties:
           - const: firefly,firefly-rk3399
           - const: rockchip,rk3399
 
+      - description: Firefly ITX-3588J
+        items:
+          - const: firefly,itx-3588j
+          - const: rockchip,rk3588
+
       - description: Firefly ROC-RK3308-CC
         items:
           - const: firefly,roc-rk3308-cc
-- 
2.45.2


