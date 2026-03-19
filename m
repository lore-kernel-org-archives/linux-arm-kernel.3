Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46A81088E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6erT9bgufZ7MZ4f9CnO1/3XNBgFe6fD+FWbntiQgHI=; b=cB/aI2oIWqIeEXJlkeEtww65CP
	YvnKArbQ174DR/Zxyl6PWiJ+zijOj5u+HYsnSWrP7kDFSjhv1elwk0AK9KVmFBHee1nEU/71ZIDaC
	PKr9V4K+8NKt3vX7W426NQfq72JM8p4jTV+cXIeuRnaAdlr98i7+P0189DFAxwa1JUiz/N9qCOfHY
	Uf6l7DjVezeG2u34s7LndE24s6WP1PxE9dnzDjQE8nHYJvAz5Icr8NmTJbnTQYg0bTrBfUO1OVuyv
	i3UcPdJt/9vbc+zOONNOID+nTd/6pqmcaG61phcECMDOeBTZrXzjAulzuIsOcTUvM+28TIwDV2TJ7
	+hx5jkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SA-00000009rGv-1wla;
	Thu, 19 Mar 2026 03:53:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34S8-00000009rGW-20iE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35a1f549e7eso391565a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892422; x=1774497222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6erT9bgufZ7MZ4f9CnO1/3XNBgFe6fD+FWbntiQgHI=;
        b=nCewNWIDECMEQjQThpIx0gpEtUeXUBYhr0PH1ztvGcg6X+45FZp/PQWw/ji6WnuF5i
         s1imY2yy+E82GxMIYopkektEVMNXEptvUhG/IZpJZ8d6Xb58Xo6CW2DfQrZ2ZJMEIVgn
         9w7ESey7Pw4bwYvFwywKrogzbogj6vQA+bWRql0vG9oLwnwjfZudOLpXBL8MnNz8OWiW
         GUrv7ee31C4ReEOJ0H/3i013JOzA+6fZi/fQrOXKGgrD6nqt1Is5TrsW4XfHQwM2+WJ0
         fVBhaWMhOTro8V3vLswMJni0ZkWvzMOMaN6vilMZLkpNEiJqi7DUmpNLRoVUArP9mFom
         GT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892422; x=1774497222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6erT9bgufZ7MZ4f9CnO1/3XNBgFe6fD+FWbntiQgHI=;
        b=kPAtmvcS5+9Mk5Cs3gCS77PBxcsrJXUKIn3a9xKia4AuKQr8X9su81VdhHbDl7uK9D
         1GTAMDVtkNCNnMURgL2IvatC2jeMnjW+JKe01twpx8/yVQZJrWKZABpCDoK6S5fS17/Q
         eg01F28gHYFFyiQaGyLEvHkM824WpuBJ7DrgyJQt/OownDFxy86O11dYAPVv7TYN2vkp
         UhuOkC8OHzkDQbQS5UiQmPo4yLsrnoiZUy6VBeJeJZMyoq/LTvq5P1HOQYlTcckCvlri
         ASFPLvZMUbezk8JKbrdqwVLxdMfglvbGxgZatlxK7LGUZMGydLHx2yPtg/nd7nn+8brd
         +5EA==
X-Forwarded-Encrypted: i=1; AJvYcCW7aM6Bg3EQQgG615rTCYTRVjll7/M6mmMfNX/bbfWHLl7mRZDg8xhPQEgq3UZRrxGdJLdP2DkZj2etg8M7+7AQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwPxU3tdFXkPg8Hg1Teg38gOEK/mZ4KfNcwhjn6vCN4qMgliYPW
	brY8ry9vAywqQiuCJggveqKyJorv/EaPRHVgODltdfWa4CGJkstiRU9P
X-Gm-Gg: ATEYQzyAtUylECARP/3ON3OU6HnuaH+SVmB3CHNADlc/LiqsIGD7Z8o7X+bVWxktXVk
	NnGUCG+oS24lI4c5wSRJetJXSXaGT+nhq2CTQIudE3Lyim41D/0+dKQyaG0qYzlZUoisjYSJS43
	8ZOnQpAAfKTszQwfGGKNLTCWeMlT7M0dnpCCbN5JbYYxnGOSO5If6AzNlprfHreboYsXb307SK/
	6hDWv40m5TUSaEfesEGltqSY+j+kP2V0NtEsKDCeiKZfO4kGksgi3BGzWtO+3jcEpXDRngc913k
	KvfUd10pLcfcq9lc6hsAsCw6cNCPfRORZ+A+aegGbrBjuA7ENtVyczTlTxicVxaLeh5nnlUZvEF
	Kb0Y96rJmpppIj6UZBH2rzOM0IvR7h1zICyAozcOJ+StEWVfa+WWf93Eugzrq7yOLJg1nmBOYaa
	1mrKO+c4/CIn0ACaIGsiawny27X/QJCWtCyHTb43py6WxC/YIM5Ft3Y40=
X-Received: by 2002:a17:90b:3e43:b0:35b:8d89:719a with SMTP id 98e67ed59e1d1-35bb9e80724mr5046203a91.15.1773892422505;
        Wed, 18 Mar 2026 20:53:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/6] ARM: dts: BCM5301X: EA9200: various fixes
Date: Wed, 18 Mar 2026 20:53:18 -0700
Message-ID: <20260319035324.269905-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_205344_541861_48185FC5 
X-CRM114-Status: UNSURE (   7.94  )
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

This series adds extra definitions for the EA9200 that were missing for
whatever reason.

Rosen Penev (6):
  ARM: dts: BCM5301X: EA9200: add WiFi button
  ARM: dts: BCM5301X: EA9200: add USB GPIOs
  ARM: dts: BCM5301X: EA9200: add LEDs
  ARM: dts: BCM5301X: EA9200: add wifi definitions
  ARM: dts: BCM5301X: EA9200: specify partitions
  ARM: dts: BCM5301X: EA9200: set MAC from nvram

 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)

--
2.53.0


