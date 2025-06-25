Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F618C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=; b=3iw9+iEw4V0mQxhU6FY0m8SVUq
	zpPjmp2xZHt1bRiJyqo/vq09AU3XkGrRUitaoTyHK91KOONJKZvUmA4VhMPtluNiyp9tdplQ0BNIq
	aENIsqDCDldlm5/YVy/Nh7uB96J4KnVaHWhoZqBHovixr8LobR0CEwma3iPtKaIfY5X4BM03KJXh8
	1loPMdiO5xiR2EjhzxwhZg8pdebGnyzkw0QJaZaiL0dWG3VMWWGB5gEFcyfD1ntngJFrxBQoQp+Qh
	3Q07xyZsR6jMgrlxmk+rQkU3tHyE2xGM11FNa9kLIeOcsODMWTh9PYCQDV/Bz2c4UlYfjW0Grr2i3
	vWogHCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMli-00000008Bax-2SIs;
	Wed, 25 Jun 2025 09:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKif-00000007qPB-3xvb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 07:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=; b=jnNgYvrr+G5C1+vok7cNv7B+v/
	BWtQc+F+a52EqWKiW76pPOiLo3kb6tcnEwtidXbbyZSBaywBDD+LaEQI6jPAxe/kfkV4X2zt7ub30
	vsdYxLNLX0i/xtao8jD5INo3OYcJVoS+0LO7az8z1Am9s5qMRoEoDlDXOYiwpTGnqg95FFmL6mrPF
	skK8cRc79PxSQLMEHIsUhdyKjbktPZcmvcpxXA8Np8qZX0GsLVfNiKdoLeIAL13edmrouBuyOi1kt
	rH37yVRbdeSVYw5mIKtZcZV5QhL902QXlcaLrE3T5NNPabayGBTNi+2WILDPoubSg9Bwxm+2JVR02
	64hhz+qA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKid-00000005eOh-1K0g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:38:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235ea292956so66950565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750837132; x=1751441932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=;
        b=PADvYbTbEb/xkV8BPZbH/85av0Dd1V248VgWeDeKc4O25KQDmvDIt/4LLcVvqTguPH
         BQuRJXP5vECgl27pykHZ7f18cMQwOZvSpPOv13QE3sEuI14RF9YRANtdtRpoDUFUmo7Z
         16+2nSFZY5T1Mq4qGEZkW9ANIGrxfs9mzk/QSso3z+ie3m0bJrp0jENyvn4g02PMXh67
         GUHBGlIsRyDknln2cYkdQetYNFevJuKZy4YdVR4/fewOJBCc9KV0Ti+CD/nREGEIONx0
         9UcKojDLTw1GPoK9EOcSoGYnawjVA2ShLq3fFflp41W0zevlG5TKvRCvD3wwYvaOT9QU
         CDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837132; x=1751441932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=;
        b=IfS/WHdMUcjFh2HsbZkZBZ2SvCd6JRT0AxurTh/b3V22HTYpvHeUln7n2joLpBgMOu
         /GRjGDqy2vF1WVcS4i2Jv2HRoc5KxUqUPCXrudHSKVOIsZk77T7PMZk1sbmvnLbl9iVE
         ZlM8QkItiBp5XqTGWKe1KTrsri9RK+Ltu8Yo2DK0UDsmhQTdBR/Xb03/7PtQfjuqkfJc
         Wov3QYhx7wfBZVwWdHoAIGCF+vElzU+yMKYGhuF2ZjxeWtcaMlrvqpSsHTfBUSmKHuPm
         SRDbaMZOOlsEXffDTNYBIa/VWfy/9C6fNLDMlKyyvG+TxsQ2WMnSv3OoLbxiT4aASOeh
         YsVw==
X-Forwarded-Encrypted: i=1; AJvYcCUHMQzTzHJMpthDAe1SLZNFlxMg6HMGtSM/wpGefeXEWyVRKYbYBh8L3iO2v1ZfCwRYXBhdamsTvxFdCLSUFrST@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm22NLnBhh18Gb7VqU0yWVrl2gqa8xScHNIklIRT+5mj1raMKj
	X4V15NK5JzyIEmbHGXCFfPsbjFL3nIfy22SsDKIuAIKfby1IuisgSrmw
X-Gm-Gg: ASbGncuteSsWjpfvtzxvDjsN5Q8lmhRR9FlUOLILzKbVUDfneCCM8YeiRJeiPVQwig1
	R/U25fvyziDERNK8qqhVvTcTdeHS2KiAPOETQw3HovG+FVLSPPDKlnx2Flb/rLhpcnhtqxTjeIU
	Caa8P9jEVGeN4Dl+a90atIVQKEg+Lwvennx9ZhQsoTqkWbOkj5CPUO6ekPpM9EGo5Fx67izZLvw
	dRbWlbgJgUrPHwXxnuBWpZoDPpjDMpuvr5o0V9wAbbS1ZwfI78NlSa9EJp5wm6zkqNlcat2XYjo
	D58TcJlvDR0qGihMFWWqa4TvUdp5fPiqd6FxqZRDi8WeeThix2tNy1U43qQzS7Dna1Y40vMBG4Q
	wDhY+hoYEvxu00uc8LOEomWnAwTRT6IR8K3uhMM97FRDEO0T8JMT++VVxl2HccnggQ1QhbqpYEZ
	jXSidUn5uxSkg0ow==
X-Google-Smtp-Source: AGHT+IEAYJ2SDUHupwKAlisVD3ai/2xripja2VDUoY9Ul4K/z1BlfG/iLbXNiETNKFpAqA+j53TumQ==
X-Received: by 2002:a17:902:dace:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-23824079303mr47397585ad.44.1750837131671;
        Wed, 25 Jun 2025 00:38:51 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-29b2-bfd3-aa15-d345.emome-ip6.hinet.net. [2001:b400:e389:b6b2:29b2:bfd3:aa15:d345])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86a3083sm125374285ad.195.2025.06.25.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:38:51 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Meta (Facebook) Santabarbara BMC (AST2600)
Date: Wed, 25 Jun 2025 15:38:36 +0800
Message-ID: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_083855_431174_8B2C1C06 
X-CRM114-Status: UNSURE (   9.72  )
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
Add linux device tree entry related to Meta (Facebook) Santabarbara
specific devices connected to BMC (AST2600) SoC.

Change log
v1 -> v2:
  - Enable mac3 node
  - Add GPIO line-name FM_MUX1_SEL_R
  - Remove 'pinctrl-names' from gpio0 node
  - Reorder top-level nodes alphabetically
  - Reorder device node properties per style
v1:
  - Create santabarbara dts file.

Fred Chen (2):
  dt-bindings: arm: aspeed: add Meta Santabarbara board
  ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-santabarbara.dts      | 982 ++++++++++++++++++
 3 files changed, 984 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts

-- 
2.49.0


