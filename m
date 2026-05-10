Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A3CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=; b=4YhmaT1NxUD/zCSwa0pvnn2RC+
	tcUtn+bH8arKwxNBJAMKCuIUc9lAAG3E5haJqzByc+NNoCnbXfaym5yg1TszBo3sb6HNmscKNy3VD
	G0KBtEJWuBi//ZhHID+jaEAxWyWONnHtRlN2kfXNf4NMs0lV9VcilKzjiuqpF42sfLFeyJ7ibJL4+
	w2+idfeJpomSYx7YpCQ8F8VSYTS1XpZlOAljgYT45O1r6oO3U7bd4cpOJii2E4BLAd2VTVtoNekrY
	YsxBeOHTsCDJ2JXTr3wtga7pPOL/oVtXGhi8yWTwm5R9lGmlCHz4044gePqrum2eBp4HTh+F4+C+w
	1SoNyRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAaQ-0000000BYHg-2YmV;
	Sun, 10 May 2026 20:17:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAa3-0000000BYEt-3nJ8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:17:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48896199cbaso33151175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444210; x=1779049010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=XQ4zJk8IybbYzTc1baCzbuQQdQDwHd9Xy/byaUc52jUQ6oiQEhMSAVLL5bk3x+FuNF
         kr2QREa5goM0Ixwt4JGqkXMSVvIIEtKGcny7sUe9b2785/Tmueu0MfmvcjACI9u9Mgqm
         5erE9wPpw81xkND+BbixgkqpY0BbmBneZ2KXbs70tkoFORR1ZTk3FSrelXNVnsuPn4r0
         59xXab/xP2j8NsfmtHdYlAaCBuSIGu5rylG/NNMCfIY0ZH72Hdb+nEEgcv8luT2yGQ20
         aLaNgz9z92SSwAmIpcN4k7QURBcu9RvopFnnipmAlLsWS0tiieKWcX0/SNF1DTA5atSx
         joAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444210; x=1779049010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=Ev6/ySVj5Mkyh5FELTiWj5A31oUBjEZ8qRtWH4aq7osoK4ilAYvCnzajgNDOx7qdr/
         /mSDVm4eRnzuZ4r+qlJ8V0dUo+dcAX+LpBU+cXfgLJRwwBw8htV9FCGlkpwfmDd8iptH
         jF3xHXi9ie7+afvuxaiGY/uDI8ehnzXaqvm1IqN8mVcSjN5RCUrZHWgMLLI5A4edrpa6
         VG3PDGYTsBdSjuM9XKu3Hp1l93GjIftmlovqRTwizius5ek/1QbJt+8+2B8z68VlWl53
         LSlt8lMSbF3HlLlBu8Lb8j2vCsXAJqmJVexQbRDbPt1kk+GYQ6tM27g4WGEgHwNeVHk8
         uyUA==
X-Forwarded-Encrypted: i=1; AFNElJ/8PPx9wVV5jl2Nb5XkpWG+lUy2Y0ktgUrxcTvFlQ1Dmt0T0EkcbfHCu9dMPFHQ2PRyH8mQWkUKqjpqLOeufxQa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk8ymacfsWCJP2mzYaTaV7mTzI4+uRwDZvSx/seN/t0Xehex9K
	xHxp+eOLuSs5IejovlX9oaFacAvql6Dun4M2FuuvkVU/0QBfIW2z1W1E
X-Gm-Gg: Acq92OE0UivwRIp7Dt/nOgXn70VmWttO84nbfLJCA/r6DKQFwJVx1gwQC9+z6+RsoCL
	fPC4P21J5o4Gm2YzgI9Lsw73iwpO2HYzZQStkwyWC4hN0kP+YiXBjMfatRKB4wv5QoCCv1Dk3h7
	dP3QrFY5kmsktbw1KpY4V022oZ5aqXdhbg3R5GZ95E7UlPwf6wt42WppR/7u2L44XdcJzA6qrmE
	jss2mB2TkwQbIPCWp5zwKy3DiB5E299Q+BAaCBlXnkfTriwCYgpHevmyScXGB++GpVaDOLsv6sF
	XQU/BlsGAU+FGIle5891q5fqFIpET8h5BKk1zwTBHICEowwp1aOTLFfXw8CjaEvBKzoGztGSw73
	HYp4SsCCQ7G3qShmAxXiV7L45CKubeyqRw2bq7iZuoQ9xbOoW4eTXBgxXHANN67CPZByDUkr41u
	hT1pbyhX+dY2n1XOLUxwqR6EWj/wA/9lN7fCxBNCnDq0zH6kccZh0z
X-Received: by 2002:a05:600c:1c26:b0:488:9439:880d with SMTP id 5b1f17b1804b1-48e51f5c282mr362332415e9.29.1778444209945;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun, 10 May 2026 22:16:38 +0200
Message-ID: <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_131651_944780_B6FDF176 
X-CRM114-Status: UNSURE (   9.90  )
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.54.0


