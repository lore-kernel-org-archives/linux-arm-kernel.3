Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED77DCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=; b=QTdCYON4I4hMTaUIhlvFdtkooi
	71SMf2mXjpjipu+BxDQK64NACZB6MJTJKGnp1lekHXdwDfwLwBj5hhzhiBXR6LBdryNhEw0nXel8I
	j2XR3pHLQJn/wNebbOq9vFw5KAWWyUJ0OYR5awuZva0EJtnpCnHV40aAA+1nqnZEOXJKelL47eVcg
	75npBJmwWsdQU54jQjC8rVvwPyCgeLs/v54DZgjkCxFgGiu7M1NWCbZPqGjl3s82rYRXsxGe+EMg3
	Vo6a/jB75CRnUGbgeqR53yxbITFOw7WsgSKX7JPNhblWbIUNuGnUKvUDKyRBlJGtd5rqQhnlduTG0
	9dLtnm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4PU-0000000BMSW-3w0V;
	Mon, 01 Jun 2026 15:18:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4PS-0000000BMQj-3xfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:18:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf36a6905cso15445905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327114; x=1780931914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=n2iy0Jkl/EFbD+e/peKU0owtQntE0tCZ7CcGE+X5sIag5fzjwh/Ys+CxhbSCDx7LRY
         iUM1xHOmk8PBQltR/MbcsPaE08rwmhCm9EwIQ/MYxelV4hhEF1pm7MkTFJgdtKjzErKc
         JOijrh49kuzt4f3vT0tqVkR0+7e/HQC3KX666lJQUeD3z1f5CGP0cBIKqdtQcdzVctvE
         U+EqB3nJvr6/ILkLTM7QL24Z5iZYbBGbS2Ol4ZbMQwSAWR7pZNQArFQizUdIjuDx2z2h
         r/eo5dQ+RbQ4Mgk5QcNV27qjiL5bymuFs3SaBbszkBdk98cafV1ksuLchxx/oURLrEq3
         /f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327114; x=1780931914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=Do1G4kDOKzlr1T7EMhdld+LN5iHsUzjGdJwzXlkJBWNFHX47fykYHyUKoDJxsY+911
         8WETtVOl47U9JL1vaAomWSCiSt0bzWsacjXNvHy/8sTYd2UbQHyYsanzRSKtb8byj/oB
         Zanyv5dyMGM+Nw5jsBpi65Vo8L0aVbF+rDoezW1jVn8kpBiejmNTWoyrdVj7Qbt14iGZ
         bJDpBxl0Ukr5Vhp6L5D3dSWrGqpzPE5YhpB8Q8VL1Uv9DGC+i5JSWOCFSabquy6BQzQW
         LdJmNVSSzfTYg9teMmSQab43i2sg8AlJpCned+J3xwyn0u17MaMChG6ebWtG3uqjkn1U
         m3Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9AMb071HzS443jIHCZdRwgTrcnjtYTZHa6Osttv8rjRh0Q+Oks9967w9NP2A3Dg/T44rEZoxh0Pn33fouShhN1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb/cGrEkacKlI+/1vazacbnYyh74HvGX9g4aVi5EozzlhTQLaw
	eGpYS8zQsZuCpSuynFUR2+IDA/yJ312LX1CwhbnlTSpGrQZCUPFt83+fYmDUukR+mBM=
X-Gm-Gg: Acq92OEElAJH2msLYIeGadeJtfUDMvjaUrOImgK3KKCtPJZnXNaSHA42rAeKa2nZnK7
	gUNHANKt+vjnXM3td7/GEG4P6CN7F8suvnAkfZUgIOLR0KUpAWc3vjBrvgnUJhSQy42Wk4jfFm4
	ffy4fujScipVaTDfaBhEY2ueHVpb6bNIPlpaKxc4l/siLRKWjmqJjVQZcAjsdMXRA6gu5QWFEwf
	BYP4i/bWya0xQ6ioa/IOTiZNrv1BTYneM+l7LtFllK6s/1GUpoBHEYKV3gastq6hplYmDWHFArT
	SZBWqZLRKBW+HRkpV4kg1Ogn9M0IFdaSP7MC6/daI6hsL+OSu+cqFkBXViOJBSY7eMzvYd1X3z9
	/a81zRTmHxyTAkKRowvWliCgJQNhEVormlhIppBLju8ymZIqxSV0T9gOvk/KMJTyK0zFK+7RsjP
	EE+h/qVi+d0IthIefamljT+yrxNAZ1emSIoN3EKhHl
X-Received: by 2002:a17:903:986:b0:2bf:222e:461 with SMTP id d9443c01a7336-2bf3682aba3mr125337835ad.25.1780327114048;
        Mon, 01 Jun 2026 08:18:34 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0d727sm106633925ad.59.2026.06.01.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:33 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 20:48:08 +0530
Message-ID: <20260601151810.162173-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601151810.162173-1-hrushirajg23@gmail.com>
References: <20260601151810.162173-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_081834_981055_3B0E9BF4 
X-CRM114-Status: UNSURE (   9.70  )
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

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3


