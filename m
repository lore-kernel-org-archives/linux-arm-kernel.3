Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C8FED9FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8XGsFBJ+hu898M1fjVVq758+iOj2O06p054bPmG3Zo=; b=0z0lyuhgpK7MyyxX/8Lpe9q4W2
	S28ILDWW0mN1mzeSomGVIONsjOUMzSQx7l6FM4IgAgKVRmiAy03geQOa7vgX7r7yEWzl/gR5h1RZW
	BnE3BjdM2TxpqSK2kBAA28WdM9IyBdwUrEG3qS2Xsksw1WqCKeuYX96c7szsv9v24WHUPlrQ6L7VE
	tD14p9XxJEzTIfwC9pSlQBfIbMLot14fDyMTE7YYG6mqovf644LLCEf33p5zykEwhBqhP1ldVYVec
	PFZcu6R7MkTtYWTVJMLUfgoHPvFMbSZhzxrD3eQf+z5HNfnJHi5dH+SyKkNpBsKBH8Y3dN+vLPvtT
	UKJT/KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yq8-0000000717N-349G;
	Tue, 17 Mar 2026 18:08:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yq1-00000007100-0MNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48534237460so65409025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770895; x=1774375695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8XGsFBJ+hu898M1fjVVq758+iOj2O06p054bPmG3Zo=;
        b=gR1kv+mgX1r8zQdLxnFCjbUzZivxc2JqzLFEqFN0PqmFNHlaPJfI9f7bYdXrvGon2B
         Y/4Xa7d9qbxUi4xWQJbr3qfV7Uh1+CExdyDvV4AvqLTePnpQUfmiRTFrA2P5NbizcdPE
         Yir1A5gvXrTVkZOqY57GcsPfbYMc/4hSVmxz1XSblOYQKXleICFh+cNDtFVW9oJM2bvc
         Rt9OyABQ6TY92ItFsuDN1oW5JimoA/+Z4pG6CpXQ37CQoMD+ngYR7tTp3M9w7S3sR+jx
         9tqy31vy6lPYJLaQ65kIuO7UwCzWZvhYCw73ncqCr1veWuIWkD7N5Qd4+fSq3YlbEpfE
         DdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770895; x=1774375695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8XGsFBJ+hu898M1fjVVq758+iOj2O06p054bPmG3Zo=;
        b=lBMLcnpjfL42PBpCJnRQn1GNWDKiHssmGueFpVtPZdqbgIhY+e8DsrsHYO0Q6YKHzI
         kZGRu2Hg3UIXm9vQRZ1QDzbMj4NPZ8vzHTQdxnsjOfj53Nkmo6hnKyypB6xNPkTSwDFs
         4b505/rt8YMIIS4+IoeJ2iphhe/8AsgBudlEX7o8VHA2brOCtWeZh9lRjofH4nar1jBy
         brhaAVbpOgS+E7RCKkKMJ+Df+Fa3SxyznpTTuVisiBN0Ft1rJnqM+76TafFyLHX6BGPr
         h3BkAQeJWQi136U9PF9/N1JG0DU1V/Glir/nOy6Shs3pqMMmwufrl446ANfgqPJI0383
         JfjA==
X-Forwarded-Encrypted: i=1; AJvYcCWVKMBeBS5l4veEfYRzJoNPTDO9LSHg+ywCeWbTZLUIo8crr/iFhu9FENSgXBo3KynMZGOBba1Hm6bJJLRpS0iy@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbIeOAaCtoC0Mgkd3EII/f33x8r1UTjNt2q8yVREulOUyNMjr
	taQXbMA7a1vcqVA0tSXx5NYu4/+abAsuvTLRu3zRQF4X8jA3VNmYIwQR273QIUnZKJs=
X-Gm-Gg: ATEYQzw5uQ6SP7LI6XkJBaGCogSwnPNKO/vLSFq0+6U7KCORRK433HA4GOuFX8/p3PD
	Wt61Cj1R2XDBP2GysPfrgjzHOmLynsV/5dZFVbrYQlWk2rr7JR6ed/YjsrSXAIM4uyAtw83bdlb
	ec3nfF3M6M+goOZgC/TctICSqdInW+DSznWskCOBIPv5u0TQ3Ee2NjXpD03RBZgpP/tZDJby0ww
	9M9o8iZV80XgpSXzk5SwRCPPoXMlbVe27vJ6jtyCCyLwLf0d95zeyY4FUXWA1VytEUElxcTqZA1
	k6Y6E2/DNaOCVoO+ReRXw24xUbrJsZ6ExYY4eqX8Z6fOcUmhzaVXzTkdvvN5AbQJkND3xLT5PXQ
	XC+l1/RLyzAGMCZ5zk0Fi87s/Bvw8w+0eL01Gqpi4ujtEnNLjPK3/981tDPQVK5IPH4MUDYyMAz
	zuXVA2Y3JQFgvU/DhzslgtOPZ3XSiu8n/mNVaoggYth9VO48FFyl4UcbVVknyZwpTBxFyLPz+FF
	3r3tA==
X-Received: by 2002:a05:600c:8518:b0:485:4328:407a with SMTP id 5b1f17b1804b1-486f44435d3mr8363685e9.19.1773770894941;
        Tue, 17 Mar 2026 11:08:14 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:07:59 +0400
Subject: [PATCH v2 2/5] dt-bindings: usb: richtek,rt1711h: Switch ETEK
 ET7304 to use a fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-2-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=alchark@flipper.net;
 h=from:subject:message-id; bh=wc0GFxLbCGBVmDS2XpWAyiiPfvrBfgtTcVXRLT/pt8A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNEWf+r0jqyTf7R7hK55CG1YtH5PxHqmuXWVk9cft
 W1Y6mU1s2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICpNo9l+J8gFf5eUVz4LvMOAXtv5j3bO1s0nzovXVTZlpusmDunJZOR4cni7P6
 5sr+5LxqtPfBh3tQ17lelD2z6Ei3+S0bi5qLJlowA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110817_191602_F5278B98 
X-CRM114-Status: GOOD (  10.88  )
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

As stated in the commit message of commit ec53fe37a560 ("usb: typec: tcpm:
Add vid and chip info for Etek ET7304"), the ETEK ET7304 is functionally
identical to the RT1715, so reflect it in the bindings via a fallback
compatible.

As there are various TCPCI chips by different vendors reimplementing the
registers and behavior of the RT1711H/RT1715, fallback compatibles will
scale better.

Fixes: cd763789d31a ("dt-bindings: usb: document the Etek ET7304 USB Type-C Port Controller")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 1eb611f35998..62169daddb4c 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -18,10 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - etekmicro,et7304
-      - richtek,rt1711h
-      - richtek,rt1715
+    oneOf:
+      - const: richtek,rt1711h
+      - const: richtek,rt1715
+      - items:
+          - enum:
+              - etekmicro,et7304
+          - const: richtek,rt1715
     description:
       RT1711H support PD20, ET7304 and RT1715 support PD30 except Fast Role Swap.
 

-- 
2.52.0


