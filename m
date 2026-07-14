Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F28C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8x8RDbcfDX0JdqW/clHRnOctzbZEE6whwRLBLDpw64o=; b=FalgZKh5VlwQkzGjSyEVRyq3Zt
	y9aYMAFnda1CRpsCJO8UxRW6TjoyH8slpOKPV+xGDpGzj6egqciP2Cfh3i/O6wIXxpZDQ9YYYWgwV
	XPzJACtvaAPdhorQSRmuRBBiMIN11T7+ahB9gyOWXQn4UdIr7Z8ezcxSqfrKAHT9KUzdVjNsxi1b2
	4dz4/poG5rGOOdeELtJwG2TqJKNATEzQCNJ+V9kyGyuWwLJS+YheLhlKl6EDqCatAIMdBtzl/fmu1
	qnaYFIyWWRkoSaSVPJM+Bmcm8duoZ3nHBoWaWoYhoJ17A3s5l2JXd6PROwDq7mA8VxpqxvnOdJdY3
	CLvinpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiZz-0000000CzpI-3ycz;
	Tue, 14 Jul 2026 19:14:07 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiZv-0000000Czkz-3GDc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:14:05 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31003415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056443; x=1784661243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x8RDbcfDX0JdqW/clHRnOctzbZEE6whwRLBLDpw64o=;
        b=AuJo0FZCB3Zgk5UFTjg8GZuRh9DmqIduHrN7sUOG5jwOikPUp+PRGy9fTlcAUQ5pJd
         r1wPO21i+3ryUsPFVUcijkTGSzBd0no6RMVwhPjGJ/mTmEA2jlp/kKwN8gLXFraNl6QQ
         f9hTx7vnCwYXMRjqPp8uoYi2Txm6APwLBSgT9hAEMCfC3Pg1hDU//QUAC3DbExprHQTp
         xdKsfqaf8ioVMuR7gk5jcedpUZHF8VkFYCqYHdtBVHGq9NrCWkk4inxjGkzxalaJ5lqt
         l8UfUyOgaW1S87ZDWLZ1qvwSrhla7O3lmx/ipMKjqKhHfNYDdQlmSJb5jt3+PWHHjsye
         W0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056443; x=1784661243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8x8RDbcfDX0JdqW/clHRnOctzbZEE6whwRLBLDpw64o=;
        b=M1QT4whh9tL/oLP4I3kiRrcpxXob6vwwEqSYYApJHcrapRnsbiLFECkL9IuOx47QUS
         93UBA68eG9ybxoN6XRovEEs2qMkTl60NW/ofAyAUMjMfYR+gMeiOeBEbCwqs+my1g5fX
         35RNuvCS07ggAYs+TuRNkyG/Lo6h6e8cxdD1Vxy4VbYSqMoSGvai5h9Vibbx6iR5JUMh
         7MaQGrf3w9ZLxWXP7qwBp+2mDIwmnzMfAnry1izYTyEbd9tuqqxKK9hTbEteXUx9A//x
         xGVUUwLL5xAEzGLWaiiJ5PIzDvtb2i9Yq4bRPeW8uvGXZlx43unWTdYDofrSAutt9Im4
         1aNA==
X-Forwarded-Encrypted: i=1; AHgh+RrYtfQ1papt47MfL6kSOdOKfOTv2HzskHV40gCbazc652qt1BSY3Ba3I9aeHPm1Tu8L+nWHqgfO8xXrh5B8oP+V@lists.infradead.org
X-Gm-Message-State: AOJu0YxjrqIxZgT/MQkn7DILXzIa+jAJ6ZTyilj/0+DGks4rjEkzCrFR
	Kz62x4k5u3yiDFQA2ZVPyKQAfvd1xHLKXMbL4fxNOolz781bo+ZWSEoB
X-Gm-Gg: AfdE7cmaQEGORUQj/33z+groZ/yvFa7w+yoQ1gSO//vMWs3RrdtQ/w9jVMvgiNK4fEF
	eeJDGC+1vlsxj8AYbrONZbERBEeZv+w+Ba/8XgQ0d837BC7xrFj/2blHLUiiMvcEOVrnu/cio3l
	l3/znHGL2f5ZCyAoyBx/TXn1eadAPPILcqwTVAvuGd+nClsuLPv+IZPqdtSOmvVEBxbOO7hdrdM
	cYRt4PQmOaDssIt3vG0Y2orX+Tu3fBkmP13bOsmk5rWH4E1tN67dkYqZepaNWPk4qDQFdleul2k
	UDO8XoaZdqKe3ebqYXa7mNwUsToo+lMr3wMIxdSFGRVnXXkmdwl9SG6XXMXIZLmW48Ul8/1D5bD
	KT4Tkb0Jr6M+byjOUyR+F9KIHjrLsbW7Mt6HfpRwwya/aKRNPIPxsqpXruTYt2b5TUDltdylscI
	Vw+GOBlfYVuLY=
X-Received: by 2002:a17:902:ffce:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2cef1374743mr36739275ad.46.1784056442914;
        Tue, 14 Jul 2026 12:14:02 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:02 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed, 15 Jul 2026 03:08:30 +0800
Message-ID: <20260714191341.690906-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121403_832849_B03482BA 
X-CRM114-Status: GOOD (  11.00  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1), with 0 being
the default.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..6173192e31ab2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,13 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+
   "#phy-cells":
     const: 1
 
-- 
2.47.3


