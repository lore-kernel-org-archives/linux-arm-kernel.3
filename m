Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B8C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ7rTiXXLivcGcvKEg3er+WVZop8MAHDSdLfwPnGQgE=; b=JtJcs/VgMhlWraoKOU1s1sQwwa
	nGnDQ1GuJzW2fNeAgHOzqCVNsEj0VFt/1/QAlR5UeuEanJ3s0EAX/b60h61L4K4B/BQhDestURp0e
	iqpRCfhG8M0aXDLfE0W2iwfMslqO7hZgqRvB98+84g13kQU4/ByQzgldlNkasI/h42FcgVFjiUREI
	2XiFS6CmXIfzHQN+gTSBzPou4YH0ofa/JFUdLxieLHqttj1peFOcnbUs7MjBzu32oSVPxwujFHhQR
	0xOiWPgTbDRrNay5BOMxt9PRmlYI9R3JkMwv5eTwDB7i74cKvJsnmYnRp2fuFu9aR8t6qZvlTIp9o
	zLvKTBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS79-0000000DrbH-15zG;
	Tue, 20 May 2025 18:54:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS2x-0000000Dr9k-3ean;
	Tue, 20 May 2025 18:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747767030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RZHMuFbLYVdXFAdqh7I9mO5z2aF7/PXx1ydnwNwCKLbDTo59Nl/Utqqv93POAcy/vDaTb3q1VMZ3PIJvemVpd2ewerH+A9aZfSpfKXYkT+I7Z17BmIbRx24pk/OhycR+KKF/8xyR6XPcW401zqsExYSXDCq9f/IYrkWA3rQ7SIs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aZ7rTiXXLivcGcvKEg3er+WVZop8MAHDSdLfwPnGQgE=; 
	b=VmW635RQoyS2ZqwC8Y35RyBwrecvIWe5dgpWykjY669XmGCMom6tP/Z+pQbI8zxOVEBm+G9jirRyLH/4EiBCL9nLPqp4tgDtn5cvqydZDSUjgxrsxpcwCZlxflD1ReZGe+nHj7Cm4/4LfNDXdJVINqdckCGDhf2xJbJjxVdkPso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767030;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aZ7rTiXXLivcGcvKEg3er+WVZop8MAHDSdLfwPnGQgE=;
	b=P9tEhswExxYVfVE9wxZz0/2jloIk4qigob07HEpG1THWjZ+yqxLNW+SVNz3/M7pz
	VWOhAkMxO/Yd9L68izGwRQuRwFl2WIUnchHIqjE6bl+QNO1XcP3dJvEWb7f0etfrxZI
	+jULTPYbEjaH6piPEuKNe/7ejl8xNoWRxJC9LyGE=
Received: by mx.zohomail.com with SMTPS id 1747767028966420.67137646323636;
	Tue, 20 May 2025 11:50:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 20:50:08 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: rockchip: add RADXA ROCK 5T
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-add-rock5t-v2-1-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_115039_974107_B7C34012 
X-CRM114-Status: UNSURE (   8.73  )
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

The RADXA ROCK 5T is a single board computer aimed at industrial use.
Its design is similar to the ROCK 5B+, but it does away with one of the
USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
additional second 2.5G PCIe network card instead of USB3.

Link: https://radxa.com/products/rock5/5t/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390e53b44f9093d32b869a7e0655db6..e97da6df420331b2c402f84ce06d325c71964ed1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -961,6 +961,11 @@ properties:
           - const: radxa,rock-s0
           - const: rockchip,rk3308
 
+      - description: Radxa ROCK 5T
+        items:
+          - const: radxa,rock-5t
+          - const: rockchip,rk3588
+
       - description: Radxa ZERO 3W/3E
         items:
           - enum:

-- 
2.49.0


