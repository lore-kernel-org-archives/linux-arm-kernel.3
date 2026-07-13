Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7352C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=ogBBbEMGcQlyxx8WQvwNSdrRYY
	E3Bl2PeaNnBmbduWSthYjByoNbuUTyF8EwH+U/BAmYwktMQgZCY/p7C51aAg/a6YbXdLpsHOVLUnC
	h2ENQrwwnytVBLIZw5pJ7RBZKMsC23Rvjeh6dlbw/F7vjqd5TjKlyGX48YLeEudpbf3jog65Jsxoj
	DtSGHnxrxtJ+cHIpwO7Qv7gVpok6ULJsQKuIgY08Y4RuYF8rCilGNeLuGJ0cuJGVwhJdLBHTSE4Od
	egv6Ia9lWhLRZq7oYrWUa9DFEE3G04ilZigVe7eh4bXJS1mteZm166uvvtnUrRCysnGLA+QMKFGsE
	8dO8+XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbE-00000009MmZ-2x2i;
	Mon, 13 Jul 2026 13:21:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbA-00000009MeL-0Nki
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDVuc1299276
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=Qf8msRCzFf3+tHNz
	SOrsHJEPxq0uRMP6T3kvWKfsmoQjWYm+Nj5IdZSgZkPNmsX+HEzLlh2JJ07ihf5N
	mko0DY98giBkts0M6oLnXVXDK86/6BcvurPiwX+0Oz4NdrJ0vvdVbea0tDnESH2l
	vnGrYeCsYkqpzINV+eybonxT8jHlzPGK/rI8qIfPFQ9/TN6FauU7+JfgvqwggXrZ
	HNoKHVWu1a+AZ4PauUxMwhZd2XCe/FTJ0guFq7zymqxbR8SKtOflyczwlMckFF7v
	6WOgxKJStJY3SWa/67PFYX2EcOi3J+BwVj2X6XiGuYy6jwpFyePLlGxSs+19WNFQ
	Erw5uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gsvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so26695861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948886; x=1784553686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=WPfvn24bgiV0nns6XtI5BYVpoAr7prAl2s9uLO4/ny2xwiF7NeWhpn/dH87FBfcYJk
         KV3273bo3N6qkxHk7reBCxPmE9kunM1BCEThAJU4GTela2N+cQL6ogQfo4usm4cWr6sW
         k3uiEwSQnQEC1a3SB2z6FcP6+i1PWiiDYQ/bbQCiqk5RXSwvsPwe32ZNxS2YudjNpblJ
         9QY3iSBJAgRMI6qdWal2dihVUspX/R9TqxHQlNaD3o4AxwzEqoJlRj7TPcx1c4r+JBMa
         ADRlBPVRVO5VLjSLKh0/DMZ02ONTCsBnijCGXGCGYpkRfdzVObvA4CgQYMXcNOakQanK
         PsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948886; x=1784553686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=ZTwJumqztjssZNNJW2n4H9hLhfvWJfacLOd+awwamW7yjKKKfvtpGkLe5LT27mjrPl
         3Cp/gJfuVndNmGXuRzlTcmRbkaTsGPpknNGmglPbSCfFk6fKUWEN4sgFXs5aM9zm5ynW
         coQYmRgZfycvI7erLudgWiuVuwh2j0J1lk4955L6QVayiHy+ZcvemqArHDeg94p5ZdSY
         MtrgDKArRY2wjF//PU3dW44m5qfl/clg8shs+DwXRiZiF9557h88p5Su/IHk1sOJXhU6
         KKq3J9zxCIhCBzW/xtutUSXCp9Mdi9c2EJz9zhHbaKlZ7B+B+l7ywHexrVY18+nPuyzS
         b5jQ==
X-Forwarded-Encrypted: i=1; AHgh+RruSwChQGDJ+49feTLFBU+7zInrOR/3aBYw3rH4lScAAWbcyc1d/5C3OO8C/0BRxsbUZvdCRh7rjOtPb5c6z1aK@lists.infradead.org
X-Gm-Message-State: AOJu0YwPr7Isa5JVE/tLQugg1EFzhr21bM5EbnB34y4UM9DDVLgMDCDO
	TxJZ7UxbiMKKdzbePsX8PQX4MfjowuWqPXhbKPck6AbzswJF4KTM8D1bXc8AFJBubdZ2wG7PWz2
	5bBFPMARX09pVHgZH9BDr0tPf8Pv0gKKQbcwm5e3b8YSaWg114qOYdcYD7mAnUm7IOYxJO+fdCn
	QZhw==
