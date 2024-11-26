Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA4AD3B984
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sEBwZCx8NPUgEcdmfQO/S+vdhBOxXQpHUc12agCsHis=; b=RhDRsAZnmE83Vr9hmMk9d7OYSL
	VpvclU6iwx/SwetEj+doS2BCfePSzcCsv2zF1hlGlAuilToGDtzsV/dyuRQGfRMui2Y65/6bgoGrV
	DT2XkyXRZ2TMdT9sTeM4e7Y9m8/7sGNSFLGvTuaPG9zgZOufi3+StVBWmxToAsFugvnty5IKD6V0h
	AbUTC5s+N8VeRdKLDrPESlJY1Z3f7mnZ46xPVWn30F04VUGETFDHVs8e1+ruRxrAMmJNcz2jtXg21
	kdeZseos4nUau3eLbySpjR02Hntss0CUpkGmTNJnx3tLxkV8OCUySL41T9rhicuV8S5DeKEUX7twp
	v5aCirXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtdI-0000000AOcP-3mmy;
	Tue, 26 Nov 2024 11:21:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtcK-0000000AOT0-0ude
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:20:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-212008b0d6eso44408415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732620027; x=1733224827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEBwZCx8NPUgEcdmfQO/S+vdhBOxXQpHUc12agCsHis=;
        b=Hz4Qhy1xyubKIHUzEcfL3ooy38yyDHQm8mAz9ouVULDfWdq04WKpEk8acXxreDwlVq
         mNY3L8rvlRVRq1TJf6HLcxkRuosOkUw2RI6ob43NMxqi1rmpilrny/0c4Z8TmnZBrXcc
         IH6KKqsu4KZg1IQA4oE+srbaM28o9b9mMKb54SU8yvIXL29CDJP71ggKKXrqMiH8i76r
         jUlbfs2jEs+U1mV1VgoWTsq5/XGZNxIySSkqN1c79wIcXNciFJuQP8xixn9ilBTaqi4y
         bfeO992FdtyW8DnyzdbYu/1OFAj8FMG1j4+xS/YlqT3E90yo1oOXt8hkp7IZFpiRh2ON
         Bv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732620027; x=1733224827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEBwZCx8NPUgEcdmfQO/S+vdhBOxXQpHUc12agCsHis=;
        b=I0g4+dvakKWM3QYSdvYJv8hzLByU9gWBjA+nutQtu2PzqPx0s/ip7dHBRyyFQCwld3
         IsAO1v1s92a4e3GmWM5XkvKEXcAm3CwqSk0OrDTIKCp8r8HBBSkCNU6LNwVCdbgGwY/X
         rwalDrThhGjXuVhfDYf6AKplTvYIGsaU65pr+0EaWVAKwVo9derDKT3RzuskHa+bSFtR
         VKA+T6Mkx+XRPCi2xcKZDUvMYKxNdDC5m9Z3vXAsW0rY0zJzh7Cd7KUGMHLFGKkvWCkU
         O3OdGuR3ETXMbOGYxjLErmCNsYo7TwdoQpfAytA9I4VXzxvMfRZnYr7KAu2hXyFU3V3C
         1uqA==
X-Forwarded-Encrypted: i=1; AJvYcCVeBC8Ne8kPDfPRHUOukV6rbHVH+rQrxcmCeiKMqlCwSd8KJ83PRO4ILE2SYsukBxVpJDUTyJ/oiSJ9K+2CAIKU@lists.infradead.org
X-Gm-Message-State: AOJu0YwuPNX09GLElgDuQxxkziL0gcKDT7wsrjBbRIZKW7ZPRuRwQvm0
	MFOMGvPitYWYcGTa1TsWn9L5k+AwkT4rHDPe/vFpLminZ7/w2qa/
X-Gm-Gg: ASbGncs5VtMCJNEA5VoQ03cI1DbtMuAIZUnt4eWw6mO4MukU3EWftwG91No6lPKjXW7
	IYc1sUGYHAxGsuvBXqzt3gMG9AabR4ULAEODrCLw1IW+O1oxP1ExwnSL/OvGP/gf1NhT7pcDXE/
	Krh0N3wHdm9r2FgpkdJ31HtEClJgS4aIIsWtxhC4YWd5iJ2rpOMGgdCQRWqnfIhFbrgsLSTSD+W
	okhXlM66EKEUN+I0e4pwwBiCnwJEBBKzsYqwomSrzlXwJGZUQRuBVVA9FpoRbSli6hyWnpY0AbT
	/9g9DIQPUb3Fy4nEexwxU4hELWbJeP6e4r4vaKBRqfNKrpZUkc4B/9MpTHieAFiE
X-Google-Smtp-Source: AGHT+IGjrX9bFz6qa84/F16kDGT6fonLi587arQ3HaODJ+5CESb0p6QYyvh+erm3gzBxo60c5al2IA==
X-Received: by 2002:a17:902:db0f:b0:20c:b485:eda3 with SMTP id d9443c01a7336-2129f2262a6mr206975015ad.20.1732620026715;
        Tue, 26 Nov 2024 03:20:26 -0800 (PST)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba5d4bsm82210885ad.80.2024.11.26.03.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:20:26 -0800 (PST)
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
	Jason Hsu <jason-hsu@quantatw.com>,
	Jason-Hsu <jasonhell19@gmail.com>
Subject: [PATCH v4 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Tue, 26 Nov 2024 19:18:15 +0800
Message-Id: <20241126111817.2331577-1-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_032028_253957_021B9A6C 
X-CRM114-Status: UNSURE (   8.36  )
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

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>
---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
---
    1. Modify email content.
v3:
---
    1. Add mail list.
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically. 
---
Jason Hsu (1):
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

Jason-Hsu (1):
  dt-bindings: arm: aspeed: add Meta Ventura board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 883 ++++++++++++++++++
 3 files changed, 885 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

-- 
2.34.1


