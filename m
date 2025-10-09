Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=; b=dLTRDpzXfGmLWD58MoRmT24XH0
	L/joc77BmcrZKY2rfSqR3MYxPB7HYbVp8Jq11aEmy2ZNJuLMN5vPrNhvBstC5hcMoxu+hhdXwxFvU
	uaso/GpAnWsz3grEriCsbz34T3wqN5jMI5r81zz72GuBrjcjMua5LTGw/7gLo7fT4yKafLN1vFDLC
	HPIGOShakKg5awLIFNz4utteOKzhtTTKW9g36pk9wQwHHiTHfVsRk8zRhLQkOkmLpKWrUnWwB8BFD
	Y8AqCK0P30mN3Q/5bQF0aff+5z6rXzV5UghtpYipAei9oG3oIXNdN6mlkRwoqUUHM8xwqyWA8CvXu
	qJ/WForA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHf-00000005YJK-180X;
	Thu, 09 Oct 2025 08:45:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mHc-00000005YHu-4529
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:45:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-781251eec51so576705b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999556; x=1760604356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=ihbI69aQa/jYma2+n+sVWw6pLAVsyYOp4eCZWPWWwAp9HDPwCa0EYNv85LUjYpnBa3
         vrPT7LcaVNWhUQAPBKe83NCxBheVSfVIthk2gcGDUgFnn6NhOEQhIQMTyuhkAQt7CKjo
         Y0CfZ2kXQ51oacspu8m4oc5L6OIcKb5JTSelFHZ6eIx9Oi6DgkiDFtUFE1q41yO2h3nP
         4E7aOwMpZsQ4+QoXrk3/yV7yLPOTFoFMRlOqVkInaag/nJF+OKjyiLlmdbELJxZ2SwVe
         qC5EhIEv2XwVZRW0HUtQ6eftz1cEVe1DcrAkbQsuIREa7l+5tYedH+XuKvPMWBL+PAzT
         h6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999556; x=1760604356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=UO6eeDEYA3pCyV2KqyOR+avmWO06/q7XOzjr4S+/+DreuLZVkCu0riODQAGYC1Y7iV
         W8U9n3f1qZgvurSrYTcUgapT/RLTKmBWZmDdCVbAMoGMT5LqUYqPAM+cIECFOPJoUxrj
         ql6/Ip5TmqljKFD9Hbwu2AvRdxp6pMZB2uWgTih6Pv65qsYyDkcpsFrEe0Tejj57mw1k
         +yRSIxjFgVVU5N3UjUKrYLSWrSYSw+oG2EshzrxXeHrhznbxwWO/i7KhKauCPgskkvNt
         HKetP08mf7BxFq2Ksm1hivM0Yn3I+J61cqIbLor4CUPj2v6DkO4wsxN9ispChrqrFAI8
         Hk3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrkfuaCz/A0JNwREk4jVUqG/IIr/KqBviu7P+vpHrIUO4XdJ+UalwJWErf3QYFG0UdXVY/5GVz8K5uPbywbaMy@lists.infradead.org
X-Gm-Message-State: AOJu0YyZOeWeZ0D6eoVIFHc1qMihFy9MXxxpeWRmG8kYG7Th8P7iQZgX
	A6LSDPKOgMIj5JLg6zNipxvGIDn2rI2qfkbS3CazO4thQxkGkQYks/bY
X-Gm-Gg: ASbGncvajEwNjT4rHmvauKktZmOoLbhaqhE+66D6R+3dIAfIRW3NDRxIduIGvx5Jyi2
	u6GIxkLRfXrzmO/lXwomMgUdGV9xZESPrgrzBTpbcO7lhbyAs068Pbtr8gsuCZYDJtDRP/N/Bzz
	bPWwRD/3vSAdPg6vO+akFEUfyzUXlGyppHda7uebXPsQ78uQWR7B1NBrLcxijJYDFnnrK+Dckht
	DEpyRaIL+v0L5Es3/8JEpSFem5b3m5zCK+IuDICeOroeGQWMlq1x4w43YGtUGjr8P55wJCK/NQT
	Nmp65iIYUQryscgP6dFjCiD9M/nf6QE9cxphi/W6ld3puBAg8gB+JtXCFNnfj9PfpBmbPSxwP8d
	VgP71I49aGfrzHeRwacWSXFFYALUBEagIWtSz8To6w6YecXZBSxSGCJHyWNiHNsqrUSWFgCiaeY
	3x
X-Google-Smtp-Source: AGHT+IF7aFFcCzQTmIoHc4LXKvok/D+zEwjkzlIMaULpCLdJ/TR+jbfCMOyMxdkX7CTceRanUDdmDg==
X-Received: by 2002:a05:6a20:a123:b0:243:d1bd:fbc9 with SMTP id adf61e73a8af0-32da8462b41mr9009265637.56.1759999556317;
        Thu, 09 Oct 2025 01:45:56 -0700 (PDT)
Received: from localhost.localdomain ([223.74.108.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e1bf7604sm2130924b3a.55.2025.10.09.01.45.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Oct 2025 01:45:56 -0700 (PDT)
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
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Thu,  9 Oct 2025 16:44:15 +0800
Message-ID: <20251009084416.45542-3-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009084416.45542-1-jjm2473@gmail.com>
References: <20251009084416.45542-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_014557_012186_DC6C9A8A 
X-CRM114-Status: UNSURE (   9.00  )
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

LinkEase EasePi R1 is a high-performance mini router based on RK3568.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..ec2271cfb7e1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -726,6 +726,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LinkEase EasePi R1
+        items:
+          - const: linkease,easepi-r1
+          - const: rockchip,rk3568
+
       - description: Luckfox Core3576 Module based boards
         items:
           - enum:
-- 
2.51.0


