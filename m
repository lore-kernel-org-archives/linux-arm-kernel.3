Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3EC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASi1sp/JbXHU8LqWjIYUcHi05JGXzMPUEeRdSNWaNOk=; b=mvDpG+GRtVcSOS9x0ScNuFIpDL
	nT4fr8GvVqQYCVj8UBpRoigf+qeadLSuAEXjpJrqvCpEf6/qDtGsH0A9SQf6dYKyGedhEU4HXRvHo
	jZM0tHU+XlnDIqGiu5de1yAV1KrdBKdxwj7Mk3WwWqT/uJuiTMEf4yFyh3IS15Y6YjMh07AguhN8G
	aKmXAPd5fpaR6+GREOiNLUyUrPSY+9zZQuYkgNF94AhrhW7ShAJ9wiT+n7GFv09o5d0DHFDl26U5t
	KXcfHr0/jU1tJAaNpLVyL1GjZm9S5tFhZsWvqgn5jsCl0o7YsL2zqv/csnkZlKfkktC8Z0ky8vm3X
	PQG0GQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmPu-00000007cVN-1wL1;
	Sun, 18 May 2025 22:23:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAE-00000007act-0mnF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606041; bh=ASi1sp/JbXHU8LqWjIYUcHi05JGXzMPUEeRdSNWaNOk=;
 b=pI3/MPnaPJYzcrutjWtmKjdyjMXoEFfpRZIoU+Z06px4/FZ6stPZcIXy3xchQjNhiB3yQ+0BV
 mibYcBuo/mIJS0CbQIHJQkdmW29mfxOKOCl5oUQd42zJ3EVKtguHDO6e36WwzeSa3MXCPqy9tSM
 S+UrJ40/XQvS8m98qHjxZQ+u+H0aTiF33LIz7G8Nphx9E1sMc7jy0HbpWlwnDUJp8cI+tCwWsLR
 AetaftDJOqW2urfo779J6WuL4p6wQRZDpw57sPhGKN+LFwtWFE0j3XllFMqPEAnqFy7o05dzgra
 8gMCPZOVgNv7QGykZoFNMdFq4XBbV4akAczlJ72XwPMw==
X-Forward-Email-ID: 682a5a1678cae75fbd8d467a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: power: rockchip: Add support for RK3528
Date: Sun, 18 May 2025 22:06:48 +0000
Message-ID: <20250518220707.669515-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150722_321277_8FF85546 
X-CRM114-Status: GOOD (  11.84  )
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

Add the compatible string and power domains for RK3528 SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../power/rockchip,power-controller.yaml      |  1 +
 .../dt-bindings/power/rockchip,rk3528-power.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/power/rockchip,rk3528-power.h

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index f494b7710c09..a884e49c995f 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -40,6 +40,7 @@ properties:
       - rockchip,rk3366-power-controller
       - rockchip,rk3368-power-controller
       - rockchip,rk3399-power-controller
+      - rockchip,rk3528-power-controller
       - rockchip,rk3562-power-controller
       - rockchip,rk3568-power-controller
       - rockchip,rk3576-power-controller
diff --git a/include/dt-bindings/power/rockchip,rk3528-power.h b/include/dt-bindings/power/rockchip,rk3528-power.h
new file mode 100644
index 000000000000..318923cdaaf6
--- /dev/null
+++ b/include/dt-bindings/power/rockchip,rk3528-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+#ifndef __DT_BINDINGS_POWER_RK3528_POWER_H__
+#define __DT_BINDINGS_POWER_RK3528_POWER_H__
+
+#define RK3528_PD_PMU		0
+#define RK3528_PD_BUS		1
+#define RK3528_PD_DDR		2
+#define RK3528_PD_MSCH		3
+
+/* VD_GPU */
+#define RK3528_PD_GPU		4
+
+/* VD_LOGIC */
+#define RK3528_PD_RKVDEC	5
+#define RK3528_PD_RKVENC	6
+#define RK3528_PD_VO		7
+#define RK3528_PD_VPU		8
+
+#endif
-- 
2.49.0


