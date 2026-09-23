Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2DCC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=; b=pmqE+SX+ZFTxtonpcmfnIJk3CD
	q2n7jPyvt2GYvaTssvVkO0gAE6Op+PCm/ZMdD+nmIQmju340QnZ0Rd2M0sDh9VP34fjGv3Oh8quTD
	j3ec8IondTS59Ul0ifXp0x46lI8WP71Vjjs/S04qqPGjD3/nCqeiY0VsRaVcc3x3gCsGqWe7B02gh
	tLqF/0DlQWGMoWGjXwFhU+IH3uILQshcXAaePZyXIePW0A16a1FCFLsB8z9NVuV0qWHRxiuwHDJWB
	ZWgx91zlB1ePnJn/IgnoCIhwUVwVo561+oLsZF5uYIW28w9Hm93z6h6EUEDcUWsbNyHZJKNJqV3jv
	+ziW7ycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BUE-00000006pkO-0MKO;
	Wed, 23 Sep 2026 01:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BU7-00000006pg2-29DT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:09:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6uZ72033224
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=; b=F+gUVo5QvSVJHOHX
	ZC0XibfkbzqKvdPYhB9DweD9Cngp8njlE06E2oWZ++EdQv81quKDpY/gfrMyyVUO
	PfiPZtEFAcJC0UsiLvmKRKQN2k8j0RV7Le8repx8hDPfeJAMWiSCjGxlMNxPzOZY
	yfrRG0vwGz7bNfA7cTUam5ly5lKlITDfEpB91Ghsz2Z9yhlu6c5zEr1tNb7J5Zho
	a7Tdy9ULD49WR4et8Ty84e42ZLSZJtcrp/rB/W0NVRGC/xchv9J7GPEaeovS/9Cu
	74TP4aFlexjODhUZ0dfWzymv2wzLJx53XDKFQLhOuYh9ms1gSrV9EqPnxHOcGnUe
	1VqwjQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c1t0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:09:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-331b2ec616fso1497823eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125758; x=1790730558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=;
        b=Q41BEiSdFtsi+41WJk0FNLGK6n798YVVCNFXc1eJsgggWyhzy/EzZKoZL0IQfJNFmb
         pqcccAhtl8NXae65Ms96y9xETmOy0V4FZoI6kvmC1dUOljz0QI4FC4dmrkLdu1QgWwgz
         8ua8gaAOryE93F/TPC7T76ojMHF1Od7hpXjESV29woO0mumqICsjnYxAKuF964xVJ6cG
         TISTLINPGByptzTopnU2T2zlGI28Oub0grsV0uE7tvoITzj+rTRLyGh/RGZJMATGrmun
         gmXCdLFE5WUWtqvyWGwX8StfA1iBWKhmBvZvLfh1HyTPi3FSJTi/CLtutyQWs1QNsDoA
         NoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125758; x=1790730558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=;
        b=wqEgOU4KxY5U7E6T8ZWWIPlqMlZ2fSqcy95RiSCoSFow3FomW6Qh+R8PmWvJp1FqPL
         LXm6xiUm6rHF+ZXAimgZPYknk3OcFj/szhFjijSNYNlsCCJL26GTmlPGDNaQjOB4djXd
         lOYyuj6HrEYnGthtNXdNvcz6ScnSYV/jJqbcQEofI/y5zswIAQzBYZe/zuhNQcx7dqKK
         NN21Fm0nqkZJxnMHmeVjaDU2AMvao52CVM3lJNdXgxPyp8YCyyR4nvyHivddATBdwH/0
         FQ+wOOv/CKNcldju2rkPUVHUqU8NaJ01yc2BoZsuix3B2FYdw9H/zXCIdpIdVGK//1q1
         9hrg==
X-Forwarded-Encrypted: i=1; AKwUvBxVPFafBNEVrpYVLYoTa/PV3sHFef4D3K1y1MiqwDVcecXZ4G4bp8kNoHQJFt+eqVwLOfzlMGmOmprm0xVO5cxl@lists.infradead.org
X-Gm-Message-State: AFuF++nZc7ibAU6PomI/mkZBN+x2ckj1clViD0Sl768wM+XhlT06hAR1
	ZovUC/IYf8R/eWf5hiVNx8zqpLqucnsWumk6wqT41/R4sbjg+esJkT2GP5BAs+t28B7ISkPGDTg
	bQMxtptywuaU2hJU/Rpd1dHoTGrFtkMbtrX879XqsD1fCMnA2cWBNmaZJxCDuAX0P3Qqj1M6LpR
	RK4A==
