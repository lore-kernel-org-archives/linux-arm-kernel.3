Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6547E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=; b=B1AKvhso3q5IQmiXnoTtcJuUZ3
	2WaX9WuhYJJKl5ulQXi8BdYsoCAtuPOVRwt2118JvSd4JfUqPMEXBEW5vHDC6WBGKK3cE4RVxw1AS
	CO50tLp2usCoay7wsdPw+PPcpswGCUqZKLJJRRcS08GWrpvu4eZb5g9TvOROxoAgE0dPinENb7u6Z
	xRftZkhv0nMT5O6LjW/nit0VnZwhu4g6k+xYN0kwFiWop49Tm/kHjN7b9prMhWtn0p45lkj6+p5w2
	5D22eHfoGnJbtGrQFTodui7sXciZwW7LrjZWZNB1jyQ9neDqTzMxXeGfl/oVDnaJx+uaKTW9rlTRf
	IhQAclfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKqB-0000000Egom-1iOL;
	Wed, 11 Dec 2024 11:25:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKo7-0000000EgEM-2p5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216426b0865so31073055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916187; x=1734520987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=k9rgUy6LNaraBosLysCQpMfZczQmhkrHmi+Ymi/JWDLfdkK+0Tk8poaav+cB9RZ+6O
         90DL1qJaT0zxoFV7S9/5IoKEPa9TujSE2Zt0XAi5HwDJdPIFBd0RiYsiMTdrqVfv4l4k
         VSpwO7aDlsIQeaekq8A2RLjDduuVh1Fvys+BDyDqnjZ6aqb+UHqOjM3YUmJXJSRJ1EYJ
         DbD6iIZohHbvYxOvYtxMlTP8rB0y0VJoYnmPzV6NxwQ8vh+gKlZvMXDaZPJxppyPKheE
         Ksd6j2JJJv7id5dpp93GIDcED4nON0PyCTuWdG0B6qBsDfguYEJL762Tklgoh+ghD8QS
         Za7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916187; x=1734520987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=DwrWQmjQvZ82POFAq3ijFtCBmCJvpuosb2vpEWVYnpG3GfQ7s/ndwDQHy0FSk+FIsn
         FW4VPRS2mp2XlvaOQ0syOVTqjyCrWtbPROv/sXW2y5U9NfE1yQOEDTDIFrU1hgLtln+n
         EM8s9xnSQxgQLGkebl5y/t1GnVdi7sF7hRibCrptpOop3kGb7aDp0xFjF7JeykIHtMP4
         +Pb545MULz3SIP0bNi7qBdxnqXcEKzSk5PPc5cmeakymL9ZDAqUqJWGMYPRFibrueVdg
         xb6cMzWQwaLPdITjlakXqONo37CwISsfNL9TWU3OmOHaHiNOOy99DP1qfrRxb7Ucetwp
         RT1w==
X-Forwarded-Encrypted: i=1; AJvYcCVCHpMje6LC5hTNjBYd1tqGuTOryf+LwSqU7lqdjWePi0l31PEkt3QW9EjNpEB3cB+iCFEcf136yhrbb5uql2CN@lists.infradead.org
X-Gm-Message-State: AOJu0YxCBr2YjXnS5nSZBZM3rix8Q8opgoyylBa5AsHMOZ1vK7xb+Nm0
	oJX4RYmWxg5V6y0jV8l5MegX4LpsWqTLbsl0zxnuG1jqQ/lT97BR
X-Gm-Gg: ASbGncuodlDLxb/RiEk6iOlc0DfdtNI9DJ9M9DHd3RbVh9HzlMnBRPkEX0uAB38MHbz
	rP9vrGBXVJzbkISmw0DHp45SWuRNKrgNxdjgs9i6mi7x/aoUjbyEXN7Uq0NlrBewRUY3eSNqx93
	xDa9SJEJ3FPVmJ8DLTCGl7oKzt4AHQcxxP/LVdNaABp6yOoQz9WMrsvobb7vFe8I+ezX/HylXHt
	WDis1u/5YnterHN/vzsKhQ9IVzNlZB8peA84iGc/U0SP6wZyYNdz3mKAUaEX0IMKxzjRQ==
X-Google-Smtp-Source: AGHT+IFM5a7MpO8fzMF1Ciyph8SCkj9YYHpvyC3PVX6ufLbwk3i7/23nnaT70/hHri50A8+ULdGjzQ==
X-Received: by 2002:a17:902:db08:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-21778393b9dmr38658675ad.5.1733916186646;
        Wed, 11 Dec 2024 03:23:06 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Wed, 11 Dec 2024 19:19:28 +0800
Message-ID: <20241211112244.18393-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032307_709586_4E73485E 
X-CRM114-Status: GOOD (  10.44  )
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

Add compatibles for Apple A7-A11, T2 SoCs.

Apple A7, A8, A8X gets the per-SoC compatible and the A7
"apple,s5l8960x-cluster-cpufreq" compatible.

Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
"apple,t8103-cluster-cpufreq" compatible, then the
"apple,cluster-cpufreq" fallback compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..896276b8c6bb 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,9 +24,17 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,s8000-cluster-cpufreq
+              - apple,t8010-cluster-cpufreq
+              - apple,t8015-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
+      - items:
+          - const: apple,t7000-cluster-cpufreq
+          - const: apple,s5l8960x-cluster-cpufreq
+      - const: apple,s5l8960x-cluster-cpufreq
 
   reg:
     maxItems: 1
-- 
2.47.1


