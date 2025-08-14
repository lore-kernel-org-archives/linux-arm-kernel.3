Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80671CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vtNqM5cUWkHkJ7hl5Vy5tYw9YoAE/TzQUQgSXyn0i3U=; b=2GBqc4AHuUdccoPAJbqDmZJ8zx
	P5IGa0byIpofbAMFAiAOkP5UbGmrR+7dAJt8xS+29TXhYxsrvmEyL4zLQmEzkQdHVVYKbsS3nQNDb
	LeS+EwAvJhgjvu1MmrqFLCBShdkaFoIFiE67ZKQH5kZCOwzbXNSywEgTgtneKgrvErMOsGvwLy+Ju
	R0Ipq/zFK0k1GGgV8RZ2maRa2n9sby2DsWzyQI4Jl63klx55Hym55QXgCsLuidlsDZ+yhbB6CpGaa
	IAciKfFCrWkA8xVJBP44YRGK21vC5nAruEqSX/KpnFgXaJurUJbbJVpskwIC539cyT35YMhpkXvFR
	GMTkWqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYU8-0000000H8fd-1kbY;
	Thu, 14 Aug 2025 13:59:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpV-0000000H1M2-1bhP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vtNqM5cUWkHkJ7hl5Vy5tYw9YoAE/TzQUQgSXyn0i3U=; b=J9wWLbiq9fOInZLu4T3u9YY9h1
	ILvGH9JCgiuM/KZpYe+lAv5GaFRwIx0c94HYnbx4LelpdGhKXq1GH0Owd6RUeoGruGX7Ee9KhWfL7
	dvK7n5AU4J0S8WEXKgHiGMwxx8wyxU90eOxxiEBjGjvgpFngOxI7tXGZ9OAi2Nz7j9ORLCBjBk631
	WRhmaqfMCm2kP8H9gYe5gNolqIbld3gjGtJqqu6FaKTlqUBZ1Jqz3TKn1Ntjr32NwEA9tbwVvuZ/H
	5BKg6yLBUCQf8g6sHMFBZDatLSvjeA7HVrjAQH/49e+5wHUr1GnYXfVU8akkcNen79kN/qcEg3UmT
	AqUCwPhw==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpR-0000000GOBs-3xEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:17:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b47174beccfso659365a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177431; x=1755782231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtNqM5cUWkHkJ7hl5Vy5tYw9YoAE/TzQUQgSXyn0i3U=;
        b=HyZJSyRTU1lWq3su3NL9l/LB2/cQVmVMayKFW4KJfXK0O+rX98f9JpYPO6JbpZEOMJ
         W9ksOkvDBFS/tNY7bZ7HrmUsPtT1WFVZnSaqWvw0juSr3Wz5t62AlsZga5DFNDoxE9eU
         Ni5hjhnTEmsQOc84AsqWNy5jdMZv9uXX3Tvm1KI60dovTJpuI9fr6uCJH58TsQ65bcbf
         1kNo4AElklr4TEpnlpVCGwG9g/VPXFE1SH44i/FLU3T/adljtaDFzCLMbITBdSwWtivv
         m76fDTktx/yVe04BYf83atI+ByKGgRuR3FGgzKkiZYpcnsTdHWkXM2DRui1HDkXFwTL0
         NMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177431; x=1755782231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtNqM5cUWkHkJ7hl5Vy5tYw9YoAE/TzQUQgSXyn0i3U=;
        b=SZ01ozNnHRb8DDVUb2XpvHEzd7kshQf7AzKn8zywDRCPq9ZdplevsrbUhdm/LoH/pH
         i6MBeX20lJiMwZJfZjTZZQCtFsG4aAcCuvf4T5sneAe/aaKbOwnU9frQPQvnwwOEo0mD
         +1OiJMWTZj9bl0NqKC2aJGzS7eR+eQreFpziCW+qlZd/5BN9DC7sudFQHI79YAFB0V3b
         +1JTCmsuIcYkAMQ5La6B0CXWR5awLVLKMIZBxbye4JAowM7jJ2xZl897Yvbke4k+S+oQ
         +IV5CERr6h2ut+HIIX14Vhg/1ayzvnFMlQLnn86CbK5mTUtHb+pnKMdKaOwYyR1wH/gP
         Y0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXTxqRbStbgCtCpjfvbYXWdgIZ7cMF7BlTJawCsnSa36sMWzvTeU5d7+2nZbg3nHdAI9oFovKnLVRVdWnahMWKa@lists.infradead.org
X-Gm-Message-State: AOJu0YxSa92tspZOZLptXh7fmqC9ZGigCI6Vmj/ioUDAjCKrgBW1vUde
	itMcido9EWSp9ngly5XRCFuUsRBBNPPQzExWTtC9+qOuuPaTEPq7l2J5
X-Gm-Gg: ASbGncvQqsDjR5hFpmcJ1vizwV3Lq5LJVFHH3q6uy/Qgdcq6GuVspDBQnjuWAUKN1Qy
	VyK9b798jZFwZODUAZVwjiljosXLHdydIj0U1rjdsyJc+7b7wL/uv4Ouxm9q3Lovy/yoSwySFvM
	I3XIUXhxz7QJBjYlwu4EMfJDfrirSkzsU5FNgWFk1ug54373tu5luav2iF3TrOHERv45Psz32A1
	acYe0mJIEdWkjCCARKOOjP9IjU7/J39PbIPWgXoFiPxxfDDW4YOQIZebPFQwu3G92F4eQsBP32C
	myUWzRQE8g6PgVtXvJtcTHjpw2Z+cWZbofi8h+fU/aBi2RcuJOjnZFVXviyMqueoYE2bOh0pAb8
	UDCS3NV9dyceg7e9xaZhMYOCHPF4dHjL1CP+lvoVzUVVpFKlmy2QtqLCONX7sm0PuO5p4Hy7qNb
	HKPUG0aoIPMU4qqdxL9WUIdw==
X-Google-Smtp-Source: AGHT+IFa7QfMuw5Y7JIUV4eh1A1Uc0XGu+XJ+9r3P5sIVVSAVSVpPVZ+2s3TAqMI+/lS4qOg8heSQg==
X-Received: by 2002:a17:903:1b03:b0:23f:e2e0:f89b with SMTP id d9443c01a7336-244584b4658mr43434605ad.3.1755177430731;
        Thu, 14 Aug 2025 06:17:10 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm335652995ad.63.2025.08.14.06.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:17:10 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Revise Meta Santabarbara devicetree
Date: Thu, 14 Aug 2025 21:16:56 +0800
Message-ID: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141714_120568_FF32D915 
X-CRM114-Status: UNSURE (   8.94  )
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
Revise linux device tree entry related to Meta (Facebook) Santabarbara.

Change log
v1 -> v2:
  - add 'bmc_ready_noled' LED and update commit message
  - add sgpio line name for leak detection
v1:
  - add sensor nodes for extension board
  - add mctp node for NIC
  - adjust LED configuration

Fred Chen (4):
  ARM: dts: aspeed: santabarbara: add sensor support for extension
    boards
  ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
  ARM: dts: aspeed: santabarbara: Adjust LED configuration
  ARM: dts: aspeed: santabarbara: add sgpio line name for leak detection

 .../aspeed-bmc-facebook-santabarbara.dts      | 857 +++++++++++++++++-
 1 file changed, 853 insertions(+), 4 deletions(-)

-- 
2.49.0


