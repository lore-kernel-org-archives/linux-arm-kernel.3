Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oirvC2sghXez05Nj35JkvFvX7DwzVuZd3k861QxnyiU=; b=jvFBEl7QiBuvWnlQPs7TgnrhH/
	C1Cddcd+tcx1lYhxoOfAeliih1QrwB5z2Xd9JowQkM4yGkO2FQMOgztZ8knO2EXv0Qn2E7OKLpfve
	Y0ZWQq44szZnSUraYGF/UNhDpBZiVA8YpJB1tMT7/cCSauPvVve8U8kLm40so9o1dgw75tjdW+aCg
	Nc+Fxj+SviY/AxZEjJEQurYKu9GKtaVGSqPRSXTXH37VmzT0C9OCjNksWKkYuR8dVO/EWNnRX5c2E
	7F/g8re0hW124PzhdOjDsEKz1udqWFkW3FmUMpfS4ICmze41Nbi/75EBzNmYs3L6sObU4OfuLmXlc
	g0/xzK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcVT-0000000Byy2-0HgJ;
	Tue, 14 Jul 2026 12:45:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcVQ-0000000Bywr-42sg;
	Tue, 14 Jul 2026 12:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17F30601EC;
	Tue, 14 Jul 2026 12:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3EB1C2BCB8;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784033099;
	bh=Nn/jrapi0kptlJ39pA0zVXo92X49jLlO8HGLvAXNkrM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OKu1WK5d0CKd+GZLAWHMYagMNsyC7Y3VP8MEYqDELMxl3+RUbKKpitvNsHoK1GooD
	 eDUe+btuv+ZkbkHUKluTNftiHzJamni8Byde3D8qDf92jkKRz85nMMQEBBV+r9Hva/
	 o2acmnMRa5S04ECQh/305brlEPUWO2WFmav3GMbv/TrV9lkw3GrM//UPYzawZw/4lk
	 CIDuawyODaFlaC5WkP0AlLTB4jb4HTLQA29H56AuFjp1ARCwadcw3x0EUo1ecwS/BE
	 Kf/al7nABTva0caIDO/KR3e+FIBoMAblULvk8D4JgwPsQ4Ar0BW0ZCxh1GLNOXVQGX
	 aonIwesSHK9jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71436C43458;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] soc: mediatek: pwrap: mt6572 support + log level fixes
Date: Tue, 14 Jul 2026 15:42:02 +0300
Message-Id: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRKRWuIhbUYCxoWn+JuLti+
 S3eu8CTY/JQRhc42tnzMgfIOAIzNvNAgrtgwAR1kksUOstR2MM1VqSmkJlWpu9QQQiso57Pb1b
 Vv/3WTmTW9wD3/QC2rBQtbgAAAA==
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784033096; l=1009;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Nn/jrapi0kptlJ39pA0zVXo92X49jLlO8HGLvAXNkrM=;
 b=blv4Al/GQ3QV1Qr4XT5gNVLbbMpXXuOLHXeoPuWo0bBGSh4WjPO4Up+DtLqb5j+MR6nC5M7Um
 KXoGJK1ssy6DA4yHMT0E9aGC1lrF5UkrcpnHhtUXlNwrT8jVXHQ/N43
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 156 +++++++++++++++++----
 2 files changed, 129 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



