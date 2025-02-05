Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A885BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5hN8hYu73nLFQUg88JO2+5N1euFquYDYCWfMTQ+JOs=; b=FHHqaXbBro79OvDlO5Xhe+pOsd
	Mo3m80Iu5+uYpznTM4Q3ZRMM3hWa7at21kX6OFSj10hs2OfTTIGwSyH+RA+dNph2JjSqgFqnYme4x
	h8+gWEAQwqw8zjoL1Ra/9KrF0KGrYJ6hTJKFp08KqqVVLj903TcWdUFJ7IwCzyuXvObovJ6JTlsAZ
	Kd1PNUOpL2xA06Aj60HX+QP3qCa/lzur2iYXsmqW7H9uz0gEyL+B9vFp5iENbIgH38HmgKtJ+mMl2
	PVNaRUNl/yxmK236b4XrGtYtE4LpoUfRWlrzbjqVlXiNtZElYI3viFAycmbt6cU5QoTxwM62R5cLR
	zkuNjidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiJZ-00000003zQg-49SO;
	Wed, 05 Feb 2025 16:31:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiFb-00000003yhA-3Nmd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=l5hN8hYu73nLFQUg88JO2+5N1euFquYDYCWfMTQ+JOs=; b=X7NgCttujckugNLOVzfDwti5Lp
	2U3Zi9ABHcwz92IjbdfXcnI6X/BOJ2egeNRgn3AzV1nuOl2NKPtLXiCwHyvTh2NeFz8Uvthx+CMYh
	b2x2yCm15/j9mjg5o0cnwg6IjXMBGwy7oYDDaQtGkS/ovuQ/K+qsJwCC4D1GcNh9zoH5I/3cYLAPe
	0UPoaA6reJneaTfbqGCl3CA8HJAKDxl6EcuOLW+ZizFsbTyWdYMh0KiZhF+zqK3nxw/IA5Bd05zTg
	il47HmM3wOt0W8bGTkU2JKQDMioFyLo0gRr4wPw0tefNSH3aq7/z1biDoojNcXhSqXpGbL7OjKg9u
	S9t+Cp6Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiFY-0000000Ghbw-3BYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B45A5A43830;
	Wed,  5 Feb 2025 16:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD8ECC4CEE9;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772856;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oBYoH8FQJZr7/lf2sPIABAnMt7AYeSZT5VT0e7iTTfqYUtJZtQphVswITPCmQI0YJ
	 ABn6i1Z57rPrw49DrF6sqE1KDMstcVO+oY0ZYsYQJJ45OjvBW2xJ8rtmqTKOjd9Gjo
	 je/jDKLpWWfPBTMkIooAssei0n5HADSjLiPM2liF69PKqTmL3gxuPRZ4AUNbGeRQzK
	 z9kJC3Vej/+1ysLnUJS3jFz7U4kb3W2TfH1L/5+OcKZhvvXWI+uXXVGOsTm4L44DpY
	 5gK9BL9DjiSaFvqixure23n0HGC9Hi6pvhvUpeaQWD6Ve1ADcrUYixeKatI/Qsqw3J
	 /A9JMkH3JTt9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4182C02192;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 17:27:29 +0100
Subject: [PATCH v6 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-z2-v6-4-cc60cbee1d5b@gmail.com>
References: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
In-Reply-To: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738772855; l=1303;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=InMRbHicu7oJRHDFwDtDafdNISTi0qP6MkyrWoUFJQU=;
 b=xB0JKoSqykV9wlskFcjmP+6fAkYQNyG1lRoLMX1kTL0Rv1ZzVdYu1QRXcXpJFUFmmkhDqt5mV
 7zc6n+VFzDZD5Y+yJu+TRz+BWZZB3B0aFrfVPzPrmQD4yw96UzHgil5
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_162741_189212_3BDDA229 
X-CRM114-Status: UNSURE (   9.23  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2191,6 +2191,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.48.1



