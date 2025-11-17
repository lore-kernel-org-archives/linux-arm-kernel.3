Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF93CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pJ5eqwsRiOt65RV7so49519D0zNC8o9Y8EmhxoJEHY=; b=g6ElCkhU07nQkgBO9VG8DhNVz2
	bXlzGNDXbP6NHBTz3FQmJ7fUNdrQh/BOL7mNVSw6GaH+PhxDjFVYnIXu5gHnXxzVMJ93PwcFIjNAS
	4SzR985HcMWjYL6L82SDcs1I9sxVFGCVRxLM22ztazxwDq7OAYvuYNDQ4roCEaPOfhm/b2nC7N7bl
	obgrz77fV4/sdU//rLgJI3n2/JgMbcjgixI47nKuhwmX05vW2AvL6ZEbCZkHIiwoNo7xX/poqHVJz
	pm9T12kl0DxdlD96Hck9R+wOsu47lJBL7txtgK2VcQY2GfVz/Rqh/p3KKLo1c7Rk0Tk40c5tvf/GO
	ns6iB+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU4-0000000G4lJ-0CTo;
	Mon, 17 Nov 2025 12:37:28 +0000
Received: from mx-relay26-hz2.antispameurope.com ([94.100.136.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTu-0000000G4gy-0GFi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:21 +0000
ARC-Authentication-Results: i=1; mx-gate26-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9pJ5eqwsRiOt65RV7so49519D0zNC8o9Y8EmhxoJEHY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383027;
 b=Qj9Bwo+C4pMBa+D8M0XyDd8SfuCi8L/TEMDgXL/GveC2dXSKvzFYr7kbEJ0LhAF/+Yt6LaNK
 vqSIpUGw8wm4NBXJFtzuIMgP0jgsvRGJkby/e3eG8wgWDLnnQPpQKmszEUSSXSxh78QKiHnIHlK
 OP8aAw4OQcDIYBtNDkTzjMz0gu9OawWrXA9siX4czk3pdvwEsNG9IGJ7ZN/T9t5vhEJvNXml+Xw
 pEpaVoCYQthP3yVG9TG7pvzqHSIFWyPAsmOU/lWAmFuQwGLidSw9gf3HyyGWSAxal9J3o8Z480H
 9iJ1Jjr7fKzuFuLfhJWw6pkApTPBHME0TGRV4eIofZG8g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383027;
 b=q96T8IxXBmhu8dH5YoWi6gIa0wsjpuKDJiL91nlDL8PR2o+OPR2m1hgwmVyNzA2RpXI4NTwX
 pHQGOD+b0CvYyrSSF8GSslir/Vz1DfF7HCPtsSFleastN7VpUhkTI5ntlxfKsmGeBipUakob2VZ
 ICkX2dZpoUHTAc4XVgHYbdSHvu7WCwgj0tLDK7pj6naMAocWs9d8ZDLOefaQu11ekwIlh4ObIjm
 RMnKHg0V2dzpkGXFnb7vuEX0Dzh8V1IWsjIU58qEixx5YskfKtTH+r3RQvLGiEyUAVp9akSfD/p
 Yquv4+oagtkFvlSA/1bUOgzTOB/2NBz8yxmhKmldfpAng==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay26-hz2.antispameurope.com;
 Mon, 17 Nov 2025 13:37:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E4E9CCC0E93;
	Mon, 17 Nov 2025 13:36:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
Date: Mon, 17 Nov 2025 13:36:30 +0100
Message-ID: <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay26-hz2.antispameurope.com with 4d96gn57Xmz2CqVx
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4c76057e9791c4f80819dc8ef33cc562
X-cloud-security: scantime:2.123
DKIM-Signature: a=rsa-sha256;
 bh=9pJ5eqwsRiOt65RV7so49519D0zNC8o9Y8EmhxoJEHY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383027; v=1;
 b=mWu98ewDX4M+gUbdJ23hVT13ma3BqDhlRvlEuEscxTNmMsEuGcJLegGhkz8MambbigLtfWRy
 F4RsAiazaDPx4jeYv0+gP/cdABojz4FG0Em7JCCR3yQySXuDxqTLj+Je76a9xyICD26aVwawa6Y
 nqdAKTzKYHWSTPOKKBfBf9qs1JxxYa4uxxGrei6KdopsLFQphaD71jHbDZEdxpuHT76OqWC3zl3
 4fyTL9AMZT6gNCY0pTPauT/kSEePXlbAeEOZ/Yxa0ALWSujReNJvK6I7kraahUG1Bb2XTjpHhdB
 hntYLmLPjIc9nXJG+VOIbnV7iVc8/pOVoVFNpfIQduq1g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043718_245139_EE022AA2 
X-CRM114-Status: GOOD (  12.94  )
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

As per datasheet of the HDMI protection IC the CEC_IC pin has be
configured as open-drain.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ff2bacf24bfd2..03b75d4cf699a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -868,7 +868,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000010>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_hoggpio2: hoggpio2grp {
-- 
2.43.0


