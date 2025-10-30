Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D89CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No66cNLUicbMmk4yWzYnf+xkWOSrPxLslCLwe5XBnm4=; b=0YmSClTjd2dOc+TkbqsrO+w3gP
	a51LXT5aTx1QcoI/jd5HaronjAWSNkIgGfMDn5h62DhGvKe9CANdkCAXDo/FTFBY6okS0MKxUlk1d
	FzW5fG443q0rVvad/TJ9pc/84lQuF4AUe/z6fuRYuNu7UnLS9rIwxn1ubCWjp+UHK1n/4CI16lqZk
	R+wGfprMIJWmsjH+CCdMInPeItExr62pZE1rR0kMeRGoBDf1jcNbLimZ6VI//LbAYGLnCXILmD1xb
	EE8M0nLQoFa0lnmYQPlMuFvaal6hjEkwZ+ZMAOKpk5QqhIj/9TWkAfqr8AZ/oPYcuarhRQ9J+DAcI
	ESBxczpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET5w-00000004FB2-2LUZ;
	Thu, 30 Oct 2025 13:53:40 +0000
Received: from mx-relay73-hz1.antispameurope.com ([94.100.132.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET5r-00000004F9c-1EuC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:39 +0000
ARC-Authentication-Results: i=1; mx-gate73-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=No66cNLUicbMmk4yWzYnf+xkWOSrPxLslCLwe5XBnm4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832404;
 b=nXcmdEdXEIkctf30hbexwQvL4QBtnZf40Kz//B6W9qqtQZ4qpdqloTpyOacfRZ5mMsHLJYUy
 osumX/ATUPVRKfPKVEHLxslc8gEhNujChPQA1iohVtECl3d3x03aYFw/kLJtJnOUnFqhHuDKBP4
 IfLC9Yq2XOv4ZFk+I08VTRaJ0O6F09sY9tKCYP0IPCsB/XX7IJiAxm02HSWeSRiDq9DM44XW7yA
 dtn60rd/QiXK6RWcNltab7B0W414F1V55RaKVK+nRwjoTBYsykD0+7qXCGCKNsfnRAC2apfSGxU
 C2uTCxZ4krk+szUVjfTt9R99GAB+c8wkkjhUlmmrOuicQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832404;
 b=RqMQcP1yLkBaICHqgL6GxJBGo8KS3kTJp5sX3TXVCg08GygB+tWNcoN2pBIEjQDMySLyOIB6
 eQDQ7/+DcBoFcxcLnAZov8tYPrNimRaxi5mlp2w6oT/NXXnQDaBBdUs7dOec6/8AbVB5NnvvU5v
 vcS9b4TsZ2iAtJuFGD3RSdpyeNCBLmYA+QVBkRSQEfAG4Zk/DFmdUvn7GCsFpQ9/tFMmE5J7Thm
 TOrEHFh0YTRZcwpZ90BW6U5nj2TQywk18DLFVtVvHCl4KioMSyP/89KEvbfmmukkWclsF9/dPv+
 dlBSimJOy1jqbUVC22pRfB0Rv6kCPn8HTObJ0uIVc2gXw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay73-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:23 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8E76A5A04B4;
	Thu, 30 Oct 2025 14:53:11 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
Date: Thu, 30 Oct 2025 14:52:54 +0100
Message-ID: <20251030135306.1421154-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay73-hz1.antispameurope.com with 4cy5D82Hd3z14Sd1
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4ada1ca96b2637bf43c610ce9808313e
X-cloud-security: scantime:1.655
DKIM-Signature: a=rsa-sha256;
 bh=No66cNLUicbMmk4yWzYnf+xkWOSrPxLslCLwe5XBnm4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832403; v=1;
 b=P6umpohZcxCBfnCIn4cL3K7VbryLBuEERtX7cEAPR+FUVnDA7J7vKYyN5JB1ytIciw3I6R5r
 Ar7hV0nR9kRE0poZuUQOFE8t9jkXs3AiZOMt+vCxrQ9KrCJ2/g/kv0BaR3mnzXW8v4oOQWsXz+/
 R31UBX9ye+DDAjX1cm3aPspIiPt8O/7HKzWN5nMqQUvlBrB7jyBzxhXy9uP9zwmJ3WpcsMM7g6s
 k9GCo3DmLyVLLKKUhKw5TJHCP9hlDcg0/64K5lkyqYFaAS2OPJ2HYBgOCnnxaHNQOpIrIg30MzA
 vvYEaeluJ/sgzh8ARqthZr1wJXPriiXfqUDowOiSgY9gA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065336_928619_6F4953D9 
X-CRM114-Status: GOOD (  12.74  )
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

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index a6ab94208028a..cc251505f6280 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -493,11 +493,10 @@ &usb3_phy {
 };
 
 &usdhc1 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc1>;
 	bus-width = <8>;
 	non-removable;
 	no-sdio;
-- 
2.43.0


