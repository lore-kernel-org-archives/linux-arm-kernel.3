Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=; b=SVEmg3SUqisR3+AyJI51GIeYwR
	doihNL9UivzkZa3vmb0DfYAolaEJV3G88/XDib6bIn34ZZOmYTxaHdwUVid3HnnRdd5m3ejZVDjDs
	Jlu0fbY8FGFwfXGnZKnEZY+76zb6Ss1aPq1hISssVbgUydXef0VQHI7rO7j2U0ofQXXHqRHWIieEi
	LIs4GX4qat2k8Q5VwWlW5AQytWzlata1dyEoPz8kZkbiYS8VqsMEhZnYkiRWtNjQcPLk76A6MroVN
	MzeMh2MRtLbRudk6OTkM6ruA7iNS1x91XJT/beN7UmBZmmWw8t8Z92XvrRf5s8jeKYzxXoVCSlDsx
	wOj5k+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcLA-0000000BZZj-1kW1;
	Sun, 03 May 2026 19:18:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcL7-0000000BZYN-27v7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:18:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so45108075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835931; x=1778440731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=ACvX39Ru4NdBx0cc1HJY74vJ+uJswVYMmdujK41NPetUJtESIaoDMAllWvLebDZmIs
         8Enolk8MgM94OkcD/fh8qdP0N8LC0plPmycYDrMD4mvsCdDVJrG12Fm6vJ8g3Es1Nfr2
         17yr22jU5DnlwZuMGytfVOsLI1F6i2N44pp2IvQf8F1QlihK1nfkrRWgTWFvF2l/8cs7
         Tv4a8dkKOPlncNpwzu+zUCQGi1vlzE/x7vFztL2vludAuv68LBg9JOMeTgGwAznaxq+E
         pKXkCtF5PozjhmEWqeqnwVcT2/voiQ/2M0FwO9yHMFtXeIbP1+iLsHeSmX/PKwJ92vpX
         OjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835931; x=1778440731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=TSqbRPt60FanE/KQEIMpnEDQNcWo4abbysHdtG4I2KFeh7VD5L25XTzP1+cHhDfjS0
         7ZQ/nwiQCiL+3j/Wx9ACiNVACO3Adx5gsGZXmJ2hys2e1FfM+Vi8K1w1LBWDL/s+tNuo
         I8f+ELTdpiSmyoIYuSL5lYBTnkveg1aw59BfixzhHkirfZHn0HLAbAxkOL8sWyzlu3T3
         XfteIbILBNx9pZXgSqDBf5WjnxryDC6JqpJKDFyyHHQfSpEqjhcoPLtj3HD+I+yx/aRU
         1YsNG7scG4OxAUB0V9dmXdwEubaI8bme8hqUMn6qcAD0p+Q1PlWfFBPJ8CefuSBGiqI2
         5Gbw==
X-Forwarded-Encrypted: i=1; AFNElJ/zFUbGd6stA/ryeWrGsqbIW0IXTy6awNUdbo6aNhWAeKkjXj3AqB8O0qXzQnKbm+n1vzlP942HkxSC4TDvBQjU@lists.infradead.org
X-Gm-Message-State: AOJu0YyyB99Pdjt8XPmH5AmdzrjlHD4nVuermRouVKMqj/etg8VjRFZI
	lmHzhQmk9HFIPTyxFCpzp7hzGpRbxdaj8pGq7WQxirrY6+ZnX0Iogf/V
X-Gm-Gg: AeBDiesPOL42onCIwEb1N+Nk0Ss5u0ei0FTPkceFrJcJsCQqMulpvxeLUpf3rmUAQZf
	IGooyUeSYfwhmUDcPk7tzlmytP579aIX7ZrLsaDcnjFEahGqQguICskT4bLiNKEmh61DsSmXgYv
	mTYv+6L5uMjlw7H3YSwQ1X3/D/8xWqGrw/kqRnV/xDqQFsj5b0XLwbjF/IirbGvojdNSs1LJWsd
	WbtgiRNBXwSxBYUJqinDnqF4w8Rtp24lRpAyxfq+hF+x/CcRI8xhFCVkbHGj3X8Wnek3NnWd4HS
	8xrcqpdDoOmkrDH60yjL+89XjGYLB5CNig7wvs/sgS03IsA6oWaIFt4z2ze2I9ksB2XZaIWf3jh
	VNeP9DUN5aIJ15wOSKZe7GQvxQ7aS4MHDdcPclaXinZyQoHYUss3ieDkpJKYlwoQHruyBT5Hjmy
	jmQCMtxWsRqqyjF41OmIDAih/U5qNgoOxcyDM/7iYPvWOHknk0iNxKV/sdVinuZChs+j4r2kFIV
	w==
X-Received: by 2002:a05:600c:620d:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48a9852f254mr124948825e9.5.1777835931600;
        Sun, 03 May 2026 12:18:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun,  3 May 2026 21:18:36 +0200
Message-ID: <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_121853_549707_29FAF95D 
X-CRM114-Status: GOOD (  10.07  )
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.53.0


