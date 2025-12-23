Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF30E6ADF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hXIHxEVF0H/FhslkJFNPZhGrEPxmEweJW4ZCZPz4oC4=; b=t+hpdMZOyzpneDgU70vvaPaG2T
	vVnJp98PwQzvAJ6ikqJoqt2mNKvz+6/k2PRi+BxmLQrfcAZfA8tYUX1qL69gER18IX+o3LgnfWx0z
	o30n5/lRnsGsp1lv0oDxp6Z5j0Y/6JUXaCE/N43pJrosWAroLHoXX9kJWJLw4ROlEBqoOjqbkahok
	R8n98zlZiR6okvISLXhHkjYo4KnuhzMF1XiuzjFlqy5zUResj/bhzs1xvWmL6fZBvuIW+eJqbwA76
	2A3wjc6XZXOV67bCGhjuTt82WXg8bZ4vCcPq5qgWgOcQ9vmzuYqZWFt3rITuKNT/Llar3DuVvGT9S
	Ui32aKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv5J-0000000EY3q-30aj;
	Tue, 23 Dec 2025 05:37:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv57-0000000EXwv-2f71;
	Tue, 23 Dec 2025 05:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6369743EB3;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3983CC113D0;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766468232;
	bh=TopfHx7R+NfEkqLUaU8SHkHIJkgRVh3DScg2mMFNmUQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jtRofPr/o77CVBDdy5aERhsUgKJ2y1pWywJ4tqYyHh6q0WsJywGUWqOtN2uJ/yLWm
	 4kOjZWR4hz90U+S1IBMzrS2L8PWVjjmg2oK/ZsFRETLaMupa0p1wWLIJvnGf1kL+Zw
	 yGEiLFGImGKFDwIO7gYQFjVON8cPFMHorIxIJCtwz4Hbh6YcZl2kGUBouIXKu2yqXS
	 xbtSuqO3cWUeFpMI80VmhuGnPutXOo68TIx9LMIMrZoCF3vB2A4PlXYArkC3JhUhl6
	 PgFoRtPaHEJTohkxxSfk2J72Rld8lTtZtL6kF7GPR5qwBhCaFR7hpmkvq46y/kLKgN
	 qHohts3Ekw90w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CF1E6ADF9;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/4] Add support for Amlogic S6/S7/S7D Reset
Date: Tue, 23 Dec 2025 05:37:08 +0000
Message-Id: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQqSmkC/2WNwQrCMBBEf6Xs2ZUkUtN48j+kh9hs2wXbSLYUp
 eTfjQVPwlzewLzZQCgxCVyqDRKtLBznAuZQQTf6eSDkUBiMMrXWpsZEQgvKGcWWBDRa9842JvT
 +DmX1TNTzazfe2sIjyxLTez9Y9bf9ueyfa9WosLFOOeeDU+F09dMjDtwduzhBm3P+APAZsOewA
 AAA
X-Change-ID: 20251125-reset-s6-s7-s7d-211f9782dfab
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766468230; l=1263;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=TopfHx7R+NfEkqLUaU8SHkHIJkgRVh3DScg2mMFNmUQ=;
 b=WI3MBDEAUmJoam63ErKvMPGdx1iWdVinT1IT/wRrj443CU3LFtAcSvfZ8WO4itFicCvXRq2JY
 8FGgbqNHf7bCUg+CgnCe8qSHD22kEnBZ7Xp4LEgNhIRZuR6VLL+NiD1
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213713_767109_9EB45091 
X-CRM114-Status: UNSURE (   7.45  )
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

Add dt-binding compatibles and device nodes for Amlogic S6/S7/S7D reset.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Fix some macro definition names, MAIL to MALI, PIPEL to PIPE, PIPL to PIPE.
- Link to v1: https://lore.kernel.org/r/20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com

---
Xianwei Zhao (4):
      dt-bindings: reset: Add compatible for Amlogic S6/S7/S7D
      arm64: dts: amlogic: Add S6 Reset Controller
      arm64: dts: amlogic: Add S7 Reset Controller
      arm64: dts: amlogic: Add S7D Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        |   3 +
 arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h     | 171 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   8 +
 arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h     | 124 +++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   8 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h    | 134 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   8 +
 7 files changed, 456 insertions(+)
---
base-commit: 79482f3791c4760b9b0d8d9bfde9f1053ea3dd5e
change-id: 20251125-reset-s6-s7-s7d-211f9782dfab

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



