Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C645FC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=; b=dK6YRagK1Wq18KRtNY1WrnDZ1+
	Zu4LGVgnSUPrWYlrr5Z82bUxnaZi6vl69Rae6wQZdKcv1gcyaOLPGCgnPG9UZVl8WrmwvSaQ/3Bn8
	Po4rKiNJ+Ipo0pHe3k7xnYg9c+SNDyj2XYjWUskA9ohNYI2EAbgXeBxq9uWQCFUR6ZJ1grhLcFecM
	453Va3fxnYTF/TQegYvJyqRpddkBMerUaxfs4Eionxpcou57/KVDeeZI/UzTB911Lt8dqagyb9dXu
	7GkZYm63YSCPngt/4Qgz77ZSQcBfR/TrciBlvFJU/Rg2NVz5YPNMkCJNrq0u3KNjMsFvTHxLBGlRz
	ZIy1qgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAda-0000000EjQt-1ZqR;
	Sat, 01 Aug 2026 14:24:30 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAdS-0000000EjGk-2aSe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:24:25 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cc80544c74so5203855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594262; x=1786199062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=pfJ6M0ANNPoedGNGUdiTGJtgVg1yXBEvVD/okb1zr6DXfqbprUpAI/a3Ajt7qoWeGQ
         lkoiTn7PR2mAESrF+9CJW0MklWwI3mXVYCZQg5AZ9wBFnziSfewvoUmKRoI9LkBK9f3v
         ZaCRcPpsamisfgGX550jq/jKYo4yGQx/z8ElQBnWKFbrD3AuacgbcqjR3ZSAZPVD+4Rs
         2RjWgqg9Va3xqQ34NnxYaSt4x5/2MRExHpkp0uVTWHcCvQq+Y/Z661xV8BdLRio6Yfhi
         xNrhKxnBoYS/yzNOgShar/th4SmQVOZlo6bSj1aNF66pomROAc5JdU/3/MHMn69q6ICg
         oR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594262; x=1786199062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=SXaRoouvpRhDPql1IoQ5hyon3BQUgkULAWZcEvYPkSH6vY5b1q3XleHayspjtkd6yx
         s0pcDDd1OM1x1j9+shR3d7+0ugJgTMrIb+aV4VbCPL4TA5I4e+mbPn/N/yylXcSnellK
         HQsblEYeVx4z3vTjHJkhsMeLcot8+YIYVLed6KPwrJCEkLOXUJrNUxbi9CHyQIqGYPBe
         H73m0iXMf4N4R5fZ0IRPMJfAxVUdf0RjreBmu/JF2yRdkTRFOADu5V/jaDMiikvjmNTp
         ZMoZmhKVJho+w8SUEA8hlNNxNaVI29vEvdK/S6CwDTUwHY728TSasz0ixFA5j7ZN5p/+
         eZrA==
X-Forwarded-Encrypted: i=1; AHgh+RoRQMXSZt59JkufT7KmJcCzdNaZYSTl83h1KeoeS3xuuVeHzCbUvHONIoPMd9LQ73CQnerKzJOtMbO5KGhIwx6V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8f0ip9Zk5QE9QP5qIGmZdOh9xUyWp6Lfxk4FmDV6Vv8OjAoCJ
	GrRA33MYvP7yAgerMdTjxzuC9ArlcvMWfqtHX5Ox6kMqZYX95te8PbTk
X-Gm-Gg: AR+sD11QbitXtLAa202gmgtvcXrEF4RqvlAoeJqptBNiRsGJmlsxem2u5YN8KO0fqVC
	L5pcCLqDWfEPqHZmh8jJKetWpGOy0v9q7AOycei0AEYEgLYCLDhzHPzNpeewTbw05yN2gjpLITD
	XTKNYmfzlXLbjtfe+pg0FAy798cRNlvo8YGjkh1+lFSFORpCGp4Re3y8X/4Xox/QNguAGy1bX8R
	lQloe4y+gRdjXmBYrb0En8IyEtkr/8nGsLRQnEoBvyoUrcs6t24xDPxWuZpf9Bx5CH+FZjmlUfr
	QwmZmUQyIMx71clzFEJo8DjjyeK8+vQlQXJ+D/Nf0gb3CLQzELh6FU9R9V1XXTyBkooMhkMjQx+
	RVmglfqzwjxtfumMC4BQxm0OoftsF2T6Uxjod6cYRMZQkvrNzdBf1AifAusX+NYT2m/WsKsShRp
	8K+mPjrbAtfDiUbG84+jrH/rHVTNFBtf8sCGPoo+ZXrVozRLVFnAm8uAM=
X-Received: by 2002:a17:903:234b:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d0521b8488mr34096625ad.17.1785594261862;
        Sat, 01 Aug 2026 07:24:21 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:20 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat,  1 Aug 2026 22:22:34 +0800
Message-ID: <20260801142244.679437-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072422_669810_B7161CD4 
X-CRM114-Status: GOOD (  11.99  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307d..cd5ffae6afd34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23468,6 +23468,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


