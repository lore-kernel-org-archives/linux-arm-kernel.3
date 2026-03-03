Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3611CEDA687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvuY6tCoONAs/t9LL/PNu3yXMbVho+VdPaNM8mraxH8=; b=IWq7fWsCPSlhbjw2gx329SuBub
	FxhSfxFIRlzqlVXDiSV/dRD3HsHRuNxpck8ujhu8fbLSN2Arw+lCmC7T09fEdqaLWVKnum3yPzMot
	1o/er9FcDcfsKpqm1ZfJ26nxBGyo812lIrsLs6aA843ARJFhxXARe+Yl7Po95nIcCJlRhntYr7B9B
	6rqYmXQFPP4ODrKb0vosFcA1RQrF7Kd+TiyLnhM1d1do5EomEADrrnNMPmKQJhcqjf6ZxDXW07ULN
	EjY+zg1T6AQ/5Yf73rFxAmwoawRTBmGGIqmIPbpe3ewXZLtJ7UEEsEg5fAMbtDN05r1yfLO0/tmCj
	6P/sQ7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxu-0000000FSKh-0B8Z;
	Tue, 03 Mar 2026 15:47:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxs-0000000FSJY-2tuk;
	Tue, 03 Mar 2026 15:47:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18C4D60123;
	Tue,  3 Mar 2026 15:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5346C2BC9E;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552835;
	bh=9J9gL7YouFeYvBXgJJkDaXgAt8k2hc/h0yRIxOleEKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uSAvNHKJycYCMH7/qlvPH/kSnbv5c1B4lYUo84R1elQSZXla3dA0dlIrA3P4AI4ua
	 o5NzGco8QUAhtcts5aN69B4bELBhuH50KjAyodlh1jrxW7K78GcI6oACG+H7cZN1Sc
	 aM5FJUvuIx06i5ucaG0yCl1QHXLNr/nrHb9u1bv8klvnutd3VpEAUOScm+VozA+mRC
	 arYw5AeymcATbTrR/k/Es1KlbTugY66s23RIbapj6wRvOa63Dnd7APcAxLKJ6M6zch
	 ysZkB/Mm+p9L069nxFOOkNfjUYoK1yZgAHtJI7dv3kKWESV4QV24sEAl0rI+8oynvc
	 W1SRIcC2YfLaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCAAEDA687;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 03 Mar 2026 16:47:14 +0100
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Introduce the reference PCIe
 clk generator for BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-1-04665e55d5a8@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Martin Filla <freebsd@sysctl.cz>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DLgTWxKRH1XYO2l0p6yOj+4it8sVM+ozZghYVlPNXHU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppwKCZCIoFv2sXDzcrPjnXi+tB+ytkrI1/HfhK
 nFqTHD/yYmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaacCggAKCRBgAj/E00kg
 cuZNEACTBZY0Psx6qqiEmOVSoJQGHaeY5kC8cjEpDIJ36SkjWF0Nfkk9uBJYUtgzgvSDKTn/rAq
 9DdfTHNpmLcxvMH7L2CniuVPYtJVomLoqieqOZpP8X4utINyAhpkzQIjzBp3XP/1jwrXCjCsyJL
 Jxi5Ow0z6FsuatqkjfeQgafRY7XgY4lta3fOh6YwniX3ggojxOB14Q4Vidj9kJQEkTXp0PHj17M
 NLcQFNDSWijkrua0hDvpjVueqt5Ut4GyN8ECD0+/XCsGDFd/fiYQxaTFKqM2jetXWzb6LnexXse
 lC7aZZOvYooa6E+ytTM2DIfMF9pVmMmcmN1I6NkxpEX+r1aWKG4nNjH8euT0NmP6OL5Yg94+olp
 IZbQv/NEHPsc9AhcJ8/p9DdoL36MHNqlEFkA9J0vd/I8M85bLj+REC3pkwx/YuAaecGAJB+Fyww
 vZQGgJS4Vd0HkIwQKJcGIDAZvDKXzlBmz53i25FExgw7A3ZLWanUEwBtslNicZaZK8/wc0HJ2pb
 lRi3nJSSoi92TYeXV5575Ou77a5fjQW71YRHkg+12yWFm4D4kbCtmvYwq//VRdxWyh4/muewLm/
 fFrDJDGnMrQ3Y/L+FSUfutRmB6AVSyCWbxMCG6597+bgMhwrm3eLjHeUT/EggKPcAn0e7X6qr2o
 JRl7yOPwhBw1cxg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

This clocks provides for both PCIe lanes. In following commit will be
utilized by PCIe clock.

Most likely PI6CG33602C or some variant of it.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Martin Filla <freebsd@sysctl.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..d02b82c5f979a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -114,6 +114,12 @@ pcie30_avdd1v8: regulator-pcie30-avdd1v8 {
 	};
 
 	/* pi6c pcie clock generator feeds both ports */
+	pcie_refclk_gen: pcie-refclk-gen-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie";

-- 
2.53.0



