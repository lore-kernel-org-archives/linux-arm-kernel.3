Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187A0CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv5O6vDfCK5Jqf7VoEbZBeGLLhZYJocYRBeioVZ5Phc=; b=AnUKO5DnLElFuOQt3UgnE5tB2B
	3+5h+fEINmHI97ecBGY+yodezsjnVoZbUxlXainSVLrDoS0aDo6kgMhriZdp4mFH4hvQFyEH7qJJv
	cMRbFp6v3w2Bk4R0x56cSuNT+vTy5G7MuRGB5N7OCkTDL0iERBXg9JKX7EJB4i1tz36kZukn+3akW
	1yvpeGLdJcuscTVy22Nz/FV6tS/2UBWKkojZy2YhPo1puh6BjKjItcM5RVQY1b00qUMsZ+RT/no0h
	LB/rnZBSOTRhNtG+8cJ9TyOucu5AfqzkAxLqfnoOaghMyE3RtVw/kS+Zirk1CxvhHoSGm87eZyJVM
	tyvqhOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqEh-00000001w4f-0LvD;
	Fri, 15 Aug 2025 08:56:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sSC-2Rn1;
	Fri, 15 Aug 2025 08:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C444446314;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E585C4CEFD;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=nCRulO6K/H4lFvEhCNrgEuQoW1aO9yFrduMC+IOo29c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b+8I6vEBUOUM7Yt4lOsrIUfyux0sPT5VzNi9AGq+wOuC9W/F3hv14/aiZm6CgvU4+
	 JQFLnMQE1aMo8T7uKT4XE+DStdC55xYhPa2PeD7sbw4p3MjS6yHwlT3dJD8DlzAkBk
	 XCtoD4nZqVjevEzMNQf8McXCVLAPAcqLBvny9WWxI0eguvL/eTZTsYvg8ejy+5HKCX
	 PzRKw3dKJtYcCH7lMgdBx96B30F58kUEu9TVSeOn/2iindnnn1BWvaMSHwLk5vNPXF
	 QtINd/Sumxu/ifaNFiPD5X5+zWsEScA8QCM0DozfcWt5CTQWhdIlfNwvctqVuc8al3
	 r7dtq10yQ9zaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E89CA0EE9;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:31 +0800
Subject: [PATCH 05/13] dt-bindings: soc: amlogic: Unify the compatible
 property for clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-5-59f04ba67457@amlogic.com>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=1771;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=WLsFB3kZYI5SRTtCiEJNIQMGbbEEbhu5OiVfqIrbRCU=;
 b=15BeFKwtMUW4Xf1NqNuNqnhEhMKHY/rAApALIEl3odOLL/43sqwREMcPMGqW3A7x/6AJvI4oR
 U3KLtA0rnWGCvCtUm3EXXlqWfXYYS9nC2B8xxigjirG1/dmavcx3I62
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_690163_9A67EF1D 
X-CRM114-Status: UNSURE (   8.97  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The clk-measure IPs across Amlogic SoCs have minimal differences, so
they can be managed with a unified compatible property.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 1c9d37eef5f0..a7927acde2fe 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -15,15 +15,7 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson-gx-clk-measure
-      - amlogic,meson8-clk-measure
-      - amlogic,meson8b-clk-measure
-      - amlogic,meson-axg-clk-measure
-      - amlogic,meson-g12a-clk-measure
-      - amlogic,meson-sm1-clk-measure
-      - amlogic,c3-clk-measure
-      - amlogic,s4-clk-measure
+    const: amlogic,clk-measure
 
   reg:
     maxItems: 1
@@ -67,7 +59,7 @@ examples:
      * offsets.
      */
     clock-measure@8758 {
-        compatible = "amlogic,meson-gx-clk-measure";
+        compatible = "amlogic,clk-measure";
         reg = <0x8758 0x10>;
         clkmsr-indices = <0>,
                          <1>,
@@ -82,7 +74,7 @@ examples:
      * Example 2: clk-measure uses V2 version register address offsets.
      */
     clock-measure@48000 {
-        compatible = "amlogic,c3-clk-measure";
+        compatible = "amlogic,clk-measure";
         reg = <0x48000 0x1c>;
         clkmsr-reg-v2;
         clkmsr-indices = <0>,

-- 
2.42.0



