Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2971CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=; b=VjoUCpWz9f4x1NTPBfxNgnW9E/
	b3jxJNMgywwyF/LwK4EV+okZgsi0TN6v/K2iNlQNa56jcVurFPtfPYK/ndV2bYp5YUEx1ZBZA6Tze
	5RvTV5JwQBZCBdTSYZP3dKLQx3IgI6s3uBuErrZnPncr1UpKAUL8ySPcGf1WJiWzcIytupRo11Uq3
	U25QcUL6ZpzNO6u0+7+HBtdXamf1mjlsaU/YvLGMYWtyqMMC9tL0o/eQK6/EFo74R94GdHY3XPqNF
	Nn9kUrQQiA1Omdgm7rP6TMOR/BZqDE4tVBBy54EKaFQFVjxizwMS0XJ/psnOC7G8GbymOPj3RcQbV
	2d0uetuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHz-00000009tfa-1IAx;
	Thu, 11 Jun 2026 18:38:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHw-00000009tdP-3fjD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:38:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQNUP1418930
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=; b=eLReAkDqh7GSBx6+
	xK20IRF5mRcNLlRvEcUp0e3QWu4FpjLpKUl+SqlrxjnpJGUvc/PQMu8KW3qbsS6x
	FreFDqSjT8NKKRn5uksqe2h/jLtsogMc1OlJ4Yus7catu6wY6s5eSz7PvbEOVXJa
	t3HPUllcIxBaSNObfZdvHXsTHCh8UPdRQZP38xp/DQuBQtQA9HLn2/mCUwkQBN64
	O6Unn/nFmtPt0UthUFLr+ymQKGCmPKZ5GopyWUq1ahZATkzKZ4btyM6Lrsu1ItZ1
	hwWXv3srvkj7A5lcqSsHyf7qYo4W2P8OCdT1PWBE232y/RC8OoW+hIkHgBQ/uMie
	HyY7nQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tn5nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84256bee9a9so130634b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203079; x=1781807879; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=;
        b=hC4N6ERW37i0+MV9/RMwATZZjJvv8eNbcpm7iScj+1PNj3wIXUbLQjC8xQvKQdqR5X
         egDn3BIt5yozyjre3x4CjbCGV1DWVxytHjdCeV/dq3cmu/xJkyyVF3BTc+qc4aFrCR4T
         Hl8WCj3L5YFN/72def2tVKjqFHmihJGdEN8c1a4GL/wcvoqcXH3kvLhlLp6iKL644q1N
         Kal2k3jCOLYWbZqFvHHYQo/eqFse7WQuGR7C20wVqbg3dbO9NXiTXg6kn0zrm8hCR9jh
         Iv4GocJDkLaxoZ9q68wJ1cP6kvJ45MmHYFJdQg6C/S2faYXTEn6NXDoO1ovKgCsRlPu+
         zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203079; x=1781807879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=biBbKAQ/jliorbg5WwizM2SwHjL/wKeTUXmlyHGAeBE=;
        b=dXkvOz5aM3TZpFW/4/6uj6uu5RviQbrEnoX+B2m5jSq5b85LfN+Hj3mnRMEZsfzKyb
         R36d+ZccU+I0RaVUVlu2gh1yex8nKvh25hz11vd/hQ6AuH0R7t4GE+yDsKqtLmAh0z6Q
         iWZsEp6h/ipf58qmpfrl2xyZ5qB9TbMVr5imcW8twVTH/AV4DTTa/QwIc9nL8sAJmnFQ
         t0J0ieAY0y304ASAyfdCk+VpVgo33UK8UjQiD96LaEh9JmU8j2GClPKcinLrLJ4lQOTz
         fo/mpmvQOjaITznBqwQR+aJdfoZ57hyMkVhN7kkYMBCGtr9w4APfGDrc/k4LircuyYB4
         EFlg==
X-Forwarded-Encrypted: i=1; AFNElJ8EpeUF3M0KFsR8ewCnv621MqqkpIJCdyPgLDsXNduKVTPIQWD4VWe7PuXuR47xax48HQG8csB7EOU59jHnJ8RF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0/Fnn2qcC7rCLbjSfgTUOLx7+T6GFV31SdmxMWhXP7afL7v2D
	Dn1tRvgR+gUAHnnRtikRkabYIXH1I4xtiMwJ9dam+HbLVEcQwnbB4Sp7mJPK96UUTb5fgXKpf8h
	Rxe7XjVGbjVncnDZF6uJyHQ5EZAl1pmBxzKBxKJxGgB97AC+I57T+u58X/aPReexwE28p14u+1M
	+Mwg==
