Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C145109E556
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhj/BVnMTEot76NCyLwbo+UAcpfi1NQHThm7D+eW4Og=; b=kNMJUpRySE3h44dUz+bBG+1x4p
	Ix12vQbQTlJkRyNrKHH9eAfEiMlQyGCZZKlT87xiHGaai1IEV1gP9673wuFLvsn+WTZVydH1RN7sf
	Ihs4NrUcNG6Ex+vX2FOJc2oTDzUTk4Yd24vIp8Vyr1i0zwd9rMmo6fmB5C5LbbZ0DnMIAkSp+VfHX
	Qzn7Jp1G8Lvqct/M70Hq5HRArnSwPP6mXVoW3zHJWkpX2sWbagbJY2u+NMz5GvH1JGFTU6wf7y37j
	h3U6NcuF88+dx2O5uKpkAquhLG1cS7uXX9BNEc7QRdGsNAii7FsWpPc+WAiHX9YlhV3PS+foN3M4E
	PKQZczFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJq-00000004qkQ-3PIm;
	Thu, 26 Mar 2026 06:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJo-00000004qjn-1UM1;
	Thu, 26 Mar 2026 06:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67FC260121;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14574C19423;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774506947;
	bh=mXw+OnzMTg/llL26Q+CuSnTiRZOcs0RZPrPP1Kk4svA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Tlvjf7JdSHXxQLDgiwkI+gx3cEMeCILMoLYre+Qn8k9YrVAmMNzlSxpI2vdxFUP4I
	 EeywSuAodFlNYpFHiPHz1SDY54LoH5NNISksD+p6nIdCFWiP7ReMBzmps894gCYjW4
	 2vL0l0Ih1fvtyEe7umkH8xc9tvXXk4PZJqbuBNWFhrJvWtDxBs9pjhfwQPM1Xq/4ek
	 3mcK0pn3i/QXUCc6moj0KTwmUPg8P887nDAmSajZKcx19G94emUHhHcL/DLy9sX7vw
	 jPBPjdQLQw8d00wX3m+4hRtuDMGzFlMXhbLflMlLWZ8dzsPikGu0VX+zQQLFbjEoDm
	 7SZgdtB7YxxyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08122109E556;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
Date: Thu, 26 Mar 2026 06:35:37 +0000
Message-Id: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnTxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3WIz3WJz3YLyXF0jC0MzU4skCwtzYzMloPqCotS0zAqwWdGxtbU
 A5IPHXVsAAAA=
X-Change-ID: 20260325-s6-s7-pwm-281658b88736
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774506945; l=648;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=mXw+OnzMTg/llL26Q+CuSnTiRZOcs0RZPrPP1Kk4svA=;
 b=OKuOvNZb4cwcyMGkRCZPv7Lo3XaP6ugCt+rAwxMUC/RBELX+R+vk05Ud6A/aa/KMmrd7brkrb
 15QAhUmz6DYDQdl0VlL1R4Ir0jw8UGCNuyqUtL27raJ6dhJ2p/+1wE0
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add bindings and driver support Amlogic S7/S7D/S6 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Junyi Zhao (1):
      dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D

Xianwei Zhao (1):
      pwm: meson: Add support for Amlogic S7

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 27 ++++++++++++++++++
 drivers/pwm/pwm-meson.c                            | 32 ++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)
---
base-commit: 8ab1fc9104158045f68fde2d0ae16f5fbcf8bfbd
change-id: 20260325-s6-s7-pwm-281658b88736

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



