Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5388DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 05:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=; b=NHTEIMC+aOVLggbc9FiF5sNzfE
	NBOyse15AlKdGZcVcSp2kczPKjCUsIeTYwCvHyCn7HPA7G8K/olfzyQQarunfTlFdtUIzu2C/DYSs
	cm5hxbtrrM9X00vEWk969TCpKbmZo4WwpfXA+i78fb9Cc1lQUUy3Xw/JYLaE300cGktLXEIvVV8GS
	Xa7ikMgyftRKw5cc8RetgIWDbreZ3B6gzob+KAhJ1QNM94PWYOT2EUkyI6ga7lqgE9xu1whXtCCfe
	0aTLO4tq+RZFrumfQNKoJLrizIIIxs85wwGqJlCI8WlrFWTZkxKixvZF2pjUS7A6W2vT3bDpuvIl1
	dZrOW94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLb-0000000FB1s-3UeD;
	Tue, 14 Oct 2025 05:13:19 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XLZ-0000000FB0c-2FUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 05:13:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-33255011eafso5198362a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 22:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760418797; x=1761023597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=Pf4vaqrfup+J4EhprfkENX0XnT7eksY/9cJlVSmjJCkujO4gOI4PqgCMD+wGW0UpUi
         tQJlXeei/tmzyQh8vFAnm4LoVFVV/g6PkWzMSJ5d5RoGj3aE9qr72Jj3bebBpuvMdcNc
         wC8xTTE0cZnztTskfByttTMSzpPWFS3WndSOkRMXscClseNyCouVg72I0+lFKk0NsYLG
         NvpdfLuiMQOWcTUYO+r7GYjnkcpdGV+k628MH/p7rs+Q8YmA+6psHpgiPYKNy8S3G12l
         R5L+Y9fJ6NEBHzP7wDpIlhhNliyGvEohgJO4LaqYACZxcBkDKwekA/bmnLeXoYANtjTW
         dDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418797; x=1761023597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=i4mN9GsKWiHgAYK8wChFT/yjfBL9NV3acdUQlxbCOAJ9wXU4CJXFThWLXknTPS0qHi
         XM3K3cv2Sk9ils0NCKxFm2dqnTt22znFNR90O3A8y0zTZwuQtKofZgzCeRqdyK1NKpQ3
         qo6fbNzy4OD1czUFU0WT+cMfAxOQ4A9JQfWO9caitYHrmeYKWKZk4nhyzoT7/Sj0JHdB
         KV3FlsVbwlQMTp1k2V44n5YZoO0jP7SksHLHv9U7KUl2/KmU4NbmAbZenTvxVbGxIP7A
         iynS1U+QdI7jDIZRs4HPg7F4tgeqWFlaOZvr6voK7KwdgQzTS5zN1FUG9XWl676bxWOO
         PjiA==
X-Forwarded-Encrypted: i=1; AJvYcCXRlkTSuIhAeoxz6pqwPsp0UiybjRAnm1bWiDlHqYxjo5dirFzGQeptzCG9rjYqKyxZj2tRjzLLCynFwsTUxa2N@lists.infradead.org
X-Gm-Message-State: AOJu0YzL/lWm/lrdZZKQOJbfD2WBIVy3bwNeIczxPU30dmFfvsTS5Lau
	yDohmohN8I0QzVEybg46gQDt9eJeGXyU8oaAxGzXa8i4vv2lh1gex4Id
X-Gm-Gg: ASbGncuBiSDiukklGgShmPce/cjjY1PzEd9S4DCFzNHqNVBEq/BHyIbge504S8sFB16
	Ta/PDWPYC164UnJi0v1gOHxMeHX9l/V+NBtlsUJ5ousQQZTZhuVdoddV6Pl0BDZnRu9J5PiZviH
	unZfTQJ+ra8/thMWjvXTZQlqs94gLU9oWb2/QXMwWtuAI9ZQXFCAJPQmYjE9UTgUBqCw91QU/0Z
	ctCpIZg+mFrpQrrMF9S7dcFsEzpA1paaFEBAaRhMhhSj67j8NvA6HD610Anj42LVzbP040M7ONP
	2bQOmE1DRVo08tD48OTrdYJjGPfhl1M2EHvfcgBUNue/X/mIdDZcrdqHvVLGxH2WQPYcahsrFvY
	+SLp/09i5MjOy4dxukTwHmctWJ9DDV6YpqUFlxKunKyx2JDTUjEpp4k7YBrthRqaGWw==
X-Google-Smtp-Source: AGHT+IH97JkKWq6pRYrkp4vvzMtmr+mAWYEE+sx6Tl0wnrhQDndiVYomTi6Q/s8WM6+VsXjBNCVvUQ==
X-Received: by 2002:a17:90b:38cc:b0:329:e2b1:def3 with SMTP id 98e67ed59e1d1-33b51168d95mr31720007a91.10.1760418796529;
        Mon, 13 Oct 2025 22:13:16 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddce4b6sm10902353a12.13.2025.10.13.22.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 22:13:16 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com,
	andrew@lunn.ch
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Tue, 14 Oct 2025 13:12:24 +0800
Message-ID: <20251014051226.64255-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014051226.64255-1-jjm2473@gmail.com>
References: <20251014051226.64255-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_221317_574584_7914EE5C 
X-CRM114-Status: UNSURE (   9.55  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0


