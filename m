Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ABEC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kq75SIqPsOJ1DQd3x8jl/mu37HxVt1wTwstMgXOJ46M=; b=fivHOPPpJRP0EG2oACPaSZB//U
	XJbMImGAtqhjXBt60hjBsI/wZ9c2H5M7z1sJDbZmwM9bw0pEFqqjyHu5yNXr2o89mXDKZGf13AVGZ
	+ZDhgwS0zr6CVuvbTgnWoiI2UWTyyNnpbDSaFV33jYQ+hnPBHTxby1bTtxYRleykUTikIzPlUGNIl
	Qj6vx+8BdFokIQ3hLHEPOBP0bmW5cq3o3kWL/B+dN+3agcALJMLB1bhWKZbFqcroNDFNyRxmEZtGV
	ZhYF/hJzOaWvkTSxuuXJVJfSilwQ+rhnr8SBYp5ndNRwHJbKlFcbDh0ibRE1HYKSmSu7hFFGhTFGM
	Uh8JqqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUL6-0000000033S-1nHa;
	Fri, 06 Jun 2025 10:30:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUIy-000000002fh-2LYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:28:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235ea292956so19742185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205687; x=1749810487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq75SIqPsOJ1DQd3x8jl/mu37HxVt1wTwstMgXOJ46M=;
        b=IRrQPDBvS6sZg+1vSI3A6pvSn9RacGWyaNE9JxyKTM5wTn8SGVCez10HLtXd581WqA
         Qu47+B9gpMAYQbxei49rl51/SoMRSBDfMGMW8cdSUEVYa0i3BG5vm2u6SSKyHil0U6u3
         V22eM+kNGh/KhwCpuMIE6tgRH8RYF4y/L688xdgNvvJacRrWiBH2UIckLl8qMyfGGI/8
         gguO+BEF9rN5UQys6pHip1EqSl8FZE6FDUncljCwD65xfLI9aEMQVYiZbEyavyScRFU7
         P++bu2HXWXLc4HPbuPd90xGFMspOFvpE9k063uEx2CEGmBGQyZ93iL4fDzqhF5pgmVGO
         A13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205687; x=1749810487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq75SIqPsOJ1DQd3x8jl/mu37HxVt1wTwstMgXOJ46M=;
        b=vX2/CRQLhoWXNHvGU00XcfWI2ZhNUh9zxun74dxtUKCk9XldU9+UIZNtG5ChRo/G34
         XBQv5yNAoaRab3o+W5k1GPPrubH/2Oy3r1lXiuKA4RJdIBNdj0kX/OFjBu6QKHre4d52
         DB1psOdYw/YQBv56ok5y1ouSTt/8TfPy3LKKb4O2BR6DMlC+96fCFq00/Nd4B5+5S+OL
         Xt7sOH7NQmXHQhDdVuUpTqz23MRDQECxD6irjjFAbieYwH2lF3MtDQ3g4E/7klnD50Jo
         0GT9GuF7E0x6w//8fov6/6OQ4cCTCBjrMaNTfic3MHppMJxFzqG90ytxy1TBndR5CDdB
         othg==
X-Forwarded-Encrypted: i=1; AJvYcCWfCeFGbPny9RfWlsePDrs0bRVJJm9SYBP8wWm9HQ9SDNt1b/iQnhBueIdb2q7HPau1wIPs7+y8Wks1Sanz4UhS@lists.infradead.org
X-Gm-Message-State: AOJu0YyrCPIm+l+IXWeYCuyNmqoD3Zlpo5+Zuz8t8MWkTsK0T8Q8ppW9
	MYHgeoNh8/wIqZJLASaxlyMcE220PLvfFYm1SYN31ei/V4VyiZmjv9Tc
X-Gm-Gg: ASbGncsRemo9gjswn7qEpHwCBaglTwEi3eWTZwZvtAwnAeC9oGbRfI4Jnv8XrccR0YZ
	5xwIMdjQvpt1hjvILYgTPItxxSlFENaQ5bUPAx/wKagQyXzm5iaS1jUCJQXLLkExelcOiTbHkMK
	fMHZh6me1Pb6hPbnmrzAerKLohdrNsdoP9FYL2Ed1tGMhhxQxn+GYG05SsGLmFECTn+UGuQIPmq
	aYXltn7V9Ib6tdJs99Q026CU6iSRZQiiymw0EMoRerHIEZXVB53rJormg7tOLapjDtckdOmQtyK
	wXCfTbAMOuJ9u0SldzxSXYZ4lPZTa+Zd6W+8xrWkGNIY/m/1nSQiXoK0NTRACbn5gTHbK2f564k
	Grph8AGUzKD9STCWg9AuH8YpadJWIns3X0+73tITL4BFG7kqxd9cfrE5+GrRvftnuaFSIUZFz7X
	s=
X-Google-Smtp-Source: AGHT+IHWIRzmPF9hBfCr89nWxfu/OXV/L7N6WZrJscNojX76/huWUu2nhvxP0kFj4o42XVFggGnTGQ==
X-Received: by 2002:a17:902:f652:b0:235:779:edfd with SMTP id d9443c01a7336-23601d97820mr40085765ad.39.1749205687155;
        Fri, 06 Jun 2025 03:28:07 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e35c-06eb-80f3-97a6-ae1b-00f8.emome-ip6.hinet.net. [2001:b400:e35c:6eb:80f3:97a6:ae1b:f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360307813bsm9632885ad.22.2025.06.06.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:06 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add Meta(Facebook) Santabarbara BMC(AST2600)
Date: Fri,  6 Jun 2025 18:27:52 +0800
Message-ID: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032808_597576_924D3A7F 
X-CRM114-Status: UNSURE (   8.61  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) Santabarbara
specific devices connected to BMC(AST2600) SoC.

Fred Chen (2):
  dt-bindings: arm: aspeed: add Meta Santabarbara board
  ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-santabarbara.dts      | 978 ++++++++++++++++++
 3 files changed, 980 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts

-- 
2.49.0


