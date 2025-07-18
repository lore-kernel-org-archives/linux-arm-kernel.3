Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D5FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDO1CgxSdugL6J3cyk/JcvAqVTcJT4cFkWZUoNx9F8k=; b=ItfZXvWfKZzmR+TLGhxDCSL0Fz
	K4RSNX3/T/W5VoubPZlUw+yh1hnZdz+x2pLPooT6Ufv/r/Z9HSxTw4dBp5Xp4WZOVRtUgaRltCJWQ
	QKXuBqp+WSVMDTgGRukQbKAxMfB80nGcOUqBdAoiXPlOEmQq28U9Zjyv5V9s8OSnSaxzuiOYtWhLv
	ClZbwosnesgEmAk6Roe7p9XeHWAQB48cUZ9Iiu0ofMHMw3xGZwz3ji6gLjMvxogEaKvxpILXQ4div
	KLoVNWGxPB2Sd172LoD2Qj83mxFQC71V3le+KpFuY5/10f0YLQh26qrMM7d0031YxJflhdLY6xa7F
	JceAcqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucf2i-0000000Bp0u-1gAh;
	Fri, 18 Jul 2025 06:58:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucej1-0000000Bmm2-3bP4;
	Fri, 18 Jul 2025 06:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA4FB601D3;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FD88C4CEED;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752820662;
	bh=zVwBnOBXZNVDZp8+mClSq+Wz1HDJCHk36NiLbL59xXk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lvTaAumk/nbUCgo8+99L2zAVLaLAVrz7VlKpLaZ4d5UKZmTjnS6SJXT5CKayQYOH4
	 6/pzcEqkCsiAFYMVc3pG2gbJabuJo1lJDWAnKblEqpUe2aesVrXCTFnaRwMotRyAh3
	 CVCsuRExjW1TYB216KWqdeEARpTLSiW577533WfeJtcjLTh/BfSErudIddBvNIORZb
	 L2mX5kXPeVKoDYCwWLkfrhMnx0i9oPVUtz3XkciOlduQZvCusMSOOUwQVAW4zQVMqB
	 ggxbRt81g9WWGeOm1jJXNz5zY/MhGXIjDXTWt6mdoZIhpd0NsJdl/H2I6R6lvIER4E
	 vBsKzSz/gNSVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A45FC83F34;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] thermal: Support Amlogic C3 thermal
Date: Fri, 18 Jul 2025 14:37:40 +0800
Message-Id: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTreWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3WRj3ZKM1KLcxBzd5LSUNINEo6SkNFMjJaCGgqLUtMwKsGHRsbW
 1AKyiQAxcAAAA
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752820661; l=796;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=zVwBnOBXZNVDZp8+mClSq+Wz1HDJCHk36NiLbL59xXk=;
 b=f2ZEHyZc0eY/iGCAhjC75mGOUf1dT5uPNYGLrZJlrqSW9d8wpn88WbDDKbX/o+Nu9e6sLvQQq
 mK90zlJfD/0CV/AGldhcGn9ZEozYGCwKlNAZwk2Ni0u2D/3Q0hccY20
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
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

Add Amlogic C3 thermal compatible string, private_data
of driver and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: thermal: amlogic: Add compatible string for C3
      thermal: amlogic: Support C3 thermal controller driver
      arm64: dts: amlogic: c3: Add tempsensor controller node

 .../devicetree/bindings/thermal/amlogic,thermal.yaml          |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi                   | 11 +++++++++++
 drivers/thermal/amlogic_thermal.c                             | 10 ++++++++++
 3 files changed, 22 insertions(+)
---
base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
change-id: 20250718-c3-thermal-cfdf0a2bbf52

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



