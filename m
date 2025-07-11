Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32583C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTH4I4G8D0dNn8spSxVZfb/FaHuz4VLbXp0Sw7lFQKc=; b=EsD1LQAmah/0g/E/DACF1zwx6k
	xQ6R+8e6EPJtf9Jf1NtQ2fMG+fafJ252evy1SQ5lh2OcoefT2JlxehZARubNlDg86JXFg2RCKCrSM
	t0/pPtxjmSE+yiYKpQyH+p2wW38iVN7uYSv5M6Vd4AEsAcdJeavB/C2QSbmRRaPN2QynXtDg6UPy1
	Gm1KPAlL7mzi2g/hRPPnw0evY+cv5hdanUxDz4F9YihPZWmPt8hxh8k7qOyIbpxmHgJLkzJk0rb9t
	30bUzpWEa5YZPe437c0gVJXVsnES/oxZxuwECLAJ9MrdN7ikwUlDPTf3otY3RMcdr09RowT0KTh+n
	v2rteKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEV2-0000000F051-3RIt;
	Fri, 11 Jul 2025 14:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaENw-0000000EzBi-0Vez
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 14:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UTH4I4G8D0dNn8spSxVZfb/FaHuz4VLbXp0Sw7lFQKc=; b=MvZ5+nSZGmibZtkkOu69NkbAui
	h1jMewaxxDKINlVMXAUMpe8JGDw2/hJtHoPz6aOJbfT0i6KnCYeBQ1+tRc5dmuiqCf/QV1x8lmy0P
	2bSUVggfUpm6r+WcVm+7SF0qEzTS9efxwRmBHPLsrE10fWGe5hR6y9yNgMUggwi45/KnMst31W8Xa
	zn8USbxq36jg73EJv5OSNcArzRpUnvKWBKEieLUtz7KEWBcPaRxOKEJHjVhWWA3wiJZFdna7Rl/mp
	sWNkWxjH34F6VUvq26+DcRFUQYtAdfhImjKWNM7N+6u62Hlnnh5xquVUDavn2rFCzohUomWuLHsfe
	T8sT4oWA==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaENs-00000009HhN-2CC5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:05:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so4107166a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752242749; x=1752847549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTH4I4G8D0dNn8spSxVZfb/FaHuz4VLbXp0Sw7lFQKc=;
        b=fJrzS5BWY54+hfICcPb6V35dQIRKYYvukdMMJ2tqXFyQtEFDxYPklv8wl5yCpWxTFF
         5G+xWd+XMUUNTod2KPdbYbwm4VfWjk/8Ib9MRxmGr1CrVU9fECgs++FcdLyZiYvQKqKM
         OOFuT+luiQ4BSZhuRHTjq1ZEDowVkRWJIXHbQq0Mlk55QsRWsf/fWIAeChD7ggvH8vQ6
         2NZmPo9J4GqDDMg6n4g6N5o/buO6WNybTVW5I1eVLtbZ67nwhqVu7Di6sC6DWKf935K5
         TnigXG48D4OIfWBQ5u2P57Sf7nCECQAinriUpg0olUb0FHnF1tGZfedH7i673wMhuNS/
         4xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242749; x=1752847549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTH4I4G8D0dNn8spSxVZfb/FaHuz4VLbXp0Sw7lFQKc=;
        b=bHx9OD8OFLPEwy1SaQT/an6CTstXMeq0d55zDDYKweJVMr2ZxvnQt05pTDdsaFLMmU
         reZwAeyY+3xRVFQJsG+Sh1qZjOqf+0sT0qMbTMHXeauVahtvPHklJXC/qIvnQakYtVZ1
         PwwQDAK8MBiCoozZJ2HMDw8oMpPGqAo5c9RtzyvlHl1z1xkjegWpuXtd6FNNlSlx99T6
         4yhrYBRXKQidU44i+9uI1s/5o8YeWMujuO/EhlQwyRM/PYiJjnaDilvzCwTy7Bzixvgj
         Hq+NlektKszgOwpn/Wi4sqEibgiRsS0T0V/MENmbeoX1D8a118K/485KR6dXm2fQaTUv
         OjRw==
X-Forwarded-Encrypted: i=1; AJvYcCWvfRV40YYoY/nUx0mCYi2yIVfPlz0+PrWN0PxtWNwqo9ZeNXxkYKzjnpSdP5sW2D6Lis/iNAT8iXzNq74wHvMH@lists.infradead.org
X-Gm-Message-State: AOJu0YzJxqKjFY0g2q0Vza7AgBwyB5dD4nYXSQLCdGCZOlzpEUWanEqf
	Futh/pry494SgcYW75pVldOtgvqr3NRabduhVzWosu/qMbLdBsGt7uHd
X-Gm-Gg: ASbGnctKr7RbsVpa1KI0oDfltZeRDz5llWV7e2ifU5sKJOHGOvyjh0OIoTcr0m+5IVk
	QuPQxO4NIjTpPuG8gTgqzwsP3QLAyXv/dtUzY794Kf6RFpmX44reQq4sgO3noknLmuAbg9owtyo
	E33bZL5mPj/50ZY08AKKBB6LgF7dNFEcRBVhbWylbNTgBWBbzed5lpdhN2laXA+lQu5u5zLdAtx
	rHvGmhJ8n1XDQaIAQJzxojquMZqQ2KAW79QnPmvgELTJkyO+ac5uLgxqjaLA5GsP/+45DZy3MLi
	0CftAhuwtUe3UjjYPY6GUKIEaMxS2i1xBMXDUJ0DpawT9T0YmFL2iNBFa/XUOozxLPw4qL2kElm
	+YpWkWXeUzm190rDdXjvdB2e7K8a2p10aJfBh7d+es/+ekQLAn6xudND9O6ieqIsCjeKDsLhEP8
	VKcDUuzQ==
X-Google-Smtp-Source: AGHT+IG7dihf3htJD8tYgepLxFBVBydbxwFYs/DwnZ80aqP09yns3LELTN0AQf3rpUon7qCKDcXzLQ==
X-Received: by 2002:a17:907:d858:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-ae6fc1cf1a8mr357229566b.52.1752242748753;
        Fri, 11 Jul 2025 07:05:48 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bd9sm303435166b.132.2025.07.11.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:05:48 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Fri, 11 Jul 2025 16:04:56 +0200
Message-ID: <20250711140507.17574-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711140507.17574-1-stefano.radaelli21@gmail.com>
References: <20250711140507.17574-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_150552_729679_A16C95F0 
X-CRM114-Status: UNSURE (   8.64  )
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Added Acked-by
v3:
 - Change compatible string to match existing mainline format
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..d56046e439e9 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -100,6 +100,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62p-symphony
+          - const: variscite,var-som-am62p
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


