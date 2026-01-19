Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A9CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEoJqj9uTd7Y0ehQdanwhzFQK3MDRJUp/BDSWiw6RZo=; b=IO15PO7vTxlkyCLX0ek/sUOaXY
	fsU/Wx4SYwozcfDzUSAs/EfDkt7tOQbLxa+rVaPeqTH/Kvp5E+c8vaAmf0y2AmsfXYuish0vC+hI0
	zi9faLf4hSCpxeZoxgnAXrIO/0BkKZRtPZtmC2NMW6MhOebFxzeGLDeVgu2KXZ+9qvQMSlWpQumdX
	VaKvpaX6egw5X43+6AYHUamH0mz9sFvIlYUoHlJxkUcT9ev8F+03foC0ggBZd7KC6ZE1IWOEwKeAg
	4eU8A4uz+i8j1aC9RVWEeQtHV5L5MFKrC6LMgOm5LVFCi6djtPWLEKdinjAo5xnkt+Agmfrs44dXt
	O1sSmk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLU-00000001RnR-1h7R;
	Mon, 19 Jan 2026 07:06:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLP-00000001RlR-220Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D7DD4449A;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3552AC116C6;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806394;
	bh=HBqZZvttDuyVc2JsBsl5S4x97pPOmaIQnnZvUvbafxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OFdoEsa1eUTSjqQReNF/DNXF6nenxZgTiLeddbOqwOZIunyG1rt3VLqqbTMf0H07D
	 6OfppIZvn/gZIKWnjvL0QVyoy3XoROKy5BZaEm5os0eYcjXBxrP+D7Djzv9XeVm1Pu
	 gqPeA+HZwxqDEwgvogwfHrWcoDbiqKKSe1vwpNekNBEi6yBFgdKcSJ1Z8lX4OMIwad
	 nu3w9t853386cRA+xpfcWALBcuRMQFlxwTvNwaqhtbbWk7+4sLS8oM9s2hLVj+c3P1
	 eFLr7WNMxvzREFUM2a41wWRPP8h9cTB/8yelT8HUpJkv0MFqX9Zd5SXkSUU+nBTNxv
	 xG5qZbPaQunPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24897CA5FF1;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 19 Jan 2026 07:06:22 +0000
Subject: [PATCH v3 1/3] spi: dt-bindings: xilinx: make interrupts optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-spi-xilinx-v3-1-4566c33bac0d@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
In-Reply-To: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768806393; l=837;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=Rbmi4yji+D6yvwIqXdPoR0dJO1NzfG8jvbb3qwJR8Ss=;
 b=JQle1H+it+z7PYjip62TbpkcvzOoAbHLCXfpWxiR0e3EWzfcdXFENf+yN80RvCghBvCtGnzxy
 TNfS8lYEYh6BSevl/AA3QWQj6Fdsc6TRsq6Fcygb9T9ypG0L823enW0
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230635_547444_B4272982 
X-CRM114-Status: UNSURE (   9.76  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Both the hardware and driver already support polling mode. By removing
the mandatory IRQ requirement during probe, the driver can now fall
back to polling when an interrupt is unavailable, ensuring
compatibility with a wider range of systems.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/spi/spi-xilinx.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
index 4beb3af0416d..24e62530d432 100644
--- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
@@ -38,7 +38,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 unevaluatedProperties: false
 

-- 
2.52.0



