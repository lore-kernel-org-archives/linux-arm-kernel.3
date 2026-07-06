Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C45C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=cD1AVALRPp4ZJyQsc9MRdgXI7i
	yYKy15DPxj1V8qreAktmnVKkqoghGC+hX65laVG7raVWSV3T/gnF+dbtlATSJKlYld2h3IWbjN/Ak
	fK/ouAGKEYBAHFfrY8Q/vyuEMktJruOgli4108TB5CRWdU44md3JHFRLRxGTZGTcZwJBn1+ISFVhK
	lYBOtysp3FZEQ52+IdVgZWMxbfpWVpohDue0bvEsBmT6J02XwbLrBTlBrPZSRchYWDg9UZrAszWOL
	amAxzJeKnMf9R6ELpWqIpiKT4fsD/HmZsSz05j8JuiNLdIdbJ3gxCE5f2HG+mE2KjSLr0oH3rPCZr
	PIovOSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFr-0000000CYvi-0o0N;
	Mon, 06 Jul 2026 13:20:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFk-0000000CYiQ-0bgL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:20:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax669391044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 13:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=fOxq+7SIXv5TAgp+
	3LhNERn5LTVoVpsJSWbou+OhJo7ZPhM68du15CUsbeYhDP1hDtmE5fsEssdy7A4A
	LQdOp9g7rc1wqNg6bAwqx6XeV1bISNfWRVcPN+cn0G7KI4hh+iln1RcWr74AOYBX
	vpTWpBfMRXMYiG/OmstFA4Iiu5+3JA8SF32Mzad2tcatFqPmB+ySf+Lvc06tWzUh
	9Eu/+yeFDSBSpQDc/c4MyGQVcoRu+aFF9mAZiSeT4LSd8AjA9VdnJ0BR8RZQcKyp
	+a842pp2cuRnyHbSrT+RfzGrotV/cUhyXVsRgnTVIlzDHeZTUsqTi8CKa+Wh9NxP
	ZTiSrg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrwpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:20:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1054969e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344051; x=1783948851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=WG4/E7+g37PLuE5n6RAk8kI8q17GQZwPj8JuXc6tVLzTGdKNMvqVlEnRCjECftYZ5C
         zn2numVjPppPcLLOUHMX4vMJbrUj7bect1O46Qqu+97uH9XDOLWP6L2XNkoPkkGuPB8p
         xoNoG709HEZxZFUgfxq3BH3M4Ynjbtwr+V2HmuPydHKRSwyIyqg3OoCbf/N/zgIWihnh
         mwJ2CZwz05UjW9YdfIBuTquytUZSIy3f+sfzYT6PRmRL+rImkUUwPU+D9JEliGlSpAk2
         KcN61qF5mdleHS3cJ3w0efQpHuAGlzL+2C5KpIctjPBcMKSntUoi1FA+ByI+JDezxjTQ
         qc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344051; x=1783948851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=WpveV2MUnAzhp1Uts2zp7O01RCXRNPrAiBqfZxcWGFpoQJLqr2s6nNnWNEsRH6RpAe
         eVYqQ4Ul0LnIJM2YdyjVGJzQhWiThp7jIaWtSXYyYYYHnlxIDb5CKXg3q01uUyFr9rnq
         3z8ocHfkzt55jHgl2cOfFsCQCrqQiWVjb7wmuDTNvJOEiW04wL+hfrXnjK4BZevFtjvO
         LEsy6l0xqj26U7Jt/7fRTODBbwGH7FSLqCSTyMfBGq5CrLYBp42ffnpq9JymAsI3RVYU
         9ji5S++enBAb0Sm0n9Rmrbkxr1JRbLePhILTkPaVU0x6BdGNHv027jUj1B1EKW9IchsM
         zR9w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8tDkb55WXzhwhYgzPGCoEMjxXBROAW0rhYTom6xjdTAptjHz4bYLOf75JeHGw5qKhZQ3WLOCy5BjJCOFEg35P@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgn9gRiBRZ9M2Y1dwwM6mAMQgSo5QuXCPk97Uy0IvFdupc6eKV
	MEE/pR+A5oFM4Mr14Z3KH8jUXiaBlYt3fpN9UmQhuAcSyALQLCLdXcgFUXZU7bZ7pgUGrKYRr0i
	S8N412cRjn4YvXLVQF1EbH8uCizZFiEU0m41WIybnjAlvxfOVuoDD9R+YHBQBvFdQ1//2OQgKyQ
	1m7g==
