Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E09E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=; b=O4U8KknrM2cMXLgAxb/v3uK2f/
	+x1dRQhsNcCbsECTva7oZbc8IAfLAvOpFsAHh/PaDR6s5jOVuVSeULXECUHXWIcnRl6yYSUpPlb0b
	EYvuU2PqLKCRthbLJ2oH76QMVTrDQ4rt09ncwlFJf32VzQrtVP4mklz4l8HWLJQQmYM0sqnF+R/Be
	HPwYNNqCqDkE77y/4pLhRj2iyHeDk2AKgsysvXCjcZqFrA3asjT7G++hUdBWKCUOmIUNVUMP9tCdz
	nVGbLr2SIZ2gPk2CqgAqqYqh5H+D9xWaKOHHVnBJfJ+rflbsoymKTJFAXEkgJOJ9B+cak6YFhJop9
	fK44RBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPyZ-00000008cjk-1qWZ;
	Sun, 22 Dec 2024 17:42:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPu9-00000008bwz-32BD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:38:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166360285dso31944175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889092; x=1735493892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=AhmnEY4XhRUAJvDHBJkVdoTOib0dafDmp0FmEpmdK1Wi5ZdquutMZ4M7CyKLmHdO/+
         CwyLmM7sqXDMr9OW7gcPsvfSIdxYkSei3HjbqTRuTDLUxmEKiHrbMNCHzqw4hRNu6QKu
         KMWGj87GDHgN78tf6JjobFM+SU+BF0VcyHRYkEy+YY6h9Cya8eOcNHMOvhigv9oVV0Wf
         J/+tzhO27ZQNPo3XoHTat7NWz1Xu3gH+FQO1mSMnLOzVzKKZyebRPVenXKDYI2KFBBbF
         l1tizMfB/vwBvOFnq4YS+bVTxiXQW054ZeH8lTRKL5Jo5yce6E2KnvjlIe9UFBBXyECU
         QAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889092; x=1735493892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=hO8rcFGGZZRIxF1siKDu6BQqa4EtcTf/4z5s08a7YjuV8scU7j4klMzF8jI3VXDbnw
         e9z4OTsC7lk1fQ4Ac4AvsD2edKCkSE/HFq6zLEf6sqBVhcTNTq/R+Gfy84/DjpKQOeZU
         UFWrJMl3eygDMSmfmQXeddu0DCzewa/rG+lJEEx/BqOXnE3Mw1C5aZEt20/QxNLffwL+
         Krzz94Ga1rxmcf8bGzld7B4wsBmVTWkrIHYlAfYzuaqPjwIiQtamGCdc9+nOWszAbHq9
         VfWfGX0Cu4wRtRsLOel0nhm9f5xlzGM1iACZcaEeYMNPvOtLnhdYExCvMVX0kT+07s1k
         Cc7w==
X-Forwarded-Encrypted: i=1; AJvYcCUPJqB/BGDKMANmsviWKcOkwAResEg5cjIZrfv07yryf4smhhV8AYQQrrXEEoHvnkVfyw/NMBS1HuG+Yu3H8x4J@lists.infradead.org
X-Gm-Message-State: AOJu0YxeQz8UJ5nFRscxdTF/ZwsO7Xx/GcNjeIRrwnyICNcFFjso7nT4
	7O9SwWytaydsFrPRY54NHM4EIwZ4GvEL5nxGH9hyQg/5oKfYg4HzAu0FHIl0
X-Gm-Gg: ASbGncslLTBl1SZCWkucZy0bJP/ej4LKzPXzpFivrWqw5GBn2pRX6lrVXRHt66vGl6X
	3OlCJEi4JiMKHpjP9nELe/qWo6ycYBvJ88z+FhhE01EznINGHy7EdBzbIeeWBw3yyBB03/OG2CQ
	hQSVTdlwInzy7qnWnoMqIzbw0WYSreZLbRSNG7bDT7ojA6Yq4Mykj/1Uc5ozXZ0I7/Sexz+JZiu
	LAKUXlxuxQSpOC+l6fQ3jRZDSK0Mmf1uO15K3XKDiFgPpjyyluN76OPhA==
X-Google-Smtp-Source: AGHT+IGg3A9VtGHmKoL3I6uc1+KXYnk62Tn0Sq2QNU+0LcqVq2zEWgfuaUVJiejhoF41amkKc4KnEA==
X-Received: by 2002:a17:902:d582:b0:216:282d:c68c with SMTP id d9443c01a7336-219e6e9dff9mr154141555ad.23.1734889092510;
        Sun, 22 Dec 2024 09:38:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:12 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v6 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon, 23 Dec 2024 01:34:51 +0800
Message-ID: <20241222173750.148071-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173750.148071-1-towinchenmi@gmail.com>
References: <20241222173750.148071-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_093813_764025_79C3B826 
X-CRM114-Status: UNSURE (   8.71  )
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
Acked-by: Neal Gompa <neal@gompa.dev>
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


