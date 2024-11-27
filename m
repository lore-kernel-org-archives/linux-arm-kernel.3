Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D10D609AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=; b=36AQJFqav/AbiA9F3jBJTRddqi
	nGmRWuOQwTKPbsuld6KNyuO1YP5cu/W7e/X2v2rHjazeKHuUtkmKHZFOyJQj4ZKqgPQlEEtXgMOm2
	lL2hL04ufS9YtsoIjuNLNGsTUbC2mWX1ChX2mn7SaPcQ4ksWwMRnmOHongJ61X8baYOfQr2d7dRrK
	2GvSjYolx1i4E1mkgv1SMc7/Br4cZB9ci84WeV6arlNFIHmmULJtvsyfsFTBEM8FpwxOepSDz+a12
	C1u8ZuyhcXsWP8zd7RHAeV5vwcwy/uMWnGoBfzi9oRy77+Ep22f0Y4lmLzZdKL0TM+RQd1qnMuaSe
	3SP0PGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCdo-0000000CSYL-19Ru;
	Wed, 27 Nov 2024 07:39:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCb6-0000000CS5S-3jyk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:36:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2124a86f4cbso58137465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 23:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732692988; x=1733297788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=;
        b=AO5DdMPgFSyIb40FD7Z3Up8gjVkgkPPmrquIsAtoQxFi+liwH9IhKoe7HdMT+K7Sij
         QgUQNEth0gD3dtRKL4gFHuJlZTt5noFqSpNj416ORzrn32JKuPw9+QJ08/G+oCZQ8TAM
         mgTzF2AFOp2OiaPkKgQ+e5rTy/3mTOVpd7MhdLTUjGJTMYEXHgEuggImWn0f3w7Fnxcm
         BQCjm3hHA7VnlQ7LQnsiWQ0P/yNrt4eoyKBK9AGntOcq7JnuuGbz++lrjhzRxBz3FBeA
         0Y4OIU2Uvj2nMDiVqNPVz1A9g6ofh1g/S3WA0YKfiMW/dRwYKjYaAtm3NKrhbmKbxzh9
         Me0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692988; x=1733297788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=;
        b=KmtMzCzuJf4lNFNHcYGLoYbKw0XJJf+ckgdtxaVXErTLF56TUVjfwxDgtfQDB+/YBI
         qm/71upqLoG5zKuxC6/4NPuAx0SeyXPf3n1S/lYoIcEkzt2V+BxBSj3fMul0boJp0gtA
         t6RrWKADMCiabhrVQIIkdMb4q+a5s7O4iTJMjgazfYpFYwoeKqyYVbvJw1OV2wlLnG1p
         kuWAs9p1CtxDn0lFziC++n5woXooGUZEsnCq/qeH3UGbnrMxm+/736Qi4D5XOGRtDI6j
         SlPomVh479nKF/J7eUYo+VRKbJBoXo4am+5trE7r5iKNIE/zQuM5+8pLjoimei3GFKqn
         UjJw==
X-Forwarded-Encrypted: i=1; AJvYcCXXoXxWobfwXUEfTqO8kEI2KCw4R1uxETOFhaQAQjuKFY4ZDlTH3+uMWzsnTE3wgGVQguoLpS84tD1yxt2rDhrd@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNx/OmwzkZb3dZV0ha9D+GXc60nyIsRvGEEyj6LjZL+D1hVap
	ppcrS2PbmHkG3xSOcKQyH1nEKJ5vi15+kb4yfOsxEcoPp97q1hHX
X-Gm-Gg: ASbGncv677VTuRWIxmd/zWmOtTGZ0XIZkdl03S9Z2YthtX1NQ/zZZ/3fcgufMu5Pwqp
	v2c1FBq93PFLcnls0GYAtm/nAuehH+hsUyMWQ6uSdZgq0pG2gB1e0cVihMpPUEC8XlPuThfpu26
	AcBKzOkA/R16FQ2oiLXsyAPWK3/rnLJzg136HE+R5O2TlcgCSxnJW5rjftueQtkJfkdiHTTc1XN
	XbarIM50PU65h2axmjAxr6l7LdOsZ9pimR8QEOpkKJEuNakmRoOFNJcDQ8JrXWsdOfNY0hBqwJZ
	RsDqnVjCb2AcuTiHjmxeHShOHuMdeK3ayeurrF6uCtyUgcMy4JNlLVvCT6U5DwvJ
X-Google-Smtp-Source: AGHT+IG1U89chfNV0r2N/Ys958Tsn/VJWbzzAzfyPeysRKC6V5+dBYw2Af9LPTvoIkumGYTgKdkwoA==
X-Received: by 2002:a17:902:cf06:b0:20b:79cb:492f with SMTP id d9443c01a7336-21501b63d30mr28773365ad.43.1732692987950;
        Tue, 26 Nov 2024 23:36:27 -0800 (PST)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c645sm96597095ad.16.2024.11.26.23.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 23:36:27 -0800 (PST)
From: Jason Hsu <jasonhell19@gmail.com>
X-Google-Original-From: Jason Hsu <jason-hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason-Hsu <jasonhell19@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Wed, 27 Nov 2024 15:34:08 +0800
Message-Id: <20241127073409.147714-2-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127073409.147714-1-jason-hsu@quantatw.com>
References: <20241127073409.147714-1-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_233628_918589_F577A942 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Jason-Hsu <jasonhell19@gmail.com>

Document the new compatibles used on Meta Ventura.
Add subject prefix for the patch.

Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..98ea2b3e0eb1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -86,6 +86,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.34.1


