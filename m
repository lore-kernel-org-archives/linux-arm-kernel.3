Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1779E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ODXSKIPM8Xa+YaYVLc8WanEICuRtJG6U7jSPf/7hZw=; b=FRnS/JmjuG8o/nHtKJ1ztdFWpJ
	C6fut2ZXGh0Zsq2yEeav50YDQ5WID3Mv6Dpql2iFp+Q1t0OQQYcTjHHKtavvEJBC7HVqyr8chwA89
	xn4raAlihI/BKC1O9b7zHiWtDyFastewavlKe8zEMXmlNB8mw5FAewM3ksdhv7Tjx3Jjs8gSnWQ+6
	29KJZdTs9zEg8R5k2xbOcZDYkbXuY1vV4l+8W6hOXWX6e1P2PFsXQkHrNq+kCPpjl0C22cNfq+Egx
	k5vtkEp8m9c3biYpmXfxhSSQXPUdLA8WDwra+RD6VCNc/iNxwMjeXBEX6a5Bqw8cNsCzqdoUcSM/c
	/QUUaYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CaG-00000009c2h-0HdG;
	Sat, 02 Nov 2024 11:46:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CVT-00000009bIl-305d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:41:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9a19bf0a1dso53910366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730547685; x=1731152485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ODXSKIPM8Xa+YaYVLc8WanEICuRtJG6U7jSPf/7hZw=;
        b=YBBAUlWVpAySn47qDF8iFMPKF0Qx3n5Wx+hfYJTeE5j5OeY2V6fQcOkynJSwBf6jBh
         nDhcHet+W3cQxAPK2RtG9mqOxpwDUzv4VOzLvr7U09br/c/RRrXKNa9uEzrkrj4CmBgG
         B/C40SY8j+HbtcK179HhcMNiBJ2Is4ftnEA8k1FI5gDjYaKaBWFnC/AXOccPrlNqCEF/
         cgZZV0bxTFrg4NUDFLT+QAT/h9s5r6S3cSnkb2xlLhYW6wBGs1Z9BOaQtSVj9GlNUXnx
         /LrafNvg+5NZV5Zc3E+69gXfdL1TKRlHu3HQtE3+YCxQ9uDFkK0WgHTC/yVw6PcV4g0V
         nscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547685; x=1731152485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ODXSKIPM8Xa+YaYVLc8WanEICuRtJG6U7jSPf/7hZw=;
        b=d571ivy6LsaNGZZR9Zd8XAy0x7splpzk43tAYIqfED0XNcFteL3gfl9hGRcsS5ipF8
         /pkbtSRDaq6CrOT7HiGdDo81Rns03KrbvNYEgbpMlXWWVJu7E+UeRV9H255zAKhv8vrg
         Pr0iJ4jfoTASgkVlhGttTbamkl3PtbM7RwRyxioAu/57St061czKmxBV4Yu92aFRhOTE
         3H4ZzCFThbBwX4L4Qk0pEB4xLBQC/wnwmp1BZ+ZpfpsBssmR6xjFFIXNNaCR1XB7SUwS
         nsz7/jXYAqw9OY3Ks8k2vOpnOaDLvl2ZbcldNm0g/c7YAl3axWSe/aaO0Z/69i5D+KuD
         d+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX52wvcuF5W+QJwq2jxvxV664euXlaR3z+9YjY13pA1PbpskqBWtiJ1OZ/CIsn9lX3fZZ8T4BfS1YaCjzzc204S@lists.infradead.org
X-Gm-Message-State: AOJu0YwZBd0iYJFM6inq+zcOM8DsdA//t5B4bLQlawdeao9xHnyEfejT
	EUPAOlY3xIIv4ReZmRvksjc6iWNK32lCyVY5tAUaXOLEvFolr+Tt
X-Google-Smtp-Source: AGHT+IGP63fQoQMFb/ObB1eGQudz2/rh/yY91dTuFfLQmvqaGKroFryYsgP1YkjTo2qDjj678icCdA==
X-Received: by 2002:a05:6402:3546:b0:5c5:bebb:5409 with SMTP id 4fb4d7f45d1cf-5cbbf88efbemr8731768a12.3.1730547685210;
        Sat, 02 Nov 2024 04:41:25 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:41:24 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peppe.cavallaro@st.com,
	devicetree@vger.kernel.org,
	l.rubusch@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add support for Synopsis DesignWare version 3.72a
Date: Sat,  2 Nov 2024 11:41:20 +0000
Message-Id: <20241102114122.4631-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044127_779362_2E5A04DE 
X-CRM114-Status: GOOD (  10.55  )
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

Add compatibility and dt-binding for Synopsis DesignWare version 3.72a.
The dwmac is used on some older Altera/Intel SoCs such as Arria10.
Updating compatibles in the driver and bindings for the DT improves the
binding check coverage for such SoCs.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
Lothar Rubusch (2):
  net: stmmac: add support for dwmac 3.72a
  dt-bindings: net: snps,dwmac: add support for Arria10

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 3 files changed, 4 insertions(+)

-- 
2.39.2


