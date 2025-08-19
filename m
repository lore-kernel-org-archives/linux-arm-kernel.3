Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20561CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=; b=Xx4mgF+xfCMZ6P1NpfzLR3EcHj
	DJwvC4qNkWHqHHuGmMVAsHD5LVPvylQtNSLxfRKAl1Ecioimym5yr2n6N9W0/VEMnDjLm/smY9Uxf
	lPNuc2E7JVObJu/p1pHZNK1YO2AgdKpJTWonEzfmKZQZ36VkJz5jK0bQoA4/Ysmz16Ot0QqYfdFzV
	OerTGPcfhk61nTSxfdet9wYWHQga6A582guhoWE//jYpt+ya/SXQ0hnwYNJjLDTlRhG7sDbSVVZEc
	VJMU2BTk/iQfi2p5ZOGvYVA7Gv6FXFXB2Wkjn5/8U6T5T1jqWtLYN4l1riilIRKuG1YAv0/ZNQTjK
	Wyu5jaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoG8G-00000009ZuL-1BtI;
	Tue, 19 Aug 2025 06:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFxh-00000009YJM-0bX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:36:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILffRI025291
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=; b=SxriH++/O4uXEARY
	InmyMzGsG3soLrLTTxi5nUolDv1QgOL05Falu8ascfpYMwGcrIXNhIN09FazkZW+
	RAZeUFb4rW/0Dvd/u1OWZMjT6a27OcdqsSye2NS3ZKNbxyfRWV3lj7nJBM5U+v5k
	GoZmRDOaFJgLsK5f52TBQEx5oY7gjtlJE4ytHq2kGqpWLamu9p4NMDWnRXZpyRK1
	Ds02flI5hTrxzGLBqi0z+1rhaI+9oFSOZxJ6MKj/FYJWIWidAr7Tu6CfAM/YUTEE
	ucwY0N5MAxumQ+BCjPKeZg1WvOmCGu+u60PSXSdVqXO10KaRF+M891uqucQEqIAQ
	q9Ys4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5h59g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458264c5aso51890585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585408; x=1756190208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=;
        b=dBK9JhAD2hZUgjG2ucCbleLgt6+qRtQgjkMSQ7WKvG6Yr9Z0oHWlX62nYOZsaHhRiW
         e9BcucTdZyqnc0rwKv+NvP1nwRXLQtZN1+44sdngJQ0J8eDPSMR5B3aEAEzT6cObXYh1
         5xu/8t1bbb8LU/oWWORnBriLa4O06ZJca2kgJzClupIvLx26974bNYHkwsSpnBiEaBp5
         MZx1bkcU5lj26qLkcWJvdoAGGIKTet12iIgrm+TephxIXPTGWKq+vydWSx1dKIW4WSu2
         dlRkTLHZX5MLPR0fVoKIBEBK63srGzcwJiH4xZr+Gg+1b09kS4oMv/h5ImXFZHnbUcLJ
         xiWA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4wnZ7L4dGxq3JuRfdYl0imMLDFLwxp8IleGpQKDi6lLn0afPA5R1pVVGSOfu65l3pmFubz0NRDmO8/m8uGwy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm0TfSLvdeVqI88caoGnKrLSrCKm/6KantGb1mK+jaqre2kG/R
	763MooYF/wgttqJfmCjElV68IWL06kh+iKZjODp9oe6tFFATm3rOgti6GayiEqgCQQXvjkGNstt
	A5aICTTLTsN6vQ4loqbxf1eJd+EEwnhWS5UCHENxzwTd7p8tgKKiAj5FGDYX7uC++3WzBa2eIEq
	tcaA==