X-Gm-Gg: AfdE7cmf9l7JabjAbtGyLNetmsBm3bAOMjFLEcVBBk6NequML+cAtknco01zvWUg+9C
	poD/NPsHhAp7iSENJQl6D6pGSf4J0lHuD6mJAjOkhbA2DqKMPmpx8a0N2XOATED1oWdBHQ+HwVj
	mc1aCNlDExO1RhSK49/gTOX+T3yw+kRAwd29fTmr8q4Ot8+/tTCHLmVkN2KS0PbIMH07yBuihEG
	5zfvvrlHZiypsco8JEY5ZiYyBAmztr3CIcBsF5b82RtjjDXpr4vqBgmX+zMHuIkQUdb7d1OhXLa
	LKfnYsf+NeC6UAVPu6dsUmOK/tvBB8rJ+1vrbPqvRWE1GAMF6ZPKLy6ZAI43tCUL/ywASfVOivO
	pxgl9S2x4ORPxrtnKvYW2/Ieq/dfZ3D2Vn2wGgofV
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033821cf.33.1783948886536;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033231cf.33.1783948886012;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:34 +0200
Subject: [PATCH net-next v13 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-5-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY4z91onaKk8EZSNQidgZf3zEywv9nc+nEcm
 240LzBDxc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOAAKCRAFnS7L/zaE
 w1ucD/4m4/PTLJO0XMbU6rkRzGWtB4Ml5ByIwYm518Uxusod+xBCfBe/O98uwt/UkUh3XGQ8ANN
 PIwNDFrrG8qsxCqfjFpvQxoZeidLrlPt6STp6j4p+gOVWdTto250bumWcxT/+P/vbSwzWLb8K2o
 6cFSLyIHA/KVYLxYYaUK4wesPOclMG6Ze7JPku0PdKxtQ/aYWPttEUv8xvzheabI+0AqsX3jARN
 dF82kntlPB75YooEAqaQSswWn8lhbTd9mV9gGsna95JJgpwYnG7IZABNDJykWuEYtHBgOI6m5ia
 VFokjS4/XDjphp4oPxdgqxO6UTVh4bdilWU7MaWdLs0AiC3oAUSSmoSZm7e8IrXx68LVIF6IqRX
 geK39OIcIChi4YwyEGny8GngvKdPtAEmsZwrJAuM4eecviRJIT/Qc4U+tn50CpYV8yQ7xjUwfK/
 D1QN1WSBE47QmmlUlzo08joi2AujLXtNCV0gXTaIHdx7njErkwIowCqaFIAMLsXwRWW8bl9hxC3
 CVsGSMrvXAGfbtG+MrMpEGMYwLuL9Hq/VuTaJn14J04bNn2FmNLIteRt7HIblRGQoZhRQSOEyB4
 F2MOTDosGkq0ICXPck1d/CoYelm5ME+EOJZSGFax3uvDX5Lqfafyjs5YHpzElofYwX0n6WI9Ojs
 uyMFYwSxO43PFPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: j5iiSk6tIsZ4i0qd8kE8TW5--LWrP8xP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX4vD6ND2Rhqdz
 OW78syfd+rpv/2yiK5fgIvpvu5FVkalOezHzGhYG5Ylo313YxGrAkrXo1OY134OFqp5tWwlOAag
 ceUCQPHjN7BeAtBnI6OBwXKvTbSiCrU=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e657 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX50BXSFzRfskj
 IK3Mk2WhaimbUhFPjBy+zthBsAgyBfyVOEas+Tjf4QQNHquHAP0uumMYC7iqSOMsq6VyNVltCye
 vNgjF2NAKqcubo9giOWyyWi+/IETdOlVE8Ss8pK16hFdje82MBW0np3XG/74HyUbH7tNPCreWKZ
 G7C//9USXY6mzqrA/r3Rg00anieR9LS5Z8cQfvcE30eZQtDiwQjOqVjo0drrrFjgbhZ4++PIX53
 AjJ9YiQUpGXt1euJYylFJsKmzsja/+gprtUS3p5zaCkC/zLiqfPi616uGuT77XwOtgn/bGlCP8c
 HJAjjwwdk5H5HqaLIUNO1iLNF22oA6dkPqy4gNNjc0Kr8OgxVmh+8e4T09tRfK5kZeENDXacl0Q
 joU/pja8zG50wp5aMlVOXkQaJkdRud3xYyEwna4uvU12R/6twu6pncWOhAr5X3d0yYewM67b7gW
 e7etvMsDKTOs9sWR61w==
X-Proofpoint-GUID: j5iiSk6tIsZ4i0qd8kE8TW5--LWrP8xP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_062128_184892_0AE83892 
X-CRM114-Status: GOOD (  17.96  )
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

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