X-Gm-Gg: AfdE7clIiisf7VY7822RY5VKSXpAol6qzGzj45djO1WYaCHseNSqO+mYfXbHzyARKqS
	DdefytLzUkV7vrIKmgbuRLzTdh5F9mXPCViZB2uHc3fvmwdX4t2kqvwrbMj5YktR56UiZ1T+ajx
	lgG3+vrBEV/sDmikxvbrcdUn6scoar1gQOvfobzUsv1sstze8Or0lvYV0bTBJDMucdQfZgDgsie
	UVvpgz7aq5j7rlVtJTVzF0iyebOUPaKrTVlwiBWb2kNb+5IWOAGYUtzQfsy2M7XzttIPsJ43MQR
	k7jxSazgIZYFg3g4lBC5twfZxZTwVjyCelakQvJybZ6LszeiLAhNFWnzQPoKUUmMfgHZsLI0pXA
	9EqfbZChIBRyaZ1ncOCroy23xA+qs52H7wAuIEm+O
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257995e0c.8.1783344050544;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257980e0c.8.1783344050114;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:19 +0200
Subject: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uetN8tQ35/MLf6WrNwnnyMDIulOdtwR7ChU
 fVGHHk3r0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurngAKCRAFnS7L/zaE
 w8OHEACRZI6ADieQbUC6leO3XRgj+gxRGg9lhMPexr8/DmUnblo/bE9rhFIw9azo7F31pSedXgU
 S2ZoMQph7d2IdVgsEFK68vmpeM7kbfHOmOspoTr9OTFAFVAYFLbvrdnvg31npbXMuipX44t9wMC
 z0+KpQSH7EuJRWn/0SdKx0hpl2F0NLAZBBYm/mOkxDC6oQ98L9KSVeAiZMTA2QN2e7RN3b8i5Y8
 +Tb/X2ZVbZ8KzjhAlymhR0hTk9QVAqHuFn+v0A4lMylebluozCzeMmS0lnaJoUAtkKBVoSGEZWp
 f7eVuChzu8R/i7CFuQ1d1uEjd4nCrXvk9N59kEJBCfVqIMUpcEzqt5Ud3i+1EvxEdD/9I6kTWIP
 Y1lgCr4T+O1AWH+b73x4EX8ls/BOq9lu0fO7MKzfbtfBIooYGgt9QUdToMMAQo4UTIIi/ceTYVu
 v72RM+zndt/2RWOsztsZXIsL3al5/9bCuw6E5b/HCWspMa0wbY00BI4wjanae9j4xJOKn5rLcx6
 kIEAGq+V0wVSxA//bEl3l+PDVS4jmieG559Qag5yL91dx6yD2+rHPj2gZCqzne+G1SYGWadfHDF
 676mCUJMBbrWaoAvNa6yFRi/PFlYGtxv+3Y/FSRc92uis4NqvNkI1J7u6XwuXAnF0UEbshJlPNV
 Cr51n3bq9Qj1y7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: HgG3bf3JToxafOuUnqZAZgdPLpkl3_en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXzqfb04brgVG5
 qrn+eZtz8r4hntnGOzaWhk3sm5/ISQsf8qYItNwMbSCZAn2IBrnqOa/SFi70nfguWnxhrzV5vEN
 2rs0JUlsdzzbbjWAJmAWkHP5T1lERQEdUTqJEe9XJWSgLrWTvpWT6UM6UHVUcHc075oLlNsF0Mk
 r+jJz5/kwCaZSs8nXiDlP+Z5BGvaYAnf79cp3RCX0Q42dmKdZzpgV2zcWcW67C+0tMWXWWWe8NF
 atk2fyoSyx11GGYbuWMKPJSJypFTH9y0Z4asma5ajn779u3DW4FNVPNQegh/pewFREv0ail2wBc
 YTU5JWQaw7tokNL0zI4AEBeBgpxU7mDdmmK/Zai0irg2jxs5NrBpsrSlq3Vn3zQ46QmY3+WBvDt
 L5xyqxp7ZucWEEWrf1ZP3PFXMeb3K5Q5v/XrlamcnmNg3hc30Jzqib9pd6O6j0WRZn0ZHH5HVfa
 saaXZyxtaF5x6/caqGQ==
X-Proofpoint-ORIG-GUID: HgG3bf3JToxafOuUnqZAZgdPLpkl3_en
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1fCNjitA1BgM
 je8N8tDhTafvZofVzKcy0vsBwRas1i3IfysJ9feAl5x1FY2dv74L8RGF56tfQASkRBmyk2ZbFb5
 ronTwGudDQejkMJctdQKgjjOlIg6fRw=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4babb3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062053_558084_BC565581 
X-CRM114-Status: GOOD (  17.23  )
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


