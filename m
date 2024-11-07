Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A924D5D68A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnS7uhasltQq8a70D1WpVyW+EFmsRaHottC0hi42MhI=; b=CPkZ6xrRecCHypt97PUUL9e8u7
	iHvkKdVFf8T7VZpms/zUfbtNynp7yxGHvUWIerRsRJmZhEV+26MFHWXHHDB9MzCQm7hkP4dWf+eov
	Q02ed/UVuKwbxVIN739wIqz71mVInqcv7Q9Qv2OevPNN5a5J+dUgh6cZzzFGshK6bZj79vMlnaWDq
	hLw3uHJZGoK1v/xo1NjHvVdxhoXbLDmpPxBmhlfookh7W6CZa8y0I0nXSPBM4qGSHUo3thtpjnmeK
	L1AEXKNHdiHm0jbSz3v5SwCRj2O3uRZqekNYyec2zyZFApEVi+fggacz8cD81qZzxYC8crTgLRIuF
	BGXe6nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A6G-00000008PsS-2oxo;
	Thu, 07 Nov 2024 21:31:32 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A4V-00000008Pig-1Ji8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1731014972; bh=ZnS7uhasltQq8a70D1WpVyW+EFmsRaHottC0hi42MhI=;
 b=pcfKlvCXqHWkx5lDIZhW0pH0vxNOQN4gY0pDz5k24C8TFO1dUwfSqOj+Fe71D4aYv2ggr96ZD
 eAcEhXE2ynDj774ecOF7yupk5MRYL+IucLT8Li8kVE9J5ASHUrV8CZ8aoL9TWbGCahNccV3F3oa
 nBt2Kcc8OuJdcZflbtItUFy0ab+GaWYl0xztggBgdlrH59a3M3bmarAcMcm2WOEzpVwdBVAQ+UJ
 X1yfdnGPZ+CgN5F5JOBRNm5WZ1EsRIbP93YHvc8SPbuMMqS1rhkWeNKlOa/Dmbn0EsfX+54cB0K
 eiRpbTrpTjJ7akhJw5qQpog0UlAT8bfyR5exBlqnKw4A==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] arm64: dts: rockchip: Enable GPU on NanoPi R6C/R6S
Date: Thu,  7 Nov 2024 21:29:09 +0000
Message-ID: <20241107212913.1322666-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241107212913.1322666-1-jonas@kwiboo.se>
References: <20241107212913.1322666-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 672d313b6ff4b179fef288a8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_132943_417873_E296AA5A 
X-CRM114-Status: UNSURE (   8.63  )
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

Add the necessary DT changes to enable GPU on NanoPi R6C/R6S.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index eef4851844bc..dc16d60b8228 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -218,6 +218,11 @@ &gmac1_rgmii_clk
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
-- 
2.46.2


