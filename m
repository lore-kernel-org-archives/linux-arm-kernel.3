Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668ECC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=; b=GTnL5z5/T45d3ukcXRyxcwEGls
	N6sfEx1UbJoKHBoGaiM23hoyW/0eR72/kFkMXLLj2X8Q1w1+PWGU7umBpHeEePRs4BWupTBAyUBdR
	vXVHWAvLCDV73rBKWBtPYuCQlpRk+zQ3b0ghLfHpVXQnVDhh5+r9Xe7rUDjnKLloOe/Vlr1kJW7U4
	S/CblOoB+6AZJ3NSI/6F+JAkN4yHz0ra2jdc4jvSVPicJfNIlBrUrVfFCFa99Z5HPtXPzVEG6ISrz
	QXEKKsv4RYs9npklpqYS2vvBlexoWl5E3G3mUoqjF4TJRqogb66NJ7YzXcyuhuI8ivu0wPEAom28T
	bmkktDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaN-00000000OvM-2VCd;
	Thu, 03 Sep 2026 18:54:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaL-00000000Osx-0wk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Zwm1091209
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=; b=bmhM9tdj2jqm7G6T
	27Y3mutqMaRxG3zMDedlThsxvqK42jBaeaD9ofSNEXZylyW7zziij+p9sQE3W6qa
	4Wre5op4L91Ayjk5OmB4+dQ/E1+X1Yypho6rrKkkuh0zxl14mOEhvjl5NAqDt8UH
	atuN85rTsNEE9Y1uAHfKrT1zCnQaG0JvNdVvF0MwlCFtyZNhaKcTxe9RR9MXezC5
	bpMc1zzdJRW2cwbmjKQJlrd9DuxFNDJAEQzPxhkWb20a0ofy6G6oDn/IW2oYwqd5
	/yMN7fpuXc8NOvw9h2bXUFATvqW5CHGcEW+beOTI/9KcrhtL1HbUb31S9Kw4m1YZ
	5flx7g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk27c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so195639a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461691; x=1789066491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=JsIm/MNvjQj0f7T+n1n2dioTiLuyxqvj+8UOlkuLV9KKSmSmAjhAByI6HNyDDWR7tO
         +gfSFPFfxQANNa68+ZDBw1Y2rjeRDHzqWGlu8Lk6wbv0s7qav/ai29xmMrwHsJvl7V59
         eLjP6fRzKm4Tu/RmpjCCRxI0LvxyMQ8fOFIKkCC10+Uwmj2l+ae91mK8qyuxSo664tN3
         YGBdd7ZaHAyubQraK5jERVYnm7ei0H8bFDTMF4nZj94biFsyL2octwYIvk/MnjpA0VIC
         HBMJVgjpRFeaC6eWjrj/SQYKsxrO8zvBjNhN5hLdNf9VSkCRmBgA1LyNE5uovaNxw6Wk
         HV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461691; x=1789066491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=fgtTr1gv3xEJCeCZyGfGezQ9o0JiG0WoNr+xH7Y0Tfb6loB+UXLdAFckwySuR5u4+k
         ZLZdQ9OyBLHIA8h9TgY+KWqN928NElGJOS4nNo7+FlgZQtzdzc4Kkpkevo6nzTxP5Yo2
         lTOduVr58/zwXzrp6iAwFA//yqDd3hZF/OCr/Cmhc338LaL7a4seM8ZPEwIjl0uSnucl
         fpOlM4OPxZmcG3UpsdiQlx3xJqCBtjnwSG4vPAa/3mALXQkoUDouBCsy/Ygc77DHU8RS
         4bX7TeSapVsRr9KvfeVFkIeZ0GSx8OsaWUEj0hEK1OVVs5WrPf5vtHusGrfjIcncC+CR
         cGkA==
