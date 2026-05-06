Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB119CD3443
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BrySV1GGDNC+xsZXBQb7ZXd9wQjZLt31E8wC0iR2C68=; b=FfyDU+3IxFeOUi
	QnXt62G4jVQT5ID99dhacWhYqypAO0m69Pw9Qlc0hhgHETLaX0uIhwjneyxmoxz8XXhWr3dpsfmJW
	pmA8uuW7VcBnUCP2WaUgpzPLqHA/093qp1L8bPCMXpCKLJAlrJJlpW/5yYxG9+x9nUUSHgzTQyn5f
	CILzoigzhz9VU79rVNfXjHfmCSilXn+mQ0K80FFQ1WqcEES7e48uXltEiE5qro2SHT47SpU+dn5cm
	EzDFlhVidY/Zkv48XVTt1IgZbqFcPPwnuQ3lZDu1gUnh5TeUqSi7EOp0/t2vx2deSrcL8DnboPbOC
	qQLNCGTNQfbGzujXWZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdtq-00000001FqL-2ZuH;
	Wed, 06 May 2026 15:10:58 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdto-00000001FnO-09B8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BrySV1GGDNC+xsZXBQb7ZXd9wQjZLt31E8wC0iR2C68=; b=UsSieEfLSXnMNIrkartExrEioU
	TR4r407Du+/cr370xNbt2a6XAYbpdgVPD0ZRAGd7MG7UOeoqJSF5jXFSSihUylVTR28wovjexzYjr
	a0PZyGUOcgxFP7NFvJYRSJY1E16R7H2VfC5IhF4yAeNdxcOYgoZQXcpz9Mhh6Rwnaq2G/Kr6wznU4
	aPRCCZVixV238llpesDyPY/pAMzgu60rOR2TRNG/6JphCEMGjgMcYPjPRJoLsmCl5qDxtfYkaVtyY
	mBm9MlIkoXUKBb8YCw3POWei2vzxagzfUOU0TGRh4Wf/HH8wnPo5Mvd/Opleb5rJ6PkWSQimN+mQg
	Q39vRbPg==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdth-00000003arQ-2Y1c;
	Wed, 06 May 2026 17:10:49 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v4 0/4] Add hstimer support for H616 and T113-S3
Date: Wed, 06 May 2026 17:10:25 +0200
Message-Id: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFZ+2kC/23NTQqDMBCG4auUrJuSSWI0XfUepQsbxxqoP2QkV
 MS7NwoFKS7fD+aZmREGj8Sup5kFjJ5836XQ5xNzTdm9kPsqNZNCGqFB8caA4SOAIt7Q6FsM3Ei
 rrNVFbcGxdDgErP1nQ++P1I2nsQ/T9iPCuv44e8RF4IJDWecan1jnLru17UATjdjSZXizlYxyx
 0hzyMjEoMnQVk44W5VHjNozxSGjEpOjkJAXpVWI/8yyLF8rshT2RgEAAA==
X-Change-ID: 20260413-h616-t113s-hstimer-62939948f91c
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=2438;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=uNe4YHbNe0yih5EqSi5yN6HvLD9qpae4iOn6P3ifclQ=;
 b=oQ1AG4MBxvQI5uCw4WRR1azxML7awKTWm3YtQDaBEAp1UCxgGNtUzOfAlOfrIeAC8Qlm4J0V+
 Nt/nzg2+a+wCihKeIKPmcnlcPQyUOpEICSVTteT2/jlvVF9acT7JRnE
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081056_426355_DFD437B7 
X-CRM114-Status: GOOD (  11.22  )
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

Add support for Allwinner D1 high speed timer in sun5i hstimer driver
and describe corresponding nodes in dts for H616 and T113-S3 SoC's.

D1 and H616 uses same model as existing driver except register shift
compared to older variants. 

Added register layout abstraction in the driver, extended the binding
with new compatibles and wired up dts nodes for T113-S3 and H616 which
uses D1 as fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v4:
- Move T113 related dts change to d1s-t113 for D1 to benefit too.
- Link to v3: https://patch.msgid.link/20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl

Changes in v3:
- Removed left over dead code from v1
- Link to v2: https://lore.kernel.org/r/20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl

Changes in v2:
- Change driver handling of different offsets to using quirks
- Change from t113s to d1 as the fallback compatible string
- Fix conditional compatible matching
- Link to v1: https://lore.kernel.org/r/20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Andre Przywara <andre.przywara@arm.com>

---
Michal Piekos (4):
      dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and D1
      clocksource/drivers/sun5i: add D1 hstimer support
      arm: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  9 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 10 +++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  9 +++
 drivers/clocksource/timer-sun5i.c                  | 84 +++++++++++++++++-----
 4 files changed, 92 insertions(+), 20 deletions(-)
---
base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


