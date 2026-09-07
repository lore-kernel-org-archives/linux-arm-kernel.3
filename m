Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B447AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=; b=Z0gvQ+h7bdoh+otIgtQx98IYGk
	IIP/iGckpvIp+ZsnW6REw7igdaA4YmO+PjcjKMhVxrhE6k1pz9hxUG80PSZLBPPYgD/KPg4CK4Zvc
	dC9WcccbpbiFWONNuzAdbIGvU40qrS99y+SS8gzkm8tEzp5vAeCVbJJM/aQSJ7LvfDfYS4nDtulva
	zTexLS2PFTqEJmlB/mYxbbJDS+xA5E14ItXRzryIRotNvHFPZ6L97Sx2wIuJkl5N76VcXX2Ep63NN
	YdED+oLDhpfxw7KFGZ1j2zi/N3duyWlYRPyyMXbkoQCjbuRy4NorImgIQj4xfGuKCRJU5qg/cdd3Q
	h0LRUSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ft8-00000007hBn-3trH;
	Mon, 07 Sep 2026 20:24:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ft5-00000007hAR-4A5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H88NH4183556
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=; b=o7lD6MeY26M1WO8v
	9ZKqJ7uMQagH3gzeQUnBdtWxeQ5RfAP5np2R0w16jZkuPezpH+PTHTAp6hgECdR7
	7/8u3EzEwe+XVZxcPYjXTQ6V8acwYo7kNQWU+D4ZgB3ymzTwQW03MrT2hshiLFY+
	wuomhCCkDFfYTt1l/3uVhiB9ilBcjpWNp2t9eyy5jYXMT4W822v8UeXr0Q7eFii/
	90q90l9ISJ08bfpWrXyuv73IMxPOXr2eHwZu+ROOyi39d5gy7QgZdYNjOBVWm2ls
	3zh+hpSyWIp6TjRMvN8gWoJ4i72Fl7QFcjNMoTwSy/WJ1UbmEvDLgAd2mgicN9Mk
	0ekCDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx28ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso7225895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812659; x=1789417459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=VPGSxNoAe8LZrGiCzgmzKpeYHPnWCjjT4VHkil/tMGIHq5zamy8h8ha7/aPmtiHZds
         AJwswqYu1upouXj5NEZVyo3YQW902MrFAxzZEj2MXk9syFE1Mvr4a3XAgXWz5WOker/b
         qNHJnYMzQyKr4BbQo29XrbqdwFD9s/N/r7/7ww+BMRi8WrD1MfW9huJFkNGuqlYIWRXW
         yLUVd9i3xTbjo07yL+t0Y2l6av4g4gxaUttLSDlOe99Ki2zHcmpAJJ861VxYmY9Fxobh
         7y87ys5NYrTvPvCe6MORc+fqL0/RKH4gi75FV8oT91cugOWWocNINw+BsD8RinYHOKwa
         fbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812659; x=1789417459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=qnuxRcXQr+QtLgzb5rndZfP1x5P3RSS6VGeIcmGh4zOXvfabkArV6+PSSraxEt35hU
         34GAwUPXEoDtv3D9HX/9gGtw0XcBhPng5qYDc2sYZFX8F/+xb3pT7W2hyGbkFLXriOde
         +L+A1q3ATk+b85gWSZmiMkQ3XMv4pDMv5PoeZphWfNv7sI6gLTtYsZ7B5epWzuPx97Oc
         Lz7vKK5uXAem47h4q9f4eHWUFBTM1QZGcO6fWOgaDzdk+qVx/k/TGfj60pZVcRvESjOF
         pieWIejXU4eeO/mjXGLLW+uZp+r1uLoHw74bPu1iX7t7qrvKnzvVfWT+V9XtBzye1vyr
         EsmA==
