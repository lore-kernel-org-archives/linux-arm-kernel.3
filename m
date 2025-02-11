Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD2C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=; b=dFvWI3dN7K06mKi/yL58AlXaCE
	Ojl+BJ5uY3VeSQizsru2hvOtkQ4MV3hK2UPLKuZI0oJPhmI3BPVSrtdFnp2IflEOcbyJy6tVYr2Yl
	71Ztz2XkTLP8MqAvNk1pTfVy1USF+tLi0BAnjJTJcJLfQPicJb1beiHzpVhTUfGC1x4+nAS4b4PCr
	qzNnzwqIkDHkmu+lhqLxTvmAjgwzJXaw5Tt7qeHVyWhhPL0En5Ixdf7xC3bmK+Iyuknk0qz9JDNTG
	c2ULl31qoDTKlNpl+wa93gfZvYrj0vuNGiqOvwok0qAAPGC3J3YVHfNxd0sNDprKyzJf9b9jqn0tL
	+usguxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsrj-00000004RTi-2uXL;
	Tue, 11 Feb 2025 16:12:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thso3-00000004QOy-2CkX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so6452673a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290095; x=1739894895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=JXcZAbbHaZQxpoqmO+gePxeADsrfrjz3I4+ThX/aL8zaaP5NVutn87Xf8h3geuuFV1
         j8HVhUaaCWhtDOQpGh+mH1WjUQ+ifIfbkdBqu7EpEQwQHg410eXvYR7vv66R17N+yHA1
         D/niMxNQXx9nB0RIFxp1MMZCfb2Bq3lH1pYv4x8eJaqRUFjYO60Qy5PwoxEb5BLDtnc7
         eZSG+1JdwdMAsjM1IFZSLvdRVWHgaLK7PrXN2uV5eEsC3PPCBuJwlQwfvibaDODnjWMh
         giWsijjr47d+J91ApuCBgLP8rkQQexAH1Npb7pxhyMBzcnK0bTpaiewP3bHUf7Zvp7a2
         5Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290095; x=1739894895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=T96r+DyzbGwAqbK2cbiHJG0eNme7kwk+bIOzEpkIsiWcUCsS3VNq7bvM4uGnnCmt0B
         RNfDtPIT8wI2MkJeT0ti3FQMtqYHQrxNyA1NRT9NjVVuOngFmfNB6z3V/2sF4vI9Fpcx
         u6G/GudMjH4h+Xz+uIxGiyOscQ5Na6OnkkWobzobxYaEwQmsbjeesb4wt5hYJ8/Q74th
         sjuilbo4jVL8uagPdsYvECiVA/lsCcroBwtm8LKbzc24zP3r+Pz4Vd5Tmp4eTXXVUzq4
         5GHXQGx1Nxw4UZ0JOjMcgNNDISOr+49YTgH7h05d6mQDzo1TUbRECZGPheJVUI5cgq3I
         g28Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEz3gyJuOlc5yuegnDeabCbzhUJ3G2K+q8ssT61D2b4B2j+nXu+zDz3KwYu64h7FoCPO73Hfr9rD6OgkxVUsPA@lists.infradead.org
X-Gm-Message-State: AOJu0YwybdGbNIZMLEsgqLjrLP8khvBSLMCDJDIb3+qROQWOdpA0eKms
	IrMe9Za28ubLg5aKF82W33SrHHeRN9lAkRIlm+J8CavYgBiSwlXD
X-Gm-Gg: ASbGncsV57ooLiPTRvvUxl0C79adC2Zn9MUkBWpQidnR83+RFpZ5dwC1ZCLd9BtnYz5
	JQSwnwhLX96E4jSmN47gyb4n2OtunlcphbgF8Yfxo1GfvNfhZ5+7reyjJeSMl390fwVG6DuP61n
	lMETAvPcStmaEnaxNayztgAze9Vw8QcyE0xKsy0IcK1H9c6inP3icKV8ZcRkzFrlDxVBvYVHcAk
	2yv64Ic6CcK6V3uO8MifZvm7NWMPwTR1M+PgeQZYnqdfzhlqYblBGTnopotLNIQqANyVPg9YItx
	e81DfPz4/yVIcpE/vA==
X-Google-Smtp-Source: AGHT+IGWiLhpcJsKWzNqi2HT6SRSgJ6VjVADK4Ws7JsDG48oB8ZOyWOashXxpxghrQJ8PTMsnPtFyg==
X-Received: by 2002:a17:90b:2dd0:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-2faa05deea4mr6190188a91.2.1739290094626;
        Tue, 11 Feb 2025 08:08:14 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:22 +0800
Subject: [PATCH 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-1-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xm0Xt2CbsT+7H9gathEZr4OYeo7c3d66hR5
 s1nW1F9h82JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15gAKCRABygi3psUI
 JHDFD/sFR4NMAnHjLFGq8QNGyYh5/aQCC9Enpo3Iz/tjM8EDsqgYuXbz9aZel6EhLouX0knyeQ7
 sis7l8A2O8rZx7taElUW4Boug7FV1SW/KlPQMABCELFy9GDPsv+p3eg/a0QEBEeWdcHphCGv7G7
 pApeqSKyqISAtLDWndy7nGNba+9bSWClFzH/iKyTER7LMChBOsJECU1r6ewEOZ/7tNogJYNXd5g
 OOX94RR8KqhXLiHUMS2ZMHPHnaInZDDN+6UCt4sDvpmgTKAKnb/k7X/EDMFedxdUykgr05BLJdR
 lT0FkJ6GG9gdDpaHRaxUnKAR6ZyG6ejHAA8/+KxoaYCn+4cLsKjf8gH9WpiHvDQuvstknOxEz6r
 yhgkqXxJHtmN5IAwwLXQ7i/pujEUDCTmqod40yRbpG6qVYDVIP9ilkijBHLKRMxLTY4V2f4JdFg
 om7ebmIpo+dTk9TK1j804AGY2zYZ7FTSnVimz/EjIMxujpjrGeLF6SZTyaZ6aF10mnfKQP46bvn
 Dhvn1xKiLhiVLlLWx/63ELv5LwI9/SW1LRs+yWRg1dpn6KDY/85/EpGuZdtBmvo3xZbXbav09wt
 7Ip+KjkPetmWR9RdcU59kxHz2OMOaqkqdB3cGQ+jNLfGL4mSIVrUpoPoyy+svDq93W+OocJr9rQ
 RXcs9RWNF3GaH9Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080815_567437_9DEB114C 
X-CRM114-Status: UNSURE (   9.60  )
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


