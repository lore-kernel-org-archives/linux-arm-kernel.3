Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42983C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1XLSf6ZDB/wEqrRtkdlR8YK8IVnmgU/VbtIqk1IzZk=; b=LlPRXQIjjKw4o0TiRlTSBxXbOF
	3j3b9BcwxzI48yRr5VAm5PbxxVx/IFfItTLHlT+t0ifNmGnLc3K310Swy1/HBFxrtEQr0f7v/QFv3
	NE3/ZQclP3YqTO7JsMm4RhJg/AXTr0RfDv4Bt5wDYzQl+Ez5ObUgv79Dw/3KhKRabgvrs+0aJJBFr
	r1Jqi/MHSskSkU2IZguMKC7Z0tVL+Ny9/ddzkHfAly2GRrSzYBSg1YQMkGt1gnngGLWvhDDoREvdX
	jm5bhVZQTMfm34fLW2whBvTzk9qRgRurepwYJyAkPzr2S8GmriCtIUPgymYikJDMBjnGqRJIwqMce
	0QWhPu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOv1-0000000BiSv-1AC2;
	Mon, 10 Aug 2026 12:15:51 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOuu-0000000BiJH-0BkG;
	Mon, 10 Aug 2026 12:15:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CB72C0516;
	Mon, 10 Aug 2026 15:15:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364141; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1XLSf6ZDB/wEqrRtkdlR8YK8IVnmgU/VbtIqk1IzZk=;
	b=jd2e4MtboCVn2w1QPDe/Im5f/LMETb6HuTl6ESnZ4NMjl7H/x6TkM3szAKfDAbQDrU1S0r
	Xoj2sdSLWDJFDtqPT9hlfMiPQpSH1EQhU04PyARXyehUa4SvzGMVy/ayGzXO8FT2uBKMVF
	VJLEJSXxNbYUcuOUMrz5UYjOedsXukd440taUfpf1sMxTLEeXCAf1l5DOLKSrVwEIRH2Y+
	6I7LJLeiW3fa5alzAf1ASqUUYkL4OAk+LykgL7P30kq3l75MerT4ShUdS61brB1xIBc4LK
	8zHWxqTy4JACFR+c+4XL3g0a0MiNoNlKuquogslOVgqcqjoPCQJm9hua47Kg3Q==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 03/25] ARM: dts: rockchip: Add reset bindings to RV1106
Date: Mon, 10 Aug 2026 15:10:54 +0300
Message-ID: <20260810121121.210040-4-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051544_279837_9B3DD7A9 
X-CRM114-Status: UNSURE (   9.92  )
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

Include the RV1106 CRU reset-ID header so device tree nodes can
reference reset lines by name, matching the reset controller support
added in the previous commit.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 70d3da6bd03e..fa5d0d7f4dcb 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/rockchip,rv1106-cru.h>
+#include <dt-bindings/reset/rockchip,rv1106-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.47.3


