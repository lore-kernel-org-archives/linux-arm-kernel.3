Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276AD58E43
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=; b=Z2qEU8yT9LIYJt4sq/M6TJRW0Q
	hY9xU7g8Hxj80xdJHYRfp2YjPGo+eu4FdjElHeoo2rHgaZHBdoTFBlUWcTlvFN0jyxBgQhyLcW0BI
	xHFOJd2sO5Y7rD8M7kNDHPdvWCF5nBkgnDeLzfRZhnUOcdoZfDtXBk2GnM1uZa6ujvPxn+1SVho5d
	JVa37Yl18zg81YzUq7KPBxCw1ZNCgqNreSrDq60+4SaAj47Ny0VUrZpY6b9PduAwXW/QhZDMU7mUG
	9ZzbKp+BAiLWClbq9Za0ZLdLoSSCnL2qeBPQRuNcke+dWb88x8nt8SBI505ucEKPSckK9uLwf4l42
	sgbZfb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsk0-0000000C6GT-2d7T;
	Mon, 02 Mar 2026 02:10:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsjx-0000000C6FM-49R0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:10:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so45182185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417432; x=1773022232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=V/X0IVwdj1kTKelvDkmfHiUm/7f6pEeuK9R4GGehsdijcdwEOh68i/DsOR3O795tj6
         UrxTQ1UHbhpkTnm5JxzJmKZ8WamtRRYS4PUJBMnmzSzhyjIu9sYB7MBBZPrcLfYqngx7
         sxK7mbXuu3VpeoUCOrvdit8s8q/w4GNfB65acBDJthT/Cl2D8G8E08V+NjRUfMnVFd2A
         LvEgn1aiLfD3LLfW9K7+ekZFRtSZiNxAmf9QMiVLUxv6GCNBMybctb5q6DGoVM2+r7fc
         DmQHVexS2jQvHpycXy0gz55uvanpFX1XnLDV5tmTqwyiYlsx+cnFjnVUq3c8yr7dfl+b
         HonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417432; x=1773022232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=EEanRCyJxMYrZTiScQf7UYc7Y+N9UGKKgX9/xbuqewXr+YWaKHS5o8neOXxVFqPoRB
         539Uj7MXPpotifm1w7upkZFCwhbgIEBL/DMn24NjXJHnRr1eEJTb0aKlvAtaYdqMcu6b
         z0aq7ESY1vIRXp0KdElDjqEEmkzTZMdM92FrzncaaEU2CbqcW8rgxOA6RglMdaHX4EUe
         ncTfISi0CukgbnAGCI9H3lPsrJInZHX32swUj8dEc1gEjIFGtQHebDoQ1ZLuqntH61cJ
         ktqrO8pTgNdpNuzN0VjLZL5y9eHwq8KskeCmW0RKnmILu+qYlBD32/7HCuFAI/tVnrDA
         5Ysw==
X-Forwarded-Encrypted: i=1; AJvYcCWwR86jIaEeEtOoTz8YU98ScrN6253xkYNsaHoz9/Zm4TUwUsDyT3lnIl1GJluojR36GAU5TWTDj4KCVy0QRj4D@lists.infradead.org
X-Gm-Message-State: AOJu0YxqNE8AAMv26f5EDtRAnN/onI5i4zTbcbl7Qk6Mc4f1r907hwkM
	IYXsYGj0dwRFR/1E1AekU1kHOCMR9UA96MYwy/9fidXizhIvwrdMG2MNIF7JdoFlKys=
X-Gm-Gg: ATEYQzzchKTsvSfrlAKaL5t+iGkLLN7dG9F7fPngkDiORvMHY0vfDsk9PxEauJs7GIc
	lFTYTH+OKqMYVJrGG5qxfYRT6/9BTcmLeEBeJGElG9TNk9jlTl6Lu5Vjxihfvs0WNEo76Ia4YEr
	z3kQjMA5tP679CndUVVYJ0zfWza0+QcnrGzzjvimrdWfgdzKomrDo1X5YIlJqfYzm6P2X0K/g9y
	2V6+gJSUzuiMlf1xOqMQTGFMgTl2hOXGjQBsSQ3rLwBAwe5NdPfOy1YocwoKZExBT3EiURvh+Dv
	o5G5JVduy6vXonBkMmfGxrYtGhwg/csQ2RRUC5PEJ7rcH7L1e7FXuZNJdHhMFtbwDiwxalrKjq+
	2a8s9C1OOSbLstWMPhhs0B20NR8s2cG9pDD+l4FwjhbCOOmVFGzlREYnTzEXdvrSw3WDIs1rjSw
	VyVE3HP+mZpVoNBm2z+qq1
X-Received: by 2002:a05:600c:190c:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483c9ba7d51mr193315775e9.5.1772417431943;
        Sun, 01 Mar 2026 18:10:31 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:31 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Mon,  2 Mar 2026 10:09:54 +0800
Message-ID: <20260302020956.96424-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302020956.96424-1-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_181034_043009_BEB884E8 
X-CRM114-Status: UNSURE (   9.39  )
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

Beijing Ultrapower Software Co., Ltd. is a company focusing on global
mobile games, ICT services, cloud computing, and artificial intelligence
solutions.

TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..bb16ae90a4f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1731,6 +1731,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ultrapower,.*":
+    description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":
     description: Uni-Trend Technology (China) Co., Ltd.
   "^uniwest,.*":
-- 
2.53.0


