Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED6E6C617
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIwJfxL+REsPC0EzLsMrbPYPwDQbfDmBHJtA8hy/l8U=; b=d4P2cTDOxRH/4TYQ0s8SizwiNU
	C5mNzfPWZ673TLdaqJJEMPX9ZJSwwc4LVKEFb4EQLIgZKoQ/+pBH5hsNcnzGfBDDdG8fznXjTXGMQ
	54nhvhqP+v7LuDTt8eBha8A7LTMK1qdT6xFnScj53YhbkiUvpu8EdxRZYiM7RWePWZc1yscBzNOZG
	Xszac2bExb6tSKaHjYZgisI4/rohRdvi5lgVQGPVIeO9JCkTojY9kNKe7fMeXaxqjJGaBdMNB92oi
	/R3bKFsMK5YBHEMvcRHNfbQZF6pV9t4cqaXUwnFi58bD/F7ryLmrgxI32j40Yq+qDOneSQL1Y63/T
	4fwpqCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINsG-00000008cYg-1Hmv;
	Tue, 03 Dec 2024 08:03:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINnK-00000008b7G-2I2G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3CCCA40B18;
	Tue,  3 Dec 2024 07:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 778C9C4CEDA;
	Tue,  3 Dec 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733212684;
	bh=MPqRUHL1p74lDraza5Gu6r3LXxFnHS9yDJRigvY6itc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i+Iaz+vX7XJ67+hcwgVuwWv9LjqOuoMyzMI9v7VkUSbN+P7KEDODPx8RScbjD7eaE
	 mRpss5A+Cg9kR9JbZE6F86/vTy18stbCz8oaRMedRwTduz8Ac/0GdPkXgEhudg3ila
	 LhCFKDMmEckXyW0ZDa11z7JOtPewaYABpWqpCnMM01tzTWgmkO1BXjypdMzq6Y5Ner
	 //S9/U0jguwxawM4DrqsK0YWGAJ2iPVUZ+CjZzPeSNF6aaKlFJBSGd1odaf6suIREL
	 Xr9QdVqDdFlXsMg2XFYQyrUzBh8k6WnKa0vG+33jx4ikpsWAo7wXTLyv/aek3vNtsw
	 e36PG9Rg7ttVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BC2E6C614;
	Tue,  3 Dec 2024 07:58:04 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Tue, 03 Dec 2024 08:57:57 +0100
Subject: [PATCH v2 1/5] arm64: dts: apple: t8103: Fix spi4 power domain
 sort order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-asahi-spi-dt-v2-1-cd68bfaf0c84@jannau.net>
References: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
In-Reply-To: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=9ueUveKszfxawJ0HmIK5r7NU/tiqsgQwLWeRgQUwJgA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnS/XVzVerG/X+kfvlZww+imQce2syrbvpnIbtvpz56tZ
 vDJ+VB0RykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlYSDIyHPl49dl3Zm+x2wZi
 F805WX4WfJtdxqR3LNIvlq1wkur2JEaGc9fKjx5hnDRx69rqxinMh1dsCmZbx+YgNvU3u8+FXav
 /sgEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_235806_722673_B8407B4D 
X-CRM114-Status: UNSURE (   9.16  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index 9645861a858c1a7c46c25a614c2cc4b03083bf46..c41c57d63997a59a9fe3c88de31fddb31781398e 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -387,6 +387,15 @@ ps_spi3: power-controller@258 {
 		power-domains = <&ps_sio>, <&ps_spi_p>;
 	};
 
+	ps_spi4: power-controller@260 {
+		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi4";
+		power-domains = <&ps_sio>, <&ps_spi_p>;
+	};
+
 	ps_uart_n: power-controller@268 {
 		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
 		reg = <0x268 4>;
@@ -558,15 +567,6 @@ ps_mcc: power-controller@2f8 {
 		apple,always-on; /* Memory controller */
 	};
 
-	ps_spi4: power-controller@260 {
-		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
-		reg = <0x260 4>;
-		#power-domain-cells = <0>;
-		#reset-cells = <0>;
-		label = "spi4";
-		power-domains = <&ps_sio>, <&ps_spi_p>;
-	};
-
 	ps_dcs0: power-controller@300 {
 		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
 		reg = <0x300 4>;

-- 
2.47.0



