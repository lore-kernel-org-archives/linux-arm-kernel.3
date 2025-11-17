Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE7CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DetMJ+MPA+Wq5fNrwEPDOsXLnfF8QeGVFeKlIfLk49s=; b=Ut8ko0EaPoDGCuHBL6byElh6vV
	CMxI8MeujZa6IYFd3vTAtdoDnmfeMuKqumCbmNNzVAPw+BoCe/OOnoIZCVRAOO4M27hMT6BrQ3qGd
	Cgc8EbY+kcp6zaU2tMN98Kr7FAzZ12CElFZtiZwEMOCX/wI36jv9u6BiOChC2UHnFBG9/uUlUqAR6
	Z1/01TBsxYsNcCvv/AhLRVelO7PYdh0oiW6K4bGA81ZcLsVVcmwAFglDeJfO0HRw/pRW7HKr+LyFm
	y7UocgIXeAzqnM+zkwTzinUF5Ps7NCXDzpzrT7qTuZz0/fIB4CSUr1V0jbb89DuUZrmfNu5TGGcTl
	8pnffUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyUF-0000000G4uQ-3LqA;
	Mon, 17 Nov 2025 12:37:39 +0000
Received: from mx-relay54-hz1.antispameurope.com ([94.100.133.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU2-0000000G4kK-2t6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:28 +0000
ARC-Authentication-Results: i=1; mx-gate54-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DetMJ+MPA+Wq5fNrwEPDOsXLnfF8QeGVFeKlIfLk49s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383035;
 b=jMPoC6/TwYmzTPt+EoPsGisCSyF22OQxV2Gi7GgGMKzFS4eJfAuI/b+PW1cw5jZAYXr9XV6C
 iyvIWwZ0Es074ZUzpnxruq8uHzQfop9d8fuz44HiYviO8IWzFh1tgm1JlCelZt1sN7L7f4WvBV2
 ubBfRf0otKcPM227XNpCTYLgwm5TD0uYfQ6X/qoCxnZ5DuSTX5iUxNULEU0tGMTtgR6dEUyY3a7
 8qilnAW2pm4nz/J27C9PWQKhm41NVKTJSEFMjmybRW3FN3cK/P089XGRtm/gl5nkU+YmNxIHtN8
 RKhjYHuVDF3VmhsP6UhGf+l9zepJ8wflzxq6VmPBURwPQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383035;
 b=FzUHv80SV5kiDfLoKYs8qZHnzmc5/mVpLk8A2Z7KEmKB09Wj3nei+1cg0NDrlMtrJNuDezRm
 4YpX2eMeB9LQAXfjWprYI/PjTDHjEM5SVSvy4M5QLO5jcMJRpzPR3NnO5jv5V0CTLgyWZX4MJKc
 tbWwcDhvkd/LAvEKo0ELRSkQOgWENQDUTFVd8AZgKNfCjkSMLIAUXeIo6bfvD6gy3r3oWkG18KP
 ykmIy7n7MwLg/a8nu2Qe+uSezmugy7B9y5iZQLMdyzjwgeQR1jWKHVYza/ux+cdPBytQpnEx3S/
 jYYJW5x7RL3oPvcM5OQEdNVQ54Bce/ls8UtXrbuLVjmLw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay54-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:15 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6AC7ECC0E92;
	Mon, 17 Nov 2025 13:36:59 +0100 (CET)
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
Subject: [PATCH 7/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
Date: Mon, 17 Nov 2025 13:36:34 +0100
Message-ID: <20251117123643.711968-8-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay54-hz1.antispameurope.com with 4d96gw0g4Cz1l5kV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 8bc22d3d12689751e329df603757331c
X-cloud-security: scantime:2.731
DKIM-Signature: a=rsa-sha256;
 bh=DetMJ+MPA+Wq5fNrwEPDOsXLnfF8QeGVFeKlIfLk49s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383034; v=1;
 b=nslKQFz3pwH6A9tuNNrJ4vZk//kN1T/VY1qGI/O5WwXmI9GOcFVe757cKqx+ch3LwY5sMJhJ
 97LyXGICX8c/xfK9pFT76O9u+lZ1hjf2okFgYG6sCaMFeTVE9ElZeTMyQZPK7ZM4dINLekRnh9M
 vPFfB2CSvsrHb5FM/Hqnms46vX6GQzEW+4aVy4mN3J/yHiYZNlMXXrTCCH4PROdcRHc8Yjd6lWy
 X34xZWfM+5RS2LpImDrcACgm/DHcB+ZkuGDA19SvbLW2tEs/gNwwR/ruxZIKtERH82v0+Llm0cy
 n6stcC+w29Lb9CFIAVE2Qb8Uo5oyoUU1i0XxuRl/d7rug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043726_869374_0DEB88CD 
X-CRM114-Status: GOOD (  12.85  )
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

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 67fe1f63fd93c..30f0e81c4be00 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -704,7 +704,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000154>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_gpt1: gpt1grp {
-- 
2.43.0