X-Forwarded-Encrypted: i=1; AKwUvBz0posUI1SeW9ZplZfE278KrRgGpTVYxzgPVHJGKSDg+vsS7/QsE/DCcBP3TjI96uEf9k4vv0vio2fPrXZCiMPF@lists.infradead.org
X-Gm-Message-State: AFuF++nS60LITEllVFcK9AU0nhv4q6vs//wSI0s3bg8uwmXei9BIr3YG
	Ih0HA0BV7rhQ3jIxUSQZXthoVg+WluTwj8I/VsUJ7mcX8OZ5isIwKLgZ7PbYTNItQt3XSTLbwYp
	8LLftVykMXZm9oJcxviewzKbNVbXZCzudURXFZQrXbelLPHMB3/zGrHTuXxpWfwHadoLBzqTO8K
	ycow==
X-Gm-Gg: AYBFou3kMIVuFXq04W8HdXnIiq1IZBQaj5PCZYCGKICXo7GrEZXZu8Srirk5mLCDOKP
	CrW/K2R78aJqrzMkM4Lwjozm9yyzJ1Us43RrDxDt3MWeK/k6M2PwxizScOVwhFSZUKkGaWCGJb/
	yYhgcpW79HnzaCMkK2iEYBPHivL6P6qJsOoRFWjNyYnif2IoOA7l9/rPO7+Z7JzCbDmkkxWiElB
	r6QP1PzY/RoIswMeB1kjW0FEPQaPVza9CudU6CHDExXbwpRBjp36KF08+7Ougi7lCSpeIvCZjNR
	4rIj4EOnjFc6yWSkZI0Rab4oHksLCzg4hWoHk1zNUKpb8LsrIGWBEShxYtV7BrtsML9nulH5f0a
	Rhh27HArP8nYAPPIeCNlFxJ03KE3HWw==
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773691a91.6.1788461691061;
        Thu, 03 Sep 2026 11:54:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773621a91.6.1788461690575;
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:49 +0530
Subject: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1138;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=NBTqBhye392K1VYn8d0VzVca9aW2/O/mLmzqGu6EcfQ=;
 b=XG6OG86F6AP75Xr/1HV4kKPEVE9c9n7Ucn6qBz1XILjvZck4+RuFYA28UG0ao+qFKjm8Qgtgo
 YOhobDDsRmVADfjFTp8bHa/dwplCnyCgS1YL5fI1Vv81CiN51J51n0j
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: FrLt1gGrnMe8BxgfDUa0H8Op_U2fjnLc
X-Proofpoint-GUID: FrLt1gGrnMe8BxgfDUa0H8Op_U2fjnLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX9Cg0HH0yill5
 Q/M4fAiLv4j8lOvX7OO1xJLjSXg9roVnTYE3sYRm6Avt84b/i73MJefbBuD/mLqs0ZnwccneFj4
 e5CgrVF1NuL7TinzpK7J2GSHPLn+nXOVxpJNeR2wwNtea0wMhFUL0GM60baPXvna7trNOY4ln+C
 TaUpgBXllPW35WFfrpkqQpP34QONbqu9luR6TaspyOQp97q7qkoqq8RlC7BzY2pym7SMbOxEK5r
 HcIcwy4/AZo/M28isz8ck6ziKGEpY9ViLI3bSsU4R17/Fu/yPox9tmrX2WwToEfqUYSWE6i7u+z
 m3mvtdgNuCa28jaq6MdkZ9NoRWvt8fHmbCfeCxJCmrareh871ZmhiHwL5YgWCW9olfIRtJwLKl3
 yLikSw153amjm57P/3NKPjT0n1Zh28btx7/nepuroPzseJNis6PTNFfq7PNrhDqSSoqKbFiRXWZ
 Um3KgBrOAgVG9T5ShYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX8aIOBCWusYpU
 3/GSMKdDldIljS/nSCQROsLsqRf9AwxUrFUIYOnKBwZIfI2wHmgfZ9DCyiRELiYS7YpTlonc1/B
 6AOFSDKEhI85Ssp9QgK0KeZAh+PYTlU=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c27c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dsjofxfk3bnWsHuiCQUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115453_386252_126C7F1A 
X-CRM114-Status: GOOD (  15.91  )
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

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2ca2f03de30174c9771fdc517c0e21e3b392ad76..4f9bef662c5796ce3cca64b19a595bcdbebbf336 100644
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


