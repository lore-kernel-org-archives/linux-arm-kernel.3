Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8402CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpNtr9K9XTNqCrkpUM3EVF8WuctLCaDVmj8vhM6mxC4=; b=tnnxpgRIywc1V7Os5OFUJRK3YN
	wt7pv6odTVf4YCPvsNEZGMvyZxjJ/oKcaQ1vCLG7GQv3nVu2W4TZSr0bUkuE0bXifbiRSLHCR0tRW
	+7S1G0MEtQd51aOSDn1SVDW4pM4R186N9ttYvKSZ1jPQUVvP33xvRFkS3pCekVJzLfHosuUa2zrhs
	+Yp+KAHkSAYlY8/TTt2AGxi/IGi3Awq+PVpLfwfJtsPnRearwY6RY0GbL7t8AbzSLPEj3m3/qL/+U
	zOhFwR6aJhNtqW+t8pRTppagjVz1dUTNny+aHcsF+sLcJHLRa7GMqo99K4DNgrpkuGFu9/GNnA4I/
	1Y0HDsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3tw-0000000B9nT-3peA;
	Fri, 12 Jun 2026 15:34:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3tt-0000000B9ko-03Z1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:34:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso7926635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278467; x=1781883267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpNtr9K9XTNqCrkpUM3EVF8WuctLCaDVmj8vhM6mxC4=;
        b=S1tclBYArJb0oB+/mD4shmKpJQUl6s+sq6FqGpUvJWctUXmNLWyGN+3v4a/k9Hvkve
         xyD8vi0EhfRUcGP9MeSWb0zG0RBP0HuShRfZ0j/jytUU0ebi6qyLi7ynesrr+mdn76Ss
         wHT2D+VeOqjoBar+e7lapUZKRvmDCEJE1A9j6x5yFHpCoSlzt67H7o5R/meJ7oxQMt2L
         ueTF8lwD+G9vI+xescnLD92S5ZV/5P1A/J3+8RYDSHmFvRVoyJti73OMPhXf5wOQFW+5
         8O2PQLoY3QlFSmFBKMihACf/AAzXl+9s0EkPkcTVhdqQrpHxAODlKjShzfdJc6C/8bhV
         HwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278467; x=1781883267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dpNtr9K9XTNqCrkpUM3EVF8WuctLCaDVmj8vhM6mxC4=;
        b=VkgFLNflHxUILhVVtsr9UCUKh1zZuGAMlXsAV/TLjyXymJrn1pYwdQ8e15bkVfQLcN
         c7nWiNvjWS2WAr6VXtgoa0R9kxoD/Sa37Ni4OVL5GaYtOK+e44/e+EuxdcciojHh8+e7
         WFKxoJ8gFL625bs5GU622+d/z+9ehKlEpzIb5U+amyQ2gg4OmxM7KAyjZFIrpVTmyCQk
         63En+20gJhP/EgBrTCf4SgGi1DslpCvR1S33wOjtESowVkDdy3XjXa8wN6lcZxJtztiN
         8tNhMDyyXVJ9vX7doaBwN6KkXeA5Prkk3yalMm5mGoJzLGOKGzmEqh4Hs26lOvpJSquq
         uh0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MIpyRtHjIS0TwPgmfHZlIAhuZppofjNCTfy5sJ0jGN2y5xVioihqVxXotXCj5HXAt8cazr3+3ifcOLXPs8Wto@lists.infradead.org
X-Gm-Message-State: AOJu0YymKUhTw9xZ8wsiUBZUsk415wAOZbpjQeLScZ/0fb1reuadF7rd
	l/PafLTN//DilLqUL6gpoG5X8ENpvq1onTx1iBac+j71diqdwVwmih75Pqu8tCnm900=
X-Gm-Gg: Acq92OEXaYwZ5K6YgX5hWyGJevIzgsZExXsotDhf3rVOQy+v3LLR5yErN4xVg8B6T0q
	G6BViWQpR6RdkLt+MlAK1fmLQdiLNlBrm7Uxi4ciOYqOfoMpipJ9c9rgwcLaBncyTlWlmF+GKc1
	7rLKPtkKZ9LZT6LWri5EWicjJ1yQJ2BzzR0YbdI81/6BXgQT9PtFRcorVCoPu7G8lXzRQYOrNOF
	6/cGQ7qo5BzPiSIonH3BXpUuOPYpS/V7GSEDGc+RpMV1nY/BT+NRqm9YCORwDxbGJ6eE6K2dF8g
	kY1TnHibAt6TMOxd/OOQPGCtN6/c3TzpBTRplfrWebniWkaLMCdGXjp6zfog2ueJ5zq6RiGDnIp
	YjGe7sSX8pSytjPLJm64yGzq8nI9NJOkAqJDH7iTYOPBK50VCcghQODFargPu8BhcEuCp4h6mjG
	zi9EoaPoshGTSM1T+Gf1KVgC/k4U+DNqEUpGSHZN6D
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr43552025e9.8.1781278467170;
        Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:26 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:14 +0400
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ugreen Group Limited
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=alchark@flipper.net;
 h=from:subject:message-id; bh=ALIUQWDYA2tt/w5YoDnsfyeSNacCwhv9VqHFuMI+0is=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP09+abI9JCu1HVuYVMG5hWKu5UyVdMfu+rJcF+st
 5t4T3lex0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO9qo/hf+XzqQluPtP5J3jFSOmv/uEtufCL/TUtuRc7uZJPfVRaLsbI8EZE5ve
 sgqUW1q+rS3ezLJRSmHLNViT13K1qyT9p7bWvGAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_083429_092350_CE72A487 
X-CRM114-Status: UNSURE (   9.30  )
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

Add Ugreen Group Limited, a consumer technology company producing a range
of smart charging, office audio and visual, and smart storage products.

Link: https://www.ugreen.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9..274e52421a5b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1757,6 +1757,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ugreen,.*":
+    description: Ugreen Group Limited
   "^ultrapower,.*":
     description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":

-- 
2.53.0


