Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E91C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=4AO4EfRt6vzEF24uR+BdZg+aS5
	ug6vQQAFtBJaU3FRl4RyAakZGCnm83BzgYaLi/5kA+Ss1LIqW/gW2vNcTvXCAm1ZCS9wKTNMrONR3
	CtqABCi7A8ObVNJVl9SyECl5oju/9qLo3ZGYewLc7jawsKhZMmkwgERTFG8yfIEpn3IcHKZPgkJ4E
	khHW8D1Y2677aAC4M4h/+UY73xaDYHzUNliOvVVJxodlljmFkGsI5BDRmeUDfzV6eb671QQ1I+wgL
	qR2Ybj25NOJIqvjm7YlEaDTdPWYY+OHkGRRXjuoICNSCQM4dhut1Z11Tj4T8NWHPKNNAOz+erIJ53
	Ojx8CyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ca0-00000000OgB-2qw6;
	Thu, 03 Sep 2026 18:54:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZx-00000000Oe0-41YV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G39uk927750
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=RF7LQViKx/h/cYdv
	SHckR1mhFiuUegvn26a0UMfpuI83lVwa1rms8Z9Nsya/OLlBj0WjJxfBXkTg0wiw
	SU2N/LjYm0RL5Lc+FuIvKmLYq+RyGzBw05c2VygbOD2qe2FU40BP2rfhk4fgmyeI
	KaGhYnT9UbdNI10/Eu1Ivsy09qsiclYl6RE1Z/O1gA0d7o/6LTUF51e1hUm6eAtn
	oa0YzdAw195VQnmU64L3GrbqwvVXROJD839nhtwaqEMjPviNAS+LMrjQpVwr6xih
	vzxgwJh9rV5Vyis4C9qlpAXBgZaaE81PccemcoXmKMZmw8GK2yh0bdRdBJAB6cWC
	CHXL5Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2bt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d292eac1so241911a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461668; x=1789066468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=CNsgSgpcD6/Pz3S6iIKxuR3tjccRb7xBaifRvqHMOc5S8oIylK0MOpVPH7oNEll1kC
         r3bzlMjW71E6VJ7zPWhRr4dW0uInj9GrC1Wlw8TLQjXlmFxfCJ7jnimRrSivGlIQFByj
         poLX8IBXZhlrf//gJY1hKhJ3VhPkSHY6u4U6POW6OFxdRaBUWhEK8mqRGKALl3HVlMFD
         q6z78u6OyvTxUMbJWgse39krcSiIhjob/xEYDZ4rB9tqJrZoeZSS1Q0XqntCf6PbUDYD
         fx+/wYPmCeC/At+l6E2NK0JhBGNDEVxd20IyZWv9LO559UPMq/ReRGeWls03hChinuNE
         VWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461668; x=1789066468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=md8XRii/TANCnK4KN/onID/uH1mGISrWkOLePJHay5PqcoSWIhE+ohVkhGTM2+fziQ
         JnDxhBA7Ox/MlqNfP+VpUkcKnKnL+AQi+nPdFg6PbRNzCbNC6u/Kv+Rm4WCqzkVpSFax
         c0X9v4XcG68/8rO7xtoS1kQN8dpfX3awqXJ7/SbqegboJSdgaRDohnq59fcvZBHs0hSV
         M6BNCo7N3Je9iKfdV74pW/DqrNdNNwu0jbnm51IG+MDdcqWXiFLajoMZB4fOarLWZ0ar
         HZKWu/eT8MMq2FnWDOC4PT55QbA+cEubjcGBarGWqM0NQChwlTrJfP38P7nbxzDkzmBQ
         4MzQ==
