Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B62C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=; b=LsKF/SGVYJrXgp5ylPQrE6Y4y6
	h5oTHOGs+FgndaoZk2dtwrDDIG6/6PGHFU4tbFZ01tb/PzXQOVAqH9nb05c3lWcUkDqk5DUvRE3wN
	AiU4cPHZZv9zyU/vMxeBXJgEjPN50DVwtkqWwOBtubxxqYxfYrqPgfWrsVBaFuXVGWhspKTLxv8LR
	SJoYPvcmUUc9Hog7qSMNm4DVD+0VY6ZgAgCTneZytxhxSbYfy2lx2XiI1uPu6CkKrWY4wc8SuiAIF
	QqNQCAnBgP5m+sbLOedt9hmhrbu19pmyPohDjxbvvJaV54sTuK+YJpxGGy3s6cKEfr6znmjZ3NP4E
	ZAbB6Lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHe-00000009MwX-2PPQ;
	Tue, 08 Sep 2026 14:58:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHB-00000009MRJ-1Qsv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ejtbk2070061
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 14:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=; b=owMTvjhep613AUYi
	4aYU2+30nMpcnpwJO5Rfep6JNhv4IcadNAWpS6ouRx4yDyrjf7QjLPv7rEyeTgqR
	pkL9wP2yLl90OATvPstL1HAn7ND2AjnYh8YVosI2nkop3fIrIcop4eT/L3x3qHsr
	QZlfcaHDLqpY9Oq5HSqTJpt56roGtDoNLtaqlZPZP/FFrSW14C4l/0XdUzpbE5LI
	fzNtGi01D9R+FypsogxfPd8wqyoiLwxOWXAyZAOqCZA8OJKo6KgtN2qs5HI68FI8
	JW3OVZyhHFM3zBBvDXvMVzSCiQg8dyEm41TgMo1wm51Z+SNp5lshyAEsq2/X0+zb
	el0aSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshr9ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 14:58:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e98448895so348069241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879500; x=1789484300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=DMsxPtuE3DarJD21ug1ReS1H/g1irKpM3hpuoBPC/gADvHQz89MqYuTC2/GuK5jCdB
         9Xlnod1dYyhUR9N/VDUP3ABBqJCMwcPCivSrW6EYTr5SyI4i3UldeaC7+1DdUZYkPWZx
         5M0uzFqT0hA7ceA6silKPr0m8YMSQ8D5IKDKim91Izzkh5WWDZV8YPfxfdsGGvdByseL
         qEBbd/satjFnZZVfNTfU5qG4xkwaaQuNz8fzpPe7llYJuIB/9gxj0GZ6rSE1kASL4ph9
         cX00afRg55AViZhbLJH4iwIbHGB7xk4FhNJxRMUiYjHrG976+ZBiFoXLDbcxV2fHPcv0
         H9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879500; x=1789484300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=W6wFGR2Z00lwz55vt3x5zn4QiuG3accJ91XH+j22AKIRFoFx8PfxpHlta98DKZIBwb
         yidAO/Bm+NgeOn89cV5hKuvMZGPYuqt1EdpMMgFmAVBKHGT0IRP3bHj5AcAgxlIBQPm9
         lcPWPq1NVqBifaFwG2ZTIt1Ne/jqXzAqqnuc1w2jaHZ+e8dsk0+tVByrV/Va87If09rL
         8zKpIdFTTtafiHCBsJyGgGqp79nX2YhmwsTYlDhe1CbOXh78kyyHD7osAzR2iUrdOUGE
         Xuhhx5ngdo67yDhh8PwmCefhiFSm6XInpUYA4rn0L4nxIWVoVsWEDDiRZEKJ0aeXBkYI
         LUzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcHCTqpDhmczhRBRmUzk4h3TV9j5mH0pJF7D2PBX1CKPzdpb0a7qCds8pBZ3yZFqRQp/T3nEszcZHh7loRQPYG@lists.infradead.org
X-Gm-Message-State: AFuF++ncPzo6TB3IrAvkz9W10BwDrmgpDatQIUeKgSpXVizdCo766PmM
	xFk7JG0PbLhZwCz4dSL5y3lmyT3EY5hBluuiKV58KRcRqHzDpHOcJc/99A6A7rcjR6FTDgzRbL3
	MZd3m06cwqBQRJaXbQAByhkQwvZVQop8blJLLm6JFD07DplCt2/LkMey8JZ2uUFtFrp4gal01k7
	Ofmg==
