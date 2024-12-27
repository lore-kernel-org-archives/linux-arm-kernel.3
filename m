Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFEE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gbjXz8a2aEevt71JmvcBPYww5A/leuvh+vbR5ZRlWQM=; b=KZIv2vKlBaiNoxwyWRKCKl01hh
	0p1t5Hl9ikP8jPAtgxroCLwr4jS21sb4TfO8gkGbxeLsJz6RLyK5mxX0SCZ98XUu/GaY7bWyRXk1q
	bJVn7m5Hzq3ikEOgF0rgl9YnTu1DRbgZ/LSwD1lNZGXtnuLIgwWohV0nWPEw2a5iYNuvrj6W3fc0H
	9c+K6R1DZTCNQTiKGaZQF49m8emiFmBdU3+ESLnOVbbaYJlqFAjfzFBlMvC90TZMoo76HM0HjcFM6
	ESNcPjm+peGwGuN3vxD5XHp6yJdLE53Dofgd12Vjj0Twfyb9/Nrm93e/zTOfiCgnd4wKMaNK2FARC
	cpKow69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAVC-00000000IrZ-0nk2;
	Fri, 27 Dec 2024 13:35:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAU1-00000000Igv-0kGo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:34:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f441791e40so7452181a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735306468; x=1735911268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbjXz8a2aEevt71JmvcBPYww5A/leuvh+vbR5ZRlWQM=;
        b=klJQzzUUybyzvhXFspoP6eGFpxfpku59+b4VioLcZANIg8kuSQOUjc1T5lQfpSlfI5
         AiPiy3jv3jPSKixcpbC1zwIrb2KC+BQcgoxd11/DLQRIm+/ecekqw0Xh/bTE2Bn4paFN
         GqOOWYmCMd3nDV9Mrm1aE7m2dWs6tP1eHgF3aQwbFPfPqzkxdKqlZCoDD/K2LVs+v0FZ
         iJe2Hb6zZVxzKP2wptfr0vOENbjididGxKW4ItohREa7ZVvhiiFbpqOfB0u7G249G3m2
         4wrw3hKePFirCxH6nmGjoqmugT/pMDedmyyHAgpCnOJ6W8e5ayOOAPKCu7jz8kJn0SNq
         2WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306468; x=1735911268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbjXz8a2aEevt71JmvcBPYww5A/leuvh+vbR5ZRlWQM=;
        b=VY5tipS57Fz8+Jz50G9U6aze7pHF+3rBC7tW/zrdP9chugaJ0GKYSoDEmregM+oudK
         aWbbQZShd74pq90i35xNgfnZC9lOFhY0OCBIJ5+beVTWqKQOMb75MDdmy5S+P6l24qug
         fxYo4rg12DZhXYsPF6NxgWJ3vUchthErSNbZ58QIwChewELGh2nbE2vyYeO/8a5O9plu
         E6m7ZrOE4Uv8+tou79GOCZUiZLu9lNVyQPjMlsn8ihdD70m1chJj7FmAFe7DoS9cvcZw
         FOv7ScDPaDYKZGRKaxHJ/9Eigy3qE+OZtyttiMfiN5GCVcoGcBEVrOgQNf/94B/bUBYk
         bbLg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+IezPPRJCYRq0VFbdB7BXdoTmi9LBQ5aJuL1X2MlL5vlSqYao5TKi8iSQ8IERGIe0j79EQy7jEi181eVHMp2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt374ymRB7fxpIN7hbxQ6nvCDZiwYK6ZrONjtCZyQ1TaLVtWEo
	38gHP+Qv7qVeWBAicJ6gd5btbnpbm7KQ7MrvE5idx/ea6sBIxRzuDDb1mDRJDw0=
X-Gm-Gg: ASbGnctXr0yMhYFRD5+nlx5WXarXbfTdx6plO4DbhanKUICG6p8liwxdPL/lBDuyhhy
	OA8VQG/TMNxRgcpHUlUrkBXFLdPdV5pOGQs1gYtM+GUyo8bvXuPJtfk+eK0KG6emNQalyGEELBT
	lI+D01BVZD+YN+o/GBjICroGtsiweaxBgMrK26UHf+hR63HlBNVYe76D14gMPAO64jf6MTqR8tM
	hUfVbilCjJJXaGCeXMO8lLReUJssNutMEZlsmGOBxfvodACGBCgg9s09YC79JOZeuoMMOU=
X-Google-Smtp-Source: AGHT+IEt7gViFQxiLT8qwFNX3IkYH9GYMt+Tf5HsK27rfbJpvt2pULbbxU8yBcFgcbRCDwUYnWnfew==
X-Received: by 2002:a17:90b:5487:b0:2ee:d433:7c50 with SMTP id 98e67ed59e1d1-2f452ec360cmr35336365a91.23.1735306468234;
        Fri, 27 Dec 2024 05:34:28 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([103.217.239.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4623dbfbfsm11808238a91.48.2024.12.27.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:34:27 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH 1/4] arm64: dts: rockchip: Add Rockchip RK3588M
Date: Fri, 27 Dec 2024 19:04:17 +0530
Message-Id: <20241227133420.169714-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_053429_218874_47CE2326 
X-CRM114-Status: GOOD (  12.81  )
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

Rockchip RK3588M is the automotive-grade version of RK3588 SoC and
is operated with -40 °C to +85 °C temparature.

Add rk3588m specific dtsi for adding rk3588m specific operating points
and other changes to be add in future.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 arch/arm64/boot/dts/rockchip/rk3588m.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588m.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588m.dtsi b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
new file mode 100644
index 000000000000..0bbeee399a63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ *
+ */
+
+#include "rk3588-extra.dtsi"
-- 
2.34.1