X-Forwarded-Encrypted: i=1; AKwUvBybuXLnKmzfvKh6fnIKiwiDIkGSurzvhnyUhaC3QKhPb24jyXMpZNqsjpOdkptQ+qBkvetWnd3iTPwZ+028Eywu@lists.infradead.org
X-Gm-Message-State: AFuF++nxafL+4PXZIIBWLSRAZRCrdJE7r1ayyY0U6/Ke3701NIvLyAqj
	E47BoVwI7oWV7r2fIRToZCUjka68idnmTWkYym3DZbY8U1BM6Dx3s/x5suGG2ddpoKY8DSsxYkT
	WKilhtcf4aD1ucKe6yVd15v0QTK7mpZgtUYaCtbzaTAwYp0s6rn+FcbDySCVbiO4OfgTt3DMGq/
	1Ljg==
X-Gm-Gg: AYBFou1mr8WxHVkR8u6O9uym3MKg+hlZORODJUYkVRO9fZYg9WqYNeeRh7hzxmsd2xq
	44xfFO1D3qFdFs66tVtpwQG7TMcHkIePFyn4oscEBCWED/9nHls4GRfyOQZa9Fhj+uwcyCdr+6c
	lpuoQ8QL0qF4Rc5uV7RVFgecRcfGwlmNl8rt9+ulU47QQ2gD+oxADDSY3CRVaU86kV8l4Qwj3KS
	5AXwnZoG6Cm1eykj+JeIAL1bljtsNuKBQ5Lj67Qy76MIWkvZdaeCotDI5spTpGLsVUkI+aTx8/O
	t/FJ+ZvTX5pbCZIm17FdOhwBpG57JZVkkTLtzUsLcxIZyHNuMuZZbcidoiffaqjSbf8s5aIh3m1
	7KOOmViq0eHi36WfcyKeOQh0nXvg8QQ==
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr725703a91.6.1788461667852;
        Thu, 03 Sep 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr725630a91.6.1788461667387;
        Thu, 03 Sep 2026 11:54:27 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:46 +0530
Subject: [PATCH net-next 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=eVFEzweOdFMUDglLnNWnuYLxu4C0abjkapXwb7fyuoQ4PkeZeApXpsh5hAGeFCRUiHhYQuDpy
 fHZY6wwVX4lDYrfI5Eqfjlapel1JYhXvDvXf+yBhUAD3eN9YSuBvjCW
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: yfRRucZGcRbzcVHGSP6IPIIBuww79jV-
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c264 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yfRRucZGcRbzcVHGSP6IPIIBuww79jV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0p+WJD8bd8mO
 D/2GhRZrl5uRtcdtLib4XaEUwNGA9zqOxsjhKKKQZAIn7eJUxpMekT1hT4IYGkX4QM6hugq9fwB
 HmXpjbPQ5bN02XTkKsvnDuQBq0l1p6C+461jkXY89/dMDIH754zk1jW70yFDv/hF0Xc3V7hgF/P
 PBKZx4a4IT/eY/rOQeTKKVy/teftLkX+ttWwNt1cPeVEq6JL9+zz6kkRzvaxxZL433FvkOhtoXJ
 Ew8K5uMBtfJA224jH0BUxgQ4XhjAVXzIoft6Q0wDWzKBwwpdWfJu0ZcA3ns3pJb21X75wKrr8x2
 TmKis3NKrttRTphb1AQHlqzbslOCFnlW5EpXDBTYjYqJSHW4cCqrBmu37EBqqRKzkaqQZ2JeF+h
 JciTs05ydxbnJZqxmwjVRPo2C+3WpVAbyDnSkAAsfvDM2gTMOXYlDZMbm1H6SVaeLe8FkyauKhb
 j0QdNSDtdRabkVgM8OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX1uqaqm23MGkM
 OeYA9xHRgeHK8AjRTlBa1qkCJRCJrnNPZXIjVnY1kcBTmKGsC/yfxUlvawPsU6SQj0AsPJd3r6y
 CHsqGqfB60iC/ddED0g8iFYiH4vVD5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115430_120384_8D89D4FA 
X-CRM114-Status: GOOD (  16.48  )
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


