Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6657CFA477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Dqt//Bb3x/Y5eSf+OIeQhron5iHwkVjbr2ny9T+e44=; b=HR6DbY+sk8EaYd5EFmKtnW8dmh
	5O2RVeKyXKzs6TyJp6EdJ2cnaKz8YzMkkV8MJJbEKEkPUs8RKxtJvtUJYS3GYJKZPqPB7nQL8RS8y
	RxvMrfNvYOQKFLihXdiFWFdJUiPBRsfhctpUKqDj6oIiRe/02sjhod+aq/8dsBYt+inEiMJMMXUWQ
	Onf5RYPLGxapZAK+9piVN379E7pfv41f1oo8cXR0WFG177/P6e6i2oVwEOLrZ3KkLADvd+Jt3yY1f
	CVgm48cCIIZ9ariLDgUCZG5mKDbWBTbsRmjKzc/RtLLubDXBF9VW596F5wkgViEcxda+ywbufTNqx
	Mtnbpx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLcr-00000007ylS-0y2E;
	Fri, 21 Nov 2025 07:32:13 +0000
Received: from mx-relay139-hz1.antispameurope.com ([94.100.133.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLco-00000007ykm-2qfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:32:11 +0000
ARC-Authentication-Results: i=1; mx-gate139-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5Dqt//Bb3x/Y5eSf+OIeQhron5iHwkVjbr2ny9T+e44=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710320;
 b=G48CkNKbhJrYRlScCwqxh7EuGV/h927Vk3ctPv1ootqN9j7GsSIB1zb1/M3S90VDeTFQd7ah
 exxMuxYdoV9FzP8CqfF7r/aQJ07u64EbzirIG2+sPLEELT3mfgcKIbuclNx41l7vVJMc+50LPDK
 UZ3FsHMTTE1Lsrpj0do+Sq2q6Q869fKLk34kMD65Wbg2wNMCSYb0Q4w+/LZ30wF3T7+WTN3pAV6
 qs15VdIugmPOwe9+iN0CatNxJ25/ml0npMWHCa3Tfq6rCS3nGN0R1MZC6LDihI8x7jfS3FDN4LO
 eIAjahwIrcHA6nJZVpdHW+1nPwtD/6i/yKDfNwgZGX/zA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710320;
 b=bJnwsESa3xZPSGkWmRLfYFhog2+mqVuw5nDMW29BkxQTOtrlQglUmUMCFfxsUDKFuWxtbetk
 nSNjBn7p1gIRSoR7aR2wTvhxvyhZU8wm0aZA5Uj+I6y+zSUvd/59BlJ+oEYrImbGxZDmRlcvEpP
 GTWkZ5PGp0LqcsM0PwVykyfhzDH+ZXEdm/hbu2p4LdCHQRMIQ1X/cMiD8sPny0UrHthiRvZhScU
 5RJ5b+4KLBGGRzLhlmlquXtQvKo5XlGsprJQpckwDw2ktxpuTHimQXPcokBq4DABF/Pn0m9dGz7
 QCfaxMu3Vlk4MBeBn8Sv4jr6udsX7ox9r0Xpx9to94JQQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay139-hz1.antispameurope.com;
 Fri, 21 Nov 2025 08:32:00 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 382945A0495;
	Fri, 21 Nov 2025 08:31:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
Date: Fri, 21 Nov 2025 08:31:40 +0100
Message-ID: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay139-hz1.antispameurope.com with 4dCRjs6s50zNwSv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 56853c09cfe5c0363f0c70f3518d825f
X-cloud-security: scantime:2.285
DKIM-Signature: a=rsa-sha256;
 bh=5Dqt//Bb3x/Y5eSf+OIeQhron5iHwkVjbr2ny9T+e44=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710320; v=1;
 b=qz3ellwDsg84TTayZCLA+5xFSKB1qTkmFCdVuvC40OsJe5wh50aYqHGyTzRrfbGi9bckzFnO
 SM0wFty7YfzX/Jk8R6AqsR8LeU2zfU172E2cGaXGtezIqsg9mbovFx1xzg5APd1qJHYn3mpiDVf
 9ngMSPoKksmZjMWvgVbLFq5iLfOujK+aNlzb8HKEQFaY4xGFJNb4ng+GOVyfpv3kklCrqg1piIm
 IoG6539FIJm8aLhWvXnF3w0B+BrYG69e6pgn7cQYLgsDqlZZItX14y4T0Rrce9tuJw6p6Xik/tI
 S9zM8RnxpnzKkwW//0ykY9MwKAigVhRFyZU1FkzLrbzjg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_233210_854766_11D69F0B 
X-CRM114-Status: GOOD (  12.40  )
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

Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
numerical value is identical, the LPCG input is defined as
IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
consistency with the LPCG clock naming convention.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index 2d0a329c2fa50..ebf20d5b5df9c 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -406,7 +406,7 @@ &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-			  <&sai1_lpcg 0>;
+			  <&sai1_lpcg IMX_LPCG_CLK_0>;
 	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
-- 
2.43.0


