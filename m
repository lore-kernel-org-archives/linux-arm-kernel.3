Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A0CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3m95FLOdnIwWW2VdGizwnn9n6dFSbRiMAz/R5GqdLhY=; b=BQKHiLwHSduf/pZWUqyySznLgo
	yGnsFlie/qiSneIm1jI9Wemdl3SGFZCsGcTVqJjByNQ3Nz0HU3ZTTdajHA+p4VwfvinjuTMjHT0EW
	Yzcnw+v4kH/MIDagLvAcvXDZNPAOlGH4YT8NUinpR68BAI0rn6WzH3P8RBjxkgyctulyuvObB7o/q
	WjOQL34hjf+PMHQhaSrAiLJ/J93s88IK8wBA4Pqy9SaEa2BcPGy+JBX+Ckftil6Y+yrdaAVMSWknY
	/z0ivSJk1nxLd4HUcxMgn6mkutSuAiPQvQ46GcW9RR+gVvFXNgur268m/Ey+vD5xi2DuvlQk/8/Xu
	nFAbgBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFP-00000008uTU-1vPL;
	Thu, 11 Jun 2026 07:54:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFO-00000008uSq-1gmo;
	Thu, 11 Jun 2026 07:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6A1760098;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CC04C2BCB0;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=1uthSd7P8y9Oi8VLveA0Sb1tQ9DUs9/arzzCInD1jhE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JxDtzTp7spFH1L1fbgGppE1oNse4pekP+J3kEts9FlBFMe0dH6gpcJOQxXE7skh+A
	 PIStedid0q/NaW7ZRuXAROVOVTEc4PLvpApnjMfTTcbzbmWzQJLFL90YpxZa1NC4iU
	 /Mga0CKQzMKjftpHjscG9pZ23n9oIrAOFZsUljICuU89f5S9WSmLFey/HXXZsqwFWz
	 iY7jnZ/gm9LkEmT+aAln1RAGD1mIaENYZPGGjuvTb2pxTttTLp9mtB48JnvhqhUU+3
	 5yQ4JBXe5nmhLTREQsGDGStPfhe+TmiRnoQBXXRcXMNM3AWL6NlnHXgeJemPJqE4eJ
	 PIHgk1kSqJuQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34444CD98D2;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Date: Thu, 11 Jun 2026 07:54:32 +0000
Message-Id: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhpKmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3fSCzHzdknzdzKJC3aRUE3NL8xSjRCPjNCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AGyHvH9iAAAA
X-Change-ID: 20260520-gpio-to-irq-be4797d2a23f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=854;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=1uthSd7P8y9Oi8VLveA0Sb1tQ9DUs9/arzzCInD1jhE=;
 b=O2aJsO0189X2Plisl9JKDVw2g1wop4vl4VFW7vG/5bm5/wT28vxWm+u1n5eBG3/Auq/FeOjBW
 +w8IlUp0RAuCLvt5u4/zoQm689DXFrd+NhcCLNEm11fxJAq2bfhM/yg
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

Some users need to obtain an IRQ directly from a GPIO descriptor through gpiod_to_irq().
Add the required DT binding and implementation to support this use case.
Since this introduces a new DT property, the property is kept optional to
maintain compatibility with existing SoCs and DTS files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio irq property
      pinctrl: meson: amlogic-a4: support gpiod_to_irq

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  5 ++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 54 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
---
base-commit: 4ca496f6285e16d91751e5c84c6010e03285528c
change-id: 20260520-gpio-to-irq-be4797d2a23f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



