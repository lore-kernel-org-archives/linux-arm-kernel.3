Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B82D0E6FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4eAZTScwC+6lJBf9RiPz1znmecANmRgLXeWKmn5sxTQ=; b=ancABbrhxDqbwY
	Ca3SZPqVfsLF8Mc5PwM7o/98XJWuRPxX175iOflWKu/62P8oEln7rz2XTjGGBo8lKYBGG46LaPRwV
	Qcd14QKfatGWSgD1jzp54F+UpQpyWD/4FPfsxrSLtxzfU2ulAzAKc1Y1R2tcCr3k9P+rI+84FxFaq
	kTlYtGal/n5Iu6zVC1rmOF5iVuwaSnBEkHGcEoj3eg82Esq0LvQtAfS0y9OxtzmMjjJI5HDhX+O9n
	1pS+D6lkdWrDFLq9yUxNsBRah/F3z3h4EKjWMoJCK99PJ1tlvigGQiTJgO0fzc+Hd4EkM8Lt2IRvH
	cNg04f8z8A1JyWQc06Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNujI-0000000DUKQ-1un3;
	Tue, 25 Nov 2025 15:13:20 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuj9-0000000DUHi-1NsG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 15:13:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dG5m31DRLz9twg;
	Tue, 25 Nov 2025 16:12:51 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH v2 0/3] Add support for exynos5250-manta (Google Nexus 10)
Date: Tue, 25 Nov 2025 16:12:39 +0100
Message-Id: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGfHJWkC/x3MQQqAIBBA0avIrBNUErGrRAvJyQZKQyMC8e5Jy
 7f4v0LBTFhgYhUyPlQoxQ41MFh3FwNy8t2ghNJSKs1DSuFAfrp4O26sHjVKY70U0JMr40bvv5u
 X1j5BFZOcXgAAAA==
X-Change-ID: 20251125-google-manta-79545e179d10
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4dG5m31DRLz9twg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_071311_521273_8C5E836C 
X-CRM114-Status: GOOD (  15.65  )
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

This patch series adds initial support for the google-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The notification led driver (as3668) is already 
(tho not applied) in the kernel mailing list and can be found here:
https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART and with WiFi support. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Alexandre Marquet (3):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)
      ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 516 +++++++++++++++++++++
 arch/arm/mach-exynos/firmware.c                    |   4 +-
 4 files changed, 520 insertions(+), 2 deletions(-)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251125-google-manta-79545e179d10

Best regards,
-- 
Lukas Timmermann <linux@timmermann.space>


