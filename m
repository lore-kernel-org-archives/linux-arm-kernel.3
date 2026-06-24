Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC70ECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=; b=LejQkZ2WsvoGgdPIthsUVCr14g
	+Bg6NpTzygK9W9yymUhR9aVkotXwZXiv1nxTjogeZxRz0vLE7z5FbtEjXMjWWXqe3q0gX9dFrPKJ1
	e7f14e8KMwCM/tsvkQlx8ZCU6UAUI0IkLMG0rgjnkcKcaYWWWcZWYYeCqn16HaoNtNwUGUgpa1r+U
	EG7R9zCegDHNoyHM9GKjUvWchyK+h5kX7dVCDv0R/6mGseEe0hS332FyX8kK5TJBHdBySLI21v5w/
	IwvWIyDjZWd21tHutFXOyQSDtgk51dlHgcCt9G+bMX0BIlhUkO7uHoonLUBQSYzPlzuuDrtVv460T
	8hB+DHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJFx-00000007PzV-0tjT;
	Wed, 24 Jun 2026 08:46:49 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJFs-00000007PxX-1xZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:46:47 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so4793a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290804; x=1782895604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
        b=oWkWiUlEwY06zpNkOriL55rxkMH++M2n0ptQGAlIMxNxQUTKhPSUBdQf4LAlD98w8/
         2PQFXtU6TKH787uIc4X36Dq2xmwl+JoJE/dKWsNBytgFBegaUwg/s6OmVZFl1HqCb99O
         WeEEEV82bKMIIimzbo2GbDEXfIeAQQPVxsHFMuhLERPHuz0viEh2WExX/c5lW34sAx5V
         pvum+7qB1QKUrJWoYhSc6OT/Wca5vWRoIOPPoT6v2PfMb0CaEON36soY5K/VlnMHn+z4
         2p1tkQ0/whObW0u1cltmolGxrUzvE7WPIsocuwcx8DFtQ5sMIjBtKcrbEnqGK025XoML
         AqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290804; x=1782895604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
        b=DpDpJ2wETvrbt8q+jurzNIVVenc2TyWaNZgKhT72rZHSOxX+yL4YzX/F856H2mXu7o
         s2P2Tuu6EHE9TZYe6BQXI5tfTgu978Kmv+yx7pa4x5gkbZ9sbYXUZslDQBr5LpmB7URa
         1Bzze9fcRve3C7rQ0K3uwYUOPQIJ9CYCaGif3JJrNiDcCJrqXv3mUMiwd0rOZ/WzGqon
         cSHGL/HBKlihyMQiLG/2pPRgWjAH9oH1j2HaGsjZvEPWilUbB7FwId01/ehPhOF6uIxU
         6boIiALbOs54RAlEmRbZ1bqxeGfKEBLH1SmWua/XKRNF5gilyV7OR83n5j5/8mvdgtW7
         agVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNPce3qUWue7qJDG0ZEWQ9lwDhAp8tX7ODPgV5a57UZ7XNNHM6inJpiT2ER9d5Qqb/YfOLRj4FaUDwMQ/VtO11@lists.infradead.org
X-Gm-Message-State: AOJu0YxKNZ1MIozzRM0ASMIS1+4eDxrCOQ2rfzEqoV7iRQacSFxHRYUN
	P5vZl6jLwXssQ4PzcHU+qBDdVImuusp4MukIBhMsLen10IaonLhe6CYv
X-Gm-Gg: AfdE7cnrkjL1fj1dvWfrTVXXginbV0Jhav+vStNgZTC8zPdetRi0u6oaGGGp7rSzDKV
	XnO6+0BcUuIqpFcobW5xPsuln8yiM7QNOXqTHFM9960cxYW6SV3CLGKzuxBCiSCxqTx0pGS5bqe
	3SvMVMi31XJOGkVdE8FdUYmhYfADBEgJiXXE52/llf8+zMV6kpg4nVByLbaMSvqeMJ7ByTO/Q1g
	o720bPX9hyXOtPQCaUuRnAazPBtWTnPWLWqY5z1/EkzTZcdhlY3QMiCy3cKQIbmkk979bX9XXFO
	1WaXQP6IDrLq7nv9CsFI7CYj46ZAloIIWbr1XOMT9jIeTZ+bB3ioQLP+eEGp6Po+DqxeN8cmmuQ
	t90qGIv1KZyANDrhwi7d7qRGvKt2l5LVKgGHMRWrs/7OcOjtuiQGuXyqM1ROAufdEQYLnEua5O9
	lG/491yzEo2UqfWiCuqZOxEWTSIRpsAuJcg+I=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id 98e67ed59e1d1-37dcd701ea1mr6306406a91.11.1782290803441;
        Wed, 24 Jun 2026 01:46:43 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:42 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:38 +0800
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: add alientek
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-1-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=883;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=Jsh+4vP/f+Y7qzRXW4NmYmHJSetmziSvku7ESza+DQU=;
 b=Z9Lt///3m84yBAmd5Rx6elPweLgGZVP5itDksYZtTAsSRkl/mztlr90ckF6yRI06aMkezej95
 wSJvTw1mqiAB++WxygtHTIGc9+5JEekbHz0QDhcyHEO0zxJqsmdeR9j
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014644_526178_97D3B725 
X-CRM114-Status: GOOD (  10.14  )
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

Add a vendor prefix for Alientek, a board and module vendor used by the
ATK-DLRV1126 board.

Link: https://en.alientek.com
Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..a23508a61373 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -88,6 +88,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^algoltek,.*":
     description: AlgolTek, Inc.
+  "^alientek,.*":
+    description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":

-- 
2.54.0


