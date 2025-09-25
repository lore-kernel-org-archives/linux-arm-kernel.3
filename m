Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA50BCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=; b=A7xgMbUis6c6r+hisZIvQA3CXL
	+1wLrfT77/0qZ4P0zrsY4FOdCtupTfdzxJ9PDGsUshmdDVsK/JQLUJnKcIX/Q4WuxthzXzk9vYknb
	bnI0tyAfr4acbx5R5LMaiQ1HwrA5pfBFYeZs/HO1fAzV+kejWmj9reKeFnCMaI/VMcUy7p6sCGVYs
	9mK3kOCk0CtpqI6TD9CwdmGTOgwCxeprKOxhJcjAGARd5P1L/adSTG4cgxprtr5ZnvX/1lluj4uAi
	QkRHntanWFCfsvilF12E3mBKNbsI79kWcu5ympB+uW/zWPu3xaD+J4b0wpiREzznH3mRemm/Z8gFX
	vhc+IUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAR-00000007Xfx-3sRQ;
	Thu, 25 Sep 2025 09:21:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAN-00000007Xbx-3W5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:21:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2697899a202so14982835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792091; x=1759396891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=Pr7mmMwrm0ZLIfg7zyEwyixfbpxtQ9DS2rJ5h/F1iLec5mo16+X7wS5Lelh5ov9A3q
         KSvW/lv4FmtQdBgTDggmKg8LN3hFLKNj+IUs1zEoQ2bMQPqu6Ov/BxLSz0Bdy9ebZvp8
         KWSxqMoauMTDEDSgC2OW2wSp6Evhi/IEeg7N5Fqad6bng1A6lyR0TtSYiS9LIz/s9yFf
         q+v7678k9EJ1ADAEOX5lNBWMotNmnHQnstWVAw+FaJPnsTXHoE3jXAydpq0Cn90e1cVD
         0sPphTj73hXrIRJuxd4yusH/Lk+5mCGuMCfwB+IqHudRH+jhtxiDGL6LH2bgrke9Lzjv
         QDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792091; x=1759396891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=WawFm/7zUYq03UvF9SaB4zztT8kji/CNqU6pTwP9EKLW8u1OVulsTn1aIFYzRQjUkZ
         GAVl5K3dUwvoqKIRVVllKBBTUkuV8VH6a9Heg++12MgfQ0pAP5OY4L4FzzUInN98osA5
         V+Hh04ZC02Z29zeP1yRl5Z5l5qMBvD3pn6HAM6FD9r+Ze6bmUL3tnRt0m80hKrr/bMlW
         L+EcwjpufFWANQxi8obI8nRWtU4walKXrX5VwLmVpisDT8ULpjFwaExsRKsBuJEdWRRA
         rxLT9GFTd4NNvA3R2RIesuVgfbWvYlnIbgPP4pAdiuKYDn6Kg5YARIjUqRwjHG09veZJ
         TtWg==
X-Forwarded-Encrypted: i=1; AJvYcCXDINiMpR5LoGYH2Xq6vMiBMP1a+EjrgAbl9yWDckJDF0x64cD9hueUSopMjbKiLirP38iJtxrKp1SVGWOvyS66@lists.infradead.org
X-Gm-Message-State: AOJu0Yydnc7KN0qy2E3Ou/LMM6uLi4WOXoXu2qJvb4ujleVvMEvkzsJc
	U7LEx+0dJwRfAZpPrPkR0aCIkIg/X+nxcfA53SorPGkC7heP+ecvj0QP
X-Gm-Gg: ASbGncv06tlCEGxDzz+7e3kz5Awod5hqovUsEK2M7rhHgVhoJZo2lmDjiynYPSvcIn3
	Lbdbt9/T/6Rvo73X46/ctlscHJ+pqTUa60oT2wDrAWjfTZOGiJupAoYY06EjYlTUJCPAeKDGfw8
	lv4lRmkVTDyRRpm2dBNaeHp3gV1lHqqEvCyxj0VJAjQ3ppvxqLjWLCwtHn0jUgdxiywMw4trAPg
	HyZ8ZzRAdgoqR7QCtEgbwWUHLCjsVRWfEoV7VboRLxo+KXW9gKMGHv0hbYlbAAxLk90OKVDcLQC
	DZ0srgO7tPgqb7WbDnU202BG/3wVbAJ2ipq9WCCIP3razDmvKEpsMx0bCrWVAZMxEZW7y1Z083u
	TTc1K68XnQ5zaOMrMiP8WgjfPlM8YZ0jqJFQ8Q7kXzQ==
X-Google-Smtp-Source: AGHT+IG+5cSlAA4yEB0iWJUxUwgl6Whpi0RXiGF7IG4Oc+3ZX5YIYSMwXvdgEh0mLgMwoqgR9eg6bg==
X-Received: by 2002:a17:903:166e:b0:26a:6d5a:944e with SMTP id d9443c01a7336-27ed71070b4mr24813685ad.24.1758792091135;
        Thu, 25 Sep 2025 02:21:31 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm18251855ad.30.2025.09.25.02.21.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 02:21:30 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Thu, 25 Sep 2025 17:20:36 +0800
Message-ID: <20250925092037.13582-3-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925092037.13582-1-jjm2473@gmail.com>
References: <20250925092037.13582-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_022131_880841_14890771 
X-CRM114-Status: UNSURE (   9.74  )
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

LinkEase EasePi R1 is a high-performance mini router based on RK3568.

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..ec2271cfb7e1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -726,6 +726,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LinkEase EasePi R1
+        items:
+          - const: linkease,easepi-r1
+          - const: rockchip,rk3568
+
       - description: Luckfox Core3576 Module based boards
         items:
           - enum:
-- 
2.51.0


