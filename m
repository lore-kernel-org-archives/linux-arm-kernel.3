Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E398CD5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOQqsdvD2kJ7hOf0gc7nGs2u4WOLnq6mE1rYCDpzVcA=; b=oKoeu8+kZOejLDhhtkF/t4hdRy
	a+wDvsmZr32gNaHwddb297mzUkb0YMvIs/bADhjGAzcb8f4iUXSOPBB2+vAx2eVbWWV8bTN7L4khu
	EQzxVWXpwqXTkVBiWQ66uymls0BKwGxLISz9ov8wCQ3JhwsSnWXCLGmstC0QL4TbTq0dqw/+TK4XI
	QmouGWAwLQs/JUkSj2hlZcWqfb9vkfqKahM1wLbz1/LThgBiUF/QexJLNtbfDqIfHpDIj99H4+8Xz
	wSJWP6HhJJGJF9yHZcPmWT9AeePdMzYPot/Si0mTUlrXr8JlyrYSItNbKgzIhIr1uyNsWbBMte5aX
	J2C5ZlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5alT-0000000CpTc-2C0b;
	Tue, 29 Oct 2024 01:11:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5agg-0000000CoTh-2tFs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:06:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c70abba48so38618065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163982; x=1730768782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOQqsdvD2kJ7hOf0gc7nGs2u4WOLnq6mE1rYCDpzVcA=;
        b=GtRG7N74nBMLcIERhW8wf/3RbkoGnB8F/VVsTycWRWXEKEmGca+5/THKaJCpcIDiXe
         MKZqfBF5ENyQVKAtjwPF4u/rDik12siGyRIdFYP1jZMgmnphjGVweBr/xloUYaGsApmb
         IMsRX3wlt2qLXE/oMAKGHdXtr9u6gWyCu6zkU8kBlNJADv/VuUVFk7qAZQ6tuxKyim3J
         Yzsk5d353XIiX7xCm/tQwhYEsHu/PVdevshlNOIUfsFCOPZRur85ZmHhnJphUNVID6ip
         P/he/OqiIt5b9ghAUg48I3SCuceE5hJ3xYfADPSJHdPDS+gjS9uzc5VqJ9uDMdqZ4kgP
         9j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163982; x=1730768782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOQqsdvD2kJ7hOf0gc7nGs2u4WOLnq6mE1rYCDpzVcA=;
        b=bkvrvFyxkLDcJGcr8bKqPXNNcn/n+NHq+F/gWz4h0+J3df/bN44UqCFA23yOfhD1Pj
         O2HrBwtXns9CydAOcFZmUaboz1pYDx7PX4Ya0ouVAPRx3h7pDkGp5HaJKl/qjRQoKCMo
         1f9ZdGELCrOzxyhi+BEwBVHJKdO4cnVmCIUrrjmx/J0uQtyREcnOuyZ8pL1FIcDVdToe
         GI904Qk30V2A6qNnSizvRhtk+zq+FOwXPrlMOYL+agxWSEodM0fMPsMGk/ciAeBmWIZp
         zqYZSU3HCu6P0adCF35ugdcJ5A5kNuJ7joZzOT93Y2k+ra5R7wImTo4CulR5r2CVYHMh
         XuPw==
X-Forwarded-Encrypted: i=1; AJvYcCUalJaLk/ID7XETHRslI3qaGlmJpIgqtSFU+VbTIULgr/GkkD0zjzDHyXXgfulisTpezw53uHzeO8iMcvHsmGCl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Z1UTLW+tb/Buk/PtJC6so5G5xJiwuu5pGW4vxc/uSpJl+WgC
	3Umii1C4DnvonV4CSwpL00pY/H4TB2JyZJ1ZsIw5Uoq8BFnEq9OG8GHyF22f
X-Google-Smtp-Source: AGHT+IGfIbiEp9AgPkAzQyYf5y8q1xHXZI40WLf5p9E21EcZOo7Qi3kg+2a0UWsBAQAR0nqjBem1Qw==
X-Received: by 2002:a17:902:e552:b0:20c:853a:52a7 with SMTP id d9443c01a7336-210c6c31d52mr143089975ad.36.1730163982006;
        Mon, 28 Oct 2024 18:06:22 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH asahi-soc/dt 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Tue, 29 Oct 2024 09:04:00 +0800
Message-ID: <20241029010526.42052-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029010526.42052-1-towinchenmi@gmail.com>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_180622_747369_85FB6070 
X-CRM114-Status: GOOD (  10.21  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.0


