Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC2CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpOrv5CpH82A5GtL6zj7fX4JJfjsERlmtwQhPvJNmmM=; b=IJJNOtJGSn6IO300AOdWdFHH6e
	i/Ej6VJJaCYb1D7dcKTMeUdEpRaiz42DOqBCiQ+kqV5w8i5vCyKThMc6u+EsIgHZPZwzTMOPDpINA
	pXlE7w1Aq+ISF/aWKm7dfWkVom39v4/Xgw+cj9Fw9wOTJza01OXKtHS2+LU1C3KBrq7LRqUSn9/7c
	ydNnWGJ5r3akenSeq7zCn41ryuuJLFffDHzqcGI0LeB9sVTTnuZtQd1C9ic4gtenAXmhbIHY1/ZUa
	vZATUIi/iTG5E4J5qrFIDQGBOVmpTH4wHRcHIuAkLNW/w0HZ6JMtwOTtHlh2miGAJfFPyPPv/z1GN
	XXknCQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74s-00000002EVw-2jG1;
	Wed, 13 May 2026 10:44:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74r-00000002ETi-0gji;
	Wed, 13 May 2026 10:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=XpOrv5CpH82A5GtL6zj7fX4JJfjsERlmtwQhPvJNmmM=; b=QnjAjlGilLoVirbKYhpN6IoWhi
	OmetQf64USi4dO3EygJdsbrhihlo2wFNfDf32DDgqQ9xHZspbS1x6nEB6Q2Yrlfz/4yrxl1I2IKw4
	aJ06N6s3E2qNYFuLkvkINvAkg4Cw8hO4qDkZQZdQlcnY7bNOyjC7kCmFoQ7zChbEgJ6gbLpaC+Hrq
	23Jb+T7xhGMRxVYeKDyTPCJ/pppIo/Of9i0W9Gs48rb5JTbQtm8+lPw7p+boXOl6bvN4+Ppow3K2+
	E5LGlOQ3tCvE76lex475YHPTRely7m5xq8Z9uln2YBEuAQOdBssb4BZrG+mJGdAaEXE8UBPJtyEP8
	jsZ5Irww==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74n-0000000HBNi-1Vh2;
	Wed, 13 May 2026 10:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4243E42DC2;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B085C2BCC7;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=Q/1J667b6JukHamYOF9bAnOtePDVGZhfSHJBpMaACFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=usg5Lj2kfs/N/Yj4cByAT0HcRxuVlorJrmluiBvNYI9NxJHVGH9La3rrjlPCiTTqp
	 9l7UYO/5AIm09Ch6fqkSmWNptMcwOC2q1OAUP18Jm9dWjPxlFG+jIZ6hkvX/DI1ciK
	 HiZnEEbYL7tMl4mAWDSBtXW/PKmrjcU42wQha2UrLk6goAnvZUEXsUoXFiRs2CkEWz
	 nfVxe3xzSSzN9H/hcYxyeAuM1rU2h7xKrkVehzOscBS9tdUFXzDw/iOevdrxT8E0Cl
	 2Uac8JO7qKlFCF0kMnR2wbvdUMPKWy2j8xGdJ1KG9Wd27a1HzoFcjgWQyTSbp2Op0y
	 qEMB3+KXK2uMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C808CD4F35;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:53 +0200
Subject: [PATCH v2 1/3] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-1-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=S8vmDbpcy+8DmhnO1mnKiM+pacEbgZmrZKQgB8iqYaE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGOv0hgNf+i5bybt/Lf/w65llG6PB+79sFQ1+mYf+H
 +pzidzVUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExE+TXD/7hMxv/3bOuyBGZ1
 61yMOs1/tiVW++Ppm9o8HKJVuTs7mBgZ+mdHJt0QFL5ekjx57g4dlQexbvqpK0/vuFwx5e0k+wZ
 7BgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_114430_338108_C84C3977 
X-CRM114-Status: UNSURE (   9.73  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The pwm_ao_c pin node was incomplete: it was missing the group name
suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
into a single, ambiguous entry.

Split the node into two separate pinmux entries:
  - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
  - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"

Both alternate pins are not yet referenced by any peripheral node,
so this has no functional impact on existing boards. No backport needed.

Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..62f6b9baad28b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -400,9 +400,17 @@ mux {
 					};
 				};
 
-				pwm_ao_c_pins: pwm-ao-c {
+				pwm_ao_c_d_pins: pwm-ao-c-d {
 					mux {
-						groups = "pwm_ao_c";
+						groups = "pwm_ao_c_d";
+						function = "pwm_ao_c";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_e_pins: pwm-ao-c-e {
+					mux {
+						groups = "pwm_ao_c_e";
 						function = "pwm_ao_c";
 						bias-disable;
 					};

-- 
2.49.0