X-Gm-Gg: AYBFou1wM0dvyUBUcpqShQodJsD1tsFUV9iA3ezr5uW/Za+U7gxUVchoBLX6vNpJepF
	o0owwDBgUbMg/BEw4o/XySC+gUYhyhfW9oXTz8JHjMxaKP+qDhLMyPjCoGO5fdrIqgT1XdYE9wM
	eNmNWyzgnXtEC3LeawJyUelr0m4SPZb4OJCP98wfrpEqrBlXOW2X4ZxBj4IGFqGtnRNn9u0CYkq
	a/bDKjCnhZ5oeLAtQhqZAStzECaunophmcxWWJNEEK5wtwCMGuL36IgZijF1j6HZyFhQdvsrUQB
	qW7eZn+NdwkaIgQEozfbbWiPQpyt9qZa2mvcxKdXknZHkNZIUtf08DEXnVIdxFlPqRTSPFmXMwB
	prD0RznnWYVWc7/n3BRblmoGFJ6c8
X-Received: by 2002:a05:701b:4251:20b0:13b:3c3b:8dbb with SMTP id a92af1059eb24-144f92e1ee5mr1179666c88.23.1790125758284;
        Tue, 22 Sep 2026 18:09:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4251:20b0:13b:3c3b:8dbb with SMTP id a92af1059eb24-144f92e1ee5mr1179627c88.23.1790125757807;
        Tue, 22 Sep 2026 18:09:17 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:09:17 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:34 +0530
Subject: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: support
 external PCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1930;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LAj5wFs1I2UH5hJ13rqJNCQ7NMV5AqqbqBxmaYQgJ7Y=;
 b=S7vtbiqiefxlbFM0z0Jl/fHy99gKVoxAVcyz1bdUtdY3C1YPU2yxhMAQjFEusHLu3GKoZtzIy
 MqIesOTniX+Do4jykMzcZtwr1jEv2oipCUGo7KR+yeCQsri9K378CaB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX/srhDa6EajZY
 pHn7KhHsLbxr25gbTm/ePrfwSZxKuKXP0R7KzYOGGi32thzVgAF0XWlVTp398oz0ksBmTeq7Ju8
 Cir+iQb+UlRnQBwysPfSZaa9uhpIV3KpU6URXThyQlv1kEc9GQtGRnrZqX7UC9QmwZJTMYfV6P4
 Eo5WjgbwSO+sfEmeWacj6bgpiHw8TFmEb4ZfydNlUmKXRjE+VJGZ9aVzBYBZuaracPSIectKspW
 NmgxVrteySn8lkyUaKhDWOEmsch9YZ3v4hFg24GX6UUv+ahFcQmj8clo6qkaidnjwXb9d0X/fsI
 qtvfLTb51Z25NjRm1LQzRkitppKMBlG1WkRiHje6Rg9KI7TokpaSmPoG36IgdbEVsFi+QBjRBQy
 97PmuyUCIfBpocojiumX7EYbjxfSwLlNDBc61Ltyexw2RAejJt0mSL6vPU3ZrtDCfebM9NLZoZ7
 tk3fH8AnZiVOS8B2bLA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab326bf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yWFGLV7Fs-RTi3Yw6F4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: xeG-PP5nad-_R2nMkeFCZMxd7ENzSJi5
X-Proofpoint-GUID: xeG-PP5nad-_R2nMkeFCZMxd7ENzSJi5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX01sXJymiN7kL
 tp3HGxniK3iAmUglGIbGxqddk/t1qz9MrIJyT0BkEd6wssjWWXY5PcFs0SBS4Poti4mUyezbArM
 3R4obADzKdTxfTYvknJvZ/+0WQ+Q6LY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180919_574078_761B47EA 
X-CRM114-Status: GOOD (  17.57  )
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

Select the XPCS instance initialized by stmmac when firmware provides
a pcs-handle. Reject interfaces that are not supported by the selected
PCS.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..a99a78880c0fb7858e90b6212b37ebfc7fccaf84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/property.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -681,6 +683,21 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static struct phylink_pcs *
+qcom_ethqos_select_pcs(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phylink_pcs *pcs;
+
+	if (!priv->hw->xpcs)
+		return ERR_PTR(-ENODEV);
+
+	pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	return pcs;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -794,6 +811,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
 
+	if (fwnode_property_present(dev_fwnode(dev), "pcs-handle"))
+		plat_dat->select_pcs = qcom_ethqos_select_pcs;
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 

-- 
2.34.1