X-Gm-Gg: Acq92OGuSMf+TALVz4qHf93l7fEdlm2FP2Q7wBU550IPLJ67HxrZkSXobdHUHksE7Xm
	A4L7h5cXtXicyP8qawXozF7fnDRTO3Ou+al+YpUw9XU48zY1rHQXR3Z9KTtBI6FoVRLoqJT45Z2
	TX0LauwhSogNiucN7YOShT+Y47gekZEKwm5N03rr4HOdO9Hj2MoL5aQlueZNXIzgJdg9lSc8H1w
	8sfUF60nmrChPHo1xhVwmVGL9toSAG3yFIp+OFCgS8dOJfGnf6FnkDYWD9L2tWaS5IRpNLlZt9h
	lo+aAHgwo6ZclFbTmhDdcWA1Choe9FZynycYKcZBPZlC9ILCyixLNFvYT8/H2T5p1CHZxaAL9D2
	uhLm2n5zaCv5y/EEDC7DhqRKwVsb9pbzuS5U5l5h38LlCeVANT0c=
X-Received: by 2002:a05:6a00:3996:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-843367c80d8mr4776324b3a.7.1781203079431;
        Thu, 11 Jun 2026 11:37:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-843367c80d8mr4776275b3a.7.1781203078859;
        Thu, 11 Jun 2026 11:37:58 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:58 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:03 +0530
Subject: [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable ethernet0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3672;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=37UU7e/cKf9GlE3GmqWgcpRWeSVBORd1mW2l04FMXQw=;
 b=MhJgiFwQsYqNnejStdfMCaHyKzaDz3KQJdBU97MOITOsRWbwCfeLRz3OFGHS++DnH0f+vnXHf
 Ty6BeZNUQDlDwouL6b5BRIWwYgwZZ4xafmPFJxHHS99++YfNz4MQgiQ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXw8bRSouNx8T2
 l5IS9VAxlHoKb6c/+Fpo4ZWNKQmsvhuhu5DIBlcEsUX5wK2DxKrmDf++zYVhPuXCIjFsoDVXTid
 tGVkmjU2OjKQdZVoC8B12qnY3Yh+a65AcLE89+L9oei7xhKYtE0Z6dTtejMoL76AUM1ztQSG/dh
 1dxZ1dHRRPKzfYDkSb1qmTtsZxXZJOrf4heb0wt+LwY7+YPuBO8zLbIMbYz1FeqNC6YkOsBMe3Z
 FDp39e5+ND0Nf+TXMF5v3FNCP1FSQcrdx0uj8036GfhAEP122cnxa7LK3CkJotmlDYVTQ1EsVLI
 sBgWBHpfPOSvHSMmJ9SGJQYb5PXfV71nEsPz6UDYk6ILgT/JKnlkbBHzLIaYXQvOO2gTmCnCDay
 YkSnVIFPf6mjCvMKVWHF+pPcwVC3i9j8EantO0j6i4hCmPrbIyYc0NstT+Ppc8YDm15Kqaq45Y6
 ESg+o9sJ0RYlLuIloLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXwBWaZTtVOjqO
 0m1OYXglCElRmED7ZCYJAdvCa3+yoM0lCsvv2bkFMm22QCpAiZZxiVrX2kgJkdEun3UZ5sRsOMZ
 v+EF0TUqLs+J4MTHBucKQcSAIeURSt4=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2b0088 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NHmBdxLQdYzBWVokJz8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: s1q456PxiTbkgmEsTKA-LuFJ8Kla3rFV
X-Proofpoint-GUID: s1q456PxiTbkgmEsTKA-LuFJ8Kla3rFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113800_927830_9665EB49 
X-CRM114-Status: GOOD (  13.64  )
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

Enable the first Gigabit Ethernet controller.  Add pin-control for the
RGMII and MDIO bus, a gpio-hog to assert the PHY power-enable GPIO at
boot, and the board-level ethernet0 overlay with PHY and MTL queue
configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923bbc1fb5df28ab7899d47a0cf8dbe7..6a6bcd2e712a1d4db5ceea4733751397779963c9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&ethernet0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_defaults>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +182,38 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_defaults: ethernet0-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio121", "gpio122", "gpio123",
+			       "gpio124", "gpio125", "gpio126";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio127", "gpio128", "gpio129",
+			       "gpio130", "gpio131", "gpio132";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio133", "gpio134";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <149 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