X-Forwarded-Encrypted: i=1; AKwUvBy3/CnM0h/zdsCb870UB+dh9ts7x3f1yM8pZ3kM/PzBAKI4ThKbkHzX0I9oEHeNq2W2FZGtuXHi2gE8894TWhqx@lists.infradead.org
X-Gm-Message-State: AFuF++kf95FmnCpw0nRJx0uLDSFRxvdZc+FFQMLmG9A401tT2TBDAiq0
	l9JEZ1R6v3IlpsYXBOh0gldvSeNYbvBR0PaKOBV19qkdTRlYX9AGBwm/R9ZiBWr9x0KSoRbfR8d
	TAJFYAqZCYFKR9dSYFuW8Smo1zG7nHgx4Rc6ISmfsDlv306EzaXJzMI2SBwo5JMlfZq1SDV13b1
	C23cFvDW+SFA==
X-Gm-Gg: AYBFou0Pf2Hthji84OQXW5tfLuhjlMDY/2GfK2RhPrWLbJ1HxyyZ+Ay4v5pu+KDgKef
	J+Z+ZLgIcGjQ3k7kGsMPGVWStSVLUcbkLfV84LA0Ug/UUYk50xQSwCQE948mL8ZaM3QS/The5xJ
	U75tw/YPL87KvyI4zXzSGHITLxOQCFVUuOaNQ5+hYipWdusfXKJggMCO8e6eiVuFDyvbObs/ezw
	ak0VWydZACXjfaMWlHn24VMyiylxzUEr6PCO4EabuRifvVh5Bh8QNs0OT7Gfx3mSKHM13J8CmHi
	JKRg4R4ukRU/oOP/aarA3xnD8xHeWZ7nP7Mos3EtIDQhw/xk5tQJnSrhwDvOvrw6WlZt31qkyGT
	rVwcRGd5qbFqKEeqUn8QWg97LF1aaXA==
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732775ad.17.1788812658750;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732285ad.17.1788812658328;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:16 +0530
Subject: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1916;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AH+qx0x4KP0Ub7IhYEI/kkBrCs/Qa/fQa0F1JhH3QPg=;
 b=U5M2VtaJtZnsRmWp4CktPyNR78lRXabNZ4gb/HF6l5Rtx7QqP9hm+vavujwv54agyXymDxysK
 jc5fEfZKW1GCvBMrlVtVw8Cn0R+P4nBWRzKjVpV/PEYH5ZGT4L5Xlkq
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9f1d73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Kj7BHua48ey9q7fsgX1X38sC3sR1DW_1
X-Proofpoint-ORIG-GUID: Kj7BHua48ey9q7fsgX1X38sC3sR1DW_1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX3Q/BaSIUhEDo
 xDmJCEVENpOxAlXmkN+oMFDZ8VYsV8KNh8/ecQytnQzfj3wMG4AVvT+bwTwoJ9GGx5O9mqwSr0h
 16Y1+4La9bF5SNgWUczI5hwlEXuJGYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX80d7ZZCDfMjq
 zmK3vRq9j2+tSQYDR45B6Gl4yy8wNha6SEf1ZBEYVkOIJdKx2UA/4TieajDtJY+FXGrEs4IuYHX
 EV2hmXyAA159mBBANDatH67VdweUP5cRO+7GXDIA1u7dr61HO5HRJPVf3cnmWm43qsCJoDxEaUI
 6hZINpFUBb9uusUsDqm7dXX1LQiCG6vWkbctucXVF479OdjlKnIeNRzPjx188yJ/PAikDnwQ+5A
 Lg6vd8AV4CurNAR2IlHx+w9f590KCbWk/Y2XaoYTemLJvKRg3GW7N1TL9+OIYWtHER3ijmsprbq
 kPRgUbz53L6Y8hiwJo110ml63xP3f06wkc1HSxNQRmENWj7m7G11WmkXI9PLYNPjQGZhfanbg5f
 IZdObwBnVtqLzXbg6fAgPV63c+tRcfdVIFoNiqkeiIKVIi7JyPx8pW0mXT7caCBnCbS/uHNtc28
 wpEsXg//WavjVXUPlbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132420_050304_B98D6F1E 
X-CRM114-Status: GOOD (  17.03  )
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

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


