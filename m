Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB3D49779
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa5SS8TIm70D96W83i/T8FBfkF8phya3zla9FCJAKVY=; b=A42y9mvZEr1GC4VloJzPlAEjqv
	6gWJlfUvoeFhI1/ScszFkVGFJzujxtDv/jh3pc3e9xCI0JXNLAdrkqd0UtbhtU5MNaY2ieLO19uhK
	MiS/jR2PZgc+b+2qcQeRv0MzjSUnkD9VfLbDaHgcelOwV7By9DJ1hYYKF6US4MesJoFCbn1By2Sqo
	7WZ81jo1XLhI9oQWELYgDXLPhA65YG2rbFLyi1pcsUcP2U7D99eMkg9KaDrvSAJpnzhhwnSHBkhAK
	wVltB1KGYFiedAfaf69gAZHm96Yu2GqTUFlCagDeEFf+idiAPzIQnONy4IZdJzsG5Yv9BPpIKChUL
	HCJCidEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmPG-000000041JJ-0dH9;
	Sun, 01 Dec 2024 16:02:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmNJ-000000040jj-0cZG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:00:46 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso2421599a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068844; x=1733673644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa5SS8TIm70D96W83i/T8FBfkF8phya3zla9FCJAKVY=;
        b=Iq9YIuQU1k3aZdlehUvlm+2yNMTSc6dsugGfKqMq5A4IwVB4EBLmVhgxeOg4z6XdS2
         f7wS9ZpmKFlOAWakKEoP+VURlYXIjyRIpKP6UZoNo+4Mic2B6fPD5UwKq9TmyPTowSqw
         Y9OZUNoK7yZbHY7JkGS+L8zXFuITyWYjwtPk8fWvz3m7NKwui+7MaoFCvrogRzrDi5jY
         adOKsvGff0P8pSYeykvNPWidKdQ6FT6mGjYRkoSs2zagtcab0edm1IiASiK3yVzbE56o
         T2MnPOqtMqrhtGDtqfMuYW3svdgJfKOCwlZdjMThAxslVPgn5F3Bp19R0ybuhnp5Yuwk
         t2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068844; x=1733673644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa5SS8TIm70D96W83i/T8FBfkF8phya3zla9FCJAKVY=;
        b=qatvDP9BdATYHZ9x/TsNntNecw9PAaw2/uk7b9FzOXMIpnmxZS5B/D4qoSsdUscBFN
         KvoI8/UKqrEvmCahFaUeFl2AS7Es9tW5OzRjf6Z01qjNr4lkcozt4C5S1rXDLGFYo5Ad
         OGzbMCpOw00KHGFi5ds91cI6cQcJ9AZiUl8LzAWQGNkDU7vE/Y9pUTkSxoe7UPNrEq+w
         gyh7c6SeESCkNmAbQQlwp9MLAgh88YAHzNHvkac7oW2nfIvW+A1UncJt/yftCRpr7y4r
         Y87xoCa5qVLbQ3aV6kCpOyR2DD9QCYwb9DcK4wGkud78z5wCnLMRw+TAwY+GcDlaIbwJ
         9DJw==
X-Forwarded-Encrypted: i=1; AJvYcCXF0EJe2xXQ5yCKKjRLIz3Opx3g1ox2bXErOGWRctu3mNLxYfsnQNTvhu8Vl2PS+XwiOT6FMYxwEE1kLLKlyeXw@lists.infradead.org
X-Gm-Message-State: AOJu0YzCrcu3noF9coP+EkPoqm/FXeHxb9RutTHGCBML2YhK4q8rw5mF
	FNo3b2BGFzkTEbLvbLkSznki0erhAFUYZDPFcf6o8ce6Q7Qi70f3FCAODQ==
X-Gm-Gg: ASbGncuMsdlu1v7/ipu7erOWhl3hmRoZJvipILoZRECznuB5qwjM2x0UYU5YF5gp57m
	pae6L14PpQEbcRi+6NXBfDi2ljq9A3QWxcX559Y/hxhIiz3ZI6Jlrk6v+mzfNA9fTW5BqXyHLC3
	tOQ+SGQ0pWZKFQbF6Q/nkEt945lyouRFTZZ+Zsnn3Occy80uDalcpFWfcC+5GnvrBttcEMl3IeT
	6L5sdLApngCOg172cPBjTwrf4WtX8b4Wl+6R0k4KYdH9Ih031nsfkkZ7+R7+ZkwyQ==
X-Google-Smtp-Source: AGHT+IE67IoMhdkZhbCqGTTlL81j+rymuRthOI6+qz6dw9AZsphEAOs24hWrEsa0WM735TWFubxf5A==
X-Received: by 2002:a17:90b:1dc1:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2eed1871fc8mr15046a91.28.1733068844164;
        Sun, 01 Dec 2024 08:00:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:43 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sun,  1 Dec 2024 23:56:38 +0800
Message-ID: <20241201155820.29259-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
References: <20241201155820.29259-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_080045_182743_40BD1D92 
X-CRM114-Status: UNSURE (   9.47  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1


