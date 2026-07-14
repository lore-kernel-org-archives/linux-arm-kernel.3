Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78994C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Oe9aWVjKhDNM43muNwN/DRmahJ3UH9WTei9WupS48E=; b=uTchFF1g6znvRh5FvL51KCSdX0
	uUeZ6KruX9xr3QGc5XyPKX0rw4/ysk6WwrvAVWnIV14l0+Tz9eYNuGiyRZrE41Ghpv+go2erZrj/S
	HAuQy1bS+6yNd+lhTSvcsY8JoV3dR0dWQs2CmDTpz93xtd4etRproUxDibrrYYhyfT3MawRilXPGJ
	034I1RuCShA6jVbnnqG0FDAETaK/p/LbyRgwGAgIai0gu/yzagNFLCEiTGF5qRTZ2DhADeyq/pRhz
	fKBDH605448ahT5i52e7lqnuSXilnn3x3FbcpWoViSYPkaD7ffH34mCrpjik9YuNZp0UhRUEcAWi+
	bkGwnYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbw1-0000000BrX1-45SE;
	Tue, 14 Jul 2026 12:08:25 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbvz-0000000BrWH-2iph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:08:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38101f85591so652566a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030902; x=1784635702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Oe9aWVjKhDNM43muNwN/DRmahJ3UH9WTei9WupS48E=;
        b=YdbrSw1M4K39MLYuojXL9yuBZ5sEg2Iw4Lpc0nG+U7pDUekrEI19et7u4qXI/obgAs
         H30pZmF0xnNsdh0H7lvqxB5nZb+s70AiU2h5UmEUFJwC/1UCVZuuHqAiDKb/BxTr5jjE
         iahfFEE1t3mwJepAF1MY1AMXuvdRTfjqM3/sROvWqg3KvKvXh4k8I3un4mT70JDKmRYH
         RnGuDrY2J7CcQ51KeqkMm6+B27mRczB228KYuvD6LZAr1lGpOtvaiDWXgBNpUXJABxXl
         hTV8KD5//70gLjAaJIbJqHdAWl9LlTiLfTk0xbOYYQd1Z+I6pe8C5xeN74rgTp/lFLrZ
         kf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030902; x=1784635702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Oe9aWVjKhDNM43muNwN/DRmahJ3UH9WTei9WupS48E=;
        b=HnApi6kzaiMEP4wi76IG1ACoGw4NA8PxgussWZItrHJUfwyqLt203zyr1mCGMhf2QE
         2Z5ZlZNAHXHW2gkCMcAGk97kRRSChnNcW4UIEt9qzMM4qiWZb2DbD7fh1GX8xtH1Oc+G
         uh5wfRidEaihZFqX+hh/XpjsAcwXJOIZhuCMpAcJKgLdiCLPp9BMF8y4KPkH0ryLxZ9z
         YUsszpq1WNVy7TCY/ytXACYdMTI9oq1xKKTUQok73BojefZDA8Hk51T6hXqcuwTpv7jM
         2sBlk3lvlNDgpLr64iczHc6YGnF9qdWLlTt330LxVxLruerqHAnoQ6w0Bz6rVD8yyRdD
         D+xA==
X-Forwarded-Encrypted: i=1; AHgh+RrCddy/tiUX+JC3eyJnSTouXNQDyJVJhSFSjM38QpzT9H2Uf1NvaMwUScACNCe4zBFs2BqSHhvdjmBXCkRzIbqv@lists.infradead.org
X-Gm-Message-State: AOJu0YwAKFHR3ZmKHrk8U4qnop/cXZ7/f+ha1UOkteDhwR4iVFQhTBEY
	P3dSmALI7N+UxpnMY9BXT7OWXUvi9YfgZfDzC032AnpiaaN534VWRcBn
X-Gm-Gg: AfdE7ck+f6awo9OrpxXJCUtg+mXVyShdQL7Iv48ZdZja/aHhV2mzWeKYBtqJKOc8JXU
	4Figa0vRhD6HAwmvHhowyTvuSn4L4/eD5N+Yx78GakWlEdELIPnB60Xj9lDbI3117nNIsOAdSaK
	0ioMggn7LCNKqd4+W2MECHtvKJ+BWVlmO8YKPcAvS6Y2VWRKLk4hP/Jjl7MyVsuebtL9jiU60if
	kJ57bGPdQJrbk2rDLLLBD3cXAksK+Gvz6JI+FvMOjZMGJVEBjFD3h8BlEbu8x9ZkTp1xoomd/kV
	lpg09FNlosdxSl2PEuVe0t5G6YXzqKBlr+1/AsNAOZzvP9tUkbU4IniOqGfFG08m2h2cY1hEwZy
	x08xa+ML8003mv1kg5xNhzCmc7FcWMtukzK8wC3hRRfRuC2phNpMH14QjEY4Y7k7nwKeLYv/DNs
	3yxTu7sAJdWuphSQkHJXce+FH9HXsOVdRBRKpIuNCsQsj/G1uy0fkA1LRLsSM=
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr9238776a91.9.1784030902088;
        Tue, 14 Jul 2026 05:08:22 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:21 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: bletchley: Add second source devices
Date: Tue, 14 Jul 2026 20:08:14 +0800
Message-ID: <20260714120816.1504058-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050823_693459_4C16DC2B 
X-CRM114-Status: UNSURE (   6.63  )
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

Add second source RTC (ISL1208) and LED controllers (PCA9532) for the
Bletchley platform.

Cosmo Chou (2):
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 294 ++++++++++++++++++
 1 file changed, 294 insertions(+)

-- 
2.53.0


