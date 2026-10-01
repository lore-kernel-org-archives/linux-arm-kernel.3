Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC312CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGVSQkKpyWTlQ5aVmY2LM0nPg2PYLGlRESconUSScSE=; b=tcnV507rjB6VpZJcfVh62NG2q3
	F7PrvuHOQi7/f47kRfOaEJmpaGzisVQcrUWeTmTG1BSHysX6zIjiBcua2AL92ceZV7sLXQft6aYom
	C0EmbJ9+CtWbxR9WqHZniQec+kD53OwICmLNHt5XRIhzBdxoKpYqqb3Qiu8sXJYK4TS76jwN9CB4D
	6Zl7FzONjBj7encJYIEagp7zzTP3z7s9rR+H6p/Cc5muWevor4vi8lgSH+oOixMOrB+l8qYF6DAn9
	73MMU8UeIYqgvL0t8Mp1LsXxOLra0O4EfZu7WxYFGVgj/gIhFYyVLMloGhCH3RkwKHLSwRfTYstSZ
	7OS2ZDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK58-00000009mpI-0DqT;
	Thu, 01 Oct 2026 16:56:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK56-00000009moO-41Vj;
	Thu, 01 Oct 2026 16:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828A6400E2;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55F44C2BCC7;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790873788;
	bh=Qhlmnh7TTzmDpcwvp6sVGwm1GjJ82rU6aJJPJibnEHY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EDvCL5RMZaptDEQ2Ofg7LQlMd+oJJPA8MlyZS8K4+bcSRB4At3Ub9JoFi/tgzGZj6
	 RwsbJb439+0wCAmsDTEdi+M/bzrD6XI5RbiaXNK2kZQAiKvnSdCJubLR37jMkjYxVn
	 vCpHjgiHqh3UvvqPgTVWtqgjM46tOk7byUDYJy6zbF2qPjUWKZZkOXPg6KMrtm6UAg
	 pwhiqw0r8XJN2p4DqEfS2VX0wyMKzmqt9edVnulZ/qK1xuQxb5rdc4yPhmOdCgUy9I
	 dZ+4fIKOX/HRufYJ/4Nncs/i5GievMsDfXyC09DM4lnnr5n74fSymi16leUFisHkPu
	 CILFqg/4NYbog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAE4CA5FD2;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v4 0/3] Add T7 PWM bus clock support
Date: Thu, 01 Oct 2026 18:55:33 +0200
Message-Id: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auQrh3TDv+uvIdx0dKpNCKQlqCEc
 HcLK2KIy/dL5pmZeXKWPLtEM3M0Wm+7NkRyilhVy/ZBYHVohhwzXmICUmsYcvCTh/79gqp5guF
 kTCEUEQoWDntHxn429HYPXVs/dG7afoxiXf9yowAOPFWloCI3XJZX2VhqzsaxVRtxL6SHAgbBY
 CwRVS5kWv0I8V7ID4U4CKLQWSYVyUSLnbAsyxcN9lSUNwEAAA==
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
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Qhlmnh7TTzmDpcwvp6sVGwm1GjJ82rU6aJJPJibnEHY=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a+CSsP/WkQV/1QYFyU4Fh1meX57AbjkAfS9f/lIyvVc
 kpW2At3lLAwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABNZYMrw3fXSnLn/Z9bwmVzJ
 XFWlufjxY/nUbv3tGydKiG+e9E2xjOF/yNQYZyaPKkmljq0TZjecWlCjtsHU0OJU7OS5vOqiJbO
 YAQ==
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

The PWM controllers on the Amlogic S4 SoC have a system clock that
controls access to the controller, in addition to the two input
clocks of channels A and B. The A1,C3,T7 which fallback to S4 have
this third clock too.

It is currently not described in the device tree, so it is neither
referenced nor enabled by the driver.

This series adds support for it:

  - patch 1 extends the binding with a third "bus" clock for
    amlogic,meson-s4-pwm, and makes clock-names required for it;
  - patch 2 makes the driver get and enable the optional "bus"
    clock, leaving existing DTS' unaffected;
  - patch 3 describes the system clock in the A1-C3-S4-T7
    device tree for all the PWM controllers.

`dt_binding_check DT_SCHEMA_FILES=pwm-amlogic.yaml` test is ok

  CHKDT   ./Documentation/devicetree/bindings
warning: python package 'yamllint' not installed, skipping
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dts
  DTC [C] Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v4:
- PATCH 1-2-3: Replace clock name "core" to "bus". Thanks to Chuan's feedback.
- PATCH 1: Remove unnecessary duplicated example. Thanks to Conor's feedback.
- Link to v3: https://lore.kernel.org/r/20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr

Changes in v3:
- PATCH 1: Require the third clock for S4 and all SoC which fallback to it.
- PATCH 3: Add the third clock to A1, C3 and S4.
- Link to v2: https://lore.kernel.org/r/20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr

Changes in v2:
- PATCH 1: Permits to use "core" clock on S4 SoC and all the ones that fallback to it.
           Rename "clk_a" and "clk_b" to "channel-a" and "channel-b". Thx to Conor's feedback.
- PATCH 3: Rename channel clock-names as done on patch 1.
- Link to v1: https://lore.kernel.org/r/20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr

---
Ronald Claveau (3):
      dt-bindings: pwm: amlogic: Add bus clock for S4 like
      pwm: meson: Add optional bus clock for S4 PWM
      arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to PWM controller nodes

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 13 +++++++---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 28 ++++++++++++++++------
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 28 ++++++++++++++++------
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 12 +++++++---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 20 ++++++++++++----
 drivers/pwm/pwm-meson.c                            |  5 ++++
 6 files changed, 81 insertions(+), 25 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260924-add-t7-sys-pwm-clk-f0eff81bee21

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



