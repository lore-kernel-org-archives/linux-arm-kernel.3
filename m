Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFE3EA719A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CKOtsXDJcG0jDyOs/E1laUSgylmDBg7JVi69SXGBKH0=; b=eZFkPrsJrwPH1J
	JHZHS4hrsWWDKd46fpZxUYbzYt7wPNlfK+gQynVt92FhJ2bIEa1MF7kdjhu6mfKrynhRV4BR8iewb
	3QW36Gl+FX9JCXgmJKcV+UjIzm+MOoltXN7OjLjRbY9ZrTxa68MhuQxrX4qZiYh2Au3vQyV/lV4P3
	sP20Hx+h4+g54hxI53LSLlF4KQ1wJRSQFSh+h7M7dpg3ZshssI0GC3qHiAOgrTBhtDn22B2vULOXF
	khP3ZyY8nLbQTwqMz0I5IVZH2O8LGA1V7PDzfZzpzW/QSNlcN0yeIARlUAMeklApPQMQM/kaSYYCu
	RShElF5L5a5V4H5nvRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYc-00000005n1g-3wkv;
	Sun, 19 Apr 2026 12:47:26 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYW-00000005n03-3bcV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 12:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CKOtsXDJcG0jDyOs/E1laUSgylmDBg7JVi69SXGBKH0=; b=alQhAJP7tyqN5X1VDvX2dghx0W
	y4sLfD6xuynMppx31aUOAh9CREt/zRHnaKGUmixMvZJUZmjmNOH/osTRoUCFpK42/cuy6t9ktxuBi
	qBR9vUQHAG0RgZO42koXO1zGPJDviDWD3iyli6jgcdTZgDtKys3RevFB7eqHEn1qA5FffOBEFWztq
	pIf4etKKee5W4AgkZ6/2r+c/boYWZWlCt8GgQInk5PkQRNnm+PfSPV5kgeP6bdmwMC0ndSVxnsTm0
	fW3cvWmVq0eZV5FoLNE/beSpQJr6WVD1WxhJk0mVBbjoyd3Xr7/4idJCjMpk1GL92yPhiwgGEw7++
	Z0ofq9Fg==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYT-0000000Fbcq-0WDP;
	Sun, 19 Apr 2026 14:47:17 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Date: Sun, 19 Apr 2026 14:46:06 +0200
Message-Id: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7O5GkC/x3MPQqAMAxA4atIZgOmlWK9ijiIpjaDPzQiQvHuF
 sdveC+DchJW6KsMiW9ROfYCqiuY47SvjLIUg2mMa1qyGB05vIisYtRLNk7ojLfet13wNEMJz8R
 Bnn86jO/7AQpxxBNkAAAA
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=1244;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=Ig02Ia886PvDCutXjdfrwpVcl7mRn3EDpKbJ7k34tmk=;
 b=P72Zmpvb3tqGJ3FjNsRAhiu1NsSrvHIbMbWLAUANOSfQweRTZEGoFDQVDqlCouTp48oQ3stJJ
 +t02yiKhdCYCrX/sRv5S9eZa4852+xqmhA7UtsvwEfODiQxp4aQA1/+
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_054721_463774_237DA07C 
X-CRM114-Status: UNSURE (   8.78  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add support for Allwinner H616 high speed timer in sun5i hstimer driver
and describe corresponding nodes in dts for H616 and T113-S3.

H616 uses same model as existing driver except register shift compared
to older variants. 

Added register layout abstraction in the driver, extended the binding
with new compatibles and wired up dts nodes for H616 and T113-S3 which
uses H616 as fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Michal Piekos (4):
      dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
      clocksource/drivers/sun5i: add H616 hstimer support
      arm64: dts: allwinner: h616: add hstimer node
      arm: dts: allwinner: t113s: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
 drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
 4 files changed, 78 insertions(+), 7 deletions(-)
---
base-commit: faeab166167f5787719eb8683661fd41a3bb1514
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


