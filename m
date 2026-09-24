Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLXIrKD6y3c9I6Bcp7q5JFIUGySF+z0mTj8IUWyBduU=; b=nVi3BnbZdIOJ2rEN30ttPrTAjH
	EMJNFzq3lVrmzGYAmqSU02QhxBNp2gWxko9WP2/L6FIvy0VPxXI45EJX2JqZ+5IL9ZHxk6zs4V1uk
	j/PpLfsGKcJlsFFWlX9LdHs9tj6Y565Y4TJtJkeNhuFbi2gzm7P1EjymKEC1GPp2iLJoVw3q2grkq
	6UM36/Z8FVl9qJ/sIe7OOzwa/iIunjhdU6pxhgFGF/DTWyWSKX7G7BFTO1i2JSKwHXSzsekfWVKoZ
	uoREkkmzTIgcFVvAJtLiVw1KhdJYxwcDV9GBKolunb91py9YxfI2fSQ9pPsl17J8mlB0zMPQqHW7/
	PVpzXKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAI-0000000BM2p-1Wry;
	Thu, 24 Sep 2026 15:15:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAH-0000000BM1p-1nKV;
	Thu, 24 Sep 2026 15:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA2A140844;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D269C2BCB3;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790262912;
	bh=/Xr6Vonrl8KSO7NkZYS+4LuXBsR+pRx2JEkY9vxDmtQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U3wwbQvi5AFzyxA4B06J5JsixLbXKaWdSed3f05RSTIBWwTxiheue3U5QuQGQ2CJ6
	 RLKTTCgd59x/qDgFJwa8clt7nwSjD8dx4DGlkE69JY26BWJVII+IsD4ppm72YXOAYz
	 MLO3qnYXM0HrkFy0BgQvRfyPMowNh+kbThk6SwQNkDvoFnPlJHXwI8ByENWDhrd6ao
	 eVBJIBstbhJXZc8QW28RaRpq5EcRvALNJDMzhMiv3mQ0mKn7jhIpSpD1Jz6xUg5Rsd
	 2Jxn39UUZQwOJ8hyI3P79TsEEwg4JxU8tXGFRxhWJvktMTKor1J5CwC7MKFRvUS8xw
	 yg/d91Fytg1mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D5DC98318;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 0/3] Add T7 PWM core clock support
Date: Thu, 24 Sep 2026 17:14:27 +0200
Message-Id: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gbaIk5XERdqUw2ONOKAeHeLy
 7f4/wEhzyRQRg94Olh4XQJ0HEE3NEtPyDYYjDKpKkyCjbW4Zyi34HbO2E0jOkXO5bolMhpCuHl
 yfP3Tqn7fD3qqaZlkAAAA
X-Change-ID: 20260924-add-t7-sys-pwm-clk-f0eff81bee21
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=/Xr6Vonrl8KSO7NkZYS+4LuXBsR+pRx2JEkY9vxDmtQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZWu/Lohq/icVfPylbtOzRvz7nEya2av36tld9SPduif
 dZR7/4HHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEOo0Y/hfIBllYapSx6uxZ
 JmUx3+bj/kctv2d93eP4v226gpLDns8MfwVDfi86aPRj6kmPOa48m+sZK/dNbwt/t3WTyRdfacO
 LunwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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

The PWM controllers on the Amlogic T7 SoC have a system clock that
controls access to the controller, in addition to the two input
clocks of channels A and B.

It is currently not described in the device tree, so it is neither
referenced nor enabled by the driver.

This series adds support for it:

  - patch 1 extends the binding with a third "core" clock for
    amlogic,t7-pwm, and makes clocks/clock-names required for it;
  - patch 2 makes the driver get and enable the optional "core"
    clock, leaving other SoCs unaffected;
  - patch 3 describes the system clock (CLKID_SYS_PWM_*) in the T7
    device tree for all the PWM controllers.

`dt_binding_check DT_SCHEMA_FILES=pwm-amlogic.yaml` test is ok

  CHKDT   ./Documentation/devicetree/bindings
warning: python package 'yamllint' not installed, skipping
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dts
  DTC [C] Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (3):
      dt-bindings: pwm: amlogic: Add core clock for T7
      pwm: meson: Add optional core clock for S4 PWM
      arm64: dts: amlogic: t7: Add core clock to PWM controller nodes

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 37 +++++++++++++++++++---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 28 ++++++++++++----
 drivers/pwm/pwm-meson.c                            |  5 +++
 3 files changed, 59 insertions(+), 11 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260924-add-t7-sys-pwm-clk-f0eff81bee21

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



