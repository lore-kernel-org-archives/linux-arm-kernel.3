Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EAAD3B7FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWWZNo1Ds8pYIpq291eVYKiaMyNft8NiKQtVzEpxS8g=; b=KVH24hKSNKwdxqD1pskNyZdTAj
	OLi+HGnt0GIBvpjKHgOxMCIFmvVd3ntrwT/nvFt+53PgX4L/MSpeQBEnhXW+MkwZvdWArs/PspsE9
	cfebH/CbwcLHKUYA3ADYC/zhEdvfN7IjFLSezBR5dqB57yKPuGPButg08Rd7ivjZkwTwVeoont0M1
	TutKyAqn184wZHjJrdSUh8EFwxto8lNzSsCRj4upRqDU/jOhbSRoNPVEjyKE6kBmYn74vTIqqMz1F
	bDyJnKrlVE3o+wWtwF0UkSnqOy4OwLWQaZ5PcF9PfcnTI/RLKtS+xsEJK0a6V1E7XdAFKpWGRc84k
	HiC3Wdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM3-0000000E89j-1nwT;
	Tue, 09 Dec 2025 10:54:03 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLs-0000000E84L-3TFm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wWWZNo1Ds8pYIpq291eVYKiaMyNft8NiKQtVzEpxS8g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277619;
 b=rwOkk3GrnDLG3bSKZF4wVaj/Jpt9qi+jtH4m9Iq3eejRaAwVImaCI22E7UgGdJ7PAPWKul2U
 ZST8yXzhj4iNuyXPHrIomToEvb4ZMymTrxOZS0bABuxPznrcqI5BQKftWNHCmQ5wUl2LOFt82SA
 jhXagr9J4e9QXvtef6YN/0lzt12ohrYinI/WjhbDjjsTRMMtzwB0p/2flIdC1z4e+XD4gNZu/wt
 zKD541Ds/NqTaZ1g0iJqGqDKseLQ6sZCp+EZvUs6iCNAJHZIz3TMBUS6OKlWKFsPoaMfo1nFugI
 3qJ4dfkmi3H/AZsFag9YtUOpVMS3osLXUQFux74p2uDxw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277619;
 b=SslRHYUBc1Qnc4vLP6CAM57DVSA7ftl6dK8ndoaeVgUcuVYQ5f5bMNcp1cnNuij2dl1HzHhp
 czFL3qC10qWf/tv5TnETqJou4AHiO+mrRBKEsvvi9TspP65VpUffNqASwKTEO34EXzBlhuHUBzv
 o/0fiXiNTn1wkK8/4ploRW3KFJmPTNMHjlwFjQvyOKetQSOtEBXPIg3a5eQZI8b3kVkfe0682Av
 XF9UYVRtrHlfX0Gxtn9j1aEz7RCHKNuS871Kfq3mUzz/snYtFMKYE3QUiD6YP98lpjDTN7Xu2Yx
 GS28l5Kz5LxAT3SkpiUY4vVzDrTCqSruODyEsTZS1XExg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:38 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3B805CC0CC3;
	Tue,  9 Dec 2025 11:53:24 +0100 (CET)
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
Subject: [PATCH v2 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
Date: Tue,  9 Dec 2025 11:53:09 +0100
Message-ID: <20251209105318.977102-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLD6bjYz1kNh4y
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2d9210e846ca8202dbc6018c182c7a2b
X-cloud-security: scantime:1.911
DKIM-Signature: a=rsa-sha256;
 bh=wWWZNo1Ds8pYIpq291eVYKiaMyNft8NiKQtVzEpxS8g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277618; v=1;
 b=j8szAd049L/i16ako6qIVlQLlCRSum53vwaTZgpGhDy23izBCZMSX/kp2ecBEvjRx6LFIJFQ
 +BkF8EVbE9CX7D12rOFPyBB4IQvqwM3qg4HoZC8DV4pgXjVhJ5wjMP/zpNpokHeIhcIcFB2e33F
 YCzKoxnfJ9+XbyCnKa3apENMS/LZXVpLbjwR1f6f0/yef+uOpM6UqzfYn5lY7ZE0UXiPzzeUixw
 +anVz3H6swKrBSj+z0F56xv1GEFEmllmQzkCMVS4vC9kPqkTbNj6XY41G3Pv0H3+DBFzpIqeWIT
 0ksWfC82NLl/FluvTJYUJ1RbUEnDEehPWCmsfkqfYT9ig==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025353_022138_1A0AA0F6 
X-CRM114-Status: GOOD (  12.48  )
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

As per datasheet of the HDMI protection IC the CEC_IC pin has been
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


