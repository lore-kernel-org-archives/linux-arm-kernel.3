Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75F6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5K0Uea6c3E2tAnj7WSrhjcKm898kwXK7VLZvRg+7P4=; b=aXkjPA9Ev5xfWITFzXG+edftsp
	yS34b56ot4tHYm0o+HAxPolNgaCiyJfQ9Kqagv3l2Rr2wk6cNLO6X4lFTyvefzK7sxqrWvQBsiihS
	HI+RHcvy/MwN6qdh1+i/R7/rkLjz+5hPxMoI7AUl0h5n2O6NXNFazrJVmlwKwgR3Srcn/AEzNNavi
	4WvjXd3Ci2WX/DW9oBfcI1D8XuwH8MQJBU3OU3qNYyto323ATTAy/2cQH1+533ZgRTnifOJalonPn
	mlPK6XcHCZ/Cw09JUfuWpSxmWz1sY0aUIT+AsdlYI7bz3CAeK2MCZoGmF4AFAIC8B3jnCb0M22Ysd
	jGjT5iQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGYA-0000000DyXT-0Fnz;
	Wed, 11 Dec 2024 06:50:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGW4-0000000Dy4b-3I8n;
	Wed, 11 Dec 2024 06:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F02EAA407E2;
	Wed, 11 Dec 2024 06:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C46DEC4CED2;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733899688;
	bh=OXcuGUST6PRMVKw++DvXhy9nNIvoCMMSwx2WhM7mMpE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N/0q+uk4pcblU+kTaaEjyJHlXZoWqczJyXf6kd0KyqJeZWja5iW/ZFcCsfCX61h93
	 p3bx2wZac38j/yWcivf/sdKyLKHzm9kGiO6LqIu6y86Hp89hRBV8H8NPIlljRSn/Nj
	 KApbLe1O0cBhAVsaUmb3oDUPKNhZQTPO+UfAPeG9sGxLGGDWlCrz3vak5gglj0qSn/
	 Vtti01Oz5Pw2cq8vZgYRwDx1Zf9KjsSO/kXmQU8mx5SMzVbCqwJuKP8aMKIvKNFHLp
	 aDg9eJK3jbRBuBZf1VSI/rlQL41TXbinZ1qnVf54BiZpFfKv486M1B2QURiv+w90j3
	 03FkEpnuyWRBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF3E77180;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/3] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 11 Dec 2024 14:47:48 +0800
Message-Id: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ1WWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3cTcnPz0zGTdgsy85JKiHF0jo9REM0MLI4MUgxQloK6CotS0zAq
 widFKQW7OSrG1tQCTIDtuZgAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733899686; l=1432;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OXcuGUST6PRMVKw++DvXhy9nNIvoCMMSwx2WhM7mMpE=;
 b=FCAXcPi+2/pdauQ4NMuHxESiRUOmogABmpyrp0hwKtO3ielhPDS+1E/wKrJ4TTlFKTKZDGwDt
 um+UAOvzQjIDnQFdm51p4MCGAvMyKCjf+u4yv8ye9qDZAgNmUxQiOuK
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_224812_958788_982F9D11 
X-CRM114-Status: UNSURE (   9.91  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add pinctrl driver support for Amloigc SoCs

Base on the previous discussion,
https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
The existed meson driver failed to meet the requirement of the current dt-binding.
So we start this new pinctrl driver to solve problem.

The advantage of this version: Once the source file and binding document
are added, adding dts node will be only operation for subsequent Amlogic SoCs
(such as A4, A5).

The code in DTS file is also readable when using GPIO, as below:
reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic SoCs
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl.yaml          |  150 +++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  146 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1190 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   68 ++
 6 files changed, 1573 insertions(+)
---
base-commit: 171aa289a6fe65faffeb92a1fda283c055435a62
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



