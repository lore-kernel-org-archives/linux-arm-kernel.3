Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDECC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvhLOY3hzP177IpyHpIG/dUjluPVFDcaiQFyb3NdBmY=; b=bkVdF4Q6NDRT4xQMpaVLyFFTqc
	29Ajanq1xr5Yof1d8ic2kaOf4zrRvmmMOU1uQ5NBr1I+IPR+LYd/zPPS4Kny7gmGWX07/dUPl30NL
	NZNEE8fB+nGDvbEeh6l5w1ra7CfFMHNiEB4bDS0KjRIritznOFgX4J5u+mZmnq4TSE3RbzdKedUDu
	aEy6q3gbEOYrxfOg6vS4//GDm4n8+uJQIlj6PxiWYmh+ixuGxb3opVkds2URUs+u3CXItYxMH0cZS
	V87+GSxQkwA5Oke7gx9/3JqgH8yW1zBsMjjjdNKBoWjALxivuxTE+l9VpbRasBU9zbhGqJS9+MF/P
	X0NqjUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSG-0000000H2wa-3liG;
	Fri, 24 Jul 2026 18:17:04 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSA-0000000H2uK-3le8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:17:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id A932C1D0041D;
	Fri, 24 Jul 2026 14:16:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 24 Jul 2026 14:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784917017;
	 x=1785003417; bh=rvhLOY3hzP177IpyHpIG/dUjluPVFDcaiQFyb3NdBmY=; b=
	E1R+nsBicOnlgJVuFZ3X7ZFdamrT90fs4G8m0Uzcb5zzdHfLJupQOoG1UKzhZ8qQ
	YeVga51q1CKdsu4aSWycnl0C5iASo2VFQ47Les5UsMaH9/WCyHgftIoApzNKB/LO
	dFcbCyLoes9tmC2BLBJHxYhxYhMPC2AgIYUf/tgmlqaJclwIi+5uKi61SE5YuN24
	4ZaFtTl0HgdH7pO90Q/NehS6ICsPfBLJB9PI5rUHKqi+rwwYZoOZO2XD/J2M3mlQ
	Yak4LqPik9SBgqhTeMFLYyPROSdmHP+y2WniPkuP+WTQdV04SjYMTyQ5XlhADcQO
	lOl3Z72pk49+gQAJ+wfLLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784917017; x=
	1785003417; bh=rvhLOY3hzP177IpyHpIG/dUjluPVFDcaiQFyb3NdBmY=; b=Z
	A6N9iCR9upJtfeKu7LCIg16pat2B377V+tlNgKIYkr5rFzgecHuaI/HFpyLAse6P
	PaLNOEyD8iuyobLttv8z/rkKx4MGifa8Qji3Z04RjyvGVrmwvSlVyDYZggU23WW/
	kzvF6TLHZZLFEA40mt+OjKZXPds/kHuGcynFflzoes0NRSaTW1hvDU5hPG5ishc4
	GENbumW1T3f89YfOCN/sEcS/LZVPsMCFwxZf2KiwNUq2KtKno7o8vv3RojlaDNrv
	a+DRsbjJFs0g6MmJmnEZ9mz9LarjlW3sYNFF8OC8JPtGtgcGmR1+PHoCYuoVTpDD
	I3Xd2BePlFfag/TpG+2Pw==
X-ME-Sender: <xms:GaxjavNr6gHovjeH9RmZlhxKFJPOLNm9gKqOIJh8Efsa7qDAuJFcKQ>
    <xme:GaxjakP7j7hJCEDPpvzLlW9oIUt216whOjBC532efnZHt6zjicTvioJBOdi7WU-Fa
    Ky8PVArOfqfU2g-d5Bz1UVvlrpNl-MFvYpjpZUrjw1ve2h2Y0TVX-o>
