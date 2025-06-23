Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD35C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=; b=pTbPZVsb4aoWbqjKJqgE8to5g6
	MlVHNHj2xQn9Rj0TLtNVlzbB36LxC3U5nsZa/SebGn4CePPgZq5P1mGQ64BA7YjWzKFNfgyPmT1jE
	OGW+FFFbpO5+KdWNhOsYRFLPY2TDCIEqEDHEN6CzoZ4qHoKFmnA1Vv7a0ZId5WcaWHD+gmNy/sCTw
	V6FiCLpDoUod836+/Heb3hISmjnhTQP1uLN4bx2qRmIk/me1BnmGuhqTjKpKGUkWaUt9g02jE4LoL
	wwFvBVrDcMWGYTG0Vq4147GZTGFLDBuDo5HLwAr9KQHsbHkQd/Htp8syDoj/bkadt38n4LZ5sOgY1
	nf6jNwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjrE-00000003O45-0HTg;
	Mon, 23 Jun 2025 16:17:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeQl-00000002LmG-2YKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:29:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23633a6ac50so54718035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750674579; x=1751279379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=JCliy5XDHNX5XNH2w0jX6bisxE6DcWpxSX/Nflbe7vyTmRN70HpoT0gn7DmqjkGSKu
         p/RDpT+QAo9KWD7nWwLZpDo2BpIGV5fTKMuG+URP8vdAy8siFtMaZ3SNWCtlbNGCJCtO
         vAJwIQz6T52lu919uaXBzWl1eDlugSbr6vqN3mop3hBKkvhUhk6Y4rMi1uTR2Ctc/tNe
         umAcTouHHFoPbmV0k/syEoflGRq8SDx+Y2cbtngSsSdEkCSpUyJ9cxdCKuhdDNdJvP12
         W6LH7Zz6WiBO07FHb0RCKZf91RNajhr4GeqhI950Lan86pBU5MjJugov/Qvbp6MYQH5F
         OwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674579; x=1751279379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=PL0yaa/9rmLyS9QYrnT4OfCNjrMwqp/bfwmP0ZlZh7bRL9TEusJXUGZHN8EAF+rYmI
         EHrfxXCbjwq2tg7wNfQYA8G3h0H7t/vfLrJVad208yn/9XDUYpwS6cJtI1JQmX1lTuEz
         FCxljPYy8sEXkuJdHx/z0Un/Z+5JYF/Vg0/z14zTMud9jp3AVQUAuoJNy6ewaCAQRlaR
         LgYfygW3W2egWLctqWQZo/EvLBBEain1eKl62Dca2PCF+Js+MzrOakMi9n/lydvttubb
         TfomamwwTulmV+d/q0G5zM0BmhIlE4fxxrQrIEQ16d3sDCjFLXjeS32D0PkgD4+jNLoR
         z6wg==
X-Forwarded-Encrypted: i=1; AJvYcCUBCDtgKXRTcaNXRSiyN61WEzmN0iB3qt5R9zRwjcILIHEgxlidkgPaf/0RNdTtx5CoYYBL8LRsO2j03SDTkLP5@lists.infradead.org
X-Gm-Message-State: AOJu0YwHa8rExaKPPdCjJ2ii1EHniVj2HStduUJ3KPbNtoZVhj/A2tj6
	lPKng64xfBKdN9OEUF392iqlc8jewf4laTRVi7n4zRrl3j7o5Em/Cj3m
X-Gm-Gg: ASbGncuJfmKsPzNmKK4OWqlGiKNnBLThD2o0qX8NJabUusGsXHFGVhqov02BKgGzMqx
	uJnUk/7oT7P3nXvTGeBgz9lWeNk1jvAzbD8dCq7euTPCN/AiEbKKUHdxgeB+qWw77lQ5WSqd5PR
	ygEtKMYmTM5zRlcAdLQUosgWHLWxlEvay8zLVUscmhdZ5mXgGOz8koGNz1CaxxfARtryBesNlGd
	yQ3zc3AHNxGYEcZEt/7HKYs82q66Yc2S0gxaUxgv4yADVz9/SMdk49KueyQxgN+6ygIgaUs4hvR
	UrKCj0jxFTz35idv2WN22RdjP/WtHiBra8dNp9Q92XwKBwNkoFJWOWFzkya8hnEKdFxleUW9ODD
	sWqgCRWyYDBDqhs+qbwSsVka9orAi0/Q=
X-Google-Smtp-Source: AGHT+IEM86EF9nrBu/z1x3IbxT9Xm3rBZ+c5loqQcmDNcyWe1L+5KmtdP7tl5Xb0XGFSrI5YVvs/Dw==
X-Received: by 2002:a17:903:32c5:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-237d9914c92mr190971635ad.38.1750674578719;
        Mon, 23 Jun 2025 03:29:38 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm39901125ad.165.2025.06.23.03.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:29:38 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Mon, 23 Jun 2025 18:29:01 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-add-support-for-meta-clemente-bmc-v3-1-c223ffcf46cf@fii-foxconn.com>
References: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
In-Reply-To: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750674571; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=SKqzHgYPQ7Ni2KNl1y7P+2ODxJOyoncuzZa0GvAoEHY7gKk26Z/Kibl+bR6P+55cRpMcqRF9L
 4hN7sj9jUWSATH9TH4C28UZ3RI0XXbKh+DvC+mnx3ZCpTpfLhEnPBrh
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_032939_640121_1FD318E7 
X-CRM114-Status: GOOD (  10.03  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