X-Gm-Gg: ASbGncvDO28Yc7pJqmKTx0gvZF2NEkjZlzFCp35fjCY17jBORf7UQqxBnOqOlHWwquq
	MJCn7s4D43Lo9wKofNkPY73+V9Xigi5x2mQMwgus56r7tsty85tkV8an2bNg6QX7QowF5cA2txC
	2HAHTMSS4d6/BJxwmLlEsnfEskSaSJCmS411Hv9VH9mct/FNZMfH9CeiuVFP1HQi6p737Smdoa8
	mmkxJ52UJHqo4QqUOwsyj0AyVG01w7JQlThaNgTr7QN73quzPvqpr5LREFFqYjbFamgvhT34PeV
	Wn6Mm5bJM3RujGo6p1xMLtvCXahmh4VusgDsl4K19hm0WvN0Y5HlXuw/67fJaLgTH+TD/+kMZvh
	CzjEX/Tqb2kqMj+mK+6YfmWWFEDeX+RaIQg==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-245e04eadeamr18308585ad.54.1755585407766;
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjWML1uqzguCXznXnAu0JqJOKHjx8VTTczeOLxTEHogZ2jjjwiB/QPUxpZhx7gk6jZa+sNw==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-245e04eadeamr18308195ad.54.1755585407263;
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:57 +0800
Subject: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2354;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ag43pockrDVtSatmI1WnRHpBp2uI2rmdqCD6gVEQcbQ=;
 b=Fcu73+RjcncqZavOSj+QtxfGgYLFkY5TAdyWRJtMz8D97y7ERiL7+MMw4ItBYEW6ZfIbO3jIv
 G65ah+bKButDKbO2XcT87cRZ+H7HKxJ/fAzmR9/uMZr0AG4GRu1e3tC
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a41b80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-JoBx-Ykr0mbciFiY24A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zfWCJMOyeb1b4dfHjx-VYy49Hygf_KT5
X-Proofpoint-GUID: zfWCJMOyeb1b4dfHjx-VYy49Hygf_KT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX5FzoyhxbvDeP
 N0p81wbm+CSajYSaJALjP+1Xfp/VWNv3qP+yhjwAW1xIhLCljZ5bacSGWhyV7q3IBxHzjKOTFzs
 D68rBAJenpWiH5hGHVqkWFwPmwPB3kiEoWw7r5vGp9KE84Cxy14mhNHLW01RmzdOn/ZNq/v/MBf
 i3ljBnhVCnF5e79YeP/XmGs3ULut3NGGWFlKTPmFkSsWGh3EV0foeFSfwtYIN7e6tOGNENQElYd
 JZTMoF/c9P8oCBwCX5miVgcvSSsbnjSiTdcbIdQoS9BpLp4iseo2ehUY7RzsOWGUIH1WrFu/H2u
 X1Gt/N3aN00OhE5V3lfYWZz0Bkgx14BkztY5dJAtQpaUaEuKAf16RvJJvD+qVfLERWJDYneTq/i
 nuSC0rk+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233649_211771_F1BB11C9 
X-CRM114-Status: GOOD (  22.88  )
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

In the initial device tree submission, the definitions of rgmii and
rgmii-id in the phy-mode property were inverted compared to the
conventions used by the upstream Linux kernel community.

Only QCS-EVB-400 and SA8155-ADP platforms are affected due to the
incorrect PHY mode configuration: 'rgmii' was used instead of the
correct 'rgmii-id'. This change results in an ABI compatibility break,
but it is acceptable as these platforms are not actively used by any
customers, based on current observations.

Qualcomm expects the MAC, not the PHY, to introduce the timing delay,
and the driver is designed accordingly. This is due to specific SoC
hardware that handles delay and sampling internally.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a4ea72f86ca8..a3e595e3b1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -390,14 +390,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int phase_shift;
+	int phase_shift = 0;
 	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
-		phase_shift = 0;
-	else
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
 
 	/* Disable loopback mode */
@@ -803,7 +800,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (!ethqos)
 		return -ENOMEM;
 
+	/* Qualcomm configures the MAC to introduce delay; instruct the
+	 * PHY not to add additional delay.
+	 */
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RGMII_ID)
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:

-- 
2.34.1


