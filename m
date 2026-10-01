Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B979CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8tNDjzRn9qmc6cZAbxrp/fj3iqWQrDonnVu18KeW0M=; b=Y+fAy6iyiaWcBJifpoim3e7FQE
	gBQDOXyrB5mGfQ1fZojpuICBsFzSl+YwXIpTvcxFB4MrRIB8P1ilo+lZ3/PRw6rQEIRGrdI1HU4De
	jkG1HW3egWrWXJo9haCeioJTzLskJd+8J51QfokvaXH5QuMl1xdtIMdA9VxT4lV26z9E/yFBz4HSd
	Th/xYgdoYLf6PjE1uEYvqr+nWshHKZ6xEzcEyVl+tRrx08ly55KH0JePszkXM9q+igd5nLlS0gAJ3
	7faxvLLK9u7AL3JGcVp4lZzzB+d+bwCZT640TbGoLgLHOfMntVhj5ALkkNRgWV40PHTX7L1d3WFIc
	XP1BsIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsV-000000086AJ-3Pum;
	Thu, 01 Oct 2026 08:10:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsU-000000086A4-2vD5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e8tNDjzRn9qmc6cZAbxrp/fj3iqWQrDonnVu18KeW0M=; b=XKVZbCRy1olSFpxH4dWdp6/ze9
	EyKh5tGse5aloCDlLLBeMtNMtYJI8Gidod8PuSkYfUikqf5xLipebr6udXhKZtFUfsJZ+R9T59yrW
	WwBS4TG5IGcP08pnXlvetbjQmxcQCgN0BUcAh9UggF3gCqFv77Bl/Z2LZnKHCt/2FbD82j90yXaVA
	iS26tOb1hmzRLhA3y/1GHP67lUKsmQT656D2GLXCsMvs3yVhp5xyZrDlJLHk8WSwJ49P9Fd3b+dlF
	EbRcTEQOhXODN/D04wWUxQ1EmcgdifnBWLYQJbZYMMcpJ4wY09FnfEUO+Q+duvUQaxq25TNSf3TQk
	NXrZC2vg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBsR-00000004iIq-1VKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:10:53 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34824 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCBrn-00000001der-05gk;
	Thu, 01 Oct 2026 10:10:07 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
Date: Thu,  1 Oct 2026 10:10:04 +0200
Message-Id: <20261001081005.2209755-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091051_624735_79A2C96C 
X-CRM114-Status: UNSURE (   8.69  )
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

Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
swapping capability") we can handle touchscreen x- and y-axis inversion
directly in the kernel instead of user-space on phyBOARD-Mira-i.MX6.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..a7d6af162731 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -164,6 +164,8 @@ stmpe: touchctrl@44 {
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
+			touchscreen-inverted-x;
+			touchscreen-inverted-y;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1


