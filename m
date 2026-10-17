Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65695CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=; b=CsgtG/wglqBTdBolsabkoeygJv
	jyxF2q5hYibWgUtiPoQTB6sf0+Rgky6gvBEZnl6z8ZrZ5iZ4/qdftdkrQJRKO/Rv/Io4PgShBRBt0
	slG1IrLqS/57Bi9VpwzulGddqZw5RUBZ2tLFdyEXJsfs0AdB9nnb4x7TDUVtt2ilXxPTtWSfs/TAX
	X5FwOCNWBjPLVv8cJ1vDB2eFwLoDrugvxBd1Ifyl9qKAIy2H9m8s5PUIY6OqHxWsY31JSZx3n3c0s
	CxC8EX4/Dk6G1BWkkns8whVkaNufwLMmUQgIvNg3DdH27nB+I6+PozrbUTu/Uc6FggDuepGDNfTGP
	svdL5/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zw-00000004dgp-2IIc;
	Sat, 17 Oct 2026 09:46:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zn-00000004dbI-30Cv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o3eW390197
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=; b=NwjcBDmjGu29jXns
	Vb58aA/y0sRo+EF0p4Q1d5k98O2PAllHJYIw81HW2xQTB4BejGTAiO2Wj+WM4qrh
	NLNOakxIu4flI/kmcG6LioxxdAENSrT3p8YXPChJKKanse/Xw5V5ICdX1j608Kr9
	ZlmQPbaOkxBoX8xqgr/p1TyVYAhjDfBGYOR8feRBVBFundOdJuBs6mNQSDUTM+oe
	NWGg/5ztjNTxIKE7Ty7FHIiWWYGoiojOBI1Y/lZK0Jt09uF9hM5CKhXWaLo9iqM1
	NiLzsGHcY11FNUf9L+bDAsV9b13Vnv0IzMkB7HKNNP6TnoOWbZPI1AwYCKyEdUMv
	EhY5WQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838mn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1797360eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230390; x=1792835190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=UE4xrLU5DQU1QKaoL2We6Hbj8+SAjmDqHT6vcGAnSVFWlArtN6tYOtj/GZdVZlRQUY
         PRhfqcqDoDvfmubeURn+AeJKLHKQmSe84/kvBtKGEwefdRKsxmd2d1A/BM0F3vqt6CZB
         nj0MpWFX6kOue2RENM7lsYwN0CIu7eQfn94m/1ctWPHWNQmaI7Y+fMl0YAD8+7RdOWnl
         Ozg7o7VJX3W1yDiKsRU1GLx3cAa7IGa/dZJcZyr1F/mFt39ygARoXqcD/osgebf/7ZnR
         zP8ypBBpD/DQqPdrVnD5EK5zaLFUHSo5VF9jcTXjZ0nEeeUYeiG8MvvXr/T5gvRXrEn6
         zoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230390; x=1792835190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=vbIaRY8GMpt1exOxfkWZ/nBKILBtF4wz0fbEqMW1yOXarcNjxoOASWI783pmEjxCam
         l0Y95SjLnYpLki6r9yF1bUsI9Uv/1aobLn4Y63MbSzX/UQToC6ZzRoBtW1Qj85gVtIa3
         8lc0t0Fu5/l7evq9+IlHu0b/pTgXJEU9ctp2uYG0QuFj/JYTMnRNaAzsp/fy7BZO38OX
         Na76bffH0P6Qz3i2peeHasBxvSLvE1DL3qB7vvDboYRV9n7y5zmfEWzKCLibqr3CxWI0
         Jvpw9ULWWTcvIvaE+BEnexS0wCEDXvtO0UQKewcHjipfhIajYzVQQv8n4HE6Eupd4TMM
         UlxA==
X-Forwarded-Encrypted: i=1; AKwUvByBcxY0rxPzdsCIi4euI+Kv+z2T8iLh7Qn92Ike/ANqXReN3/DPCGesd+VUGuCZ6mqJTdHZWqrH5uzT6q5wg+zy@lists.infradead.org
X-Gm-Message-State: AFq9FYIb9SLplcUV03ppNAe07S576wqoHHKBQkP2sl8JrILZqA1kGSYO
	sLEybDd6FFN2H92diJar55KXvf/7onFqZvXxO+N6bzqB0mHXjTwUB10ocskFIm3esY58Ec4iH0d
	c/sInrsrlnBPwvR2Lyt5eAFzZUhc70mvb85Fp8bvFfcD3n9yVQepKiXyIIR/oisWdLFocmQZAjI
	8Nig==