X-Gm-Gg: AYBFou3xMGLDsxY+YBhGDax6EfCA3U7H0Qs0s2o/r2V7LtK+mQx0pgGXvMhFiU0UtBE
	TyYer0CJOHmHNsrx2+1qHdgpVqMxYnOIOv+/owPaKv1QPO/lAcfDTqYR/Iub1Rp14r5Y8GHqM7P
	2IobKoQI707yYZoFdmC+QYyfTkIpP5sUm1/P8qxJlcRkxrhAk1OGw8+X+w3QH44VcWTUv1ekbGP
	1a3w640nytBl1SPvqa6R1NV/45C56CWNpXG1a3fRLLRdsQ8lw0pwwhgrRVHuRO6F6YJSUkgl4Yd
	6mtog/q3fA/GIs6hh4aml+wFCS9KgrtsqnlkcHcVVtMXUUyZke8KKn9WpCCcSuHr31B0wGowKvr
	5R8aidKmj1aD9HicnwcgPcyHJkQ1Z
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637193137.13.1788879499706;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637151137.13.1788879499260;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:26 +0200
Subject: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJtPEfTx4lMAuscmYS50twwqIkudyRPZJ+SL
 07thj6YQuGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibQAKCRAFnS7L/zaE
 w7QzD/4wAkPdm1bk0HVl/ZJF/wSwT+FFKyLR7R6zsVVdqSLVbG98nFldIWBBhPCoHhWaa/nKYQ7
 ghiB/rKnjn1NjO607l+C6hKGRIjHhhIQeFTmfH6tkPTUDMYkoj5tNCLhclHbnI47ZcdcDGwFHQH
 DstjQXudubsIwU81fFgL54Mi6jMYquXGdb233Q6PBWFa7wNd5tnmhtYDwA60Ko43AHhHUJLMA+Y
 +t8bRqMav1PwRLp9XW6yLafq5BA3uW+VwmeciVdQHu3hIjWaOKOgzjdpcqRXpwyV7ptfQ3PdXdS
 LvJcTgA9f+1yXNRI0yCdULY+M4Iseb2LqdMy0XCWpnetbRvSjzJEH2OCR3Eu0siJfUwGVZmmlMF
 HjcMDh1hJuQwJ7Ej+iVTYo3K3KfTB81LP6BtA2WdDxvGSZSDKICJuAuK4z+hdtX3Ozrbsr0vx1D
 D+sRfyd1DP/QwVh0aGfKZmcUWS/zk5Tb/ZUJFx84TvCDXGRgH0tzsyT5elumuHqG1eDYa5GNtcS
 cTAGeh/iUjkMo61N5mshpV+kqCyOpFPh9RWH342EmuMli3GbOhyBCiWA3HD6Kun0XJSxeV4KsVO
 Gz7t4kA9KKjWTOBIGV3ASkOeawOEoSYwCODprNyTMVYyHIqN4Vh9SqwGDUauxzjecZQ9rWXBLTI
 iIAtQtTgM4Fw7hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX5YMtsAJv8xkY
 uiHJlfzLyw4fpiHAc/uwYBJGFA97WMgI0F7dEmsv8YZn8WrP/CeZMnWybbBv6NEh3Hf+iykVW0L
 aw1KpPrfRPXELffVPo64/eVswh9AI7M=
X-Proofpoint-ORIG-GUID: 53l_2cFM94u4pSbLeWri19dpyTXk1Njn
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa0228c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 53l_2cFM94u4pSbLeWri19dpyTXk1Njn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXy2ECc2ru2lmO
 QSHmKyNM1GNksi8iIuYozHX+LAUtjPH6JwxXGRWHjzf8iEAcA7ZEb5GplXlACN0hwrgOtPxDfuU
 RS5Gm62mpu7f8fzp/0hCDxAyYCMq5d6npnvvr208f0GyWhX3jiayEigJUX1y0sgdPa1q08XgZdy
 3fYOJwFiwk0Bz2GoNtt5T747iqSxApsxdL4l8fZCv4NsyaoNhM1AVm1+sAXyeeRa74Gl1inxyYg
 7cEgLVeQQG7qdLM3sLGXg4Twd9LynAQ7cQ5CamgDjXk4ixN9qfwLWTgdqmksijUEY7sDc5Gb6nv
 zeIlr0qEb7GVW/YGM9E6xW9NT/rhB4ucTNkOi0hvQ5JLBBPotmw7haBn5uw1QDTI2UTqLQc+5Cf
 moqHiaDb/q7uPaYf0GSykKbOzGp2GsfOn9RY0tWjf1SonMb4kkJUWikKEMl9LM/7u8AaRlxdgeH
 BmOJhc8ZG153hf0zAqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075821_680664_B30C99A2 
X-CRM114-Status: GOOD (  16.19  )
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

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fd7414a50eb4e7d4d5adad7e93d49a55500c7f32..e067ceee016217c49d3b3d572fd9f33e562d1a75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3


