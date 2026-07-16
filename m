Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD1C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=2d42w+aKfQxlXVaAlvXILWwZKj
	3WeuB34kpQ+3YBaDkdA3zlHYql/oOv7O0wjjV0/tzcGJQSkcsfEXMh5yYFtphuivw2ej6LlHRzTJk
	e+GgzgVvbliBxSVnfhhXBZnaxffBzC2+KuOdfth9DYiYiyxyP5W8HLT4VJSokemZBp0yqM4Nut1Qb
	ICiLRsErJsKHX/V/Sgf1fce2peiPFYYZnF6ud3GwFmRNgxPbxTsm1zaMyWxFsCnlPufLJvwiSNbLn
	5nJQ3bDeqbzCU63S1HjLGbEMTZYVsgWLkC7/s2cHyoqZhtFNbc8NAELBDJ6/9T1Szw7UoXkHdpS7E
	OUEwrp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMle-0000000HR3A-2bki;
	Thu, 16 Jul 2026 14:08:50 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlY-0000000HQza-0bog;
	Thu, 16 Jul 2026 14:08:46 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 10F63EC0107;
	Thu, 16 Jul 2026 05:51:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Jul 2026 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784195473; x=
	1785059473; bh=5qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=Q
	axUZRFWa1g2FeQ4x1LJDcFT1JWHNB3YKZujZQLTQJ0f4+bdQeQ9RLPHFpdT/Suld
	lz8zIWZpKCSg0+cfCOQO0h2orMDLlljUaUhmSvuGTgJgZWIMcZaO3MEeD+ZJzdZ1
	4c/3UmXP8mtu5hylslvwdmC3LQgF99O1BCAoZOcfXhKNBhGUq42wypVZ3Wz6gNy4
	wXhWEF0XOa8hSPN4ZmIuZ2z+GJVHxIDKswmh3nVwYUOFYzkcdhGPSvlZC+pV6X+t
	ZvF980Sm2Xs3TUWRR0vpweSgD+PzGK+NzzKIys+MClh2QnUUKAFKdib9PDf95KcB
	6p+AniZtHbHZ0uJpPGS1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784195473; x=1785059473; bh=5
	qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=gKbhLG2o3+qPvS/zc
	SAT/Q4GqDWiT4/yXTNotH/PQOr5Tw6EnBQY1p5VnAJP2ThS2BmyBdESOeYq+JxVp
	81X9d9L2J+gSOfvLsVnweiPbAhhBAEJaXpsSGRq/J8FjSlsTYJUXkhIePHSij0ip
	UCu1RsYwchKq2o3ZaKh/e5/1DKjZHNO9QylNacBOBCiMKV3blRFFcV0/McrXG7dy
	UmrznR4aj19eAYtEJntZ9yN7AUUub9RX58Tuuof8AD314HSj/m1SHgPqaByq3Nry
	VS2QJ/V9XgMtBqhak/zWGYiyonlA8bGTdt/QjM7abKbDnQqx82yuDE2aYjo7SPYq
	+hKLA==
X-ME-Sender: <xms:kKlYahtR6wnezED_zZWJK6SvDPCSZ-075gLk-BSK1WNbvl7QAJQudA>
    <xme:kKlYaotQbDX92UVbaWzlxxsCADAG9H_k0bBoZUbuuUZ1eQ_DOEuVxwe36uVr5yUIq
    labrty9Eq9uxoGAd7SExSXZfDlOGwYDjS4fBaj4iEXRFqpGZu_6hyM>
X-ME-Received: <xmr:kKlYauFw7dDiCIxpQ-qfEPtAdpSvDjc5J9vXfr8yf5CW9ymKiREyemXE0LqKBxnVKvLWAMqSA4rPSyNEYkI>
X-ME-Proxy-Cause: dmFkZTEqLIDhGJT5XliwiPhLnzdIXbFPQ7it6NR2P+Bx24KJwsHywzJLHTAHHIB73pTzbz
    1xK7FPLpiOKF8wsroYFuymcVjChI31AMVYxX2Zi9Is6Bc6D87H+CWzd7WtyoS3Ks6rqOY3
    6nD8wRPvM7V08ZPnKKri96Noqvm5f5f9noGGyaJ7uYIRLzrquqoUTqWirz8vHN6eZc3bR1
    3Hm5UBkZ4y4uY7sefafK/a2CmTU2hPo3PYGSZetWmj0zHH5EwOQedZ6vOod0NzQrbZvfhV
    LxCaogphJzaPW8G5oIEXNk31BNOZlikd5JeE9xWGVdvKJS3qqhS1s+o1GlPQAAB09hZ3cA
    i4v4YIcEZ05CeIdc1lKFcUL2PAbtPY+ClcTy9jN6xMCD00dmh8h9YGxYkYgLv/a3htu/oV
    16LpiFpYtRPxVoDKI4ns3vSepi66xEFXLUytnJT3HB4rRHT+DiO18+LWK3LgAAH7+2DDh/
    1uNN8gwV6/XEywxHV86nQzoLkoILR78PSvdvCPj4OHbhxre/YeFBTdrjlCMfJ9A82d//Wo
    eILy0PCAAJJ4nzJm0gDp3bzPwm9B/Af8BXdWA+Ty1+4Is4zIpzoHG5CyB9dehXGdGnHX6b
    jrl+MbgDg2886CqLhalf55dlYM+qYICi4BZUd+s3oe/voz1jlC2p6X00DiiQ
X-ME-Proxy: <xmx:kKlYarMI1Gx2H1yP_azs0PrVvxUzEw8pUJUB2KQh5Tx0KjixYoU20w>
    <xmx:kKlYalKh5-Tqy82_I75toSjnLb5i3tCwjMGsyNJ4j77fQ5uIiejNtA>
    <xmx:kKlYas_GWCKFDKiVtwPXQcRrHrN2eokEwRuQqCtFfz0DNgG9ZGucVw>
    <xmx:kKlYapHZj_Ok6g4_APFqlX01iktaO6TZIXXpzIpWo-EwAEciYWr6dg>
    <xmx:kKlYarVcHZqNkVUhr5wpFr4aRZwhRHiabuWTjM6GndcO4NWklOP-aS6k>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 05:51:09 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 21:51:00 +1200
Message-ID: <20260716095101.2498464-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716095101.2498464-1-gahing@gahingwoo.com>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070844_475043_0766B513 
X-CRM114-Status: UNSURE (   6.85  )
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

Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.43.0


