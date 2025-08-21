Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9904CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a82yyMEYHu40DqB89vigzm/psQridmD2e0l1vvxVn0Q=; b=jSNrmM1QNEk0oAWrQ5vl5rzHFi
	dSmn/oX/8q9oLC+s0YA8Jnnbaezlik6RP34S12rvm5TcSKxOOxGynkNFYWw0mYgdYjxl3DzgWUGLC
	An9Lqz6/DZCM58+0XDER3kb+4LNO1jTW2uh7rm9Jozm29/KxvG5t3w6H29NPeavXwFK85HAqPBvZ1
	CHV++KcWOKLsXugb2xZ6nsoAQvJgBmhBm9b2y5pCb95f4z2EAbvO32DKEwkxRIwmhG8bQ74sisxMJ
	tIeEzMIuhR4MtnqrPuj8ri8OUMG2Xr772w+dB8DOyVhSmIo3SmD/ai77RmOfa2gb/G5nkBerCoIqS
	dIxceQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDt0-00000000knu-3S26;
	Thu, 21 Aug 2025 22:35:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OW-0000000HQWL-1qX6;
	Thu, 21 Aug 2025 15:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8434841915;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15470C4CEF4;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=//lvZcgVxWAuEEA3XDGiToePWRSnH3bkVOU2t/uuiIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cb4iDmJtkvpsfcraaWTJZwH7A20AGhAqlH073Mpqv/DpHXKx6KOthBtxZsP7jYcoN
	 N9txmEQVcmHsGM3lvrG2hxAVZxi7cAEJkashq8lOwFu6MnimEMXSvZYok+QnJPpRdN
	 KtQZG3PqG73FS2zxJ+pXF7OpRSqF3MbWDtmsl/aoJCNWZw2fVikSrQDXCvpue7n0G7
	 7a/eYQktIOEzlS+4ffvts5dttKR7ZUILF9zi4iF7p73K54URX/LfCuWhnAswA2/jT+
	 IG2HwJfU2uiHJxYilgNp7NZA00vSUdTfuFEzYqOUzyP5/245W3MfKmQ8p5m/zsaqpm
	 jpny5O8dALkvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B64CA0EFC;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:38:53 +0000
Subject: [PATCH RFC 01/22] dt-bindings: usb: snps,dwc3: Allow multiple
 iommus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=//lvZcgVxWAuEEA3XDGiToePWRSnH3bkVOU2t/uuiIc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy2/nG0SnPma7s+1u9jC+KO32S4AWrnn8X92R/kFnUn
 2z0xmB1RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiD7oY/koEWFjGfok9kx3/
 k3v65I0bfsR5Ji8oqNnHKmv2waD6PwvD/+qt78+F3JXaOeHTz5Ji7xnMT1MXKv9Yqbvl3YXZ3vw
 +zzgA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084004_500760_B31F3009 
X-CRM114-Status: UNSURE (   9.27  )
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

Apple's dwc3 variant requires two iommus.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 4380bb6fa2f08a475b557e80467abc2861f622e2..6d35dcc605c01977f4fc6fdb6f12976f1cef2b9e 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -60,7 +60,7 @@ properties:
   dma-coherent: true
 
   iommus:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     description:

-- 
2.34.1