X-Gm-Gg: AYBFou1uJ7OLh9NUw9wOJzvrXIM5SBkti9Ii++MwVLUhdOUjwBCW2rn0R8xRNQaf8xe
	PecbpGdm97qTeW20Xwv9kH5rkHrj0E3ftkdFQiIketwL8C6Zb00T9mkgfEnxSJX4JOyxIgYPrza
	jEFdwz7EPS3h8dNftxyGxka0dO/7MwSWkidOLPT3qkNteFzqEzZJixQKNZDDrgNMMX9WMGNurpt
	tlgjOmp+USiiWOgqL9blJrpEBknmQEkt2v9GSDy/YlvHQHJUMpurd588ByJEqNXLwcOVUC5Jylc
	4+eOQcCruYb37sXtQt9dRYkc0hPtpt5mwgP1UfzR9dMM2j0uZlqxTJCgRJeSG2kHpKBQE+NU6hb
	2t6r8YIo9DqS8HTvZyoFulXrLV3ix5A==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026132c88.26.1792230390387;
        Sat, 17 Oct 2026 02:46:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026109c88.26.1792230389755;
        Sat, 17 Oct 2026 02:46:29 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:28 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:17 +0530
Subject: [PATCH net-next v3 6/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1349;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=WU9WvsTJoNSYe0NKFnnpj0KI7+5RPM3wvLR4H8Dso9Q=;
 b=YkxYX4jCWv6bOW32Nmox3gO9gIrqjA0yxsz9GwGhNyIX+rBQotwK3iFIRxIbW+9u4xDe//N18
 hzfFOWy71AHA5eLdSoKSX6HxfpBZcZmxVAbJ2IR3PAbAsdNfCoiC3Zz
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX0ojxOTPl1e5+
 tTTUyRjKqehSWc5NwGeV3dTNZ64yKWsb/nQh4H6gdIEhwjpQ58P5Yc6pN7EueHISy6UpCj47LZ8
 Xv2S1JmqAT3rDR27DVAto7/X6eBESe4=
X-Proofpoint-GUID: r6UDXq-4bl_njaA8o-_sXe-EMxVJjqa6
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad343f7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5OA7xYdfTm+P
 6TUfjgmhmmHnW7UvSg2o657znhjQSUfc7ryRRRYmve32IqPoKzzbkcg+awBbujgpPy1W5L/WeJn
 KDvJ1RNsIwCnEG2BIve/+R5jfWrK8d4xsgQ940crYPDQkYlWxotMVxbUV/d8Z2FZOwHWeE1WnYQ
 J+LGmshXGS0U6nZvAzi5umvLWnIJj4SIpZgPc0LYjDrb0w3LArL+isYkFl2Lg34ZMUncrtcKlLM
 bYpktkzr9jKHbmqHWsiivzA+blf+e+PgkVcLKIe1xfaPsGy4LgJtqaXQwvrRd6taOu4wGgB1HWf
 GGFJZBhJZ0LIkJzLO3qMAsZS+7ZXznAenybc7KvrEGUea71EPq06C0q/bJf/p8+U33z06jJ4a4R
 l3ApTbrqYEND6HzFiyS95GeVg/c0uz2iilerf45Tm+7Pvp6mKO781bfwazsjCIIUtKu56CxSk8i
 mw9PcopuVwqDr5uxcpA==
X-Proofpoint-ORIG-GUID: r6UDXq-4bl_njaA8o-_sXe-EMxVJjqa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024633_211600_BAF2ED53 
X-CRM114-Status: GOOD (  15.64  )
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

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v3: changed fix_mac_speed to set_clk_tx_rate in the commit message since
that's the function actually changing the RGMII link clock rate.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a92bf4a6a2dbd987893bd4a3890df770bb7a7e56..2471871562ed9915398614d5c88d1c6673829db8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1


