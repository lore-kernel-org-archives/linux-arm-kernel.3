Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E255E9410C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=; b=RcM4wMLbuukPuMdfZGw+cjJSxb
	iIm9B5RNg5MdL//fT7Z2tVagAK8CX3IiaiKQYOCZvmlEWXSDyeUKC1NKDmSeSVZd8n8YqCzllAHeA
	ejdYPyPQfdQmC59h6nhAK2neelv7YxhdqIcIP5LtP/5FS50NXBlPtBFWoYZsx4nmDu/Nf5a+Jmf26
	2ds153FTVGkqNpsZzC590OkaUtT8k5OOKd1MmlqqYNVv0+bjOBnYqI3SBnYofLVWJe21BzwS7OQZY
	DGRNYIkiOpKT9lIte9w0qLygKuQqpoNmLp6pDZNhaceetPM7YHz6tIzJSgtYA+cZegpvzLTG5Ipep
	/AJ5ZBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bS-00000006YxQ-2vf2;
	Thu, 01 Jan 2026 03:43:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bE-00000006YrO-1nfD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0bae9aca3so161239045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239024; x=1767843824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=;
        b=NVSxSmpIkSWy8SJNZD6eIDmphpMU+aMWuHSnXGtyj4w3vEKj8EUQ8FqEFnP5PCpe0c
         8UcsxmRyPwCXexQQncvKsC4tZF3Xk7N/dG/BJfYwUYKpTe5v4CaqeFvMbUKtbVtrCGFr
         /xPpM/Cxv8B8mMtfdNmzlfXKfkCYTE2gh9LIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239024; x=1767843824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=;
        b=nQXX2ryWQOPqy8BmQaAKdHZjhf8z9Mzw+DcVIViUqfTjFcp1cAKyl6cRfTh9dz2MfU
         adRoKHr4SWgtObt6iSOB3qi/4jPTkTf6oukBxTqMvzmhS0oXJMTtgAtCUbDF/z1Mv7mM
         uo1Ii8+3OEuPRQcwKNZcZ6K91gfZ29JCpcv42tc3jctpDSNTXF/5x6/CKhhTS9YovqUW
         qAw8kZFfvXD7TLkqfqcBS6iOk/K2YZKsTJLQt9hXW7YK71ucnuFB7UYyhxtVO/p3YA8e
         dGfoFDgFTIvUZoj7iLjO0wsXFySY7edpeL+TV7gKY2rde5dPtw9PJBjc/TNH18eocBwP
         P+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtJi3aMp1LmywXUTm2Dt5PDO3bEGn2YKsHtrGZUuRBneNMOc/xEB6UnLCiYWi2/MREaJjsnjlvdKMoHO6RRcNz@lists.infradead.org
X-Gm-Message-State: AOJu0YxX6KyLYLRMcg6JRKmRNFw9424iK7tbqTa7XeDVYdqoVQF55yTE
	SVULpmV77mE12EiWS5wkPqekrSXzZmBUO+KzNafyGN3bKRqXR581e7Cg0j8uYFgIIrA=
X-Gm-Gg: AY/fxX7SnXfFTgvqkkl6Qu4UTekHOJw+zL4c/5UBx7raKyyleqWIN/FgBdhXzAvk9UU
	zU3L9L0jL0p/a41ZB1C73l2IgkXbt62y0FWo81mlRDlyjd/EUHWHhiScxlJU01TR/OvCIouOytX
	OhD6URvSKwqr3HcThesb5skUwyd3hvV8bWTmQpfzCJf4PGRAHiYSnZBsuPwwSqUghY9u6TX4wbZ
	R0ugrr/rtaqjlqhaa2tZe3F6FGmQYgBBw8XSC3MfWI/jDuyo0O4CMOPyP5IW72ROfb00xyTAn1j
	X1tkHKiG98vWr2Es4BJveCaZ3RJ98Hyzvf+Gos6P5uPHhueYrgy2Mu+23EZa9NbdcDRaIes3NiD
	PSekJdBPOYMiKvxTtQylE+uuXuFprGE6gMuFA8+zqs1TzREo61FuxnjFTfE+e1D3H1wuh9kk7rq
	Liv/4AF5UM3snQ6DhsnHdvEbdpIc9LBcYxgYnRQm15NgHPUM7ZqmGr
X-Google-Smtp-Source: AGHT+IE804vLe/XfYsP1CbE+EseIvkHg07qVUyP21x79odMEy0pfLI1eQQVGuf6RbGWuOZVH79H2QA==
X-Received: by 2002:a17:902:f550:b0:298:485d:556e with SMTP id d9443c01a7336-2a2f2212bd6mr352395505ad.11.1767239023688;
        Wed, 31 Dec 2025 19:43:43 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:43 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 7/8] arm: dts: mstar: v7: Move the reboot node
Date: Thu,  1 Jan 2026 12:43:05 +0900
Message-ID: <20260101034306.1233091-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194344_484842_4EF61EFF 
X-CRM114-Status: GOOD (  12.33  )
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

The reboot node is currently inside of soc and that makes
the dt validation stuff complain that it wants some properties
that don't exist for reboot which is just some glue and not
a real device.

Move the node out of soc to fix the warnings.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-v7.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
index 3eeafd8c7121..db661e189eec 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
@@ -73,6 +73,13 @@ xtal_div2: xtal_div2 {
 		};
 	};
 
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&pmsleep>;
+		offset = <0xb8>;
+		mask = <0x79>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -105,13 +112,6 @@ pmsleep: syscon@1c00 {
 				reg = <0x1c00 0x100>;
 			};
 
-			reboot {
-				compatible = "syscon-reboot";
-				regmap = <&pmsleep>;
-				offset = <0xb8>;
-				mask = <0x79>;
-			};
-
 			rtc@2400 {
 				compatible = "mstar,msc313-rtc";
 				reg = <0x2400 0x40>;
-- 
2.51.0