X-ME-Received: <xmr:GaxjajvJ-EmKlFi97E6qyKHTCgNLGI_FEmNlXCo1rxTX-OBmLl5tma8viWH3R2XnpUoiHosob4VKI_0bwLMvKj39XM4DGhyER-8>
X-ME-Proxy-Cause: dmFkZTFn77SKaNLLHGcFk79AmrIEXiPUsMLPyGOV3ahYqRy1TcCvAaQADXiJqRyDKXSPrq
    c+8fcCpPqn8ifNT/ny0r7+7GKFQ3KMiXAR6ugGIJ02AfZphYt41WuA85SGpwtlUzOLuqSs
    HQLBO8pXHo4NcdJHw9ExsaYk9J6E35Yw0x9hu3xHQYx0SIDgX4OG7nOhe4wLlfiqbXWJfS
    7xor45FXZMEpQN7lb25MUCWcZkuhFnuBnqiMPO4ZsbvF7ENQj5Yiz7f874C+2CKt7V8MQ1
    /yaLRi2baR1tPugR859S9x8ReVhk0tPAwe7q+vt6UvNihLV/OcSkYrzlA6e51p+WVnX8mL
    apRv/J3NpDSYYYP4pLpsZNdsdmjeMfFUGYHV8hyEnxrL0pXEyyETg9LjegIADElQihAc6v
    rUrXgcX/kH1O3/cTvwHgpXBif9v90RPLaGpWIxDFz2fts1sZA5RdmMhfTT1s0ghirMRQcq
    tyWVJGuggH8IcWg3c08scBIC9uPa2UxXXvQP+mdQgS+xjOZUmGGLHR7hjm0AYrFP7ic7HK
    LMbjII2BYxkDhpkixFAZgWGfqyEx3fBKNujmLWNbD8eIGSXEeZWXVWwFL97tcPq+z4A1/K
    W0FiE2/avPHLz0ykCndqQBesGK4hJ4CyJxovw8PcGKNU1aJy1dhJxt9FlDxA
X-ME-Proxy: <xmx:Gaxjap_Pu_qjabkh-tZu934CfXt2tC0HhrWtlzSPekm5ePP2rb0a9g>
    <xmx:GaxjavHXLinRHuULbr-9CSyoT--o0RXflfXz80HAhA3YxXL8riaXDw>
    <xmx:GaxjagQ310rocV1tV_TNpqJxrAcDL6WJOYrYVi0OdnMA2E94j-eolw>
    <xmx:Gaxjalu7tmzQtBdpsIU168EqQHeaSFvcTbSUPMzULG_laQspxqkdxQ>
    <xmx:GaxjaoVmFtSDqMcE3PycNZRtiQCQK9LawyNA4OffYu_aZWUeYaXM_ZIe>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 14:16:56 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 24 Jul 2026 20:16:42 +0200
Subject: [PATCH v3 2/9] dt-bindings: interrupt-controller: apple,aic2:
 Invert #interrupt-cells condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-apple-t603x-initial-devices-v3-2-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=j@jannau.net;
 h=from:subject:message-id; bh=AKZYad8jBRwy8Pq5GWuDAVzKic6oS+V16a1/1LfrzSg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzkNbwWPLGcy7dN7FH+lXsmalZ86/pNJQy54kleew/17
 t+lnmffMYGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXM3ww/5p25m9mteK7OlfnG7OzuPZK5xWkik6W6/k1UzgxesmstI0PXpN9nLWx
 EOB+YTJT5suaXquVd030nkgS6fKfemli//S47AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_111658_985182_772EDF2E 
X-CRM114-Status: UNSURE (   8.42  )
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

The condition for 3 or 4 #interrupt-cells list compatibles for the 3
cells variant (not used in SoCs consisting out of multiple dies). This
includes the AICv3 base compatible "apple,t8122-aic3". This will match
    compatible = "apple,t6031-aic3", "apple,t8122-aic3";
shared for M3 Max and Ultra based devices which require the additional
interrupt cell for the die number.
Instead list the compatibles used for multi-die SoCs explicitly and use
4 #interrupt-cells for them.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/interrupt-controller/apple,aic2.yaml      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index d0d9a90e96e7..a94787939d34 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -128,16 +128,16 @@ allOf:
         compatible:
           contains:
             enum:
-              - apple,t8112-aic
-              - apple,t8122-aic3
+              - apple,t6000-aic
+              - apple,t6020-aic
     then:
       properties:
         '#interrupt-cells':
-          const: 3
+          const: 4
     else:
       properties:
         '#interrupt-cells':
-          const: 4
+          const: 3
 
 examples:
   - |

-- 
2.55.0


