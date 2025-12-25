Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6024E7AD48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To71QWfLCHE5d4xhi/Zs0prFru134LKu96JV3cWITsk=; b=E/pBngD1X2lGvWeIZqUyfrpZWN
	5ZS26WmIl4P5couGf4y5RD/tKZbsBJt8RZvXerggg5Y1bePuZIPSCUgY1mdUhdk1tkGGFNQXNwYoF
	xSHCgTs2tCEwDfrNdTh1yT/Y9LJm7e0yaw5SzhwqfJpyNA+cRZ8GqjBQnlzKd+yOzbyG+vzJDu7HU
	2JSePD44WYhKs0vTZ192BSFwifaCMACEAdcRuIqluWtRG3w/KEEmX8B94fb+t/bY5ZqLJ5SxlebHn
	S9cLZcAsw+Xt9PbocovNwmoM90P0tAvjOj6iNZUdfH0xkUwmPVCjqvNJj0RAuJfAfaGweqNd403V5
	bEemXb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihy-00000000KP9-1p0L;
	Thu, 25 Dec 2025 10:36:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihp-00000000KMg-27zJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8F5B60137;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03729C4CEFB;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=cBSuHQovsHdrJ5dq2OCwejhhgDoCJeLmPn38lFCy5dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lzqox1NVgfmw8yBz0Zdtv9ZUwJeLXfoLdNlkjKHsBqj7ffVC/KpYbA/W7gNUw4aNU
	 nZMIfxe7+LZUj2DpwBCcq3vd9EplRmVWrx+qJxsURa9dPJWhAryAQevQLAFr1p0d0L
	 kLrnN7F9mBBxYf2DtX64A2mpGTtu4EWF2iOk4ho0mY4p/UOU96F+PhR2XP6ju8baDD
	 WhfZ7uvBEU86qDk9XhGNVlLWDIUBWsPrU0DSOzg2I2ES7L9FE4sDTy61zIueqMNVCB
	 GqG1Ge5CWg3YMACLkIXYdK6Tdj7VJOgn4cPIRYI/WsIf/2tCk8p/7z0EwDOchp348A
	 4lv4jrgdx4rtQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 5FB4A5FE52; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with leading numbers
Date: Thu, 25 Dec 2025 18:36:13 +0800
Message-ID: <20251225103616.3203473-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The pattern for pinmux node names is typically the peripheral name and
instance number, followed by pingroup name if there are multiple options.

Normally the instance number is directly appended to the peripheral
name, like "mmc0" or "i2c2". But if the peripheral name ends with a
number, then it becomes confusing.

On the A20, the PS2 interface controller has two instances. This
produces pinmux node names like "ps2-0-pins". Make the sub-pattern
"[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
name.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 990b78765427..45b7a0b6c626 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -106,7 +106,7 @@ patternProperties:
   #     the pin numbers then,
   #   - Finally, the name will end with either -pin or pins.
 
-  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
     type: object
 
     properties:
-- 
2.47.3


