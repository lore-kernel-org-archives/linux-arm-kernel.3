Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D33C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=; b=Z4hg6NMnVK/u2YhBMZqixdn6yz
	maCZHb9DKmO5o8vVVH9YVUPBce5g7xkKF2ln0kmn5rFSdhoH+UxRDdCoKC73mfS42QuRkJeJ4ysy6
	PRE7o3tlLmB91825o9jv8+RRH3ase9u+aJRZ8WQ1yqoxFby16NJPHAF1LxK8oRs/+FEKsBw5fa9C2
	17rmovobwL22QaSu7sGvNkuasj41h1CExapojJZ+EhXCB3c0mdgFa9EB1myq5BzcDMDHJAOn65R+k
	6W9T7nRn9NfrtI9yGij9mgRWnwbjCL14/oGY9HUCP3pXLx8Rr1ty7R+wPn4JuuwJyjpIost27WOmJ
	DKfFAGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGWm-00000008JvL-1lsZ;
	Wed, 12 Feb 2025 17:28:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGRz-00000008InI-3pJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f6022c2c3so19766505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380983; x=1739985783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=T6ImNHgA1bPZdB73VN3sTWi+liyO5x5LuCAfGs8N5D3jSuUnyzHNgzLMJ0Qgzyu+0q
         vPhJLaMEptpWLjwkrKqBrC0JPWpEY9xILqZJOrFzzft0le3jTOY6wyHSQNRMK0U2daMQ
         0mMdiCiiAODtVoOvnU07yf1zTY3Sk9XQRjym6HMeeUzlYeISeWG1cIcY6Y8vPahM7dF/
         UFCfmZ+ak7gBtPraZJmC5HujUIj1kccEqNr4vsh6ZnLxnk94mtHrYRbAP56BZsGZPhpC
         /bEcUQNqJ7j4xB2SwChuBZTtU2Z24jtiq9NWxLEn1/Xjkc9oCDeyFb6SP99kbISUMzlR
         1buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380983; x=1739985783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=fHDeXxzm5nVuwisXnPmIW0ObXTxPJCnRhc6/BT5mw84cbLFOY97WIv6t6xJ4e4Qmdz
         tUMjXSatacYDih9oJp/AkodVwn1kJ0VG6w+X0Eg/za8qiIiiqf4CJW49/SoEUM7FwDEW
         trzcY+OTcle8QnEEaOyq72ti/fjzmlsbjn3ziigeVEf+2gcD17/32TQjla3WL0sSOUFM
         7xUdxwJpCQOxZ+aJZbXYZrkHlJz9flcyff5FsFayOXTaeWyAKdy6DbP6fndrGZWH9VfX
         DreFtMw7ZPsDZu2Sw3XICqE3o+DyAOj0xSQ8AqDKCtqRH9/VHmCyYK72EUnucCRcDnU9
         Fk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZIwVmplhmCL57o/Fu5Zs82MlYW6pR4U8DeSCDPl+kwD6vozKFcCToUIk4Bzskk4emr6Reltp64g9oFQDO2QHr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/sQ6+Sq+pUL1M6k1XXmgXqJydMWuglm6F5HqlgfgAfpE7Kb+Z
	CbmBc6F1aG2zGO5k4EBK7AXtr6l+6ryYQi3hPl4kkFIyNOeVuajK
X-Gm-Gg: ASbGnctVSzFbGwLmQVOwpfsLLrDeIYwVY4VEZSQzun/lNdbwFeg/KHK+v2H8rAnDnEN
	jMSd9M/t80gk3RGCNExOK4ecUwBNvhU1kgqNQUlcxpaL/14mmOmxT7wdRpDvLlzbzaa4FyQWcpK
	7D9ZcKVrpiZ5eMPgbMDHoa/9kewOu00ImNCGrDYuNkkKIkh3fHWMJOiYn0BAoVLDa+Z/aHxGNYv
	gprIxZULmUoM7RT8DIIIUObSpy89h3ZwNatZNRNCtR8/iamAy9X60RyH2Kxjn+xojGJIDIupcsu
	haPlE4ddCZsomVax0A==
X-Google-Smtp-Source: AGHT+IGEy1jSFc7CoEH40Z2HRbFahUzGAgG3SF1zUBLy8tYFGnP8eFybnOnuulflEwPS88Om92TV1g==
X-Received: by 2002:a05:6a20:734a:b0:1ee:64c0:aa85 with SMTP id adf61e73a8af0-1ee6bae9454mr152576637.6.1739380982936;
        Wed, 12 Feb 2025 09:23:02 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:02 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:24 +0800
Subject: [PATCH v2 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-1-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xKNBKHADoFe0D0/YamWRency2Eic4YhwlS1J3poCzGo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvWO+25WvZjqa60EjVC9mqSIkhHbwtfm+Dt
 0wHaa0R9XKJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JLWlD/964sLrzrYk5mzJZPYQe5C6BGPTmD69eecHjciATrYkefUjS2mNGrNwu8fFrk33S8FEtRE
 9pj9HJSteWctfZ6jMMOr6XJm1FI9KLbo9TVxRhnV2jn+rSpa+v7LXJvl4ihWFoG8jerRrt5ULgs
 dCx440En+aKZ5MWPwUFXzq2RMAFaFtH8O1Z6cChndMEq+MGK1fIiPwvC3iXBsPmqQpmF1y/tWYB
 wuyLcfHp8b7JzSp0p/6J3iWi8inJYdUl/+EGJVdGpdIRXkl5gfUGG5jIXq3YAe52M0n5qvC4RD9
 B6CL4BbtmIoAvl60FAdNMopJD7iritzvulBVwQV0XN1HC7tO6i0h9AEI/GlK8ufK8hhc+Ea6ZwD
 OdMol0Ub0+iMpogYqSYh7qH/18QGXBOxik6HQ8tXZMDMxdIhlCInGNezu5ApJfGYsyLebGFSrpQ
 Sxmo9u6yQ6WCYjzNNzRmArs+BatLYvUrcvmR94sluTAf31d7OIZjVc80Z+BgPA47QnffOq0vVy6
 SaEzELS2cfqOBV+wV/Ou1Xo7t70prXQeOhJ4Tqqqx9smOsyoYpr1Ag6cKh2oQCKbmLLTxzZN7LQ
 7ZqdObroNYRny61Xyy62qTaTII35GjEVMYi4vpB7WRDHsF9tqSZFIfB9Q+2uJneOMF0lCO7Odl/
 KV90+5FraX7ke/Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092303_946466_DC3A5D10 
X-CRM114-Status: UNSURE (   9.29  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.48.1


